Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14F9109B477
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 14:23:52 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21291.1774967023673847947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 07:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HSSjXZVC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfce3a195so1438835f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774967022; x=1775571822; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kqK7WQ7X9iPXBv9sYdTG8KyYB21S0ap4Z2MnOw+Mhuk=;
        b=HSSjXZVC1AQb9dJ8XYl9SEzbkorkhGv07YwlrFDlSDK3nhgUx0ISk3odXFVgvp3pdA
         jXRKc7QbnRAzrC4k/i8Z8VlsRC8mBdhqP7Rl6I5Joo+/F33NSnKTNdV9CGZtYQqFHoC1
         QFCId69vTF0oaEuEo2Zj6VVGYSeWFvMX044PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774967022; x=1775571822;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqK7WQ7X9iPXBv9sYdTG8KyYB21S0ap4Z2MnOw+Mhuk=;
        b=bvdsLsYXRj3EWF4piwM/lk/9eMe1qUbQZdWjG5QAiqBg0B1R7YKfAVZJEb2Gf4KHOJ
         UkK8ctVyFTiDq/+6NtIZBSnOdau3XC3K92Ms5v5Q4NY7lqqwaOzKmYAxipm9FUeTuV/S
         lnHBD0CA9h6CkDMJU2axEHK/gCliP5ywglNedb9gdCbhdKEy30QBTk+KWNiqaEq6MgTt
         54ugPt7XJNP6rX7RjBjdigJp1d/7LWmOaVp+Q6K6ctab8mbd1qFysoOtg7zowAn/cDyX
         nYo6GWqraNczaXqbcAjImJ9MyUX3O0ep1EmgAoUMLasJJo2q5YEo1OEzf8tY5Pjz5eZZ
         Kmig==
X-Forwarded-Encrypted: i=1; AJvYcCX4sPhOIwpWtkGH1Gz1Onz1PhoFh0YZsaRwN2Qjrx8x81wMKCKwcjw1uyeRN+Zx/6nm9sed3Jxg5OagdHQi9wM+UQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxUOsyNhHzjdaoFaaNb+y2KPEQozHZtUrUOe2jK6na8RsCMuPf+
	bOsrPmAkiQEWqKC8ytGoL5HcmoUUR1DmrHRjd218EVHaajDXC8hudo9TENnYiTFHASs=
X-Gm-Gg: ATEYQzxzC4JIZPYyoZusA7b6+mpeXdi7yAirr+69R36f5TMdv1dCez28mWoLijR1r9M
	ZnWl0enAume1DQqt2yLG//7PHyBCa3/D84kSdiwLUK1D4F69ATuFFlPclMOMUL6mC7yf5ujoWtV
	N2o9jVmfbUgzXcs8oNbmiTdwE2idRcn1neYF5IFHHxhm4gvVxJdm7xBSAjAQkhCtd5mKz/dDdo7
	nAm3kdEGQNlcd2VkPyZx0EjJCxVrGW7UMA9+SR4Dipvytyb2cCBSudwuDGbbZY+T8cZu4YHfJoL
	V4Y3YKo8CXChK20nDbNkoDgpp3gib5QrH1NYqITWTaBpWTOWDAdF/c//smFRCkmypM4sJhwa+z/
	/Om5zm7Ot+oUP0mJkHmS6btntuXz6Wi43Lo6zPh64NI02aucboAgFK7XboBSe5geZunmzBmfUdB
	XgKTf+PlMRkUGF8vTJXLXAbmvoCP3kZ95tlHR3A4D2F+f7L7+dxaxW/TRNNac7I0iD79/9y4gHP
	L6taEjmo2Z2Ynic
X-Received: by 2002:a05:6000:430c:b0:43b:4981:1ba3 with SMTP id ffacd0b85a97d-43b9e9d5e80mr30243980f8f.2.1774967021994;
        Tue, 31 Mar 2026 07:23:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e29c:9e31:f797:402b? ([2001:8b0:aba:5f3c:e29c:9e31:f797:402b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24739easm28704490f8f.30.2026.03.31.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:23:41 -0700 (PDT)
Message-ID: <dc8346baa9db2434b2296c22550e40ac7389201e.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH 0/2] spdx30: Add OpenVEX standalone document
 generation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: stondo@gmail.com, openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, ross.burton@arm.com,
 marta.rybczynska@syslinbit.com, 	benjamin.robin@bootlin.com,
 peter.marko@siemens.com, 	adrian.freihofer@siemens.com,
 mathieu.dubois-briand@bootlin.com, 	stefano.tondo.ext@siemens.com
Date: Tue, 31 Mar 2026 15:23:40 +0100
In-Reply-To: <20260331141956.608976-1-stondo@gmail.com>
References: <20260331141956.608976-1-stondo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 14:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234294

On Tue, 2026-03-31 at 16:19 +0200, stondo@gmail.com wrote:
> Back at the end of December 2025, I had a conversation with Adrian
> regarding OpenVEX. Following my SPDX 3.0 enhancement series that was
> merged recently [1], I would like to propose adding OpenVEX [2]
> standalone document generation to the SPDX 3.0 workflow.
>=20
>=20
> Context: current VEX landscape in oe-core
> -----------------------------------------
>=20
> Yocto currently has three VEX-related mechanisms:
>=20
> 1. SPDX embedded VEX (Joshua's recipe-level architecture in
> =C2=A0=C2=A0 create-spdx-3.0): VEX assessment relationships embedded insi=
de SPDX
> =C2=A0=C2=A0 3.0 documents, controlled by SPDX_INCLUDE_VEX. This is the r=
ichest
> =C2=A0=C2=A0 VEX data source, now at recipe level after the package VEX
> =C2=A0=C2=A0 removal [3].
>=20
> 2. vex.bbclass (Marta Rybczynska): A standalone do_generate_vex task
> =C2=A0=C2=A0 that produces per-recipe JSON files and a rootfs manifest in=
 a custom
> =C2=A0=C2=A0 Yocto JSON format. Used for CVE reporting and consumed by ex=
ternal
> =C2=A0=C2=A0 analysis tools.
>=20
> 3. sbom-cve-check (Benjamin Robin, under review [4]): Post-build CVE
> =C2=A0=C2=A0 analysis using an external tool that reads SPDX SBOMs + vex.=
bbclass
> =C2=A0=C2=A0 manifests, then re-exports enriched SPDX 3 data.
>=20
> What is currently missing is output in the OpenVEX format (openvex.dev),
> which is a lightweight, interoperable JSON format adopted by an
> increasing number of vulnerability management tools.

vex.bbclass is about to be removed, which simplifies things a bit.

Is there any reason we can't have an external script which extracts the
vex data from the spdx?

My personal view is that it might better to support various
conversion/extraction tools rather than trying to output all the
formats someone might want directly...

Cheers,

Richard


