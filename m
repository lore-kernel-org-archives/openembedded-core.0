Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C9BC27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 16:10:32 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.23726.1718035822319785319
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 09:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BmWCyPlc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4218180a122so1175845e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718035820; x=1718640620; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5lExQdL17pAzey40gR53xIWvWjcO+Zup8XZgUUUGRE=;
        b=BmWCyPlcJHy77wA1sdYKXnJxlsmsSyS0bJCQImuYq5KxbR27rtC1ckbvN66wUNvqok
         MmGIlP+ceZLa/ddfDGtDPEdHSxg/FrIcdMs+byNpA3n0BwQ9aUq0MY2DhhkmFlOoEQK0
         2q8ZqOCwJVpmOGSg7PgHJNg7oCh+UVU1x6TzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718035820; x=1718640620;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R5lExQdL17pAzey40gR53xIWvWjcO+Zup8XZgUUUGRE=;
        b=a3AcR8FrUBM3B6n8cltiEf+19/M2wtR46X4WPScJcBkdyuWhAstS7RYM/w8mw7y4vU
         GYY2fJt0ZZ3CoPUrbq/HRVKlLfrxGscQfAeYJtiTwuDyfBqLsodaoFwnchZNcFig0Cvi
         P9VKp7NQkNpBLg+e+BqccOTrMgY37rhs2miWv0iddaTtheLtdaEqiue6jlTpf516cfeH
         Id0rcB1Ct/UYqQmaU4s2HtOnFPQzZiX50M/pZnbLmjd716D97YDOfjNwlDbutRznclVQ
         XlUv5JKho4oW2hzqsXMgGkjIi/EyUcL/kISN5Z7eHo7dYdwsE2xDtfCjzD0zWw8icW2y
         /+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCV88f3oyAvCtdJFXP45LTKIGCzx10pVjtWXDk+Omm8wOHXHfrMNhI4o9/pW+K+96rRQfXtzZJPhZzUA6Bxn1nZI4bhMjYmGgm/ttQkXahrQCkhV+DKsQUp8
X-Gm-Message-State: AOJu0Yz/KmgmIyxbH/0IU+VmXlcHwrNqgzd7A3vR/v3zMgragfnCxABC
	UU7702GU0q4GlsVhU1+KwENzQMXBpcUiIqZ5gBwJYOkA+t/p/Y5paH+XOFHyzLfGbmVeN1Vvse5
	m
X-Google-Smtp-Source: AGHT+IH9z9m+avZk4y3HIBDyGWELY7YR1waNdDzjoGkESL+UC3sHPss5XeBI2HMQQAaja2QlpAjdkQ==
X-Received: by 2002:a05:600c:3505:b0:420:66e:4c31 with SMTP id 5b1f17b1804b1-42164a3712cmr97100475e9.34.1718035820510;
        Mon, 10 Jun 2024 09:10:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fc3b:77d4:176b:a54? ([2001:8b0:aba:5f3c:fc3b:77d4:176b:a54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1c423932sm5600948f8f.114.2024.06.10.09.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:10:20 -0700 (PDT)
Message-ID: <18fc768cd709e004c50d8585c8347c0c6755ddf6.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] oeqa/runtime: fix race-condition in
 minidebuginfo test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2024 17:10:19 +0100
In-Reply-To: <20240610160300.4003823-1-ecordonnier@snap.com>
References: <20240610160300.4003823-1-ecordonnier@snap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 16:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200479

On Mon, 2024-06-10 at 18:03 +0200, Etienne Cordonnier via lists.openembedde=
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
> =C2=A0meta/lib/oeqa/runtime/cases/systemd.py | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runti=
me/cases/systemd.py
> index 80fdae240a..7b3cb53e29 100644
> --- a/meta/lib/oeqa/runtime/cases/systemd.py
> +++ b/meta/lib/oeqa/runtime/cases/systemd.py
> @@ -155,6 +155,15 @@ class SystemdServiceTests(SystemdTest):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target.run('kill -S=
EGV %s' % output)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertEqual(status,=
 0, msg =3D 'Not able to find process that runs sleep, output : %s' % outpu=
t)
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Give some time to systemd-c=
oredump@.service to process the coredump
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for x in range(20):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 statu=
s, output =3D self.target.run('coredumpctl --quiet --no-pager --no-legend |=
 wc -l')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ou=
tput =3D=3D "1":
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 break
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 x +=3D 1
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 time.sleep(1)
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (status, output) =3D sel=
f.target.run('coredumpctl info')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertEqual(status,=
 0, msg=3D'MiniDebugInfo Test failed: %s' % output)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertEqual('sleep_=
for_duration (busybox.nosuid' in output or 'xnanosleep (sleep.coreutils' in=
 output,

That looks better, thanks. I suspect you can simplify it a bit further to:

        for x in range(20):
            status, output =3D self.target.run('coredumpctl --quiet --no-pa=
ger --no-legend | wc -l')
            if output =3D=3D "1":
                break
            time.sleep(1)

Cheers,

Richard



