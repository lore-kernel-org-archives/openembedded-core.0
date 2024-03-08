Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72627C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 20:59:35 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.4345.1709931574293206376
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 12:59:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id 9034913C71
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Mar 2024 21:59:31 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.68]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rihJS-0gvpQH0; Fri, 8 Mar 2024 21:59:30 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] mesa: fix opencl-spirv build
Date: Fri,  8 Mar 2024 21:59:33 +0100
Message-ID: <20240308205933.3045560-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709931570-D5FF893F-4B46715A/0/0 CLEAN NORMAL
X-TOI-MSGID: 9421c5bd-60f4-4d87-8f84-98a2698faa73
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 20:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196861

https://gitlab.freedesktop.org/mesa/mesa/-/commit/815a6647eb1383e9dc704ff=
cc266d85f3b13338a
adds a regression and breaks opencl-spirv build.

The next step in mesa will probably be to completely remove nir in favour=
 of rusticl.
https://gitlab.freedesktop.org/mesa/mesa/-/issues/10674

Revert this commit to avoid that the lts version cannot use spirv
because rusticl is not yet and opencl-spirv is no longer supported.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-meson-do-not-pull-in-clc-for-clover.patch | 56 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do=
-not-pull-in-clc-for-clover.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pu=
ll-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert=
-meson-do-not-pull-in-clc-for-clover.patch
new file mode 100644
index 0000000000..6ed203ec3e
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-c=
lc-for-clover.patch
@@ -0,0 +1,56 @@
+From fe4600de549549fbb3033fc1b37904ba6b3fe2af Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Fri, 8 Mar 2024 15:53:11 +0100
+Subject: [PATCH] Revert "meson: do not pull in clc for clover"
+
+This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
+Upstream-Status: Inappropriate[https://gitlab.freedesktop.org/mesa/mesa/=
-/merge_requests/27783/diffs?commit_id=3Da976f2c9f0c07f9e06cc9affd9124b45=
bc60c2bd]
+
+Once the merge request above was added, it will only be possible to prov=
ide opencl spir-v with gallium-rusticl=3Dtrue. This is not yet supported =
in the mesa recipe.
+For now reverting this commit allows to still use clover with opencl-spi=
rv, which would otherwise be broken starting from mesa 24.0.2.
+
+After it was merged, this patch needs to be removed and rusticl support =
will be required
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build              | 3 ++-
+ src/compiler/meson.build | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 25e92ea5f95..3956e19c08f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -818,6 +818,7 @@ if _opencl !=3D 'disabled'
+     error('The Clover OpenCL state tracker requires rtti')
+   endif
+=20
++  with_clc =3D true
+   with_gallium_opencl =3D true
+   with_opencl_icd =3D _opencl =3D=3D 'icd'
+ else
+@@ -842,7 +843,7 @@ if with_gallium_rusticl
+ endif
+=20
+ dep_clc =3D null_dep
+-if with_gallium_opencl or with_clc
++if with_clc
+   dep_clc =3D dependency('libclc')
+ endif
+=20
+diff --git a/src/compiler/meson.build b/src/compiler/meson.build
+index 8d73544c6d8..1dae56d1b2b 100644
+--- a/src/compiler/meson.build
++++ b/src/compiler/meson.build
+@@ -79,7 +79,7 @@ subdir('nir')
+=20
+ subdir('spirv')
+=20
+-if with_clc
++if with_opencl_spirv
+   subdir('clc')
+ endif
+ if with_gallium
+--=20
+2.44.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 12d7a18eb8..f5a6392d28 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,6 +20,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-=
${PV}.tar.xz \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
            file://0001-drisw-fix-build-without-dri3.patch \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patc=
h \
+           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch =
\
 "
=20
 SRC_URI[sha256sum] =3D "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f9397=
02e1b3039b56c9e8"
--=20
2.44.0


