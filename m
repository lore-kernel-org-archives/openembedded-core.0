Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD3FC5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 10:46:25 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7819.1786877175674231141
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 03:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=kvd+m4FG;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=O1XLGLRl;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id AC0A11D000BF;
	Sun, 16 Aug 2026 06:46:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 16 Aug 2026 06:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786877174;
	 x=1786963574; bh=KCNoA1wnGk3QIfBmAFuDWz0dyavzdDSaxZ29Qznfcgw=; b=
	kvd+m4FGpn3HOi3tAKjqlGuPwkinfjT8Ku7U2/C1ckI1Luw+6098/+eD1LNWQ/lW
	tw++efGT31TCg1Z3XbsvHjdlTECOj8Si5b6rx3wHysob//idB8LAjV29a4+gFfpE
	6kqz03rv5T1e0NK0gRqEGsa3A804LFQKsF8+Sw4dw2NEjAN6D8S1F7OzEc0qLjoQ
	gMoZ7qE33WjueACd9OWTq+7t13fAsROD+Y3mI0bD/gWTZpEFRInYYdQ3gobHQfzO
	x+1RwqZa2Wo7aJMTR/0RoGU0W/r1VZ2ZYH9MCzRh2X5daXI9d4M93tIKssHcxjpO
	05lfH9/OkgiVdePtuEGjmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786877174; x=
	1786963574; bh=KCNoA1wnGk3QIfBmAFuDWz0dyavzdDSaxZ29Qznfcgw=; b=O
	1XLGLRlLLtE12IWfj942cSd+OxY02BIUlVOngOoyJ7RxwI0IoyNiv1CGBnomh9Iz
	UWv/mCqWCFdAoqCXcadKZYwVG1A8BXD+irCA/lDYIHprCWQ3ZiLl2TGcXiKBn1lj
	MyeF6EMO3EoceYCCUrXDe15/OLU58hwmmykCu61MD4nDLcPz3KMfHW8hV/g/svO5
	FTOZvTOIyGBO5HroKg4AFFfAnBAa5gPhFrj3jfCb3KYbH87fP53/s9iOUs/BNthi
	KmTFagiaYpKwF8hHCuipD8YMosQCS1dTgbqL/KnoERW3khha8G8fQBSSfFOKkOuZ
	zRT2qyAkm7KxCvS64+QhA==
X-ME-Sender: <xms:9pSBauWn0UWaGt9QWYZeLXXsJ09JQqRXdPOEwhpIGGuI9BCIu3Zseg>
    <xme:9pSBas0-BnMAN77BBcXfg2PIEajdFhiGO79DtmjewKv99d9PH682o7vj6PSrr8-m0
    C0q6SZ3ZQakyBpCyYLeiWPGjUt62hkR2PUb11ac1sJI3Yg1pmxCKe0>
X-ME-Received: <xmr:9pSBakrHVCwhAbkUYn9w2fw9SQN5NCPHuffdmNo7zc0OQD6mD40hZU9utPF0h0hBub_dZObTfUUzXsna24UTZN0l7fhivwTuGXlAYKemq4m3>
X-ME-Proxy-Cause: dmFkZTEv3J8ONljbCyfRzkIQr/PdqxJDRgNFOSriK+xcBEVxPg7bnKyuawa0YiOE07J16Z
    5N/RhJ7+FDq2dE4Ea2XDmdumN5qpUcYb9/XcxSANOB2cffM63kmppmofjEKPMNsnhxNpGT
    Yk3IFlZHZXKaMDoNtMa2NoCOSn6tBexe1URFZRCaZKDutB37qy3G50XpWqEak9f1w2Ap+g
    IORlhrHEq8XAzBoAaO9ibte9Bde3uUZ0YVeah6teCKMtY1Ph1ArgJbGcIVgnrXG0gdEci9
    ppU+7fkfnaNiUuIJpzpz5rZ5trKcpwrmYB6+3woJwE0bUv/XP4hbwQhgtbT2aKGDju9/mG
    0Ou/f9OglRsLxaFfOKaSXbcbRuNfQZRHk8sFoUM5khGoGHEdMb/PY3ColNuSHtzvgFk5bW
    dIXTpv9wN/U3Jdde2LH1htH4bD/0TmnZgSS7eAbHCSwYy1M3tAMRIB0AiDZ18m/9yQQKXr
    ThfMKNdjt5EO/LnvJLxcTI3Cnrtk4fN5xky0T631WzIt+XQXPwjohQ2veXtqWpa6X7DHFd
    8rpujafHhw7mM2+Kgn+0lPG1bfWTT0jNfxPeZGNgxwa2ui64ndM20kK8fFj0UnB57NLhL+
    AgEtgB290TYc6ciS4edA0z5S4aAucIXiplY2ak/w8kxM+W0YricaFrYR+qFQ
X-ME-Proxy: <xmx:9pSBarXEDH6WzTac11xscGG_44D3tKH55PLW0n2639MTfGR2r9Gb7A>
    <xmx:9pSBanYzu7jpEnqTjEDZPpa5FIsODjddX7M3IR4Co8yVZ52bgy4zww>
    <xmx:9pSBagdNBu99I-5fB6fGyusmwrellmxLOgdEHVVJVvSfxsEu_OCe3Q>
    <xmx:9pSBap1xMfc1tkm-L7YBQjTtfH94tieOet726OjtpT2Uq0modq5Wdg>
    <xmx:9pSBaunuZoVHk2VftkUAAd9DrBUGgEEMOgxGlV4XKiNxlI7LPlIZtkyw>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 06:46:13 -0400 (EDT)
Message-ID: <96d72ef99f426d380cd090740ff636df1512ba2f.camel@pbarker.dev>
Subject: Re: [PATCH 2/2] package: fix source path in save_debugsources_info()
From: Paul Barker <paul@pbarker.dev>
To: Benjamin Robin <benjamin.robin@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com, antonin.godard@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
	daniel.turull@ericsson.com
Date: Sun, 16 Aug 2026 11:46:11 +0100
In-Reply-To: <20260810-fix-save-debugsources-info-v1-2-2e83131bcf01@bootlin.com>
References: 
	<20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com>
	 <20260810-fix-save-debugsources-info-v1-2-2e83131bcf01@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 10:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243511

On Mon, 2026-08-10 at 09:11 +0200, Benjamin Robin wrote:
> Previously, except for a kernel recipe, the source file paths were never
> "resolved" since the KERNEL_SRC_PATH variable is always defined. So in
> the ${PN}-debugsources.json.zstd file the source file paths always starte=
d
> with /usr/src/debug/${PN}/${PV} (which is the value of TARGET_DBGSRC_DIR)=
.
>=20
> Currently the debugsources.json file is only used by the spdx generation.
> - In `get_patched_src()` the sources of the recipe are extracted (again).
>   The unpack task is executed from a modified local context with UNPACKDI=
R
>   set to the value of `${SPDXWORK}`. So in summary the sources are
>   extracted in a sub-directory of `${SPDXWORK}`.
> - In `add_package_files()`, with topdir equal to `${SPDXWORK}`, all the
>   files (recursively) found in topdir are listed. For each source file,
>   if the file path (relative to topdir) is in the list of source files
>   retrieved by save_debugsources_info, then the file is added to the SPDX
>   SBoM.
>=20
> So try to handle that by replacing ${TARGET_DBGSRC_DIR} by the relative
> path of ${S} relative to ${UNPACKDIR}. If ${S} is not relative to
> ${UNPACKDIR}, do nothing.
>=20
> Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>

The paths in ${PN}-debugsources.json currently match where the files
will be installed on the target. If we change these to be relative
paths within ${UNPACKDIR} then we would break other ways that the
debugsources json files may be used.

What is currently broken? Can this be fixed at the point where the
debugsources json file is parsed instead of where it is generated? Sorry
if I'm missing some context here.

Best regards,

--=20
Paul Barker


