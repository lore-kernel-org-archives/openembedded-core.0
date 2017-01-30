Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6994B7391A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:50:40 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y143so22802426pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=gOb2RxJTKCogXiJeycBfLLPetg9ZIkvu4nexjamH3HE=;
	b=NmP9xamoxQnjZgXZadieEWi5ksDoxCmyYxUfpwYkBF5s18R+MPUTn5THBupXtfvsNe
	D9caowYGVn8X2pfmn9uBbpKjmuFzfi0+0+xtD/FXz0u+5Avnfh8jekycGpC8dyU3o8eM
	XuNQEYrF9g/xLfOxGrRyOJN5yTaGxozRZDXA/Kj0oUPTpDK7LVuR6wFb2o5mXe2gzdQW
	vhlAddk7bkb64fBZtSFuV4mf7DLZOM+CZqOEfRT4cx79gjNwhNH/2AlWtJnAVKVG7Q0T
	bxFRMIXuGIIRrUvFvBkQN/uJy1hKK/xs81rQff6qvzDXUoMCzp2DAXFDERtPSigZ+upy
	HIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=gOb2RxJTKCogXiJeycBfLLPetg9ZIkvu4nexjamH3HE=;
	b=U+7nNwT+s2c0NXhPw6cNh7qIy2E8o/K9UaFxYqMsb4ACSsIU5D65RRqiVDrVTVEZsI
	C2DpyxResgWXK1KogiHEWcRYjbc1jIws2BE9cXdkVAx1SqWV/Z59aDYwbC6GOp2VrXlP
	KGYrqYOhtaxod7z2A294DVLRwUqKlWM342L+qQykbudt2iMH1SACGnRwwliF+IKAh/9f
	w13nP0qGkwxFoR/bvC+icGZMCVQKRcT/O/64yr4MXHSiC1osKntei81GWt5G13Ll9GVI
	o0E4dTUMbBYYvR1Q+HglHi14D2uhwEcqvzY/ixPRBPm4ICdnorv/UDcHFPAflI3ISOwD
	cHTw==
X-Gm-Message-State: AIkVDXJ3bxS3TKFVnegVOwfcEvwTxC8b4E6S2rp+DnDbbt8AiFU6gGf58Dghy1HCJS7wSg==
X-Received: by 10.98.55.66 with SMTP id e63mr22086243pfa.156.1485762640526;
	Sun, 29 Jan 2017 23:50:40 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	c11sm29683009pfe.68.2017.01.29.23.50.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:50:40 -0800 (PST)
Date: Mon, 30 Jan 2017 17:50:21 +1000
Message-Id: <20170130075021.1725-3-nathan@nathanrossi.com>
In-Reply-To: <20170130075021.1725-0-nathan@nathanrossi.com>
References: <20170130075021.1725-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 3/4] qemu: Convert KVMOPTS to PACKAGECONFIG
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
X-List-Received-Date: Mon, 30 Jan 2017 07:50:40 -0000
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
 meta/recipes-devtools/qemu/qemu.inc | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 522f452810..0a6daf7bc8 100644
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
 
@@ -114,12 +103,19 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= " \
-	fdt sdl \
+	fdt sdl kvm \
 	${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen', '', d)} \
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
@@ -148,5 +144,6 @@ PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
 PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
 PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,${BLUEZ}"
 PACKAGECONFIG[libiscsi] = "--enable-libiscsi,--disable-libiscsi"
+PACKAGECONFIG[kvm] = "--enable-kvm,--disable-kvm"
 
 INSANE_SKIP_${PN} = "arch"
-- 
2.11.0


