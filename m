Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3764AC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 08:40:59 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.10096.1741855249068763736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 01:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jolGpP2c;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22409077c06so17897335ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741855248; x=1742460048; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ENsX973usEW/IYNL7nvgRnss++eLqx0mSLpNuxHuieE=;
        b=jolGpP2cY4XF2gpQjBmThCSvav5iLepq3IRmF7a+5YHyGqtLz/LzYXemSDKPPi3xp+
         J8L0zefKrRKUMD9Nirtn6Z5zW4yggyjgzpAFO1P5j9O8JP0cwPmaX3u8cHmtEyUEhbBl
         ELkUUtxAK3hVRMV+T1aMvAtOwSXI5vElkzplYfEKH425rIvXsZrLsda8xWstrk6ZB5a3
         Tt1O2VxYGPYFeaE67Pp1uB5BWZdw6uJDcWuljxTlqR38k/3EDt00WoQXk9ML1LCVod3B
         oyC2j4zMehoqQmIIfJeGaHTbynhtn6jSaV6nbe+lWL9SKn7kQWqRE7Jd4G3/ThyRm/ls
         Pleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741855248; x=1742460048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENsX973usEW/IYNL7nvgRnss++eLqx0mSLpNuxHuieE=;
        b=JG06RkTI5rVPAytVBGMRVT8WGDqyT13yYASRGQC2dxPYUlv47T74WFX7degWQGEYW8
         5HY80Qo5YKvGROqQV1qdDbqTxBgAZ2ytgfUsmaeSJmocRTaMZhFsPaOYQqyOeTwuCVcC
         inIKNmXDvuIBsraHZs7st8CoDPTjEXRgvxt/o/Bu65dQSNbTrnhcBSUWMvVFHnSl96Qb
         3w3JwV+/fLiYxG9Q5CIn24ue/GOkbP9grIeIr2hIOWss0uvfnG+9fVAZJ709q2sbikuN
         Vj2HejNGEdKTr7rOzvYWShmoB+p0CjX1lwkJ0Jt+7KeePqF+P5ttiu3ESFWJAXUZXYJX
         5PuQ==
X-Gm-Message-State: AOJu0Yynq4R0wsoUB70Wujf4miOOBCXZwS+KeTvYmqTz912hDCPehQOc
	cv1n42+Vhxw9QfK0Ca3kx7pdVEl6WRu/uzgXHuT/fXhwt48UvXCQjhPumcVhCvg/ooZFGjuMF0F
	SghtMcsvSbV42RcB+qmKNcXW9F7Y=
X-Gm-Gg: ASbGncs/L/CH6lah+YU6geHYtBjmAQae+3DZ8mlB64hp034FfjcbmglaExouPNCJHW0
	lyevsLIiVscl5N9Jb47irlZ2q+gX70NeNeGQuFMWLvQU9M2ZkcGeRH0xRhCzELyjOsYwLzkW991
	CNp0qNHnFL4TDmjguM+eLGGCCHAN6GJgbbXqs=
X-Google-Smtp-Source: AGHT+IGcyZ3usCMWGhSnrBzMNWXCBRmbZlSMfOzbOsiPujeBNmx0B1FknsxztP5RjvyskNjk1UkGSU4wkuMmqIYTSvs=
X-Received: by 2002:a17:903:1b63:b0:223:536d:f67b with SMTP id
 d9443c01a7336-22428bded61mr421209195ad.38.1741855248387; Thu, 13 Mar 2025
 01:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250312055803.801070-1-hongxu.jia@windriver.com>
In-Reply-To: <20250312055803.801070-1-hongxu.jia@windriver.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 13 Mar 2025 09:40:37 +0100
X-Gm-Features: AQ5f1Jrgpw2y4BrFC1WazkPCCqBNIZeAbkBfkV3m9ChUKeA-L3Vtvc7VuNfZzhU
Message-ID: <CAApg2=Tz1Ok-Jcp=pWwLY3t2Woentg6QyiEEwKPATVdLk862AA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib: spdx30_tasks: remove duplicated patched CVEs
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com, 
	richard.purdie@linuxfoundation.org, mikko.rapeli@linaro.org
Content-Type: multipart/alternative; boundary="00000000000054990806303547c1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 08:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212747

--00000000000054990806303547c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 6:58=E2=80=AFAM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:

> Due to commit [lib: spdx30_tasks: Handle patched CVEs][1] applied,
> duplicated CVE identifier for each CVE which increased +25% build
> time (image task: do_create_image_sbom_spdx)
>
> $ bitbake binutils-cross-x86_64
> $ jq .
> tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-binutils-cross-x86_64.spdx.js=
on
> | grep CVE-2023-25584
>       "spdxId": "
> http://spdx.org/spdxdocs/binutils-cross-x86_64-5de92009-80e6-55c5-8b1f-cc=
37f04fbe09/962efd5da447b81b017db54d3077be796d2e5b6e770a6b050467b24339c0995f=
/vulnerability/CVE-2023-25584
> ",
>           "https://rdf.openembedded.org/spdx/3.0/alias": "
> http://spdxdocs.org/openembedded-alias/by-doc-hash/594f521fb7a3a4e9a2d390=
5303ffb04b016c3ce7693a775cca08be5af4d06658/binutils-cross-x86_64/UNIHASH/vu=
lnerability/CVE-2023-25584
> "
>           "identifier": "CVE-2023-25584",
>             "https://cveawg.mitre.org/api/cve/CVE-2023-25584",
>             "https://www.cve.org/CVERecord?id=3DCVE-2023-25584"
>       "spdxId": "
> http://spdx.org/spdxdocs/binutils-cross-x86_64-5de92009-80e6-55c5-8b1f-cc=
37f04fbe09/962efd5da447b81b017db54d3077be796d2e5b6e770a6b050467b24339c0995f=
/vulnerability/CVE-2023-25584
> ",
>           "https://rdf.openembedded.org/spdx/3.0/alias": "
> http://spdxdocs.org/openembedded-alias/by-doc-hash/594f521fb7a3a4e9a2d390=
5303ffb04b016c3ce7693a775cca08be5af4d06658/binutils-cross-x86_64/UNIHASH/vu=
lnerability/CVE-2023-25584
> "
>           "identifier": "CVE-2023-25584",
>             "https://cveawg.mitre.org/api/cve/CVE-2023-25584",
>             "https://www.cve.org/CVERecord?id=3DCVE-2023-25584"
>
> Since the commit [cve-check: annotate CVEs during analysis][2] improved
> function get_patched_cves to:
> - Check each patch file;
> - Search for additional patched CVEs from CVE_STATUS;
>
> And return dictionary patched_cve for each cve:
> {
>   "abbrev-status": "xxx",
>   "status": "xxx",
>   "justification": "xxx",
>   "resource": "xxx",
>   "affected-vendor": "xxx",
>   "affected-product": "xxx",
> }
>
> But while adding CVE in meta/lib/oe/spdx30_tasks.py, the cve_by_status
> requires decoded_status
> {
>   "mapping": "xxx",
>   "detail": "xxx",
>   "description": "xxx",
> }
>
> This commit converts patched_cve to decoded_status
>
>   patched_cve["abbrev-status"] --> decoded_status["mapping"]
>   patched_cve["status"] --> decoded_status["detail"]
>   patched_cve["justification"] --> decoded_status["description"]
>
> And remove duplicated search for additional patched CVEs from CVE_STATUS
> (calling oe.cve_check.decode_cve_status)
>
> After applying this commit
> $ bitbake binutils-cross-x86_64
> $ jq .
> tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-binutils-cross-x86_64.spdx.js=
on
> | grep CVE-2023-25584
>       "spdxId": "
> http://spdx.org/spdxdocs/binutils-cross-x86_64-5de92009-80e6-55c5-8b1f-cc=
37f04fbe09/381bf593d99c005ecd2c2e0815b86bca2b9ff4cc2db59587aaddd3db95c67470=
/vulnerability/CVE-2023-25584
> ",
>           "https://rdf.openembedded.org/spdx/3.0/alias": "
> http://spdxdocs.org/openembedded-alias/by-doc-hash/594f521fb7a3a4e9a2d390=
5303ffb04b016c3ce7693a775cca08be5af4d06658/binutils-cross-x86_64/UNIHASH/vu=
lnerability/CVE-2023-25584
> "
>           "identifier": "CVE-2023-25584",
>             "https://cveawg.mitre.org/api/cve/CVE-2023-25584",
>             "https://www.cve.org/CVERecord?id=3DCVE-2023-25584"
>
> [1]
> https://git.openembedded.org/openembedded-core/commit/?id=3D1ff496546279d=
8a97df5ec475007cfb095c2a0bc
> [2]
> https://git.openembedded.org/openembedded-core/commit/?id=3D452e605b55ad6=
1c08f4af7089a5a9c576ca28f7d
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index e20bb0c86f3..3d80f05612f 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -498,18 +498,13 @@ def create_spdx(d):
>      # Add CVEs
>      cve_by_status =3D {}
>      if include_vex !=3D "none":
> -        for cve in oe.cve_check.get_patched_cves(d):
> -            spdx_cve =3D build_objset.new_cve_vuln(cve)
> -            build_objset.set_element_alias(spdx_cve)
> -
> -            cve_by_status.setdefault("Patched", {})[cve] =3D (
> -                spdx_cve,
> -                "patched",
> -                "",
> -            )
> -
> -        for cve in d.getVarFlags("CVE_STATUS") or {}:
> -            decoded_status =3D oe.cve_check.decode_cve_status(d, cve)
> +        patched_cves =3D oe.cve_check.get_patched_cves(d)
> +        for cve, patched_cve in patched_cves.items():
> +            decoded_status =3D {
> +                "mapping": patched_cve["abbrev-status"],
> +                "detail": patched_cve["status"],
> +                "description": patched_cve.get("justification", None)
> +            }
>
>              # If this CVE is fixed upstream, skip it unless all CVEs are
>              # specified.
>
>

This is enough to use get_patched_cves() here. And it would allow to fill a
little more of the entry too.

Regards,
Marta

--00000000000054990806303547c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 12,=
 2025 at 6:58=E2=80=AFAM hongxu via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windri=
ver.com@lists.openembedded.org">eng.windriver.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Due=
 to commit [lib: spdx30_tasks: Handle patched CVEs][1] applied,<br>
duplicated CVE identifier for each CVE which increased +25% build<br>
time (image task: do_create_image_sbom_spdx)<br>
<br>
$ bitbake binutils-cross-x86_64<br>
$ jq . tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-binutils-cross-x86_64.sp=
dx.json | grep CVE-2023-25584<br>
=C2=A0 =C2=A0 =C2=A0 &quot;spdxId&quot;: &quot;<a href=3D"http://spdx.org/s=
pdxdocs/binutils-cross-x86_64-5de92009-80e6-55c5-8b1f-cc37f04fbe09/962efd5d=
a447b81b017db54d3077be796d2e5b6e770a6b050467b24339c0995f/vulnerability/CVE-=
2023-25584" rel=3D"noreferrer" target=3D"_blank">http://spdx.org/spdxdocs/b=
inutils-cross-x86_64-5de92009-80e6-55c5-8b1f-cc37f04fbe09/962efd5da447b81b0=
17db54d3077be796d2e5b6e770a6b050467b24339c0995f/vulnerability/CVE-2023-2558=
4</a>&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://rdf.openembedde=
d.org/spdx/3.0/alias" rel=3D"noreferrer" target=3D"_blank">https://rdf.open=
embedded.org/spdx/3.0/alias</a>&quot;: &quot;<a href=3D"http://spdxdocs.org=
/openembedded-alias/by-doc-hash/594f521fb7a3a4e9a2d3905303ffb04b016c3ce7693=
a775cca08be5af4d06658/binutils-cross-x86_64/UNIHASH/vulnerability/CVE-2023-=
25584" rel=3D"noreferrer" target=3D"_blank">http://spdxdocs.org/openembedde=
d-alias/by-doc-hash/594f521fb7a3a4e9a2d3905303ffb04b016c3ce7693a775cca08be5=
af4d06658/binutils-cross-x86_64/UNIHASH/vulnerability/CVE-2023-25584</a>&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;identifier&quot;: &quot;CVE-2023-2=
5584&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://cveawg.m=
itre.org/api/cve/CVE-2023-25584" rel=3D"noreferrer" target=3D"_blank">https=
://cveawg.mitre.org/api/cve/CVE-2023-25584</a>&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://www.cve.=
org/CVERecord?id=3DCVE-2023-25584" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.cve.org/CVERecord?id=3DCVE-2023-25584</a>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 &quot;spdxId&quot;: &quot;<a href=3D"http://spdx.org/s=
pdxdocs/binutils-cross-x86_64-5de92009-80e6-55c5-8b1f-cc37f04fbe09/962efd5d=
a447b81b017db54d3077be796d2e5b6e770a6b050467b24339c0995f/vulnerability/CVE-=
2023-25584" rel=3D"noreferrer" target=3D"_blank">http://spdx.org/spdxdocs/b=
inutils-cross-x86_64-5de92009-80e6-55c5-8b1f-cc37f04fbe09/962efd5da447b81b0=
17db54d3077be796d2e5b6e770a6b050467b24339c0995f/vulnerability/CVE-2023-2558=
4</a>&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://rdf.openembedde=
d.org/spdx/3.0/alias" rel=3D"noreferrer" target=3D"_blank">https://rdf.open=
embedded.org/spdx/3.0/alias</a>&quot;: &quot;<a href=3D"http://spdxdocs.org=
/openembedded-alias/by-doc-hash/594f521fb7a3a4e9a2d3905303ffb04b016c3ce7693=
a775cca08be5af4d06658/binutils-cross-x86_64/UNIHASH/vulnerability/CVE-2023-=
25584" rel=3D"noreferrer" target=3D"_blank">http://spdxdocs.org/openembedde=
d-alias/by-doc-hash/594f521fb7a3a4e9a2d3905303ffb04b016c3ce7693a775cca08be5=
af4d06658/binutils-cross-x86_64/UNIHASH/vulnerability/CVE-2023-25584</a>&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;identifier&quot;: &quot;CVE-2023-2=
5584&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://cveawg.m=
itre.org/api/cve/CVE-2023-25584" rel=3D"noreferrer" target=3D"_blank">https=
://cveawg.mitre.org/api/cve/CVE-2023-25584</a>&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://www.cve.=
org/CVERecord?id=3DCVE-2023-25584" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.cve.org/CVERecord?id=3DCVE-2023-25584</a>&quot;<br>
<br>
Since the commit [cve-check: annotate CVEs during analysis][2] improved<br>
function get_patched_cves to:<br>
- Check each patch file;<br>
- Search for additional patched CVEs from CVE_STATUS;<br>
<br>
And return dictionary patched_cve for each cve:<br>
{<br>
=C2=A0 &quot;abbrev-status&quot;: &quot;xxx&quot;,<br>
=C2=A0 &quot;status&quot;: &quot;xxx&quot;,<br>
=C2=A0 &quot;justification&quot;: &quot;xxx&quot;,<br>
=C2=A0 &quot;resource&quot;: &quot;xxx&quot;,<br>
=C2=A0 &quot;affected-vendor&quot;: &quot;xxx&quot;,<br>
=C2=A0 &quot;affected-product&quot;: &quot;xxx&quot;,<br>
}<br>
<br>
But while adding CVE in meta/lib/oe/spdx30_tasks.py, the cve_by_status<br>
requires decoded_status<br>
{<br>
=C2=A0 &quot;mapping&quot;: &quot;xxx&quot;,<br>
=C2=A0 &quot;detail&quot;: &quot;xxx&quot;,<br>
=C2=A0 &quot;description&quot;: &quot;xxx&quot;,<br>
}<br>
<br>
This commit converts patched_cve to decoded_status<br>
<br>
=C2=A0 patched_cve[&quot;abbrev-status&quot;] --&gt; decoded_status[&quot;m=
apping&quot;]<br>
=C2=A0 patched_cve[&quot;status&quot;] --&gt; decoded_status[&quot;detail&q=
uot;]<br>
=C2=A0 patched_cve[&quot;justification&quot;] --&gt; decoded_status[&quot;d=
escription&quot;]<br>
<br>
And remove duplicated search for additional patched CVEs from CVE_STATUS<br=
>
(calling oe.cve_check.decode_cve_status)<br>
<br>
After applying this commit<br>
$ bitbake binutils-cross-x86_64<br>
$ jq . tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-binutils-cross-x86_64.sp=
dx.json | grep CVE-2023-25584<br>
=C2=A0 =C2=A0 =C2=A0 &quot;spdxId&quot;: &quot;<a href=3D"http://spdx.org/s=
pdxdocs/binutils-cross-x86_64-5de92009-80e6-55c5-8b1f-cc37f04fbe09/381bf593=
d99c005ecd2c2e0815b86bca2b9ff4cc2db59587aaddd3db95c67470/vulnerability/CVE-=
2023-25584" rel=3D"noreferrer" target=3D"_blank">http://spdx.org/spdxdocs/b=
inutils-cross-x86_64-5de92009-80e6-55c5-8b1f-cc37f04fbe09/381bf593d99c005ec=
d2c2e0815b86bca2b9ff4cc2db59587aaddd3db95c67470/vulnerability/CVE-2023-2558=
4</a>&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://rdf.openembedde=
d.org/spdx/3.0/alias" rel=3D"noreferrer" target=3D"_blank">https://rdf.open=
embedded.org/spdx/3.0/alias</a>&quot;: &quot;<a href=3D"http://spdxdocs.org=
/openembedded-alias/by-doc-hash/594f521fb7a3a4e9a2d3905303ffb04b016c3ce7693=
a775cca08be5af4d06658/binutils-cross-x86_64/UNIHASH/vulnerability/CVE-2023-=
25584" rel=3D"noreferrer" target=3D"_blank">http://spdxdocs.org/openembedde=
d-alias/by-doc-hash/594f521fb7a3a4e9a2d3905303ffb04b016c3ce7693a775cca08be5=
af4d06658/binutils-cross-x86_64/UNIHASH/vulnerability/CVE-2023-25584</a>&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;identifier&quot;: &quot;CVE-2023-2=
5584&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://cveawg.m=
itre.org/api/cve/CVE-2023-25584" rel=3D"noreferrer" target=3D"_blank">https=
://cveawg.mitre.org/api/cve/CVE-2023-25584</a>&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://www.cve.=
org/CVERecord?id=3DCVE-2023-25584" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.cve.org/CVERecord?id=3DCVE-2023-25584</a>&quot;<br>
<br>
[1] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D=
1ff496546279d8a97df5ec475007cfb095c2a0bc" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.openembedded.org/openembedded-core/commit/?id=3D1ff49654627=
9d8a97df5ec475007cfb095c2a0bc</a><br>
[2] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D=
452e605b55ad61c08f4af7089a5a9c576ca28f7d" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.openembedded.org/openembedded-core/commit/?id=3D452e605b55a=
d61c08f4af7089a5a9c576ca28f7d</a><br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/spdx30_tasks.py | 19 +++++++------------<br>
=C2=A01 file changed, 7 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index e20bb0c86f3..3d80f05612f 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -498,18 +498,13 @@ def create_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0# Add CVEs<br>
=C2=A0 =C2=A0 =C2=A0cve_by_status =3D {}<br>
=C2=A0 =C2=A0 =C2=A0if include_vex !=3D &quot;none&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for cve in oe.cve_check.get_patched_cves(d):<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_cve =3D build_objset.new_cv=
e_vuln(cve)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_objset.set_element_alias(s=
pdx_cve)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_by_status.setdefault(&quot;P=
atched&quot;, {})[cve] =3D (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_cve,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;patched&quot=
;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for cve in d.getVarFlags(&quot;CVE_STATUS&quot=
;) or {}:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decoded_status =3D oe.cve_check.=
decode_cve_status(d, cve)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 patched_cves =3D oe.cve_check.get_patched_cves=
(d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for cve, patched_cve in patched_cves.items():<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decoded_status =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mapping&quot=
;: patched_cve[&quot;abbrev-status&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;detail&quot;=
: patched_cve[&quot;status&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;description&=
quot;: patched_cve.get(&quot;justification&quot;, None)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If this CVE is fixed upst=
ream, skip it unless all CVEs are<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# specified.<br><br></block=
quote><div><br></div><div><br></div><div>This is enough to use get_patched_=
cves() here. And it would allow to fill a little more of the entry too.</di=
v><div><br></div><div>Regards,</div><div>Marta<br></div></div></div>

--00000000000054990806303547c1--

