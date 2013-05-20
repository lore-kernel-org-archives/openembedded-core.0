Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UeGSv-0004Te-SK
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 05:08:54 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4K2oUdv017187
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 19:50:30 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 19 May 2013 19:50:29 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 May 2013 10:50:30 +0800
Message-ID: <d59132e001fee80c9b6cb36b57787383019bd287.1369018014.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369018014.git.Qi.Chen@windriver.com>
References: <cover.1369018014.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V2 3/4] opkg: modify the run-postinst script to enable postinst logging
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
 meta/recipes-devtools/opkg/opkg.inc |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index c34ac5b..353465b 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -57,10 +57,6 @@ do_install_append_class-native() {
 	fi
 }
 
-POSTLOG ?= "/var/log/postinstall.log"
-REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>${POSTLOG} 2>&1', '', d)}"
-REDIRECT_CMD[vardepsexclude] += "IMAGE_FEATURES POSTLOG"
-
 pkg_postinst_${PN} () {
 #!/bin/sh
 if [ "x$D" != "x" ] && [ -f $D${OPKGLIBDIR}/opkg/status ]; then
@@ -68,7 +64,12 @@ if [ "x$D" != "x" ] && [ -f $D${OPKGLIBDIR}/opkg/status ]; then
 
 	# this happens at S98 where our good 'ole packages script used to run
 	echo "#!/bin/sh
-opkg-cl configure ${REDIRECT_CMD}
+[ -e /etc/default/postinst ] && . /etc/default/postinst
+if [ \"\$POSTINST_LOGGING\" = \"ENABLED\" ]; then
+    opkg-cl configure >/var/log/postinstall.log 2>&1
+else
+    opkg-cl configure
+fi
 rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 " > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 	chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
-- 
1.7.9.5



