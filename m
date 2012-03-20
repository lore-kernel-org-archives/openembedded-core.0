Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9zPn-0007y4-HY
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 14:47:55 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so37851wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 06:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=lVQ1ELGX8O4HwRLvk78QhAhbFoM4Lrd9GXK1Weg0G5A=;
	b=NEdDnLTLonJxw08em3uV9EToDSnSYoJbl9/KDgOICYOZ3YyfN/laej120mj5XQRgdv
	Y5LlVpa5wiBE8TIzdNs7aKh51+23pf9Tm8mvwSXGpNWrmvCbjmIh46g4FpvbeK50imgO
	agx9YDXaVTxL55x8WJfBZDWeHGbub53azhnsJGpYRfHRI4WWA48FVsJw27MjVjJq3eL2
	RrZKP2yot5LnLzgBqeZ5ekDU6sds4Gi6O1vQHAKGTKAEnqIWbj9jXxHdAJInzAioS5DG
	s7WAkIK0Lc2HWjx8YQh7+FZ21y271h+jtpci6J0mbTWnHjD6h6ItL3QkNqEOYRfJfdNJ
	CqrA==
Received: by 10.180.98.8 with SMTP id ee8mr29230192wib.14.1332250745277;
	Tue, 20 Mar 2012 06:39:05 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm6802130wib.0.2012.03.20.06.39.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 06:39:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 14:38:54 +0100
Message-Id: <1332250734-14660-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1332250734-14660-1-git-send-email-koen@dominion.thruhere.net>
References: <1332250734-14660-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmme/XEz/+OXwWu2fN0p41xwyCeAz/xiqMFtwOR2mStjwN9DU9hqMKYqOAxsk3SBoNLEXp+
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC v2][PATCH 3/3] buildhistory: remove duplicate entries from dot graph
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
X-List-Received-Date: Tue, 20 Mar 2012 13:47:55 -0000

There are various conditions that lead to duplicate entries in the dot graph which need to get fixed, but this patch is a catchall. A previous attempt to address this only works on rpm which gives a \n seperated output, opkg doesn't.

Another benefit is that the sort order is now know, leading to less spurious diffs in buildhistory commits.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Changes since v1: remove sort | uniq in the for loop, that only works with RPM

 meta/classes/buildhistory.bbclass |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3aec325..49d1982 100644
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



