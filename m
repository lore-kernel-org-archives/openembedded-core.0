Return-Path: <marc.ferland@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id B863772F9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 14:48:55 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id y33so25338518qta.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 07:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8EjVLQZ4gsLQXb33fp94gRAIUCao9s4WpNmL1lQj9is=;
	b=DL18BsBoOfiPJv/2Wy1Z9HKq4hNpoZcDe5oNSG8TxDQqCFBaCdlSa7hwwgkTdgcvjb
	BRNKc1XjR1uKcUxkz8FxAXzOTCRQmXzWCAAXFESOO6RJUH7yCRqx3n/AbrF6e7VqwyrF
	mwmUxfZtn83oXvZIOtRjb+wcGQzj1Igt9tKxzHSXcm6lR9mkdKqrGeQh54nOZuRdDSON
	tNLaccLC4NpPgB//rPxJLwWVFkdoY4/o5TnnD34RWofaL/2aaSdxmrN5LA72oJNg7ZjR
	lWCYY38s6b6uhMqP4dGZLwbfeH80NE8WvJIC80hue0rYtgCCD0Vk1swGMIhwMrI8qvuD
	JnTA==
X-Gm-Message-State: AN3rC/6BHI1wXEaluEfaQTITMbEhaiZjCNkIWyk7KRu8z4fkmy/ytVIH
	D31wUQYxrldMqA==
X-Received: by 10.200.54.218 with SMTP id b26mr34450010qtc.8.1493131736605;
	Tue, 25 Apr 2017 07:48:56 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	s10sm15188330qke.53.2017.04.25.07.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Apr 2017 07:48:56 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 10:48:34 -0400
Message-Id: <1493131720-19456-2-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
References: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv4 1/7] bluez5: Upgrade 5.43 -> 5.44
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
X-List-Received-Date: Tue, 25 Apr 2017 14:48:55 -0000

New feautures/fixes in this version:

* fixes to BLE
* a new midi plugin
* support for single-mode controllers w/o public address
* most of the experimental tools have been promoted and are now part of
  the official tools
* 'experimental' has been renamed to 'testing' (hence the addition of
  the 'testing' package config option)
* classic command line tools like hciattach and hciconfig are now enabled
  by the "--enable-deprecated" configure option (enabled by default for
  backward compatibility).

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc     |  9 ++--
 meta/recipes-connectivity/bluez5/bluez5_5.43.bb | 55 --------------------
 meta/recipes-connectivity/bluez5/bluez5_5.44.bb | 68 +++++++++++++++++++++++++
 3 files changed, 74 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.43.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.44.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index ed75db2..11cf8fb 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -14,8 +14,8 @@ RCONFLICTS_${PN} = "bluez4"
 
 PACKAGECONFIG ??= "obex-profiles readline"
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
-PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
+PACKAGECONFIG[testing] = "--enable-testing,--disable-testing"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
@@ -31,6 +31,7 @@ inherit autotools pkgconfig systemd update-rc.d distro_features_check ptest
 
 EXTRA_OECONF = "\
   --enable-tools \
+  --enable-deprecated \
   --disable-cups \
   --enable-test \
   --enable-datafiles \
@@ -41,10 +42,12 @@ EXTRA_OECONF = "\
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.
 NOINST_TOOLS_READLINE ??= ""
-NOINST_TOOLS_EXPERIMENTAL ??= ""
+NOINST_TOOLS_TESTING ??= ""
+NOINST_TOOLS_BT ??= ""
 NOINST_TOOLS = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'readline', '${NOINST_TOOLS_READLINE}', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'experimental', '${NOINST_TOOLS_EXPERIMENTAL}', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'testing', '${NOINST_TOOLS_TESTING}', '', d)} \
+    ${NOINST_TOOLS_BT} \
 "
 
 do_install_append() {
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.43.bb b/meta/recipes-connectivity/bluez5/bluez5_5.43.bb
deleted file mode 100644
index e10b82d..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.43.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-require bluez5.inc
-
-REQUIRED_DISTRO_FEATURES = "bluez5"
-
-SRC_URI[md5sum] = "698def88df96840dfbb0858bb6d73350"
-SRC_URI[sha256sum] = "16c9c05d2a1da644ce3570d975ada3643d2e60c007a955bac09c0a0efeb58d15"
-
-# noinst programs in Makefile.tools that are conditional on READLINE
-# support
-NOINST_TOOLS_READLINE ?= " \
-    attrib/gatttool \
-    tools/obex-client-tool \
-    tools/obex-server-tool \
-    tools/bluetooth-player \
-    tools/obexctl \
-    tools/btmgmt \
-"
-
-# noinst programs in Makefile.tools that are conditional on EXPERIMENTAL
-# support
-NOINST_TOOLS_EXPERIMENTAL ?= " \
-    emulator/btvirt \
-    emulator/b1ee \
-    emulator/hfp \
-    tools/3dsp \
-    tools/mgmt-tester \
-    tools/gap-tester \
-    tools/l2cap-tester \
-    tools/sco-tester \
-    tools/smp-tester \
-    tools/hci-tester \
-    tools/rfcomm-tester \
-    tools/bdaddr \
-    tools/avinfo \
-    tools/avtest \
-    tools/scotest \
-    tools/amptest \
-    tools/hwdb \
-    tools/hcieventmask \
-    tools/hcisecfilter \
-    tools/btinfo \
-    tools/btattach \
-    tools/btsnoop \
-    tools/btproxy \
-    tools/btiotest \
-    tools/mcaptest \
-    tools/cltest \
-    tools/oobtest \
-    tools/seq2bseq \
-    tools/ibeacon \
-    tools/btgatt-client \
-    tools/btgatt-server \
-    tools/gatt-service \
-    profiles/iap/iapd \
-"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.44.bb b/meta/recipes-connectivity/bluez5/bluez5_5.44.bb
new file mode 100644
index 0000000..1095f88
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.44.bb
@@ -0,0 +1,68 @@
+require bluez5.inc
+
+REQUIRED_DISTRO_FEATURES = "bluez5"
+
+SRC_URI[md5sum] = "94273617129ced06612fcb9f5273d14c"
+SRC_URI[sha256sum] = "0c321e291f8b45e6a78e379dfe80592b65955a0f0ab191f1cca0edd8ec356c85"
+
+# noinst programs in Makefile.tools that are conditional on READLINE
+# support
+NOINST_TOOLS_READLINE ?= " \
+    attrib/gatttool \
+    tools/obex-client-tool \
+    tools/obex-server-tool \
+    tools/bluetooth-player \
+    tools/obexctl \
+    tools/btmgmt \
+"
+
+# noinst programs in Makefile.tools that are conditional on TESTING
+# support
+NOINST_TOOLS_TESTING ?= " \
+    emulator/btvirt \
+    emulator/b1ee \
+    emulator/hfp \
+    peripheral/btsensor \
+    tools/3dsp \
+    tools/mgmt-tester \
+    tools/gap-tester \
+    tools/l2cap-tester \
+    tools/sco-tester \
+    tools/smp-tester \
+    tools/hci-tester \
+    tools/rfcomm-tester \
+    tools/bnep-tester \
+    tools/userchan-tester \
+"
+
+# noinst programs in Makefile.tools that are conditional on TOOLS
+# support
+NOINST_TOOLS_BT ?= " \
+    tools/bdaddr \
+    tools/avinfo \
+    tools/avtest \
+    tools/scotest \
+    tools/amptest \
+    tools/hwdb \
+    tools/hcieventmask \
+    tools/hcisecfilter \
+    tools/btinfo \
+    tools/btsnoop \
+    tools/btproxy \
+    tools/btiotest \
+    tools/bneptest \
+    tools/mcaptest \
+    tools/cltest \
+    tools/oobtest \
+    tools/seq2bseq \
+    tools/nokfw \
+    tools/create-image \
+    tools/eddystone \
+    tools/ibeacon \
+    tools/btgatt-client \
+    tools/btgatt-server \
+    tools/test-runner \
+    tools/check-selftest \
+    tools/gatt-service \
+    profiles/iap/iapd \
+"
-- 
2.7.4


