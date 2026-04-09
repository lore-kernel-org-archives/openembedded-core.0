Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E28FF364C3
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 21:54:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.143684.1775771654742356670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 14:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iJrZcWKN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b0046078so14413745e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 14:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775771653; x=1776376453; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmDtVHqH3yVFfXX03IWTcpR2LUn+rBo6OiYmt0dqhtQ=;
        b=iJrZcWKNcq83lkKRKWb0Fcvfm33Sjr3NQMuE7vhsPfj6KGQg8BhRXFNNAEGAi7ASjd
         /dPvwqcrhJhB6zlk5YDKYh9aNn6DmHpDz2PXxWfsGCi5GE8U8XRH6voKJ6exg2iZhMGU
         OvJXu2ebFAe3WH+8MYy8MkvN/McM2S9EzTiHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775771653; x=1776376453;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmDtVHqH3yVFfXX03IWTcpR2LUn+rBo6OiYmt0dqhtQ=;
        b=m0kQACpaNzzJo/L2AP531ropcI5WGlD/Xr7wO8o3fjMyNlIDdZ/yJfAE9ErLEFU7eW
         mTNS7I8KRDbr3SnSBZzylcEdf8UKLAbSAhJFmFtTuC2XnobPjL8n3cydsdlmQDMpc/OI
         GA/0DEu2itdbxzYIFXQ8ZUIHEe7jgXvKxo0/cBt27WamC//U0ivt9x1fVGKf3OZFVcaI
         49NPl6hyTcHyUHBx5HF774QMteuji0Ao51D1tdUaOypIN5Uz10p9Ixe7gK8gR7qPALDD
         o91p2LX3QDIxNhXiXiFRX4KQJ+zBdcvjdjtUb9r+y2zff8uxYNhSY1e47oNxPiRnKJYB
         LHMw==
X-Gm-Message-State: AOJu0YwJBujvB1pZiv3peJ6pgj4nFTAtpbXX1i67AzXxDpLyO0rx2crU
	Y/uusNC5yHLuo2kPG4uxMrKg1opMn3El6v3WAmmjibbmAPQlGT+s7x+EFrKWO71HbozsyzjSDpO
	DQMgM3O8=
X-Gm-Gg: AeBDievtLCEC83zdv/L7BGmp5eiJkmS781ERdjvE8sEYcUvHP0vVad3Xp+O050r+V0L
	upjDwDRUgw3HJRs9hb5jGwnFDs+Spml4ka1CdbrWq9O+5XZ29ZoFLQIj+B2xt2QXSitPlcpbw2q
	Jny0TtDTcFpI5Z6z6k+zuN2VY9bUiz57MQzIodwQ1wX1eMw4WQzWk1ieK6UoCz8qwVN2xj3uCnd
	D1jdFXW6j9m1a5PM2owzyDbLDpErI6pb/RUmkmbdf1uRS3kFWZtL9jFkkd33oXSSpwbIsZLWWcz
	0QX+I03MBuedZWT+fNrvrHbLwyad/t4IzC1XjTqaCM0nTf2b8T19lncyLudqvmf/pzLXUh1GxKy
	ffAHOPm5YPaeFS1uW1TvFjYlYufP8QEHpaMVA7tvM8cma8xK+tDXfINJdycc32QT9QxA3TaOl4P
	CFkeJztoJa5cqaI8nKGr/i1eR282TPclUrPeeUQ6gKhPDCWJ/uT9A0sOfc8xwYA17iIeHVwMV58
	RI1VRMWLN66SNTK
X-Received: by 2002:a05:600c:8209:b0:488:9ed3:148f with SMTP id 5b1f17b1804b1-488d684ba0emr5014535e9.21.1775771652676;
        Thu, 09 Apr 2026 14:54:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c642:6c74:9bb7:e65d? ([2001:8b0:aba:5f3c:c642:6c74:9bb7:e65d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5888a97sm24879815e9.2.2026.04.09.14.54.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:54:12 -0700 (PDT)
Message-ID: <c54c4aa98d2e22d8e40abe24c74897cb8296d291.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/reproducibility: Work around subunit
 protocol limitations/bugs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 09 Apr 2026 22:54:11 +0100
In-Reply-To: <18A4CA9DFD58F4F1.777565@lists.openembedded.org>
References: <18A4CA9DFD58F4F1.777565@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 21:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234951

On Thu, 2026-04-09 at 21:35 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> We've seen reproducibility failures with:
>=20
> =C2=A0 File "/usr/lib/python3/dist-packages/subunit/chunked.py", line 108=
, in _read_length
> =C2=A0=C2=A0=C2=A0 raise ValueError("chunk header invalid: %r" % count_st=
r)
> ValueError: chunk header invalid: b'\n'
>=20
> which leads to:
>=20
> 2026-04-09 01:18:20,886 - oe-selftest - INFO - ERROR: broken-runner
>=20
> and UNKNOWN status for builds queued in that runner.
>=20
> This appears to be when reproducibility builds fail with:
>=20
> Traceback (most recent call last):
> =C2=A0 File "/srv/pokybuild/yocto-worker/bringup-fast/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/reproducible.py", line 407, in tes=
t_reproducible_builds
> =C2=A0=C2=A0=C2=A0 self.fail('\n'.join(fails))
> =C2=A0=C2=A0=C2=A0 ~~~~~~~~~^^^^^^^^^^^^^^^^^^
> =C2=A0 File "/usr/lib/python3.14/unittest/case.py", line 750, in fail
> =C2=A0=C2=A0=C2=A0 raise self.failureException(msg)
>=20
> which is possibly from bad placement of '\n' in the byte stream. It doesn=
't
> 100% reproduce since the placement is critical but from the subunit code,=
 it
> does use <int>\n as a header in the protocol.
>=20
> I've wondered if the presence of "\n" in the traceback code is part of th=
e issue
> so remove "\n" from the traceback by writing the python code differently =
just in
> case it helps.
>=20
> Ideally we'd report the issue and fix subunit but I was unable to work ou=
t the
> exact sequence to reproduce and any fix would take time to propogate anyw=
ay.

There are other better ideas about what is going on here to cause this
and this patch won't help. The issue is thankfully rare so we can drop
this for now until we come up with something better. We can open a bug
to track the issue.

Cheers,

Richard

