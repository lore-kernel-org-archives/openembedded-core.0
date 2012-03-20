Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9wwu-0004vS-Rv
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 12:09:56 +0100
Received: by mail-wi0-f171.google.com with SMTP id hj13so4327110wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 04:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=gQAxVMvSd7PmruwP8uTZnNMPlX0i1It1qxPoTYXmC1c=;
	b=a2Fa5bLXpyhxMJfWD4/YpXM7F00AaZpmwcdTkTDpTaDdSNX51hCFvnuIbKkVL6H6Wv
	f8cHVy9+h4nhOmY2BygR+hYbduSj0dV+4GPC9jSagHiKRaGgiehO2djAO5YAmTQgoDk6
	0XU1at2P+ExX1FIdfUW0mg8iExU9qbeTXP8Uhone86WkBAVEclmlCh0u2iCfj9rODlHW
	7NQC1rNZrgdL5MgqSSC3wDnmBtoZyRtRLxdfrS+HvMxRoAIycJMJWP9i/exJg9VjDp8L
	pt9wsIrE/mY4Uapu4Oiyvx7Ecl06xGgVL3PQaMvSdchWgqCqmPbHB0ZBRApZOZPay/1O
	gRDA==
Received: by 10.216.135.219 with SMTP id u69mr8942419wei.89.1332241266746;
	Tue, 20 Mar 2012 04:01:06 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm5216788wib.9.2012.03.20.04.01.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 04:01:05 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 12:00:55 +0100
Message-Id: <1332241255-5083-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1332241255-5083-1-git-send-email-koen@dominion.thruhere.net>
References: <1332241255-5083-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk9VMHzCrtK8e0vcoQO5HSTEj0x4dFk5LAZhwDIeH+ZeLyRRBDqNc/kdiWqQvMNJitVnfN0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 3/3] buildhistory: remove duplicate entries from dot graph
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
X-List-Received-Date: Tue, 20 Mar 2012 11:09:57 -0000

There are various conditions that lead to duplicate entries in the dot graph which need to get fixed, but this patch is a catchall.

Another benefit is that the sort order is now know, leading to less spurious diffs in buildhistory commits.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/buildhistory.bbclass |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3aec325..6502b04 100644
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
@@ -302,14 +303,16 @@ buildhistory_get_image_installed() {
 
 		deps=`list_package_depends $pkg | sort | uniq`
 		for dep in $deps ; do
-			echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+			echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
 		done
 
 		recs=`list_package_recommends $pkg | sort | uniq`
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



