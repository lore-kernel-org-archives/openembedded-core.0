Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56F5C54E67
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 18:10:50 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.17583.1711476643056576848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 11:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DXzWO4u5;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d48f03a8bbso675371fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 11:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711476641; x=1712081441; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7Ctu5XnmU/g1KSo6cFoHTbgqPyz2XYMfp3iQh4kwfg=;
        b=DXzWO4u5M3+3b0j3rrkQsKPQQOjW37RE64yfh1KbER4Ca1u7ZGesgpHQ4IfpltBnot
         TRmt0iRyzTFPmnyTDBwKXjAyGcz8WZBFRFEK1hDdfNKZyby82Bra1lsPyt6A3agTkHZr
         mBSb25jbtujc3XR/jzI2o4MybvODj9bCD1m4wkksIORVAHC5fej3ghZ54OwBe++G9/ZT
         pQYKAVcporBVvpwRT1Q6zjk07HXkwlH51ygaYyNSr4nPP4p2LwYphtmUjn5wjzpvxsLj
         dv8MLoFJ9t6o31NBeo0yr/8v3VSYViv1G+vpKVV0zWyCbZMzuFLQDi3kVpNEiPdjV3i8
         6Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711476641; x=1712081441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7Ctu5XnmU/g1KSo6cFoHTbgqPyz2XYMfp3iQh4kwfg=;
        b=ndeMh7mKpCX3dqOWGcbbefRRxJhqFugS0qKjSHeTY5GvuzUluYTRoOEu6lclI5I2+y
         WrQEfc4blit4fVo+X5C3xzWoMz7BIbXDTT426TlmbVxHPdVxO6lmBJ8CjGDW4vGjgj01
         aHPuaF9jTFAaZFlTCdyzWuzhVc2X2IscOPvKO248KdoZoczzP9XGjaCkkXLWvRmnbnUT
         Xc7o6jtvwNRT0S20b9qoJJVMdKZsj2XOTpbUdMifgARnY+7tXAEBNjHzGw5SRcj07iYZ
         biAiJe0Uc2B+A/s0UXyyUPBNevJDUzB8i0Gjfwkx8fycWZvXF1S3pwxfRU5UZZfBxeHS
         59Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWL4XY42HBJNKwrVUs58wgiovi2y49QCYPv3UcjKxGU0BmCvR+WjnPFfENxBL+iUtsz3ivWzhlW290qOYIb4W8RcD/hgoVqArJ5l3MOI0eenRgFb91GkxNv
X-Gm-Message-State: AOJu0YzUUBMVctyuQxPaK8NoLW6jJxnUbJ8qnUqU6dTvaMOQ3EEmG4VY
	Yep18v8h2IQiA2EhkHypCaolHQ7iB/8MDCZxw6lje9uNChlQrtqE9k9skkZk0SrkKccaEas8eSe
	qGhqwY8wnHHHSuL0GpymjrtuT+vo=
X-Google-Smtp-Source: AGHT+IECPSKdklKhgnB1ZLlyUPC/CHbkTKlQ4ug8tI0aGLb43jCjbL65OVPwRjygamBVMxoScE5QY4ZsonLDSC9Vhq8=
X-Received: by 2002:a2e:97d9:0:b0:2d6:ab71:3a8d with SMTP id
 m25-20020a2e97d9000000b002d6ab713a8dmr753642ljj.15.1711476640977; Tue, 26 Mar
 2024 11:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240320104300.757486-1-f_l_k@t-online.de> <70D06732-17CB-4BF3-A35C-96C684E011E2@arm.com>
 <V29NAS.S84U42Y5BCDK@t-online.de> <6796AEC0-9AA0-4672-AF2C-ACEECEFFEBE6@arm.com>
In-Reply-To: <6796AEC0-9AA0-4672-AF2C-ACEECEFFEBE6@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Mar 2024 19:10:29 +0100
Message-ID: <CANNYZj8NFhefrNzadohoDsQ2AmRm9K-rKc+Ouz7S40jfpWp6kA@mail.gmail.com>
Subject: Re: [oe-core][RFC][PATCHv2] glib-2.0: update 2.78.4 -> 2.80.0
To: Ross Burton <ross.burton@arm.com>
Cc: "f_l_k@t-online.de" <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 18:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197539

On Wed, 20 Mar 2024 at 12:43, Ross Burton <ross.burton@arm.com> wrote:
> > and adding that depend (or using inherit gobject-introspection) caused =
circular dependency
>
> Indeed.  My branch has a glib-initial to break that cycle, but it wasn=E2=
=80=99t quite working right (and upstream were still changing things).

I just took a look at this and ugh. Upstream should just merge g-i and
glib into one source tree, and then figure out the correct build
sequence.

I think we can avoid glib-initial by building and installing glib as
usual (with introspection turned off), then building g-i, then
building/installing only the introspection data from glib. This needs
confirmation that the introspection flag only affects those parts, and
not libraries themselves, and perhaps a new build flag
'introspection-only' or similar to avoid unneeded library builds.

Alex

