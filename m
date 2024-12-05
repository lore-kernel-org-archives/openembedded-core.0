Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E177E7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 12:26:13 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.9625.1733401562942295450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 04:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I2QrvDqb;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4668486df76so6806011cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 04:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733401562; x=1734006362; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6hgBObg3BmtkkYENAwqoyajBa0Qs+zSDRswkmw/qPd0=;
        b=I2QrvDqbEMBdRdiRhtK5IeRo5QApPsRfGrehKiI4/gCPtznqXnMc0b7Zk3AaTzCTgj
         CwnmDQcbne/Un6unVC/cwm53G3YB8nK3rQOQcxMAi/ubziUI9/fznfAcOuUGZ7b8Jk7k
         ngguSGXMJVIvO+AwTK3mMDKPNjA1+Ym8Ie5k03/A1gxVGpQ92uQ8F0jlMdUTy/gI3dDE
         npw74EIkQ731yX5KsH006hrlq4rsCT+77H0z2xhwnY/7M2H4h8mk82KgVtJAts+c0MkT
         pnT9eNhcOjC5sxSz0yjNBizTRUEgnhlL92LIrWDoVRIqJ8lsLxROtJNC2ZFymMtWpRhJ
         jIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733401562; x=1734006362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hgBObg3BmtkkYENAwqoyajBa0Qs+zSDRswkmw/qPd0=;
        b=mM61b+63m7MLS1X7s5/FI8jgaCDle2cYjhx2TjPon7KIrWdCpJ+cukL44v6qxjM3+u
         PovPV4azVmrZfCuQ4xwWXcDkx7gi1hALNOwutfTmgz80ByzrKFV7L27sHcdE5kioRxto
         eIOFvsW6ls2cQ4F+ZfYINLYdR5FAY97LqGp5yM0eBuefZIIORtmjOD8KYLtAb0MFnkRO
         9YjDrftc48CAyB9eiWmhRpSwczlvQenkdD1ks8HCizewWE9WgJMIdTdeLKFkuQO+CBWc
         Mi/thQCR12LFtY17SgIbvYSKdI7sBPCQPBTOwF5FwFU4CRwJflI23uxfX2Oh2z4LkbIM
         bzKA==
X-Gm-Message-State: AOJu0YxsfUodo0n7OEHG81SUNbBh5R5VWPCCIPwS6PMqRI8iDinVfIkk
	XL39tZ/9oNeR0WXvgYd8aKoW10NNKYMhXt7Bh5fz+oQHzjOA+ACxITMC+r57zAGBkLtmK79wEo3
	kfI47DnqelgNZ6Hq2aR49g87OfMo=
X-Gm-Gg: ASbGncsudas3+sTZuQO/3cKmPdVYAbAP772mzmCXkplMhYH5A380o/9u0vQe8OgMJZ8
	Mbrx/4f+L9eC8E/CXzxWANVTmiBzyOsaWyqR0/lK3Ib7bPJuAeLbkLnJfXU2P81qghA==
X-Google-Smtp-Source: AGHT+IHZi5wDnNDOUZq16sLAHaAex1PuUdpOYJr3N7QTBKwuKE7AdP5tS6EKRUa4YaUWD0Ibvv9NNEosQwRPMK0jCbI=
X-Received: by 2002:ad4:4eaa:0:b0:6d8:a1fe:72a4 with SMTP id
 6a1803df08f44-6d8c46db0a7mr104011416d6.46.1733401561971; Thu, 05 Dec 2024
 04:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
 <20241204064920.817016-18-alex.kanavin@gmail.com> <f52d3c43d8ef2d786624ca5a50045dced51f1705.camel@linuxfoundation.org>
In-Reply-To: <f52d3c43d8ef2d786624ca5a50045dced51f1705.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Dec 2024 13:25:51 +0100
Message-ID: <CANNYZj8zRjotY-cT39pDbq9fhoKMx-NYba=Ks_jeiqa2-n+NOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 18/37] libtool: update 2.5.2 -> 2.5.4
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 12:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208378

On Thu, 5 Dec 2024 at 13:17, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > 2.5.2 was a beta,
>
> We made a deliberate move to use a beta due to the amount of changes
> merged upstream, and putting us in a good place to ensure future good
> releases.

There's the same issue with autoconf: 2.72e is a pre-release. Alas,
upstream named the final release 2.72:
https://git.savannah.gnu.org/cgit/autoconf.git/refs/
so I'm reluctant to send an update that will cause
version-going-backwards issues.

> I agree the multilib one can be unconditional but the fixinstall one
> potentially has side effects for native builds. It breaks the ability
> to run files in the .libs directory which in the cross case we don't
> care about but some natives did once used to do that. The risk is they
> find host things instead. I'm therefore a little nervous of this bit.

I don't have a strong opinion here. This can be tweaked to how it was.

Alex

