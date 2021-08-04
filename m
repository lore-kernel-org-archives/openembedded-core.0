Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.866.1628113462045551188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 14:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JgRap+Ho;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id c16so3760492wrp.13
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 14:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4hQJDWMfO3vq0O5y3mbRCjbZwiJlfAoVnsGwg3jILb0=;
        b=JgRap+HodvjI6aMwcWnU1Tj0QfFDfxh+lra037PuSrgqHYB917WCkagD6AY+x2RvTj
         2i/FhbJL+9sBWOgxIODBtk6GQt8FtIl73WJAATMOg8pIxrtv52fgZn08/XLaLQFK9gNy
         kwjEWyCgqVD/DCd77xL1e+ysQxEksvTzCHZlkNGjC/5lQRoO1ynkKHXL7NQuk9e1OD0s
         xdV/EP3ltkEA7hX9GgW7PS0QTfrGNHnccQ2pDMZKKhtGyfhQcyF8YDy8IE5F8m1/lkMO
         XR5+z+GFQZGYIH+N0byqB+hgta67GfHI8XRFzg0XQ3KV27YANp3uEm2SfPJ9pmeaUkzT
         5S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4hQJDWMfO3vq0O5y3mbRCjbZwiJlfAoVnsGwg3jILb0=;
        b=K7GKZDGr2DQudWQPOORo59WkLrUJmoqTtssXVF5s9rC4hDTESnoYYW0rgjD0Jm7dpD
         BabqtkWJZx55qUEv5paygQHo+VsCzMX6RMUE5hJBzzI9BErQRlP97GUpzHAo9VysEFRK
         2XMZTW4vdO+Pg1gfPdC0JpFnnp1JWix5hb9lZDcY1m6lPb3HLh6/u/pSf7ywINN5Lh9P
         h6x6VGdDOm48dyil05GbTOGCb7RLIAUIDtNxgWVC1gcvRZua6ulOGR4UFgPLjT1Wd+Nf
         EgXUXVifmw0Ecn2jmA2Svm5iksRCuNrzyUdaGaBA+TedA3otPOsORGpb+pQkFQrcMy8l
         1abg==
X-Gm-Message-State: AOAM532hRq6+g9XQz+H075I2Mq6vU+bqZjvWxn5ctaFrQJiLxiU+eu4m
	TVriXq1E1S6584XZqIIqVQEg7pCdBE3ZLw==
X-Google-Smtp-Source: ABdhPJypGuHTq5XfsM6zkw9ToEE0ie7OBu/VG7zBLGypOhydzJCHBKxvB8oGejqiO8mOACHC4LzE/g==
X-Received: by 2002:a5d:4f82:: with SMTP id d2mr1344035wru.257.1628113460518;
        Wed, 04 Aug 2021 14:44:20 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x18sm3331005wmc.17.2021.08.04.14.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 14:44:19 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv3] systemd-boot: use ld.bfd as efi-ld even when gold or lld is used in ${LD}
Date: Wed,  4 Aug 2021 23:44:11 +0200
Message-Id: <20210804214411.2699377-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1697E299D6012A1A.32176@lists.openembedded.org>
References: <1697E299D6012A1A.32176@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* since the upgrade to 249.1 in:
  https://git.openembedded.org/openembedded-core/commit/?id=3D323ec445dfe22=
860cd450c303db5ed8fcb4e791c
  the builds with ld-is-gold are failing with:

  [17/21] Generating linuxx64.elf.stub with a custom command
  FAILED: src/boot/efi/linuxx64.elf.stub
  /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/=
recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld -o src/boo=
t/efi/linuxx64.elf.stub -T /OE/build/oe-core/tmp-glibc/work/core2-64-oe-lin=
ux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_efi.lds -shared =
-Bsymbolic -nostdlib -znocombreloc --build-id=3Dsha1 -L /OE/build/oe-core/t=
mp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/li=
b /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/=
recipe-sysroot/usr/lib/crt0-efi-x86_64.o src/boot/efi/string-util-fundament=
al.c.o src/boot/efi/disk.c.o src/boot/efi/graphics.c.o src/boot/efi/measure=
.c.o src/boot/efi/pe.c.o src/boot/efi/secure-boot.c.o src/boot/efi/util.c.o=
 src/boot/efi/linux.c.o src/boot/efi/splash.c.o src/boot/efi/stub.c.o -lefi=
 -lgnuefi /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/2=
49.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.2.0/libgcc.a
  /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/=
recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld: internal =
error in segment_precedes, at ../../gold/layout.cc:3721
  [18/21] Generating boot.c.o with a custom command
  ninja: build stopped: subcommand failed.
  WARNING: exit code 1 from a shell command.

  as reported in:
  https://lists.openembedded.org/g/openembedded-core/message/154246

* if someone is using lld or ld.lld in ${LD} then it would fail as well:
  https://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc49b78e6c9bf=
86a764e31

* work around this by always using ld.bfd instead of whatever is set in ${L=
D}

* it needs to be prefixed with ${HOST_PREFIX} to match how LD is constructe=
d:
  $ bitbake-getvar -r systemd-boot LD
  #
  # $LD [2 operations]
  #   exported /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:5=
23
  #     [export] "1"
  #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:523
  #     "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
  # pre-expansion value:
  #   "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
  export LD=3D"x86_64-oe-linux-ld --sysroot=3D/OE/build/oe-core/tmp-glibc/w=
ork/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot  "

  $ bitbake-getvar -r systemd-boot EFI_LD
  #
  # $EFI_LD
  #   set /OE/build/oe-core/openembedded-core/meta/recipes-core/systemd/sys=
temd-boot_249.1.bb:23
  #     "${HOST_PREFIX}ld.bfd"
  EFI_LD=3D"x86_64-oe-linux-ld.bfd"

  otherwise first ld.bfd it will find will be from HOSTTOOLS_NONFATAL and
  fail when host's binutils isn't compatible as in:
  https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/2673/s=
teps/11/logs/stdio

  FAILED: src/boot/efi/linuxx64.elf.stub
  /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/hosttools/=
ld.bfd -o src/boot/efi/linuxx64.elf.stub -T /home/pokybuild/yocto-worker/ge=
nericx86-64-alt/build/build/tmp/work/core2-64-poky-linux/systemd-boot/249.1=
-r0/recipe-sysroot/usr/lib/elf_x86_64_efi.lds -shared -Bsymbolic -nostdlib =
-znocombreloc --build-id=3Dsha1 -L /home/pokybuild/yocto-worker/genericx86-=
64-alt/build/build/tmp/work/core2-64-poky-linux/systemd-boot/249.1-r0/recip=
e-sysroot/usr/lib /home/pokybuild/yocto-worker/genericx86-64-alt/build/buil=
d/tmp/work/core2-64-poky-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib=
/crt0-efi-x86_64.o src/boot/efi/string-util-fundamental.c.o src/boot/efi/di=
sk.c.o src/boot/efi/graphics.c.o src/boot/efi/measure.c.o src/boot/efi/pe.c=
.o src/boot/efi/secure-boot.c.o src/boot/efi/util.c.o src/boot/efi/linux.c.=
o src/boot/efi/splash.c.o src/boot/efi/stub.c.o -lefi -lgnuefi /home/pokybu=
ild/yocto-worker/genericx86-64-alt/build/build/tmp/work/core2-64-poky-linux=
/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-poky-linux/11.2=
.0/libgcc.a
  /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/hosttools/=
ld.bfd: warning: /home/pokybuild/yocto-worker/genericx86-64-alt/build/build=
/tmp/work/core2-64-poky-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/=
crt0-efi-x86_64.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0010002
  /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/hosttools/=
ld.bfd: warning: /home/pokybuild/yocto-worker/genericx86-64-alt/build/build=
/tmp/work/core2-64-poky-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/=
crt0-efi-x86_64.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0010001
  /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/hosttools/=
ld.bfd: /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work=
/core2-64-poky-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/crt0-efi-=
x86_64.o: unable to initialize decompress status for section .debug_line
  /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/hosttools/=
ld.bfd: /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work=
/core2-64-poky-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/crt0-efi-=
x86_64.o: unable to initialize decompress status for section .debug_line
  /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/core2=
-64-poky-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/crt0-efi-x86_64=
.o: file not recognized: File format not recognized

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_249.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_249.1.bb b/meta/recipes=
-core/systemd/systemd-boot_249.1.bb
index d767b5bf8d..c93bc3160b 100644
--- a/meta/recipes-core/systemd/systemd-boot_249.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot_249.1.bb
@@ -19,11 +19,14 @@ objcopy =3D ${@meson_array('OBJCOPY', d)}
 EOF
 }
=20
+# need to use ${HOST_PREFIX} here, otherwise ld.bfd could be used from HOS=
TTOOLS_NONFATAL
+EFI_LD =3D "${HOST_PREFIX}ld.bfd"
+
 EXTRA_OEMESON +=3D "-Defi=3Dtrue \
                   -Dgnu-efi=3Dtrue \
                   -Defi-includedir=3D${STAGING_INCDIR}/efi \
                   -Defi-libdir=3D${STAGING_LIBDIR} \
-                  -Defi-ld=3D${@ d.getVar('LD').split()[0]} \
+                  -Defi-ld=3D${EFI_LD} \
                   -Dman=3Dfalse \
                   --cross-file ${WORKDIR}/meson-${PN}.cross \
                   "
--=20
2.30.2

