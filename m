Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web09.7692.1604187095380743369
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 16:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hFEbIK7C;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id 7so13609160ejm.0
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 16:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xhsH8CGgjQY0Iodi1PV6ufyfyH5BbL1kyNtNOb3w3vs=;
        b=hFEbIK7CkEf72xYpdtNC18XIX6UPipOnALoGguyezRKzJ8USOhuLkBiCXffeIrzZWQ
         fWNUZhGslXPp4kEC9W6KxW6Serfw2HiraGvXdU5JMIRY85BsAMlYpZOoUJznGpgMDarW
         5SSRa7wW7ORcDgm9pf6OblyFKdlbKUb+9A4LuHaWbYg7iABCi2CDGFllzciaOMxoQpsV
         k2E5LTq92E6Q5vWE5az2KwdWQxeuJMGMYTpa1bAOq5HxaancyLkDUvYBkdJYW4BNe4ZC
         q3eO6fjLWtP6ZVWS7RSMq09hAIrC1MthW6oESp8/XRHPKMDMiRLSStBC9v+Mpyi6jWqr
         43wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xhsH8CGgjQY0Iodi1PV6ufyfyH5BbL1kyNtNOb3w3vs=;
        b=p8IoOUS1/yWvzI9VdnDTq2ce6PI5iNJnep1Wd4k42BMrS73euCPCrE+OC0HEbFnG9C
         lQD96buEY490uGNwC6ARcZ4h11VgYPAiYeI+Y1WX+gq3rgAUGEq0M35lH9DfeAH5PMwC
         0/brvL/q+nz7kXewnBzlD04MLJAJafZtzvujnMQK/M86k7doGPjWo3EtWccOh7VSOtyz
         u4nCxnj3xLn2GN3cufI4k0xI1+9VvUkS5VIz4YWW6lJOWkPSMQuQb9dEXdhwT6gXMTvm
         kx0tmepmAFPDvYWFz0Z5A+DePDoISqFDusOspdUxHzU9ligvW0oePfoFyIySdr3fggc9
         AOAw==
X-Gm-Message-State: AOAM531y3S/1/2mQsPO/iFly+40GScxlmEBPXov82VOMNe4RjBF6llJe
	sNaJxKM/0p7h29K7/FJz5il1089RZ7Y=
X-Google-Smtp-Source: ABdhPJwmMD28MMavirqVexdWmS9Xq5UCZUFQr7y5cdVFn6h5iwROx/J32sI9psDb7j6to2UVKka7Lw==
X-Received: by 2002:a17:906:370e:: with SMTP id d14mr9376974ejc.259.1604187093232;
        Sat, 31 Oct 2020 16:31:33 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 65sm4556109edj.83.2020.10.31.16.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 16:31:32 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] gnutls: explicitly set --with-librt-prefix
Date: Sun,  1 Nov 2020 00:31:30 +0100
Message-Id: <20201031233130.4016294-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* it will try to link with librt from host and if you have it on host (libc=
6-dev-i386 in ubuntu)
  it fails with:
  /usr/lib32/librt.so: error: undefined reference to '__clock_settime', ver=
sion 'GLIBC_PRIVATE'
  /usr/lib32/librt.so: error: undefined reference to '__clock_getcpuclockid=
', version 'GLIBC_PRIVATE'
  /usr/lib32/librt.so: error: undefined reference to '__clock_getres', vers=
ion 'GLIBC_PRIVATE'
  /usr/lib32/librt.so: error: undefined reference to '__clock_nanosleep', v=
ersion 'GLIBC_PRIVATE'
  collect2: error: ld returned 1 exit status

  in older 3.6.14 it was using /usr/lib32/librt.so from host as well, but w=
ithout do_compile
  failing

  configure:17539: checking for librt
  configure:17563: i686-oe-linux-gcc  -m32 -march=3Dcore2 -mtune=3Dcore2 -m=
sse3 -mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wforma=
t -Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysro=
ot=3D/tmpdir/work/qemux86-oe-linux/gnutls/3.6.14-r0/recipe-sysroot -o conft=
est  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/tmpd=
ir/work/qemux86-oe-linux/gnutls/3.6.14-r0=3D/usr/src/debug/gnutls/3.6.14-r0=
                      -fdebug-prefix-map=3D/tmpdir/work/qemux86-oe-linux/gn=
utls/3.6.14-r0=3D/usr/src/debug/gnutls/3.6.14-r0                      -fdeb=
ug-prefix-map=3D/tmpdir/work/qemux86-oe-linux/gnutls/3.6.14-r0/recipe-sysro=
ot=3D                      -fdebug-prefix-map=3D/tmpdir/work/qemux86-oe-lin=
ux/gnutls/3.6.14-r0/recipe-sysroot-native=3D    -Wl,-O1 -Wl,--hash-style=3D=
gnu -Wl,--as-needed -Wl,-z,relro,-z,now conftest.c /usr/lib32/librt.so  >&5
  configure:17563: $? =3D 0
  configure:17573: result: yes
  configure:17580: checking how to link with librt
  configure:17582: result: /usr/lib32/librt.so

  with --with-librt-prefix passed, it finds the right one as shown in build=
/config.log:

  configure:17551: checking for librt
  configure:17575: i686-oe-linux-gcc  -m32 -march=3Dcore2 -mtune=3Dcore2 -m=
sse3 -mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wforma=
t -Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysro=
ot=3D/tmpdir/work/qemux86-oe-linux/gnutls/3.6.15-r0/recipe-sysroot -o conft=
est  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/tmpd=
ir/work/qemux86-oe-linux/gnutls/3.6.15-r0=3D/usr/src/debug/gnutls/3.6.15-r0=
                      -fdebug-prefix-map=3D/tmpdir/work/qemux86-oe-linux/gn=
utls/3.6.15-r0=3D/usr/src/debug/gnutls/3.6.15-r0                      -fdeb=
ug-prefix-map=3D/tmpdir/work/qemux86-oe-linux/gnutls/3.6.15-r0/recipe-sysro=
ot=3D                      -fdebug-prefix-map=3D/tmpdir/work/qemux86-oe-lin=
ux/gnutls/3.6.15-r0/recipe-sysroot-native=3D   -I/tmpdir/work/qemux86-oe-li=
nux/gnutls/3.6.15-r0/recipe-sysroot/usr/include -Wl,-O1 -Wl,--hash-style=3D=
gnu -Wl,--as-needed -Wl,-z,relro,-z,now conftest.c /tmpdir/work/qemux86-oe-=
linux/gnutls/3.6.15-r0/recipe-sysroot/usr/lib/librt.so  >&5
  configure:17575: $? =3D 0
  configure:17585: result: yes
  configure:17592: checking how to link with librt
  configure:17594: result: /tmpdir/work/qemux86-oe-linux/gnutls/3.6.15-r0/r=
ecipe-sysroot/usr/lib/librt.so

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/gnutls/gnutls_3.6.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.15.bb b/meta/recipes-su=
pport/gnutls/gnutls_3.6.15.bb
index 71118bd389..b936db50d1 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.15.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.15.bb
@@ -43,6 +43,7 @@ EXTRA_OECONF =3D " \
     --enable-local-libopts \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=3D${STAGING_DIR_HOST}${prefix} \
+    --with-librt-prefix=3D${STAGING_DIR_HOST}${prefix} \
     --with-default-trust-store-file=3D${sysconfdir}/ssl/certs/ca-certifica=
tes.crt \
 "
=20
--=20
2.27.0

