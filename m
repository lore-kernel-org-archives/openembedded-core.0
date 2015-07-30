Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD962761D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 03:05:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6U35o2r026309
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 20:05:50 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 29 Jul 2015 20:05:31 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 11:03:27 +0800
Message-ID: <1438225407-29136-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] alsa-utils: assume the alsa storing is success if machine has no sound card
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
X-List-Received-Date: Thu, 30 Jul 2015 03:05:52 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...oring-is-success-if-not-sound-card-device.patch | 34 ++++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-utils_1.0.29.bb  |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch b/meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch
new file mode 100644
index 0000000..f67283d
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch
@@ -0,0 +1,34 @@
+[PATCH] assume storing is success if not sound card device
+
+Upstream-Statue: Pending
+
+Systemd will report failure when run alsa-*, if the machine has not the
+sound card. To void this annoyed message, alsa-restore/alsa-state ignore
+all the exit codes by prefixing "-" in ExecStart, like:
+
+   alsa-utils-1.0.29$ grep "=-" ./ -r|grep service.in
+   ./alsactl/alsa-restore.service.in:ExecStart=-@sbindir@/alsactl restore
+   ./alsactl/alsa-state.service.in:ExecStart=-@sbindir@/alsactl -s -n 19 -c rdaemon
+   ./alsactl/alsa-state.service.in:ExecStop=-@sbindir@/alsactl -s kill save_and_quit
+   lsa-utils-1.0.29$
+
+But alsa-store.service.in is missing, and better solution is to ignore
+the exit code 19 which means not sound card device, not all exit code
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ alsactl/alsa-store.service.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/alsactl/alsa-store.service.in b/alsactl/alsa-store.service.in
+index f1a56bb..68ca529 100644
+--- a/alsactl/alsa-store.service.in
++++ b/alsactl/alsa-store.service.in
+@@ -13,3 +13,4 @@ Before=shutdown.target
+ Type=oneshot
+ ExecStart=@sbindir@/alsactl store
+ StandardOutput=syslog
++SuccessExitStatus=0 19
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.29.bb
index 65cae0b..263f38a 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.29.bb
@@ -14,6 +14,7 @@ PACKAGECONFIG[xmlto] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xm
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
            file://alsa-utils-aplay-interrupt-signal-handling.patch \
+           file://assume-storing-is-success-if-not-sound-card-device.patch \
           "
 
 SRC_URI[md5sum] = "6b289bf874c4c9a63f4b3973093dd404"
-- 
1.9.1


