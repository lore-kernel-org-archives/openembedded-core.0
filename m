Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06841C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 10:30:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.10422.1636453802408824022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 02:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DrGnkr69;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso1412872wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 02:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dmGaQh1Q4oefqkRSNzlAvxIhqIARRCtz2pBEtB4sbXY=;
        b=DrGnkr69OCf9lg5gRxr8tkG2M/7uIyumASced+k8hAxa8mGFFe8HVlRWilvWdccddQ
         LufmeSZlajYeRvvkIqfS01zCdCmq5+QbCUdBIKlUzM2hiCIrWJRw5pQe6YsvRmaz3NLw
         ofgUO4HB6i4gTOFsIUZq57gBVvUWU3rKtk3J9tYni89xD57g5KS45V/9z3dtO3uRL/JZ
         tbgvTMxUmPDAPj8V1eyYF/svZ9xZezhvfrsqU4XRH0VHiYjpOxlRtarTzFgie+LC+10G
         cso+NQUSYc8Ey2IKToNR189CYAGcrYxEpgnRsHYZwJH7DcrkACv0TjdVYiDi/wpiHoqA
         lFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dmGaQh1Q4oefqkRSNzlAvxIhqIARRCtz2pBEtB4sbXY=;
        b=Ku720KH+6nc9vfRDbvqzY8KcaCc6CfWIljZhmWcx6IPgnobTUmXz6NGNc8V9feQ61H
         H0BquTQFFHdqs32XCZScrng9En7SNdu9vlEriw0WKgd06YgmlaUC6qSQE3HlSq0mqMXp
         BoBoXeHABPGiDBNBK2ptzuWrIVQ98yB61JMSdx4oERQn7okuc4tq9Oe+zWIWB5szHqTB
         aepKxuQinYCPtQ+Fl/J2WRbmVuAEA7GLfW1uM/e2z4uI0kB16Qkz6JpFr9kZ7ZcAZ6pn
         vWNbx82BBS4Xe+Un1l05RS5HH7khRQHFNIX+ThRRYimidWzn1DUGhrQ9gmEGl9PH1Jyg
         Snxg==
X-Gm-Message-State: AOAM5330ZBI9WrmvL8VG0NnQ+3+1lXMEkxjqJ0HbziP6vERP9klZoZJH
	kPdnmRUdp0xROkyvtkyeQjUNj8d4pbk=
X-Google-Smtp-Source: 
 ABdhPJyBoEcEbbo8uEUPiP0n/n4aHLpOA6O0MJ8ho2tjCthmrgPhKJT0DtlXghkjuReBYIp7EWCCmw==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr3200528wmq.117.1636453801036;
        Tue, 09 Nov 2021 02:30:01 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 f3sm2096076wmb.12.2021.11.09.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 02:30:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] gdb-cross: add dependency on gmp-native
Date: Tue,  9 Nov 2021 11:29:58 +0100
Message-Id: <20211109102958.22207-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 10:30:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158010

* it was already added for target and cross-canadian gdb in:
  commit 4643d1eb222151384f77d13a936537aae5ca3fe6
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Fri Nov 5 17:37:33 2021 -0700

    gdb: Add dependency on libgmp

    gdb 11 has added this library as must have

* but gdb-cross.inc overwrites DEPENDS from gdb-common.inc
  and needs the dependency as well as shown in log.do_compile:

  checking for libgmp... no
  configure: error: GMP is missing or unusable
  make[1]: *** [Makefile:9418: configure-gdb] Error 1

  and in gdb-cross-i686/11.1-r0/build-i686-oe-linux/gdb/config.log:

  configure:10402: checking for libgmp
  configure:10422: gcc  -o conftest -isystem/OE/tmp-glibc/work/x86_64-linux=
/gdb-cross-i686/11.1-r0/recipe-sysroot-native/usr/include -O2 -pipe     -is=
ystem/OE/tmp-glibc/work/x86_64-linux/gdb-cross-i686/11.1-r0/recipe-sysroot-=
native/usr/include -I/OE/tmp-glibc/work/x86_64-linux/gdb-cross-i686/11.1-r0=
/recipe-sysroot-native/usr/include  -L/OE/tmp-glibc/work/x86_64-linux/gdb-c=
ross-i686/11.1-r0/recipe-sysroot-native/usr/lib                         -L/=
OE/tmp-glibc/work/x86_64-linux/gdb-cross-i686/11.1-r0/recipe-sysroot-native=
/lib                         -Wl,--enable-new-dtags                        =
 -Wl,-rpath-link,/OE/tmp-glibc/work/x86_64-linux/gdb-cross-i686/11.1-r0/rec=
ipe-sysroot-native/usr/lib                         -Wl,-rpath-link,/OE/tmp-=
glibc/work/x86_64-linux/gdb-cross-i686/11.1-r0/recipe-sysroot-native/lib   =
                      -Wl,-rpath,/OE/tmp-glibc/work/x86_64-linux/gdb-cross-=
i686/11.1-r0/recipe-sysroot-native/usr/lib                         -Wl,-rpa=
th,/OE/tmp-glibc/work/x86_64-linux/gdb-cross-i686/11.1-r0/recipe-sysroot-na=
tive/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--=
dynamic-linker=3D/OE/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-linux=
-x86-64.so.2 conftest.c -lncursesw -lm -ldl  -lgmp >&5
  conftest.c:52:10: fatal error: gmp.h: No such file or directory
     52 | #include <gmp.h>
        |          ^~~~~~~

* this fails only when the host OS doesn't have GMP installed
  otherwise it will use libgmp from host and ignore
  --with-libgmp-prefix=3D/OE/tmp-glibc/work/x86_64-linux/gdb-cross-i686/11.=
1-r0/recipe-sysroot-native/OE/tmp-glibc/work/x86_64-linux/gdb-cross-i686/11=
.1-r0/recipe-sysroot-native/usr

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtool=
s/gdb/gdb-cross.inc
index 4e50cd5ab0..9f9675c1b3 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -1,6 +1,6 @@
 require gdb-common.inc
=20
-DEPENDS =3D "expat-native ncurses-native flex-native bison-native"
+DEPENDS =3D "expat-native gmp-native ncurses-native flex-native bison-nati=
ve"
=20
 inherit python3native pkgconfig
=20
--=20
2.32.0


