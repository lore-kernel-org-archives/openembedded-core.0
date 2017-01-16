Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 47B6471B58
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:18:11 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 75so5493295pgf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=pAWHTwpmD7Nu+ZM8wGlTtJg9jEpW8EmmgU3qBPY/Rf4=;
	b=HlWA28Snez2Gvi3KipmjlDi+yp4CA8GHNt35kgV3Nxf3C7lpBeYkcqe9O/2wt5MIFD
	xwndjtckc2w0x4l2ewgOY8Br84/cIOCepEpLKeBz5crHOiEITVT0lK/o1OpHsUPppo4l
	Od8bMupbKUj73PighXUbZU2WNrMtT5kaaOHjeXgSmZ3yG2yp1b6zqt5B1sLVremRaQAn
	bNHgaBDg4uI0sBMXbTaVPv4JUezoWnd2Qm9JGk5DHoFY8yL5b7qLuL/JaeXgUmUMNt+y
	VyxRZsmb0gQ32Pt3J8E6QW5eoGR+kaWbHx8vGXvOTEKb3yLLwVWVkUCg8AF4DCrVncEl
	kQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=pAWHTwpmD7Nu+ZM8wGlTtJg9jEpW8EmmgU3qBPY/Rf4=;
	b=i2z4TDtv7BTLWDhLS9BPu2EjJcW8B9XE+IAMe2jqQ3xNUjy52ehKCIrMlYf/SGNIbP
	ExFtmMdAxmu3OBoR19aD5j5lHk4U3fhjgO/uWIJmalvbrMXNcREoj0wTTQaOrLBxapwo
	SU7qGUc2NywyLCxfBh4bWGP1kQOdYa0YRcUj5u6IxZXTu+HeOAqIVqYTezU2GoqJl0RH
	mfLSIE2Qh0hNwYXbAvLUDCTAxrtOE3HvV6YFT436TThMXB+c26oR5aFl91t5SPJjLFVf
	xH6KRDkfH1gJIXHBSQWsSxlB4mg0WS3a0cRLAuDBViKBcme9lrAoyvMMWHAQ2kaA4FqW
	lLEQ==
X-Gm-Message-State: AIkVDXLBuW8/mrk3zBpxNQ7iwZgGy2GooKeiKBet1CK12zMQsxCS7XaCqplJeWNhtaMwzA==
X-Received: by 10.99.95.151 with SMTP id t145mr40065627pgb.75.1484576291817;
	Mon, 16 Jan 2017 06:18:11 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	89sm48232376pfi.70.2017.01.16.06.18.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:18:11 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-29-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 29/30] qemu: Convert KVMOPTS to PACKAGECONFIG
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
X-List-Received-Date: Mon, 16 Jan 2017 14:18:11 -0000
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
index f758f79dff..f11221c991 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -67,19 +67,8 @@ do_configure_prepend_class-native() {
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
 
@@ -116,12 +105,19 @@ do_install_append() {
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
@@ -150,5 +146,6 @@ PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
 PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
 PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez"
 PACKAGECONFIG[libiscsi] = "--enable-libiscsi,--disable-libiscsi"
+PACKAGECONFIG[kvm] = "--enable-kvm,--disable-kvm"
 
 INSANE_SKIP_${PN} = "arch"
-- 
2.11.0


