Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BC6C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 11:52:06 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.20487.1751543519900961090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 04:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l8GBtyKc;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fabb948e5aso66978526d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 04:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751543519; x=1752148319; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CMuD1Yx/LR8ItfPKa3/680ytBBMXGXjHXf13Jaa7vkk=;
        b=l8GBtyKcnkyUWTDbardAuDmmWBheribEAWUmfg69/q1FoWuVb1uyWS+cESx/Y7ZJbp
         YxlCJRzwkgM4c4pmdbNcp1oe+rf0wQq/5oIxDFQMeRkgAENuJojjhSNwX0TibZI2tl57
         lRE6w5kOw3kWg6HWkI6phTEFupOrz6OOfjSFlBvdnFPV3htW9qiLXopsUfTMkMvUH3xM
         YnGQlLgRU1/av3m8TBqVB1zAuAtxDMn0bRs3IFCR3hhuDB1XVLuSdSiqNbhaxO/WHag0
         ARP4udlgpElOor2fXIMbebMRM9JduPPLY370tKY2jyk9NGD5UQ6Yy8jJ8oHzsBblPVQ4
         2kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751543519; x=1752148319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMuD1Yx/LR8ItfPKa3/680ytBBMXGXjHXf13Jaa7vkk=;
        b=Y39GAmhRPsHTqQ1ZidVYtkJBx5yus0FmUQHvTQ564Wij6Cs9Ddj49wrKcg7Ipu8raU
         hqRvyfeLRjHxy7LXtht16kYVweW2FrOobfZxz17dXIL9N7PBspEK+Kds9yAzRvHD4+lw
         5Yzuq+epZt7Nla6aPHaTRiX4F3zMrPi6QlgXzjD/VXDmpmaSikU8hZ3Oy5cYArfKMEAu
         umOC5p3dDdvJjqzTUKpfZFnplNZL0KQZfkEJdr9gpWePLPrPpCOz+gLldykyVZOvYj2L
         J+i1OdTlhALA7O8iBNe3eDE+aWmFCEsEbLuYxBti74IM+4jyNTvIjVIBz0UkFYYn+w2K
         pN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUISGBtrrb2vdHupuZw124pRoW1hgC5Cn+NFqBD8pr6wwvmhnDBWJRIhYwK+eoXgdMfV0w/vZmXq/j94y0iWWYYnQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyO3C2iw8sVjtakVvZaT9e9FLg+sX2RmfWtN3s2mF1XCQFik0c7
	Sn/7ldwcY9QAfiTj2zHsfQMEOxRJxJgf/OvsgfvG6MJ+qDnvPeDgF0zSVVqzLilaXS3p/KVCv9D
	VmJoMMty/kS5zHuAfrznG12LGzWh9zh4=
X-Gm-Gg: ASbGncszOFf2IJExy6fWv0QJz23FAgqSlHhLWatpSiCfmmrfa0ErlmzUR/j7iz7dbyS
	kKoQHsJ6StlQw0DRYsseXk8NN9KZUnHZUvuiqKM1k/G7RGlloaRdhm80yXnK00Ir8hbWj9lJMoU
	ARQShrhd0he57PHAxFZ3l4yNz3Zb6vMDOVRsOn/+9gl6o+JpvTI1TOfSOjAqzLeGH2gV1bL1j6/
	bjN4aK48Sf9
X-Google-Smtp-Source: AGHT+IGI3JlMltzgu4UuGyXAoU/1Um7rMV5xmvkU9aZ8d677CXm9J4qr5a1XOyC6DX6Cc67vNhum2Jb9b49d3rYBWJM=
X-Received: by 2002:a05:6214:224d:b0:6fd:74bf:6062 with SMTP id
 6a1803df08f44-702b1a5780cmr103340886d6.17.1751543517897; Thu, 03 Jul 2025
 04:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123005.1233743-1-Moritz.Haase@bmw.de> <DB29D6KE7N6X.EA0WFHWLYJIQ@bootlin.com>
In-Reply-To: <DB29D6KE7N6X.EA0WFHWLYJIQ@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Jul 2025 13:51:46 +0200
X-Gm-Features: Ac12FXyRaCvFVZe3mBhtwzaPmlTEUghsQM_TNU1htQI6XIVSOV43Xz_G18foZMY
Message-ID: <CANNYZj_d+vZrmtqqRKippdPqf8ib3tQcpY=mgXwip89RfRUMcA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] cmake: Major version bump to 4.0.3
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Moritz Haase <Moritz.Haase@bmw.de>, openembedded-core@lists.openembedded.org, 
	quentin.schulz@cherry.de, Peter.Marko@siemens.com
Content-Type: multipart/alternative; boundary="00000000000031686f0639050159"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 11:52:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219876

--00000000000031686f0639050159
Content-Type: text/plain; charset="UTF-8"

This is slightly more difficult to fix. The selftest isn't using an
existing recipe to build libfdti, rather it's using devtool to create a
recipe from a release tarball (see lib/oeqa/selftest/cases/devtool.py).

If there's no upstream release that would work with cmake 4, then the test
should be adjusted to add the needed source tweaks, or rewritten to use a
different upstream component.

Alex



On Thu, 3 Jul 2025 at 09:57, Antonin Godard <antonin.godard@bootlin.com>
wrote:
>
> On Wed Jul 2, 2025 at 2:29 PM CEST, Moritz Haase wrote:
> > This patch series bumps CMake to 4.0.3, the most current of the 4.x
releases.
> > That bump allows us to drop all of the upstreamable patches for CMake
itself
> > that we currently carry, which was the motivation for the update as
suggested by
> > Alex Kanavin in [0].
> >
> > A number of components require (minor) patches to build with the new
CMake
> > version. In most cases, those are backports of commits that haven't
made it into
> > an upstream release yet.
> >
> > The bump depends on this patches, but not vice-versa (since we are
already on
> > CMake 3.31). Thus, if desired, it would be possible to pull the 'Allow
builds
> > with CMake 4+' patches in in advance of the actual bump.
> >
> > Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> >
> > changes in v4:
> > - Fixed broken patch formatting, sorry for that.
> >
> > changes in v3:
> >
> > - Updated patch series description.
> > - Added four additional commits with patches for build failures seen on
> >   Autobuilder. Those should be all be fixed now, apart from the one in
> >   meta-virt (yajl-2.1.0), which I don't have set up locally.
> > - Fix for test failure seen in SDK tests.
> >
> > changes in v2:
> >
> > - Re-ordered / squashed commits to keep bisectability (see [3], [4])
> > - Fixed patchtest findings
> >
> > [0]: https://lists.openembedded.org/g/openembedded-core/message/219113
> > [1]:
https://git.openembedded.org/openembedded-core/commit/?id=c3efca7495889f3682225af8c9e01ceb094b1bb7
> > [2]:
https://git.openembedded.org/openembedded-core/commit/?id=cb5234acdab200bd43b89416d8d7e9df91af58cc
> > [3]: https://lists.openembedded.org/g/openembedded-core/message/219403
> > [4]: https://lists.openembedded.org/g/openembedded-core/message/219425
> >
> > CC: alex.kanavin@gmail.com
> > CC: quentin.schulz@cherry.de
> > CC: antonin.godard@bootlin.com
> > CC: Peter.Marko@siemens.com
> >
> > Moritz Haase (7):
> >   libcomps: Backport patch to support builds with CMake 4+
> >   createrepo-c: Backport patches to support builds with CMake 4+
> >   apt: Backport patch to support builds with CMake 4+
> >   libubootenv: Backport patch to support builds with CMake 4+
> >   musl-locales: Add patch to support builds with CMake 4+
> >   libwpe: Add patch to support builds with CMake 4+
> >   cmake: upgrade 3.31.6 -> 4.0.3
> >
> >  .../sdkext/files/myapp_cmake/CMakeLists.txt   |   2 +-
> >  ...Update-cmake_minimum_required-to-3.5.patch |  50 ++++
> >  meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb  |   4 +-
> >  ...red-CMake-version-to-3.5-to-allow-bu.patch |  41 ++++
> >  meta/recipes-core/musl/musl-locales_git.bb    |   4 +-
> >  ...mum_required-to-3.13-to-avoid-warnin.patch |  47 ++++
> >  meta/recipes-devtools/apt/apt_2.6.1.bb        |   1 +
> >  ...native_3.31.6.bb => cmake-native_4.0.3.bb} |   6 +-
> >  meta/recipes-devtools/cmake/cmake.inc         |   8 +-
> >  ...mpilerABI-Strip-pipe-from-compile-fl.patch |  63 -----
> >  ...xt2fs-ext2_fs.h-by-cmake-s-internal.patch} |   4 +-
> >  ...ng-undocumented-type-for-CURLOPT_NET.patch |  30 ---
> >  ...trary-characters-in-test-names-of-CT.patch | 202 ----------------
> >  ...-CMakeLists.txt-disable-USE_NGHTTP2.patch} |   6 +-
> >  .../cmake/{cmake_3.31.6.bb => cmake_4.0.3.bb} |   1 -
> >  .../0001-Fix-libname-of-Libs.private.patch    |  22 ++
> >  ...ED_TARGET-for-3rd-party-dependencies.patch | 226 ++++++++++++++++++
> >  ...-imported-targets-of-turned-off-depe.patch |  53 ++++
> >  ...ds-without-Doxygen-being-present-wit.patch |  50 ++++
> >  .../createrepo-c/createrepo-c_1.2.1.bb        |   4 +
> >  ...libcomps-Support-builds-with-CMake-4.patch | 132 ++++++++++
> >  .../libcomps/libcomps_0.1.21.bb               |   1 +
> >  ...red-CMake-version-to-3.5-to-allow-bu.patch |  38 +++
> >  meta/recipes-sato/webkit/libwpe_1.16.2.bb     |   6 +-
> >  24 files changed, 687 insertions(+), 314 deletions(-)
> >  create mode 100644
meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_required-to-3.5.patch
> >  create mode 100644
meta/recipes-core/musl/musl-locales/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch
> >  create mode 100644
meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch
> >  rename meta/recipes-devtools/cmake/{cmake-native_3.31.6.bb =>
cmake-native_4.0.3.bb} (90%)
> >  delete mode 100644
meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
> >  rename
meta/recipes-devtools/cmake/cmake/{0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
=> 0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch} (90%)
> >  delete mode 100644
meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch
> >  delete mode 100644
meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch
> >  rename
meta/recipes-devtools/cmake/cmake/{0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
=> 0002-CMakeLists.txt-disable-USE_NGHTTP2.patch} (83%)
> >  rename meta/recipes-devtools/cmake/{cmake_3.31.6.bb => cmake_4.0.3.bb}
(96%)
> >  create mode 100644
meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-libname-of-Libs.private.patch
> >  create mode 100644
meta/recipes-devtools/createrepo-c/createrepo-c/0002-Use-IMPORTED_TARGET-for-3rd-party-dependencies.patch
> >  create mode 100644
meta/recipes-devtools/createrepo-c/createrepo-c/0003-Don-t-try-to-use-imported-targets-of-turned-off-depe.patch
> >  create mode 100644
meta/recipes-devtools/createrepo-c/createrepo-c/0004-cmake-Allow-builds-without-Doxygen-being-present-wit.patch
> >  create mode 100644
meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Support-builds-with-CMake-4.patch
> >  create mode 100644
meta/recipes-sato/webkit/libwpe/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch
>
> Hi Moritz,
>
> I think we are having another error related to Cmake upgrade:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2045
>
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2866113/raw_inline
>
> It looks like libfdti also requires tweaking.
>
> I didn't spot any other issue related to Cmake, so hopefully the last one!
>
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000031686f0639050159
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>This is slightly more difficult to fix. The selftest isn&#39;t using a=
n existing recipe to build libfdti, rather it&#39;s using devtool to create=
 a recipe from a release tarball (see lib/oeqa/selftest/cases/devtool.py).<=
br>
<br>
If there&#39;s no upstream release that would work with cmake 4, then the t=
est should be adjusted to add the needed source tweaks, or rewritten to use=
 a different upstream component.<br>
<br>
Alex</div><div><br>
<br>
<br>
On Thu, 3 Jul 2025 at 09:57, Antonin Godard &lt;<a href=3D"mailto:antonin.g=
odard@bootlin.com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; On Wed Jul 2, 2025 at 2:29 PM CEST, Moritz Haase wrote:<br>
&gt; &gt; This patch series bumps CMake to 4.0.3, the most current of the 4=
.x releases.<br>
&gt; &gt; That bump allows us to drop all of the upstreamable patches for C=
Make itself<br>
&gt; &gt; that we currently carry, which was the motivation for the update =
as suggested by<br>
&gt; &gt; Alex Kanavin in [0].<br>
&gt; &gt;<br>
&gt; &gt; A number of components require (minor) patches to build with the =
new CMake<br>
&gt; &gt; version. In most cases, those are backports of commits that haven=
&#39;t made it into<br>
&gt; &gt; an upstream release yet.<br>
&gt; &gt;<br>
&gt; &gt; The bump depends on this patches, but not vice-versa (since we ar=
e already on<br>
&gt; &gt; CMake 3.31). Thus, if desired, it would be possible to pull the &=
#39;Allow builds<br>
&gt; &gt; with CMake 4+&#39; patches in in advance of the actual bump.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Moritz Haase &lt;<a href=3D"mailto:Moritz.Haase@bm=
w.de" target=3D"_blank">Moritz.Haase@bmw.de</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; changes in v4:<br>
&gt; &gt; - Fixed broken patch formatting, sorry for that.<br>
&gt; &gt;<br>
&gt; &gt; changes in v3:<br>
&gt; &gt;<br>
&gt; &gt; - Updated patch series description.<br>
&gt; &gt; - Added four additional commits with patches for build failures s=
een on<br>
&gt; &gt;=C2=A0 =C2=A0Autobuilder. Those should be all be fixed now, apart =
from the one in<br>
&gt; &gt;=C2=A0 =C2=A0meta-virt (yajl-2.1.0), which I don&#39;t have set up=
 locally.<br>
&gt; &gt; - Fix for test failure seen in SDK tests.<br>
&gt; &gt;<br>
&gt; &gt; changes in v2:<br>
&gt; &gt;<br>
&gt; &gt; - Re-ordered / squashed commits to keep bisectability (see [3], [=
4])<br>
&gt; &gt; - Fixed patchtest findings<br>
&gt; &gt;<br>
&gt; &gt; [0]: <a href=3D"https://lists.openembedded.org/g/openembedded-cor=
e/message/219113" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/message/219113</a><br>
&gt; &gt; [1]: <a href=3D"https://git.openembedded.org/openembedded-core/co=
mmit/?id=3Dc3efca7495889f3682225af8c9e01ceb094b1bb7" rel=3D"noreferrer" tar=
get=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3D=
c3efca7495889f3682225af8c9e01ceb094b1bb7</a><br>
&gt; &gt; [2]: <a href=3D"https://git.openembedded.org/openembedded-core/co=
mmit/?id=3Dcb5234acdab200bd43b89416d8d7e9df91af58cc" rel=3D"noreferrer" tar=
get=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3D=
cb5234acdab200bd43b89416d8d7e9df91af58cc</a><br>
&gt; &gt; [3]: <a href=3D"https://lists.openembedded.org/g/openembedded-cor=
e/message/219403" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/message/219403</a><br>
&gt; &gt; [4]: <a href=3D"https://lists.openembedded.org/g/openembedded-cor=
e/message/219425" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/message/219425</a><br>
&gt; &gt;<br>
&gt; &gt; CC: <a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">a=
lex.kanavin@gmail.com</a><br>
&gt; &gt; CC: <a href=3D"mailto:quentin.schulz@cherry.de" target=3D"_blank"=
>quentin.schulz@cherry.de</a><br>
&gt; &gt; CC: <a href=3D"mailto:antonin.godard@bootlin.com" target=3D"_blan=
k">antonin.godard@bootlin.com</a><br>
&gt; &gt; CC: <a href=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank">=
Peter.Marko@siemens.com</a><br>
&gt; &gt;<br>
&gt; &gt; Moritz Haase (7):<br>
&gt; &gt;=C2=A0 =C2=A0libcomps: Backport patch to support builds with CMake=
 4+<br>
&gt; &gt;=C2=A0 =C2=A0createrepo-c: Backport patches to support builds with=
 CMake 4+<br>
&gt; &gt;=C2=A0 =C2=A0apt: Backport patch to support builds with CMake 4+<b=
r>
&gt; &gt;=C2=A0 =C2=A0libubootenv: Backport patch to support builds with CM=
ake 4+<br>
&gt; &gt;=C2=A0 =C2=A0musl-locales: Add patch to support builds with CMake =
4+<br>
&gt; &gt;=C2=A0 =C2=A0libwpe: Add patch to support builds with CMake 4+<br>
&gt; &gt;=C2=A0 =C2=A0cmake: upgrade 3.31.6 -&gt; 4.0.3<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 .../sdkext/files/myapp_cmake/CMakeLists.txt=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 ...Update-cmake_minimum_required-to-3.5.patch |=C2=A0 50 ++=
++<br>
&gt; &gt;=C2=A0 meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.6=
.bb" rel=3D"noreferrer" target=3D"_blank">libubootenv_0.3.6.bb</a>=C2=A0 |=
=C2=A0 =C2=A04 +-<br>
&gt; &gt;=C2=A0 ...red-CMake-version-to-3.5-to-allow-bu.patch |=C2=A0 41 ++=
++<br>
&gt; &gt;=C2=A0 meta/recipes-core/musl/<a href=3D"http://musl-locales_git.b=
b" rel=3D"noreferrer" target=3D"_blank">musl-locales_git.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
&gt; &gt;=C2=A0 ...mum_required-to-3.13-to-avoid-warnin.patch |=C2=A0 47 ++=
++<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/apt/<a href=3D"http://apt_2.6.1.bb" r=
el=3D"noreferrer" target=3D"_blank">apt_2.6.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://native_3.31.6.bb" rel=3D"noreferrer" t=
arget=3D"_blank">native_3.31.6.bb</a> =3D&gt; <a href=3D"http://cmake-nativ=
e_4.0.3.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_4.0.3.bb</a>}=
 |=C2=A0 =C2=A06 +-<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/cmake/cmake.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt; &gt;=C2=A0 ...mpilerABI-Strip-pipe-from-compile-fl.patch |=C2=A0 63 --=
---<br>
&gt; &gt;=C2=A0 ...xt2fs-ext2_fs.h-by-cmake-s-internal.patch} |=C2=A0 =C2=
=A04 +-<br>
&gt; &gt;=C2=A0 ...ng-undocumented-type-for-CURLOPT_NET.patch |=C2=A0 30 --=
-<br>
&gt; &gt;=C2=A0 ...trary-characters-in-test-names-of-CT.patch | 202 -------=
---------<br>
&gt; &gt;=C2=A0 ...-CMakeLists.txt-disable-USE_NGHTTP2.patch} |=C2=A0 =C2=
=A06 +-<br>
&gt; &gt;=C2=A0 .../cmake/{<a href=3D"http://cmake_3.31.6.bb" rel=3D"norefe=
rrer" target=3D"_blank">cmake_3.31.6.bb</a> =3D&gt; <a href=3D"http://cmake=
_4.0.3.bb" rel=3D"noreferrer" target=3D"_blank">cmake_4.0.3.bb</a>} |=C2=A0=
 =C2=A01 -<br>
&gt; &gt;=C2=A0 .../0001-Fix-libname-of-Libs.private.patch=C2=A0 =C2=A0 |=
=C2=A0 22 ++<br>
&gt; &gt;=C2=A0 ...ED_TARGET-for-3rd-party-dependencies.patch | 226 +++++++=
+++++++++++<br>
&gt; &gt;=C2=A0 ...-imported-targets-of-turned-off-depe.patch |=C2=A0 53 ++=
++<br>
&gt; &gt;=C2=A0 ...ds-without-Doxygen-being-present-wit.patch |=C2=A0 50 ++=
++<br>
&gt; &gt;=C2=A0 .../createrepo-c/<a href=3D"http://createrepo-c_1.2.1.bb" r=
el=3D"noreferrer" target=3D"_blank">createrepo-c_1.2.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt; &gt;=C2=A0 ...libcomps-Support-builds-with-CMake-4.patch | 132 +++++++=
+++<br>
&gt; &gt;=C2=A0 .../libcomps/<a href=3D"http://libcomps_0.1.21.bb" rel=3D"n=
oreferrer" target=3D"_blank">libcomps_0.1.21.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt;=C2=A0 ...red-CMake-version-to-3.5-to-allow-bu.patch |=C2=A0 38 ++=
+<br>
&gt; &gt;=C2=A0 meta/recipes-sato/webkit/<a href=3D"http://libwpe_1.16.2.bb=
" rel=3D"noreferrer" target=3D"_blank">libwpe_1.16.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A06 +-<br>
&gt; &gt;=C2=A0 24 files changed, 687 insertions(+), 314 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-bsp/u-boot/libubootenv/0001=
-Update-cmake_minimum_required-to-3.5.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/musl/musl-locales/0001=
-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/apt/apt/0001-Raise=
-cmake_minimum_required-to-3.13-to-avoid-warnin.patch<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/cmake/{<a href=3D"http://cmake=
-native_3.31.6.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.31.6=
.bb</a> =3D&gt; <a href=3D"http://cmake-native_4.0.3.bb" rel=3D"noreferrer"=
 target=3D"_blank">cmake-native_4.0.3.bb</a>} (90%)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-C=
MakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/cmake/cmake/{0005-Disable-use-=
of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch =3D&gt; 0001-Disable-use-of-=
ext2fs-ext2_fs.h-by-cmake-s-internal.patch} (90%)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-c=
mCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-c=
test-Allow-arbitrary-characters-in-test-names-of-CT.patch<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/cmake/cmake/{0001-CMakeLists.t=
xt-disable-USE_NGHTTP2.patch =3D&gt; 0002-CMakeLists.txt-disable-USE_NGHTTP=
2.patch} (83%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/cmake/{<a href=3D"http://cmake=
_3.31.6.bb" rel=3D"noreferrer" target=3D"_blank">cmake_3.31.6.bb</a> =3D&gt=
; <a href=3D"http://cmake_4.0.3.bb" rel=3D"noreferrer" target=3D"_blank">cm=
ake_4.0.3.bb</a>} (96%)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/createrepo-c/creat=
erepo-c/0001-Fix-libname-of-Libs.private.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/createrepo-c/creat=
erepo-c/0002-Use-IMPORTED_TARGET-for-3rd-party-dependencies.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/createrepo-c/creat=
erepo-c/0003-Don-t-try-to-use-imported-targets-of-turned-off-depe.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/createrepo-c/creat=
erepo-c/0004-cmake-Allow-builds-without-Doxygen-being-present-wit.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/libcomps/libcomps/=
0001-libcomps-Support-builds-with-CMake-4.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-sato/webkit/libwpe/0001-cma=
ke-Bump-required-CMake-version-to-3.5-to-allow-bu.patch<br>
&gt;<br>
&gt; Hi Moritz,<br>
&gt;<br>
&gt; I think we are having another error related to Cmake upgrade:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23=
/builds/2045" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/23/builds/2045</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2=
866113/raw_inline" rel=3D"noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/valkyrie/api/v2/logs/2866113/raw_inline</a><br>
&gt;<br>
&gt; It looks like libfdti also requires tweaking.<br>
&gt;<br>
&gt; I didn&#39;t spot any other issue related to Cmake, so hopefully the l=
ast one!<br>
&gt;<br>
&gt; Antonin<br>
&gt;<br>
&gt; --<br>
&gt; Antonin Godard, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
&gt;<br>
</div>

--00000000000031686f0639050159--

