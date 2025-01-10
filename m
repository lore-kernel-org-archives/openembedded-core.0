Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC51E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:12:11 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.753.1736539926363893363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jiudEav5;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-303489e8775so20587491fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 12:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736539924; x=1737144724; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db3wLG5aDtsz7bCAoD3R6yGRBIsojtURMgyR/+JvxhQ=;
        b=jiudEav5mH/xLgVG7lOn7n5jqhyewDGeKumAo44zZUSB+GdnMLdoNPk6UzV6OCcNEO
         LiHSOtfyLLGD0pUHWfKxXKJAPfSyddtZ5wlOkZPiV156n+2I95jNny8Pqulxvk9PX75F
         2aMOsrzA32rdioy8wzvViOsmLspmgTTG1lqwqpuuZx4xC3nwUPOzLHiidChAb1MGnngJ
         ekjmOskIEBGgfURYRlpe4FS+FDoSERKEkymUuXuZrqm3A3megMYJ09aLwwpJXNaK0Aml
         jDnehUBxOF1MM4kQ3PnoPe7PVX7FidgMyRtdj7BjBq/QlNdxnKp+EUEWS2dCdtvkfSFV
         Ly7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539924; x=1737144724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db3wLG5aDtsz7bCAoD3R6yGRBIsojtURMgyR/+JvxhQ=;
        b=vXiIevuwCIbx2Rr7oBBCXodQ3nJmUuWrkt/JPdABSapWizIaGpajQjtjVNu5q14YSX
         TH6m41Dfc72dHp7APYYwZ7LtP5dBKFR4PtbY/2XIUEL5cuyoAcI83m2SqmjfF+HYLF/I
         eeiIQLJBuCY3efkDQMRvJKGH79zzoCbF9Vh9ycPfoS1h8AiX6yB2OBnimNkuZnk3TlDa
         KgFab8IKcRnJNBMGo0Gqb2SGmgL5lEkeUZj2EKTLsoMrjM2iLfLtMSdmxR2FIMR/lv2q
         651GbvwNlgUFV8h/psIGyxa7TIOhLA50Gj+ZGFQBvxkNvSkNl71b79hwrOlUH9g3j0Py
         XlXw==
X-Forwarded-Encrypted: i=1; AJvYcCVP9D60yzcwu4wPjGRh4SioJpxr3g7d+rXksHAXmn84LbbLPMtHt1TmP5fywqhAO9ZOHHnwLXIJaw1k/y8c1e8vgA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz+F2cw2oqpGefeuFW6AljR5Y7+FrD0W6KXzA73Lkw349PhFC2Y
	WPm2RA0/+tvA5yHU6Lop1/UVBLwbpmDHvsC9XWsEDpEETbH1kQClLdQP5XUfZM2tYv+C1WXu7Rq
	G/+10pRC+mp6UO+q0P6Kz/Hkv36Y=
X-Gm-Gg: ASbGnctUnA2Bq1fXT7ZzGmM1BGdz+1rYl9vU9W+uGqKoivXKiXVW/2PFVzIqGMT3S8H
	k0sVo01NVZJ0TF6ncJv9igRNSXKZN+UdZTLaQuIq0
X-Google-Smtp-Source: AGHT+IGrrSb8la2Y0gQx8JCr8hLKlr5TnSmCidtOZegdzkZNEUZ6bje+MUQDG1A+JAcWtrS2bAAgktfyv0G8SqlbMv4=
X-Received: by 2002:a05:651c:1418:b0:2ff:c86b:5b4f with SMTP id
 38308e7fff4ca-305f45afe1bmr29549021fa.21.1736539924202; Fri, 10 Jan 2025
 12:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20250110130116.894607-1-ross.burton@arm.com> <29D20DF1-96A7-4A24-B3EA-8252C23D15AC@arm.com>
 <CA+chaQckoaDTGVik=PW4FtnK1_qjdVLJhd+2AR6_az3vphAtEw@mail.gmail.com> <8D7499C6-D8B3-406D-B241-1026BEAB7188@arm.com>
In-Reply-To: <8D7499C6-D8B3-406D-B241-1026BEAB7188@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Jan 2025 21:11:51 +0100
X-Gm-Features: AbW1kva6HAabV4CDEUh4EfwIQlvKdZ0ZSsN7jc9iOcJiHDz7poD_KB192Lo6Elc
Message-ID: <CA+chaQfS1GhYrPat76jmZa23VcE0vpy9zxAgHXQNvX3Q4BHOUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/qemu: use tune to select
 QEMU_EXTRAOPTIONS, not package architecture
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 20:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209666

Yes, probably by accident, now top 8 commits are gone from oe-core.

From git://git.openembedded.org/openembedded-core
 + 4e29551b15...599e0fbf7d master      -> git.oe.org/master  (forced update=
)

On Fri, Jan 10, 2025 at 7:10=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 10 Jan 2025, at 17:52, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > Too late to easily ignore as it seems already in master, e.g.:
> > https://git.openembedded.org/openembedded-core/commit/?id=3D5e14a1b26cc=
77b35c3e36869021afae9455bb1a8
> > or do you mean some other changes?
>
> Eek.
>
> They=E2=80=99re not in poky/master so I wonder if RP has failed to sync p=
oky, or the push to oe was accidental.
>
> I did just send a v2 which appears to behave in my testing so if that pas=
ses the AB then we can fix fairly quickly.
>
> Ross

