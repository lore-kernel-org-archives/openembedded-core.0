Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C8D676A43A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 04:43:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4N4hTAr028167
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 21:43:29 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 22 May 2013 21:43:28 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 May 2013 12:43:34 +0800
Message-ID: <a74829a9fa0ebd6371ba706faa3fe06899b0d193.1369284008.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369284008.git.Qi.Chen@windriver.com>
References: <cover.1369284008.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V4 2/4] dpkg: modify the run-postinst script to enable postinst logging
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
X-List-Received-Date: Thu, 23 May 2013 04:43:28 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Enable postinst logging by checking the configuration in ${sysconfdir}
/default/postinst.

In this way, the postinst logging is enabled if 'debug-tweaks' is
in IMAGE_FEATURES, and at the same time, we avoid unnecessary rebuilt
if IMAGE_FEATURES is changed.

[YOCTO #4262]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index d773fbd..6197777 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -35,10 +35,6 @@ do_configure () {
     autotools_do_configure
 }
 
-POSTLOG ?= "/var/log/postinstall.log"
-REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>${POSTLOG} 2>&1', '', d)}"
-REDIRECT_CMD[vardepsexclude] += "IMAGE_FEATURES POSTLOG"
-
 DPKG_INIT_POSITION ?= "98"
 
 do_install_append () {
@@ -67,7 +63,12 @@ if [ "x$D" != "x" ] && [ -f $D/var/lib/dpkg/status ]; then
 
 	# this happens at S98 where our good 'ole packages script used to run
 	echo "#!/bin/sh
-dpkg --configure -a ${REDIRECT_CMD}
+[ -e ${sysconfdir}/default/postinst ] && . ${sysconfdir}/default/postinst
+if [ \"\$POSTINST_LOGGING\" = \"1\" ]; then
+    dpkg --configure -a >\$LOGFILE 2>&1
+else
+    dpkg --configure -a
+fi
 rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
 " > $D${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
 	chmod 0755 $D${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
-- 
1.7.9.5


