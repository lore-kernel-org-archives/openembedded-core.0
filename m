Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEC7C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 12:53:41 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.18676.1718024002097410511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 05:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fZ0P80KP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bc27cfb14so3397743e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 05:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718024000; x=1718628800; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOQPVnWMw+lddCKj1M9SUILmGx9KJsgXdsLMVnfLbbA=;
        b=fZ0P80KPL0HeH6cBGS7ZqDBrWRMAu37x4JBTxOPVxDn2kNMox4XgbWyBPMnmtELm9q
         viZmQgPw6FDfAwGsArgifswOT6pLdxgpt2AL5lBDceGP2E+cTHSFeII+vAjH4yDaQAb9
         Vt14mKeQNDCocXPm+/By465sH7Z98TkR4KSAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718024000; x=1718628800;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOQPVnWMw+lddCKj1M9SUILmGx9KJsgXdsLMVnfLbbA=;
        b=bBKdFAwGZqK6FDqCsLUdOl23naPFSJAiJJgxJzPhSuN+Ltwipbp3Li6jbqWZaMi3Tc
         5B6+Tb0tCZYedYfum7WEx6CKmH9tmftWsPJ36HRoGCNd+kczmp3+dUoDCOW+BTTm+0Y3
         HmitMHG1VOjqZMV4JrGti1mygdTgA0qAa0oiFCXvMFT4uaz2Qckxnm9cEiLP9AcXjZso
         5oYLN1n4xR8KA4THMxk6dbNiSTBuey4aWUgb70X7SEkwz1+u8mZ7F96tqTPqwuCbpNb8
         2kWoUwG1T1is23v7Zq1zI3pJn5l0TQg+29jmRjwswmmGMI+sEKyeDyA+jyaJDmHNJX9o
         /y5g==
X-Forwarded-Encrypted: i=1; AJvYcCWSscVYHx05Xu8Cpban40AJ+vhvSxes+tmAVLA2AjTLZXqLgwCjkJP+oT9IvHoDEdAY/Q2PJ0vrRGfD/vKv+p654tPxkrdyR6IzB77MfPgnORnd19y93z3G
X-Gm-Message-State: AOJu0YxClc+IVQzpYI4fYbQZMfF4I153hb6p910yjHk9/7O2jkw52vBa
	guVtFKEU4vlN/kcriX3RstnYYiSiQJ5+DIFtj8J6d9C1VsoRhivZC0NUO3e7KzQ=
X-Google-Smtp-Source: AGHT+IH6F+0FLHznYcSAriDK2T/UIwrpI206JPzADDYUq4rT3Znyz7KsQHI6R/pe3jCWTsvYYnKNDA==
X-Received: by 2002:a05:6512:370f:b0:52c:81fc:eba4 with SMTP id 2adb3069b0e04-52c81fcede0mr3224087e87.52.1718024000119;
        Mon, 10 Jun 2024 05:53:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fc3b:77d4:176b:a54? ([2001:8b0:aba:5f3c:fc3b:77d4:176b:a54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c8fd2c377sm180102e87.177.2024.06.10.05.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 05:53:19 -0700 (PDT)
Message-ID: <53a06013f89900cf0942eb6dca0962e5ee924b5c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: fix race-condition in
 minidebuginfo test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2024 13:53:18 +0100
In-Reply-To: <20240610123935.2102248-1-ecordonnier@snap.com>
References: <20240610123935.2102248-1-ecordonnier@snap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 12:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200474

On Mon, 2024-06-10 at 14:39 +0200, Etienne Cordonnier via lists.openembedde=
d.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>=20
> Fix this error where 'coredumpctl info' warns that the coredump is still =
being
> processed:
>=20
> ```
> AssertionError: 1 !=3D 0 : MiniDebugInfo Test failed: No match found.
> -- Notice: 1 systemd-coredump@.service unit is running, output may be inc=
omplete.
> ```
>=20
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
> =C2=A0meta/lib/oeqa/runtime/cases/systemd.py | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runti=
me/cases/systemd.py
> index 80fdae240a..17fa660ace 100644
> --- a/meta/lib/oeqa/runtime/cases/systemd.py
> +++ b/meta/lib/oeqa/runtime/cases/systemd.py
> @@ -155,6 +155,9 @@ class SystemdServiceTests(SystemdTest):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target.run('kill -S=
EGV %s' % output)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertEqual(status,=
 0, msg =3D 'Not able to find process that runs sleep, output : %s' % outpu=
t)
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Give some time to systemd-c=
oredump@.service to process the coredump
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 time.sleep(1)
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (status, output) =3D sel=
f.target.run('coredumpctl info')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertEqual(status,=
 0, msg=3D'MiniDebugInfo Test failed: %s' % output)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertEqual('sleep_=
for_duration (busybox.nosuid' in output or 'xnanosleep (sleep.coreutils' in=
 output,
>=20

Specific sleep values like this are a red flag, it all depends on how
much load systems are under and we've had a lot of problems with these
kinds of things.

Instead, you should probably detect "systemd-coredump@.service unit is
running" in the command output and retry if that is the case with an
overall timeout/error in case it never completes.

Cheers,

Richard

