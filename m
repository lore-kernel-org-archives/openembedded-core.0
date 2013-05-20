Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UeGSx-0004Tp-Av
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 05:08:54 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4K2oVpF027171
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 19:50:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 19 May 2013 19:50:30 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 May 2013 10:50:31 +0800
Message-ID: <a0237296a606069eb2987ff126be556c61f62b7b.1369018014.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369018014.git.Qi.Chen@windriver.com>
References: <cover.1369018014.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V2 4/4] rpm-postinsts.bb: enable postinst logging
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
in IMAGE_FEATURES, and at the same time, we avoid unnecessary rebuild
if IMAGE_FEATURES is changed.

[YOCTO #4262]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm-postinsts.bb |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb b/meta/recipes-devtools/rpm/rpm-postinsts.bb
index 3d2d05d..01d7450 100644
--- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
+++ b/meta/recipes-devtools/rpm/rpm-postinsts.bb
@@ -11,10 +11,6 @@ inherit allarch
 #
 POSTINSTALL_INITPOSITION ?= "98"
 
-POSTLOG ?= "/var/log/postinstall.log"
-REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>>${POSTLOG} 2>&1', '', d)}"
-REDIRECT_CMD[vardepsexclude] += "IMAGE_FEATURES POSTLOG"
-
 do_fetch() {
 	:
 }
@@ -36,11 +32,16 @@ if [ "x$D" != "x" ] && [ -f $D/var/lib/rpm/Packages ]; then
 	install -d $D/${sysconfdir}/rcS.d
 	cat > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << "EOF"
 #!/bin/sh
-
+[ -e /etc/default/postinst ] && . /etc/default/postinst
 [ -d /etc/rpm-postinsts ] && for i in `ls /etc/rpm-postinsts/`; do
 	i=/etc/rpm-postinsts/$i
 	echo "Running postinst $i..."
-	if [ -f $i ] && $i ${REDIRECT_CMD}; then
+	if [ -x $i ]; then
+		if [ "$POSTINST_LOGGING" = "ENABLED" ]; then
+			$i >/var/log/postinstall.log 2&>1
+		else
+			$i
+		fi
 		rm $i
 	else
 		echo "ERROR: postinst $i failed."
-- 
1.7.9.5



