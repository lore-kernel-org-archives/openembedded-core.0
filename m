Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD24EE6F09D
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 15:40:04 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.102866.1766504397898598554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 07:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ac29Drlc;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78fc4425b6bso24900447b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766504397; x=1767109197; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tTP9nBG+FLMF1IYm/imp0tNRj3JfpPcmm23cQ/W7szU=;
        b=Ac29DrlckEDX7KoI/Cxsaqa0Raaf/zwsUgAMyZ+4uymwMypo1QXp1RwLZSeXnv8o0b
         F9dwK4sYxJ/Xw3S5qd4P7qU59/6o3ON4rIOhlq8eXJH4lc8Wddwg0dngHz32wAu9d1Lz
         L1nVJx59Qa7lZ8r9z4E4V4a3J3uv3oJALr3sYKekTMedml8uEdrtfifPgjYDAEYulZzk
         pBABBn2IRn/4aAGWxNr5Hza5NmgRkFkOf0CmbCTHiz//KOn5w7D+6OlsH3KaaEnVDDC9
         40u8EG1hGziIgaFmEWggAOHaYDfpkEINJinhdNy6VN12Mmnz0aLN3pLDjT0xn7n1kCeb
         6BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766504397; x=1767109197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTP9nBG+FLMF1IYm/imp0tNRj3JfpPcmm23cQ/W7szU=;
        b=RuYVyDKRl0lWGuONLGaI2CRDhYyy1FZfu1Fy/adPd6qFn2woDypDZNUhWuD1cPWNDT
         EJgbtz/ur57ZXm5RXs6+FnWZpVjWNB8pSeo2lXd4pTFVZiEwMRIMMPMrPtNHwVb0M6rU
         onb8ZH1O49MgMVoLrGt/G8HTN6NkH87APXivJXIqH1zMhq9nr4xEoj/Lqv6PvFCQ4Yty
         uV9Ut5MbiMgI2G7U4MtpD7YorqwaxaugaL21+UHvZy0hKdohHkARzY9qsySgLGqiAg0T
         hi0kjW5jBjjy4UfC6FIG8uGVZZQqefetBpiVWDM4S1D8eUyveCfJH3BSMPtocLIiGcVs
         QTRw==
X-Gm-Message-State: AOJu0YzhkM4tPYCA/AlZHGUTN2GJjVC9/hfn6fFVVP7rVfKPjQefs0Ne
	QhnOJginOGolfLRKt+HZCWdR6RIEc2GwsjIO/2qp8xjPfcUSoBR27GkVkDm5RzukK+BcWrBmpbm
	NaACKnkPEB2IQ6mknR1/ezYb/vgWAFsU=
X-Gm-Gg: AY/fxX7jPq/KBNGydu+tBnSDjoxO3eGm+GYQIGswe4zUT0Tv0ZPoGRsZSxKEw1tD0bQ
	NG1YXoL6XJhkNRfmlKchgOIeIzJ/VfZ4zOP9/NXy5KErZh9xMqBa+yg6SeKZNDCUGEJe/pgZL/3
	1ZQJOrCk8Zu0X8+weUxEKJOJprIhRn00svrSHG6Z3cpdm4PoMFIJmK8Xu+OwPq/9aBDiJmIVMJA
	IEf+mgQIwE4kP8uuP18RPaWqcBLFRGXGzcbEYrAHCZBbGsUyb/O6YRNO0KBwlppvJ5TubIEh7fL
	ahW5Sz5WAjg18n+OOPE8rgiFn4ulyI42Tr0ilDlqOB21dwnorQLqCouK3sIVfnTKKSm7AfXj6wu
	VmqEhmsn10N/W/ezOGJJNRee4vJ4=
X-Google-Smtp-Source: AGHT+IF2JrB6sAhi7qciI4QYc9rZgl6U1zUPHNv7NdiaGRfADhusZwBdHsbtNtuFBd5tlMVjeAqcjgmydU+gjsTPFnc=
X-Received: by 2002:a05:690e:1687:b0:646:518b:bde5 with SMTP id
 956f58d0204a3-6466a8322ddmr9963716d50.8.1766504396873; Tue, 23 Dec 2025
 07:39:56 -0800 (PST)
MIME-Version: 1.0
References: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com> <20251219120109.1967755-2-koen.kooi@oss.qualcomm.com>
In-Reply-To: <20251219120109.1967755-2-koen.kooi@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Dec 2025 07:39:30 -0800
X-Gm-Features: AQt7F2pNWVA1miQ-GOtIVYNHCbXOGAZqK_kMTxyIQcmiY6w3yEjUWQSa8fbt5nk
Message-ID: <CAMKF1spSmrcUcrtFrUZ4qU+9dQvMZu49cKW3BPp11Cv7-iHV5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/4] python3-pyzstd: import 0.17.0 from meta-python
To: koen.kooi@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000011e5ee0646a05b85"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 15:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228472

--00000000000011e5ee0646a05b85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Koen

It's now applied to oe-core, we need it removed from meta-python, would you
mind cooking a patch for it ?

On Fri, Dec 19, 2025 at 4:01=E2=80=AFAM Koen Kooi via lists.openembedded.or=
g
<koen.kooi=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> From the upstream website:
>         Pyzstd module provides classes and functions for compressing and
>         decompressing data, using Facebook's Zstandard (or zstd as short
> name)
>         algorithm.
>
> This recipe is being moved over for systemd 258.x, the 'ukify' tool
> depends on this.
>
> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
> ---
> Changes since v3:
>  * Added SUMMARY
> Changes since v2:
>  * No changes
> Changes since v1:
>  * Adjusted pyzstd patch to not specify an upper limit to the setuptools
>    version, as suggested by Alexander Kanavin.
>
>  ...emove-setuptools-version-limit-of-74.patch | 27 +++++++++++++++++++
>  .../python/python3-pyzstd_0.17.0.bb           | 20 ++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644
> meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-versio=
n-limit-of-74.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
>
> diff --git
> a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-vers=
ion-limit-of-74.patch
> b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-vers=
ion-limit-of-74.patch
> new file mode 100644
> index 0000000000..f2910322ff
> --- /dev/null
> +++
> b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-vers=
ion-limit-of-74.patch
> @@ -0,0 +1,27 @@
> +From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 9 Apr 2025 14:38:31 -0700
> +Subject: [PATCH] Remove setuptools version limit of '74'
> +
> +Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
> +support beyond that which is needed for python 3.9 on windows. We
> +do not have this problem on Linux
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + pyproject.toml | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pyproject.toml b/pyproject.toml
> +index dd885e4..5d4d511 100644
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -1,6 +1,6 @@
> + [build-system]
> + # setuptools 64+ support --build-option
> + # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9
> under Windows
> +-requires =3D ["setuptools>=3D64,<74"]
> ++requires =3D ["setuptools>=3D64"]
> + backend-path =3D ["build_script"]
> + build-backend =3D "pyzstd_pep517"
> diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> b/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> new file mode 100644
> index 0000000000..af7069b6ed
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "Pyzstd module provides classes and functions for
> compressing and \
> +decompressing data, using Facebook=E2=80=99s Zstandard (or zstd as short=
 name)
> algorithm."
> +SUMMARY =3D "Python bindings to Zstandard (zstd) compression library"
> +HOMEPAGE =3D "https://github.com/animalize/pyzstd"
> +SECTION =3D "devel/python"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daedb5a2679cd1552fb61c181ef974=
b9e"
> +
> +PYPI_PACKAGE =3D "pyzstd"
> +
> +SRC_URI +=3D "file://0001-Remove-setuptools-version-limit-of-74.patch"
> +SRC_URI[sha256sum] =3D
> "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21b81764fa208c1db6"
> +
> +inherit pypi python_setuptools_build_meta ptest-python-pytest
> +
> +# clang-16 with -flto segfaults on arm, therefore ignore flto for now
> +do_configure:append:arm:toolchain-clang() {
> +    sed -i -e "s|'-flto'|''|" ${S}/setup.py
> +}
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228222):
> https://lists.openembedded.org/g/openembedded-core/message/228222
> Mute This Topic: https://lists.openembedded.org/mt/116858017/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000011e5ee0646a05b85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Koen<div><br></div><div>It&#39;s now applied to oe-core=
, we need it removed from meta-python, would you mind cooking a patch for i=
t ?</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Dec 19, 2025 at 4:01=E2=80=AFAM Koen=
 Kooi via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;koen.kooi=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembedded.o=
rg">oss.qualcomm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">From the upstream website:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Pyzstd module provides classes and functions fo=
r compressing and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 decompressing data, using Facebook&#39;s Zstand=
ard (or zstd as short name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 algorithm.<br>
<br>
This recipe is being moved over for systemd 258.x, the &#39;ukify&#39; tool=
<br>
depends on this.<br>
<br>
Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen.kooi@oss.qualcomm.com" =
target=3D"_blank">koen.kooi@oss.qualcomm.com</a>&gt;<br>
---<br>
Changes since v3:<br>
=C2=A0* Added SUMMARY<br>
Changes since v2:<br>
=C2=A0* No changes<br>
Changes since v1:<br>
=C2=A0* Adjusted pyzstd patch to not specify an upper limit to the setuptoo=
ls<br>
=C2=A0 =C2=A0version, as suggested by Alexander Kanavin.<br>
<br>
=C2=A0...emove-setuptools-version-limit-of-74.patch | 27 ++++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-pyzstd_0.17.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pyzstd_0.17.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 20 ++++++++++++++<br>
=C2=A02 files changed, 47 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-R=
emove-setuptools-version-limit-of-74.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pyzstd_0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_=
0.17.0.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setupt=
ools-version-limit-of-74.patch b/meta/recipes-devtools/python/python3-pyzst=
d/0001-Remove-setuptools-version-limit-of-74.patch<br>
new file mode 100644<br>
index 0000000000..f2910322ff<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-ve=
rsion-limit-of-74.patch<br>
@@ -0,0 +1,27 @@<br>
+From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Wed, 9 Apr 2025 14:38:31 -0700<br>
+Subject: [PATCH] Remove setuptools version limit of &#39;74&#39;<br>
+<br>
+Upstream sticks to 0.74 since setuptools have dropped msvc9compiler<br>
+support beyond that which is needed for python 3.9 on windows. We<br>
+do not have this problem on Linux<br>
+<br>
+Upstream-Status: Inappropriate [OE-specific]<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ pyproject.toml | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/pyproject.toml b/pyproject.toml<br>
+index dd885e4..5d4d511 100644<br>
+--- a/pyproject.toml<br>
++++ b/pyproject.toml<br>
+@@ -1,6 +1,6 @@<br>
+ [build-system]<br>
+ # setuptools 64+ support --build-option<br>
+ # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 un=
der Windows<br>
+-requires =3D [&quot;setuptools&gt;=3D64,&lt;74&quot;]<br>
++requires =3D [&quot;setuptools&gt;=3D64&quot;]<br>
+ backend-path =3D [&quot;build_script&quot;]<br>
+ build-backend =3D &quot;pyzstd_pep517&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-pyzstd_=
0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.17.0.bb</a=
> b/meta/recipes-devtools/python/<a href=3D"http://python3-pyzstd_0.17.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.17.0.bb</a><br>
new file mode 100644<br>
index 0000000000..af7069b6ed<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pyzstd_0.17.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.17.0.bb</a><br>
@@ -0,0 +1,20 @@<br>
+DESCRIPTION =3D &quot;Pyzstd module provides classes and functions for com=
pressing and \<br>
+decompressing data, using Facebook=E2=80=99s Zstandard (or zstd as short n=
ame) algorithm.&quot;<br>
+SUMMARY =3D &quot;Python bindings to Zstandard (zstd) compression library&=
quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/animalize/pyzstd" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/animalize/pyzstd</a>&quot;=
<br>
+SECTION =3D &quot;devel/python&quot;<br>
+<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Daedb5a2679cd1552fb61c181ef=
974b9e&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;pyzstd&quot;<br>
+<br>
+SRC_URI +=3D &quot;file://0001-Remove-setuptools-version-limit-of-74.patch=
&quot;<br>
+SRC_URI[sha256sum] =3D &quot;d84271f8baa66c419204c1dd115a4dec8b266f8a2921d=
a21b81764fa208c1db6&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
+<br>
+# clang-16 with -flto segfaults on arm, therefore ignore flto for now<br>
+do_configure:append:arm:toolchain-clang() {<br>
+=C2=A0 =C2=A0 sed -i -e &quot;s|&#39;-flto&#39;|&#39;&#39;|&quot; ${S}/set=
up.py<br>
+}<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228222): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228222" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/228222</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116858017/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116858017/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000011e5ee0646a05b85--

