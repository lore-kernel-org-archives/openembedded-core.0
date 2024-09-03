Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEFBCD379F
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 16:08:01 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.27322.1725379675183160304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 09:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IujLRA4p;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53346132348so6807165e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 09:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725379673; x=1725984473; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ktgNMA1yLFpwviQhzihvHC3lYwNg9nDygca4at35s4=;
        b=IujLRA4pDMoA0azV5Eov4VyX1ovaw+KfC5A2FZonJcVscn1ycM0xJbm+pnYHqGjXAw
         qDoEmzrYNQO+ENb3UvIbGpNL8iwQc1XiXIgG41EZgaqiI3GKSCQCrIrGJz11tj11G66Q
         PKqazhosHLWHdmNtXtH6LIo5SDRO5G+1kUQSCFnj3VFvZF424UiCTo4rlHPffMECAG3y
         sC95ubJ4s0lCTcpnTlUeoe8bLI9/jScFVOGhIiLRytrbSbfeUeEdRKRSPP/pMdqyGlYG
         GuoKBqkCnH9ToK4yRvRkDyL4XMVsOo6QNGIF43Omxx7B2EnOjm7iIg6M4TcDRlY1XPvg
         7Dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725379673; x=1725984473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ktgNMA1yLFpwviQhzihvHC3lYwNg9nDygca4at35s4=;
        b=MVu1S2r3D4TCkqU0N2hgoqC2BNwvICjBuhcjUQhDo7X0gVIpqWzjoH5NJtfYHfeJdi
         zREQYwZZl4LfqT0hMY4BgCzXtZ828VeYs+oM7rbcaOjq1Aj9UzmuCG7Mg3wJILPY4Ca1
         AN6vK1lekjb/rFX3nYD/tY7aNz/ucOZ3d+4nTMTefgmjK20Nzyyd7/plq3J6Hnv/BNkC
         r/M2fDJgbfDjcuz0MPfXCFDZskci999spm7f+UPJBOtCVf1n7VglVBvG30IIkhyj2xf7
         pCCGD6/rNf70mmfOuDdEwjBLTcyDTjqkrpy/qQetgEnTdJPLhLTjjhixMfhhRgQJzj5R
         PIag==
X-Gm-Message-State: AOJu0YzXpN1tmOxqFkIvZenXO5cwkwTHVaV/Khgz8WVQoeNDo/hbKnbs
	ZoZZuaaPWAPk92cHPph4dz3odW9rNPRrwv4FvHRvnMTC3SJ1tXI0tcqIx2NFtJVVnjbCTTon+7F
	yF1rXkqkhux2R/xjXDPzoTGU0hXk=
X-Google-Smtp-Source: AGHT+IHe0cbDWgMfXZC7A80IL2KTe8mSbeXcTjt0SAi4eQom1Cv6hblL3/Uo9kdTrkcmQNfJxnBShJ3bBgUg3SNE0Pg=
X-Received: by 2002:a05:6512:b11:b0:532:ef22:eb4e with SMTP id
 2adb3069b0e04-53546bb353amr10276855e87.54.1725379672300; Tue, 03 Sep 2024
 09:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240903084610.283818-1-hprajapati@mvista.com>
 <CANNYZj8FNUTbTkGc7Y7VVxw4yq6N3wmyNm-8XbHL-nZ9OX7jsw@mail.gmail.com> <CACVbggH+FzrdubsFCyL+=05pUxkj4G_nm6YFEhFjsVaF6tq6Ew@mail.gmail.com>
In-Reply-To: <CACVbggH+FzrdubsFCyL+=05pUxkj4G_nm6YFEhFjsVaF6tq6Ew@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Sep 2024 18:07:41 +0200
Message-ID: <CANNYZj9jumRzDSMZnMygXTJz7HEHgTaQU4LFzc-5gQjewbzjbA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCHv2] rpm: Upgrade 4.17.1 -> 4.18rc1
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 16:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204173

On Tue, 3 Sept 2024 at 13:50, Hitendra Prajapati <hprajapati@mvista.com> wrote:
> Thank you for feedback.
>
> meta-lts-mixins layer don't have any file or recipe for rpm.
>
> How to summit change there ?
>
> If rpm 4.18.0 is already released 2 years ago,the anyone upgraded it for kirkstone branch ? or How can i do that ??

I guess no one is actually interested in making a new rpm available in
kirkstone. What are the reasons to upgrade rpm there? Are those CVEs
serious? If they're not, then maybe it's okay to ignore them.

To add to meta-lts-mixins you need to create a new blank branch in

https://git.yoctoproject.org/meta-lts-mixins/

and then add needed layer config/README/recipe files (check existing
branches for guidance). Then make commits out of that and send the
patches to yocto-patches list.

Alex

