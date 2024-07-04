Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59986C41513
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:56 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.8997.1720096070903153949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1FnwMopm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-706b53ee183so1195492b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096070; x=1720700870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHFO1sktGPQUKMZUjbtN0e9fkIYG7eZpFW9+mxQfOuE=;
        b=1FnwMopmJByO0Bw7RTb7Zp9rf+me6m9t+1ZVWNmmsdnNw1GvEmuEvtca6P4z9GCp8N
         c0LoO1G0yXDRodFA2oHZ9MdjABa6xC++6h6Wwoyf0/yPet+0RDNN754/U6iXuom3PO3A
         widtr5fGCcnFl20PmiRwMVe8FOmhqG4GHjIgP0sYRRr8SJ3xnufLKzokx7kY4GBj4H74
         uxNhuD+7U6kZxtZ0GJAqSkukQE4TuztU8Zf8NQQ/0V/cg2x++aaLaXJPZmTgEC6BL1EO
         vz9It/+/CusV8v/lPveEeWJCeGYBRjee58Gqt3ocNTe797WoN8bViTJkHFC4cMWvTdgE
         7sDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096070; x=1720700870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHFO1sktGPQUKMZUjbtN0e9fkIYG7eZpFW9+mxQfOuE=;
        b=ksa/MIT24iAtrntbWIbqvKNEo+Dw+JIqFCos24zCGeL6OGTRv3ABNqngaAIKFFb3uE
         4Jt1azc3MBKX9sjqa8CW0rmrems+uzGQJ743+edkzp5V8jhq0v9K8/s56IEerw3SeMQi
         ahhdydVp/GP82Ld4bnD9k9HFCixuzVDNNTze+ijz9cMDcl4ayTW5lmpIh/inuFa826Fc
         MO9ddoSCYEM4FTpS2TESNi1zgoUMqt2ipcy3Elf2JVn1iuK9GFrMg+QLm2ATcCYFqFAb
         aaBYxJB4klObV1UogJbBT8V364fF7yRxEiKIYtYI/dKDkSJK4KQhRINszKFzWuRuEbQ5
         4W2A==
X-Gm-Message-State: AOJu0YzYh/Dj3gAvmIoeqDtAZDId4JfWIWKORN6aDAQm0T0ZUXgNpVAo
	ZGLuhAVFEmwaOZHyeUacDk9Mko3ULGhRrT43AXIFQnd/UFtAicGSMbqBMI+bbO00R6oywt9557K
	7
X-Google-Smtp-Source: AGHT+IHrhQ4oHp46RufnyP+zvvRXutqkRS8cTlrqU7ymcj5T6pSM9vgb+smBRyyK1D8XWlomD4vhEw==
X-Received: by 2002:a17:902:da87:b0:1f9:f6a7:9330 with SMTP id d9443c01a7336-1fb3702ed58mr20153905ad.9.1720096066561;
        Thu, 04 Jul 2024 05:27:46 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/21] rng-tools: ignore incompatible-pointer-types errors for now
Date: Thu,  4 Jul 2024 05:27:06 -0700
Message-Id: <656b76a59f06e432d5dc6c9e8b76cdcda0113eb2.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201558

From: Martin Jansa <martin.jansa@gmail.com>

* causes libargp test to fail:

http://errors.yoctoproject.org/Errors/Details/766951/

| configure: error: in '/OE/build/luneos-styhead/tmp-glibc/work/qemux86_64-=
webos-linux/rng-tools/6.16/build':
| configure: error: libargp disabled and libc does not have argp

config.log shows:

configure:8424: x86_64-webos-linux-gcc  -m64 -march=3Dnehalem -mtune=3Dgene=
ric -mfpmath=3Dsse -msse4.2 --sysroot=3D/OE/build/luneos-styhead/tmp-glibc/=
work/qemux86_64-webos-linux/rng-tools/6.16/recipe-sysroot -o conftest  -O2 =
-pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-=
map=3D/OE/build/luneos-styhead/tmp-glibc/work/qemux86_64-webos-linux/rng-to=
ols/6.16/git=3D/usr/src/debug/rng-tools/6.16  -fdebug-prefix-map=3D/OE/buil=
d/luneos-styhead/tmp-glibc/work/qemux86_64-webos-linux/rng-tools/6.16/git=
=3D/usr/src/debug/rng-tools/6.16  -fmacro-prefix-map=3D/OE/build/luneos-sty=
head/tmp-glibc/work/qemux86_64-webos-linux/rng-tools/6.16/build=3D/usr/src/=
debug/rng-tools/6.16  -fdebug-prefix-map=3D/OE/build/luneos-styhead/tmp-gli=
bc/work/qemux86_64-webos-linux/rng-tools/6.16/build=3D/usr/src/debug/rng-to=
ols/6.16  -fdebug-prefix-map=3D/OE/build/luneos-styhead/tmp-glibc/work/qemu=
x86_64-webos-linux/rng-tools/6.16/recipe-sysroot=3D  -fmacro-prefix-map=3D/=
OE/build/luneos-styhead/tmp-glibc/work/qemux86_64-webos-linux/rng-tools/6.1=
6/recipe-sysroot=3D  -fdebug-prefix-map=3D/OE/build/luneos-styhead/tmp-glib=
c/work/qemux86_64-webos-linux/rng-tools/6.16/recipe-sysroot-native=3D   -DJ=
ENT_CONF_ENABLE_INTERNAL_TIMER   -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-ne=
eded -fcanon-prefix-map  -fmacro-prefix-map=3D/OE/build/luneos-styhead/tmp-=
glibc/work/qemux86_64-webos-linux/rng-tools/6.16/git=3D/usr/src/debug/rng-t=
ools/6.16  -fdebug-prefix-map=3D/OE/build/luneos-styhead/tmp-glibc/work/qem=
ux86_64-webos-linux/rng-tools/6.16/git=3D/usr/src/debug/rng-tools/6.16  -fm=
acro-prefix-map=3D/OE/build/luneos-styhead/tmp-glibc/work/qemux86_64-webos-=
linux/rng-tools/6.16/build=3D/usr/src/debug/rng-tools/6.16  -fdebug-prefix-=
map=3D/OE/build/luneos-styhead/tmp-glibc/work/qemux86_64-webos-linux/rng-to=
ols/6.16/build=3D/usr/src/debug/rng-tools/6.16  -fdebug-prefix-map=3D/OE/bu=
ild/luneos-styhead/tmp-glibc/work/qemux86_64-webos-linux/rng-tools/6.16/rec=
ipe-sysroot=3D  -fmacro-prefix-map=3D/OE/build/luneos-styhead/tmp-glibc/wor=
k/qemux86_64-webos-linux/rng-tools/6.16/recipe-sysroot=3D  -fdebug-prefix-m=
ap=3D/OE/build/luneos-styhead/tmp-glibc/work/qemux86_64-webos-linux/rng-too=
ls/6.16/recipe-sysroot-native=3D  conftest.c -ljitterentropy  >&5
conftest.c: In function 'main':
conftest.c:51:52: error: passing argument 3 of 'argp_parse' from incompatib=
le pointer type [-Wincompatible-pointer-types]
   51 | int argc=3D1; char *argv=3D{"test"}; argp_parse(0,argc,argv,0,0,0);=
 return 0;
      |                                                    ^~~~
      |                                                    |
      |                                                    char *
In file included from conftest.c:47:
/OE/build/luneos-styhead/tmp-glibc/work/qemux86_64-webos-linux/rng-tools/6.=
16/recipe-sysroot/usr/include/argp.h:371:58: note: expected 'char ** restri=
ct' but argument is of type 'char *'
  371 |                            int __argc, char **__restrict __argv,
      |                                        ~~~~~~~~~~~~~~~~~~^~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 78d9cad294f335f6e5b18b0ca790a9e5723f0c41)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/rng-tools/rng-tools_6.16.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipe=
s-support/rng-tools/rng-tools_6.16.bb
index f0aa3ff93f..5b66e3badf 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
@@ -67,3 +67,7 @@ do_install:append() {
             ${D}${systemd_system_unitdir}/rng-tools.service
     fi
 }
+
+# libargp detection fails
+# http://errors.yoctoproject.org/Errors/Details/766951/
+CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
--=20
2.34.1


