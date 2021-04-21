Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.10791.1619003280021422053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 04:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bcUnKguN;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id z5so12358047edr.11
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 04:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzusaY/h5YLKPQc8PFAVIX4FzR5BluXpy2QHA3VCPdg=;
        b=bcUnKguNXzRz36S8kqLp1vr6a3J38KYe1TTca+nqhQ3yMND20TF3/cqd3gjoPqmuy9
         izzMlE47/LUZqHXXaCms46bMmDe7JwXX63s8JRdPXefuKZwp79I/vi/owVsPcWCDv2iv
         yCzeYXoumYZ6g8P/sV7Wv1pgO2fY4pNgeDXx6aQrbngiMV7Oefb0JCVEEk1Kyn+nI3R/
         jyN+dNXjrdQRE4j6bglswfyWrWGhvKawq8D8i4kPgfDsTMPm7KxHTTiBn9numousy3ia
         l5p6sHo62p1NfrRXB12IN6f3KpaMmRcu7TJ6V6yLkaW9naFxaQm0wrTUxB1GAoURINFH
         osZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzusaY/h5YLKPQc8PFAVIX4FzR5BluXpy2QHA3VCPdg=;
        b=OS8Hi10cP9wUOMljNTRlx3KN51qzI7w4gMmVS1GOmEENr7Fp6ql9vAmGmAge4wdgpv
         A5wH5xGYMQAEjHcxZv+ArkArld2n4YOIm5pQF+Y4Z1+yaZRu21X1KueoNmw53PbSDn23
         ue5lCogRRbg/Ghv6FB+0ORTyDsSIOqwcyRyVyYvuRfEn317b6W5INaQkuBeaXV8sgH5Q
         jUMACdUxpv7nlkj4y1MtZqVAMHV4VrhQF5EEXzUkX6Kp4xVY42sp60IHHA0KaD3xVsNS
         1DSn0Qb4Sjgi5caRycmTxY3RmnUUX65e+n4MPFx4whm6OasySfO5AltKz1TZluhLdYzD
         9o0Q==
X-Gm-Message-State: AOAM5332f+Qquiln+/8BtA/MLtGax9AGFlTN6J9PohlMNQi+TaRLV79M
	6+mw0nsTCY1Ro3cvKFdYN+TEjCly2M8=
X-Google-Smtp-Source: ABdhPJwg0BcFdaTJqddSyqC/SUKehcfL7e6zBMHn6lCGkZscn8HF0liIbMPDq3NBdKNEBDI8JPlJmA==
X-Received: by 2002:aa7:c957:: with SMTP id h23mr37341031edt.301.1619003278501;
        Wed, 21 Apr 2021 04:07:58 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x20sm2771219edd.58.2021.04.21.04.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 04:07:57 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] ofono: prevent using bundled ell headers and fix build with ell-0.39
Date: Wed, 21 Apr 2021 13:07:56 +0200
Message-Id: <20210421110756.2760060-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* -I../ofono-1.31 is included when building drivers/mbimmodem/mbim.c and th=
en
  ell.h will happily include ell/util.h from there:

  # 1 "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/ofono/1.31-r0/rec=
ipe-sysroot/usr/include/ell/ell.h" 1 3 4
  # 23 "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/ofono/1.31-r0/re=
cipe-sysroot/usr/include/ell/ell.h" 3 4
  # 1 "../ofono-1.31/ell/util.h" 1 3 4
  # 26 "../ofono-1.31/ell/util.h" 3 4
  # 1 "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/ofono/1.31-r0/rec=
ipe-sysroot/usr/include/string.h" 1 3 4
  # 26 "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/ofono/1.31-r0/re=
cipe-sysroot/usr/include/string.h" 3 4
  # 1 "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/ofono/1.31-r0/rec=
ipe-sysroot/usr/include/bits/libc-header-start.h" 1 3 4
  # 27 "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/ofono/1.31-r0/re=
cipe-sysroot/usr/include/string.h" 2 3 4

* and it gets more interesting because unlikely() macro was dropped from el=
l/util.h in:
  https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=3D2a682421b06e=
41c45098217a686157f576847021
  and ofono builds from git (which doesn't bundle ell) were failing with:

drivers/mbimmodem/mbim-message.c: In function 'message_iter_next_entry_vali=
st':
drivers/mbimmodem/mbim-message.c:504:8: warning: implicit declaration of fu=
nction 'unlikely' [-Wimplicit-function-declaration]
  504 |    if (unlikely(indent > MAX_NESTING))
      |        ^~~~~~~~
...
x86_64-webos-linux-libtool: link: x86_64-webos-linux-gcc -m64 -march=3Dcore=
2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/OE/build/luneos-honiste=
r/webos-ports/tmp-glibc/work/core2-64-webos-linux/ofono/1.31+gitAUTOINC+0db=
662bd6b-r0/recipe-sysroot -I/OE/build/luneos-honister/webos-ports/tmp-glibc=
/work/core2-64-webos-linux/ofono/1.31+gitAUTOINC+0db662bd6b-r0/recipe-sysro=
ot/usr/include/dbus-1.0 -I/OE/build/luneos-honister/webos-ports/tmp-glibc/w=
ork/core2-64-webos-linux/ofono/1.31+gitAUTOINC+0db662bd6b-r0/recipe-sysroot=
/usr/lib/dbus-1.0/include -I/OE/build/luneos-honister/webos-ports/tmp-glibc=
/work/core2-64-webos-linux/ofono/1.31+gitAUTOINC+0db662bd6b-r0/recipe-sysro=
ot/usr/include/glib-2.0 -I/OE/build/luneos-honister/webos-ports/tmp-glibc/w=
ork/core2-64-webos-linux/ofono/1.31+gitAUTOINC+0db662bd6b-r0/recipe-sysroot=
/usr/lib/glib-2.0/include -DOFONO_PLUGIN_BUILTIN -DPLUGINDIR=3D\"/usr/lib/o=
fono/plugins\" -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-m=
ap=3D/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-li=
nux/ofono/1.31+gitAUTOINC+0db662bd6b-r0=3D/usr/src/debug/ofono/1.31+gitAUTO=
INC+0db662bd6b-r0 -fdebug-prefix-map=3D/OE/build/luneos-honister/webos-port=
s/tmp-glibc/work/core2-64-webos-linux/ofono/1.31+gitAUTOINC+0db662bd6b-r0=
=3D/usr/src/debug/ofono/1.31+gitAUTOINC+0db662bd6b-r0 -fdebug-prefix-map=3D=
/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/o=
fono/1.31+gitAUTOINC+0db662bd6b-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/=
OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/of=
ono/1.31+gitAUTOINC+0db662bd6b-r0/recipe-sysroot-native=3D -Wl,-O1 -Wl,--ha=
sh-style=3Dgnu -Wl,--as-needed -o unit/test-mbim unit/test-mbim.o drivers/m=
bimmodem/mbim-message.o drivers/mbimmodem/mbim.o  -lell
drivers/mbimmodem/mbim-message.c:1389: error: undefined reference to 'unlik=
ely'
drivers/mbimmodem/mbim-message.c:1255: error: undefined reference to 'unlik=
ely'
drivers/mbimmodem/mbim-message.c:514: error: undefined reference to 'unlike=
ly'
drivers/mbimmodem/mbim-message.c:504: error: undefined reference to 'unlike=
ly'
collect2: error: ld returned 1 exit status

  while build from 1.31 tarball was passing OK, because using this older
  bundled ell/util.h

  delete bundled ell as we always enable external ell to make sure this
  doesn't happen again and fix mbimmodem to build with ell-0.39

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ith-ell-0.39-by-restoring-unlikely-m.patch | 28 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.31.bb | 10 +++++--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-bui=
ld-with-ell-0.39-by-restoring-unlikely-m.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with=
-ell-0.39-by-restoring-unlikely-m.patch b/meta/recipes-connectivity/ofono/o=
fono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
new file mode 100644
index 0000000000..3655b3fd66
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.=
39-by-restoring-unlikely-m.patch
@@ -0,0 +1,28 @@
+From 76e4054801350ebd4a44057379431a33d460ad0f Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 21 Apr 2021 11:01:34 +0000
+Subject: [PATCH] mbim: Fix build with ell-0.39 by restoring unlikely macro
+ from ell/util.h
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ drivers/mbimmodem/mbim-private.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/drivers/mbimmodem/mbim-private.h b/drivers/mbimmodem/mbim-pri=
vate.h
+index 51693eae..d917312c 100644
+--- a/drivers/mbimmodem/mbim-private.h
++++ b/drivers/mbimmodem/mbim-private.h
+@@ -30,6 +30,10 @@
+   __result; })
+ #endif
+=20
++/* used to be part of ell/util.h before 0.39:
++   https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=3D2a682421b=
06e41c45098217a686157f576847021 */
++#define unlikely(x) __builtin_expect(!!(x), 0)
++
+ enum mbim_control_message {
+ 	MBIM_OPEN_MSG =3D 0x1,
+ 	MBIM_CLOSE_MSG =3D 0x2,
diff --git a/meta/recipes-connectivity/ofono/ofono_1.31.bb b/meta/recipes-c=
onnectivity/ofono/ofono_1.31.bb
index 7d0976ad7f..2425ef76a6 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.31.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.31.bb
@@ -11,6 +11,7 @@ SRC_URI =3D "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
+    file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch=
 \
 "
 SRC_URI[md5sum] =3D "1c26340e3c6ed132cc812595081bb3dc"
 SRC_URI[sha256sum] =3D "a15c5d28096c10eb30e47a68b6dc2e7c4a5a99d7f4cfedf0b6=
9624f33d859e9b"
@@ -30,9 +31,14 @@ PACKAGECONFIG[bluez] =3D "--enable-bluetooth, --disable-=
bluetooth, bluez5"
=20
 EXTRA_OECONF +=3D "--enable-test --enable-external-ell"
=20
+do_configure_prepend() {
+    bbnote "Removing bundled ell from ${S}/ell to prevent including it"
+    rm -rf ${S}/ell
+}
+
 do_install_append() {
-  install -d ${D}${sysconfdir}/init.d/
-  install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
+    install -d ${D}${sysconfdir}/init.d/
+    install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
 }
=20
 PACKAGES =3D+ "${PN}-tests"
--=20
2.30.2

