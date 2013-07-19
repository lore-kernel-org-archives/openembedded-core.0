Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5D06B317
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 09:39:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6J9dFxX022483
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 02:39:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 19 Jul 2013 02:39:14 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2013 17:39:25 +0800
Message-ID: <9d5689b2a901728c1695d0889e27d2507c5c61a4.1374226651.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374226651.git.Qi.Chen@windriver.com>
References: <cover.1374226651.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/3] rpm: remove the obsolete rpm-postinsts.bb
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
X-List-Received-Date: Fri, 19 Jul 2013 09:39:14 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Now that the postinsts of rpm, deb and ipk are all handled in the one
central place, run-postinsts.bb, the rpm-postinsts.bb recipe is actually
obsolete now. Remove this recipe to avoid confusion.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm-postinsts.bb |   54 ----------------------------
 1 file changed, 54 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpm-postinsts.bb

diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb b/meta/recipes-devtools/rpm/rpm-postinsts.bb
deleted file mode 100644
index ba58cd4..0000000
--- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-DESCRIPTION = "RPM postinstall script"
-SECTION = "core"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
-
-inherit allarch
-#
-# Allow distributions to alter when [postponed] package install scripts are run
-#
-POSTINSTALL_INITPOSITION ?= "98"
-
-do_fetch() {
-	:
-}
-
-do_configure() {
-	:
-}
-
-do_compile() {
-	:
-}
-
-do_install() {
-	:
-}
-
-pkg_postinst_${PN} () {
-if [ "x$D" != "x" ] && [ -f $D/var/lib/rpm/Packages ]; then
-	install -d $D/${sysconfdir}/rcS.d
-	cat > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << "EOF"
-#!/bin/sh
-[ -e ${sysconfdir}/default/postinst ] && . ${sysconfdir}/default/postinst
-[ -d ${sysconfdir}/rpm-postinsts ] && for i in `ls ${sysconfdir}/rpm-postinsts/`; do
-	i=${sysconfdir}/rpm-postinsts/$i
-	echo "Running postinst $i..."
-	if [ -x $i ]; then
-		if [ "$POSTINST_LOGGING" = "1" ]; then
-			$i >>$LOGFILE 2>&1
-		else
-			$i
-		fi
-		rm $i
-	else
-		echo "ERROR: postinst $i failed."
-	fi
-done
-rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts 2>/dev/null
-EOF
-	chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
-fi
-}
-
-ALLOW_EMPTY_${PN} = "1"
-- 
1.7.9.5


