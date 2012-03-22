Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAk2B-0003b5-Ta
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 16:34:39 +0100
Received: by wera1 with SMTP id a1so1928522wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 08:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=bf6LW3OTYgS6VLrzKen2slKjBy5CEXT+KtYDieIR6zw=;
	b=fXkI5HbeUgisJ6ooBf7Jme34RYWwpm4Nd3OXLqYoDjqkzWMkckvJ85RLyAJ9ZlwPlE
	qr5OiF2l1Zo+cGCAjjSwQLEjEII+yqEJIWDWzNfcNiAnPgJLQ8m+47JLqUc8kD4FSGn0
	Pizv9sn9rRExViCYCa3STsdJRKn90EqE7qMDhXl+bx+00Xvm7grZWcupjcPdC/oDS7SN
	1HTBlHrBOmM4CDPMGEGAsyQa4Eg6iMXu+bXQT7321qr6opXZnflKKysFUorRt7s/oVtl
	kbKse/o7+tK4+Qxo5e9vQ7ZBtPAQs/utq+n8Rc/Rd4uT1dxDuKuc3vo0kvqUYpexftlu
	QXGw==
Received: by 10.216.138.223 with SMTP id a73mr4835883wej.86.1332429945027;
	Thu, 22 Mar 2012 08:25:45 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fz9sm5984628wib.3.2012.03.22.08.25.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 08:25:44 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 16:25:39 +0100
Message-Id: <1332429941-19621-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQlnfSDPEIYbRpejtNfDnJ9BbvSZNcxzCf0D7u1rgHD6wjhXOkG/H+jdMZXRMiC5dgjNFFpW
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCHv3 1/3] buildhistory: remove duplicate entries from dot graph
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 15:34:40 -0000

There are various conditions that lead to duplicate entries in the dot graph which need to get fixed, but this patch is a catchall. A previous attempt to address this only works on rpm which gives a \n seperated output, opkg doesn't.

Another benefit is that the sort order is now know, leading to less spurious diffs in buildhistory commits.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/buildhistory.bbclass |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index f99aa7f..764e1e8 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -291,6 +291,7 @@ buildhistory_get_image_installed() {
 	# Produce installed package file and size lists and dependency graph
 	echo -n > ${BUILDHISTORY_DIR_IMAGE}/installed-packages.txt
 	echo -n > ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
+	echo -n > ${BUILDHISTORY_DIR_IMAGE}/depends.tmp	
 	echo -e "digraph depends {\n    node [shape=plaintext]" > ${BUILDHISTORY_DIR_IMAGE}/depends.dot
 	for pkg in $INSTALLED_PKGS; do
 		pkgfile=`get_package_filename $pkg`
@@ -300,16 +301,18 @@ buildhistory_get_image_installed() {
 			echo $pkgsize $pkg >> ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
 		fi
 
-		deps=`list_package_depends $pkg | sort | uniq`
+		deps=`list_package_depends $pkg`
 		for dep in $deps ; do
-			echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+			echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
 		done
 
-		recs=`list_package_recommends $pkg | sort | uniq`
+		recs=`list_package_recommends $pkg`
 		for rec in $recs ; do
-			echo "$pkg OPP $rec [style=dotted];" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+			echo "$pkg OPP $rec [style=dotted];" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
 		done
 	done
+	cat ${BUILDHISTORY_DIR_IMAGE}/depends.tmp | sort | uniq >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+	rm ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
 	echo "}" >>  ${BUILDHISTORY_DIR_IMAGE}/depends.dot
 
 	cat ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB " $2}' > ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.txt
-- 
1.7.2.5



