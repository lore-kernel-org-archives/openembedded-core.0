Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UctKe-0001qS-Ty
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 10:14:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4G7uMnl003269
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 00:56:22 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 16 May 2013 00:56:22 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 May 2013 15:56:17 +0800
Message-ID: <f5f342b1188325a222a7e9c776286ea1cef79165.1368690819.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1368690819.git.Qi.Chen@windriver.com>
References: <cover.1368690819.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 4/4] rpm-postinsts.bb: enable postinst logging
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
X-List-Received-Date: Thu, 16 May 2013 08:15:19 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Enable postinst logging according to the existence of the file
/etc/.enable_postinst_logging.

In this way, the postinst logging is enabled if 'debug-tweaks' is
in IMAGE_FEATURES, and at the same time, we avoid unnecessary rebuild
if IMAGE_FEATURES is changed.

[YOCTO #4262]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm-postinsts.bb |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb b/meta/recipes-devtools/rpm/rpm-postinsts.bb
index 3d2d05d..ae0e37e 100644
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
@@ -40,7 +36,12 @@ if [ "x$D" != "x" ] && [ -f $D/var/lib/rpm/Packages ]; then
 [ -d /etc/rpm-postinsts ] && for i in `ls /etc/rpm-postinsts/`; do
 	i=/etc/rpm-postinsts/$i
 	echo "Running postinst $i..."
-	if [ -f $i ] && $i ${REDIRECT_CMD}; then
+	if [ -x $i ]; then
+		if [ -e /etc/.enable_postinst_logging ]; then
+			$i >/var/log/postinstall.log 2&>1
+		else
+			$i
+		fi
 		rm $i
 	else
 		echo "ERROR: postinst $i failed."
-- 
1.7.9.5



