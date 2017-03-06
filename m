Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A9A34775B5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:26:42 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 77so7311770pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=7SPvHZDupI8riv7TRSe70KvCOp5IhNeWNCu4S4l/3Ac=;
	b=WrBhV3vr63IjYCzi2p/B4XsLsCkm60LYuTCzOzy9i8kRr3lezS10UkBiHGnIMF9VjU
	KC19+YUHCEtyQjdCZVr6SYh93XKoSq342gIH+OgUtXXD6nt+li79V1wHcDadXZ3F5xWK
	O91mz0CfiGEaqThVdWqoGIn8ekod4FskKyZYPNSQEgxL9kqjOMSHzZnAMjWVAAJOkGKx
	Dp/jsItViBH3efNffCqa5Nll4xg3xtzJRIxDqzhOCEKjY73Vcg1qbiVILG/a1qvDVOof
	OENVXkSF+IpG3c1MtAqTDEF7ohYwU82T1d5+blOaxP6lPVZJY54Grk2rFlpXQO6EHwZH
	R1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=7SPvHZDupI8riv7TRSe70KvCOp5IhNeWNCu4S4l/3Ac=;
	b=j+sYsswhqiepCHO0C2gPZctll623ZOhxnNp4gPl9ATMqSHVytWkHGqGxSI2M5WY+/+
	vP8tW9dsAebS9ggWc9LSg3RwCxgu1g5XcHVO4ho8vrxN5AdgDFb+4TRrezqFzzLOpHb3
	QDNNW1wXdhaLQa9ZnKRSmKnT/4FXHtn6OAaKXZ+ndT/ok4E5YysXR1MvU5us3gKJ7Gci
	cRaElOvAER3jEFqPniy5ZDL3gS6VuZn+7j03jonSVTfjrsirinFQ33lCCIVvqCXKqFxL
	3q23CPE/ZOLOrjXnTND6f4aNQl/s08foIyhl7RTCgQ9wu4/KCwH2j2HDESECkByt+2RD
	G5TA==
X-Gm-Message-State: AMke39mAv4OinRGVyWuOQwxdDsSJWMRpslHHvhUf3RCl1+WRH/ahBXQ584AdVyDHhnyK1w==
X-Received: by 10.98.8.74 with SMTP id c71mr21415023pfd.42.1488814004282;
	Mon, 06 Mar 2017 07:26:44 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	t133sm40691895pgc.24.2017.03.06.07.26.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 07:26:43 -0800 (PST)
Date: Tue, 07 Mar 2017 01:26:20 +1000
Message-Id: <20170306152620.22194-3-nathan@nathanrossi.com>
In-Reply-To: <20170306152620.22194-0-nathan@nathanrossi.com>
References: <20170306152620.22194-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v3 3/4] qemu: Convert KVMOPTS to PACKAGECONFIG
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
X-List-Received-Date: Mon, 06 Mar 2017 15:26:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Move the KVMOPTS configuration checks and option setting to a
PACKAGECONFIG option.

This also changes the checking of KVM support on the host build machine
so that it is processed as a PACKAGECONFIG _remove for class-native
only. The darwin/mingw32 overrides are kept and applied as _remove
overrides.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 72430cc6fd..5bd41d0d90 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -65,19 +65,8 @@ do_configure_prepend_class-native() {
 		"${S}"/Makefile "${S}"/Makefile.target
 }
 
-KVMENABLE = "--enable-kvm"
-KVMENABLE_darwin = "--disable-kvm"
-KVMENABLE_mingw32 = "--disable-kvm"
-
 do_configure() {
-    # Handle distros such as CentOS 5 32-bit that do not have kvm support
-    KVMOPTS="--disable-kvm"
-    if [ "${PN}" != "qemu-native" -a "${PN}" != "nativesdk-qemu" ] \
-       || [ -f /usr/include/linux/kvm.h ] ; then
-       KVMOPTS="${KVMENABLE}"
-    fi
-
-    ${S}/configure ${EXTRA_OECONF} $KVMOPTS
+    ${S}/configure ${EXTRA_OECONF}
     test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
 }
 
@@ -115,10 +104,18 @@ do_install_append() {
 
 PACKAGECONFIG ??= " \
 	fdt sdl \
+	fdt sdl kvm \
 	${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 	"
-PACKAGECONFIG_class-native ??= "fdt alsa uuid"
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl"
+PACKAGECONFIG_class-native ??= "fdt alsa uuid kvm"
+PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
+
+# Handle distros such as CentOS 5 32-bit that do not have kvm support
+PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
+
+# Disable kvm on targets that do not support it
+PACKAGECONFIG_remove_darwin = "kvm"
+PACKAGECONFIG_remove_mingw32 = "kvm"
 
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
@@ -147,5 +144,6 @@ PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
 PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
 PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,${BLUEZ}"
 PACKAGECONFIG[libiscsi] = "--enable-libiscsi,--disable-libiscsi"
+PACKAGECONFIG[kvm] = "--enable-kvm,--disable-kvm"
 
 INSANE_SKIP_${PN} = "arch"
-- 
2.11.0


