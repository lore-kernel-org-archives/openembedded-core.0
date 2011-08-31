Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QyZq7-0001i9-EH
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 03:43:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7V1cjtJ005403
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 18:38:45 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 30 Aug 2011 18:38:44 -0700
Message-ID: <5be44598c9af0659e4cdeb758875ee32d4f897e4.1314754472.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1314754472.git.xiaofeng.yan@windriver.com>
References: <cover.1314754472.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 31 Aug 2011 09:26:38 +0800
Date: Wed, 31 Aug 2011 09:39:58 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qt-demo-init: Fix bug 999
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
X-List-Received-Date: Wed, 31 Aug 2011 01:43:40 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #999]
qt4e-demo-image needs qt-demo-init when starting qtdemoE.
qt-demo-init was pulled from Openembeded.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init |   55 ++++++++++++++++++++++
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb      |   19 ++++++++
 2 files changed, 74 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
 create mode 100644 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb

diff --git a/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init b/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
new file mode 100644
index 0000000..affb958
--- /dev/null
+++ b/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
@@ -0,0 +1,55 @@
+#!/bin/sh
+
+set -e
+
+if [ -f /usr/bin/qtdemo ]; then
+	QTDEMO="qtdemo > /var/log/Xsession.log 2> &1"
+else
+	QTDEMO="qtdemoE -qws"
+fi
+
+case "$1" in
+  start)
+	echo "Starting qtdemo"
+	if [ -f /etc/profile.d/tslib.sh ]; then
+		source /etc/profile.d/tslib.sh
+	fi
+	if [ -e $TSLIB_TSDEVICE ]; then
+		if [ ! -f /etc/pointercal ]; then
+			/usr/bin/ts_calibrate
+		fi
+		if [ $QTDEMO == qtdemo ]; then
+			Xorg &
+			export DISPLAY=:0
+			$QTDEMO &
+		else
+			QWS_MOUSE_PROTO=tslib:$TSLIB_TSDEVICE $QTDEMO &
+		fi
+	else
+		if [ $QTDEMO == qtdemo ]; then
+			Xorg &
+			export DISPLAY=:0
+		fi
+		$QTDEMO &
+	fi
+	;;
+  stop)
+	echo "Stopping qtdemo"
+	if [ $QTDEMO == qtdemo ]; then
+		killall Xorg
+		killall qtdemo
+	else
+		killall qtdemoE
+	fi
+	;;
+  restart)
+	$0 stop
+	$0 start
+	;;
+  *)
+	echo "usage: $0 { start | stop | restart }" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
new file mode 100644
index 0000000..8d0dd19
--- /dev/null
+++ b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Init script for qtdemo"
+LICENSE = "MIT"
+SRC_URI = "file://qtdemo-init"
+PR = "r2"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PACKAGE_ARCH = "all"
+
+do_install() {
+	install -d ${D}${sysconfdir}/init.d/
+	install -m 0755 ${WORKDIR}/qtdemo-init ${D}${sysconfdir}/init.d/qtdemo
+}
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "qtdemo"
+INITSCRIPT_PARAMS = "start 99 5 2 . stop 19 0 1 6 ."
-- 
1.7.0.4



