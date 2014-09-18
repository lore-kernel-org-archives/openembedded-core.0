Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFE7713C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 09:05:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8I95oZ5008946
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 02:05:50 -0700 (PDT)
Received: from localhost (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 18 Sep 2014 02:05:49 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Sep 2014 17:05:47 +0800
Message-ID: <1411031147-11764-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.226]
Subject: [PATCH] qtdemo-init: Make qtdemo startup correctly
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
X-List-Received-Date: Thu, 18 Sep 2014 09:05:56 -0000
Content-Type: text/plain

The qtdemo can't launch via qtdemo-init initscript. Fix it.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init b/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
index 3a1f2cb..21f0273 100644
--- a/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
+++ b/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
@@ -2,8 +2,8 @@
 
 set -e
 
-if [ -f /usr/bin/qtdemo ]; then
-	QTDEMO="qtdemo > /var/log/Xsession.log 2> &1"
+if [ -x /usr/bin/qtdemo ]; then
+	QTDEMO="qtdemo"
 else
 	QTDEMO="qtdemoE -qws"
 fi
@@ -18,7 +18,7 @@ case "$1" in
 		if [ ! -f /etc/pointercal ]; then
 			/usr/bin/ts_calibrate
 		fi
-		if [ "$QTDEMO" = qtdemo ]; then
+		if [ "$QTDEMO" = "qtdemo" ]; then
 			Xorg &
 			export DISPLAY=:0
 			$QTDEMO &
@@ -26,7 +26,7 @@ case "$1" in
 			QWS_MOUSE_PROTO=tslib:$TSLIB_TSDEVICE $QTDEMO &
 		fi
 	else
-		if [ "$QTDEMO" = qtdemo ]; then
+		if [ "$QTDEMO" = "qtdemo" ]; then
 			Xorg &
 			export DISPLAY=:0
 		fi
@@ -35,7 +35,7 @@ case "$1" in
 	;;
   stop)
 	echo "Stopping qtdemo"
-	if [ "$QTDEMO" = qtdemo ]; then
+	if [ "$QTDEMO" = "qtdemo" ]; then
 		killall Xorg
 		killall qtdemo
 	else
-- 
1.7.9.5


