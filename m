Return-Path: <jpuhlman@gmail.com>
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
	[209.85.167.176])
	by mail.openembedded.org (Postfix) with ESMTP id 446516004D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 22:44:53 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id x5so4499232oic.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 15:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=VHIQXQkyhdmAM8X0o1A5/yjMj6QD0T475CfNdaeuHNY=;
	b=jDH2PT6U39aN/V1vYOGx1Ih76+xyVTDAzQ0VWdkxlm6s0QhuQukG75U0wovy+Y/geq
	z/AILHdf34ByfcD7cPVXx8S0yGr/Wnh1YcOxVbZ4aU1D7sGFo1dwxSJez6VSeuTGHJcJ
	YEICo2dsuV8prJZF++vVN/yKd17vm8RpWSOnksnpM8Zvfxzps2eQnCgf6xGGKR//uSm4
	swLKe70KCskMjNP4T18A50IdKyBwl4TPwSPff40IToGjAoMJaQ7iITziBoLCdGUZwOf0
	vzICnjQRMYHEQ9MpFotV2ew3OPtLTsWVfIguE37BGnKdO8LAkyEyqXj9HH73P9OXVVvv
	kkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=VHIQXQkyhdmAM8X0o1A5/yjMj6QD0T475CfNdaeuHNY=;
	b=TgL7bTudS6zP3OW9Z5R2SIRI4iaB+5xWBTvVdqakEscAP84/DmYRd8EEtigANCv9fp
	leitfd82OtF/6Hdj1y8xHVJoGyKC4JgevoCo9nz6dKpWjQVLwgdwCOQ5etR0LM0oOf79
	limr4HCAc9RidjGsKlETvPUvbXK80ZINCLgPD4BHwsFGzpDT4vEI/ztezUkEYSBrWwyA
	DZ6UdvYRFZ84AhpI+C2Yn+DSZ0YLO2lRB3qS/A4sFEPq38Fh6vFKRQdG3C1R2aU5Qcd7
	gk1WS+BxtyzQWCeQzEcBSzi2lA3h3me3IY0zdwZlseM2muA9OLM1+Dl6ZFfS1h5Y6m1B
	exLQ==
X-Gm-Message-State: ANhLgQ2SSgAjR9jwiXUXJ9xExiJbnZmiNY/B0tq4U1EuvhwfbFoO1jXF
	/wHa6pdFhYAHj5aN8eTsWmc1Y5CCOuc=
X-Google-Smtp-Source: ADFU+vveHVBC2/5FexQ6vInPC4mPr3DrzMNc5bCm1udx9kUclkNnfEu2JUNXSnzyq/ilzVA2u4C9vQ==
X-Received: by 2002:aca:cd0e:: with SMTP id d14mr3984888oig.167.1584657893614; 
	Thu, 19 Mar 2020 15:44:53 -0700 (PDT)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	z11sm1257936oto.23.2020.03.19.15.44.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Mar 2020 15:44:53 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id BD6A42A042C; Thu, 19 Mar 2020 15:44:51 -0700 (PDT)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2020 15:44:50 -0700
Message-Id: <20200319224450.4798-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] qemu-system-native: disable options not included in extended tarball
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
X-List-Received-Date: Thu, 19 Mar 2020 22:44:54 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

* Add PACKAGECONFIG option for xkbcommon
qemu-keymap.c:16:10: fatal error: xkbcommon/xkbcommon.h: No such file or directory

* Add PACKAGECONFIG option and patch for libudev
commands-posix.c:53:10: fatal error: libudev.h: No such file or directory

* Add PACKAGECONFIG option for libxml2
util/osdep.c:136: undefined reference to `fcntl64'

- Without specifying libxml2, configure searches the system and pulls in the system
  libxml2 if it is present. In the process it adds -L/usr/lib64 which causes the
  system libc to be linked instead of the one from the extended tarball.

* Specifically remove xkbcommon and libudev from qemu-system-native PACKAGECONFIG

None of the above libraries appear to be included in the depends for any of the qemu
builds, so if they are getting linked in, its probably not intentionally.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 .../qemu/qemu-system-native_4.2.0.bb               |  3 +++
 meta/recipes-devtools/qemu/qemu.inc                |  4 +++
 .../qemu/qemu/0001-Add-enable-disable-udev.patch   | 29 ++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
index d83ee59375..f3ceaa1003 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
@@ -10,6 +10,9 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native"
 EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
 
 PACKAGECONFIG ??= "fdt alsa kvm"
+# Do not exist in buildtools-extended-tarball"
+PACKAGECONFIG_remove = "xkbcommon"
+PACKAGECONFIG_remove = "libudev"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3ce14d9fa0..7cf436783d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-7039-1.patch \
            file://CVE-2020-7039-2.patch \
            file://CVE-2020-7039-3.patch \
+           file://0001-Add-enable-disable-udev.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -172,6 +173,9 @@ PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice"
 PACKAGECONFIG[usb-redir] = "--enable-usb-redir,--disable-usb-redir,usbredir"
 PACKAGECONFIG[snappy] = "--enable-snappy,--disable-snappy,snappy"
 PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs"
+PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
+PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
+#PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
 
 INSANE_SKIP_${PN} = "arch"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
new file mode 100644
index 0000000000..c2c5849d65
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
@@ -0,0 +1,29 @@
+From a471cf4e4c73350e090eb2cd87ec959d138012e5 Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Thu, 19 Mar 2020 11:54:26 -0700
+Subject: [PATCH] Add enable/disable libudev
+
+Upstream-Status: Pending
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+---
+ configure | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure b/configure
+index cac271c..bd116eb 100755
+--- a/configure
++++ b/configure
+@@ -1539,6 +1539,10 @@ for opt do
+   ;;
+   --disable-plugins) plugins="no"
+   ;;
++  --enable-libudev) libudev="yes"
++  ;;
++  --disable-libudev) libudev="no"
++  ;;
+   *)
+       echo "ERROR: unknown option $opt"
+       echo "Try '$0 --help' for more information"
+-- 
+1.8.3.1
+
-- 
2.13.3


