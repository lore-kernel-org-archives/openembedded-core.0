Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60655C0219B
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 07:40:13 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.34631.1738827603041686600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 23:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V4yBOnns;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38da72cc47bso413111f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 23:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738827601; x=1739432401; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4tB19UkTxF3sLcKBmuImmBfhQ3EyNA2ToydicyV8C+g=;
        b=V4yBOnnsNqEnt0xefSLZ527XitzlgMz/0rACteG7g4hEZbHN4kSJGuK0dRP7vcR3yQ
         ERPjzOwIqfMQhIo9W0CcF2v/r9JugSC5yFVJk0gkBLh6B1HMcXv55fLzsCzy55ujs3a4
         HvfCKglvYI5Ga92dbYZAOVZ//tUd+6WKh7ymw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738827601; x=1739432401;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tB19UkTxF3sLcKBmuImmBfhQ3EyNA2ToydicyV8C+g=;
        b=vXhj5jT+W+wj3/HjGnUETsx7uqGIUOPHKutYBNalcwSVub/eQBaOkL+YjT9fSLYHIQ
         FMuIqtaGxfzUV6liHWpmoBnaUDGgWAUgnLQrP30dUv69ivmVOVNBRyPhwpl2SwSdnVzs
         GvjpTK2R8c9T6KREjm0r94HX7G1vPFRurQh1yI3QAx5wWd0btSSa+pmEquH7+XEYPdRX
         72RWm0soPZi67jBtXtbuBpn1SHZ9RoCffSuH1lipwBwpeXoitGmMtff8upWwObcmcOzA
         soPbwU98vEsG6OGkV3MR9p2BHk0HJlEDBdcL2IqAi3DA0SqPqNqsDYRIYAXuMI7Zxm+C
         AZGw==
X-Gm-Message-State: AOJu0YzB5sjww50vt905lPvU1BGGxVm92l8/njBKGXHCD4Fu9ZgK4qLd
	ke0EFrwXd4thFEEhbM1pOcfqdqqUQr+cVRSKPbh2gw0g0Epcjrpn+BdsAvIu59E=
X-Gm-Gg: ASbGncuF322id0H8amNETzX8KLiMU3yTvQ5yXLBmRBQ+eZbE6WQ2jdr+RTLVGkrpHgq
	35rTOpRu/CnUWdkSU3l/UKCnWnjy03q4ikoKv3QA7GZpQ9L+S+PSgVJeW+Fb5xHTcatCfZPHb2J
	tnPu69vSa263I+HVvC1T+qzRaz8JELJqu6tlYYNuXOWpSosNUr1i5h24ECFlU8u9Mm+cSM2VX+V
	ASuP3l/jxg4o1xEFmp4FkTGX/8R8GYTdgj8SSRU/eHFuyQxrPEiyTk7vAam8J6amus4nrGVW8Vk
	qp78PrcLn+UeTzmYi2HYplYwsJLPhFX3ctdBnSsn3sqXI2mzb9VojmwYoMVUsDGfeDlpeNbZylY
	=
X-Google-Smtp-Source: AGHT+IG4XDJbsdWBE/tA3UJP3/0QGeak7I2UAQpl1Fq+lce5wVfgUo+4VMOp0aqw0AE7DraDhzKClA==
X-Received: by 2002:a5d:5f55:0:b0:38d:b2e4:6d97 with SMTP id ffacd0b85a97d-38db493efb2mr4788467f8f.41.1738827601362;
        Wed, 05 Feb 2025 23:40:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:96a5:f4:cb3c:d62a? ([2001:8b0:aba:5f3c:96a5:f4:cb3c:d62a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ff10sm10160235e9.12.2025.02.05.23.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:39:59 -0800 (PST)
Message-ID: <b029a8a84294c6cad08dae46a5cfec398bc04a6d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/9] multilib_header.bbclass: need multilib
 headers for nativesdk builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, "hongxu.jia@eng.windriver.com"
	 <hongxu.jia@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Feb 2025 07:39:57 +0000
In-Reply-To: <3AEDB7FD-6C36-4B80-9E24-0030B4A54E47@arm.com>
References: <20250121085526.1370937-1-hongxu.jia@windriver.com>
	 <20250121085526.1370937-2-hongxu.jia@windriver.com>
	 <3AEDB7FD-6C36-4B80-9E24-0030B4A54E47@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 07:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210907

On Wed, 2025-01-29 at 16:58 +0000, Ross Burton via
lists.openembedded.org wrote:
> On 21 Jan 2025, at 08:55, hongxu via lists.openembedded.org
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
> > The nativesdk multilib support required it to fix multilib headers
> > conflict
>=20
> So the context here is that luajit apparently needs to be able to
> build native code with the same word size as the target.=C2=A0 But this
> demonstrates nicely that nobody has tried to build a 32-bit luajit on
> a 64-bit non-x86 machine, for example:
>=20
> > gcc: error: unrecognized command-line option =E2=80=98-m32=E2=80=99
>=20
> So if the goal is =E2=80=9Cbuild luajit everywhere=E2=80=9D then this doe=
sn=E2=80=99t solve
> that problem.

I've been giving this a lot of. Part of me does like this solution but
equally, it is complicating something which is already quite complex
for a comparatively isolated problem. As Ross mentions, it only fixes
this for a small subsection there too, it isn't a universal fix.

Some of the patches in the series are simple/trivial but others have
what looks like quite fragile logic (e.g. the libgcc paths).

I'm not convinced merging this and trying to support multilib
nativesdk-gcc is in our best interests unfortunately.

Cheers,

Richard


