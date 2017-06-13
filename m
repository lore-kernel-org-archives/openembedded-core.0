Return-Path: <marc.ferland@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 88266782FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 17:45:06 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id j200so9330708ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 10:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/qZLo0o0edxerI8cs1fJYFYS86RQJD/naBmwzzLrf7M=;
	b=Q8p2emV/RcaFizZHac/sXdlB0y/b8GjQ87z3LZj05nNeZJeeDlAiXUltbgPsqAJhdQ
	edRa48s533wKht1iOQNwLVrx+zEil1ewO7S/rsfFQg7FHIjqSJw+vxXNDSF0FiFb0eCg
	8Gwyw2PbcLFmLJvNXvq0to2hJMZzlW3kipUAlWvJm0E69lAjy6wQ3NCL48IsHkABCxIc
	UE/CLtLD1+cAaW5e9XO5E8xyRPLd6D8u99DNxSzP7R9Rw3pP+c/bCUHCjGtQwlXbYAgM
	VfPd8C2zcDk99QeJDda72OYvpbauiuNEiB1TjRmIdtZ2bs6T1deMz7PlOkZ4yp6Q8LNd
	4JvQ==
X-Gm-Message-State: AKS2vOzxASULpqBUmzNv3VOGZtkiGk/e6FAMLxd74Mxi6bJJutB0YrAy
	mCwtgccPYu8oytb/
X-Received: by 10.107.16.217 with SMTP id 86mr1538535ioq.134.1497375907536;
	Tue, 13 Jun 2017 10:45:07 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	b69sm2087134itb.23.2017.06.13.10.45.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Jun 2017 10:45:06 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 13:44:56 -0400
Message-Id: <1497375896-6369-2-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497375896-6369-1-git-send-email-ferlandm@amotus.ca>
References: <1497375896-6369-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCH 2/2] bluez5: add more PACKAGECONFIG options
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
X-List-Received-Date: Tue, 13 Jun 2017 17:45:06 -0000

This patch adds missing PACKAGECONFIG options and allow for a more
fine-grained build of bluez5.

I took care of providing a default configuration that matches the
previous default config.

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc     | 28 +++++++++++++++++++++----
 meta/recipes-connectivity/bluez5/bluez5_5.45.bb |  2 +-
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 5fc49f3..f267c66 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -12,13 +12,35 @@ RPROVIDES_${PN} += "bluez-hcidump"
 
 RCONFLICTS_${PN} = "bluez4"
 
-PACKAGECONFIG ??= "obex-profiles readline ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "obex-profiles \
+    readline \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+    a2dp-profiles \
+    avrcp-profiles \
+    network-profiles \
+    hid-profiles \
+    hog-profiles \
+    tools \
+    deprecated \
+"
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
 PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
 PACKAGECONFIG[testing] = "--enable-testing,--disable-testing"
 PACKAGECONFIG[midi] = "--enable-midi,--disable-midi,alsa-lib"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,,cups"
+PACKAGECONFIG[nfc] = "--enable-nfc,--disable-nfc"
+PACKAGECONFIG[sap-profiles] = "--enable-sap,--disable-sap"
+PACKAGECONFIG[a2dp-profiles] = "--enable-a2dp,--disable-a2dp"
+PACKAGECONFIG[avrcp-profiles] = "--enable-avrcp,--disable-avrcp"
+PACKAGECONFIG[network-profiles] = "--enable-network,--disable-network"
+PACKAGECONFIG[hid-profiles] = "--enable-hid,--disable-hid"
+PACKAGECONFIG[hog-profiles] = "--enable-hog,--disable-hog"
+PACKAGECONFIG[health-profiles] = "--enable-health,--disable-health"
+PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-sixaxis"
+PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
+PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
+PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
@@ -33,8 +55,6 @@ S = "${WORKDIR}/bluez-${PV}"
 inherit autotools pkgconfig systemd update-rc.d distro_features_check ptest
 
 EXTRA_OECONF = "\
-  --enable-tools \
-  --enable-deprecated \
   --enable-test \
   --enable-datafiles \
   --enable-library \
@@ -48,7 +68,7 @@ NOINST_TOOLS_BT ??= ""
 NOINST_TOOLS = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'readline', '${NOINST_TOOLS_READLINE}', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'testing', '${NOINST_TOOLS_TESTING}', '', d)} \
-    ${NOINST_TOOLS_BT} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'tools', '${NOINST_TOOLS_BT}', '', d)} \
 "
 
 do_install_append() {
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.45.bb b/meta/recipes-connectivity/bluez5/bluez5_5.45.bb
index ee5e88f..d5f516c 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.45.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.45.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "4cacb00703a6bc149cb09502257d321597d43952374a16f3558766ffa8
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
 NOINST_TOOLS_READLINE ?= " \
-    attrib/gatttool \
+    ${@bb.utils.contains('PACKAGECONFIG', 'deprecated', 'attrib/gatttool', '', d)} \
     tools/obex-client-tool \
     tools/obex-server-tool \
     tools/bluetooth-player \
-- 
2.7.4


