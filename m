Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9BEFB5E98
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:42:06 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65993.1773708123398147976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XKg/DqLa;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64d5a7926cfso5048347d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773708122; cv=none;
        d=google.com; s=arc-20240605;
        b=Ycpt3hQTxtg0kbdwk3wOkQa8W8KI6Us9TlcClfoE5BPOxJ9Etyo3xhN2vHRU/0Ew2I
         8PnOCLhXFVo2woPkqdbImRNTCNuiWTFUOq8le/CyRP0KDmXF6nGxhQaeBFp2PQpJ6Dd4
         kTbjd7PO8oOlKknZjbHEEauhQO9bJ47G2f56aKtyi17Z2mfE0ePt2IprS4nUa40qOiZJ
         uKK+JWbjxTuWGWR73g3Az+XxXL4qi6sbwdTjhifX346B4ee8gXSNmuUJJc88OT/wfjYW
         9agKuDMyOBi0YOzSIrNEuTM8DM4OT7gsV6Sa5mnnyUSkbrxMsY6SRnF3BvaMYMq68xMU
         t5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6IixNqs48lgSvs0v+eec0b/bCr+IOf8D1ICCk2nMOYI=;
        fh=Bwcj6kAs3AYnqc6ZaGzuuA5GE2EyA/HuIyUMiAHm0WI=;
        b=H7iiqBr1F5GdL0sC/cEvVJOvKT5tL6UHOhe7AxexWBY1gb4kPhDsJeedMBZh6Z6abu
         Yw+1XRtupnkGiz6HeTzO9OetttQQyhcbYMxBDjf8oSbVNwKV9np5sROleu2iA2upuQH3
         4UuIfVpCs1t0h1mJhO7bMO4casaKtg257ix1kWnq3xOTOPUfgOfveXEVZH6au6PgmFxv
         vJAT89s6bIoLxI3R/q2vagcDlE4j6Gv377BXzpmuxklBtyEBoIWY8Yv1xGMF4EJSnIvf
         zvU3cXnGOgUu9/ljVQMUiZbcTjzFYVwo/u7zITHiirXW75ABpE7ZebE7SscoO0/eAND+
         tuhw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773708122; x=1774312922; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6IixNqs48lgSvs0v+eec0b/bCr+IOf8D1ICCk2nMOYI=;
        b=XKg/DqLaHWL4+ZsnrYnj8HfNquXvGYuEgaXN72C2WSp9Bk/lO+uD0Myubtk8IcgsKH
         fIc2X3gg3xyGAbznhYk+RLaJe4/lCuwiWncchyeXvQLITGfyb6hofc3zY6S3nng4/pDD
         LaUb1uptLy+ponTJJx9KV47YhmEF+EAsd7fXXqy1L6mHiahtiVYLfBVQ1y6EugjisQfc
         mGrLUBl7Y/XhYtKDX71MzwQ2tnatbFaKfyScqgg2YjLJawxC0NOgecZlOVg3xldACWnf
         9uiNftxj7ofhUHHnGsQaInmCmjSOSoGhmzyNUmgBJu+OhY/dS1PE/d0x7q0YEgC/a91U
         wmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773708122; x=1774312922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IixNqs48lgSvs0v+eec0b/bCr+IOf8D1ICCk2nMOYI=;
        b=a5yT4jGeXHXCw9Ga0ZENMxYW9HdZbv5bF7uzO+oUTG2oUSggXvqNkzvYvCCYyVvfax
         aHFkql80csuipT8SL7F1yCP5xsB0sK5hl2fJl0KGKb76P0GIuV9qdCXvrA6gdxEu0J9+
         1rd8A9xk4rutLwkrAKhsT5mpnLfF0g0jtXnboWKtJWMASurIVHybPJNkipI2tWYKh1fm
         OUhX2SoMnmQvacYqbGJRaz86Ef6ve0lsxMGLeQiNlOVmdPDZ9nFpaeadJnoOJiBRxTCX
         NyUrjQiUon5bnaH3OECWzli3bt/0r66k/iUhSxbBQJl31tDbk5iiuGOYjkCk/rWDghwG
         VHuw==
X-Gm-Message-State: AOJu0YzDMtf+TirgnyAA7MIfVfRyVdN9PbKKzcONcdYwMSAQHJnSnKJA
	3+v3gvxH4DLUNQJ6HaYqn+BeJJOzU1TZgbLt6Dv/sxQFqqFbNZoOj3DZPkrGWHW3tDXtKmrq6FB
	G73wuZZbiOLVu18+jGSFOA9Tli1LhUMMZVg==
X-Gm-Gg: ATEYQzz+OkCntkPViYUOKaMrf7L7nmCneHNU62GzJLSbghVAQtyOe4ZmJFWEeN5DdqU
	6r35oNCvyJmIOW3KiuzJY3cdyQT7soEPa0vK9GPsfhuHquGMfIo1iJCK9T4fhbGtwf/3b58MIVA
	15qcO+apUFSCsz8jmoTyb3CmMQ5C26iUJjobC2/rzK0MMD18COcc5zbRROmrAF/epBXxM6YNFRk
	Jp18l+F3/3zEGiGWUc6Y3/jL3rTbLmyYU3uYG+5fcMWAlE/qk1oq/xUdd4ydi4RiQgLD0HDHMDe
	g6cv1q44uv1m/pMy4NTr/K89ZzT88Qqi+Isp9RfEcc05E75rjpcME1A6kf7UkDWrDHk8vYJHwPI
	jHjGag8VrAgVMy//sWBER0VQh
X-Received: by 2002:a05:690e:e20:b0:64c:9a19:238 with SMTP id
 956f58d0204a3-64e62f1f3eemr12251032d50.19.1773708122362; Mon, 16 Mar 2026
 17:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com> <20260317-fix-invalid-appends-v2-3-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-3-5c65ae5787d9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2026 17:41:35 -0700
X-Gm-Features: AaiRm52Pm749Sx3hV-hcE5a8B1QkWKTkJD-qwnJsMgIUMbCoZTSM3BEv5-YFvFI
Message-ID: <CAMKF1sqUqJ72+nVorJmCaPoRE0qq-0fWHSkVVVeUsOjM_aU61A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 03/12] expat: Convert confusing append to
 override syntax
To: michalwsieron@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000091984f064d2d9ac5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233288

--00000000000091984f064d2d9ac5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 5:03=E2=80=AFPM Michal Sieron via lists.openembedde=
d.org
<michalwsieron=3Dgmail.com@lists.openembedded.org> wrote:

> While in this case `EXTRA_OECMAKE:class-native +=3D` wouldn't result in
> any unwanted override, there is no guarantee there won't be a change,
> which would be hidden by this override. To avoid any surprises in the
> future let's use `:append:class-native =3D` syntax here.
>
> Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
> ---
>  meta/recipes-core/expat/expat_2.7.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/expat/expat_2.7.4.bb
> b/meta/recipes-core/expat/expat_2.7.4.bb
> index 95a1ed52c4..b3a9d8aa2d 100644
> --- a/meta/recipes-core/expat/expat_2.7.4.bb
> +++ b/meta/recipes-core/expat/expat_2.7.4.bb
> @@ -17,7 +17,7 @@ UPSTREAM_CHECK_REGEX =3D "releases/tag/R_(?P<pver>.+)"
>
>  SRC_URI[sha256sum] =3D
> "e6af11b01e32e5ef64906a5cca8809eabc4beb7ff2f9a0e6aabbd42e825135d0"
>
> -EXTRA_OECMAKE:class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
> +EXTRA_OECMAKE:append:class-native =3D " -DEXPAT_BUILD_DOCS=3DOFF"
>

This is the only EXTRA_OECMAKE setting in recipe. Perhaps just drop +=3D he=
re.


>
>  RDEPENDS:${PN}-ptest +=3D "bash"
>
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233276):
> https://lists.openembedded.org/g/openembedded-core/message/233276
> Mute This Topic: https://lists.openembedded.org/mt/118356435/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000091984f064d2d9ac5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 16,=
 2026 at 5:03=E2=80=AFPM Michal Sieron via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;michalwsieron=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">While in =
this case `EXTRA_OECMAKE:class-native +=3D` wouldn&#39;t result in<br>
any unwanted override, there is no guarantee there won&#39;t be a change,<b=
r>
which would be hidden by this override. To avoid any surprises in the<br>
future let&#39;s use `:append:class-native =3D` syntax here.<br>
<br>
Signed-off-by: Michal Sieron &lt;<a href=3D"mailto:michalwsieron@gmail.com"=
 target=3D"_blank">michalwsieron@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/expat/<a href=3D"http://expat_2.7.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">expat_2.7.4.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/expat/<a href=3D"http://expat_2.7.4.bb" rel=
=3D"noreferrer" target=3D"_blank">expat_2.7.4.bb</a> b/meta/recipes-core/ex=
pat/<a href=3D"http://expat_2.7.4.bb" rel=3D"noreferrer" target=3D"_blank">=
expat_2.7.4.bb</a><br>
index 95a1ed52c4..b3a9d8aa2d 100644<br>
--- a/meta/recipes-core/expat/<a href=3D"http://expat_2.7.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">expat_2.7.4.bb</a><br>
+++ b/meta/recipes-core/expat/<a href=3D"http://expat_2.7.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">expat_2.7.4.bb</a><br>
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/R_(?P&lt;pver=
&gt;.+)&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e6af11b01e32e5ef64906a5cca8809eabc4beb7f=
f2f9a0e6aabbd42e825135d0&quot;<br>
<br>
-EXTRA_OECMAKE:class-native +=3D &quot;-DEXPAT_BUILD_DOCS=3DOFF&quot;<br>
+EXTRA_OECMAKE:append:class-native =3D &quot; -DEXPAT_BUILD_DOCS=3DOFF&quot=
;<br></blockquote><div><br></div><div>This is the only EXTRA_OECMAKE settin=
g in recipe. Perhaps just drop=C2=A0<a class=3D"gmail_plusreply" id=3D"plus=
ReplyChip-0">+=3D here.</a></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot;bash&quot;<br>
<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233276): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233276" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233276</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118356435/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118356435/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000091984f064d2d9ac5--

