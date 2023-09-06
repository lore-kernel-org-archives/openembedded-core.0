Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3175EE14C3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 19:32:07 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.34.1694028718964474532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 12:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FE0QBvw9;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50098cc8967so214361e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694028717; x=1694633517; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QOHkQ4YTo4c59VY8Hk6Du/g2Gkha3aY9m3cvj/00Cug=;
        b=FE0QBvw9yykjwzqKZpA6mULsYjcIK1GSnLGk1yiqr8vXGHwDd43+NRMh8ACI/RM0qm
         Vbl9q2B47iBcSXM3JwGOQH9b6+rOzLaJa4f0LiHp7BoJC89x6L5h5KdhS85/qfQ2wdL2
         U75KUhoEiXT+aYzn6BIeda1lPs96GK6LmwMTaiBZ4Hd29ptXCXXnSdRUy6b5inHU1qbN
         cMqbLDxOD2n5SrVKzntvDzF4wYMwdET8ep129IG6d3HDjaMKPuoUgOd4qUsmNwXU45+Y
         r1bdbj4ePvoZyGaMZQ3neCSxRR8kCIYwU7RFHVCI8FnQ3gSH3obDa4V80I2rg063pneH
         8hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694028717; x=1694633517;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOHkQ4YTo4c59VY8Hk6Du/g2Gkha3aY9m3cvj/00Cug=;
        b=YLWSU5TT2y1lUHbz5cN/NnBNCiynJB2zRDbEQfTiUtZS6s24gl/HseBfWeG86dOqYN
         IgfBZxahNT6DFvq34OLmm7fHipIo3CxDieApY7TsKDMWVUIx3PmX/GXznTC4j9AmGiFU
         2VB5n4tM1hV/+YSrZq1+QvRRBFkCmjZK45I+pxVfPsdR6uloxkknxmkr7oCi3WLvMK1t
         3kpi9l3/Pl5rnipsjIboTRkYoZLhfmR7E7NXn4pJdlTqJYCzOU0G+dXxJ0iwo21kY8LM
         Lt/fn3In+f5qxbVAi/wwBPTWOocDCAVbdHK+Ekkh6IAWzzZ6wtbo4Jru2kaT5JNSMPXs
         LvkA==
X-Gm-Message-State: AOJu0YxtfBa/hmvGWu/yW8Za6E9fcBB1+AhGTcs0RndtYpqA8i+5lpQ2
	8JtAM8l+PwNQR5pPtm6d7BxpgX3SdSpcXN/xr0s=
X-Google-Smtp-Source: AGHT+IFBlbJ+5CHjQfqVR3JuWFyH/6b40BPcH/zP1tK6x2tm4Q9dN24pPWOwYAWu3WMDXW0BV3mZ/BlJaKXSL94SpHE=
X-Received: by 2002:a19:2d02:0:b0:500:adbd:43e7 with SMTP id
 k2-20020a192d02000000b00500adbd43e7mr3111752lfj.8.1694028716878; Wed, 06 Sep
 2023 12:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230906165633.2382629-1-alex@linutronix.de> <20230906165633.2382629-16-alex@linutronix.de>
 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org> <178265F14380DC6E.27053@lists.openembedded.org>
In-Reply-To: <178265F14380DC6E.27053@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Sep 2023 21:31:45 +0200
Message-ID: <CANNYZj-xfJHQvQ263hnTcGs+bnA6O+onDD29uo8quh508MqoXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 19:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187352

On Wed, 6 Sept 2023 at 21:28, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > This doesn't just force ordering but means target will always now
> > trigger the native sysroot as a dependency. We don't want to do that...
>
> But I think we do. Target is using executables from native sysroot
> such as user management utilities from shadow-native, and they won't
> be otherwise present there.

By the way extend_recipe_sysroot()  is already doing:

        staging_populate_sysroot_dir(recipesysroot,
recipesysrootnative, True, d)
        staging_populate_sysroot_dir(recipesysroot,
recipesysrootnative, False, d)

so just calling one after the other in a single task. Why
build-sysroots recipe has those as separate tasks I'm not sure, but
they should either be folded into one task, or be strictly ordered and
required. Unless I am missing something.

Alex

