Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B7AC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:31:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41697.1782901896567759593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bGOr0ZmT;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so3467755e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 03:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782901895; cv=none;
        d=google.com; s=arc-20260327;
        b=W73Y7xAQJY692PdSQdbLHGk0k/9ig7tp7YX2xxeRHGkclbu9eKpJ9vI0fq/iXHzYhy
         m5+UKt5c6i1JiGi5hIfgPzdl9c1oidhIUBcEaxaTmjkNclyoPH5nk9p3+FfvfqVEwEbA
         ty4YxDvFhec64+ALVAKoVZhfhf3b/JoKeBURLHZ3RlVlf76Xt/75gBac+QQxmuwBoBAC
         4LkhxdgHCCynCrWOBQkLH3pcpm3XaKgB08GOiO6JW3GW8ppP1ol0iydA7bhJwZKdGaqA
         HhlY8MBwR3xXzAHtVTSLSWPhpaICEwVN41Yfrj9yKnDc4F8gYgfyJt0zg4YTaZ9q2HSC
         RJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K8fKihA7XdCRl5HmVdDF/HprLDv4JbFEZI4Z4KrvbvY=;
        fh=KfexivCAq1M7mA4u0gN+WHiyC0Tv6IZUAoy0KhRUlZM=;
        b=jznkPsF4VNOqPWCCRXiRoci1fN7QF02R2iLwlt5dwnPMVbdB0apkBQzpBWj29BsoQ1
         nVDxCO8AnK6p8WOYbaXsoZO8TGjLpjbjZqdlGT11YcSsd97cTlY16N9vSyZkqF7gPGbi
         tAxBQaoqXJGv5/Ifa6yz0dTRubYfRcmRIi3yBO2QlyTDDI0/Pdl+LcAOPEln/THZBJqO
         ywjkfbEC+jjkukspHNFuEbc8qCN683TQ6h/bVJn8tkLGHikzO7bQWLODhnNPOB/7J9jO
         qOFFJYQYqwvTNlg9t1hwylenUtzUan40pvbd+AQ6/m2HVbex+narZ0syXQ54c8vOZJHS
         ovYA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782901895; x=1783506695; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K8fKihA7XdCRl5HmVdDF/HprLDv4JbFEZI4Z4KrvbvY=;
        b=bGOr0ZmT3mH+YBKazOaGfksWNAOFEoZ3EPYarjSxjrWFPxGWB/EoOekaBCFKYwx9AB
         Pg2g1WcjiQ51QJiwLssgmsA1cdxvWLQ3DKgXsKYGLsR67Rx3OrXXILE8LmnJ3iAVMdwl
         UTUWTOMCVjPw1mIpxV1dCJorwvWUzG/1RA8gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901895; x=1783506695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8fKihA7XdCRl5HmVdDF/HprLDv4JbFEZI4Z4KrvbvY=;
        b=lFXCdi2sdr4+25jfq1n0jMGrKj1VuWioF+Vtj3yqssuC6/qdCLXLgLDtmZKCqGdUWt
         Xc6dXMF/zALJ21NPoa3LuBJYQaQKnyfgTBe+pSsLWhtky7FvKvaW35mhap15EudHLtRw
         SfcoBw17pPTah2vPCilMopx6HNMFlu4gGY6PbHTb04FPWvXukCCTgfj4bpjLbA2u2ygO
         w84YMqKQF3YszWg7GRlouMCuc8KYaS4ndj0PUPbsLf65X0XFgLjBy/8TGxBq8z2rYqnu
         G5Z/K7KGFNqxj6wkfar74/XteLnT+KvEH7in9fq7YRz2DyonqwLOnfojxoANOyXiOJOT
         ALOQ==
X-Gm-Message-State: AOJu0YyR43/947dOB3dHK25ezvH5KBhRRg44wdt6V/utj0hb5M7bGhZo
	0eAxBKikciameGKhxKeN90zbTitTvgncCK5NMMlgdQ6Ho1zTtwzkw/TF/EajFEEPJuIWyNganjT
	Mz532l6A55/TomwF6ordLQQYvMhJbovXCQsAWA+muNQ==
X-Gm-Gg: AfdE7cnclc0GE3rIBSryGSNomrzhRCj6MPmgClw5OXsCRlc2xiw0AXFbrJEtOtPmUVn
	AslGlq4nuLHCQ1t8h0DaTejhAG/3MrjmWA5NGiJZl1br7RBOiTIpVJEB2qc2toWNZTZ0VP+dRgx
	BWjS6MHbwPlDQVTWkjhKfAKKAoEqGSTqaextYnAFTAyoDPNyK6eZWJWqYarcwCTLC648jQYgSvP
	+FdqmReV+L6dmUgJ6AVkrDFOSDG4DoJFQfnJBzPT7pSeuWYFXinQg8X+3RvVETANu4I0KxpG25v
	UEEMPnc6yPiu9lJ+7qjeX/csiBLfdw==
X-Received: by 2002:a05:600c:6308:b0:493:b915:4a6f with SMTP id
 5b1f17b1804b1-493c2b38138mr16279285e9.8.1782901894656; Wed, 01 Jul 2026
 03:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260701100045.3903557-1-anna-lena.marx@inovex.de>
In-Reply-To: <20260701100045.3903557-1-anna-lena.marx@inovex.de>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 1 Jul 2026 12:31:08 +0200
X-Gm-Features: AVVi8Ced_qkhktV_quiUr2E3VpQcou3i9qusd6C_8pGycuZxvSv-O_AbEqi1afk
Message-ID: <CAMSfU+6RkR=8Ze0DMg-376Pw=_pE+kC75osYiwMtHmTCbdp5Bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes-recipe/sbom-cve-check: fix sstate cache
 mismatch in sbom path
To: anna-lena.marx@inovex.de
Cc: openembedded-core@lists.openembedded.org, Ryan Eatmon <reatmon@ti.com>
Content-Type: multipart/alternative; boundary="00000000000019c18d06558a3270"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239960

--00000000000019c18d06558a3270
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 1 juil. 2026 =C3=A0 12:00, Anna-Lena Marx via lists.openembedded.or=
g
<anna-lena.marx=3Dinovex.de@lists.openembedded.org> a =C3=A9crit :

> Using ${IMAGE_NAME} to construct the sbom_path causes the do_sbom_cve_che=
ck
> task to fail in subsequent builds when the image generation is restored
> from
> the sstate cache.
> ${IMAGE_NAME} utilizes the DATETIME variable via ${IMAGE_VERSION_SUFFIX},
> which is re-evaluated during the current execution.
> This results in a timestamp mismatch with the actually deployed cached
> SPDX artifact.
>
> Switching the path construction to use ${IMAGE_LINK_NAME} ensures the tas=
k
> reliably targets the stable symlink in the deploy directory,
> restoring cache determinism and preventing "No such file or directory"
> errors on rebuilds.
>
> Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
> ---
>

Ping Ryan, isn't what you worked on as well?
That patch from Anna-Lena looks like a fix for the regression created by
[0] you talked about.

Anna-Lena, do you think your fix is linked to [0]?

[0]:
https://git.openembedded.org/openembedded-core/commit/?id=3Db9f060ea6d54cc4=
19df9ff5f8822a3536934606f



>  meta/classes-recipe/sbom-cve-check.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/sbom-cve-check.bbclass
> b/meta/classes-recipe/sbom-cve-check.bbclass
> index 451595f1d7..fe145a2212 100644
> --- a/meta/classes-recipe/sbom-cve-check.bbclass
> +++ b/meta/classes-recipe/sbom-cve-check.bbclass
> @@ -14,7 +14,7 @@ python do_sbom_cve_check() {
>      """
>      Task: Run sbom-cve-check analysis on SBOM.
>      """
> -    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.spdx.json"=
)
> +    sbom_path =3D
> d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.json")
>      image_name =3D d.getVar("IMAGE_NAME")
>      link_name =3D d.getVar("IMAGE_LINK_NAME")
>      run_sbom_cve_check(d, sbom_path, image_name, link_name)
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239959):
> https://lists.openembedded.org/g/openembedded-core/message/239959
> Mute This Topic: https://lists.openembedded.org/mt/120061528/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000019c18d06558a3270
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 1 =
juil. 2026 =C3=A0=C2=A012:00, Anna-Lena Marx via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;anna-lena.marx=3D<a href=3D"=
mailto:inovex.de@lists.openembedded.org">inovex.de@lists.openembedded.org</=
a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Using ${IMAGE_NAME} to construct the sbom_path causes the do_sbo=
m_cve_check<br>
task to fail in subsequent builds when the image generation is restored fro=
m<br>
the sstate cache.<br>
${IMAGE_NAME} utilizes the DATETIME variable via ${IMAGE_VERSION_SUFFIX},<b=
r>
which is re-evaluated during the current execution.<br>
This results in a timestamp mismatch with the actually deployed cached<br>
SPDX artifact.<br>
<br>
Switching the path construction to use ${IMAGE_LINK_NAME} ensures the task<=
br>
reliably targets the stable symlink in the deploy directory,<br>
restoring cache determinism and preventing &quot;No such file or directory&=
quot;<br>
errors on rebuilds.<br>
<br>
Signed-off-by: Anna-Lena Marx &lt;<a href=3D"mailto:anna-lena.marx@inovex.d=
e" target=3D"_blank">anna-lena.marx@inovex.de</a>&gt;<br>
---<br></blockquote><div><br></div><div>Ping=C2=A0Ryan, isn&#39;t what you =
worked on as well?</div><div>That patch from Anna-Lena looks like a fix for=
 the regression created by [0] you talked about.</div><div><br></div><div>A=
nna-Lena, do you think your fix is linked to [0]?</div><div><br></div><div>=
[0]: <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3Db9f060ea6d54cc419df9ff5f8822a3536934606f">https://git.openembedded.org/o=
penembedded-core/commit/?id=3Db9f060ea6d54cc419df9ff5f8822a3536934606f</a>=
=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
=C2=A0meta/classes-recipe/sbom-cve-check.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-reci=
pe/sbom-cve-check.bbclass<br>
index 451595f1d7..fe145a2212 100644<br>
--- a/meta/classes-recipe/sbom-cve-check.bbclass<br>
+++ b/meta/classes-recipe/sbom-cve-check.bbclass<br>
@@ -14,7 +14,7 @@ python do_sbom_cve_check() {<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Task: Run sbom-cve-check analysis on SBOM.<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 sbom_path =3D d.expand(&quot;${DEPLOY_DIR_IMAGE}/${IMAGE_NAM=
E}.spdx.json&quot;)<br>
+=C2=A0 =C2=A0 sbom_path =3D d.expand(&quot;${DEPLOY_DIR_IMAGE}/${IMAGE_LIN=
K_NAME}.spdx.json&quot;)<br>
=C2=A0 =C2=A0 =C2=A0image_name =3D d.getVar(&quot;IMAGE_NAME&quot;)<br>
=C2=A0 =C2=A0 =C2=A0link_name =3D d.getVar(&quot;IMAGE_LINK_NAME&quot;)<br>
=C2=A0 =C2=A0 =C2=A0run_sbom_cve_check(d, sbom_path, image_name, link_name)=
<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239959): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239959" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239959</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120061528/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120061528/4316185</a><br>
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

--00000000000019c18d06558a3270--

