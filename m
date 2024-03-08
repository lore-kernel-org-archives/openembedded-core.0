Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821E8C54E41
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 21:14:05 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.4653.1709932443143303332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 13:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout02.t-online.de (Postfix) with SMTP id 5D7FBD2D7
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Mar 2024 22:13:59 +0100 (CET)
Received: from [192.168.178.67] ([84.154.167.68]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rihXS-05kNNo0; Fri, 8 Mar 2024 22:13:59 +0100
Date: Fri, 08 Mar 2024 22:14:04 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCHv3] mesa: fix opencl-spirv build
To: openembedded-core@lists.openembedded.org
Message-Id: <GBS1AS.QGB2MTSKB8G21@t-online.de>
In-Reply-To: <17BAE66374BBB9A0.18303@lists.openembedded.org>
References: <17BAE66374BBB9A0.18303@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-U2mHlByTPbFtiGQVxRFa"
X-TOI-EXPURGATEID: 150726::1709932439-FE303990-0CB2FE61/0/0 CLEAN NORMAL
X-TOI-MSGID: da7feb90-3302-497a-81d5-f768e6b3c26d
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 21:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196863

--=-U2mHlByTPbFtiGQVxRFa
Content-Type: text/plain; charset=us-ascii; format=flowed

v3 fixes an error because of a missing space

Please correct according to 
<https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status> 
:
Upstream-Status: 
Inappropriate[<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?commit_id=a976f2c9f0c07f9e06cc9affd9124b45bc60c2bd>] 
[patch-status]

On Fri, Mar 8 2024 at 01:12:03 PM -08:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> <https://gitlab.freedesktop.org/mesa/mesa/-/commit/815a6647eb1383e9dc704ffcc266d85f3b13338a>
> adds a regression and breaks opencl-spirv build.
> 
> The next step in mesa will probably be to completely remove nir in 
> favour of rusticl.
> <https://gitlab.freedesktop.org/mesa/mesa/-/issues/10674>
> 
> Revert this commit to avoid that the lts version cannot use spirv
> because rusticl is not yet and opencl-spirv is no longer supported.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...-meson-do-not-pull-in-clc-for-clover.patch | 56 
> +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 
> meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> 
> diff --git 
> a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch 
> b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> new file mode 100644
> index 0000000000..f6d95c8982
> --- /dev/null
> +++ 
> b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> @@ -0,0 +1,56 @@
> +From fe4600de549549fbb3033fc1b37904ba6b3fe2af Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Fri, 8 Mar 2024 15:53:11 +0100
> +Subject: [PATCH] Revert "meson: do not pull in clc for clover"
> +
> +This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
> +Upstream-Status: Inappropriate 
> [<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?commit_id=a976f2c9f0c07f9e06cc9affd9124b45bc60c2bd>]
> +
> +Once the merge request above was added, it will only be possible to 
> provide opencl spir-v with gallium-rusticl=true. This is not yet 
> supported in the mesa recipe.
> +For now reverting this commit allows to still use clover with 
> opencl-spirv, which would otherwise be broken starting from mesa 
> 24.0.2.
> +
> +After it was merged, this patch needs to be removed and rusticl 
> support will be required
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +---
> + meson.build              | 3 ++-
> + src/compiler/meson.build | 2 +-
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 25e92ea5f95..3956e19c08f 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -818,6 +818,7 @@ if _opencl != 'disabled'
> +     error('The Clover OpenCL state tracker requires rtti')
> +   endif
> +
> ++  with_clc = true
> +   with_gallium_opencl = true
> +   with_opencl_icd = _opencl == 'icd'
> + else
> +@@ -842,7 +843,7 @@ if with_gallium_rusticl
> + endif
> +
> + dep_clc = null_dep
> +-if with_gallium_opencl or with_clc
> ++if with_clc
> +   dep_clc = dependency('libclc')
> + endif
> +
> +diff --git a/src/compiler/meson.build b/src/compiler/meson.build
> +index 8d73544c6d8..1dae56d1b2b 100644
> +--- a/src/compiler/meson.build
> ++++ b/src/compiler/meson.build
> +@@ -79,7 +79,7 @@ subdir('nir')
> +
> + subdir('spirv')
> +
> +-if with_clc
> ++if with_opencl_spirv
> +   subdir('clc')
> + endif
> + if with_gallium
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc 
> b/meta/recipes-graphics/mesa/mesa.inc
> index 12d7a18eb8..f5a6392d28 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -20,6 +20,7 @@ SRC_URI = 
> "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-gallium-Fix-build-with-llvm-17.patch 
> <file://0001-gallium-fix-build-with-llvm-17.patch/> \
>             file://0001-drisw-fix-build-without-dri3.patch 
> <file://0001-drisw-fix-build-without-dri3.patch/> \
>             
> file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch 
> <file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch/> \
> +           
> file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch 
> <file://0001-revert-meson-do-not-pull-in-clc-for-clover.patch/> \
>  "
> 
>  SRC_URI[sha256sum] = 
> "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8"
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196862): 
> <https://lists.openembedded.org/g/openembedded-core/message/196862>
> Mute This Topic: <https://lists.openembedded.org/mt/104817623/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-U2mHlByTPbFtiGQVxRFa
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>v3 fixes an error because of a mis=
sing space</div><div><br></div><div><div>Please correct according to <a hre=
f=3D"https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.htm=
l#patch-upstream-status">https://docs.yoctoproject.org/contributor-guide/re=
cipe-style-guide.html#patch-upstream-status</a> :</div><div>Upstream-Status=
: Inappropriate[<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge=
_requests/27783/diffs?commit_id=3Da976f2c9f0c07f9e06cc9affd9124b45bc60c2bd"=
>https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?comm=
it_id=3Da976f2c9f0c07f9e06cc9affd9124b45bc60c2bd</a>] [patch-status]</div><=
/div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Fri, Mar 8 2024 at 0=
1:12:03 PM -08:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><bloc=
kquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-s=
paces;"><a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/815a66=
47eb1383e9dc704ffcc266d85f3b13338a">https://gitlab.freedesktop.org/mesa/mes=
a/-/commit/815a6647eb1383e9dc704ffcc266d85f3b13338a</a>
adds a regression and breaks opencl-spirv build.

The next step in mesa will probably be to completely remove nir in favour o=
f rusticl.
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues/10674">https:/=
/gitlab.freedesktop.org/mesa/mesa/-/issues/10674</a>

Revert this commit to avoid that the lts version cannot use spirv
because rusticl is not yet and opencl-spirv is no longer supported.

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 ...-meson-do-not-pull-in-clc-for-clover.patch | 56 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do-n=
ot-pull-in-clc-for-clover.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull=
-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-mes=
on-do-not-pull-in-clc-for-clover.patch
new file mode 100644
index 0000000000..f6d95c8982
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc=
-for-clover.patch
@@ -0,0 +1,56 @@
+From fe4600de549549fbb3033fc1b37904ba6b3fe2af Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.=
de</a>&gt;
+Date: Fri, 8 Mar 2024 15:53:11 +0100
+Subject: [PATCH] Revert "meson: do not pull in clc for clover"
+
+This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
+Upstream-Status: Inappropriate [<a href=3D"https://gitlab.freedesktop.org/=
mesa/mesa/-/merge_requests/27783/diffs?commit_id=3Da976f2c9f0c07f9e06cc9aff=
d9124b45bc60c2bd">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests=
/27783/diffs?commit_id=3Da976f2c9f0c07f9e06cc9affd9124b45bc60c2bd</a>]
+
+Once the merge request above was added, it will only be possible to provid=
e opencl spir-v with gallium-rusticl=3Dtrue. This is not yet supported in t=
he mesa recipe.
+For now reverting this commit allows to still use clover with opencl-spirv=
, which would otherwise be broken starting from mesa 24.0.2.
+
+After it was merged, this patch needs to be removed and rusticl support wi=
ll be required
+
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
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
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index 12d7a18eb8..f5a6392d28 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,6 +20,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${=
PV}.tar.xz \
            <a href=3D"file://0001-gallium-Fix-build-with-llvm-17.patch">fi=
le://0001-gallium-Fix-build-with-llvm-17.patch</a> \
            <a href=3D"file://0001-drisw-fix-build-without-dri3.patch">file=
://0001-drisw-fix-build-without-dri3.patch</a> \
            <a href=3D"file://0002-glxext-don-t-try-zink-if-not-enabled-in-=
mesa.patch">file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch<=
/a> \
+           <a href=3D"file://0001-Revert-meson-do-not-pull-in-clc-for-clov=
er.patch">file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch</a> =
\
 "
=20
 SRC_URI[sha256sum] =3D "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702=
e1b3039b56c9e8"
<div>--=20
</div>2.44.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#196862): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196862">https://lists.openembedded.org/g/openembedd=
ed-core/message/196862</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104817623/361=
8223">https://lists.openembedded.org/mt/104817623/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-U2mHlByTPbFtiGQVxRFa--


