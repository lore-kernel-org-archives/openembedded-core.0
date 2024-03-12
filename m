Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83787C54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 13:26:48 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.9140.1710250004663976478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 06:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c45nPQS0;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d4141c4438so86219501fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710250003; x=1710854803; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uImWriHFBJMWRWXT7VMB7mu4Lf8nndK1aiVTHqZwk/w=;
        b=c45nPQS0QXUocy6fW6LjU7hBPeMtGAltzjXrmBeSbYtP9Xh5qxl8Id/mCcho9xioNx
         rmkjuQfmdTmjEsocxLi399Qh2ZmU9x/Ib0muA9DiQgmXjSTjdGqSbfw+QmVUNHLbAUGr
         OjjC7ym6xGbRB2B6RLtPGGM8lQvw2DQ4GtDkTchcpsBeHFYMEctkOKoJqVaN4qmb0pgU
         5XJDDuwsIlEkAeG4bQfTkCkhQkH7R65A07HXizeWTBNmL9HK+w3bMOWXpzHZsDdvSON+
         Oy9Rcpqe8zeJmOVVkIQtXpziIey6xjNbJM14n+w+/9PXT5jlUMQVPArNP77GD/3rXWE0
         V0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710250003; x=1710854803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uImWriHFBJMWRWXT7VMB7mu4Lf8nndK1aiVTHqZwk/w=;
        b=WQzI7WvEKaW9uiByfeu12aE61g/HeXvA8olPuQAecNp6eHADLxau2HlejCBgJneP/H
         /4HbjRDdjbklZKaJ2IfPLLDwuKiPumEvAA5q2MXJ7YmUW5OsfPvIBOGFGtpifCfYEJGk
         VLL09Uczh5KFUNbhm+wLeaRXkmFf7VTFpHTFAMaqcr3OZPjLLzKU83gUpXYQ5qhmp7hy
         p4lcLB8ToQQKuhzo9DjfPxbBBXyxuyB0dcSbp+mFVc2TATN05PfAviozTkQ3iTVfXlIv
         J9eCNFIHDD8HOzdxpPi9aQOJlAsiTNVKTAidhKNPkcohLifHQMCZOoINf4xvLLx/mueX
         5cKw==
X-Forwarded-Encrypted: i=1; AJvYcCXUo/OJpLi826nmMON/XGvVx0giHlxKNa3vdYP67A5o+UbxSeFE0NXSV+UZg9hhau5qzYWxILWZEESMCxXQBMmpnARhdeFl+TfDPl/GppTixPKoBAeiYxtV
X-Gm-Message-State: AOJu0YwBFSdR/uEDPa+WZtx/dES2CGPsfLfrL0KWmex3rVsXAp82jHpf
	2CZjUDBDqZyMjYGBVjOzLNKp38a5Mksp1grf+WDs7ljRN/VNEFsk1hBBld2UzsVe4nA8Znay7JW
	mAiKccWltTt4btIeHj+QsS2bBSbs=
X-Google-Smtp-Source: AGHT+IFpOK2ADKNEFs6xzPm36PKObKGG8DCtK1wLkFUa6OJnWOyeNu3GAYR270l/GIocguBMMeEnq39HqU5Gxn/mxPY=
X-Received: by 2002:a2e:a383:0:b0:2d4:24c5:a35e with SMTP id
 r3-20020a2ea383000000b002d424c5a35emr6006939lje.29.1710250002625; Tue, 12 Mar
 2024 06:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <0e38566f-a1f9-4ebb-8492-2c50945eeeb4@gmail.com>
 <CANNYZj96nE0kVyLW=DnrzwfN9UROZ1AzUG5kJ7Y6W2eF2tqAvQ@mail.gmail.com>
 <a70cbc1e-f234-45ba-a886-51461f2e8689@gmail.com> <CANNYZj9Z4j=Xr6ogCvPe+rzjGeg3j6i9XvVo-+5UfCX+qE_=Mg@mail.gmail.com>
 <71b34437-cd65-48c0-89b8-1030cf1a30cd@gmail.com> <CANNYZj_C9xKhVWjdcXx_3wi8WemRQSwPFGACtfCqydnDmtetNA@mail.gmail.com>
 <CO6PR11MB560246DF522F2C499DA4C411ED2B2@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB560246DF522F2C499DA4C411ED2B2@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Mar 2024 14:26:31 +0100
Message-ID: <CANNYZj8vS93gnY24ynoc+moF6MAW5ziw-+-f4+QJcjw3PN9Z=A@mail.gmail.com>
Subject: Re: [OE-core] Yocto rpm packages do not keep the modified CONFFILES
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 13:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196981

On Tue, 12 Mar 2024 at 02:57, Chen, Qi <Qi.Chen@windriver.com> wrote:
>
> Packages + overrides are a very common way to configure/customize images.
>
> Take OE itself as an example, the sshd_config is a conffile for openssh, =
but in rootfs-postcommands.bbclass, it is customized.
> This means sshd_config might be different from the one that is recorded i=
n rpm database. This is a similar situation with the original question.
> The original question is basically equal to: are we going to keep the ssh=
d_config we customized when we upgrade the openssh on target?
>
> Ideally, packages should be designed to allow config snippets (/etc/xxx.c=
onf.d/) or some override mechanism (default conf in /usr/lib and override i=
n /etc). But there'll always be packages that lack such mechanisms. Using '=
noreplace' seems a reasonable choice.
>
> For the default behavior of OE, I'd suggest we change to use 'noreplace'.=
 Because the more unlikely people modify their target files (as Alex pointe=
d out for embedded devices), the more important those modifications might b=
e.

With this I agree. There's also just been a patchset that refactors
ssh config into just that kind of snippet mechanism.

But if we add noreplace, we also need to ensure its behaviour is
consistent with deb and ipk backends as RP said.

Alex

