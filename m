Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4A9109B485
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 15:04:23 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22690.1774969454957995266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 08:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZsxIFy3b;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6501c9903edso4708969d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 08:04:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774969454; cv=none;
        d=google.com; s=arc-20240605;
        b=Zux3q4F4WfmxgFVR+K9EOqSQ7sGALLHLFNNmtGHjXcHHsaViBjG9sstG2owrU5BJ7Z
         +6VRY/jM4xt6Ha3b1kDFffcg0d84R1RRTEHDg7KJPwgGDGL0yIcnOTSSJZPHOIjhMLYz
         rXunH80kkPyY3mnqoHAiMopbFF9a4RB+u+dzVnNHpzpZa9Utfp3loaSy65iY7Zmc/1kG
         RWuY8H74/624B94oRUJ1rkS4fgUL+/tl1hDUPjT7IrOdGCg/WuxJmTjq/4eUN0gbvLyK
         ZxYtxp3wVYVrQTn8w135vpHpa/Ytvlpc3ZXFo8VXPzEQeJHqgzoGXlSYzYG/U69Hp9mS
         mo0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b/HiFaWBX1R5wsEO6bIgq9URMqG2qNnbMbaWwtZCzZA=;
        fh=jYvOMpcaG3zDJ4xGXzIc+3s11PRU+uoSX41zoxFL6Ms=;
        b=RU27irKmPfI4o9vjf/e3chyu1ZHqAVileep8I/yiNZJoHwAfDKwkKpb0KVSEh9tz+u
         KzEyuuGM6J7MXvY72AB/4+E1snECAz4ouIl1KmXZg+u7OoJc5lYCuXQsUBwyH1cQQDD0
         O3CZOEZT9RSAla4Kjms3xk2t4qqyLZDryXz0N1GpBEDkjoZ+Vo2jqPNOrzstpfleNlWq
         cTpMyEsGpRxpxxNJtJgGunnKs+Uf7f/meImt54l/Rb9/Q2iT4B4/xWALaVpcXbwT7hrY
         gSxej2qw2cBYVHT6kG3qm5ohTAsbBuI6009Ul3rKftGU1aPgnYJ+TDTZf7VzfaayW8E8
         XNjA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774969454; x=1775574254; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/HiFaWBX1R5wsEO6bIgq9URMqG2qNnbMbaWwtZCzZA=;
        b=ZsxIFy3b1bC5zqXKXlZ9Ykqdw+dMUEau8h1dEwqrXuv4H1bbvluDTdkci/wQ8w+TaM
         lLpXb0Kgq798x8YoErdM7u4ysYBp/nO2G1KMCkFH/ARGi4kZu4I4z5L/1whqG0nA739w
         llAlO8tNjfO/na+Gxln1c3EYh6LoRGDWqMeLgWTGIcRK1Q7Clu/yHFrdD6WV75S6rzRQ
         PC9iR95P4nkUerrC6x1g+tfmvge4OtiVP6oUpjFVR7aU78Lj1m0VVFb9uqIcH0YlUVB1
         F5GNrkeHePZu/4/2NHdBLmIqlyXTIjTCsZqhqYjASf2BTRs/Qq8lc7gGvgOFTS/Uxi1x
         leIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774969454; x=1775574254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b/HiFaWBX1R5wsEO6bIgq9URMqG2qNnbMbaWwtZCzZA=;
        b=bWdnjTWR7iCTSQpVpOyThQ40XDWJfm5H8i4iiIVE8hE2XS0JGTKMgOI5ESsSLnaMVA
         iEZnK4G+Ua+k1iAaCGB+V5+Q7XWdjgkZoh0jodWLaE+LRbLBbm4EzTSFzTmPaOeEDY2v
         GlB/ZWFDDkJnWEbFKKMc4g4OLCU9p7EgmeQppc7nb0+jIbn61ddT7UGtA1eDt2YTvZ63
         jjrSSQDcgOUT0yJIsmBRczZa6PXPJq4aTuJA7bHciq4cdPYXrjLnH3MMk0Bwn8FOnIbI
         nuuJ7uImZmQXiiR2lfvo4qLdaQpjYykhc+rm4VPiOubHkaF3P3UgwhWvZIxiaraSGFAo
         t5/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2M9LSqCPt8DnoERw2Kobs3d/L8HBPU2VXHSLVNW+fu245FYCJLjF8c4IDlabx0RJp4rbEicgVyu9tL8K+v7mc+A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQ1jgbJkcZEAhBTMPyi6ZQdv8VjM2/R2INUZoZ2zWltXfvRPBZ
	udRrFryrrKw7oj/Ivg/ghnuV97oWGNpzSkrO7n+oDo339w3Qg4wvIul5VsQN7DxXfERHZLvYjnC
	EMvDvykCQlv790hC960tW1KpD1EB6mjI=
X-Gm-Gg: ATEYQzyLHRM6wsF53pAcnZF93jzIN8ZbbsNOXIb3uC+Mn9E5L1KPdZHgWCO7MdNx1Lt
	UN3BUVByo9bPDkeGcFVSwqBoM1nmfOv/hh0y/SJTvhIYL8/vLTSpeJLEWKAl3wm/kcxxjOJ8DWM
	DfMdQrac7Q5gxE4QjYsKhSBlCgOlGdzWb+zGQ2mYOfotmz2mhuOIGQZxouy51M9JVle5iQNLJKI
	ol3fll714NQ6LVeyX3fkifnBxkweQ19HPTre8gMX2vALQYZ1YI0mmzU8lL+nTzn19iHYAloptFy
	3ad4r4X8RFQ/6bvvcRnV8g==
X-Received: by 2002:a05:690c:13:b0:79c:bb82:612a with SMTP id
 00721157ae682-79cbb826bc6mr121512437b3.17.1774969453804; Tue, 31 Mar 2026
 08:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260331141956.608976-1-stondo@gmail.com> <dc8346baa9db2434b2296c22550e40ac7389201e.camel@linuxfoundation.org>
In-Reply-To: <dc8346baa9db2434b2296c22550e40ac7389201e.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 31 Mar 2026 09:04:02 -0600
X-Gm-Features: AQROBzARHe2zppJQlJEjdhARy0ZBrvoYC2E9NsKt7kT4pXA8HZX1cv_yiTkYDS0
Message-ID: <CAJdd5GazcRuxPSdgXEb170f+E5uA2oP=C2eKLqCNnLC8Y_fB6g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] spdx30: Add OpenVEX standalone document generation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: stondo@gmail.com, openembedded-core@lists.openembedded.org, 
	ross.burton@arm.com, marta.rybczynska@syslinbit.com, 
	benjamin.robin@bootlin.com, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com, 
	stefano.tondo.ext@siemens.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 15:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234298

On Tue, Mar 31, 2026 at 8:23=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2026-03-31 at 16:19 +0200, stondo@gmail.com wrote:
> > Back at the end of December 2025, I had a conversation with Adrian
> > regarding OpenVEX. Following my SPDX 3.0 enhancement series that was
> > merged recently [1], I would like to propose adding OpenVEX [2]
> > standalone document generation to the SPDX 3.0 workflow.
> >
> >
> > Context: current VEX landscape in oe-core
> > -----------------------------------------
> >
> > Yocto currently has three VEX-related mechanisms:
> >
> > 1. SPDX embedded VEX (Joshua's recipe-level architecture in
> >    create-spdx-3.0): VEX assessment relationships embedded inside SPDX
> >    3.0 documents, controlled by SPDX_INCLUDE_VEX. This is the richest
> >    VEX data source, now at recipe level after the package VEX
> >    removal [3].
> >
> > 2. vex.bbclass (Marta Rybczynska): A standalone do_generate_vex task
> >    that produces per-recipe JSON files and a rootfs manifest in a custo=
m
> >    Yocto JSON format. Used for CVE reporting and consumed by external
> >    analysis tools.
> >
> > 3. sbom-cve-check (Benjamin Robin, under review [4]): Post-build CVE
> >    analysis using an external tool that reads SPDX SBOMs + vex.bbclass
> >    manifests, then re-exports enriched SPDX 3 data.
> >
> > What is currently missing is output in the OpenVEX format (openvex.dev)=
,
> > which is a lightweight, interoperable JSON format adopted by an
> > increasing number of vulnerability management tools.
>
> vex.bbclass is about to be removed, which simplifies things a bit.
>
> Is there any reason we can't have an external script which extracts the
> vex data from the spdx?
>
> My personal view is that it might better to support various
> conversion/extraction tools rather than trying to output all the
> formats someone might want directly...

Agreed. I already prototyped this here:
https://github.com/JPEWdev/spdx3toopenvex feel free to use it as a
reference for how to do the conversion from SPDX 3 -> OpenVEX


>
> Cheers,
>
> Richard
>

