Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C31C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 14:18:35 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.25846.1680099512469970996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ScoWDf5B;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id y4so64037020edo.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 07:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680099511; x=1682691511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eX4XOFy7RH1Al39ReJHR8QzB8OC/UM8fKJulAq+DfaU=;
        b=ScoWDf5B0Z52cVFubLhHqYKzcs1UW2c3vDqUsCi+AAhzvZLFxf8MVXtO4GuLOwclgV
         4WU0gQHpZMqged8Ykp39NObA883SgT244n3S7EnYsb9/juDOATcpPv0x48KEXLZHfLbT
         +S0z6iNB3qGiAnTcFQYUVFEoYj8b1RJEl+XznqnMGlQdcWsxnCMLADUiiwxVHItBXiNl
         3uy7MA1Zb1dkG/hXnRKTGyRMUwQTJ8eB8WGncsDTmpVyU0tAT7M+mISJeawKk+YCzYNM
         fuMK35JgYeASitDaNtOhVejkLgFp2bqJeTT5tenDnSXSbTdfDrghJlt0J8JAgYXpM8LM
         pfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680099511; x=1682691511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eX4XOFy7RH1Al39ReJHR8QzB8OC/UM8fKJulAq+DfaU=;
        b=bQPZk1qJrMv0SxbeMGfvce1djvLgxInTTJAUW7tVnGFGvmMVEwwNu3jdWZZ9rTxn2j
         cwKt1LBoHr+NloRoQh3a7dgfCmdk6mlCRXRK26ySuRCUDYpq5OYwoDOyweaDkgX7nNo2
         BJvLUnJAyU6UWSy97HU4+OIoGsO82TxgYQi74Iw5FVEftU1Sph3PWnkv9l2ZQWL09KT2
         DF737cCKa4bMI7wyrx2ffLlRhQytRUw3yPhSo6pk/aqUN7/XR7yoRkwwQzhgQmWEEp92
         uewdyF7z+m2RlRyRaEGNqIWysV4REcrIlE2WcSyEyzvGEFjVEGpvsaVBFGJ30QDUuhAs
         /scg==
X-Gm-Message-State: AAQBX9dIgMxJr1HveRT0IXB7GIpfVy+M5xsMBEWKTtfRPv3Ke+VY2nVR
	nKhDd4ZHEU9PlwjN2h4e58A9tje6iL0i7EVunaZ7Kw==
X-Google-Smtp-Source: AKy350YRZE8U0jE3sFEidUY+96nafqM0HTIc6QiGi+48ds1XQhsrKFAoanrG3g8Gzkfjtn/YMD6oR86IV8t79aSmpp4=
X-Received: by 2002:a50:a6d1:0:b0:4fa:794a:c0cc with SMTP id
 f17-20020a50a6d1000000b004fa794ac0ccmr10291423edc.2.1680099510528; Wed, 29
 Mar 2023 07:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <CACVpDMk1AJcMG7xztYc0B8Ncg+RykeBxiRvVjP-SmX5Gn1e6gg@mail.gmail.com>
 <16458.1680075499534911324@lists.openembedded.org>
In-Reply-To: <16458.1680075499534911324@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 29 Mar 2023 04:18:19 -1000
Message-ID: <CAOSpxdbxq9FS51Dsd39eVa8zZV3qnsgsRFs_233qLg-5ExsWrA@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 14:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179280

On Tue, Mar 28, 2023 at 9:38=E2=80=AFPM Pawan Badganchi <badganchipv@gmail.=
com> wrote:
>
> Hello steve,
> Could you please build this patch with below patch. This is the latest ve=
rsion and please ignore previous sent patches.
>
> https://lists.openembedded.org/g/openembedded-core/message/179015

We have the following patch in kirkstone already:

https://git.yoctoproject.org/poky/commit/?h=3Dkirkstone&id=3D64eba948a9794c=
4f37d2473ad2bc3a17db2c3766

Once a patch has been merged it is too late to send a new version.  At
this point your options are:

1. Send a correction to the above patch with an explanation in the
commit message as to why it is necessary.
2. Send a series which includes a revert of the above patch (again
with explanation as to why it is necessary) along with the revised
patch.

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179265): https://lists.openembedded.org/g/openembedde=
d-core/message/179265
> Mute This Topic: https://lists.openembedded.org/mt/97818991/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

