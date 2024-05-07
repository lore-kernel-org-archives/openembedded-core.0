Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87A9C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:33:32 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.4735.1715060004049845020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BojovoBT;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1edc696df2bso20061035ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715060003; x=1715664803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b59gsBUjUTJqjxXppMCuN9kYgMNyUvhX99uKasjW/N8=;
        b=BojovoBT2qVxNTtzIrTzdThFTQZ3wZcjrIZttJb71OvHozeJgXliB2szTHtGeTxH1t
         7Tq9OJkiM3uoExsNqikd2na1PvQvMChEkqLCAol8NinaHl/yfgMPVtUJcVYdB4h0XJg2
         x4vUk8i+onCYsKl2uuDY55a7wZH3LlzdcBMKtzn/dJUS6z8NX+RB6k7bCivjKJ5JRttE
         5GajuOsUNeQ40UynZcwmjdL3lLQgD2NfAziWwggkeUkLVVld+G/+H9ljqPYVeU2Ob1ov
         tpd5hyoTQd15ER0CeFy2XmzE7DIPUyny/EXCmmCTa3wYh3FVief8CW6rJsaPkgHrRdmD
         dG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715060003; x=1715664803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b59gsBUjUTJqjxXppMCuN9kYgMNyUvhX99uKasjW/N8=;
        b=o2eBRZ6/yqmIXzWHKlO8SRiaWTYKOr+Zf3XHqpJb4EVMuPP7ZjK29FaSBsRSuIPDSt
         9DmUh6mi51yf1QZa73g0Poy/tsuXquqtop4dyafJXmp3aQmLuH7VZrlYi4SaF35Uuq1d
         x05EvVqHwWEDIZIHv1YEGHfcq6y6m9tS+YKhXu4LD/0sy/odsh1ysE2MK+gW8796nu1X
         LaL2nQkwtDG5+r4abuLHUowVcrOyM6G/ddFNMyu1tLZR6Nlyg/vTYwZJdcY4dxic5tb+
         ZbkjGTnZW1u1FBpWsIfx430riiGa87SBCqNHX3Lji2+kht9/moFm4DOQiTB7Ppc1JOrz
         Cobw==
X-Gm-Message-State: AOJu0YyuNCxXl2cr2Fv1EAdDZ5XOxTRgvR1q5mqSc9htgUpXpi8xQaID
	PNs55cE07Vv0yE4OYkxLtjvl7izhrYnygP9VqhcY1uD5gsHuqPAzvDSDIot2
X-Google-Smtp-Source: AGHT+IE4Pk7ObPk4vb0/gPog+vcAAkX0Ziioe6WNJkzIObxnHCFRAVgPjSM4vRvtO2E8IF5k8MLo4w==
X-Received: by 2002:a17:903:190:b0:1e8:c994:b55b with SMTP id z16-20020a170903019000b001e8c994b55bmr18319180plg.7.1715060003042;
        Mon, 06 May 2024 22:33:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001eb4a71cb58sm9221483pla.114.2024.05.06.22.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:33:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 01/11] rng-tools: ignore incompatible-pointer-types errors for now
Date: Mon,  6 May 2024 22:33:12 -0700
Message-ID: <20240507053320.1566814-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199070

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
---
 meta/recipes-support/rng-tools/rng-tools_6.16.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipe=
s-support/rng-tools/rng-tools_6.16.bb
index 10771a999d2..ed755ae7053 100644
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
2.45.0


