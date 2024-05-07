Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EB5C25B10
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 01:15:01 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.1137.1715044499083448616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 18:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HbXjJQfw;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ec4dd8525cso19658615ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 18:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715044498; x=1715649298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b59gsBUjUTJqjxXppMCuN9kYgMNyUvhX99uKasjW/N8=;
        b=HbXjJQfwTEm9w0pXUds0kkkqB7Heu6l1sA8lu1Ij8ToxlJVwp5g+1Qjkc8LExp/kSJ
         EeS/4iKcIyj5BuIhuWNiKDPD8yQuGqXuR5rPo6cRDrcSKF10oy9OSFLXTFLL0ceFC+lL
         gnvADxpPJGNqan8j0us1pMErE51Ffc40FiDNb59C2OLrXrMRD/2v/f1y0DUIqcQVo+Hr
         X/V3PfIEoXeyzAkP+gj+7rEsnPGLtOHVwOrfB+9o0a7Bzn/z6TtZJn11pImHbJVZKj3b
         OikxEmr1Z2lV8NnJMkBJwvuSLy+iw3xl+nbZ9Z+dxz/nT39BqVtLRoOXTepP/lixPMqc
         /pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715044498; x=1715649298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b59gsBUjUTJqjxXppMCuN9kYgMNyUvhX99uKasjW/N8=;
        b=H1luj5xEBG19uyg24Pgha4J6Fduh1MCYEHZ2CGRJL7hRHD8EDSqEj+k/eTIuJ8bOuj
         9ISzdSsAXwUCPw4jq0c1A3BuSKv1Mll/wnwt+nqUKbpFLitDHv552X/AHQOKrmTH6xq3
         UtJy5JRqZ8i/O5A+2PLfgfxKJUR9hfbUCFfyRdbLs7HKa4dC0ISkyys5XoD1isyqGcOl
         hCxjq3mRBlKr8i0KCwm71Wcbn7np3k9g/AoO9uPaxvsttoxrPLPQUDDCnuMjz+6Y2xmn
         vLLzCobm8l50a/xhCNWoFEHVRx2qI2uVIi8Tmj0qZ0RINoqXFgS63/DSkwWwhItuT5gH
         BUgQ==
X-Gm-Message-State: AOJu0Yz6DxiHNxHM7VbDfqfwUZKsHDCLed+iY2lbauslIl0OSBJ61KmJ
	fdPxtr7vihxioViqPsMEJwDihIFzcf54mwNkrUZyLVPDuEgimB5Mg8VrExE0
X-Google-Smtp-Source: AGHT+IHujG8lGdEvOfWCihKhkgTVMD5KdO3QAJa4HjL2W/y3/OThzmm+lMSESHkNF0vsm2SBH60new==
X-Received: by 2002:a17:902:bb8b:b0:1e4:5b89:dbfa with SMTP id m11-20020a170902bb8b00b001e45b89dbfamr8861607pls.41.1715044498125;
        Mon, 06 May 2024 18:14:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902d50b00b001eb2f4648d3sm8830898plg.228.2024.05.06.18.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:14:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 01/10] rng-tools: ignore incompatible-pointer-types errors for now
Date: Mon,  6 May 2024 18:14:46 -0700
Message-ID: <20240507011455.313230-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 01:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199048

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


