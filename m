Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id E99E46F6F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 14:27:09 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id y10so1939118wgg.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Apr 2014 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4/03bYdfRkiVvUObCyYQjIeO+QskE9K5yJIqbgtTJ5c=;
	b=pbQBNXgMScrLF8lYiH76bn4/bOXuK+hsJh8EGWZ9sIx4GQuhA5Sj20ncU5oTF7dL8d
	kicfL6eyer9uoX/QmrSieeCyxMs1xfsac5qW6/GVAyuVMuhnPepJ10OGs2c97ub/U7sP
	M3rqMHlGn3usOhZlYbAloszkTKsCmCzDCO8o/8UaJkUrfeZKrlvJn5clc6i+i1y+Qkhd
	LhGe3/A5N10ZpVpV5mUusWXdHTNvtWfXzC+gO7Zaqb5W7/ysqY45cswA74FG5hLos2sC
	HO6SfDAxmeQxFFZpHj1u8cPXOVBL98tAEiP4arR1sD/9BTSRgOSCOmgEtvAWzflls2RH
	TD3g==
X-Received: by 10.180.11.36 with SMTP id n4mr11827177wib.4.1396535229985;
	Thu, 03 Apr 2014 07:27:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z48sm12384893eel.27.2014.04.03.07.27.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Apr 2014 07:27:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Apr 2014 16:26:58 +0200
Message-Id: <1396535218-7186-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] RFC, DO-NOT-MERGE gcc-cross: don't create symlinks for tools which don't exist
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
X-List-Received-Date: Thu, 03 Apr 2014 14:27:10 -0000

* RFC only, because it maybe doesn't fix any real issue (I've noticed
  only because I was comparing 2 sysroots debuging some other issues and
  was wondering why we have so many dangling symlinks).

* first symlink is bypassing sstate (created in
  ${STAGING_DIR_NATIVE} instead of ${D}${STAGING_DIR_NATIVE}) this is
  maybe worth fixing

* was g++ omitted intentionally from symlinks?

* should binutils provided tools be created by binutils recipes? Or was
  it simplified like this, so that binutils don't need to know gcc's BINV?

* the same does apply to gcc-cross-initial and gcc-cross-canadian, so if
  we decide to implement this or something similar it should cover all 3

* g77 and gfortran aren't created by default, so it was creating dangling
  symlinks, which probably doesn't hurt

* I've tested that resulting image/ looks the same before and after this
  patch with exception of g++ link (and possibly gfortran one when
  enabled).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 777c970..c99923f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -148,14 +148,22 @@ do_install () {
     
 	# Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
 	# gfortran is fully backwards compatible. This is a safe and practical solution. 
-	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}g77 || true
-
+	if [ -f ${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/${MULTIMACH_TARGET_SYS}/${TARGET_PREFIX}gfortran ] ; then
+		ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran ${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}g77 || true
+	fi
 	
 	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
 	# found. These need to be relative paths so they work in different locations.
 	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
 	install -d $dest
-	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
+	for t in g77 gcc g++ cpp gfortran; do
+		if [ -f ${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/${MULTIMACH_TARGET_SYS}/${TARGET_PREFIX}$t ] ; then
+			ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
+			ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
+		fi
+	done
+	# these aren't provided by gcc, so add them without existence check
+	for t in ar as ld nm objcopy objdump ranlib strip; do
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
 	done
-- 
1.9.1


