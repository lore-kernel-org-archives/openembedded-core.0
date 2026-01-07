Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E34CD582A
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:20:54 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2989.1767781251680135898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BDkVpBKG;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42e2e77f519so1187420f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 02:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767781250; x=1768386050; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OX6diDzxt1e/L8UzL7MyjmrxvjZ7Zv2RIi//c98qX0s=;
        b=BDkVpBKGgTj4itKs4NbHowVY+RbMmOnRvm5Dal8qWC25V+D4eOWlp0FXt1wEnvq7Os
         Yi5RkRRk/wLsiRSQCAnJymWRjzZMaIAdirMk2zdrQZPikIaJ7t8APusbaSD5Cw1LcfU9
         QP/ytwtQ+diTDL/2JvRguNgcCtz+p76vfnFKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781250; x=1768386050;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OX6diDzxt1e/L8UzL7MyjmrxvjZ7Zv2RIi//c98qX0s=;
        b=xIhdMnUzU+yNJoRyS0azDk0ZSyz9tMh0r38K4W5OoKCgXTCJxo+GNBIZB9YeYXcwAV
         OM6MJMxAKEiVZ857q2Mer5oGxrouT8GXW0wQI9tFIn7AnVD0Z+8yTdQMyexPulGJxKZK
         wpBxDoSEBh8027WsIMlf5/iOOfY5zpbfwbE0RAErqq3LUyA0GxEvWKVIjQE6yJMAlLdE
         qZPTFAdMDtzgpkS6D1sl/cy7jCgesOaVydk4o/PljkB8NsulFa1clmvb8eprhbU53Vrh
         JIYvyUtJPJMsxiLtO7Hb7jGUVKAeQElB09WvwQ2aqQYYyjBaFcPBZpSDMuD2jJAJR3Fe
         AQvQ==
X-Gm-Message-State: AOJu0Yz0wPAz6H6M/yheAXNo00AvHauprhKFQhNXoOVIDjVIImI7tPgO
	NaUxZKG2a0BVGKQAZ3ZAUqhFILjnfKDKBaqZhjt+ZhlRrkcu+3sTAQMyMyl2uRh/MYDomlCVlQc
	vRy0reHIBzLrSimZKDyA/VmOk6zLtFimJ8+CljfwCu1vtbOYU3Pd2bhM=
X-Gm-Gg: AY/fxX6T20KZgMLliuhTUyWJ5sHMDEqVNSb1ouKXrrSQiH6g35gU9koSAOfx1Xq3Lwt
	y0lsjjFqNASGxXW/SD851oSV4Cp0z233c8KSpQr1iiPqQi+g8i3cf2Qm8yEo2B7RNGgCmCo7gFG
	W/GawxsKvtrzGr23hI7PbBZXROjmPaEEAqND40kXMmjeIZrR+NgZDfEDJ59gKvVbaLnqa9aitJf
	hbESx0uLBNPvwfHZP1ezLMFP4kfRVqClN3P8c5wWiUg/1ordTZxd20LYOVgccPU8zSif9UCXjg8
	7JfcThP+OxQpLAhEgO1ulkosnH/P3O4am8njO7E=
X-Google-Smtp-Source: AGHT+IEa0mcosrWPzqG3hUj/0UGcyqjY90u+D71Kv1HtUqROM+EEz5jwl0pajwOoRDgg2cbGIICl3WCsk2f7sbWNbPA=
X-Received: by 2002:a05:6000:2084:b0:430:f742:fbb8 with SMTP id
 ffacd0b85a97d-432c3775ad0mr2414413f8f.21.1767781248686; Wed, 07 Jan 2026
 02:20:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767710585.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1767710585.git.yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 7 Jan 2026 11:20:22 +0100
X-Gm-Features: AQt7F2p1GwTcTdrOjBJtUtf_yV-6-8362jgvB3uMdPQgpnMqEcis9rPh4mAehig
Message-ID: <CAMSfU+7eCcVO-LLf8OarXgjTFShHojqYpoPuYnRUYAU30R8hTg@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 00/29] Pull request (cover letter only)
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005e71140647c9a5e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228970

--0000000000005e71140647c9a5e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 6 janv. 2026 =C3=A0 15:58, Yoann Congal <yoann.congal@smile.fr> a =
=C3=A9crit :

> Passed a-full on autobuilder(*):
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2997


As Paul noticed, this build points to the tip whinlatter-nut and not the
tip of this pull request (my mistake).

The correct build for this pull request is
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2960


> (*): The builds/tests parts passed, only the "Send QA Email" step
> failed. This is a known bug on AB side :
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15696.
>
NB: This build (2960) is also touched by this bug (15696) but the
tests/builds parts are fine.


> The following changes since commit
> 9964fa3da2fa1e7243fba1a826e59f7bb1813706:
>
>   populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain in locked
> sigs (2025-12-18 13:11:45 -0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/whinlatter-next
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wh=
inlatter-next
>
> Ankur Tyagi (4):
>   gnutls: patch CVE-2025-9820
>   sqlite3: patch CVE-2025-3277
>   sqlite3: patch CVE-2025-6965
>   libxmlb: upgrade 0.3.23 -> 0.3.24
>
> Chen Qi (1):
>   cups: upgrade from 2.4.14 to 2.4.15
>
> Deepesh Varatharajan (2):
>   llvm/clang: Upgrade to 21.1.6 release
>   llvm/clang: Upgrade to 21.1.7 release
>
> Dmitry Baryshkov (1):
>   mesa: upgrade 25.2.5 -> 25.2.8
>
> Gyorgy Sarvari (1):
>   enchant2: upgrade 2.8.12 -> 2.8.14
>
> J=C3=B6rg Sommer (1):
>   glib-2.0: Upgrade 2.86.0 -> 2.86.1
>
> Peter Marko (1):
>   libarchive: upgrade 3.8.2 -> 3.8.3
>
> Robert Yang (2):
>   e2fsprogs: misc/create_inode.c: Fix for file larger than 2GB
>   ccache: 4.12.1 -> 4.12.2
>
> Wang Mingyu (13):
>   ell: upgrade 0.79 -> 0.80
>   gst-devtools: upgrade 1.26.5 -> 1.26.7
>   gst-examples: upgrade 1.26.5 -> 1.26.7
>   gstreamer1.0-libav: upgrade 1.26.5 -> 1.26.7
>   gstreamer1.0-plugins-bad: upgrade 1.26.5 -> 1.26.7
>   gstreamer1.0-plugins-base: upgrade 1.26.5 -> 1.26.7
>   gstreamer1.0-plugins-good: upgrade 1.26.5 -> 1.26.7
>   gstreamer1.0-plugins-ugly: upgrade 1.26.5 -> 1.26.7
>   gstreamer1.0-python: upgrade 1.26.5 -> 1.26.7
>   gstreamer1.0-rtsp-server: upgrade 1.26.5 -> 1.26.7
>   gstreamer1.0: upgrade 1.26.5 -> 1.26.7
>   gstreamer1.0-vaapi: upgrade 1.26.5 -> 1.26.7
>   ccache: upgrade 4.12 -> 4.12.1
>
> Yash Shinde (2):
>   binutils: fix CVE-2025-11839
>   binutils: fix CVE-2025-11840
>
> Zhang Peng (1):
>   libpng: upgrade 1.6.50 -> 1.6.51
>
>  meta/conf/distro/include/maintainers.inc      |   4 +-
>  .../ell/{ell_0.79.bb =3D> ell_0.80.bb}          |   2 +-
>  ...l_2.86.0.bb =3D> glib-2.0-initial_2.86.1.bb} |   0
>  ...{glib-2.0_2.86.0.bb =3D> glib-2.0_2.86.1.bb} |   0
>  meta/recipes-core/glib-2.0/glib.inc           |   2 +-
>  .../binutils/binutils-2.45.inc                |   2 +
>  .../binutils/0019-CVE-2025-11839.patch        |  32 +++
>  .../binutils/0020-CVE-2025-11840.patch        |  37 +++
>  .../{ccache_4.12.bb =3D> ccache_4.12.2.bb}      |   2 +-
>  meta/recipes-devtools/clang/common-clang.inc  |   2 +-
>  meta/recipes-devtools/clang/common.inc        |   2 +-
>  ...inode.c-Fix-for-file-larger-than-2GB.patch |  40 +++
>  .../e2fsprogs/e2fsprogs_1.47.3.bb             |   1 +
>  .../cups/{cups_2.4.14.bb =3D> cups_2.4.15.bb}   |   2 +-
>  ...ibarchive_3.8.2.bb =3D> libarchive_3.8.3.bb} |   2 +-
>  .../{libxmlb_0.3.23.bb =3D> libxmlb_0.3.24.bb}  |   2 +-
>  meta/recipes-graphics/mesa/mesa.inc           |   4 +-
>  ...tools_1.26.5.bb =3D> gst-devtools_1.26.7.bb} |   2 +-
>  ...mples_1.26.5.bb =3D> gst-examples_1.26.7.bb} |   2 +-
>  ...1.26.5.bb =3D> gstreamer1.0-libav_1.26.7.bb} |   2 +-
>  ....bb =3D> gstreamer1.0-plugins-bad_1.26.7.bb} |   2 +-
>  ...bb =3D> gstreamer1.0-plugins-base_1.26.7.bb} |   2 +-
>  ...bb =3D> gstreamer1.0-plugins-good_1.26.7.bb} |   2 +-
>  ...bb =3D> gstreamer1.0-plugins-ugly_1.26.7.bb} |   2 +-
>  ....26.5.bb =3D> gstreamer1.0-python_1.26.7.bb} |   2 +-
>  ....bb =3D> gstreamer1.0-rtsp-server_1.26.7.bb} |   2 +-
>  ...1.26.5.bb =3D> gstreamer1.0-vaapi_1.26.7.bb} |   2 +-
>  ...er1.0_1.26.5.bb =3D> gstreamer1.0_1.26.7.bb} |   2 +-
>  .../{libpng_1.6.50.bb =3D> libpng_1.6.51.bb}    |   2 +-
>  ...{enchant2_2.8.12.bb =3D> enchant2_2.8.14.bb} |   2 +-
>  .../gnutls/gnutls/CVE-2025-9820.patch         | 233 ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.10.bb  |   1 +
>  .../sqlite/files/CVE-2025-3277.patch          |  29 +++
>  .../sqlite/files/CVE-2025-6965.patch          | 117 +++++++++
>  meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   5 +-
>  35 files changed, 521 insertions(+), 26 deletions(-)
>  rename meta/recipes-core/ell/{ell_0.79.bb =3D> ell_0.80.bb} (88%)
>  rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.0.bb =3D>
> glib-2.0-initial_2.86.1.bb} (100%)
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.0.bb =3D>
> glib-2.0_2.86.1.bb} (100%)
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch
>  rename meta/recipes-devtools/ccache/{ccache_4.12.bb =3D> ccache_4.12.2.b=
b}
> (93%)
>  create mode 100644
> meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-fo=
r-file-larger-than-2GB.patch
>  rename meta/recipes-extended/cups/{cups_2.4.14.bb =3D> cups_2.4.15.bb}
> (51%)
>  rename meta/recipes-extended/libarchive/{libarchive_3.8.2.bb =3D>
> libarchive_3.8.3.bb} (96%)
>  rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.23.bb =3D> libxmlb_0.3.24=
.bb}
> (93%)
>  rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.5.bb =3D>
> gst-devtools_1.26.7.bb} (95%)
>  rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.5.bb =3D>
> gst-examples_1.26.7.bb} (96%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.5.bb
> =3D> gstreamer1.0-libav_1.26.7.bb} (91%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-bad_1.26.5.bb =3D> gstreamer1.0-plugins-bad_1.26.7.b=
b}
> (98%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-base_1.26.5.bb =3D> gstreamer1.0-plugins-base_1.26.7=
.bb}
> (98%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-good_1.26.5.bb =3D> gstreamer1.0-plugins-good_1.26.7=
.bb}
> (97%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-ugly_1.26.5.bb =3D> gstreamer1.0-plugins-ugly_1.26.7=
.bb}
> (94%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.5.bb
> =3D> gstreamer1.0-python_1.26.7.bb} (91%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-rtsp-server_1.26.5.bb =3D> gstreamer1.0-rtsp-server_1.26.7.b=
b}
> (90%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.5.bb
> =3D> gstreamer1.0-vaapi_1.26.7.bb} (95%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.5.bb =3D>
> gstreamer1.0_1.26.7.bb} (97%)
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.50.bb =3D>
> libpng_1.6.51.bb} (97%)
>  rename meta/recipes-support/enchant/{enchant2_2.8.12.bb =3D>
> enchant2_2.8.14.bb} (91%)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patc=
h
>  create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-3277.patch
>  create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-6965.patch
>
>

--=20
Yoann Congal
Smile ECS

--0000000000005e71140647c9a5e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mar. 6 janv. 2026 =C3=A0=C2=A015:=
58, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@=
smile.fr</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote gmail_q=
uote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Passed a-=
full on autobuilder(*):<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/2997" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/29/builds/2997</a></blockquote><div><br></div><=
div>As Paul noticed, this build points to the tip whinlatter-nut and not th=
e tip of this pull request (my mistake).</div><div><br></div><div>The corre=
ct build for this pull request is=C2=A0<a href=3D"https://autobuilder.yocto=
project.org/valkyrie/#/builders/29/builds/2960">https://autobuilder.yoctopr=
oject.org/valkyrie/#/builders/29/builds/2960</a></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
(*): The builds/tests parts passed, only the &quot;Send QA Email&quot; step=
<br>
failed. This is a known bug on AB side : <a href=3D"https://bugzilla.yoctop=
roject.org/show_bug.cgi?id=3D15696" rel=3D"noreferrer" target=3D"_blank">ht=
tps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15696</a>.<br></blockquot=
e><div>NB: This build (2960) is also touched by this bug (15696) but the te=
sts/builds parts are fine.=C2=A0</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
The following changes since commit 9964fa3da2fa1e7243fba1a826e59f7bb1813706=
:<br>
<br>
=C2=A0 populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain in lock=
ed sigs (2025-12-18 13:11:45 -0800)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/whinlatter-next<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/whinlatter-next" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/whinlatter-=
next</a><br>
<br>
Ankur Tyagi (4):<br>
=C2=A0 gnutls: patch CVE-2025-9820<br>
=C2=A0 sqlite3: patch CVE-2025-3277<br>
=C2=A0 sqlite3: patch CVE-2025-6965<br>
=C2=A0 libxmlb: upgrade 0.3.23 -&gt; 0.3.24<br>
<br>
Chen Qi (1):<br>
=C2=A0 cups: upgrade from 2.4.14 to 2.4.15<br>
<br>
Deepesh Varatharajan (2):<br>
=C2=A0 llvm/clang: Upgrade to 21.1.6 release<br>
=C2=A0 llvm/clang: Upgrade to 21.1.7 release<br>
<br>
Dmitry Baryshkov (1):<br>
=C2=A0 mesa: upgrade 25.2.5 -&gt; 25.2.8<br>
<br>
Gyorgy Sarvari (1):<br>
=C2=A0 enchant2: upgrade 2.8.12 -&gt; 2.8.14<br>
<br>
J=C3=B6rg Sommer (1):<br>
=C2=A0 glib-2.0: Upgrade 2.86.0 -&gt; 2.86.1<br>
<br>
Peter Marko (1):<br>
=C2=A0 libarchive: upgrade 3.8.2 -&gt; 3.8.3<br>
<br>
Robert Yang (2):<br>
=C2=A0 e2fsprogs: misc/create_inode.c: Fix for file larger than 2GB<br>
=C2=A0 ccache: 4.12.1 -&gt; 4.12.2<br>
<br>
Wang Mingyu (13):<br>
=C2=A0 ell: upgrade 0.79 -&gt; 0.80<br>
=C2=A0 gst-devtools: upgrade 1.26.5 -&gt; 1.26.7<br>
=C2=A0 gst-examples: upgrade 1.26.5 -&gt; 1.26.7<br>
=C2=A0 gstreamer1.0-libav: upgrade 1.26.5 -&gt; 1.26.7<br>
=C2=A0 gstreamer1.0-plugins-bad: upgrade 1.26.5 -&gt; 1.26.7<br>
=C2=A0 gstreamer1.0-plugins-base: upgrade 1.26.5 -&gt; 1.26.7<br>
=C2=A0 gstreamer1.0-plugins-good: upgrade 1.26.5 -&gt; 1.26.7<br>
=C2=A0 gstreamer1.0-plugins-ugly: upgrade 1.26.5 -&gt; 1.26.7<br>
=C2=A0 gstreamer1.0-python: upgrade 1.26.5 -&gt; 1.26.7<br>
=C2=A0 gstreamer1.0-rtsp-server: upgrade 1.26.5 -&gt; 1.26.7<br>
=C2=A0 gstreamer1.0: upgrade 1.26.5 -&gt; 1.26.7<br>
=C2=A0 gstreamer1.0-vaapi: upgrade 1.26.5 -&gt; 1.26.7<br>
=C2=A0 ccache: upgrade 4.12 -&gt; 4.12.1<br>
<br>
Yash Shinde (2):<br>
=C2=A0 binutils: fix CVE-2025-11839<br>
=C2=A0 binutils: fix CVE-2025-11840<br>
<br>
Zhang Peng (1):<br>
=C2=A0 libpng: upgrade 1.6.50 -&gt; 1.6.51<br>
<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../ell/{<a href=3D"http://ell_0.79.bb" rel=3D"noreferrer" target=3D"=
_blank">ell_0.79.bb</a> =3D&gt; <a href=3D"http://ell_0.80.bb" rel=3D"noref=
errer" target=3D"_blank">ell_0.80.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://l_2.86.0.bb" rel=3D"noreferrer" target=3D"_blank=
">l_2.86.0.bb</a> =3D&gt; <a href=3D"http://glib-2.0-initial_2.86.1.bb" rel=
=3D"noreferrer" target=3D"_blank">glib-2.0-initial_2.86.1.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0...{<a href=3D"http://glib-2.0_2.86.0.bb" rel=3D"noreferrer" target=
=3D"_blank">glib-2.0_2.86.0.bb</a> =3D&gt; <a href=3D"http://glib-2.0_2.86.=
1.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.86.1.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0meta/recipes-core/glib-2.0/glib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../binutils/binutils-2.45.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../binutils/0019-CVE-2025-11839.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 32 +++<br>
=C2=A0.../binutils/0020-CVE-2025-11840.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 37 +++<br>
=C2=A0.../{<a href=3D"http://ccache_4.12.bb" rel=3D"noreferrer" target=3D"_=
blank">ccache_4.12.bb</a> =3D&gt; <a href=3D"http://ccache_4.12.2.bb" rel=
=3D"noreferrer" target=3D"_blank">ccache_4.12.2.bb</a>}=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-devtools/clang/common-clang.inc=C2=A0 |=C2=A0 =C2=A02 +-=
<br>
=C2=A0meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0...inode.c-Fix-for-file-larger-than-2GB.patch |=C2=A0 40 +++<br>
=C2=A0.../e2fsprogs/<a href=3D"http://e2fsprogs_1.47.3.bb" rel=3D"noreferre=
r" target=3D"_blank">e2fsprogs_1.47.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../cups/{<a href=3D"http://cups_2.4.14.bb" rel=3D"noreferrer" target=
=3D"_blank">cups_2.4.14.bb</a> =3D&gt; <a href=3D"http://cups_2.4.15.bb" re=
l=3D"noreferrer" target=3D"_blank">cups_2.4.15.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ibarchive_3.8.2.bb" rel=3D"noreferrer" target=3D=
"_blank">ibarchive_3.8.2.bb</a> =3D&gt; <a href=3D"http://libarchive_3.8.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libxmlb_0.3.23.bb" rel=3D"noreferrer" target=
=3D"_blank">libxmlb_0.3.23.bb</a> =3D&gt; <a href=3D"http://libxmlb_0.3.24.=
bb" rel=3D"noreferrer" target=3D"_blank">libxmlb_0.3.24.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0...<a href=3D"http://tools_1.26.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">tools_1.26.5.bb</a> =3D&gt; <a href=3D"http://gst-devtools_1.26.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">gst-devtools_1.26.7.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://mples_1.26.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">mples_1.26.5.bb</a> =3D&gt; <a href=3D"http://gst-examples_1.26.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">gst-examples_1.26.7.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">=
1.26.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-libav_1.26.7.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-libav_1.26.7.bb</a>} |=C2=A0=
 =C2=A02 +-<br>
=C2=A0....bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-bad_1.26.7.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.26.7.bb</a>=
} |=C2=A0 =C2=A02 +-<br>
=C2=A0...bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-base_1.26.7.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-base_1.26.7.bb</a=
>} |=C2=A0 =C2=A02 +-<br>
=C2=A0...bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-good_1.26.7.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-good_1.26.7.bb</a=
>} |=C2=A0 =C2=A02 +-<br>
=C2=A0...bb =3D&gt; <a href=3D"http://gstreamer1.0-plugins-ugly_1.26.7.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-ugly_1.26.7.bb</a=
>} |=C2=A0 =C2=A02 +-<br>
=C2=A0....<a href=3D"http://26.5.bb" rel=3D"noreferrer" target=3D"_blank">2=
6.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-python_1.26.7.bb" rel=3D"=
noreferrer" target=3D"_blank">gstreamer1.0-python_1.26.7.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0....bb =3D&gt; <a href=3D"http://gstreamer1.0-rtsp-server_1.26.7.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-rtsp-server_1.26.7.bb</a>=
} |=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">=
1.26.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-vaapi_1.26.7.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaapi_1.26.7.bb</a>} |=C2=A0=
 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://er1.0_1.26.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">er1.0_1.26.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0_1.26.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.26.7.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libpng_1.6.50.bb" rel=3D"noreferrer" target=3D=
"_blank">libpng_1.6.50.bb</a> =3D&gt; <a href=3D"http://libpng_1.6.51.bb" r=
el=3D"noreferrer" target=3D"_blank">libpng_1.6.51.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0...{<a href=3D"http://enchant2_2.8.12.bb" rel=3D"noreferrer" target=
=3D"_blank">enchant2_2.8.12.bb</a> =3D&gt; <a href=3D"http://enchant2_2.8.1=
4.bb" rel=3D"noreferrer" target=3D"_blank">enchant2_2.8.14.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../gnutls/gnutls/CVE-2025-9820.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 233 ++++++++++++++++++<br>
=C2=A0meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.10.bb" rel=
=3D"noreferrer" target=3D"_blank">gnutls_3.8.10.bb</a>=C2=A0 |=C2=A0 =C2=A0=
1 +<br>
=C2=A0.../sqlite/files/CVE-2025-3277.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 29 +++<br>
=C2=A0.../sqlite/files/CVE-2025-6965.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 117 +++++++++<br>
=C2=A0meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.48.0.bb" rel=
=3D"noreferrer" target=3D"_blank">sqlite3_3.48.0.bb</a> |=C2=A0 =C2=A05 +-<=
br>
=C2=A035 files changed, 521 insertions(+), 26 deletions(-)<br>
=C2=A0rename meta/recipes-core/ell/{<a href=3D"http://ell_0.79.bb" rel=3D"n=
oreferrer" target=3D"_blank">ell_0.79.bb</a> =3D&gt; <a href=3D"http://ell_=
0.80.bb" rel=3D"noreferrer" target=3D"_blank">ell_0.80.bb</a>} (88%)<br>
=C2=A0rename meta/recipes-core/glib-2.0/{<a href=3D"http://glib-2.0-initial=
_2.86.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0-initial_2.86.0.bb=
</a> =3D&gt; <a href=3D"http://glib-2.0-initial_2.86.1.bb" rel=3D"noreferre=
r" target=3D"_blank">glib-2.0-initial_2.86.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-core/glib-2.0/{<a href=3D"http://glib-2.0_2.86.0.=
bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.86.0.bb</a> =3D&gt; <a =
href=3D"http://glib-2.0_2.86.1.bb" rel=3D"noreferrer" target=3D"_blank">gli=
b-2.0_2.86.1.bb</a>} (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2=
025-11839.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2=
025-11840.patch<br>
=C2=A0rename meta/recipes-devtools/ccache/{<a href=3D"http://ccache_4.12.bb=
" rel=3D"noreferrer" target=3D"_blank">ccache_4.12.bb</a> =3D&gt; <a href=
=3D"http://ccache_4.12.2.bb" rel=3D"noreferrer" target=3D"_blank">ccache_4.=
12.2.bb</a>} (93%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-mis=
c-create_inode.c-Fix-for-file-larger-than-2GB.patch<br>
=C2=A0rename meta/recipes-extended/cups/{<a href=3D"http://cups_2.4.14.bb" =
rel=3D"noreferrer" target=3D"_blank">cups_2.4.14.bb</a> =3D&gt; <a href=3D"=
http://cups_2.4.15.bb" rel=3D"noreferrer" target=3D"_blank">cups_2.4.15.bb<=
/a>} (51%)<br>
=C2=A0rename meta/recipes-extended/libarchive/{<a href=3D"http://libarchive=
_3.8.2.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.2.bb</a> =3D=
&gt; <a href=3D"http://libarchive_3.8.3.bb" rel=3D"noreferrer" target=3D"_b=
lank">libarchive_3.8.3.bb</a>} (96%)<br>
=C2=A0rename meta/recipes-gnome/libxmlb/{<a href=3D"http://libxmlb_0.3.23.b=
b" rel=3D"noreferrer" target=3D"_blank">libxmlb_0.3.23.bb</a> =3D&gt; <a hr=
ef=3D"http://libxmlb_0.3.24.bb" rel=3D"noreferrer" target=3D"_blank">libxml=
b_0.3.24.bb</a>} (93%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst-devto=
ols_1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">gst-devtools_1.26.5.bb<=
/a> =3D&gt; <a href=3D"http://gst-devtools_1.26.7.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gst-devtools_1.26.7.bb</a>} (95%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gst-examp=
les_1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">gst-examples_1.26.5.bb<=
/a> =3D&gt; <a href=3D"http://gst-examples_1.26.7.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gst-examples_1.26.7.bb</a>} (96%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-libav_1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-liba=
v_1.26.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-libav_1.26.7.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-libav_1.26.7.bb</a>} (91%)<b=
r>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-bad_1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-plugins-bad_1.26.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugins-=
bad_1.26.7.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-ba=
d_1.26.7.bb</a>} (98%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-base_1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-base_1.26.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugin=
s-base_1.26.7.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins=
-base_1.26.7.bb</a>} (98%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-good_1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-good_1.26.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugin=
s-good_1.26.7.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins=
-good_1.26.7.bb</a>} (97%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-ugly_1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-ugly_1.26.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugin=
s-ugly_1.26.7.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins=
-ugly_1.26.7.bb</a>} (94%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-python_1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-pyt=
hon_1.26.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-python_1.26.7.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-python_1.26.7.bb</a>} (91=
%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-rtsp-server_1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-rtsp-server_1.26.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-rtsp-ser=
ver_1.26.7.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-rtsp-serve=
r_1.26.7.bb</a>} (90%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-vaapi_1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaap=
i_1.26.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-vaapi_1.26.7.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaapi_1.26.7.bb</a>} (95%)<b=
r>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0_1.26.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.26.5.bb<=
/a> =3D&gt; <a href=3D"http://gstreamer1.0_1.26.7.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gstreamer1.0_1.26.7.bb</a>} (97%)<br>
=C2=A0rename meta/recipes-multimedia/libpng/{<a href=3D"http://libpng_1.6.5=
0.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.50.bb</a> =3D&gt; <a =
href=3D"http://libpng_1.6.51.bb" rel=3D"noreferrer" target=3D"_blank">libpn=
g_1.6.51.bb</a>} (97%)<br>
=C2=A0rename meta/recipes-support/enchant/{<a href=3D"http://enchant2_2.8.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">enchant2_2.8.12.bb</a> =3D&gt; <=
a href=3D"http://enchant2_2.8.14.bb" rel=3D"noreferrer" target=3D"_blank">e=
nchant2_2.8.14.bb</a>} (91%)<br>
=C2=A0create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-9820.p=
atch<br>
=C2=A0create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-3277.pa=
tch<br>
=C2=A0create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-6965.pa=
tch<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000005e71140647c9a5e4--

