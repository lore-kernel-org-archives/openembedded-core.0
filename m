Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6788ECCA488
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.30988.1654516894928751584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JPZZ01Rj;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 m39-20020a05600c3b2700b0039c511ebbacso888738wms.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kp2LpERuOJRz4VeT54I69sUUUwv0tZivcQ8zx/iQiQQ=;
        b=JPZZ01Rj2DEvTR707T+artGdsafzbNBTE5HT9ss/4LX42FshwcoSMFY9TDhYuPI3Me
         jxnGteZEZo06td3uRCclSJsxsDHu5XMyCTEGaFh6+tFEw/DgaBNujQmxbkbg9NLhD7Ny
         zLPHIWEQsiJo1YHflXgy5Ko+bIzgCDcc8TJOz7pGnr9x3g9AudtnPSZzkGyh4t1KVl6r
         5L4d8RLOdQjMu3J2gcudWR7WVPiyFa4hArZjyyhTx4zD4V1JjurKvViDQSkq5+CQ8dJk
         xqo5M+316VrzSV0WwT+6se9WJ0ktX9T005csA4uTw7GCgQHifOJ3SLDqdd+CowI+XnZ4
         Yt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kp2LpERuOJRz4VeT54I69sUUUwv0tZivcQ8zx/iQiQQ=;
        b=kcMA58pE4VU/zUf1vj34wkZJda9wrnodVrfztQ+BgVhXYtzmB6Ae7+bYBjX4wGR3pg
         BUNSvI4iYBj94Ih2fIuTr0WSVuG4Hj3XKdEa618uNpyQtn3fZIUV+h/H7IGonuoTjwdb
         Q161MIPbVkbmM5GmIVTqk2rjpk9qzmdNWOL6NpgJvEE8Bhc1sWdJwPxW6xXHskr77riu
         Ds86mi1Idr5EkDhfhRfawsw66FohXLG6pfWJqYvhrpa+cYRTscwnapvNRNEJHyMgCho0
         wdA42CYBp1kCI9TCg1B7nid4ibQHIGsODrsQ4lotjMXfAVhU2qSPIgYIcI0r/7LzSxns
         aRvQ==
X-Gm-Message-State: AOAM530tMMnslMvilBZUq5ryRi2tbsjJyDgYO1Oz4hQlP4ilucNm4JCo
	XWiF2Y2Yv0iVrSII7w2lmZNYQ551seoy7g==
X-Google-Smtp-Source: 
 ABdhPJwYeMJZeN53CIZ5pEKeVKr+nfDFysE7Qs5DA4r+JFlO9i5FK60nxV15jLPlMiLxmwvXjjaXhw==
X-Received: by 2002:a1c:e903:0:b0:397:36b8:795a with SMTP id
 q3-20020a1ce903000000b0039736b8795amr53075101wmc.98.1654516896807;
        Mon, 06 Jun 2022 05:01:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/21] systemd: update 250.5 -> 251.2
Date: Mon,  6 Jun 2022 14:01:12 +0200
Message-Id: <20220606120126.3381438-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166598

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...md-boot_250.5.bb =3D> systemd-boot_251.2.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  8 ++--
 ...e-Use-sockaddr-pointer-type-for-bind.patch | 46 -------------------
 ...7ca2ab96d085158485ecfc46c7cb6af0f166.patch | 41 +++++++++++++++++
 .../{systemd_250.5.bb =3D> systemd_251.2.bb}    |  1 -
 5 files changed, 46 insertions(+), 50 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_250.5.bb =3D> systemd-boot_=
251.2.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-resolve-Use-sock=
addr-pointer-type-for-bind.patch
 create mode 100644 meta/recipes-core/systemd/systemd/38c87ca2ab96d08515848=
5ecfc46c7cb6af0f166.patch
 rename meta/recipes-core/systemd/{systemd_250.5.bb =3D> systemd_251.2.bb} =
(99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_250.5.bb b/meta/recipes=
-core/systemd/systemd-boot_251.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_250.5.bb
rename to meta/recipes-core/systemd/systemd-boot_251.2.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index 309105290f..b8dbe2263a 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,8 +14,10 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa=
882bbe \
                     file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b=
364516c"
=20
-SRCREV =3D "4a31fa2fb040005b73253da75cf84949b8485175"
-SRCBRANCH =3D "v250-stable"
-SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttps;=
branch=3D${SRCBRANCH}"
+SRCREV =3D "253052686cbd840ac69030d31c4b186af23aba4c"
+SRCBRANCH =3D "v251-stable"
+SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttps;=
branch=3D${SRCBRANCH} \
+           file://38c87ca2ab96d085158485ecfc46c7cb6af0f166.patch \
+"
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-resolve-Use-sockaddr-po=
inter-type-for-bind.patch b/meta/recipes-core/systemd/systemd/0001-resolve-=
Use-sockaddr-pointer-type-for-bind.patch
deleted file mode 100644
index 8567283537..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-resolve-Use-sockaddr-pointer-t=
ype-for-bind.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From ad1428f29196bcc88ae382ee67ff705928e2be24 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 5 May 2022 20:25:37 -0700
-Subject: [PATCH] resolve: Use sockaddr pointer type for bind()
-
-bind() expects sockaddr* but SERVER_ADDRESS is sockaddr_in type struct
-
-Fixes errors with clang e.g.
-
-../git/src/resolve/test-resolved-stream.c:112:32: error: incompatible poin=
ter types passing 'struct sockaddr_in *' to parameter of type 'const struct=
 sockaddr *' [-Werror,-Wincompatible-pointer-types]
-        assert_se(bind(bindfd, &SERVER_ADDRESS, sizeof(SERVER_ADDRESS)) >=
=3D 0);
-                               ^~~~~~~~~~~~~~~
-../git/src/resolve/test-resolved-stream.c:251:39: error: incompatible poin=
ter types passing 'struct sockaddr_in *' to parameter of type 'const struct=
 sockaddr *' [-Werror,-Wincompatible-pointer-types]
-                r =3D connect(clientfd, &SERVER_ADDRESS, sizeof(SERVER_ADD=
RESS));
-
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/23281]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/resolve/test-resolved-stream.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/resolve/test-resolved-stream.c b/src/resolve/test-resolve=
d-stream.c
-index f12c729e50..504b532002 100644
---- a/src/resolve/test-resolved-stream.c
-+++ b/src/resolve/test-resolved-stream.c
-@@ -109,7 +109,7 @@ static void *tcp_dns_server(void *p) {
-=20
-         assert_se((bindfd =3D socket(AF_INET, SOCK_STREAM | SOCK_CLOEXEC,=
 0)) >=3D 0);
-         assert_se(setsockopt(bindfd, SOL_SOCKET, SO_REUSEADDR, &(int){1},=
 sizeof(int)) >=3D 0);
--        assert_se(bind(bindfd, &SERVER_ADDRESS, sizeof(SERVER_ADDRESS)) >=
=3D 0);
-+        assert_se(bind(bindfd, (struct sockaddr*)&SERVER_ADDRESS, sizeof(=
SERVER_ADDRESS)) >=3D 0);
-         assert_se(listen(bindfd, 1) >=3D 0);
-         assert_se((acceptfd =3D accept(bindfd, NULL, NULL)) >=3D 0);
-         server_handle(acceptfd);
-@@ -248,7 +248,7 @@ static void test_dns_stream(bool tls) {
-         assert_se((clientfd =3D socket(AF_INET, SOCK_STREAM | SOCK_CLOEXE=
C, 0)) >=3D 0);
-=20
-         for (int i =3D 0; i < 100; i++) {
--                r =3D connect(clientfd, &SERVER_ADDRESS, sizeof(SERVER_AD=
DRESS));
-+                r =3D connect(clientfd, (struct sockaddr*)&SERVER_ADDRESS=
, sizeof(SERVER_ADDRESS));
-                 if (r >=3D 0)
-                         break;
-                 usleep(EVENT_TIMEOUT_USEC / 100);
---=20
-2.36.0
-
diff --git a/meta/recipes-core/systemd/systemd/38c87ca2ab96d085158485ecfc46=
c7cb6af0f166.patch b/meta/recipes-core/systemd/systemd/38c87ca2ab96d0851584=
85ecfc46c7cb6af0f166.patch
new file mode 100644
index 0000000000..2449023083
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/38c87ca2ab96d085158485ecfc46c7cb6af=
0f166.patch
@@ -0,0 +1,41 @@
+From 38c87ca2ab96d085158485ecfc46c7cb6af0f166 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@in=
.waw.pl>
+Date: Fri, 3 Jun 2022 09:32:02 +0200
+Subject: [PATCH] sha256: fix compilation on efi-ia32
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+/usr/bin/gcc -c ../src/fundamental/sha256.c -o src/boot/efi/sha256.c.o -Wn=
o-format-signedness -Wno-missing-field-initializers -Wno-unused-parameter -=
Wdate-time -Wendif-labels -Werror=3Dformat=3D2 -Werror=3Dimplicit-function-=
declaration -Werror=3Dincompatible-pointer-types -Werror=3Dint-conversion -=
Werror=3Doverflow -Werror=3Doverride-init -Werror=3Dreturn-type -Werror=3Ds=
hift-count-overflow -Werror=3Dshift-overflow=3D2 -Werror=3Dundef -Wfloat-eq=
ual -Wimplicit-fallthrough=3D5 -Winit-self -Wlogical-op -Wmissing-include-d=
irs -Wmissing-noreturn -Wnested-externs -Wold-style-definition -Wpointer-ar=
ith -Wredundant-decls -Wshadow -Wstrict-aliasing=3D2 -Wstrict-prototypes -W=
suggest-attribute=3Dnoreturn -Wunused-function -Wwrite-strings -Wno-unused-=
result -fno-stack-protector -fno-strict-aliasing -fpic -fwide-exec-charset=
=3DUCS2 -Wall -Wextra -Wsign-compare -nostdlib -std=3Dgnu99 -ffreestanding =
-fshort-wchar -fvisibility=3Dhidden -isystem /usr/include/efi -isystem /usr=
/include/efi/ia32 -I /builddir/build/BUILD/systemd-stable-250.7/src/fundame=
ntal -DSD_BOOT -DGNU_EFI_USE_MS_ABI -include src/boot/efi/efi_config.h -inc=
lude version.h -mno-sse -mno-mmx -flto -O2 -flto=3Dauto
+../src/fundamental/sha256.c: In function =E2=80=98sha256_finish_ctx=E2=80=
=99:
+../src/fundamental/sha256.c:61:25: error: =E2=80=98false=E2=80=99 undeclar=
ed (first use in this function)
+   61 | # define UNALIGNED_P(p) false
+      |                         ^~~~~
+../src/fundamental/sha256.c:136:21: note: in expansion of macro =E2=80=98U=
NALIGNED_P=E2=80=99
+  136 |                 if (UNALIGNED_P(resbuf))
+      |                     ^~~~~~~~~~~
+../src/fundamental/sha256.c:32:1: note: =E2=80=98false=E2=80=99 is defined=
 in header =E2=80=98<stdbool.h>=E2=80=99; did you forget to =E2=80=98#inclu=
de <stdbool.h>=E2=80=99?
+   31 | #include "sha256.h"
+  +++ |+#include <stdbool.h>
+   32 |
+...
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/fundamental/sha256.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/fundamental/sha256.c b/src/fundamental/sha256.c
+index 67d83b5f1cd6..f08959479643 100644
+--- a/src/fundamental/sha256.c
++++ b/src/fundamental/sha256.c
+@@ -60,7 +60,7 @@
+ #  define UNALIGNED_P(p) (((size_t) p) % sizeof(uint32_t) !=3D 0)
+ # endif
+ #else
+-# define UNALIGNED_P(p) false
++# define UNALIGNED_P(p) sd_false
+ #endif
+=20
+ /* This array contains the bytes used to pad the buffer to the next
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core=
/systemd/systemd_251.2.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_250.5.bb
rename to meta/recipes-core/systemd/systemd_251.2.bb
index 6fac27ee56..80f80849d0 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_251.2.bb
@@ -24,7 +24,6 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to=
-.patch \
-           file://0001-resolve-Use-sockaddr-pointer-type-for-bind.patch \
            "
=20
 # patches needed by musl
--=20
2.30.2


