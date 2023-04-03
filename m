Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0498C76188
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 15:27:35 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.74115.1680535651968535252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 08:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MGRmYfXg;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id ew6so118815689edb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680535650; x=1683127650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2QCQ0WWKTYnSrndCQ63r7I/CzMKhcm0cCSCiepdDcw=;
        b=MGRmYfXgBXWqqZ84e+4NpJua74twigDpM1U23sem2wDc2aH8Z8TfoeHcPpnye2bmgf
         O7NPs5bZCI/TDYZX0eod5kbqQMOxv/XVd+hPDzr0EN+AUoibr8x6jItel8bAO1haLBQ1
         mCqBSL4P+rTAsTRQ3xE8gbFzemEMhgjhPhSmN03kcSxyL5KXKdKJnLoK61UeWQNoOKea
         avFQkIUmq4HlL/by84Ecd79PgQznsHQvHUKqH7IZ0eBpILvODJYWSO4UXaF0Zv31IPXC
         XIlC4mGY5EwZAJf64GjyZjEOlFasK4xBOamhqM8/UCdbuQ1TGxYQy/MRwyLrVP/dkcjI
         oTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680535650; x=1683127650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2QCQ0WWKTYnSrndCQ63r7I/CzMKhcm0cCSCiepdDcw=;
        b=oGXnGgm6yPeAnrVzwY0BSMF8MQiq6OM6h7LPmN2zcbPoZocHI93kgjw1b/GWMkdrBg
         CgUGnauCnfY03jzGeAiT4ikJuxAw0NpwbH4H68K7fnX9VEIlfUyOQrk1S5EEKgPJq5cg
         ZabIQ8lCSgS7nfoF8KTCQ5GXv06SzEY3inXzviOO8EhMmVrcBkWrOTJomsc5IYVqKa0f
         8o/P96B6Dc17FhHNhSIwmuEJCcQJeWIqjCtrMXm2/Dfft9bxO9vrjT4tS5h4KuaB/Jo7
         dOAr+cFrt822iMXsSjdiaGo/jpyqKr8L4IGl+j98oSxS6hb7ZpVxKvUZl8kgi1BtoQMb
         IfIA==
X-Gm-Message-State: AAQBX9dLFlZDTm9EVKU/CtVRJgrknP1Y4CrD8wX+gDGqQVWMQ51MjBif
	SEck6VNZslQHxVAJgEmt8GVLRYYtqG6gmEYfMgr5FQ==
X-Google-Smtp-Source: AKy350Yeb6v8qyhcYCL16XdP0U8oNvKHijAH0/hl8ZbKEkyc3O5MmFsfOiB9SlnEOFTQq/JMLEfTW3k9TeC5OsER5WM=
X-Received: by 2002:a50:cd0b:0:b0:4fc:a484:c6ed with SMTP id
 z11-20020a50cd0b000000b004fca484c6edmr17629013edi.2.1680535650324; Mon, 03
 Apr 2023 08:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdadm+JeqPYUB8+iPH-e3t0qcRaJQqFmriq0MK=2AsMuEA@mail.gmail.com>
 <6415.1680535345411693829@lists.openembedded.org>
In-Reply-To: <6415.1680535345411693829@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 3 Apr 2023 05:27:18 -1000
Message-ID: <CAOSpxdbK7ypERAdXmVX3O_78eia1MrLwfZZKC5QL-hgrdRohLQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 15:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179640

Hi Pawan,

Please do a fresh clone of kirkstone.

Note that "curl: Add fix for CVE-2023-23914, CVE-2023-23915" is present.

Apply this patch.

Note the fuzz error.

Steve

On Mon, Apr 3, 2023 at 5:22=E2=80=AFAM Pawan Badganchi <badganchipv@gmail.c=
om> wrote:
>
> Hi steve,
> This patch is depends on below patch, if u build with this patch  it will=
 not give fuzz error.
> You no need to take this patch also now because in kirkstone it is alread=
y available.
> Could you please build once again, i think fuz error will not get.
>
> https://lists.openembedded.org/g/openembedded-core/message/179015
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179639): https://lists.openembedded.org/g/openembedde=
d-core/message/179639
> Mute This Topic: https://lists.openembedded.org/mt/97818991/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

