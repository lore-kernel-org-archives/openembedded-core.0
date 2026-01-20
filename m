Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F2BD2628D
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:51:49 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13819.1768935104364459487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PrBJXUUV;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so3012470f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 10:51:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768935103; cv=none;
        d=google.com; s=arc-20240605;
        b=IUXaY3jhAntm8UePWC9VULpGq6on7aovm2EZD/WjfgVm7336h4yOuMXPldzB7MhqZV
         0YXRiCwsav0HkU+EAZPopbesy1MWRQS/Y4biGwgkMeyPnF343uxistdEcTdvf5jeifp7
         zbd7a4MWEhNT9uXD79kFAKgMuFho7rHGt35ypEOgcMSAm82+UuztnCCEwr30NPamr0ql
         wFstBIEFBJSs8jfWi+m3ga/kp6NHSZWUrkzrOW0WWjhVm0yYTimYToJGwbp7EC9CUGY7
         ptURhQYZhnEhweGDAm4nnGOyRlztEfn4Q7x8l3l+mjrgardtHRv27zLYFYF/LGg7qy55
         vwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=voUeUNmn8Ce4V6yhfnKC39FDpHk/rUkrUGfsp93uO5Q=;
        fh=dI4eGhhXRYQf7RsXLxEGaKg0Olh6BsHtf/nuVeEubBo=;
        b=kXoTw2q/t+b03zSLuPhkEklMipEvQaBh5E+Hgps1sbdqUlf95zSvWO+B38MSqZTXfx
         +WsdaJWHvRLq57bNvhWrNXdmHg3JflwcpetmshZQmMh5WKbrvXIER4cuL2INXYtWrrjT
         jcEln4I6e1o2CgS/lAC19Ks4Da/ACP301mqlYtBjylvRYTS90331HmThQWjl8G8LwtpM
         Co0MI9gUfjT0xbEAe6bZBiEVWPNeOkhhd0SPGRvD5o4zT/xirtx5ZLM4DY18fvWtwuFV
         gqu1mjU8c7Qtz6KorlkTIC0h64F4AOmDTO/II5Vys7wWfjETgiGsuJvd83Us33V+Z7v6
         Sang==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768935103; x=1769539903; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=voUeUNmn8Ce4V6yhfnKC39FDpHk/rUkrUGfsp93uO5Q=;
        b=PrBJXUUVQq6jeHLtt8bkiZZFfWMcau+H6+IN0CHUfnpSexHh516HP8a3mz2h4Qh52L
         XVCBiFgEVy2AXZv+Mm9UEEOepqdkleglxAkKh9uyC5tlAmIHLJfMOBMiiGa27ug5C5Ar
         DJR30617zkyHMaH1uYFDQx6swYffOqLOZQdaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935103; x=1769539903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voUeUNmn8Ce4V6yhfnKC39FDpHk/rUkrUGfsp93uO5Q=;
        b=sZb/+8JbqEPsuuXpzO4EQ3I05+gxoDImj5mO4HrJb3qJBr+peYyqwr1VaR0dZI9PTS
         2EhenBEqFIAl/rBu/x2XcH6ebY9nBgWM+8QzsCoRsN6Ru3FSLyzqAJ3KxLAwJfaMuZNK
         3Fwy48UEyONJcFYnaztHClPkDOFVeWhaOA1gXf6J6bdVvcrHO7dbJF5gV1puxq7TrtUm
         yF0f4NVF4GrF1THzNskL/Ps3Z1lnjes9yliqWvZyS0VmTa/eKbqP8XZ2qyJi7ExbSe34
         YyOdFBOv36V0ZynQvfxWufgxeet6QABbwevXO2+KVj+oxVoKZek4tSdJKE0fGoAt0MQd
         r/jQ==
X-Gm-Message-State: AOJu0YxHGDkBHbhNwphsYA9W8SYV8oqQcuBrqMbFROy7q5/AE+YPjrd3
	zayWpKboWFaTTpDzSNlc9MU4NwS8Vj/SzWwVJz6whophl2ZJCWQ64UbgJCX9flIuH0+mg/zdRcG
	PtNAQyncK0f3Fg9aSeNguMyMyo3mDRk3szntbqSUQYs2bCnnkGsUMb30=
X-Gm-Gg: AZuq6aKe+ubTM6MIzUVd2WjdDP1mCETvilrgzErslQq4iW/5KENySCekTSXRwzCXYSg
	z6gnkOa1+HrmHIKwV5THUPp/V9weIW6u2J42uciOWVuW8WvDfWMgvoP38Y9NDunoY08MZVG6y+Y
	mLSvUif6nvnCmKqkD13MphOs+W10Lopru7G0nUcabKQO7PpsoBLditZUo+KARYC9pv2ffceUkcX
	W5ZsIpB4bYx6dVgou+AZkRRQEKT2BGij16mF0NauXtWZKwNMTRLYgHNVWMqqAiS7UqioqQYUTEQ
	4Lo7lRLHbBlaN443Ly3HMp0N41G0mg==
X-Received: by 2002:a05:6000:40cc:b0:431:3ba:1188 with SMTP id
 ffacd0b85a97d-4358ff3f0a3mr4741054f8f.3.1768935102390; Tue, 20 Jan 2026
 10:51:42 -0800 (PST)
MIME-Version: 1.0
References: <20260120135243.2125879-1-peter.marko@siemens.com>
In-Reply-To: <20260120135243.2125879-1-peter.marko@siemens.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 20 Jan 2026 19:51:15 +0100
X-Gm-Features: AZwV_QjJHWKGUAVNCpI26K_DQ2ncrgPJhtdRolBK2bf-hlnGxyvAZ7rh1Aa3BuM
Message-ID: <CAMSfU+4mzOQ2HM31UVdM9z979wmYAzs+zrpaVwYuD7z5Mq=8Yw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v2] python3-urllib3: patch CVE-2025-66418
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000068b7e00648d64cdd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229785

--00000000000068b7e00648d64cdd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 20 janv. 2026 =C3=A0 14:52, Peter Marko via lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :

> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch per [1].
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-66418
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>

Thanks for the quick update!

I've taken this in my stable/kirkstone-nut branch and rebuilt a-full which
succeeded :
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3097
I will include this v2 in my pull request.


> ---
>  .../python3-urllib3/CVE-2025-66418.patch      | 74 +++++++++++++++++++
>  .../python/python3-urllib3_1.26.20.bb         |  1 +
>  2 files changed, 75 insertions(+)
>  create mode 100644
> meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
>
> diff --git
> a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
> b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
> new file mode 100644
> index 00000000000..b490019d877
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
> @@ -0,0 +1,74 @@
> +From 24d7b67eac89f94e11003424bcf0d8f7b72222a8 Mon Sep 17 00:00:00 2001
> +From: Illia Volochii <illia.volochii@gmail.com>
> +Date: Fri, 5 Dec 2025 16:41:33 +0200
> +Subject: [PATCH] Merge commit from fork
> +
> +* Add a hard-coded limit for the decompression chain
> +
> +* Reuse new list
> +
> +CVE: CVE-2025-66418
> +Upstream-Status: Backport [
> https://github.com/urllib3/urllib3/commit/24d7b67eac89f94e11003424bcf0d8f=
7b72222a8
> ]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + changelog/GHSA-gm62-xv2j-4w53.security.rst |  4 ++++
> + src/urllib3/response.py                    | 12 +++++++++++-
> + test/test_response.py                      | 10 ++++++++++
> + 3 files changed, 25 insertions(+), 1 deletion(-)
> + create mode 100644 changelog/GHSA-gm62-xv2j-4w53.security.rst
> +
> +diff --git a/changelog/GHSA-gm62-xv2j-4w53.security.rst
> b/changelog/GHSA-gm62-xv2j-4w53.security.rst
> +new file mode 100644
> +index 00000000..6646eaa3
> +--- /dev/null
> ++++ b/changelog/GHSA-gm62-xv2j-4w53.security.rst
> +@@ -0,0 +1,4 @@
> ++Fixed a security issue where an attacker could compose an HTTP response
> with
> ++virtually unlimited links in the ``Content-Encoding`` header, potential=
ly
> ++leading to a denial of service (DoS) attack by exhausting system
> resources
> ++during decoding. The number of allowed chained encodings is now limited
> to 5.
> +diff --git a/src/urllib3/response.py b/src/urllib3/response.py
> +index 4ba42136..069f726c 100644
> +--- a/src/urllib3/response.py
> ++++ b/src/urllib3/response.py
> +@@ -135,8 +135,18 @@ class MultiDecoder(object):
> +         they were applied.
> +     """
> +
> ++    # Maximum allowed number of chained HTTP encodings in the
> ++    # Content-Encoding header.
> ++    max_decode_links =3D 5
> ++
> +     def __init__(self, modes):
> +-        self._decoders =3D [_get_decoder(m.strip()) for m in
> modes.split(",")]
> ++        encodings =3D [m.strip() for m in modes.split(",")]
> ++        if len(encodings) > self.max_decode_links:
> ++            raise DecodeError(
> ++                "Too many content encodings in the chain: "
> ++                f"{len(encodings)} > {self.max_decode_links}"
> ++            )
> ++        self._decoders =3D [_get_decoder(e) for e in encodings]
> +
> +     def flush(self):
> +         return self._decoders[0].flush()
> +diff --git a/test/test_response.py b/test/test_response.py
> +index 9592fdd9..d824ae70 100644
> +--- a/test/test_response.py
> ++++ b/test/test_response.py
> +@@ -295,6 +295,16 @@ class TestResponse(object):
> +
> +         assert r.data =3D=3D b"foo"
> +
> ++    def test_read_multi_decoding_too_many_links(self) -> None:
> ++        fp =3D BytesIO(b"foo")
> ++        with pytest.raises(
> ++            DecodeError, match=3D"Too many content encodings in the cha=
in:
> 6 > 5"
> ++        ):
> ++            HTTPResponse(
> ++                fp,
> ++                headers=3D{"content-encoding": "gzip, deflate, br, zstd=
,
> gzip, deflate"},
> ++            )
> ++
> +     def test_body_blob(self):
> +         resp =3D HTTPResponse(b"foo")
> +         assert resp.data =3D=3D b"foo"
> diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
> b/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
> index 58988e42055..1f1132d5b5d 100644
> --- a/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
> +++ b/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
> @@ -9,6 +9,7 @@ inherit pypi setuptools3
>
>  SRC_URI +=3D " \
>      file://CVE-2025-50181.patch \
> +    file://CVE-2025-66418.patch \
>  "
>
>  RDEPENDS:${PN} +=3D "\
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229735):
> https://lists.openembedded.org/g/openembedded-core/message/229735
> Mute This Topic: https://lists.openembedded.org/mt/117362843/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000068b7e00648d64cdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 20=
 janv. 2026 =C3=A0=C2=A014:52, Peter Marko via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailt=
o:siemens.com@lists.openembedded.org">siemens.com@lists.openembedded.org</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com"=
 target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
Pick patch per [1].<br>
<br>
[1] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2025-66418" rel=3D"nore=
ferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2025-66418</=
a><br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br></blockquote><div><br><=
/div><div>Thanks for the quick update!</div><div><br></div><div>I&#39;ve ta=
ken this in my stable/kirkstone-nut branch and rebuilt a-full which succeed=
ed :</div><div><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/=
builders/29/builds/3097">https://autobuilder.yoctoproject.org/valkyrie/?#/b=
uilders/29/builds/3097</a></div><div>I will include this v2 in my pull requ=
est.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
---<br>
=C2=A0.../python3-urllib3/CVE-2025-66418.patch=C2=A0 =C2=A0 =C2=A0 | 74 +++=
++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-urllib3_1.26.20.bb" rel=3D"noref=
errer" target=3D"_blank">python3-urllib3_1.26.20.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 75 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2=
025-66418.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.pa=
tch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch<br>
new file mode 100644<br>
index 00000000000..b490019d877<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch<br>
@@ -0,0 +1,74 @@<br>
+From 24d7b67eac89f94e11003424bcf0d8f7b72222a8 Mon Sep 17 00:00:00 2001<br>
+From: Illia Volochii &lt;<a href=3D"mailto:illia.volochii@gmail.com" targe=
t=3D"_blank">illia.volochii@gmail.com</a>&gt;<br>
+Date: Fri, 5 Dec 2025 16:41:33 +0200<br>
+Subject: [PATCH] Merge commit from fork<br>
+<br>
+* Add a hard-coded limit for the decompression chain<br>
+<br>
+* Reuse new list<br>
+<br>
+CVE: CVE-2025-66418<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/urllib3/urllib3/c=
ommit/24d7b67eac89f94e11003424bcf0d8f7b72222a8" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/urllib3/urllib3/commit/24d7b67eac89f94e11003=
424bcf0d8f7b72222a8</a>]<br>
+Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
+---<br>
+ changelog/GHSA-gm62-xv2j-4w53.security.rst |=C2=A0 4 ++++<br>
+ src/urllib3/response.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 12 +++++++++++-<br>
+ test/test_response.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++++++++<br>
+ 3 files changed, 25 insertions(+), 1 deletion(-)<br>
+ create mode 100644 changelog/GHSA-gm62-xv2j-4w53.security.rst<br>
+<br>
+diff --git a/changelog/GHSA-gm62-xv2j-4w53.security.rst b/changelog/GHSA-g=
m62-xv2j-4w53.security.rst<br>
+new file mode 100644<br>
+index 00000000..6646eaa3<br>
+--- /dev/null<br>
++++ b/changelog/GHSA-gm62-xv2j-4w53.security.rst<br>
+@@ -0,0 +1,4 @@<br>
++Fixed a security issue where an attacker could compose an HTTP response w=
ith<br>
++virtually unlimited links in the ``Content-Encoding`` header, potentially=
<br>
++leading to a denial of service (DoS) attack by exhausting system resource=
s<br>
++during decoding. The number of allowed chained encodings is now limited t=
o 5.<br>
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py<br>
+index 4ba42136..069f726c 100644<br>
+--- a/src/urllib3/response.py<br>
++++ b/src/urllib3/response.py<br>
+@@ -135,8 +135,18 @@ class MultiDecoder(object):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0they were applied.<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+ <br>
++=C2=A0 =C2=A0 # Maximum allowed number of chained HTTP encodings in the<b=
r>
++=C2=A0 =C2=A0 # Content-Encoding header.<br>
++=C2=A0 =C2=A0 max_decode_links =3D 5<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0def __init__(self, modes):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._decoders =3D [_get_decoder(m.strip()) f=
or m in modes.split(&quot;,&quot;)]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 encodings =3D [m.strip() for m in modes.split=
(&quot;,&quot;)]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(encodings) &gt; self.max_decode_links:=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DecodeError(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Too many co=
ntent encodings in the chain: &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;{len(encod=
ings)} &gt; {self.max_decode_links}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._decoders =3D [_get_decoder(e) for e in =
encodings]<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def flush(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self._decoders[0].flush()<br>
+diff --git a/test/test_response.py b/test/test_response.py<br>
+index 9592fdd9..d824ae70 100644<br>
+--- a/test/test_response.py<br>
++++ b/test/test_response.py<br>
+@@ -295,6 +295,16 @@ class TestResponse(object):<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert r.data =3D=3D b&quot;foo&quot;<br=
>
+ <br>
++=C2=A0 =C2=A0 def test_read_multi_decoding_too_many_links(self) -&gt; Non=
e:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fp =3D BytesIO(b&quot;foo&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 with pytest.raises(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DecodeError, match=3D&quot;Too =
many content encodings in the chain: 6 &gt; 5&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HTTPResponse(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fp,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 headers=3D{&quot;=
content-encoding&quot;: &quot;gzip, deflate, br, zstd, gzip, deflate&quot;}=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0def test_body_blob(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resp =3D HTTPResponse(b&quot;foo&quot;)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert resp.data =3D=3D b&quot;foo&quot;=
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-urllib3=
_1.26.20.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_1.26.20.b=
b</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-urllib3_1.26=
.20.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_1.26.20.bb</a>=
<br>
index 58988e42055..1f1132d5b5d 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-urllib3_1.26.2=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_1.26.20.bb</a><b=
r>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-urllib3_1.26.2=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_1.26.20.bb</a><b=
r>
@@ -9,6 +9,7 @@ inherit pypi setuptools3<br>
<br>
=C2=A0SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2025-50181.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2025-66418.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229735): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229735" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229735</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117362843/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117362843/4316185</a><br>
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

--00000000000068b7e00648d64cdd--

