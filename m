Return-Path: <marc.ferland@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1E37371A6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 19:02:46 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id w130so7304052iow.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 12:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qjsOaTzbQ76luqdYu9K+Bhil3AT4LlaS0Dcl7+TEoFg=;
	b=DIwUkIF2GNm3PM1kCVaCQ3jpnLf6JVUaFjQHl1SQitRgeqbCci4zxKB2ccUpyPk+wX
	slL1b+dpd5nbfQ5ogjOhw7v2jj3jnO3vFnslCCME+3tqXbqR3MMfTD694a/3ZN5pE39E
	xByk4kC/wC381T3RUr3amKcahwJ86ouuJtVDJS5a1EDCL5sAO7ah8sRm7pRnsaQXdJmX
	6Q6m6LD8znOgW3w7acAwunFhvPK9zBkhAUZNHTfLpJCRU7iXqoZ+Cy7Z2wY8FzA2AqjD
	KqpS7OHtb03m8i+OH/8HW1nz43qaUVKRIilsoPtSxcGfRRymjM9tp5vzA+QhmVEChJ1V
	Nqfw==
X-Gm-Message-State: AN3rC/7n1JLu2VKh38QXzyOYxhEyBvGT72Rm0YGmnZQrJCAZ0i7OkCOs
	A7nR12IaZ8Y2yQ==
X-Received: by 10.36.86.2 with SMTP id o2mr13602662itb.10.1491850967191;
	Mon, 10 Apr 2017 12:02:47 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	e191sm3938556ita.9.2017.04.10.12.02.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Apr 2017 12:02:46 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 15:02:36 -0400
Message-Id: <1491850956-12248-1-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] bluez5: Upgrade 5.43 -> 5.44
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
X-List-Received-Date: Mon, 10 Apr 2017 19:02:48 -0000

Mostly fixes to BLE.

Also in this commit:

- Experimental tools are no longer experimental and are part of the
  official tools.
- Experimental was renamed to "testing" (hence the addition of the
  "testing" pacakge config option).
- Classic command line tools like hciattach, hciconfig are now enabled
  by the "--enable-deprecated" configure option (enabled by default for
  backward compatibility).

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  9 ++++++---
 .../bluez5/{bluez5_5.43.bb => bluez5_5.44.bb}      | 23 +++++++++++++++++-----
 2 files changed, 24 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.43.bb => bluez5_5.44.bb} (64%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index ed75db2..76b87a2 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -14,8 +14,8 @@ RCONFLICTS_${PN} = "bluez4"
 
 PACKAGECONFIG ??= "obex-profiles readline"
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
-PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
+PACKAGECONFIG[testing] = "--enable-testing,--disable-testing,,"
 
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
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.43.bb b/meta/recipes-connectivity/bluez5/bluez5_5.44.bb
similarity index 64%
rename from meta/recipes-connectivity/bluez5/bluez5_5.43.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.44.bb
index e10b82d..1095f88 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.43.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.44.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "698def88df96840dfbb0858bb6d73350"
-SRC_URI[sha256sum] = "16c9c05d2a1da644ce3570d975ada3643d2e60c007a955bac09c0a0efeb58d15"
+SRC_URI[md5sum] = "94273617129ced06612fcb9f5273d14c"
+SRC_URI[sha256sum] = "0c321e291f8b45e6a78e379dfe80592b65955a0f0ab191f1cca0edd8ec356c85"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
@@ -16,12 +16,13 @@ NOINST_TOOLS_READLINE ?= " \
     tools/btmgmt \
 "
 
-# noinst programs in Makefile.tools that are conditional on EXPERIMENTAL
+# noinst programs in Makefile.tools that are conditional on TESTING
 # support
-NOINST_TOOLS_EXPERIMENTAL ?= " \
+NOINST_TOOLS_TESTING ?= " \
     emulator/btvirt \
     emulator/b1ee \
     emulator/hfp \
+    peripheral/btsensor \
     tools/3dsp \
     tools/mgmt-tester \
     tools/gap-tester \
@@ -30,6 +31,13 @@ NOINST_TOOLS_EXPERIMENTAL ?= " \
     tools/smp-tester \
     tools/hci-tester \
     tools/rfcomm-tester \
+    tools/bnep-tester \
+    tools/userchan-tester \
+"
+
+# noinst programs in Makefile.tools that are conditional on TOOLS
+# support
+NOINST_TOOLS_BT ?= " \
     tools/bdaddr \
     tools/avinfo \
     tools/avtest \
@@ -39,17 +47,22 @@ NOINST_TOOLS_EXPERIMENTAL ?= " \
     tools/hcieventmask \
     tools/hcisecfilter \
     tools/btinfo \
-    tools/btattach \
     tools/btsnoop \
     tools/btproxy \
     tools/btiotest \
+    tools/bneptest \
     tools/mcaptest \
     tools/cltest \
     tools/oobtest \
     tools/seq2bseq \
+    tools/nokfw \
+    tools/create-image \
+    tools/eddystone \
     tools/ibeacon \
     tools/btgatt-client \
     tools/btgatt-server \
+    tools/test-runner \
+    tools/check-selftest \
     tools/gatt-service \
     profiles/iap/iapd \
 "
-- 
2.7.4


