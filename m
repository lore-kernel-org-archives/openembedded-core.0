Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00674CAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 16:01:13 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.1220.1757606468027768153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 09:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OFytELf5;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-7221ce7e814so7325256d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757606467; x=1758211267; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+jVtjn3JrZ6xDKqkTvV9a6lKgUYLKzIQMfLd5l3hMs=;
        b=OFytELf5z3ye8qAMzSxaPdtfFRR6pOc2t6g9AQpKOBzXhmzyc/BaR+TJxMigAVIAqg
         Qjx7vfY9zJ3vWlAK8RUP4/P/TJl7LEmaz6aPCTkho5cJfv9cOmeIKGzjdvB261fq1yjD
         7Ykg1PEumpPAHS3KR4PvchokuCOMt2OVfMJd7oor3CCAN02zcVwYWyHU9THRrfq1spPT
         e5+Cb25bDfgUJPF0m3Jd5aFUJhdagympZ8hQbj8r9C0xA8h7paxuHrlTXJAuigL0w4PG
         pqy9ZjWdPGbEWDgJO0Ey41OnfZNHNf1A53KjAQJswnTK8ni4vLfn0FufqAoJCb0fLkhR
         YoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757606467; x=1758211267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+jVtjn3JrZ6xDKqkTvV9a6lKgUYLKzIQMfLd5l3hMs=;
        b=MqSYhAckxkoT06lWp1h0W9mjCeuILo4NMXNhORgmktk6mtugjGcsjwqUKgU9JPkr4Q
         8CJ1fue5Zkfel4HxVxvLsz6dRO0gYdfIrPdj8/nTLmlOH7y6MzXleLXsbX8Y4TVsExiC
         iChKica68ngT954D+isrjxvX4AUjJlHQZx89LCJIFYdPbyj8ZMwMedyrMMUihDWXH96h
         JlzQBcy8PRlIgKu8vihDDqThOAEFMddoIknUOz0DYEnOVdGqinuTqiz9NzyUptLd97nH
         atoxMZRu67cbYJ817wyPQxVpkMUkUQLDqwnz6aS2yMHHVntbpXuKNm6fEMV8bYV5zLxV
         rs/Q==
X-Gm-Message-State: AOJu0Yx9faXxuaRj3sMfcMl5SQXYmBDQ1p3anmFTI9SYJDGWEldDfgUb
	rK6Gy6qogXiBu7CSi2rpA5YULjsAdEkHf8mA+iTl2jLR0BewI0RTWf7JlX+HVms8MnLbePs27/E
	A+HVfs/P5AB6j883oH4eBm4CfchYT05Q=
X-Gm-Gg: ASbGnct4jUa/0YuDC7eX8M+JIo32QW4yHtGCckxci5iZtBYc3E9qRTsaEtqjbRj6uEh
	4ij5MCjotXP1p6zQzr6oF8SNFVvABE5rZ3gkShlB9qZK/XhkjUylFq+4qiho6IKzmsHDH289cGL
	3+KLUWe/Z10RpsKV6Oc4izRTMfRW9NtL6+GI7tjPQArJ1LmYNdnuT1xx5xVIMRKO5XFyHupvFK7
	SXp0EXrS899UaW/baRn47X0ZQVvkOHTgmIVpmkQDvQlv8eFB7aapYvfWzLPejKZWNAzHiwYNCQX
	G25KQnsOzIF884Z0+LoPLxxqJPQFT+Q+kKW4uHYpP4v8lyAwq+SnZ7COUJF1Uw==
X-Google-Smtp-Source: AGHT+IEsKLgCk9IupBBYPm276peAmxLmR50S/4fD5qOp38UnB0m8qIPZy7/nWWaDp0F+VYoR97vRtWPP2nqsMWNBBj8=
X-Received: by 2002:ad4:5763:0:b0:70d:e501:1f9b with SMTP id
 6a1803df08f44-73933638212mr233543636d6.23.1757606454831; Thu, 11 Sep 2025
 09:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <186275A42D34EEAB.19063@lists.openembedded.org> <5I7F2T.KIGKW1QUPNT51@t-online.de>
In-Reply-To: <5I7F2T.KIGKW1QUPNT51@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Sep 2025 18:00:43 +0200
X-Gm-Features: AS18NWDP2xw-BA7FTGX2iNkz0BBAJwcGRBbZZqqWdrHi78J_QCisi4ed5ih0KII
Message-ID: <CANNYZj89e_Q80kSO-E7_iByBw72=0TuJNgoyPV1DzM=Q73irJg@mail.gmail.com>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.84.4 -> 2.86.0
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org, 
	"Khem Raj via lists.openembedded.org" <raj.khem=gmail.com@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 16:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223286

On Thu, 11 Sept 2025 at 12:52, Markus Volk via lists.openembedded.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> After briefly testing the upcoming gnome environment, I believe that this=
 update should be postponed until the next release. Support for girepositor=
y-1 has been completely removed from the gnome environment, which does not =
bode well for backward compatibility. gnome-shell 48 is broken with glib-2.=
86 at runtime, and updating to gnome-shell 49 requires an update to mutter,=
 which in turn adds glycin2 as a hard dependency. Despite several tests, I =
have not yet been able to compile it. I am having problems with a 'rust err=
or: Linker =E2=80=9Ccc=E2=80=9D not found' and a problem that, despite crat=
es.inc, the network must still be active during do_compile. In addition, gn=
ome-shell 49 requires a gjs update that requires mozjs140. I performed this=
 update and it works... but it is also not compatible with gnome-shell 48. =
Finally, gnome-control-center also introduces a new cross-compile issue tha=
t I have not yet investigated.
>
> Long story short... there is still a lot to do and free time is unfortuna=
tely scarce at the moment.

Sadly this glib update has already landed in master. It would be
really really unfortunate to have to revert it, so can we identify
what is specifically broken with current gnome shell 48 and see if it
can be fixed?

I want to also remind you that you do not owe anyone a working
gnome-shell. It's open source; if someone needs it working, they
should be helping you, and not just take your efforts for granted.

Alex

