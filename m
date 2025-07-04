Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F9DC83030
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 09:03:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.8410.1751619829655889982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 02:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ntQhXstP;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cf214200so5285905e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1751619828; x=1752224628; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fhERUO6MeekXBBPQ9MRlham7K9XsUGqLosKERb7SDT4=;
        b=ntQhXstPiFErgXhfnpAdMrVHlcGWIL0wr66zLpJxMF9vb2tJf6UASCph43tO1dMN7R
         KXY6K3te2mF7+6BbvhQS9GjQVFE5CNyYA8/f9tXHUCX7nuKlXZRH6zTmNJgQ4GoO1cbC
         hpmpUCdBi5ZUwDukm7HtUTVZNn3PmORdyWNa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619828; x=1752224628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhERUO6MeekXBBPQ9MRlham7K9XsUGqLosKERb7SDT4=;
        b=P5fwBFkvPVICvLTKtYoGBcNSLZl+gznRbcnd/Tc1IZC77ro/ZdTZAOeeDvI3hHL6Ei
         FhVhvf9QHrVKni/Z/9MvbTEjIbBs1ckralKeePCw3r25AD8YDX4hu8XXbE3rivTF9Tpg
         LZSjAepos0rKbZg3A/XsavvwGsuhocvpUO5w31CKNvAb1s4459IODqQCjyW8JmMLwX/+
         TuDDc9uaZEYzg7R2ESkZVchhw7IbNvtEVNEA5kRgtU3W37Q4r3QZfKxgLcbHjUZbvwPu
         4PpSAOVAX2qX/l3CNxdCoVEi+WRwAHg0fO7hTNev4nZZRz7sqdXpqg3USKArweGFdsij
         O3qw==
X-Gm-Message-State: AOJu0YxidEuzl9olwCRGoP0Flg9Msq+drQWHcGgad0KAFsKOYl5VRouH
	yd3rny4U9DkuVGxiN3LYkfHYgNf8ddkbqkJFAqom9I8s76Tp3g+6YkkADJkn8v1Y04I58m+HQRF
	rmXWzfQQEYXaNDPacYp1F+y5vBOtx9HqsPuHSh3BTJFLzGC4S2bx1
X-Gm-Gg: ASbGncvIzD2faslqjnrw4DBj4FUlLhNJcgkBAVc+0vQT0hyhhoe9uuI0cPperNnF64z
	AZJH5Q7Vm7fKgKitLLGLohDz/y/isB4lAXz2IzX3IDz3bZLfuvOIN2kMxLfQsU42TJdHa5SIS/H
	xNU7DVJmc6JfoyF3PZ6X5ZNYFatmpj948FFQUFDnTrojX7bjauiVsgLzta3GcVsO1kaodTgrQde
	sKP9w==
X-Google-Smtp-Source: AGHT+IHHasAClfKT1Q1sxo1TKCZfAQQlZo1CKUsiEHzXdCI+MTq3Chj3pM4/BJewQmvy4KSy0F3OT+BlXKMQpB5ZBm0=
X-Received: by 2002:a05:600c:5254:b0:454:ab1a:8c2a with SMTP id
 5b1f17b1804b1-454b30fff9emr15541635e9.24.1751619827517; Fri, 04 Jul 2025
 02:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250704020027.78732-1-guocai.he.cn@windriver.com>
In-Reply-To: <20250704020027.78732-1-guocai.he.cn@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 4 Jul 2025 11:03:20 +0200
X-Gm-Features: Ac12FXwcpz7lIdI75TVqOOZemTDc9cZCzgrUL0tys-9qGMiTBMICTiOezjRuEgs
Message-ID: <CAMSfU+5-P6m6WXius8Dj3V+i_m3ZatLLzVx=WNJ0mym0ZVy4qQ@mail.gmail.com>
Subject: Re: [oe-core][scarthgap][PATCH] minicom/wayland: correct the SRC_URIs
To: guocai.he.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000099dac5063916c536"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 09:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219905

--00000000000099dac5063916c536
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 4 juil. 2025 =C3=A0 04:01, guocai he via lists.openembedded.org <
guocai.he.cn=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit :

> From: Guocai He <guocai.he.cn@windriver.com>
>
> For minicom, the old SRC_URI is not available and need update.
> For wayland, wayland-utils and wayland-protocals, not only
> the SRC_URIs are updated, but also the tar.xz are no longer
> available. We have replaced them with the tar.bz2 barballs.
>
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
>  meta/recipes-extended/minicom/minicom_2.9.bb            | 2 +-
>  meta/recipes-graphics/wayland/wayland-protocols_1.33.bb | 4 ++--
>  meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb    | 4 ++--
>  meta/recipes-graphics/wayland/wayland_1.22.0.bb         | 4 ++--
>

Could you please split this commit in 2 : minicom and wayland stuff?

Also, can you explain in the commit message why those can't go through
master first?

Thanks!


>  4 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-extended/minicom/minicom_2.9.bb
> b/meta/recipes-extended/minicom/minicom_2.9.bb
> index 907d5c79c9..38f517f2a2 100644
> --- a/meta/recipes-extended/minicom/minicom_2.9.bb
> +++ b/meta/recipes-extended/minicom/minicom_2.9.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D420477abc567404debca0a2a1cb6b=
645 \
>
>  file://src/minicom.h;beginline=3D1;endline=3D12;md5=3Da58838cb709f0db517=
f4e42730c49e81"
>
> -SRC_URI =3D "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
> +SRC_URI =3D "
> https://salsa.debian.org/minicom-team/${BPN}/-/archive/${PV}/${BPN}-${PV}=
.tar.bz2
> "
>
>  SRC_URI[sha256sum] =3D
> "9efbb6458140e5a0de445613f0e76bcf12cbf7a9892b2f53e075c2e7beaba86c"
>
> diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
> b/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
> index 074ea3663a..2300ae46d1 100644
> --- a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
> +++ b/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
> @@ -9,8 +9,8 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da38ca028ace54aae3d=
484 \
>
>  file://stable/presentation-time/presentation-time.xml;endline=3D26;md5=
=3D4646cd7d9edc9fa55db941f2d3a7dc53"
>
> -SRC_URI =3D "
> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}=
/downloads/wayland-protocols-${PV}.tar.xz
> "
> -SRC_URI[sha256sum] =3D
> "94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b36f65f8b98c3963a"
> +SRC_URI =3D "
> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/${PV}/=
wayland-protocols-${PV}.tar.bz2
> "
> +SRC_URI[sha256sum] =3D
> "622754e38cf70e9e02700e2df22cbd1257e523e0cc22004f1ece409719823da5"
>
>  UPSTREAM_CHECK_URI =3D "
> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
>
> diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
> b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
> index 878c7a267e..4ff113f1e9 100644
> --- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
> @@ -9,8 +9,8 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D548a66038a77415e1df51118625e8=
32f \
>                     "
>
> -SRC_URI =3D "
> https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/dow=
nloads/${BPN}-${PV}.tar.xz
> "
> -SRC_URI[sha256sum] =3D
> "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
> +SRC_URI =3D "
> https://gitlab.freedesktop.org/wayland/wayland-utils/-/archive/${PV}/${BP=
N}-${PV}.tar.bz2
> "
> +SRC_URI[sha256sum] =3D
> "f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb04759678b7bb2da7d16335d18"
>
>  UPSTREAM_CHECK_URI =3D "
> https://gitlab.freedesktop.org/wayland/wayland-utils/-/tags"
>
> diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> index 6aa76063ea..e940065624 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> @@ -12,12 +12,12 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db31d8f53b6aaf2b4985d7dd7810a70d1 \
>
>  DEPENDS =3D "expat libffi wayland-native"
>
> -SRC_URI =3D "
> https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads=
/${BPN}-${PV}.tar.xz
> \
> +SRC_URI =3D "
> https://gitlab.freedesktop.org/wayland/wayland/-/archive/${PV}/${BPN}-${P=
V}.tar.bz2
> \
>             file://run-ptest \
>             file://0001-build-Fix-strndup-detection-on-MinGW.patch \
>             file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842"
> +SRC_URI[sha256sum] =3D
> "1a681f14071d12c6263a7f7ac44e64ea85f2d39d177e69d0354d82860532e6b0"
>
>  UPSTREAM_CHECK_URI =3D "
> https://gitlab.freedesktop.org/wayland/wayland/-/tags"
>  UPSTREAM_CHECK_REGEX =3D "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219895):
> https://lists.openembedded.org/g/openembedded-core/message/219895
> Mute This Topic: https://lists.openembedded.org/mt/113977660/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000099dac5063916c536
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 4 =
juil. 2025 =C3=A0=C2=A004:01, guocai he via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;<a href=3D"http://guocai.he.cn">g=
uocai.he.cn</a>=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">w=
indriver.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: Guocai He &lt;<a href=
=3D"mailto:guocai.he.cn@windriver.com" target=3D"_blank">guocai.he.cn@windr=
iver.com</a>&gt;<br>
<br>
For minicom, the old SRC_URI is not available and need update.<br>
For wayland, wayland-utils and wayland-protocals, not only<br>
the SRC_URIs are updated, but also the tar.xz are no longer<br>
available. We have replaced them with the tar.bz2 barballs.<br>
<br>
Signed-off-by: Guocai He &lt;<a href=3D"mailto:guocai.he.cn@windriver.com" =
target=3D"_blank">guocai.he.cn@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/minicom/<a href=3D"http://minicom_2.9.bb" rel=
=3D"noreferrer" target=3D"_blank">minicom_2.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://wayland-protocols_1.3=
3.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.33.bb</a> | =
4 ++--<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://wayland-utils_1.2.0.b=
b" rel=3D"noreferrer" target=3D"_blank">wayland-utils_1.2.0.bb</a>=C2=A0 =
=C2=A0 | 4 ++--<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.22.0.bb" re=
l=3D"noreferrer" target=3D"_blank">wayland_1.22.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 4 ++--<br></blockquote><div><br></div><div>Could you ple=
ase split this commit in 2 : minicom and wayland stuff?</div><div><br></div=
><div>Also, can you explain in the commit message why those can&#39;t go th=
rough master first?</div><div><br></div><div>Thanks!</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A04 files changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/minicom/<a href=3D"http://minicom_2.9.bb=
" rel=3D"noreferrer" target=3D"_blank">minicom_2.9.bb</a> b/meta/recipes-ex=
tended/minicom/<a href=3D"http://minicom_2.9.bb" rel=3D"noreferrer" target=
=3D"_blank">minicom_2.9.bb</a><br>
index 907d5c79c9..38f517f2a2 100644<br>
--- a/meta/recipes-extended/minicom/<a href=3D"http://minicom_2.9.bb" rel=
=3D"noreferrer" target=3D"_blank">minicom_2.9.bb</a><br>
+++ b/meta/recipes-extended/minicom/<a href=3D"http://minicom_2.9.bb" rel=
=3D"noreferrer" target=3D"_blank">minicom_2.9.bb</a><br>
@@ -7,7 +7,7 @@ LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D420477abc567404debca0=
a2a1cb6b645 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://src/minicom.h;beginline=3D1;endline=3D12;md5=3Da58838cb709f0db517=
f4e42730c49e81&quot;<br>
<br>
-SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2=
&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://salsa.debian.org/minicom-team/$%7BBPN=
%7D/-/archive/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" ta=
rget=3D"_blank">https://salsa.debian.org/minicom-team/${BPN}/-/archive/${PV=
}/${BPN}-${PV}.tar.bz2</a>&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;9efbb6458140e5a0de445613f0e76bcf12cbf7a9=
892b2f53e075c2e7beaba86c&quot;<br>
<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://wayland-protoc=
ols_1.33.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.33.bb=
</a> b/meta/recipes-graphics/wayland/<a href=3D"http://wayland-protocols_1.=
33.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.33.bb</a><b=
r>
index 074ea3663a..2300ae46d1 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://wayland-protocols_1.3=
3.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.33.bb</a><br=
>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://wayland-protocols_1.3=
3.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.33.bb</a><br=
>
@@ -9,8 +9,8 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc7b12b6702da38ca028ac=
e54aae3d484 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://stable/presentation-time/presentation-time.xml;endline=3D26;md5=
=3D4646cd7d9edc9fa55db941f2d3a7dc53&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/waylan=
d-protocols/-/releases/$%7BPV%7D/downloads/wayland-protocols-$%7BPV%7D.tar.=
xz" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/way=
land/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.t=
ar.xz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;94f0c50b090d6e61a03f62048467b19abbe851be4e11a=
e7b36f65f8b98c3963a&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/waylan=
d-protocols/-/archive/$%7BPV%7D/wayland-protocols-$%7BPV%7D.tar.bz2" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/wayland/wayla=
nd-protocols/-/archive/${PV}/wayland-protocols-${PV}.tar.bz2</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;622754e38cf70e9e02700e2df22cbd1257e523e0cc220=
04f1ece409719823da5&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.or=
g/wayland/wayland-protocols/-/tags" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags</a>&quot;<br>
<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://wayland-utils_=
1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">wayland-utils_1.2.0.bb</a> b=
/meta/recipes-graphics/wayland/<a href=3D"http://wayland-utils_1.2.0.bb" re=
l=3D"noreferrer" target=3D"_blank">wayland-utils_1.2.0.bb</a><br>
index 878c7a267e..4ff113f1e9 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://wayland-utils_1.2.0.b=
b" rel=3D"noreferrer" target=3D"_blank">wayland-utils_1.2.0.bb</a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://wayland-utils_1.2.0.b=
b" rel=3D"noreferrer" target=3D"_blank">wayland-utils_1.2.0.bb</a><br>
@@ -9,8 +9,8 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D548a66038a77415e1df51=
118625e832f \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/waylan=
d-utils/-/releases/$%7BPV%7D/downloads/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/wayland/waylan=
d-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;d9278c22554586881802540751bcc42569262bf80cd9a=
c9b0fd12ff4bd09a9e4&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/waylan=
d-utils/-/archive/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.bz2" rel=3D"noreferrer=
" target=3D"_blank">https://gitlab.freedesktop.org/wayland/wayland-utils/-/=
archive/${PV}/${BPN}-${PV}.tar.bz2</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb047596=
78b7bb2da7d16335d18&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.or=
g/wayland/wayland-utils/-/tags" rel=3D"noreferrer" target=3D"_blank">https:=
//gitlab.freedesktop.org/wayland/wayland-utils/-/tags</a>&quot;<br>
<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.22.0=
.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.22.0.bb</a> b/meta/reci=
pes-graphics/wayland/<a href=3D"http://wayland_1.22.0.bb" rel=3D"noreferrer=
" target=3D"_blank">wayland_1.22.0.bb</a><br>
index 6aa76063ea..e940065624 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.22.0.bb" re=
l=3D"noreferrer" target=3D"_blank">wayland_1.22.0.bb</a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.22.0.bb" re=
l=3D"noreferrer" target=3D"_blank">wayland_1.22.0.bb</a><br>
@@ -12,12 +12,12 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db31d8f5=
3b6aaf2b4985d7dd7810a70d1 \<br>
<br>
=C2=A0DEPENDS =3D &quot;expat libffi wayland-native&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/waylan=
d/-/releases/$%7BPV%7D/downloads/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.freedesktop.org/wayland/wayland/-/re=
leases/${PV}/downloads/${BPN}-${PV}.tar.xz</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/waylan=
d/-/archive/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" targ=
et=3D"_blank">https://gitlab.freedesktop.org/wayland/wayland/-/archive/${PV=
}/${BPN}-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-Fix-strndup-det=
ection-on-MinGW.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Consider-pkgconfig-sy=
sroot-for-pkgdatadir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12=
936ebb7e7cbc2425842&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1a681f14071d12c6263a7f7ac44e64ea85f2d39d177e6=
9d0354d82860532e6b0&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.or=
g/wayland/wayland/-/tags" rel=3D"noreferrer" target=3D"_blank">https://gitl=
ab.freedesktop.org/wayland/wayland/-/tags</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;wayland-(?P&lt;pver&gt;\d+\.\d+\.(?!9\=
d+)\d+)&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#219895): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/219895" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/219895</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113977660/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113977660/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000099dac5063916c536--

