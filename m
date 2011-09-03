Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Qzuwf-0004Fc-11
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 20:27:57 +0200
Received: by bkbzu17 with SMTP id zu17so3341506bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Sep 2011 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=yjETHyaIXF9ZSKRs7pOt+Yb1iY5/JiWmlwWARvOOrBA=;
	b=rC6swMx+/lLZadTM5GZlSBEX1l8lzVgGTkNg+/+dMiOXyG4ppo7Ay5lZluY+R7wa3R
	6tLbAfXzVcaaOXMU3sy48JkbRZV0C3Hh2ISiSBOiGPfDJboDMHNFd0f3hJTTlzLEEQUI
	PcurkCdUD+xSZF78Wfjlt7xLPHfduxnJwU35A=
Received: by 10.204.140.204 with SMTP id j12mr1200325bku.386.1315074178928;
	Sat, 03 Sep 2011 11:22:58 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id q9sm1082438bkd.8.2011.09.03.11.22.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Sep 2011 11:22:58 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2011 22:22:45 +0400
Message-Id: <1315074165-20137-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315074165-20137-1-git-send-email-dbaryshkov@gmail.com>
References: <1315074165-20137-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 3/3] qt-demo-init: fix init script
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
X-List-Received-Date: Sat, 03 Sep 2011 18:27:57 -0000

qt-demo-init initscript lacks some quotes, which makes it bave not fulle
correct. Fix that.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init |    8 ++++----
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb      |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init b/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
index affb958..0748fcd 100644
--- a/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
+++ b/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
@@ -14,11 +14,11 @@ case "$1" in
 	if [ -f /etc/profile.d/tslib.sh ]; then
 		source /etc/profile.d/tslib.sh
 	fi
-	if [ -e $TSLIB_TSDEVICE ]; then
+	if [ -e "$TSLIB_TSDEVICE" ]; then
 		if [ ! -f /etc/pointercal ]; then
 			/usr/bin/ts_calibrate
 		fi
-		if [ $QTDEMO == qtdemo ]; then
+		if [ "$QTDEMO" == qtdemo ]; then
 			Xorg &
 			export DISPLAY=:0
 			$QTDEMO &
@@ -26,7 +26,7 @@ case "$1" in
 			QWS_MOUSE_PROTO=tslib:$TSLIB_TSDEVICE $QTDEMO &
 		fi
 	else
-		if [ $QTDEMO == qtdemo ]; then
+		if [ "$QTDEMO" == qtdemo ]; then
 			Xorg &
 			export DISPLAY=:0
 		fi
@@ -35,7 +35,7 @@ case "$1" in
 	;;
   stop)
 	echo "Stopping qtdemo"
-	if [ $QTDEMO == qtdemo ]; then
+	if [ "$QTDEMO" == qtdemo ]; then
 		killall Xorg
 		killall qtdemo
 	else
diff --git a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
index 8d0dd19..0f089ad 100644
--- a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
+++ b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Init script for qtdemo"
 LICENSE = "MIT"
 SRC_URI = "file://qtdemo-init"
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-- 
1.7.2.5



