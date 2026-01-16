Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1931ED4A618
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:27:05 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2391.1768555618591827955
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RbBsxRbo;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: adam.blank.g@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-45ca0d06eddso261751b6e.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768555618; cv=none;
        d=google.com; s=arc-20240605;
        b=MtveZ+Sy7Al4QhdcUQQ6WAaXlhHHqWE/LpeSyD4pXXvTiMOT8IYkkUPH1SWhQpdRzQ
         4ah8QZIDon0ytRAOtjEjmTY78RbjPYT2n29IZfHPWbHZjrSzRjNaS2WEBFOkSjEwVEzi
         o36IZ+lD3yUT6NJFHifpHeWZfQPxxoUtSrnGyPh4mg8QNefsn8U7GsNkrgwRtOULmWKe
         5VnyMr4S5Mblx2jWvlA7NADMDls4ELiPcssxv7JlrEs8B2NUYkwpCcfW4zm796uS0/VE
         khkIK6wdHImDUmJsGk1bAz+dl+vsdrxg/ARlLvSThSmLllTquIdRkukxfepzx0jZPbxg
         15tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZG8siqcv8ZqptGXt+w7RZNK6PmPxLIiAF+ARgLsjM44=;
        fh=5si+aTY3zLMbGb8pgLJkpHH+NdQED4AR7XslrZooFfs=;
        b=NKZMpvR82RReLV+rzXVAqXZzy3c2lzPGXT7TWVCtDQ2rmzl3GtisNtGmZXjTV0pJUB
         Rj76//jMtUQbQg1ecnuTWrNXJXl2BJhP5poIE13pkTr9ekvOgsziQOgQPnBTYLBVmMLX
         Vex/oenS0449hHkiaLwfdETmStZJopwHy9n+VNqcj0NRgmxKEPWQOqnK1AQ5ySZfCaEf
         dFRWbXwWpatzDOwh4TyG8khegftjR0vicjvSCzj3v9MDR5ADfijBmNujTvKWgRRl1ThH
         mqLPISna8aZxUNqzxMN2jgQIjX2IzfUgyG2uOlfSZMWotd71EBHPslTJb6xnVjcyNwAV
         HR+g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768555618; x=1769160418; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZG8siqcv8ZqptGXt+w7RZNK6PmPxLIiAF+ARgLsjM44=;
        b=RbBsxRbo+0mxD18jRlsIhD+j5i+oiJCZnuoGMuKrjjld1r7L08PTHd45HAoRUgC+vS
         H/9dZ6u1PlxFyLDuyO1AhRWL/ckfVHpPUQNIIg8fzwubMd+5TqnVE/k+owkLFqFmd8u2
         5tYrui1UOmvfQUDyxYxv+HOCrUsDRLcioKL9g/NQm8wG14p4AthVuuSJ/yCOYdFb1RzH
         1RSGo2acUz67tl+P+joBi1zQg77elkJIfbQzWB71ZmPSO7jnjlaI6by/ysvNrpDbtpJk
         oYVOu4AgYCGbjd55qqYv995oC6QCs8GFuZmspmzuHzsIFxheE2w40zZjfAFs6+pOlzAi
         YqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555618; x=1769160418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZG8siqcv8ZqptGXt+w7RZNK6PmPxLIiAF+ARgLsjM44=;
        b=ZmDxIZA4TbKc6+Jb2UunJHzIQvcWeR1/w4Md3fOZiUOMtJPIqfmvRfhvx+0MVx0oIL
         X9Y6mzJaxnAfc1gcAhJ1abHm5pcUHrInlwOlBiyJlwIT7Yt//lH0pJtpEKSLDNFBx4yd
         TV24zVIlEGG30wgmUFIuEe/m2VnjL34S818L6WCaNt74hs+fVyRD1HdQCQPX3naJxrvl
         QjxsSzYwm7AaWTBRkgCSsR/JUbeI4dY5PW09kSMqpCM/2WCgegesuoqM77G9JLG2MfmL
         jWxUClX85BQwB/Z/btRYHVm0GFuAIALp+gSBhs/6sJuN6SJnaNIP0NANE7DPGCeZN//I
         btRQ==
X-Gm-Message-State: AOJu0Yysy/rFmwcMNodLrNpsidGjzihlY0ZwlXeDmGsz9M14GM1eETS7
	LcpBI9shW//HUz1dLDueNA5+wwiYACiyM6p72ciXiW88h/ODgqEBYwNWnRF1oGVIn3JBRe2LGD3
	bG1Y8mqyB9dnj3U3MKU3A1Cuyht8wj0e7xQ==
X-Gm-Gg: AY/fxX58rkmsud+504FLiWxxwsjtjQBfNmUBuq+vNId8NoE9qIqpKTAn8/43AGvkOe+
	VUV4s4Jh4Ywm7KTmtyOJdatSvVEw4jbOXbF8xoL4scRl8hGA2kX0CJhMIPZahQJcWyGVH5o6iCL
	aYb1eRfn2zwEUDzT3pSKJ0k+l8DVVjC1OFJrs01W2DRC429wuOIrRThLsrltrX2Iwh46ghZgqeE
	CU05MbevqyBhwmoAgw6M18/CMo51+siM0xKJoRfqbrJGuqBSXy+d+jpvHHtRzhdGoSKDlbcPGFQ
	L7wGQO36
X-Received: by 2002:a05:6808:150e:b0:45c:9737:f0c5 with SMTP id
 5614622812f47-45c9c0f0873mr923324b6e.33.1768555617788; Fri, 16 Jan 2026
 01:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20251231-buildhistory-fix-sortpkglist-v1-1-7737a3232be4@gmail.com>
In-Reply-To: <20251231-buildhistory-fix-sortpkglist-v1-1-7737a3232be4@gmail.com>
From: Adam Blank <adam.blank.g@gmail.com>
Date: Fri, 16 Jan 2026 10:26:55 +0100
X-Gm-Features: AZwV_QjCxl21ELzwv8TXth7-aHhKZksRqT2KtTyMzfjmdsHrgfXtM6RW55tucac
Message-ID: <CAFAffzywtfAcJfeYaOWzvhKu=SYz7Yydv2C0Hk=4+sw0Jr+iRQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] buildhistory: fix handling of RDEPENDS style strings
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="0000000000005d26b206487df16c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229528

--0000000000005d26b206487df16c
Content-Type: text/plain; charset="UTF-8"

Hello,

I could see this patch making its way up to master-next of
openembedded-core on January 8th, but now it's gone...
Is there a problem with it?

Thanks,
Adam

On Wed, 31 Dec 2025 at 12:21, Adam Blank <adam.blank.g@gmail.com> wrote:

> RDEPENDS style strings are regex searched for entries matching
> the usual, allowed package names (plus possible version flags).
> RPROVIDES however, is also allowed to contain actual file paths
> like '/bin/sh', which get broken by the current implementation.
>
> Use bb.utils to handle RDEPENDS style stings.
>
> Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index 4a380c10c6..78037a6462 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -187,10 +187,7 @@ python buildhistory_emit_pkghistory() {
>              return None
>
>      def sortpkglist(string):
> -        pkgiter = re.finditer(r'[a-zA-Z0-9.+-]+( \([><=]+[^)]+\))?',
> string, 0)
> -        pkglist = [p.group(0) for p in pkgiter]
> -        pkglist.sort()
> -        return ' '.join(pkglist)
> +        return bb.utils.join_deps(bb.utils.explode_dep_versions2(string),
> False)
>
>      def sortlist(string):
>          items = string.split(' ')
>
> ---
> base-commit: 2e10e9a50f12d5de3d22fbed59b65461afa3fa84
> change-id: 20251217-buildhistory-fix-sortpkglist-8adbcccffc7e
>
> Best regards,
> --
> Adam Blank <adam.blank.g@gmail.com>
>
>

--0000000000005d26b206487df16c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hel=
lo,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">I could see this patc=
h making its way up to master-next of openembedded-core on January 8th, but=
 now it&#39;s gone...</div><div class=3D"gmail_default" style=3D"font-size:=
small">Is there a problem with it?</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Thanks,</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Adam</div></div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, 31 Dec 2025 at 12:21, Adam Blan=
k &lt;<a href=3D"mailto:adam.blank.g@gmail.com">adam.blank.g@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">RDEPE=
NDS style strings are regex searched for entries matching<br>
the usual, allowed package names (plus possible version flags).<br>
RPROVIDES however, is also allowed to contain actual file paths<br>
like &#39;/bin/sh&#39;, which get broken by the current implementation.<br>
<br>
Use bb.utils to handle RDEPENDS style stings.<br>
<br>
Signed-off-by: Adam Blank &lt;<a href=3D"mailto:adam.blank.g@gmail.com" tar=
get=3D"_blank">adam.blank.g@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/buildhistory.bbclass | 5 +----<br>
=C2=A01 file changed, 1 insertion(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass<br>
index 4a380c10c6..78037a6462 100644<br>
--- a/meta/classes/buildhistory.bbclass<br>
+++ b/meta/classes/buildhistory.bbclass<br>
@@ -187,10 +187,7 @@ python buildhistory_emit_pkghistory() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return None<br>
<br>
=C2=A0 =C2=A0 =C2=A0def sortpkglist(string):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgiter =3D re.finditer(r&#39;[a-zA-Z0-9.+-]+(=
 \([&gt;&lt;=3D]+[^)]+\))?&#39;, string, 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkglist =3D [p.group(0) for p in pkgiter]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkglist.sort()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39; &#39;.join(pkglist)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bb.utils.join_deps(bb.utils.explode_dep=
_versions2(string), False)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def sortlist(string):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0items =3D string.split(&#39; &#39;)<br>
<br>
---<br>
base-commit: 2e10e9a50f12d5de3d22fbed59b65461afa3fa84<br>
change-id: 20251217-buildhistory-fix-sortpkglist-8adbcccffc7e<br>
<br>
Best regards,<br>
-- <br>
Adam Blank &lt;<a href=3D"mailto:adam.blank.g@gmail.com" target=3D"_blank">=
adam.blank.g@gmail.com</a>&gt;<br>
<br>
</blockquote></div>

--0000000000005d26b206487df16c--

