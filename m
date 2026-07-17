Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D0CC4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 16:36:48 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.771.1784306203973693587
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 09:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TYP4z1Fw;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so76477916d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 09:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784306203; cv=none;
        d=google.com; s=arc-20260327;
        b=qTKJvR9O4eN+Q7l6dHkZT0woRHsP9JMxZAC/c/3+OXIzXGOFx6xYqvW68/XvqLE8d1
         5+E82CRnV8nii2STlv+aWSNnV/9jLilcJrfpjRKKK0EoESQIei5eUy3o8ub3CY+yBcqC
         1iriK5NDJMF7RCdeKrPMPByDelQNvGfSEC7Ozi5ql+zA31dbqoHWN964FzeSzFmwbH3J
         PVMDNekE7FMiPv6+FOE+q80BNiEuJNdmsb+WichRJo+oUxSh08Dg6TizH3hFb/TtHfC1
         JpduGNP704/t+CT4wpwBeetlxJ5f/1D8A2Qq4eVsNG0PEHVytky2cghFI/6Y2OjPyjka
         dlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SFYFGDrWjFYQEe2N4DGdd3PCeDm7GVxbprWgxXms/Gk=;
        fh=OmeYm01zPsUkL6WbgLAcVtMuhVwpe7PTs0GHS/J6wtA=;
        b=mWKOnV8qqdver6mjGRvTqsi8QcT54aeI3JqAUbkZ6DQPdVbir/hxrOktE29e+9p5HZ
         0UCYY5C0zxpnPQkmZ7rPBdte8wTPYrVy1F9Di2cxxdcvwyagxfHxunPq2LWvC+pc9Pey
         yQRjQjPpWFXIo8RUceQHjughh4VurQ2EjpnRcPzWZ88iSbDMHzq507hoNVEaU5MfQsKe
         bOt5Le8urIYnmwKTDBa40uec4WVebQfnVCN7WUDkEx/6vjMZZi6iuPRbo/uljkGMG34G
         ZkJ77rsfs4ykh+B2YUNs3Ob+IAh/NLN/DWfRG9TY8pfBUvBJXnRNOuAg1edQvqCXXQVE
         CVOw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306203; x=1784911003; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFYFGDrWjFYQEe2N4DGdd3PCeDm7GVxbprWgxXms/Gk=;
        b=TYP4z1FwoYb4DcgF3O3lvLTvMfelU6gHIJInliNttk0DAqAjkzOZfyiB6QrNq9jul4
         ISRQTMZhffWqBXDuR6F9xKy0IG4KpGLiXVbOP11w1mkicLcs8D0xgwxyBVaiEjBFTJp6
         YCUMgpzY8MBuORdIRQcBZgs2DTl7C4b+bNt8NarjY6Dn2g0U35dVxQNe7Bmu+1yCdciT
         p6J0Zgz7teOUQNx0F2yQGlPP/BeUWQ3UbSEfKVx2JYEW/i0raXPnc3zJOxzMlfU0KPck
         Y/3vtudYmR6vjwqbIuBWi8Ps3AR3SKaMl/PY11PtzPPA9WH03UdwFLUdioeXgy8RUkY9
         XU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306203; x=1784911003;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SFYFGDrWjFYQEe2N4DGdd3PCeDm7GVxbprWgxXms/Gk=;
        b=DCMErUwyTnilmOJrXlEWkyo7Z+Y759FyVIiPvqPXxaxBZ885D3HCikWJnjRYQXWUIf
         f/nBHbJYtut+hUxfnmH6M2wk/ocJ3GcndGM+om6U83AgmiHUt0gEe5azqf086h58+Wbt
         GZPp78QxXTqh9q63eJvZZqtdmSphj/Wy7WoD/4sn5bgldCKAuxff8O9t54dSsfBskIKJ
         diu6RbPu6mRXxDuFrzYy94OAgYtNN0N5yf4NNh76HkdlLuPgPvtqeBW4rk6/kWvyLCNa
         JTiPG61AmYCtjofFi/zo+3dP28uBQ155ChyyvhS3jxcYPOtx7yk43rwLJ+2hzFQaKW6I
         +fRA==
X-Forwarded-Encrypted: i=1; AHgh+RrHRxlMXCQLnQ+Ho0Ii+zLqO4w5Db1nOXAdupw+o1u75eY5kgx79+8o3QeQaQC8UnYskOnaz6eFPPegIvEIQislrg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YybQ2HRUTI7a/n36/PaKHU1o+BNoNzHqzzvskzxuX5WtP99VR9I
	V74V7hTVFlxYFyNnXkWKL8Nyf/VIlMhzeN1+RtmHYBEFnrAx3/08d9kdMM7Y4segl5IicMUx6ZI
	Q1cP+nE9ZDmoXh9cEEQzrRFjmOEA/zE0=
X-Gm-Gg: AfdE7cmRSFC9Dw/oG1oDEK2PWEiHqnRlqZinXcEJkWnGCzso68JdIGRTNeglT1WAS0D
	UhR/uevCh41CNcPrAIi7+XfrTyw3H0P5emcGDn3aTHy498KugOQBzo7neCOYsjTATaywZh9NsXO
	O8wIk2l0DPYos+1bSqpwC+FbSsL0+nhAbH17E41nACS0ThbNUAZnScut5kP5bkIOlI9a4c9PP0R
	9rORFsrPO1gr9xvSKdZwsne6sc+RsmLLfEsVExDvKAs4Rboo/yjSoapzdi+mOht7IdkDta3w/ZK
	wLuVhSuvz34fARI4qEcz
X-Received: by 2002:a05:6214:5f0b:b0:8f3:ba0f:e7b9 with SMTP id
 6a1803df08f44-9077836dcd8mr35864466d6.18.1784306202704; Fri, 17 Jul 2026
 09:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773324129.git.liezhi.yang@windriver.com>
 <DH0XA8PQOXXR.12KPIBAF43RZ3@bootlin.com> <1f50dc21-bf2a-4b2f-9a39-9ef5137f26c6@windriver.com>
 <189C7BAFC42D9B2E.1443259@lists.openembedded.org> <DH2B7SIOV4KX.3PZ5RW0V6NOSR@bootlin.com>
 <daed6c1a-6db7-48cf-94dc-ffd74af4181e@windriver.com>
In-Reply-To: <daed6c1a-6db7-48cf-94dc-ffd74af4181e@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Jul 2026 18:36:31 +0200
X-Gm-Features: AUfX_myGdvmK7v7xnVKn-VwDXYzCjUCqXoW-NFJq4gnXXoKTetCwM9tHeRQH2gY
Message-ID: <CANNYZj-hrPf-CVJwTaEJ6dgUuWnipYKKiPZ3r_t1_HPYhCKvYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8 0/9] rpm: 4.20.1 -> 6.0.1
To: randy.macleod@windriver.com
Cc: mathieu.dubois-briand@bootlin.com, Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org, 
	"Gavini, Sumanth" <sumanth.gavini@windriver.com>, mattware@cisco.com, esparlin@cisco.com, 
	peter.marko@siemens.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 16:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241219

On Fri, 17 Jul 2026 at 18:22, Randy MacLeod via lists.openembedded.org
<randy.macleod=windriver.com@lists.openembedded.org> wrote:
> Sumanth (CCed) has joined Wind River and will pick up where Robert left off unless someone has
> things underway already. Sumanth doesn't have Robert's deep knowledge of rpm but
> he is an experienced developer and will make this a top priority immediately.
>
>
> The first step will be to refresh the patchset locally without changing much but then
> he'll update to either 6.0.2 or 6.1-rc2. What do people advise for the version?

Thanks! As tempting as it is to push for the latest version, I'd say
6.0.2 first. This way there's less rebasing, a less steep learning
curve, and Sumanth won't be overwhelmed by failures.

Alex

