Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 450EE7199B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 13:12:46 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id s67so7714163pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 05:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=+7cipBJxLK/0GaDwaCaaxePzjEVNsubsFbyLaguO9ME=;
	b=bco2DLdNVJo4lg2fbTt6KHuqpWBnnMhkpGprXujkZ2n3AlJBU+GP8EuprmpUCQ4wrz
	Tk4KEGt31qz/Lz4IIwAVxaRf8vFzjerPgR76HQ3FuTn814EtGjXy5RiEodReTUMERm7E
	p35z211dSBkBpqitU/er7vo8PaM7vcDhNZSmWyf7oH7GaWeZtW8UAAvw5Ev+sAx0pGiq
	f/cEjgk2E4vjCvmEqdLeSdOKlzYETRvqPh53wUY153bOFpRL0k6TCPsAPdGZDAmY93sn
	sAZAtPWqXNX9T4KMW/M+MhXhBwWdJx2FmYGF08xah7GoS4Gf6x9txFgkgugq6CmtUrZ9
	km5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=+7cipBJxLK/0GaDwaCaaxePzjEVNsubsFbyLaguO9ME=;
	b=QQMSwVH+TS9lj0vdIFmicTy/RQIMdrLMTKaqJTjoOpJ+DiUB/ClddpOWOZ4lW3hjSz
	yoCW6l3vDRhQ/MLoEZDioREJvVoB/YuOmBQ3LC9zYOm+L4pLDxHEdGFjDcYoOAzhtKYq
	HQLQJxrHfy0XBszbh5ziCOIjUnyrQxykMcXbeAIx2j8lYDshiduBiHMGdy5k/lYip8MD
	/Y26ONAaPXzJG2Fww4Wj5WfTqEDiQ1+JQFIsqfTbV3ddn5Ln8SNYcfyx648iFMSn1PnF
	jjW+aSGmoXW3sx5QpzXu5icRth8wRkf25Jyi4NFKlmAOmJrcM7HElq1RtyEZByEABH/0
	Rfvw==
X-Gm-Message-State: AMke39ljilDzpp0de4tW9qCUmkJmDutR5eo79DgLbFX8nKTopG1DHpRka9+zWPVgYcZI7w==
X-Received: by 10.84.217.65 with SMTP id e1mr39925097plj.40.1487682767645;
	Tue, 21 Feb 2017 05:12:47 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	b190sm41101963pfa.110.2017.02.21.05.12.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 05:12:47 -0800 (PST)
Date: Tue, 21 Feb 2017 23:12:29 +1000
Message-Id: <20170221131229.20126-3-nathan@nathanrossi.com>
In-Reply-To: <20170221131229.20126-0-nathan@nathanrossi.com>
References: <20170221131229.20126-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v2 3/4] qemu: Convert KVMOPTS to PACKAGECONFIG
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
X-List-Received-Date: Tue, 21 Feb 2017 13:12:46 -0000
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
index 485638b62d..e78cfb367b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -64,19 +64,8 @@ do_configure_prepend_class-native() {
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
 
@@ -113,12 +102,19 @@ do_install_append() {
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
@@ -147,5 +143,6 @@ PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
 PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
 PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,${BLUEZ}"
 PACKAGECONFIG[libiscsi] = "--enable-libiscsi,--disable-libiscsi"
+PACKAGECONFIG[kvm] = "--enable-kvm,--disable-kvm"
 
 INSANE_SKIP_${PN} = "arch"
-- 
2.11.0


