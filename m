Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8267C27C7A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 07:27:37 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.181517.1692257254139982676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 00:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HvxIQ4Yv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.182, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2bb99fbaebdso21377771fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 00:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692257252; x=1692862052;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zW0W8g9uMLqVZqhB9QYWlkbQQcisFIILI3NelQPFZI=;
        b=HvxIQ4YvlG/3jnHxSpMv1dgFdfISHFbIxZKRnaE+hmqC6vxZ4puXpDGcuvClrU7QIl
         MCtBk1ubDWxAzGdbVXKuQBQb5zsxEaJyOjZ9vhGr1Xql4QPfonkkLWFaz4mvHGKg4YQf
         /n92/HYmbEoyfeDcyV8ujty4myJ6WwLibovlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692257252; x=1692862052;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9zW0W8g9uMLqVZqhB9QYWlkbQQcisFIILI3NelQPFZI=;
        b=YR2/R0ebSIiaEIpwwxiB88phIwpNopTTIQR4uq5Rvt+0A2JrjwTuZs4GmyX+iQwbtV
         Evqh6pAI0acHibFrIaIhrs/z8Z6en1kw5rJymKyDaivuSqb+kB/bewfJFQcz17Ehm98x
         GsaQiO2cKw7NAWVLpGAGrqcIVKLsPpu/igy4mycKMhs7vsy5m1TojJ2t8HG5VGX+zHCS
         xjrc34GSp7Gl3FoB+umHx0R53P4AkfeqAuxrPGbNF5r6zyCZm/ms2B0ugUgfrVFHk7vN
         UW+jhpoCamg5Oc/QQ8WIUHODaEaKn4cX9Pwh5IsiYrzXNsZVHY+AEUH7kG1aZ/wR0Foy
         o43Q==
X-Gm-Message-State: AOJu0Yz3YZtCn1r50pezzrFEiPTEN7rmCI++oXCBjsD8OJ4FObVC2VzN
	1MafeA7seJ+lnrZ2ft5U4uhH2w==
X-Google-Smtp-Source: AGHT+IE24+WYayDPdVOwZ5XRBZpYkkwQiQ7HmCAJqwd5vjnarD+hnqWAL9KqzvZO+eHrIcxv7j7+fg==
X-Received: by 2002:a2e:90c6:0:b0:2b9:e304:5f83 with SMTP id o6-20020a2e90c6000000b002b9e3045f83mr3187298ljg.26.1692257252183;
        Thu, 17 Aug 2023 00:27:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ce81:b365:d63f:4c86? ([2001:8b0:aba:5f3c:ce81:b365:d63f:4c86])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c235300b003fe601a7d46sm1872523wmq.45.2023.08.17.00.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 00:27:31 -0700 (PDT)
Message-ID: <fd9fb58a880db328172a7aa08912b230fb409312.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] time: use the monotonic clock to compute time
 elapsed
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jtilahun@astranis.com, openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2023 08:27:31 +0100
In-Reply-To: <20230817061149.503336-1-jtilahun@astranis.com>
References: <20230817061149.503336-1-jtilahun@astranis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186289

On Wed, 2023-08-16 at 23:11 -0700, jtilahun via lists.openembedded.org
wrote:
> From: Joseph Tilahun <jtilahun@astranis.com>
>=20
> The monotonic clock is preferable over the system clock when computing th=
e time elapsed.
>=20
> Signed-off-by: Joseph Tilahun <jtilahun@astranis.com>
> ---
>  meta/classes-global/buildstats.bbclass        |  4 +--
>  meta/classes/buildhistory.bbclass             |  4 +--
>  meta/lib/oeqa/core/context.py                 |  4 +--
>  meta/lib/oeqa/core/runner.py                  |  4 +--
>  meta/lib/oeqa/core/target/ssh.py              | 14 ++++----
>  meta/lib/oeqa/runtime/cases/ltp.py            |  4 +--
>  meta/lib/oeqa/runtime/cases/ltp_compliance.py |  4 +--
>  meta/lib/oeqa/runtime/cases/ltp_stress.py     |  4 +--
>  meta/lib/oeqa/runtime/cases/oe_syslog.py      |  4 +--
>  meta/lib/oeqa/runtime/cases/rpm.py            |  4 +--
>  meta/lib/oeqa/runtime/cases/systemd.py        |  4 +--
>  meta/lib/oeqa/selftest/cases/binutils.py      |  4 +--
>  meta/lib/oeqa/selftest/cases/gcc.py           |  4 +--
>  meta/lib/oeqa/selftest/cases/glibc.py         |  4 +--
>  meta/lib/oeqa/selftest/cases/runcmd.py        | 12 +++----
>  meta/lib/oeqa/selftest/cases/rust.py          |  4 +--
>  meta/lib/oeqa/selftest/cases/tinfoil.py       |  4 +--
>  meta/lib/oeqa/utils/commands.py               |  4 +--
>  meta/lib/oeqa/utils/qemurunner.py             | 34 +++++++++----------
>  meta/lib/oeqa/utils/qemutinyrunner.py         |  8 ++---
>  meta/lib/oeqa/utils/sshcontrol.py             | 10 +++---
>  meta/recipes-rt/rt-tests/files/rt_bmark.py    |  4 +--
>  22 files changed, 73 insertions(+), 73 deletions(-)
>=20
> diff --git a/meta/classes-global/buildstats.bbclass b/meta/classes-global=
/buildstats.bbclass
> index f49a67aa4f..1abd52c72a 100644
> --- a/meta/classes-global/buildstats.bbclass
> +++ b/meta/classes-global/buildstats.bbclass
> @@ -64,7 +64,7 @@ def get_timedata(var, d, end_time):
> =20
>  def set_buildtimedata(var, d):
>      import time
> -    time =3D time.time()
> +    time =3D time.monotonic()
>      cputime =3D get_cputime()
>      proctime =3D get_buildprocess_cputime(os.getpid())
>      d.setVar(var, (time, cputime, proctime))
> @@ -77,7 +77,7 @@ def get_buildtimedata(var, d):
>      oldtime, oldcpu, oldproc =3D timedata
>      procdiff =3D get_buildprocess_cputime(os.getpid()) - oldproc
>      cpudiff =3D get_cputime() - oldcpu
> -    end_time =3D time.time()
> +    end_time =3D time.monotonic()
>      timediff =3D end_time - oldtime
>      if cpudiff > 0:
>          cpuperc =3D float(procdiff) * 100 / cpudiff

Looking at the python man page, it says:

"""
The reference point of the returned value is undefined, so that only
the difference between the results of two calls is valid.
"""

so we have to be really careful none of this data is data which is
compared against bitbake's event timestamps for example.

Is there a real world issue you ran into using time.time()?

In the above case it is true we're just computing a difference but did
you look into all these cases and check that the value isn't used
elsewhere after the return value?

I'm just a bit worried there may be leakage of these values where it is
compared with time.time() or it is used in logs for absolute time data.

Cheers,

Richard

