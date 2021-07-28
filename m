Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.4106.1627475364982499007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 05:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ojihviaO;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id z24so1950548qkz.7
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=baEdGXP2g/tuyBuZSzTJjzODGtYsSr/YA5VjZK1ubZk=;
        b=ojihviaOs69JOi4lJFW8X+MzrEl4w6Mq/3izBfBLko0RH1IWGjItkex30Uk1p0PytA
         ozDyvMdGpXGOQfzicHXPBcsYiDkC56AvExSsmHqX+uP/I6LD1TwEI6Z+ypaEjrCE3nhW
         Sy770W1JZvzK7L/Q9QcWIP28UJ+bBVq9Go1qVjklzqsm0YyhN1WdoQ9xAhRbkrXtcdlc
         I+HxtCWV5YBo6M3MdrUsI4BfwL81bPNTevUOYZafVLmHZ4hWWZKB6b8R7CpXx/6xv8oJ
         eNiAQNw6x9UjLGu7e5PxlLbY7mdGaOCmns1N/I6RnfyuyvaQVFOb5NMzmKmOq99mlnAt
         /1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=baEdGXP2g/tuyBuZSzTJjzODGtYsSr/YA5VjZK1ubZk=;
        b=Oz52A0ygrMB7tTgJ3xqpyQZSU/3/7iwWO1VXOIMSQTAg4YzGxrbxhsshIhTQYF85hm
         tRhl81I9n8qCjhHTED/AhFyj89xSjQjHazwZhjYiX/fq48cvBsMjVYT02EfDkFqXPQij
         iHTA7IO/uXSIZNs6j+MGjnbPWWq2eglGO+wj6XCwlPT1QdSmxnfstfgw4hNvHSSgAymU
         Cf7GbprgSS8rarRZgs/P6iUv0dHBvJhRDwyuRqw1J64N/HeP8yrnmKZPYa1+W3Pn3qmx
         OexB4lSohQ9lqQUSqJpHXZPcftNUhqAj00zLdtalU2xOJfaXLbaejNYDROHdHkgT5Q/+
         c+6A==
X-Gm-Message-State: AOAM531dVVmFs1TrugU5tOWPRex7HW2Fqju5WZkkp7mSgiFsSREIg0Bg
	LkbNdrTGuxe7aCIZkFJDblceeHI0BdU=
X-Google-Smtp-Source: ABdhPJz1WBkFZlwkUTaZI1LfT642DARCTHuzsnWlKHgOXHzUOOo9AUUqFWn+x4GXNRkHDzuHslFKNA==
X-Received: by 2002:a05:620a:24e:: with SMTP id q14mr27995601qkn.300.1627475363752;
        Wed, 28 Jul 2021 05:29:23 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id s3sm3211882qke.85.2021.07.28.05.29.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 05:29:23 -0700 (PDT)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ffmpeg: add libatomic for armv5
Date: Wed, 28 Jul 2021 08:29:14 -0400
Message-Id: <20210728122914.1085-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The GNU Atomic library is a GCC support runtime library for atomic
operations not supported by hardware.

Otherwise we get the following when building:

	| arm-oe-linux-gnueabi-gcc -mcpu=3Darm926ej-s -mfpu=3Dvfp -mfloat-abi=3Dha=
rd -marm --sysroot=3D.../build/tmp-glibc/work/armv5ehf-vfp-oe-linux-gnueabi=
/ffmpeg/4.4-r0/recipe-sysroot -Llibavcodec -Llibavdevice -Llibavfilter -Lli=
bavformat -Llibavresample -Llibavutil -Llibpostproc -Llibswscale -Llibswres=
ample -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-O1 -Wl,--hash-sty=
le=3Dgnu -Wl,--as-needed  --sysroot=3D.../build/tmp-glibc/work/armv5ehf-vfp=
-oe-linux-gnueabi/ffmpeg/4.4-r0/recipe-sysroot -mcpu=3Darm926ej-s -Wl,--as-=
needed -Wl,-z,noexecstack -Wl,--warn-common -Wl,-rpath-link=3D:libpostproc:=
libswresample:libswscale:libavfilter:libavdevice:libavformat:libavcodec:lib=
avutil:libavresample   -o ffprobe_g fftools/cmdutils.o fftools/ffprobe.o  -=
lavdevice -lavfilter -lavformat -lavcodec -lavresample -lswresample -lswsca=
le -lavutil  -lm -lxcb -lxcb-shm -lxcb-shape -lxcb-xfixes -lasound -lXv -lX=
11 -lXext -pthread -lm -lm -lbz2 -lz -pthread -lm -llzma -lz -ltheoraenc -l=
theoradec -logg -lm -lm -lm -pthread -lm -lXv -lX11 -lXext
	| .../build/tmp-glibc/work/armv5ehf-vfp-oe-linux-gnueabi/ffmpeg/4.4-r0/rec=
ipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-=
gnueabi/gcc/arm-oe-linux-gnueabi/11.1.1/ld: libavformat/libavformat.so: und=
efined reference to `__atomic_fetch_sub_8'
	| .../build/tmp-glibc/work/armv5ehf-vfp-oe-linux-gnueabi/ffmpeg/4.4-r0/rec=
ipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-=
gnueabi/gcc/arm-oe-linux-gnueabi/11.1.1/ld: libavformat/libavformat.so: und=
efined reference to `__atomic_store_8'
	| .../build/tmp-glibc/work/armv5ehf-vfp-oe-linux-gnueabi/ffmpeg/4.4-r0/rec=
ipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-=
gnueabi/gcc/arm-oe-linux-gnueabi/11.1.1/ld: libavformat/libavformat.so: und=
efined reference to `__atomic_load_8'
	| .../build/tmp-glibc/work/armv5ehf-vfp-oe-linux-gnueabi/ffmpeg/4.4-r0/rec=
ipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-=
gnueabi/gcc/arm-oe-linux-gnueabi/11.1.1/ld: libavformat/libavformat.so: und=
efined reference to `__atomic_fetch_add_8'
	| collect2: error: ld returned 1 exit status

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-mu=
ltimedia/ffmpeg/ffmpeg_4.4.bb
index 3ed009bbb7..373a3e7388 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -130,6 +130,7 @@ EXTRA_OECONF +=3D "${@bb.utils.contains('TUNE_FEATURES'=
, 'mips32r6', '--disable-mi
 EXTRA_OECONF_append_mips =3D " --extra-libs=3D-latomic --disable-mips32r5 =
--disable-mipsdsp --disable-mipsdspr2 \
                              --disable-loongson2 --disable-loongson3 --dis=
able-mmi --disable-msa --disable-msa2"
 EXTRA_OECONF_append_riscv32 =3D " --extra-libs=3D-latomic"
+EXTRA_OECONF_append_armv5 =3D " --extra-libs=3D-latomic"
=20
 # gold crashes on x86, another solution is to --disable-asm but thats more=
 hacky
 # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
--=20
2.30.0.rc0

