Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 90B397321C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:50:30 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id f144so22800272pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=MnffQL17t7qgZt4LzNHilzf/JFFfpvNwK6i+DfJr1Lc=;
	b=Q2y+zlUoFj7IqE/aXVQyCEq/v48zqv6G2BAEVMz/wFqMc/XK2DmBrrdyBHnQcRtcC9
	h5C2hZZBz+5z3rMZXDOMWCFVhQRgkT1uDENUiu7g9LBkyrTSGEn4l3hdk1AZi5/fW8O2
	hn9rMSelxUFqxdUxykIhQXr0+eplxY9G4pOUN0QStoWdHpzM6XruiIg7Ujj9T8UyhDP8
	DcL4L6ic+oA/YFSsLiWdP6kKJy6q+l8sI2NYpwZZOV9kOGJ36RnPYaEcYBiGrp+QwYHc
	AxyzawA8mtsVAU4Rrg26BnX3sWij1TgydUfK7nYxhz7hqe2BjhT+D92GWpC+WCwF7kTr
	5wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=MnffQL17t7qgZt4LzNHilzf/JFFfpvNwK6i+DfJr1Lc=;
	b=Rxu7DLFjsr5V/t9kBSlqUuD7roNZgtTp1P978pUtG9AyC7+wZdED7j6qZuCrGTwDrb
	hnFZo9SAQvzIBEGBOzRc6oy+Kn8PgLcYZG7dG53nA/ApolWhU4Deg+22zbeKjQm6sSQE
	5RAZdafc2OU/Aoe4Vuww810c0hTrHA5ZXSO9r7MUsCLkZzdRaBdKzo6bNiO3IHrtVEyM
	upOGGGXElhIbFT1YgO4hJxWC3MfnVer+66dLplBN4viAcNzTl1ZJShkWsxJh4tDNQ+/m
	6PBHLSlkyZ+EnOqqCuYF30lMjOpkfTHNAxSDA5zIFAEpfmZi/Jq9dm4D65U/fu/kVQIr
	MpKA==
X-Gm-Message-State: AIkVDXLVAxa09trpzB+D4EUDxgg6qHdRa9TWsMVIfcfV03Retz55YAV4s5EIm1gFU5N5qA==
X-Received: by 10.99.146.91 with SMTP id s27mr7304004pgn.30.1485762630702;
	Sun, 29 Jan 2017 23:50:30 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	j28sm29692673pfj.2.2017.01.29.23.50.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:50:30 -0800 (PST)
Date: Mon, 30 Jan 2017 17:50:21 +1000
Message-Id: <20170130075021.1725-1-nathan@nathanrossi.com>
In-Reply-To: <20170130075021.1725-0-nathan@nathanrossi.com>
References: <20170130075021.1725-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 1/4] qemu: Improve and add PACKAGECONFIG options
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
X-List-Received-Date: Mon, 30 Jan 2017 07:50:30 -0000
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
index ac5fcac83e..b9912de10b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -6,7 +6,7 @@ RDEPENDS_${PN}_class-target += "bash"
 RDEPENDS_${PN}-ptest = "bash make"
 
 require qemu-targets.inc
-inherit autotools ptest
+inherit autotools ptest bluetooth
 BBCLASSEXTEND = "native nativesdk"
 
 # QEMU_TARGETS is overridable variable
@@ -27,7 +27,7 @@ SRC_URI_append_class-native = "\
     file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --with-system-pixman --extra-cflags='${CFLAGS}'"
 
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
 
@@ -121,17 +121,17 @@ PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
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


