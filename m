Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UeGSv-0004Ta-JZ
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 05:08:54 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4K2oSPv027151
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 19:50:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 19 May 2013 19:50:28 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 May 2013 10:50:29 +0800
Message-ID: <87754446fd070cded9dee7bff2b18d0f080be934.1369018014.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369018014.git.Qi.Chen@windriver.com>
References: <cover.1369018014.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V2 2/4] dpkg: modify the run-postinst script to enable postinst logging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 May 2013 03:09:24 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Enable postinst logging by checking the configuration in /etc/
default/postinst.

In this way, the postinst logging is enabled if 'debug-tweaks' is
in IMAGE_FEATURES, and at the same time, we avoid unnecessary rebuilt
if IMAGE_FEATURES is changed.

[YOCTO #4262]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index d773fbd..c5c8aec 100644
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
+[ -e /etc/default/postinst ] && . /etc/default/postinst
+if [ \"\$POSTINST_LOGGING\" = \"ENABLED\" ]; then
+    dpkg --configure -a >/var/log/postinstall.log 2>&1
+else
+    dpkg --configure -a
+fi
 rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
 " > $D${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
 	chmod 0755 $D${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
-- 
1.7.9.5



