Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0AE68775B5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:26:32 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 187so6363081pgb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=kteFAeZv6JRrDrgojDEPhfOIGyQowydE+Y2G4zpm4Rk=;
	b=EXLQC4twFQUe0HMzRsxBZgEk8j3YWI5YSwL3gDxnVyydOPqihAQ80eHfpkqc6EDEMV
	yOdLwhKJz3zvOToqjDivSlaBNNvpeSnJMsCdGoUrNu/rFEkRu+xixzUlIKWOosCLN25k
	o00pcOjexaYj9NdqoneUHaZO4hFR4C9ZZh40Nb6V6uQX9Z6qz2Cu6N9zbBd4le9IfZUN
	JPthRsU8XuSTSGbst8WEVO2LbAgasAnCLg1HLMF3EJWSAWIDtXp9Y+Kc1cnMA9H+sCtJ
	ukA3/+vk0ZDRPxcFPVDl/JU4rigkNSSMThMZR1u/a+akaUjvoGUyYkkBp9ssCRZbPoyR
	iZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=kteFAeZv6JRrDrgojDEPhfOIGyQowydE+Y2G4zpm4Rk=;
	b=l26WbBT5+9uST5c+GiKcnO7QeOmwDMFcvVRYDnP6PULTbS+a1bxGaTjdlSto0ZVohv
	b2GCY81g1qJxXbdwrASDacpmbq46MrDV2yZnJcq9kCscK9U6otsBdhc6KKQVu/3ptz0A
	+leSUpUuc3jF2KcDMKnah9wAiFoYNV+EtkdGhsMToHTFgoU93Fn4+oE3r7KXNq1hxrgV
	4kJLba6lYG+/BQBnpo86daXXTkK7YGiRHwAwxKKEnILwzubGUAuyuY9rxp1HOdaO2geB
	340pHsejJpCvjNBtEDvYIm8j826WJ0xA0nb4gUzGrlWs3t2Dp0CFgpEV6433Qgwtn5Zj
	14yA==
X-Gm-Message-State: AMke39nuQrCOr8eajmV07aiLO/3MEx1Zrpl639yYqz8CporFc3VSNEEtT5gjtCu8xIeUrQ==
X-Received: by 10.99.164.18 with SMTP id c18mr21239771pgf.40.1488813994186;
	Mon, 06 Mar 2017 07:26:34 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	w14sm27677639pgo.37.2017.03.06.07.26.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 07:26:33 -0800 (PST)
Date: Tue, 07 Mar 2017 01:26:20 +1000
Message-Id: <20170306152620.22194-1-nathan@nathanrossi.com>
In-Reply-To: <20170306152620.22194-0-nathan@nathanrossi.com>
References: <20170306152620.22194-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v3 1/4] qemu: Improve and add PACKAGECONFIG options
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
X-List-Received-Date: Mon, 06 Mar 2017 15:26:33 -0000
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
index 2b82e8fd02..1857786917 100644
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
 EXTRA_OECONF_append_class-native = " --python=${USRBINPATH}/python2"
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


