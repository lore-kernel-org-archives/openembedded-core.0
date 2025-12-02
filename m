Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F183CFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 08:03:08 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3103.1764662582139978360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 00:03:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z1XrjjAP;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4edf1be4434so34115021cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 00:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764662581; x=1765267381; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ROafaL2nxTlx6fJwBAQ3LYsulKhiKTlBQQSj0siZ620=;
        b=Z1XrjjAPOiaDXejbGt5XfnXFia4yWUkiw8Vw6kOpzYVYLuJDvk33lsjT/O2ssRN6bf
         kFvkSa348Vsu1Iu0GWA3gTVXeqEDooWi7zNAvq7qEW8qWcmSVeoIt7C34a0w1uqbTiO3
         y5ITaFsXojMI9DMr6BIhXDPO8reaYli9O8ZoO0qbMGpCjKY1w6ARe29+eoByrJ9ZYtJM
         02s4JLpXVrhUHGoD2FD5yr8alGtQMdeTihUuZEbuREoz86hVxhyLKKsDuYtuPhxBTxpZ
         eipN6Dd8xZV3XLwaj0aB3OOY0rFk8F00LCkEjDr3m0/Hl0nzwucEJmSyGoqjd6+DWi65
         74qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764662581; x=1765267381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROafaL2nxTlx6fJwBAQ3LYsulKhiKTlBQQSj0siZ620=;
        b=nEQg35MOU3fDTM8GlKwOWfULmoCfLPXJETjNyRGW2ARjqCEuMtQEVGX/bWGBx3h+53
         W8D8eVCXC4zsj68u41axLeXVwPr5VVdV3XAJkUpG43a/nl/24kvUYyOwhWLjPQPUZY2I
         p7orUidrIfKJNnI3ulCrNGFAIuJ0j/DDwAL8IwtKYKu+trQjwd98FZontYMibFDz+eAW
         MY+Dp3GrtnH+84GQVcvQPDlXOnwH8anfhtB1SvGaJZ7rKy6Sh7sX744io6wgnGdrseK3
         GmZMwuB2Qy12xhR73fWcbi7yGuzvNyde21YGrE/tZOVTXP9KJgyC6EjU7r1273V8FmM5
         yiMQ==
X-Gm-Message-State: AOJu0YzoxT9XnVUE/o1IYyWDvAnJvyzA1EI3uMBcZuTf6uHWzlmJ7/tx
	rnvwGwI60McRTtDD791TIZ31fzbB7pBpDTMJsNNRFhb0Jqy6LXt5xkvmPhERdAg67t9/jhSCprT
	Y0HerGzXCIDxIggq3Pn3yzqrOhKsBLgo=
X-Gm-Gg: ASbGncv+OeR0ryO+30V0IdlSUs0AXdBWl+zSRT3hdz4wHVtYpX0FDCuHBmc3fyowiTD
	IqPip0KbEgLlkZfNwvovSbX7KVb48AThj+S/pyDYhzqG63WEdhSUZPBXXVc6e8thoQTp4yQ0JbX
	KCyMeNrcCXgIOBShXZkMe2UMOpWgtj9fh3CB6s9rZxm6sRfPdFyYcmcsOJgPVFSvZPx3+f+M2ok
	1x+qM/O7+FJ8CRObkFOqcQV/2r1hfx4SxIJxYLv+ok6P6SlY7Dvra8x+9+Kwvi1BReCI4HtxFS9
	nHjpwgY2cXC6ZzHh6PMlZdQ7puO47kQEogiW4ump
X-Google-Smtp-Source: AGHT+IHicA17Ce981KCUeQvgCgxGk9uoKUY/wXFuX/e/yaqRPyWbFx3bx0F3FN4H0xoYmLKRbwA998DQRzpVA9/Llpg=
X-Received: by 2002:ac8:5d12:0:b0:4dd:ca89:8d7d with SMTP id
 d75a77b69052e-4efbdaefbbbmr373375791cf.56.1764662580980; Tue, 02 Dec 2025
 00:03:00 -0800 (PST)
MIME-Version: 1.0
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
 <20251128013628.2187455-2-miaoqing.pan@oss.qualcomm.com> <187C300838343AAE.236385@lists.openembedded.org>
 <CANNYZj-41tXqMX2D=bUU2Q8E7=qAC8=5M_3uvMFcmq0aKV_sRA@mail.gmail.com> <8d2218a0-3f94-459f-ac2f-8880d356db2b@oss.qualcomm.com>
In-Reply-To: <8d2218a0-3f94-459f-ac2f-8880d356db2b@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Dec 2025 09:02:49 +0100
X-Gm-Features: AWmQ_bk_CRAcGoa-GxlG1XDGs-zotnr3xLR9cMXWTxkjgNAM3BovrXBvN7kht1Y
Message-ID: <CANNYZj9J7aNyqi6vxeZr_6viF=gze87JaKJx7-ge_6GokcCLTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/4] wpa-supplicant: restore use of packaged defconfig
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, 
	dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 08:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227150

On Tue, 2 Dec 2025 at 03:12, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com> wrote:
> > I went and read the commit you reference:
> >
> >      wpa-supplicant: Use upstream defconfig
> >
> >      The copy of defconfig we were carrying was from 2014 and very out of
> >      date; drop it and use the upstream version with appropriate edits for
> >      our PACKAGECONFIG.
> >
> > So this was done for exactly the reasons I mentioned. Let's not go back there.
>
> Commit d97bedd8bdcc ("wpa-supplicant: Use upstream defconfig") uses the
> defconfig from http://w1.fi/releases/wpa_supplicant-2.11.tar.gz rather
> than from https://git.w1.fi/cgit/hostap/tree/wpa_supplicant/defconfig.
> In other words, the copied defconfig without any modifications. By
> maintaining own defconfig, ensure a consistent baseline and simplify the
> process of enabling additional options.

It may be simpler for you to copy a file from upstream into oe-core
and effectively make a fork, when you have modifications you'd like to
make, but this creates a significant maintenance burden for the
project that is already stretched very thin. How is the file going to
be kept in sync with upstream? Who is going to do it, and what ensures
they suddenly don't stop and disappear (this happens all the time)?
How is the situation described in the commit message not going to
repeat itself?

Neither you, nor Dmitry are answering this, so please propose your
needed changes to upstream, add them as backports, and devise a
configuration/packageconfig mechanism in the recipe for things that
need to be selected at build time. I know Debian does carry a copy,
that in itself is not a reason to mimic them.

Alex

