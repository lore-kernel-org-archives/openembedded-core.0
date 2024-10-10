Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D70CCF0437
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 09:41:48 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.39504.1728553299489995596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 02:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RtA9eylJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-430576ff251so6145055e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 02:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728553298; x=1729158098; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+RcYsgnWNvaW/tHNUw1JFHdEvqRXtQFUqBaoDIuCxV4=;
        b=RtA9eylJ9ODmmWuTqEXH2QmYu1ESXS3ZldQ6zoHJqMRtd1Utb9+eFM3B03SCDGqQa2
         Yf1D3CChOQtJBjPIN4ShYLQkYnGJKH5O2g48iT0iT1MdhHcq3VlnMI+XzLT9EoyBnbs1
         6ruBKnaAuF6SXjqJFpDcgjntSe3N9IIkBbyuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553298; x=1729158098;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+RcYsgnWNvaW/tHNUw1JFHdEvqRXtQFUqBaoDIuCxV4=;
        b=XE5utb7d1ycYgmPZXbZaSDsjMhHftbno3c2WX7dQjqWHZJ5oCZLe4OybL5NONjaNqG
         tMMQVBJnPbuHdF1WyJDqfmyBeCyWzoUKrcnwsyLp3t3hRFAnjZWtZIExh5gwNbUr9RKU
         jtjSWHNUHXSivmuKwmEH2RMiQ7+0Rr02Ub0y8gZycd7/Nz/t5xHNtz8rHoxHXkRtO/EW
         7ZKOumK/ZuX6sv21macTVPeNfrD2mSLmiKoWmZvyPHB+rtRSsjzfgmVgxe4TuRFpM0Qj
         G4MRWMmZQjrAFLWFNsGoqR2I0lg7n2eS/2DTYWy6Mo8hpBTIYA3ENO57NuqGJcIZ2wAm
         Y/LQ==
X-Gm-Message-State: AOJu0YwzzAQbRgsHAl/XLjI3y52fWdYyJhLR2OM10wn2UkGivduKfobK
	zt+W1mmzBIfwpIZTrKmaIIIOydWaUgkLypwsu5UIo9OIb9+hXuRMafOAAwy+LUek2Ih72aTrigA
	c
X-Google-Smtp-Source: AGHT+IFU18XLMclLTX28gV/TiVudSEfGTvTG0x785ObEHuIMxs5vVUGFdW7zo5gJepGVQAR/pLgTYA==
X-Received: by 2002:a05:600c:3492:b0:42c:b9a5:ebbc with SMTP id 5b1f17b1804b1-431157b4673mr30074215e9.16.1728553297572;
        Thu, 10 Oct 2024 02:41:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a7cf:f342:7de0:8e9a? ([2001:8b0:aba:5f3c:a7cf:f342:7de0:8e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835d784sm10732765e9.46.2024.10.10.02.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:41:37 -0700 (PDT)
Message-ID: <996bc8d75fc7110eb6e8002a8d18b25e9647ddc6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/ssh: Rework ssh timeout
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jon Mason <jdmason@kudzu.us>, Ross Burton <ross.burton@arm.com>
Date: Thu, 10 Oct 2024 10:41:36 +0100
In-Reply-To: <17FD0DAF7559F1BD.19251@lists.openembedded.org>
References: <17FD0DAF7559F1BD.19251@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205403

On Thu, 2024-10-10 at 10:34 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> After the changes to improve this test, we keep seeing image testing ssh
> failures, particularly on mips.
>=20
> It looks like part of the problem is that on a loaded system, 5s is too s=
hort
> for mips to reliably establish an ssh connection. I've seen logs where it=
 keeps
> timing out and fails to work, then the debug code successfully uses ssh l=
ater after
> everything else fails.
>=20
> Change the timings/retries to give slow platforms enough time to respond.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0meta/lib/oeqa/runtime/cases/ssh.py | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/c=
ases/ssh.py
> index b86428002f6..f5b76edff40 100644
> --- a/meta/lib/oeqa/runtime/cases/ssh.py
> +++ b/meta/lib/oeqa/runtime/cases/ssh.py
> @@ -16,7 +16,7 @@ class SSHTest(OERuntimeTestCase):
> =C2=A0=C2=A0=C2=A0=C2=A0 @OETestDepends(['ping.PingTest.test_ping'])
> =C2=A0=C2=A0=C2=A0=C2=A0 @OEHasPackage(['dropbear', 'openssh-sshd'])
> =C2=A0=C2=A0=C2=A0=C2=A0 def test_ssh(self):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for i in range(20):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for i in range(5):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status, outp=
ut =3D self.target.run("uname -a", timeout=3D5)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if status =
=3D=3D 0:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 break
> @@ -29,7 +29,7 @@ class SSHTest(OERuntimeTestCase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 # give it time for the port to open.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 # We sometimes see -15 (SIGTERM) on slow emulation machines to=
o, likely
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 # from boot/init not being 100% complete, retry for these too.
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 time.sleep(5)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 time.sleep(30)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 continue
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 self.fail("uname failed with \"%s\" (exit code %s)" % (output,=
 status))

The ssh test changes and resulting failures is making me quite grumpy.
We took code which was working reliably, changed to make it much nicer
and in the process made the autobuilder builds unstable.

I've mentioned it several times and whilst people have looked at and
said "don't know" or "it shouldn't do that", nobody is actually picking
up the issue and resolving it.

I could have reverted it but I agree the new code is nicer. I'd have
been asked to "prove" it was the commit, or to revert the revert at
some point and then we'd be back to the same instability again.

I have looked at a log of one of the failing builds:

https://valkyrie.yocto.io/pub/shared-failure-data/log.do_testimage.2960382
from
https://valkyrie.yoctoproject.org/#/builders/32/builds/198

and concluded it is simply just slower than the 5s being allowed.
Hopefully this patch fixes the issue. If it does not, I would
appreciate some help in resolving these failures.

Cheers,

Richard


