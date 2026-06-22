Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9C4CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 13:24:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43087.1782134668388048895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 06:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=oNeO1muV;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3970C1BF7
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 06:24:23 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 670333F62B
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782134667; bh=eNWXB4t5cWZpOifj354K6kwKzoey3NVmNaYyyQ6k5Ds=;
	h=From:To:Subject:Date:From;
	b=oNeO1muV1iqPOau8Wv+UnnsW3IEXrLnufaFR+9xG7tbU3cCXgleGA9z2zHx6HmhUf
	 GbZEeSuK/mtRFFNA9nm8KeJFhhbQ6JzIYnOxh0LmICvqoaXoz0nQ5Hz0fqAGNR5b9S
	 ZEnPSkUea2sl6JzWZAoVYHM5RRXQtZ0ZS69HZtFM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] waffle: upgrade 1.8.1 -> 1.8.2
Date: Mon, 22 Jun 2026 14:24:23 +0100
Message-ID: <20260622132423.2346533-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239297

Drop upstreamed patch.

Also remove the obsolete python3 DEPENDS, this hasn't been needed since
the port to Meson.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-c11-threads-fix-build-on-c23.patch   | 51 -------------------
 .../{waffle_1.8.1.bb =3D> waffle_1.8.2.bb}      |  8 +--
 2 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-graphics/waffle/waffle/0001-c11-threads-=
fix-build-on-c23.patch
 rename meta/recipes-graphics/waffle/{waffle_1.8.1.bb =3D> waffle_1.8.2.b=
b} (92%)

diff --git a/meta/recipes-graphics/waffle/waffle/0001-c11-threads-fix-bui=
ld-on-c23.patch b/meta/recipes-graphics/waffle/waffle/0001-c11-threads-fi=
x-build-on-c23.patch
deleted file mode 100644
index 4082a763e16..00000000000
--- a/meta/recipes-graphics/waffle/waffle/0001-c11-threads-fix-build-on-c=
23.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 6b3c46483844faba4dfe7dd90dc2b0cd06e67158 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 10 Nov 2025 19:20:22 -0800
-Subject: [PATCH] c11/threads: fix build on c23
-
-C23/glibc is now including once_init in stdlib.h
-
-https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-=
107b-5a8a15521083@redhat.com/#213088
-
-Conditionally check if glibc already provided c23 definition via stdlib.=
h
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/waffle/-=
/merge_requests/158]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- third_party/threads/threads.h       | 3 ++-
- third_party/threads/threads_posix.c | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/third_party/threads/threads.h b/third_party/threads/threads=
.h
-index b4db50c..cdc7bea 100644
---- a/third_party/threads/threads.h
-+++ b/third_party/threads/threads.h
-@@ -102,8 +102,9 @@ typedef pthread_cond_t  cnd_t;
- typedef pthread_t       thrd_t;
- typedef pthread_key_t   tss_t;
- typedef pthread_mutex_t mtx_t;
-+#ifndef __once_flag_defined
- typedef pthread_once_t  once_flag;
--
-+#endif
- #else
- #error Not supported on this platform.
- #endif
-diff --git a/third_party/threads/threads_posix.c b/third_party/threads/t=
hreads_posix.c
-index bc50825..d93013b 100644
---- a/third_party/threads/threads_posix.c
-+++ b/third_party/threads/threads_posix.c
-@@ -75,11 +75,12 @@ static void *impl_thrd_routine(void *p)
-
- /*--------------- 7.25.2 Initialization functions ---------------*/
- // 7.25.2.1
-+#ifndef __once_flag_defined
- void call_once(once_flag *flag, void (*func)(void))
- {
-     pthread_once(flag, func);
- }
--
-+#endif
-
- /*------------- 7.25.3 Condition variable functions -------------*/
- // 7.25.3.1
diff --git a/meta/recipes-graphics/waffle/waffle_1.8.1.bb b/meta/recipes-=
graphics/waffle/waffle_1.8.2.bb
similarity index 92%
rename from meta/recipes-graphics/waffle/waffle_1.8.1.bb
rename to meta/recipes-graphics/waffle/waffle_1.8.2.bb
index 5d993cf254b..dd31d4057d0 100644
--- a/meta/recipes-graphics/waffle/waffle_1.8.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.8.2.bb
@@ -9,15 +9,11 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4c5154407c2490750dd461c50=
ad94797 \
                     file://include/waffle-1/waffle.h;endline=3D24;md5=3D=
61dbf8697f61c78645e75a93c585b1bf"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=3Dhtt=
ps;branch=3Dmaint-1.8 \
-           file://0001-c11-threads-fix-build-on-c23.patch \
-           "
-SRCREV =3D "49abc7cb5f73cc6852136c91da49ea3a338960e4"
+SRC_URI =3D "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=3Dhtt=
ps;branch=3Dmaint-1.8"
+SRCREV =3D "70dd251e0390401ab9dc4f768ee9665863f4c268"
=20
 inherit meson features_check lib_package bash-completion pkgconfig
=20
-DEPENDS:append =3D " python3"
-
 # This should be overridden per-machine to reflect the capabilities of t=
he GL
 # stack.
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx=
 x11-egl', '', d)} \
--=20
2.43.0


