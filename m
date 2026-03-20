Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF06E10987A1
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 15:54:34 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16388.1774022067086279859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 08:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XvahsNo4;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1271195d2a7so1076728c88.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 08:54:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774022066; cv=none;
        d=google.com; s=arc-20240605;
        b=bwxkQjgjzCsVqfM7DJCkVuUs1gGlwA7Dnm26wJZRS1IU+mx5qBrHhM7QCmrqsx6GSb
         OepolxKYyGfzZqMbp+JrCXzZjKzS/gIY67cQ2uSwMQCbfW1bg1JJ1xEDSmmhj6XvLfjW
         21U0MUuTwyTL8B1+/POHCEoeI+OlaKas9+iBn2i+TUYKhs75WCf4qmX+etH54EUwn4g3
         H/sjaQtMfWj42Y8eszTX+jMwRyLWbiB7/p2W4kZlf0t4ep7E4JWlLMGJuUY5SARv6iRL
         bcVdq9UdvJ+gSEb8DqWdRax8lupXvgUVRTJceZu3B82IwGI+z9aPVIFBtuzytamXWatm
         7Y6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pUQ/lI3Z8X5P/KhxYABoz5Ayp39e4bgYhmcseIbUdp0=;
        fh=hQYLurPy9ERjJbJ0Ryg0oFKGxO/Le7cRCn5g7QXxjfQ=;
        b=i6tDeB6J1cPPMnUNDtofs/QKYKqcDGXhnhiZgzhDCTVDlSw/RgurYUys7PFo8BnrjF
         yjrQ8aXwqfDW0yDRMiqKwFSa3qQ9OGFebTNd8Tl+iy4GElVUDjJXDNn0S0GDxHvzhTTx
         RxHsoUMSOI6o0m36S67cJdoyDyTkppmMMQzi0xOjrMut+MIaEPbuPOP64lLLjxLR2ntk
         6f8aHnsSn4gajhx97qAMMghFjmCLURu4OTYdY64AovqyIuDfnnJbpvExj3T2vwu4+EB/
         YssGqzfeuAQqGK+4nOInhqRMwVRvfCJT5fKzntZTF34wF2rHTsp6g8TtQFKGPaGjmU8i
         1kKQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774022066; x=1774626866; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pUQ/lI3Z8X5P/KhxYABoz5Ayp39e4bgYhmcseIbUdp0=;
        b=XvahsNo4DGbD0L7uGCuFhGO0WRVmGpiqKxoMotBkPC+80q2obVQpxEcveBV/rzNJ2d
         ah5y1v3hElaDHx8RBd7dEOKZe/VHYLH63RIPI3eoeYASZ3Zfjcmt6LYCVDv4nOGsPZa7
         FuW7cpK3hiU7Jb3kUFgBWJmfr1crETAYtJtiCt/czCrld+TtKbVlk5R3i6lC9dslQsYS
         3zcIQkgq3drjCvdhszFa5Jkj24GsiZG82FYj3bQ79rqxNecElLPyZHI7MBHsD6wBsn5v
         0i8T8KyuBAlftNjnxdM1Pt91rnyUgaEEQT/T9iOkgwIcKGPPiI4nwGsjw1p/kpdwLavu
         caMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022066; x=1774626866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUQ/lI3Z8X5P/KhxYABoz5Ayp39e4bgYhmcseIbUdp0=;
        b=tIihscoS9YraTbAj+Nd0R1ChoQ4h4Y6STL953lJ1EtM02/7TcOPSK8hL3BEwSAuPg5
         QkAe2kVDr2fjiZpCnOq97RlpsLo/sSyomOknVmbpUnEQvxiKJ5JWNH0LSllU7YN4TBbH
         oAYHAiwO5a93jPmPF95D2sCKLaVQ5DIgOogFwEIr+kd3bdciT6U6Alouuy9HP4IJ/ARB
         22zeQZRjaYDaejznTKkBPtvaki09FVgLoezX2BHzUBhr+WWW7y90Rx6CvE2Wc5/uZymH
         +Qqx74ttCigeOGO9auvEUpyIBMOS37J9r/6ExiRbT7exf3nsnevEcHJz5liNN2r5wJzg
         qc+w==
X-Gm-Message-State: AOJu0Yx34GRUquSOAPuw6ISQJH6T0779lW4GXRRLrHk6lmu//xdmYUYb
	dLcYoNaxixDH4rFXfX0IPV/H9l8lcvTo57XeDJ27AgO59ladd+CLS2vSmbFo9Q4rcwXP7tPCSzv
	Uc8n4AuBEJNKmj/aRKSvzekD9V+SQa04=
X-Gm-Gg: ATEYQzwyuuPFki0eAqwNm9yAoVtgnCo+lAl7sEcQjOj3j87KuHpapJKJKoPKCrcbZur
	70f32O2dpA2TEV8/rZXr/UriGHccMANw1HEsGZyXSYy9GIbjAi47OE28TUBLvP2W5e5FfF9bFmY
	neFHuGC2eNmExBQq58NRBMfMfX0rZbPU7lKSDcbpORzhqiidqdzhnKAjJf6z5Rb6p9cwcqcv0Tt
	StPfzIIS9GkP92pfYSt0/OcsponCN95dIewSdw/f8hKZ1qIv9hlTIpiu5imjJaj9ZgI7OpUSPbT
	SWpviY9NahPRsucbQvpZP4MZwwo+4aoEeXAASahB
X-Received: by 2002:a05:7022:3d8c:b0:12a:6ab7:3f8a with SMTP id
 a92af1059eb24-12a726478eemr1913058c88.3.1774022066228; Fri, 20 Mar 2026
 08:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260319-add-sbom-cve-check-v6-0-cfc657daa6b7@bootlin.com> <20260319-add-sbom-cve-check-v6-1-cfc657daa6b7@bootlin.com>
In-Reply-To: <20260319-add-sbom-cve-check-v6-1-cfc657daa6b7@bootlin.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 20 Mar 2026 16:54:14 +0100
X-Gm-Features: AaiRm50jxxZSrK8a8cmTVNhdwFcbHuRHfAYrwm0GNR-NR8SgIAs3f_Khi2b7gtI
Message-ID: <CAApg2=QPoTedChybGx6gC8pQek57mfxd0jrtFZwBmJ5YyJ=ZhQ@mail.gmail.com>
Subject: Re: [PATCH v6] sbom-cve-check: Add class for post-build CVE analysis
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	peter.marko@siemens.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
	antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
	thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="00000000000014d1c6064d76b310"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 15:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233615

--00000000000014d1c6064d76b310
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 4:42=E2=80=AFPM Benjamin Robin <benjamin.robin@boot=
lin.com>
wrote:

> By default, the sbom-cve-check class generates these export files:
>  - A JSON in `cve-check` format, named `${IMAGE_NAME}.cve-check.json`
>  - An SPDX 3.0 SBOM, named `${IMAGE_NAME}.cve-check.spdx.json`.
>
> A user can add or remove export file formats by using the
> `SBOM_CVE_CHECK_EXPORT_VARS` variable.
>
> By default, the CVE databases are downloaded using the following
> recipes:
>  - sbom-cve-check-update-cvelist-native.bb
>  - sbom-cve-check-update-nvd-native.bb
>
> The database fetch and deploy logic is implemented in
> sbom-cve-check-update-db.inc. The CVE databases are stored in the
> download directory (`DL_DIR`) by default. This can be configured by
> the `SBOM_CVE_CHECK_DATABASES_DIR` variable defined in
> meta/recipes-core/meta/sbom-cve-check-config.inc.
>
> The CVE git databases are fetched using the Bitbake fetcher. Currently,
> Bitbake fetcher does not support a shallow clone that can be updated.
> While `BB_GIT_SHALLOW` exists, it creates multiple tarballs in the
> download directory, which is inefficient for updates. For now, the git
> database is fully fetched.
>
> The `SRCREV` of the git database is set to a fixed version. A user can
> override this by specifying any other version, or `AUTOREV` can be
> specified.
>
> To simplify the activation and configuration of sbom-cve-check, a
> configuration fragment is provided with recommended default values.
>
> `sbom-cve-check` is configured to run without requiring network access.
> If a user needs network access during execution (e.g., to download
> annotation databases), they can set `SBOM_CVE_CHECK_ALLOW_NETWORK`
> to "1".
>
> The CVE analysis runs only if either the original SBOM changes or the
> CVE databases are updated. In the two CVE database-fetching recipes, a
> file in the sysroot is written, containing the Git revision of the
> fetched CVE database.
>
> `sbom-cve-check` is executed with the generated VEX manifest only if
> enabled and if `SPDX_INCLUDE_VEX` is set to a value other than "all".
> When `SPDX_INCLUDE_VEX=3Dall`, the SPDX 3.0 file already contains all the
> necessary information for CVE analysis, making the VEX manifest
> redundant.
>
> Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
> ---
>  meta/classes-recipe/sbom-cve-check.bbclass         | 121
> +++++++++++++++++++++
>  meta/conf/distro/include/maintainers.inc           |   2 +
>  meta/conf/fragments/yocto/sbom-cve-check.conf      |  14 +++
>  meta/recipes-core/meta/sbom-cve-check-config.inc   |   4 +
>  .../meta/sbom-cve-check-update-cvelist-native.bb   |  12 ++
>  .../recipes-core/meta/sbom-cve-check-update-db.inc |  28 +++++
>  .../meta/sbom-cve-check-update-nvd-native.bb       |  12 ++
>  7 files changed, 193 insertions(+)
>
>
Hello,
That looks cleaner than the previous version. How long does the intiial
build take with
this fetcher?

Kind regards,
Marta

--00000000000014d1c6064d76b310
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 19,=
 2026 at 4:42=E2=80=AFPM Benjamin Robin &lt;<a href=3D"mailto:benjamin.robi=
n@bootlin.com">benjamin.robin@bootlin.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">By default, the sbom-cve-check cla=
ss generates these export files:<br>
=C2=A0- A JSON in `cve-check` format, named `${IMAGE_NAME}.cve-check.json`<=
br>
=C2=A0- An SPDX 3.0 SBOM, named `${IMAGE_NAME}.cve-check.spdx.json`.<br>
<br>
A user can add or remove export file formats by using the<br>
`SBOM_CVE_CHECK_EXPORT_VARS` variable.<br>
<br>
By default, the CVE databases are downloaded using the following<br>
recipes:<br>
=C2=A0- <a href=3D"http://sbom-cve-check-update-cvelist-native.bb" rel=3D"n=
oreferrer" target=3D"_blank">sbom-cve-check-update-cvelist-native.bb</a><br=
>
=C2=A0- <a href=3D"http://sbom-cve-check-update-nvd-native.bb" rel=3D"noref=
errer" target=3D"_blank">sbom-cve-check-update-nvd-native.bb</a><br>
<br>
The database fetch and deploy logic is implemented in<br>
sbom-cve-check-update-db.inc. The CVE databases are stored in the<br>
download directory (`DL_DIR`) by default. This can be configured by<br>
the `SBOM_CVE_CHECK_DATABASES_DIR` variable defined in<br>
meta/recipes-core/meta/sbom-cve-check-config.inc.<br>
<br>
The CVE git databases are fetched using the Bitbake fetcher. Currently,<br>
Bitbake fetcher does not support a shallow clone that can be updated.<br>
While `BB_GIT_SHALLOW` exists, it creates multiple tarballs in the<br>
download directory, which is inefficient for updates. For now, the git<br>
database is fully fetched.<br>
<br>
The `SRCREV` of the git database is set to a fixed version. A user can<br>
override this by specifying any other version, or `AUTOREV` can be<br>
specified.<br>
<br>
To simplify the activation and configuration of sbom-cve-check, a<br>
configuration fragment is provided with recommended default values.<br>
<br>
`sbom-cve-check` is configured to run without requiring network access.<br>
If a user needs network access during execution (e.g., to download<br>
annotation databases), they can set `SBOM_CVE_CHECK_ALLOW_NETWORK`<br>
to &quot;1&quot;.<br>
<br>
The CVE analysis runs only if either the original SBOM changes or the<br>
CVE databases are updated. In the two CVE database-fetching recipes, a<br>
file in the sysroot is written, containing the Git revision of the<br>
fetched CVE database.<br>
<br>
`sbom-cve-check` is executed with the generated VEX manifest only if<br>
enabled and if `SPDX_INCLUDE_VEX` is set to a value other than &quot;all&qu=
ot;.<br>
When `SPDX_INCLUDE_VEX=3Dall`, the SPDX 3.0 file already contains all the<b=
r>
necessary information for CVE analysis, making the VEX manifest<br>
redundant.<br>
<br>
Signed-off-by: Benjamin Robin &lt;<a href=3D"mailto:benjamin.robin@bootlin.=
com" target=3D"_blank">benjamin.robin@bootlin.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/sbom-cve-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 121 +++++++++++++++++++++<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta/conf/fragments/yocto/sbom-cve-check.conf=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 14 +++<br>
=C2=A0meta/recipes-core/meta/sbom-cve-check-config.inc=C2=A0 =C2=A0|=C2=A0 =
=C2=A04 +<br>
=C2=A0.../meta/<a href=3D"http://sbom-cve-check-update-cvelist-native.bb" r=
el=3D"noreferrer" target=3D"_blank">sbom-cve-check-update-cvelist-native.bb=
</a>=C2=A0 =C2=A0|=C2=A0 12 ++<br>
=C2=A0.../recipes-core/meta/sbom-cve-check-update-db.inc |=C2=A0 28 +++++<b=
r>
=C2=A0.../meta/<a href=3D"http://sbom-cve-check-update-nvd-native.bb" rel=
=3D"noreferrer" target=3D"_blank">sbom-cve-check-update-nvd-native.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 ++<br>
=C2=A07 files changed, 193 insertions(+)<br><br></blockquote><div><br></div=
><div>Hello,</div><div>That looks cleaner than the previous version. How lo=
ng does the intiial build take with</div><div>this fetcher?</div><div><br><=
/div><div>Kind regards,</div><div>Marta=C2=A0</div></div></div>

--00000000000014d1c6064d76b310--

