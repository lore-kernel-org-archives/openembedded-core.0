Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8BEC3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 13:05:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.147486.1723813548951809984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 06:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YTZue1Nj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4280bca3960so15403165e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 06:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723813547; x=1724418347; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F+2F9cBMsfGgb3kEhTv2NZzeiuLPuxJ0lvHHZttcR5g=;
        b=YTZue1NjfvuMDJzRucTKwexYoplANiRzFXKn7Zp40ASDsQIzv2ELL1iviqHzydVFhs
         09l+OUtdQPR4f6BDjYG3U7eaN/tKBEm3YmNQkGzBHQWRTEp3YzO/sIvIRsR4WwyAH0Z6
         xcmUBlkapKHFo8zIny265yTxky6Q7HyWEaXcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723813547; x=1724418347;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F+2F9cBMsfGgb3kEhTv2NZzeiuLPuxJ0lvHHZttcR5g=;
        b=DSa6mfSysF0SA1pZlwXvvgp5Gnq538Od1jnJqK9qWO19gA5mI1rrTJlAuQMHS32TvS
         x51OwmVNlC2GNcKJYC+71V7jMitKzguZGVs7rTveS0bA+4zc33dRtQ8Pzr25RHvVw8zz
         VY4OCE/O6vTpbgVRpRDylVBnX6aQvM2S0ESXl18wHgeLV2cjSuD4L/Ywmvj4HkEdQX01
         aeL9yp0t3E97SSSNFIUUuGnmelyFMEN0MzzMRWenwT8gXICjR/QBFiqBnAO1HjTu7d5k
         G0AmSBvlK85Vzxs73n7qjLvV9ie86A5QmWs3ctTbByEusoJTuxAkMqAr7BG30Uc5fDNs
         Tr5g==
X-Forwarded-Encrypted: i=1; AJvYcCWU15xVrF7JOyAF8WiOMx946YDOSyNH1T4saMKGrzTAMp8ONf4Cr4aPNS3JV48t/BGrNPd73D9Lp0AfHhz5gfPsPB8cWngIzXIcGJAhbonYmYp/s2mnaJNp
X-Gm-Message-State: AOJu0Yz8c0L2+Exp8CFKGZABggKLlN4MZyJR3ZwGrelNedd6ToJC+oJm
	Dc+i7M/ZuK+CCRovzsMdONc4LR/JxngB5IrxhskDM2WYo2rKdh4BhD3WwjO5gjQ=
X-Google-Smtp-Source: AGHT+IFoveOJAAAWn7kUJwCkAFBStCOWuvo9LsbsZiMmsFUpVuntqhTVwZBPKCAi4wRAetOXdqv7ng==
X-Received: by 2002:a05:600c:45ca:b0:426:5ddf:fd22 with SMTP id 5b1f17b1804b1-429ed78572bmr19888525e9.6.1723813547091;
        Fri, 16 Aug 2024 06:05:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5ba6:8f16:1fbd:baab? ([2001:8b0:aba:5f3c:5ba6:8f16:1fbd:baab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed648ea4sm22461255e9.1.2024.08.16.06.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 06:05:46 -0700 (PDT)
Message-ID: <ca9c814c589839548a08544b8c6d403226852c9a.camel@linuxfoundation.org>
Subject: Re: [PATCH v2][OE-core] cve-check: nvd2 download database variables
 update
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rybczynska@gmail.com, openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Date: Fri, 16 Aug 2024 14:05:45 +0100
In-Reply-To: <20240816122342.974794-1-marta.rybczynska@syslinbit.com>
References: <20240816122342.974794-1-marta.rybczynska@syslinbit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 13:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203463

On Fri, 2024-08-16 at 14:23 +0200, Marta Rybczynska via lists.openembedded.=
org wrote:
> Update the recent code adding local/source database files. Add LOCAL and
> SOURCE part to variable names, as none of them needs to be in DL_DIR.
> Use old variable names for the source files, so that the change should be
> invisible to users after backporting.
>=20
> At the same time fix a bug: handle a situation when both point to the
> same place (was: a deadlock).
>=20
> Fixes: 03596904392d257572a905a182b92c780d636744 (cve_check: Use a local c=
opy of the database during builds)
>=20
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> ---
> =C2=A0meta/classes/cve-check.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++-------
> =C2=A0.../meta/cve-update-nvd2-native.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++++++-------
> =C2=A02 files changed, 21 insertions(+), 14 deletions(-)

I'm not convinced about this I'm afraid. I think do_fetch should put
data into DL_DIR and share it, "cve-update-nvd2" isn't special in that
regard. We do want to have our source artefacts stored in one place
consistently.

If we keep DL_DIR, the naming the makes sense?

Cheers,

Richard

