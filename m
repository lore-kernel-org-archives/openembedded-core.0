Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B20C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 14:43:34 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.2972.1670597006827413194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 06:43:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KUJdBJRc;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id x11so5126930ljh.7
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 06:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a+YssHlrZVyk2mYsuZOlEw0NMDqdEaTEYys6LUJK/z8=;
        b=KUJdBJRcL9oqQfU5lYz18MTRsu8etj11KmHsCHxNHaGHRwuj9gBsD94LQ5mtdLhjZ6
         8AGoNstsQE2q7L7O7/+MI04NI6kPTF3jBgjnBq237YQWh+M4Xda38MeSFpcEhyTWtcpj
         W8xhYfDCRZLHpnLDHO+zx8zs9aXjyt0jSPu3S0y8BvZMcsTcegL2uja/+upyWcBSUliL
         PBJ0koxetovqkP43JpCch4bZDMhf8jc9pFTG1XLbhgBO36Jo6oCzgd6k9yAxRyxeiFiq
         j3Lo1Ell0qF27VhUHvfaG/YNyXRz6ZpAYHTfflN5Mxe97olgbXEZMwHP8n84iThB5LCd
         4AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+YssHlrZVyk2mYsuZOlEw0NMDqdEaTEYys6LUJK/z8=;
        b=e8YWz5AY3yyGU/JP8D3njvoGeDj73+yLfvCHsHwsV7ImpkVkI+SqLxeii4heyC1Cbg
         1DGcYNIEw9QhvgWdJHCemUNabAX9Ou4rcglZx1Fk/+YFZIGKCudEHJTrrADbOqQoFrcN
         bYyFjDDGgelFj13HjIUTw1+OJNDyHiYsUH/Z3y77Dlhs/dZosVkELeaxh57tNhPQTazo
         EaCvP+XV91jMigZepKtD9n4/k2Ilmrp0GAqXRXoslOLH4gRIHQL9HluLtY3gPjkJk3Rq
         YB1QZQG43Z3OZo1np/c68oE44WWFVmW0vCso1F5xU5qI31xe5D9yA7b+bEa25iPk6q8F
         ycSw==
X-Gm-Message-State: ANoB5plTAvxV04Qzoq7ThmpfPPzaJFojjxWFoT2+XYAdmSe/ERPTvPrc
	+7A0sjSfz0f+pn9pdgzVY8X5TJ5pmcOfuQftLvU=
X-Google-Smtp-Source: AA0mqf5HiV//s3zzLnCX7UHwhu6YKEmRBggzwyk/IFJtFfzOrrs1xLL37IWU76YGxhXZ6eV40lHMn7pBuEcTNsgO6Rg=
X-Received: by 2002:a2e:be8a:0:b0:26f:c081:9aed with SMTP id
 a10-20020a2ebe8a000000b0026fc0819aedmr29657099ljr.222.1670597004958; Fri, 09
 Dec 2022 06:43:24 -0800 (PST)
MIME-Version: 1.0
References: <20221031114719.2725967-1-alex@linutronix.de> <167d8dfa-fe50-24ff-d2d2-249df3445ae8@windriver.com>
 <20221207002040.GB1080@xn--80adja5bqm.su> <CANNYZj9_46SdQdVuwFQ-HosVB7X2QpG0PDYNybV+ZL2Xt1FS3Q@mail.gmail.com>
 <96c54599-b4b0-5235-28fd-41c71272c213@weidmueller.com> <CANNYZj8gX4ab+zOVN974vwL8UkJqO-gqkshxsdYVtPsHZfExfg@mail.gmail.com>
 <1de0c6c3-cd27-1c86-f515-f4510ddd36f2@weidmueller.com> <7f51955aada8f9e74322aa0ad15f21b9985d993d.camel@linuxfoundation.org>
In-Reply-To: <7f51955aada8f9e74322aa0ad15f21b9985d993d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Dec 2022 15:43:13 +0100
Message-ID: <CANNYZj-BDoPzV5qNLKafbr-0s7PLU2WCvmdA1OfZhW2qxqq1Gg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/13] cargo-update-recipe-crates.bbclass: add a
 class to generate SRC_URI crate lists from Cargo.lock
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>, 
	Alexander Kanavin <alex@linutronix.de>, Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	Randy MacLeod <randy.macleod@windriver.com>, Sergey Bostandzhyan <jin@mediatomb.cc>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 14:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174459

On Fri, 9 Dec 2022 at 13:01, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'd note Alex has another patch which has been sitting for months
> unmerged as it is in my "high risk" to the project category. I suspect
> that one will not actually merge but I need to find the time to explain
> why, right now it is more based on a feeling it is the wrong direction.

I'd be happy to be 'course corrected' on oe-setup-build, I personally
feel it does more 'guessing' than I'm comfortable with but I can't
figure out a better way to handle things. The problems it's aiming to
address are real, so it shouldn't be formally rejected without a plan.

Alex

