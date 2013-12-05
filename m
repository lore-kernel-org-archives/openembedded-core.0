Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 197B36DC00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 01:08:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB518i8i008735
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Dec 2013 17:08:44 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 4 Dec 2013 17:08:44 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 09:08:49 +0800
Message-ID: <1386205729-18878-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] buildhistory.bbclass/image.bbclass: remove obsolete codes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2013 01:08:51 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

After 1b8e4abd2d9c0 [bitbake.conf/package: Collapse PKGDATA_DIR into
a single machine specific directory], oe-pkgdata-util does not use
target_suffix parameter, so do not need to loop the vendor

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/classes/buildhistory.bbclass |   10 ++++------
 meta/classes/image.bbclass        |    4 +---
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index ec3f0b1..508d028 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -339,12 +339,10 @@ buildhistory_get_installed() {
 	printf "" > $1/installed-package-sizes.tmp
 	cat $pkgcache | while read pkg pkgfile pkgarch
 	do
-		for vendor in ${TARGET_VENDOR} ${MULTILIB_VENDORS} ; do
-			size=`oe-pkgdata-util read-value ${PKGDATA_DIR} "PKGSIZE" ${pkg}_${pkgarch}`
-			if [ "$size" != "" ] ; then
-				echo "$size $pkg" >> $1/installed-package-sizes.tmp
-			fi
-		done
+		size=`oe-pkgdata-util read-value ${PKGDATA_DIR} "PKGSIZE" ${pkg}_${pkgarch}`
+		if [ "$size" != "" ] ; then
+			echo "$size $pkg" >> $1/installed-package-sizes.tmp
+		fi
 	done
 	cat $1/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB " $2}' > $1/installed-package-sizes.txt
 	rm $1/installed-package-sizes.tmp
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index cc65e35..168f283 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -506,9 +506,7 @@ rootfs_install_complementary() {
     if [ "$GLOBS" != "" ] ; then
         # Use the magic script to do all the work for us :)
         : > ${WORKDIR}/complementary_pkgs.txt
-        for vendor in '${TARGET_VENDOR}' ${MULTILIB_VENDORS} ; do
-            oe-pkgdata-util glob ${PKGDATA_DIR} ${WORKDIR}/installed_pkgs.txt "$GLOBS" >> ${WORKDIR}/complementary_pkgs.txt
-        done
+        oe-pkgdata-util glob ${PKGDATA_DIR} ${WORKDIR}/installed_pkgs.txt "$GLOBS" >> ${WORKDIR}/complementary_pkgs.txt
 
         # Install the packages, if any
         sed -i '/^$/d' ${WORKDIR}/complementary_pkgs.txt
-- 
1.7.10.4


