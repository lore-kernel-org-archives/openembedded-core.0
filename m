Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2A2AB71ADD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:17:59 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 204so5489984pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=NiAhVJk/PSTpiJDrJ015RfKAroFWU184sbRJimuxti4=;
	b=fz1AFF6IqxPvmJN/l/BWsFl20jVIqoFBgzjn1EIvUv9BUFy7qCrWyv3rKameUkILrk
	y7xUC/uRppumcSijhCcpotdk4VUCbqBBwwQ3bLJ0lENQEsh2oT4B9HPmI6eXsXWRGmdJ
	Uw57qC4TPct57db4dn3tgxVfUKDGstbK+32vyABW/G+YpML+Hx9mkTwrxR2EA4qnS3AC
	W9VknEaplUT5AJufYRd0unL19DwCtd/6dN1XZditX1qC5ZCzDB/xMkcdHKqrbmlXN2ZE
	JSusUa7dDbCwMupjXHLWIkzUH6OfyX9qlckHXyoQMTR4Wg0TzJ5+TME+fDSn6jonw9uG
	U9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=NiAhVJk/PSTpiJDrJ015RfKAroFWU184sbRJimuxti4=;
	b=lUR4YMT0qBnzkFlpaUbpsfyMGeARkeDPZ2+57aJmaZJ+/z6nDuPW0jriH2621s2mgd
	It2TBoSA25eKPDppAvC+6r8Achx7336nk1RXa9x+3YyuV6rXEzj777FOZyJOHnREkO/h
	bTrqJPpb+9IaJK65vrlAUy8PSZFoA9mEl17z7/SHuUyg4qAuOg8moMpzYqIlWPpOSf3x
	DBxXTUgJm6Ao0TKjS9OaUjXQqd5J/pbtSmOvWFecTjDD/bjw4SRraKLfJIHdPXnII2Ql
	/7FproDcjM46NDc7HrJ+ZFUdMHI8IBCWV4Eqo7iFQwbTzX2qGfj//EhH6QrpbVZxHelU
	Jb8w==
X-Gm-Message-State: AIkVDXK2RwAuZbdcZs3q5FsiMXc4m0b86fNOTw05TPH2UUhQbESHQAGsJuRDK0X3MM7lvg==
X-Received: by 10.84.193.36 with SMTP id e33mr50957921pld.4.1484576280358;
	Mon, 16 Jan 2017 06:18:00 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	g87sm27213958pfj.20.2017.01.16.06.17.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:17:59 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-27-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 27/30] qemu: Improve and add PACKAGECONFIG options
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
X-List-Received-Date: Mon, 16 Jan 2017 14:18:00 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Move the '--disable-bluez' and '--disable-iscsi' options to
PACKAGECONFIG.

Fix up the 'gcrypt' option to depend on 'libgcrypt' instead of gcrypt.
This is the expected dependency as noted in the QEMU configure help.

Handle the '--audio-drv-list' option inside the PACKAGECONFIG[alsa]
args. The previous setting uses a ',' to denote the options for the arg
however a space inside quotes is also acceptable and allows the arg to
be used into the PACKAGECONFIG flag.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b46e7f72e2..e5bc1864d5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,7 +29,7 @@ SRC_URI_append_class-native = "\
     file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --with-system-pixman --extra-cflags='${CFLAGS}'"
 
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
 
@@ -123,17 +123,17 @@ PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
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
+PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez"
+PACKAGECONFIG[libiscsi] = "--enable-libiscsi,--disable-libiscsi"
 
 INSANE_SKIP_${PN} = "arch"
-- 
2.11.0


