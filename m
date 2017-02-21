Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B6D8672F05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 13:12:37 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id a123so15500138pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 05:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=tXLxmuj6PIFWXNvS+Rhm7oa24WwjveRyWowrYdV7XXw=;
	b=d2CEFSK9wRzvxYs9O261uwccvTu8PzzhckWj57TppwRB8lxPopUPfjHNBUC0arRKI9
	ElpsogmpZG2nrxwj7jMrZ5x8MOrGxQQgnXqESgsHMcKBhGDSNVn0TKpS1MFfsNq9kkKl
	uBHnZ5dl0k3XT59+UD9ZqOGsc0kyB0fuiJyh7xS0FslnuDbfimwX+jvEVqM8G40aJoBV
	a5TXGpvrJeeiA05odU/UtZMyjv2rV7HXAaJ3l6WV5+MG9SDgIc5/fQLGSTPUQN/ufris
	YFrih2J7FP76fOXdkenzAGIJt56knDn/k4xBJPxnxvSGZ+lMXTqNYPEcX3EEbG/hIZ2z
	/b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=tXLxmuj6PIFWXNvS+Rhm7oa24WwjveRyWowrYdV7XXw=;
	b=FSORmnaffCSDJ0Y0EL1Rq/dfqRLX5Su1OEy1ZzBhYvzVEAin5WmPpZz2TLhOHDjgJM
	ditmWZU0u8JdkrpKjaAdo7ced2r3A73AwDVEXz6IPWIoHo0QZnkHl5eIjQt5ZY64fhNt
	RU79QhXWB6AiHiSO8yv6z01n7lHdTg9zUbChgkdfWsx/At2wUD81Atuj40KG8gYVtZU7
	N7jX98u8hEA+a+200jkp+3AUAiBsrwsluQZR73xw9AtEKMrrDjRAov1XbFNM/z5wwpmJ
	OMBCiEJzuEwakqGfi7JZBAWZ+HLWvSGq4uoMj9/PKGtv1oD1rZzlINbJJyLrZpyEgKHN
	HODA==
X-Gm-Message-State: AMke39l8E0Y5FNfLpLtU4It4M4Qnxbfus1vmkAoii0aNX87o+mqMUvLYFwS4OeGLzbl0Sg==
X-Received: by 10.84.224.131 with SMTP id s3mr39735569plj.162.1487682758650;
	Tue, 21 Feb 2017 05:12:38 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	n70sm41213169pfg.34.2017.02.21.05.12.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 05:12:38 -0800 (PST)
Date: Tue, 21 Feb 2017 23:12:29 +1000
Message-Id: <20170221131229.20126-1-nathan@nathanrossi.com>
In-Reply-To: <20170221131229.20126-0-nathan@nathanrossi.com>
References: <20170221131229.20126-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v2 1/4] qemu: Improve and add PACKAGECONFIG options
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
X-List-Received-Date: Tue, 21 Feb 2017 13:12:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Move the '--disable-bluez' and '--disable-iscsi' options to
PACKAGECONFIG. And added the ${BLUEZ} dependency.

Fix up the 'gcrypt' option to depend on 'libgcrypt' instead of gcrypt.
This is the expected dependency as noted in the QEMU configure help.

Handle the '--audio-drv-list' option inside the PACKAGECONFIG[alsa]
args. The previous setting uses a ',' to denote the options for the arg
however a space inside quotes is also acceptable and allows the arg to
be used into the PACKAGECONFIG flag.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ef5d75c450..6f350f9345 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -6,7 +6,7 @@ RDEPENDS_${PN}_class-target += "bash"
 RDEPENDS_${PN}-ptest = "bash make"
 
 require qemu-targets.inc
-inherit autotools pkgconfig ptest
+inherit autotools pkgconfig ptest bluetooth
 BBCLASSEXTEND = "native nativesdk"
 
 # QEMU_TARGETS is overridable variable
@@ -26,7 +26,7 @@ SRC_URI_append_class-native = "\
     file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --with-system-pixman --extra-cflags='${CFLAGS}'"
 
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
 
@@ -120,17 +120,17 @@ PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
 PACKAGECONFIG[gtk+] = "--enable-gtk --with-gtkabi=3.0 --enable-vte,--disable-gtk --disable-vte,gtk+3 vte"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
 PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
-PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,gcrypt,"
+PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt,"
 PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"
 PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
 PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
-PACKAGECONFIG[alsa] = ",,alsa-lib"
+PACKAGECONFIG[alsa] = "--audio-drv-list='oss alsa',,alsa-lib"
 PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,mesa"
 PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
 PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
-
-EXTRA_OECONF += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', '--audio-drv-list=oss,alsa', '', d)}"
+PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,${BLUEZ}"
+PACKAGECONFIG[libiscsi] = "--enable-libiscsi,--disable-libiscsi"
 
 INSANE_SKIP_${PN} = "arch"
-- 
2.11.0


