Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5241BC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 15:49:24 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.19619.1668700154655428036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 07:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SboXP/Pc;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id g7so3467221lfv.5
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 07:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Th6K3BgNt6jeBTUZZCSjCSX2tV51Gy5bPJtzA2yH4T4=;
        b=SboXP/PcDuYETiV+JZY8NuPMFAr1eJ7BlRK0u3c1w4qQ2yB9XsqQaLQeNeNV7YKj7r
         5KBoK4fcALhSp29pH1vXH2UE1xXeecIKIBEpMmqOu3m3fCOmkp8pI4BGEc27ltpOSI8D
         rd+95Zld3U32//IcWWl7JKn6Mrkdhj/uWPQMznrsT4wSJjG7Zpyhm71MloOj+HdgY+Bt
         dGMhCLZEBu5NWb/+go8pAYabTubtg3Q/KGgIoXjBGNx1ts0V2KvjmzjlPdP6fvAK7Mk8
         Wd99kz7TMYglEfyGtsV0l2xjDiLTzgVjM5dfKsV34vk4PrajkPUKHtOXllfOuh5TuYAp
         0YOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Th6K3BgNt6jeBTUZZCSjCSX2tV51Gy5bPJtzA2yH4T4=;
        b=0SC6Y0LkVJwFZhyeh52nEe7D5BeOv364AcAERWLH01hAGxuTmwVOiWnbu5UW7coB/1
         V7LJ1luEgCh6+sFaPPxzP2UTxx4BoijPLzQJt6XRlMzyGTOTyN2BbYs3T4o8yl6Bubyu
         zJq6BZl+MDjpneR+cDbeGs37919fBUlGdaXe4w0zP7XHKWYGU8bKfHtDg1m1Ka/MvauV
         w+LWcgc+2V0dzibniMDGlfpRExcF4sQXMgmThks1u6YtvQncpAH8NlMLOk5kxZTVJiat
         4X2XKEqAQHht7GxGXOZrHkOJM1rHqx9mGQh691Isepe4QxRPfwYTemsWYtQw7T8+d8TE
         2OOg==
X-Gm-Message-State: ANoB5pkiV8feXkXPVYhalgiNzetKX+IrCXB/pkXLnje0aXFEBy3kSFtD
	44shNd9IS4MB8oA+0rh22yLa7EEDeo11JjwQr8o=
X-Google-Smtp-Source: AA0mqf4SKgh0haNO/+QxbXmDqVvcKtOwouoIpFIUKD+VhtmccDlti13OiFc+n4j27dH8pxCzqkeVeAuVZ9qgIQm+yFY=
X-Received: by 2002:a05:6512:3445:b0:4a9:39f4:5793 with SMTP id
 j5-20020a056512344500b004a939f45793mr1139293lfr.131.1668700152854; Thu, 17
 Nov 2022 07:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20221103183356.40685-1-sakib.sajal@windriver.com>
 <CANNYZj9R5=X_=yK8hsq_RJJ0ieSrGbCqd4jpzBN5Uv_U59n2ZQ@mail.gmail.com>
 <DM6PR11MB25388B935A115A1398CD8EAAF2079@DM6PR11MB2538.namprd11.prod.outlook.com>
 <CANNYZj-mNkCgk=XHWBvqpqr=x4R9AMyktBTj49p-QK=Ui2whxg@mail.gmail.com> <4JYHLR.TSDICAGWLD7L@t-online.de>
In-Reply-To: <4JYHLR.TSDICAGWLD7L@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Nov 2022 16:49:01 +0100
Message-ID: <CANNYZj_akT9iove+LmqnrY4zA1ghct93t4P7hc5UtuSf8s5eHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] blktrace: ask for python3 specifically
To: Markus Volk <f_l_k@t-online.de>
Cc: "Sajal, Sakib" <Sakib.Sajal@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 15:49:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173432

I am tempted to turn this into a patch :-) But imagine all the
complaints this is going to receive. You won't be able to tell people
that this is good for the future: their stuff worked and now it
doesn't is all they care about.

Alex

On Thu, 17 Nov 2022 at 15:49, Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Do, 17. Nov 2022 um 08:43:15 +0100 schrieb Alexander Kanavin <alex.kanavin@gmail.com>:
>
> Yes, they kinda have a point. Referring to latest python as python3 forever is silly. Unfortunately we have all those users with legacy proprietary python2 things, and they feel like they still 'own' python (without a number).
>
>
> To avoid patching dozens of scripts, i use this bbappend for python3 until the time comes to make it the default:
>
>
> do_install:append:class-target() {
> ln -sf ${bindir}/python3 ${D}${bindir}/python
> }
>
> FILES:${PN}:class-target += "${bindir}/python"

