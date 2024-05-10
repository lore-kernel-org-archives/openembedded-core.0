Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E1EC25B10
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 09:48:42 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.8975.1715334512254057393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 02:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UnBLWiwJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51fea3031c3so2472853e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715334510; x=1715939310; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG1gx6HAuyJkTGI4WXqhhkXUr1z3VlMLOVkIAUj1gaU=;
        b=UnBLWiwJSkd/NoiFMkUjRlockq9cojXykJpeOXtlYM6Z01Ni0mYJ4NNBeF8dg46YyM
         Hcbw7qSlwrdivltieNnx5zn7WwiWUj4rncqoHbXk8uaCYsQOYhI8LLIA10fhJ6G6scsv
         WJCByshBXDtKhsyIeRmFIyZgoO3Jp6hZxX9rNOPjCrMAgWmXvxGh+IBsQvxhGZAwhfe8
         f7v2WyY0ZebkbzYhU6rhJ6bACRg6LB/T6ru+DPSTiNa9mH47WSU5EAxs74R0FPd00c2L
         9Xze4e0s7ZGqqhJPjpMyLnSGMmgRRDydFJs0N01o6IA5sSEg8qEFUhveEqjEjVLJ+3Si
         AIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715334510; x=1715939310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG1gx6HAuyJkTGI4WXqhhkXUr1z3VlMLOVkIAUj1gaU=;
        b=MT3+m31lN3izm1VllJ4EvOJ3P21CeFWIpCnu0kprTgRiE+jNW+H1cnpzaq4Qwl7JdZ
         cL8nIdtoB2u6SWGCi36yVGqXlsJuCkmaur2MAzLQkacmQhfdQd8Tad0CykNtqMwMKbdE
         hxlz0kVosQBYa470OlUcZw06FrAPXll60f2nLzlJL/HfgzPrLzgD53dXKDLdvg67CGI5
         Hz0RpzUGw9rIgQWr+lKUHT92UI2rXxprX0AcfGjwNtd36rDOMaVNzl2ptbqoVSzctmeL
         s8Plgg8BQ5d2/a5UWd8r8XuSjFmKsLkd2qk2jDaQlzqeYx3NXpgQyvXq6KkQltL0plgS
         0KQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVZTd1iDK7hprv7UvbFwGN5R6beMiWLNjvB9olU0vdQbvUQt9VeF6fR2pTz8jCihTe5FsKHnZMGMJ/yWObWoYzpSffDEGAvhdg65MAqv9Z2HXLkFW/4wUj
X-Gm-Message-State: AOJu0YxXjOD61iK8jYS93ZUYIKf5RlRwMTZWM6FameRN5sYp74WxMNRJ
	5OEIbMLt0X4ItAbUvtevg/6202C4eE6y4CjQ01FXjtpw01NW2BOmkM6aIVCQeCx3nFlmLBFm4Ob
	GhTg+74xHv625Q+uqfi/HuRdQF3Y=
X-Google-Smtp-Source: AGHT+IHk3l5/LHT9ZKg1Oqda39aHUhFhftDLhvChGRP2nle+ULslMnHVxw/qn6EOI7YN0plfdR14rB1aIkBaBcOdU04=
X-Received: by 2002:a19:a415:0:b0:51b:528e:ce7d with SMTP id
 2adb3069b0e04-5220fe79854mr1564478e87.34.1715334510026; Fri, 10 May 2024
 02:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240502103252.1102710-1-alex.kanavin@gmail.com>
 <8272EB4D-B779-468B-9A14-1F7415301046@arm.com> <17CD4EAB9E2E17EE.17376@lists.openembedded.org>
In-Reply-To: <17CD4EAB9E2E17EE.17376@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 May 2024 11:48:18 +0200
Message-ID: <CANNYZj_FvLisx23AQcP94thd=O2hOh6RVGrTcr478ULzbMi=Zg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4 ->
 2.80.0, 1.78.1 -> 1.80.0
To: alex.kanavin@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>, Anuj Mittal <anuj.mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 09:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199193

On Tue, 7 May 2024 at 22:25, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
> > > # setuptools can be removed when upstream removes all uses of distuti=
ls
> > > -RDEPENDS:${PN} =3D "python3-pickle python3-xml python3-setuptools"
> > > +RDEPENDS:${PN} =3D "python3-pickle python3-xml python3-setuptools gl=
ib-2.0=E2=80=9D
> >
> > Is setuptools still needed?  If so, might be worth calling out what the=
 exact user is because a simple grep doesn=E2=80=99t find any users.
>
> Indeed, neither distutils nor setuptools are anywhere in 2.80.0 tree.

This is in g-i recipe, not in glib. And that still has plenty of
references to distutils as of 1.80.1.

Alex

