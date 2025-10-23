Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7D3CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 13:50:22 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.21505.1761227414449695251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 06:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=X+pq9gOa;
 spf=pass (domain: snapchat.com, ip: 209.85.218.46, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d5b756284so99151366b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 06:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1761227413; x=1761832213; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YGuaFfvSaJjoMJxG3hZe+r8Xpbj+gAN09oZQ1X4JkBI=;
        b=X+pq9gOawgR7cjK9Q1JtAdu2dsHxEEibiM/bc3G9zh2YV7sS3GP7Za0aDj+zADY602
         pkLNT422PdijKdL5PAqg9FBndXVG1QgkiYxKQxC5rECFLQfNTvbkErxHPr0LKObSOEtU
         ZvnxBcA5qLeNwm/RaFm7hlqmGlpjoN5/TwZrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227413; x=1761832213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGuaFfvSaJjoMJxG3hZe+r8Xpbj+gAN09oZQ1X4JkBI=;
        b=Jlq2wxlQvAqOiJeFv2UqeuPMoA/uOWnaioS2ZxaBshEI5rM/n+51Etl1jzzK79BX4L
         /kEX54Et9/TrTIkbeXnBseZw8EteQo0QAqarz3rkjCVbsl0vy6+ZEA0IK7qCnKcrMkf5
         PDwcbLDFkI3TUk9fKA53QF99iNoEMH+B4rwpBM3LU63yTQxTA7sEkX/PHKxbwich2A9j
         pS2fA+JvDm3YZ5e6oYpbG+w4hb0jjXk6sf4Ah+9BBVyvlHv4eN1hr6HySYbY0gBQvlQg
         nkx04jlGxM3lrfhDawENaR6wy9DaRxfUqkDD1FNzq5NTCl+HsBdDrNweVPLmFFisyK7u
         +Hiw==
X-Gm-Message-State: AOJu0Yy0azVJsqebe7ZyUf6DFwDtcrXVEWlhrffakY9ojXaCl68tXsTM
	Lw9mw9oDg4JYGvCAJTNmekvuRkLbwsCydRQbJI45So1zDS7p1BGXZtblmhXK4EhkLcFu+jSkLFC
	tAL+5zBfv6tNNIpsO0Get/taKpihmCzM6H/fiOGLHbQ==
X-Gm-Gg: ASbGnctS5IWQ69w4FcLIQc80bu7ZIEVf+zf/RHBUny+99YOHT04RIalU0F8VNSSABEQ
	s55qMzASn9djTkkoHdZSX0AogrsZ71jFfG7d8ueeqjYqaNC9O5T5TD/3idam8fefg+RaxCL0LFS
	glYyT2adCvnF/v+U7eyqZXupYKEzYN3p5lPGUb5YC8EHPOleYZVTFvE4h0Vm55lejcdqO/tmxnD
	QHQ8KZ6uoKsPazqcGF3+IAuLfV3P6FCftrxfjMpSjfrDMWb12SRGyL/bgVE2ZIwEKM1MIb4SURW
	f50D5O0sJUHdHZMvIKKMUKAn5RE=
X-Google-Smtp-Source: AGHT+IFewNcS8ylboUJObJFp6BLVsc9wyREuIWuySfUy3qW4OtHUz35pVnUNYk/YQ26dgiW+5lflLZ1HqJAITjuk8aM=
X-Received: by 2002:a17:906:fe41:b0:b04:aadd:b8d7 with SMTP id
 a640c23a62f3a-b6471d48347mr3151031466b.13.1761227412541; Thu, 23 Oct 2025
 06:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <187122D53E394F49.25104@lists.openembedded.org>
In-Reply-To: <187122D53E394F49.25104@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 23 Oct 2025 15:50:01 +0200
X-Gm-Features: AS18NWB8ojDGlvIvlce2hAuZOS_Z2hD3MO1R92NttFhgL8LWAzR402LhH8JzoTc
Message-ID: <CAHUKmYatx9Dng-=Lb=ukRVG35SpO_yaOpsVAtQ0Wh4GR-j-uBw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 1/2] opkg: upgrade 0.7.0 -> 0.8.0
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004b391a0641d3b6e9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 13:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225262

--0000000000004b391a0641d3b6e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v4: changed patch status from pending to backport

On Thu, Oct 23, 2025 at 3:47=E2=80=AFPM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> See release notes at
> -
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproj=
ect.org_releases_opkg_opkg-2D0.8.0.release-2Dnotes&d=3DDwIDAg&c=3DncDTmphkJ=
TvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiCR=
z&s=3D99i-kF8V1TRmedfoOKSMTWSWDKchpMD40QTFiIYGBOM&e=3D
>
> [0.8.0] - 2025-01-10
>
> The minor version bump in this release is due to the changes to cURL erro=
r
> output line format.
>
> - [Changed](
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3Dab03377868256427279b36c4b2a298edae4260b8&d=3DDwIDAg&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJu=
B5p1Bw653CiCRz&s=3Dxh-rMQxvOmqubdUwF05puCNDTttU0F9Aca5lK7oFtDo&e=3D
> ) the error output for the curl download backend, to now report the HTTP
> error code for failed requests.
>   - e.g. `error: log_curl_download_error: Failed to download headers of
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__foo.bar_all_Packag=
es.gz&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabk=
khmKMqYtElilOykJuB5p1Bw653CiCRz&s=3DpdQgBdsQMT8gpIa2EM4GPyIVcmOQGbDwaSH3-TI=
eHIo&e=3D
> : The requested URL returned error: 401`
> - Enabling debug-verbosity, while using the cURL backend, [will now](
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3Dce6fede3db931bb0da70d1334cdc4101d0aec702&d=3DDwIDAg&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJu=
B5p1Bw653CiCRz&s=3DBRpPmJh-BvE5nCGgw5697jK_VuoY_IJmMwIfRbgIiag&e=3D
> ) print cURL's verbose error log to stderr when there is a download failu=
re.
>   - The verbose output may contain confidential information about your
> cURL transactions. So this is your reminder that debug-verbosity should n=
ot
> be enabled in production systems or sensitive security environments.
> - The commandline configuration file option (`-f`) [can now](
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3D36d08b93d2859992b624a4ba2f412cfa5c766050&d=3DDwIDAg&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJu=
B5p1Bw653CiCRz&s=3DgO-yg8ibUXKv8L_rDc_as9ujCsq4-PufCPVot_yi5Yw&e=3D
> ) be specified multiple times, and each configuration file will be loaded
> and their settings merged.
> - [Fixed](
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3Dc87188d7535684fddb8cf80993c147b215602b63&d=3DDwIDAg&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJu=
B5p1Bw653CiCRz&s=3DhHdq-Ejk67q1kcK8RcMqmrC24uKPiMpF4ZmdnXOfjPA&e=3D
> ) a bug in control field parsing where custom fields whose keys are simil=
ar
> to other fields could be confused by the parser.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/recipes-devtools/opkg/{opkg_0.7.0.bb =3D> opkg_0.8.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/opkg/{opkg_0.7.0.bb =3D> opkg_0.8.0.bb} (97=
%)
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
> b/meta/recipes-devtools/opkg/opkg_0.8.0.bb
> similarity index 97%
> rename from meta/recipes-devtools/opkg/opkg_0.7.0.bb
> rename to meta/recipes-devtools/opkg/opkg_0.8.0.bb
> index 95480b47164..12e2edf7e3f 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.8.0.bb
> @@ -18,7 +18,7 @@ SRC_URI =3D "
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproj=
ect.org_releases_-24-257BBPN-257D_-24-257BBPN-257D-2D-24-257BPV-257D.tar.gz=
&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKM=
qYtElilOykJuB5p1Bw653CiCRz&s=3DasY7SB0bQwkMcmEb9vWSy8QMSai9gJo7qR7knPI7fHI&=
e=3D
>             file://run-ptest \
>             "
>
> -SRC_URI[sha256sum] =3D
> "d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567"
> +SRC_URI[sha256sum] =3D
> "582a4c9e220cce0b7d08a0915c95db9f24ae43ad372ed5d42d5ec5f6cd413f0c"
>
>  # This needs to be before ptest inherit, otherwise all ptest files end
> packaged
>  # in libopkg package if OPKGLIBDIR =3D=3D libdir, because default
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225259):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_225259&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiCRz&s=3D0VE=
sR76Bibazo6rPAHeeMXSFnb_s3DuWZsNx3ZjNb3Q&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_115910657_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DK2mEuvh0CKEP4=
kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiCRz&s=3DJUCYS-p0vQxb4EcK7gE=
dmc_oSsRu6FC8Mbzo9k3e4IU&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DK2mEuv=
h0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiCRz&s=3Dma2b9xhX2-_w=
Fxhdxzq0UWvJ1MI0lhd7uaedF9ORZDQ&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004b391a0641d3b6e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v4: changed patch status from pending to backport</div><br=
><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Oct 23, 2025 at 3:47=E2=80=AFPM Etienne Cordonnier via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;e=
cordonnier=3D<a href=3D"mailto:snap.com@lists.openembedded.org">snap.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonn=
ier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
See release notes at<br>
- <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__download=
s.yoctoproject.org_releases_opkg_opkg-2D0.8.0.release-2Dnotes&amp;d=3DDwIDA=
g&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhm=
KMqYtElilOykJuB5p1Bw653CiCRz&amp;s=3D99i-kF8V1TRmedfoOKSMTWSWDKchpMD40QTFiI=
YGBOM&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_opkg_op=
kg-2D0.8.0.release-2Dnotes&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCH=
vabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;=
m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiCRz&amp;s=
=3D99i-kF8V1TRmedfoOKSMTWSWDKchpMD40QTFiIYGBOM&amp;e=3D</a> <br>
<br>
[0.8.0] - 2025-01-10<br>
<br>
The minor version bump in this release is due to the changes to cURL error =
output line format.<br>
<br>
- [Changed](<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__git.yoctoproject.org_opkg_commit_-3Fid-3Dab03377868256427279b36c4b2a298e=
dae4260b8&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4=
kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiCRz&amp;s=3Dxh-rMQxvOmqubdU=
wF05puCNDTttU0F9Aca5lK7oFtDo&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.or=
g_opkg_commit_-3Fid-3Dab03377868256427279b36c4b2a298edae4260b8&amp;d=3DDwID=
Ag&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIG=
RfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkh=
mKMqYtElilOykJuB5p1Bw653CiCRz&amp;s=3Dxh-rMQxvOmqubdUwF05puCNDTttU0F9Aca5lK=
7oFtDo&amp;e=3D</a> ) the error output for the curl download backend, to no=
w report the HTTP error code for failed requests.<br>
=C2=A0 - e.g. `error: log_curl_download_error: Failed to download headers o=
f <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__foo.bar=
_all_Packages.gz&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuv=
h0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiCRz&amp;s=3DpdQgBdsQ=
MT8gpIa2EM4GPyIVcmOQGbDwaSH3-TIeHIo&amp;e=3D" rel=3D"noreferrer" target=3D"=
_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__foo.bar_all_=
Packages.gz&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckf=
diw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKE=
P4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiCRz&amp;s=3DpdQgBdsQMT8gp=
Ia2EM4GPyIVcmOQGbDwaSH3-TIeHIo&amp;e=3D</a> : The requested URL returned er=
ror: 401`<br>
- Enabling debug-verbosity, while using the cURL backend, [will now](<a hre=
f=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoprojec=
t.org_opkg_commit_-3Fid-3Dce6fede3db931bb0da70d1334cdc4101d0aec702&amp;d=3D=
DwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPa=
bkkhmKMqYtElilOykJuB5p1Bw653CiCRz&amp;s=3DBRpPmJh-BvE5nCGgw5697jK_VuoY_IJmM=
wIfRbgIiag&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fi=
d-3Dce6fede3db931bb0da70d1334cdc4101d0aec702&amp;d=3DDwIDAg&amp;c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJ=
TKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p=
1Bw653CiCRz&amp;s=3DBRpPmJh-BvE5nCGgw5697jK_VuoY_IJmMwIfRbgIiag&amp;e=3D</a=
> ) print cURL&#39;s verbose error log to stderr when there is a download f=
ailure.<br>
=C2=A0 - The verbose output may contain confidential information about your=
 cURL transactions. So this is your reminder that debug-verbosity should no=
t be enabled in production systems or sensitive security environments.<br>
- The commandline configuration file option (`-f`) [can now](<a href=3D"htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_op=
kg_commit_-3Fid-3D36d08b93d2859992b624a4ba2f412cfa5c766050&amp;d=3DDwIDAg&a=
mp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx=
_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMq=
YtElilOykJuB5p1Bw653CiCRz&amp;s=3DgO-yg8ibUXKv8L_rDc_as9ujCsq4-PufCPVot_yi5=
Yw&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofp=
oint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3D36d0=
8b93d2859992b624a4ba2f412cfa5c766050&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa6=
6m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653Ci=
CRz&amp;s=3DgO-yg8ibUXKv8L_rDc_as9ujCsq4-PufCPVot_yi5Yw&amp;e=3D</a> ) be s=
pecified multiple times, and each configuration file will be loaded and the=
ir settings merged.<br>
- [Fixed](<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A_=
_git.yoctoproject.org_opkg_commit_-3Fid-3Dc87188d7535684fddb8cf80993c147b21=
5602b63&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&=
amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT=
7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiCRz&amp;s=3DhHdq-Ejk67q1kcK8R=
cMqmrC24uKPiMpF4ZmdnXOfjPA&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">h=
ttps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_=
opkg_commit_-3Fid-3Dc87188d7535684fddb8cf80993c147b215602b63&amp;d=3DDwIDAg=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmK=
MqYtElilOykJuB5p1Bw653CiCRz&amp;s=3DhHdq-Ejk67q1kcK8RcMqmrC24uKPiMpF4ZmdnXO=
fjPA&amp;e=3D</a> ) a bug in control field parsing where custom fields whos=
e keys are similar to other fields could be confused by the parser.<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg/{<a href=3D"http://opkg_0.7.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">opkg_0.7.0.bb</a> =3D&gt; <a href=3D"http://op=
kg_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a>} | 2 +-=
<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/opkg/{<a href=3D"http://opkg_0.7.0.bb" r=
el=3D"noreferrer" target=3D"_blank">opkg_0.7.0.bb</a> =3D&gt; <a href=3D"ht=
tp://opkg_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a>}=
 (97%)<br>
<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.7.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.7.0.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.8.0.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.7.0.bb</a><br>
rename to meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a><br>
index 95480b47164..12e2edf7e3f 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.7.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.7.0.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.8.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.8.0.bb</a><br>
@@ -18,7 +18,7 @@ SRC_URI =3D &quot;<a href=3D"https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_-24-257BBPN-2=
57D_-24-257BBPN-257D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwIDAg&amp;c=3DncDTmp=
hkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DUL=
JTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5=
p1Bw653CiCRz&amp;s=3DasY7SB0bQwkMcmEb9vWSy8QMSai9gJo7qR7knPI7fHI&amp;e=3D" =
rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/u=
rl?u=3Dhttp-3A__downloads.yoctoproject.org_releases_-24-257BBPN-257D_-24-25=
7BBPN-257D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiC=
Rz&amp;s=3DasY7SB0bQwkMcmEb9vWSy8QMSai9gJo7qR7knPI7fHI&amp;e=3D</a> <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee=
26704bf8fe757c54567&quot;<br>
+SRC_URI[sha256sum] =3D &quot;582a4c9e220cce0b7d08a0915c95db9f24ae43ad372ed=
5d42d5ec5f6cd413f0c&quot;<br>
<br>
=C2=A0# This needs to be before ptest inherit, otherwise all ptest files en=
d packaged<br>
=C2=A0# in libopkg package if OPKGLIBDIR =3D=3D libdir, because default<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225259): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_22=
5259&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT7LO=
7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiCRz&amp;s=3D0VEsR76Bibazo6rPAHee=
MXSFnb_s3DuWZsNx3ZjNb3Q&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_225259&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiC=
Rz&amp;s=3D0VEsR76Bibazo6rPAHeeMXSFnb_s3DuWZsNx3ZjNb3Q&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_115910657_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtElilO=
ykJuB5p1Bw653CiCRz&amp;s=3DJUCYS-p0vQxb4EcK7gEdmc_oSsRu6FC8Mbzo9k3e4IU&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_115910657_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPa=
bkkhmKMqYtElilOykJuB5p1Bw653CiCRz&amp;s=3DJUCYS-p0vQxb4EcK7gEdmc_oSsRu6FC8M=
bzo9k3e4IU&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7kuDg0XdeeUPabkkhmKMqYtEl=
ilOykJuB5p1Bw653CiCRz&amp;s=3Dma2b9xhX2-_wFxhdxzq0UWvJ1MI0lhd7uaedF9ORZDQ&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DK2mEuvh0CKEP4kT7LO7k=
uDg0XdeeUPabkkhmKMqYtElilOykJuB5p1Bw653CiCRz&amp;s=3Dma2b9xhX2-_wFxhdxzq0UW=
vJ1MI0lhd7uaedF9ORZDQ&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004b391a0641d3b6e9--

