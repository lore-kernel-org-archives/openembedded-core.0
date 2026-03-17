Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F20CFB5E97
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:39:16 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65931.1773707954716954775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VWOc4+Vh;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64caaacb9bcso5433331d50.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773707954; cv=none;
        d=google.com; s=arc-20240605;
        b=dSKIfN2HCYGAUFm7HdQG+xUTTd+I0G2/C61ZiLxrMQy+qxBT6IM6Vp125Kjznxm7UZ
         9EvVS/2Rs2dKHS1dXZhRb18hTnLlCy3FMdukXIabQjTxhtj6csi0DSZNWurfv+bu8zxj
         923lHZsjbLCCs0lwo8xTHhV8bZbtO3VKkiVu/WWfQ5Hufa2prQeHMLxLYHg1GhZOsA7b
         UgVa0QsIoPCbPdU/FyQ4XqVa8zBmfrMLQEZIU7Dv67783CUK1z5tMcd9Sz2mvhwSgH5/
         ziPPJm/vxnrzWdavJ3AQBlEIDdq1EQIL1W9+WA/QGjuTWVnhUynwg6Hplz/Tv/+/qv5g
         DB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bEvEV6cbjSXXmQsYo17DFlNBGFfQr3kkxTscaBl+RdA=;
        fh=Bwcj6kAs3AYnqc6ZaGzuuA5GE2EyA/HuIyUMiAHm0WI=;
        b=bbG7XJ4DU4f6SVXRwDfYI0IhvkPbFGyeQPQo7zft3tspHTq4l/uGgtKbi8GKvrla1W
         JFLyBJUPURIvhR4wU7P+kcnVOf0rIuHgy8MvldGOMFGcSep6WVu8oJ2bCmbkcuBlzMuW
         tbf9RA7vdcjeyJjsrghxEQSAAP3jcNAIJQdoP8IuinpfWcpmGdAD48jlU3t8Hb8QOOA1
         N1q5yCpgct3RrmJw2PMECG54PaLnmrVSnF1sCxk6Uinl+gZwh7yAjVSL6nbAmXNV3HRb
         3lRmTWJ00h4VcxsABLMKvnCSoYrptcieULjCZDc+fzxdEM578R2SbLTisQGfJOYHB7wQ
         qEBg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773707954; x=1774312754; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bEvEV6cbjSXXmQsYo17DFlNBGFfQr3kkxTscaBl+RdA=;
        b=VWOc4+VhjP1Sz7IcsJL7anotG44LmHSJfAoz80htdIiATjN8+TF4jcJiflN+ngCxJq
         RfQdTr7LS6duN2yRHkxhDYiK4VqWbvqVEp2qmn9PHGfEd/cFXmUR76gxbZ86kN9lfhvm
         QOV/ue0BbBNCu1jYtveqqUR7fHso4ms5Gg5/Xwgyy6DPVL6GfdR1rDXCaAjm7LcV9+wS
         f0+0iLVr8qyfb3tLm7U835YoYqMBJXxqeJhtfIOTohArFydSXJ0758mHgvzziQPPsRSd
         Ipb3S96EwsOIvZeaNg+Uiom0V60MOQRSLLPwzwkL+sZfzWm6Z8y0k7h8vHQ3whk1CHfG
         n/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773707954; x=1774312754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEvEV6cbjSXXmQsYo17DFlNBGFfQr3kkxTscaBl+RdA=;
        b=O9Rh0bxTH47pIqbBFpzPBxutEn5nWMU4L7XXe2QYnZX7ofZ9pxKtrcDMkWw9lS2jHU
         pCUTeMmgbvAxrQcNVKz5bZuzZV8oiC7Ahgnl8Ju37eC4EfmqWZT/PkIIns2cT3FSIYvh
         HydVfpakShOkoIfPaa+i5BSU1xbB/6KF3cFcb5tz8rMq0riUxjGgYKUMHxjv0nEE+VBk
         W+/g6KV7CfEd8K3e/Qhs3i14ViR0kHSaQBo0X1/WgY5DuKvPkUyonal2MWgoEc8gxE25
         sskQG7uKUNfzKX8NQYcbjbIxwzX3AOUQjbSFCtaXbQxR772HgifvgZ5DTYct2w7Djaix
         XNsg==
X-Gm-Message-State: AOJu0YwHRIQ9ghm9l56Elg5c/NRq683XDsWjxd6QRPxFrR4m//MiQtzB
	qnPHjVl6mLCsu7EU6Vg4/kpRzG8ytMUOb2kGEZnoeadhGUAYMpLBAmoy0OQzfG6cBw4LKROd6r+
	n8M1LvhLDbyi/V5rWuWbsgeyeFluxLOiCtyS4
X-Gm-Gg: ATEYQzzzrAMZ3W+rW1ogSCxn8mO777PK4brBNFRIvpp2nfpa62F6P9fYBWNr5Xq5CYb
	5CnQKahwMfiM9YS2uIaoeSaYOKpYzk0gqsGRYfZsawGhoFya/mNjcipA7d65GhmM+Tx+svlhH7+
	Ek1/FHVudbtKpI80Lzu+divKvegKM5nFbcC6lMNltc+a5iikZnlLbV03AiGrcjIeFZ1y77Vats9
	Zzg5QaNh3wgDS78MmRnU1s4VyXmPn9ajyaSJ/7OZyz2Ud3kd5eN6DgXeJ/nm61CojbV7JTj14YT
	F59KLQrcc9zItPtLev1Ul7yInB3nNIhw5Op/u7qUOP2ocSHGaPksu37Xp+bWNIVWnVh3gdNMzU4
	tfcXhZ1ROzGlZn34+kCWrFQWY
X-Received: by 2002:a05:690e:b86:b0:64e:79a5:4032 with SMTP id
 956f58d0204a3-64e79a54920mr6136451d50.81.1773707953730; Mon, 16 Mar 2026
 17:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com> <20260317-fix-invalid-appends-v2-1-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-1-5c65ae5787d9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2026 17:38:47 -0700
X-Gm-Features: AaiRm52IaHG3N5qWev56H-QbwCprxpBXcigsZsSdQugCIAn7I5fc-TYTIqkSB1k
Message-ID: <CAMKF1sox4WC2xCRK+j3m3dvX-mvMy+PZA=FZHC0V8VPx8vgbOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 01/12] libffi: Fix invalid conditional append
To: michalwsieron@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000084769b064d2d9099"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233287

--00000000000084769b064d2d9099
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 5:03=E2=80=AFPM Michal Sieron via lists.openembedde=
d.org
<michalwsieron=3Dgmail.com@lists.openembedded.org> wrote:

> `EXTRA_OECONF:class-native +=3D` was actually overriding previously set
> `EXTRA_OECONF`.
>
> Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
> ---
>  meta/recipes-support/libffi/libffi_3.5.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb
> b/meta/recipes-support/libffi/libffi_3.5.2.bb
> index f648a33a46..2b2a368151 100644
> --- a/meta/recipes-support/libffi/libffi_3.5.2.bb
> +++ b/meta/recipes-support/libffi/libffi_3.5.2.bb
> @@ -16,7 +16,7 @@ SRC_URI =3D
> "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
>  SRC_URI[sha256sum] =3D
> "f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc"
>
>  EXTRA_OECONF +=3D "--disable-builddir --disable-exec-static-tramp"
> -EXTRA_OECONF:class-native +=3D "--with-gcc-arch=3Dgeneric"
> +EXTRA_OECONF:append:class-native =3D " --with-gcc-arch=3Dgeneric"
>

Usually we want to use default options for native builds and accidentally
this was being done
when you fix it, I think it is better to assess that and see if it should
be appended or it should be
overridden, In this case override seems more appropriate, making it

EXTRA_OECONF:class-native =3D "--with-gcc-arch=3Dgeneric"

might be closer to intention.

 EXTRA_OEMAKE:class-target =3D "LIBTOOLFLAGS=3D'--tag=3DCC'"
>
>  inherit autotools texinfo multilib_header github-releases
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233274):
> https://lists.openembedded.org/g/openembedded-core/message/233274
> Mute This Topic: https://lists.openembedded.org/mt/118356433/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000084769b064d2d9099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 16,=
 2026 at 5:03=E2=80=AFPM Michal Sieron via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;michalwsieron=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">`EXTRA_OE=
CONF:class-native +=3D` was actually overriding previously set<br>
`EXTRA_OECONF`.<br>
<br>
Signed-off-by: Michal Sieron &lt;<a href=3D"mailto:michalwsieron@gmail.com"=
 target=3D"_blank">michalwsieron@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/libffi/<a href=3D"http://libffi_3.5.2.bb" rel=3D=
"noreferrer" target=3D"_blank">libffi_3.5.2.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/libffi/<a href=3D"http://libffi_3.5.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">libffi_3.5.2.bb</a> b/meta/recipes-su=
pport/libffi/<a href=3D"http://libffi_3.5.2.bb" rel=3D"noreferrer" target=
=3D"_blank">libffi_3.5.2.bb</a><br>
index f648a33a46..2b2a368151 100644<br>
--- a/meta/recipes-support/libffi/<a href=3D"http://libffi_3.5.2.bb" rel=3D=
"noreferrer" target=3D"_blank">libffi_3.5.2.bb</a><br>
+++ b/meta/recipes-support/libffi/<a href=3D"http://libffi_3.5.2.bb" rel=3D=
"noreferrer" target=3D"_blank">libffi_3.5.2.bb</a><br>
@@ -16,7 +16,7 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}/${BP=
N}-${PV}.tar.gz \<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;f3a3082a23b37c293a4fcd1053147b371f2ff91f=
a7ea1b2a52e335676bac82dc&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--disable-builddir --disable-exec-static-tram=
p&quot;<br>
-EXTRA_OECONF:class-native +=3D &quot;--with-gcc-arch=3Dgeneric&quot;<br>
+EXTRA_OECONF:append:class-native =3D &quot; --with-gcc-arch=3Dgeneric&quot=
;<br></blockquote><div><br></div><div>Usually we want to use default option=
s for native builds and accidentally this was being done</div><div>when you=
 fix it, I think it is better to assess that and see if it should be append=
ed or it should be</div><div>overridden, In this case override seems more a=
ppropriate, making it</div><div>=C2=A0</div><div>EXTRA_OECONF:class-native =
=3D &quot;--with-gcc-arch=3Dgeneric&quot;</div><div><br></div><div>might be=
 closer to intention.</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
=C2=A0EXTRA_OEMAKE:class-target =3D &quot;LIBTOOLFLAGS=3D&#39;--tag=3DCC&#3=
9;&quot;<br>
<br>
=C2=A0inherit autotools texinfo multilib_header github-releases<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233274): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233274" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233274</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118356433/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118356433/1997914</a><br>
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

--00000000000084769b064d2d9099--

