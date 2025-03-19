Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2F7C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 10:28:40 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.4558.1742380114004852596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 03:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CQebD6nF;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8fca43972so59539446d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 03:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742380113; x=1742984913; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Cx43DbwPbIbGvPiIpXEoIUGVpW0oW1+o7Ih24w06WI=;
        b=CQebD6nFiBSoZdUh+5eofZW66vRS1S1eoo4sLPq88zIsmgnNj0VEv9Tg5xAnEqN0AN
         4Icl5sGD3DzbkL320Ku0Yr7x1GpK6i3m5dS8Cgq7QsMfYeMTcZSFLPB85BnljGqSPuCH
         xLiP+AsuthzcYthcrplQBGVarP6G6oA/XIlFq79XJJNV8P2AVC9rukVWev62A674mXIR
         7HqF/Hk2+5PsiRtzbChxRwcaze1SQxVCmYnoyjEPO3JqLY1s7m4tQOCADaPOWVA46Y61
         wWYHd8y/DuGM9DvDHWGjYAWkptIX7wu4TUaSpAGPzRg+gQWLHHHqY5qrTIeb6Y232uxh
         eNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742380113; x=1742984913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Cx43DbwPbIbGvPiIpXEoIUGVpW0oW1+o7Ih24w06WI=;
        b=G2aIUejvFjx1Ig9br2o3+JpPxgDSHpCnWtrTxHXqcXRHhugqpiDjxvqACsjXlIsxAk
         8McJGNvccXi/jMX95x06a/TLT6jni3/xyfnC7fndEPiIlDCskZwkTWE53zTfSqH3Vxjw
         xFk6sQK5s+HqTF23bfic3qr6CCdTt8Tn/iAUmu1gbkXk0B3+D8Fggi9/pj4to2+ay0zK
         RRAVLUyVZTVdAveSQRyntPoma5FtISiDNVLYPTuMpDgMrjFotp2DQX2ZO68PWFiHDdGt
         22gPRRVUMeyVTvQ2XAyxuVpTqlNaDpL0BmxR1IJJfDjkO5F+9cj5lBxag9WwRKyJhGxu
         j4nA==
X-Gm-Message-State: AOJu0Yx0Y3sDfTWi/HYwBX33FFbGWWaod4Yfb4gApLH+5VLl2UUyQuOA
	0waIRO/3AnMuq+vhC+mKUaZ/xWXu4c7LysOiLdfbm9wHDCTxRLytWU+X5IdcNV68zK4RHNNpfpA
	JvwCk+CUGo1KnSCD6zj4wMiO3X+igIj0e
X-Gm-Gg: ASbGncuOSPNWK+SDTI0OoIAJI7ELUVTR6BeifQy6IciSQkGH41YrTP7JBkf25MWUKEp
	mxjctgLcftXKIEeWS6m7FejoKU86+YInVmoMTzCXBHKpaNjFggyQssoq2JU4xXE04OJCy1+KgTB
	WQaUGSLuW47uKVFzAJFhUCW0Db92s/yX0JDql4+Bsm/ZlSd5m2/Z+rWYGlaC51
X-Google-Smtp-Source: AGHT+IEaM+nxU/3rlLFGRwW34LK4CdfPb1C5l54Dx8m861mVnUmYLQW8vBvm2vmd1lJOmsDVQXZNiI01ty8nKBJpfDo=
X-Received: by 2002:ad4:5be4:0:b0:6e4:2e12:3a0c with SMTP id
 6a1803df08f44-6eb2949600amr29460806d6.39.1742380113026; Wed, 19 Mar 2025
 03:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250319100959.4102512-1-alex.kanavin@gmail.com> <51cc8655a05cc6cfaef32ee550fe11175c23da9c.camel@linuxfoundation.org>
In-Reply-To: <51cc8655a05cc6cfaef32ee550fe11175c23da9c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Mar 2025 11:28:21 +0100
X-Gm-Features: AQ5f1JpG5IPSF33T5wvrmWipFNEbj6RZihfoeTap_vC983IUcnoHsPpi8Ptc1OY
Message-ID: <CANNYZj_9RmwiA4=PDE1BR-njjX0y0FrCto8H9DTSROJwUjpZCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: correct download location
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 10:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213321

On Wed, 19 Mar 2025 at 11:20, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > -SRC_URI = "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.xz \
> > +SRC_URI = "https://archive.mesa3d.org/glu/glu-${PV}.tar.xz \
> >             "
>
> Doesn't this have issues with the "older-versions" directory that archives are moved off into?

I suspect this is the same directory as the previous location, and the
issue was already present there? I can't check that anymore: it's now
404.

Alex

