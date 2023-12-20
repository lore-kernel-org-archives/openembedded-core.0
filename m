Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AB3C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 16:52:52 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.26669.1703091165029755400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 08:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R0UviQps;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33666fb9318so3761866f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 08:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703091163; x=1703695963; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=chSMzv0pFHcSLmmjE635Q49VYBSVlc44YIzbEo3XqlM=;
        b=R0UviQpsp5o9pfXQ+QqAjQGD+nZgXsy2YxAbOiLWBWdyLqAB4paTKbSXacdU4y0ywq
         SsiNjQccoVxON1BJM7RQ8vK+SpeKeQILTlb+G9Wd+84wmrS7RmbKbrEdK0fRHkbhHNiU
         mYTUIRN7kVJ4X0KydbWLyFYmnQnF9z1NeCmtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703091163; x=1703695963;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chSMzv0pFHcSLmmjE635Q49VYBSVlc44YIzbEo3XqlM=;
        b=kAsKAowKM6UOZ476F2f+c/I2aWCbzQFXS2fLlElyQCVBKyeVjlOp77fJzWuu3siyKb
         Kq8uEgPJzzcM8I2zFBQhbzEwYvCuysw/KWK93MJ3n4CQyDEdkH6PDyy+lElP9z8YIBrW
         v0R/bgkwL4I8n2AWv4xiCJoYVhYG4nmvWrRd9UtPt5P6FKH6tzhwz35xNjOUhue3x0G6
         EhilC71dPNs29daeOhiSQYDRmc9ZRfX8gSGc9wnizjyFUYaZPzMNmnjzX1xPrut+qzuW
         jSOQH5EthODj0k2DcwLSUFEWjQB5CegDTQWc0BHt3w9Vzz5wiJiAZMcpsXMSFejq4kIf
         lDsw==
X-Gm-Message-State: AOJu0YxpovjZxoQGU33pVR6CUj8jerywYSsp7IVS0leag8TanFypp217
	vNl54WgUf9GtoZKeEDfP98lpnA==
X-Google-Smtp-Source: AGHT+IGfsf6NZdXa1h9N/WrXxlFnfyIi4k7NJtL9UuDNH45cZJKQqCcW1/RJCnFqbWa6wvNAoBL2dQ==
X-Received: by 2002:a5d:64c7:0:b0:336:6b15:de03 with SMTP id f7-20020a5d64c7000000b003366b15de03mr4045247wri.120.1703091163394;
        Wed, 20 Dec 2023 08:52:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c? ([2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d4247000000b003366811fd6bsm17137wrr.14.2023.12.20.08.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:52:43 -0800 (PST)
Message-ID: <9785c621ad1c2d2ac1c544d88d737029f83857fb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] qemurunner: Impove handling of serial
 port output blocking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 20 Dec 2023 16:52:42 +0000
In-Reply-To: <87sf3w25ze.fsf@draig.linaro.org>
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	 <20231218152951.3398964-2-richard.purdie@linuxfoundation.org>
	 <87bkam449t.fsf@draig.linaro.org>
	 <86be77c51628028eeda996117c5eb02eb8bf5941.camel@linuxfoundation.org>
	 <87r0ji2lc9.fsf@draig.linaro.org>
	 <8c50fc53a29c4dcaab6316ec5b39b91c0d6bfa94.camel@linuxfoundation.org>
	 <87a5q52oa0.fsf@draig.linaro.org>
	 <3a7d3b6a2762163c7ca668c205962cd6cf5d5fd4.camel@linuxfoundation.org>
	 <87sf3w25ze.fsf@draig.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 16:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192804

On Wed, 2023-12-20 at 16:28 +0000, Alex Benn=C3=A9e wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>=20
> > On Wed, 2023-12-20 at 09:53 +0000, Alex Benn=C3=A9e wrote:
> > > Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> > >=20
> > > > On Tue, 2023-12-19 at 16:44 +0000, Alex Benn=C3=A9e wrote:
> > > > > Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> > > > > Yeah I'm only seeing A10/A11:
> > > > >=20
> > > > >   o regression_1010.5 Invalid memory access 5
> > > > >     regression_1010.5 OK
> > > > >   o regression_1010.6 Invalid memory access 6
> > > > >=20
> > > > >   WARNING: here A10
> > > > >   WARNING: here A11
> <snip>
> > > >=20
> > > > How long does it take for the test data to "back up" and timeout? T=
he
> > > > logging thread should take a maximum of 2s to notice data not being
> > > > read/handled on the serial port.
> > >=20
> > > I don't think it goes around the logging loop more than once. I only
> > > see:
> > >=20
> > >   grep "got" build/tmp_trs-qemuarm64/work/trs_qemuarm64-trs-linux/trs=
-image/1.0/temp/log.do_testimage
> > >   DEBUG: got [(12, 1)]
> > >=20
> > > from the poll.
> > >=20
> <snip>
> > > I'll keep digging.
> >=20
> > I've merged the patches into master since they are helping the stdout
> > issue and helped a number of issues others were seeing.
> >=20
> > In the final version of the patch I did fix an issue where the
> > exception handling from the thread was not working so well, it does at
> > least print a, exception/traceback properly now (in threadtarget()).
> >=20
> > One of the reasons I asked about the warnings was in case that was
> > showing an issue, previously it silently failed.
> >=20
> > I can believe there are other issues hiding in here :/.
>=20
> So the failure was due to an exception being thrown at:
>=20
>   elif self.readsock.fileno() =3D=3D event[1]:
>=20
> when my config hadn't triggered its opening. A bit of defensive coding
> and it works. See:
>=20
>   Subject: [PATCH] qemurunner: more cleanups for output blocking
>   Date: Wed, 20 Dec 2023 16:14:50 +0000
>   Message-Id: <20231220161450.1422484-1-alex.bennee@linaro.org>

Glad it was something relatively simple! The fix looks good to me.

Cheers,

Richard

