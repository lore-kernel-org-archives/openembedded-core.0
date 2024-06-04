Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C26EC25B7E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:00:09 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.16029.1717488007364781901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 01:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KT7r9jpY;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52b90038cf7so3671015e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717488005; x=1718092805; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zxd2D0ZmazwEbXjDeFAu9YAEmAwdLfyNWOpZFD9Up64=;
        b=KT7r9jpYR8WRiaWFYfDfVajbubIYZUpRnaRqiS6wT6x3rATNYBbBfd19UMibRd+jyq
         nqhA2NPOkwl0xf+vKIgUZo9ny7qBkDeahBCMco/MsxRUahsAaIHIzSEUx3tjURLWBbwx
         A82Hw+mw7vVaQFSDxd4Z67FFLFv8NUaTp5j8zN8nrTMWqyZnmUvrHVKatxWPr2R/VHng
         ysKsclp1qRzcFrp2wMm3MCg6gy1EI6mkfR2ry6THlLZhPeKqAMAYSpEdU3Xu/MWQeSE+
         DCfJ0Q41117eyBZ35u98EwhAphCGd5pf/RVFRvPYdp1owpNZ8CUPtQ2lLMO1WAyC148N
         Z12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717488005; x=1718092805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zxd2D0ZmazwEbXjDeFAu9YAEmAwdLfyNWOpZFD9Up64=;
        b=YmhFsPdtBXiEucK8SMto7fpud00CF0NIMSTjJ3URgto0mpbjgQ5DfIZHec9BBFgWcv
         t3sEx1FWJ26sohskic+DRne5k+U6YaQmqa4sM0CFjvWQu/oGNV0Xgz4rxcy6tqWxNMpA
         IBDrRWLEunVQLBI4mD1YK6l2VT++rkTqv3G+GtaqWfFGehZstUAI2Ye5vfw3gPLMyq1u
         TOpCa1hIdTRpCxn7ojCM3PTwX/Q1wfJ6aZ+c86EgftQG4r5/CpqsM3irwE8ciDfj/0lR
         eKYVimTbxtA3TcDjNJ7TZLzkVhk+8o60qY5Rhx4oZLvOq8H9KwvHTYRCB4TdM7FGpOX+
         3pnQ==
X-Gm-Message-State: AOJu0YyrJeGBwVw4VdmzOnv45+tIc2Yzq1QL3OUK+EIZbRe5CZIE7ILn
	qyB5vk8kdStUfZLPohTa0gkEaqLHWBTC7aKKPNgT5RhjjAMMTodmXNB9o1vPjL5tUyd/D0rIn8i
	kpWG5jR2zVfl8WYjldXBP9OabOJo=
X-Google-Smtp-Source: AGHT+IGIpcHsgUnDOhDKiY2LMcxHC5e2AXoHQHAXO0mJVGSUIAuKwmlM5ZAUy9xIshP2+aDCFMCbEu7wQHfWkfxJ9dw=
X-Received: by 2002:a05:6512:2144:b0:51b:43d4:2f18 with SMTP id
 2adb3069b0e04-52b896c1577mr6714264e87.46.1717488004958; Tue, 04 Jun 2024
 01:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240531230125.2404729-1-martin.jansa@gmail.com>
 <20240531230125.2404729-2-martin.jansa@gmail.com> <4050febd76229a544e3deab97541bacffac53b70.camel@linuxfoundation.org>
In-Reply-To: <4050febd76229a544e3deab97541bacffac53b70.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Jun 2024 09:59:52 +0200
Message-ID: <CA+chaQegMu1aNtEqRcR28HHR5fGWcLvDZKyzo_SnUvmSYwj2Vg@mail.gmail.com>
Subject: Re: [OE-core] [RESENDv2][PATCH 2/2] insane: add patch-status to
 default ERROR_QA
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200301

Thanks and sorry for not catching it earlier.

The errors refer to these 5 files:
/home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-795212/meta-=
selftest/recipes-test/recipetool/files/add-file.patch
/home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-795262/meta-=
selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.pat=
ch
/home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-795262/meta-=
selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-yo=
u-only-if-devtool-lets-me-to-do-it-corr.patch
/home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-795274/meta-=
selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-l=
ine-to-the-quick-reference.patch
/home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-795274/meta-=
selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch

will check where they are used and send v3 with fixes.

Regards,

On Mon, Jun 3, 2024 at 11:26=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2024-06-01 at 01:01 +0200, Martin Jansa via
> lists.openembedded.org wrote:
> > * it's enabled for patches in oe-core for very long time and I was
> > using
> >   it for many other layers as well, so most layers should be in good
> >   shape
> >
> > * it's also possible to disable it for individual layer as shown
> >   by oe-core in:
> >
> > https://git.openembedded.org/openembedded-core/commit/meta/classes-glob=
al/insane.bbclass?h=3Dscarthgap&id=3D61a881fdbe8b5a21c6276b8a5d06cc30486b1e=
b3
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  meta/classes-global/insane.bbclass | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
>
> I'm pretty sure this is causing at least some of the failures in oe-
> selftest:
>
> https://valkyrie.yoctoproject.org/#/builders/35/builds/36/steps/14/logs/s=
tdio
>
> Cheers,
>
> Richard

