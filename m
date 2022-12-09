Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DFEC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 14:58:44 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.3368.1670597921172089086
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 06:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RnqFhPn+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id f18so5461245wrj.5
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 06:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cfmx2lU0Vyocxgh672RGObg4ikgMbdwHM7UJTZyrl/4=;
        b=RnqFhPn+EvEJRru6Lssf7XVc1FwtnvmQOh1xg8gFYI4qwKf+AapUaz+9pdGHrrerKK
         01sqOFBaQR4uWnfgTcwDRcXujNFYvLsq0xNZ7Mp0NGvBTkDiOpmTp18No+wGIl6cQu89
         TmiobVVQt8eOKNl+t0suFjCQ8BMHvuJbEM9iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfmx2lU0Vyocxgh672RGObg4ikgMbdwHM7UJTZyrl/4=;
        b=X0sHo85PX0LWiEt9wLLHLhGnJjycr3ATmEQAxT8Qdce+LfSk2vGVk9If3fYNeloPWR
         5zOjjlcOUpjsNXnKtKlJ1sWx1cT6K5TkFxCF9x7teKdsmz7Txydsxa34CPIc0UFArhwx
         Tx6p+2x2yF6csjgX+XN/e1x477JgnQLvKEdefIbOUHpEPPIMaeHtQcJ3JT49xR5oU3dc
         iCaYyGtr/KQFE20F19b78O5GMnry8o46aL1Ep8N+HCnXcWLs+Z+yuCsgkZdIX79xFYJH
         qmPm1/z/E26EXPiUngCbzPugsIGSGTGFCSO5mgXwwK7H+KBEageEqqMKxV8pqEM0eJvn
         pb9A==
X-Gm-Message-State: ANoB5plm+oN6xlVplRYpeFtLObB83gECVJeWtEMMg3S32NoryHCvfd13
	FHKf/G8s+RY0vMUN1d6CUQ6L5A==
X-Google-Smtp-Source: AA0mqf6gdfeDHuZB3OWny0fQie3Fj4NYNEftXeG6aL7YvX/7YM6zpXQaEqDe6SKH/r9pLFfkmjKJDw==
X-Received: by 2002:adf:e283:0:b0:238:5554:42f with SMTP id v3-20020adfe283000000b002385554042fmr3867854wri.41.1670597919520;
        Fri, 09 Dec 2022 06:58:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b77:8930:5aaa:e9c4? ([2001:8b0:aba:5f3c:9b77:8930:5aaa:e9c4])
        by smtp.gmail.com with ESMTPSA id x1-20020a5d4441000000b0023677081f3asm1578424wrr.42.2022.12.09.06.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 06:58:38 -0800 (PST)
Message-ID: <b146c277ab5fc2aeb6c2654b46b868b1bd8f6c00.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/13] cargo-update-recipe-crates.bbclass: add
 a class to generate SRC_URI crate lists from Cargo.lock
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>, 
 Alexander Kanavin <alex@linutronix.de>, Michael Opdenacker
 <michael.opdenacker@bootlin.com>,  Randy MacLeod
 <randy.macleod@windriver.com>, Sergey Bostandzhyan <jin@mediatomb.cc>, 
 openembedded-core@lists.openembedded.org
Date: Fri, 09 Dec 2022 14:58:37 +0000
In-Reply-To: <CANNYZj-BDoPzV5qNLKafbr-0s7PLU2WCvmdA1OfZhW2qxqq1Gg@mail.gmail.com>
References: <20221031114719.2725967-1-alex@linutronix.de>
	 <167d8dfa-fe50-24ff-d2d2-249df3445ae8@windriver.com>
	 <20221207002040.GB1080@xn--80adja5bqm.su>
	 <CANNYZj9_46SdQdVuwFQ-HosVB7X2QpG0PDYNybV+ZL2Xt1FS3Q@mail.gmail.com>
	 <96c54599-b4b0-5235-28fd-41c71272c213@weidmueller.com>
	 <CANNYZj8gX4ab+zOVN974vwL8UkJqO-gqkshxsdYVtPsHZfExfg@mail.gmail.com>
	 <1de0c6c3-cd27-1c86-f515-f4510ddd36f2@weidmueller.com>
	 <7f51955aada8f9e74322aa0ad15f21b9985d993d.camel@linuxfoundation.org>
	 <CANNYZj-BDoPzV5qNLKafbr-0s7PLU2WCvmdA1OfZhW2qxqq1Gg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 14:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174460

On Fri, 2022-12-09 at 15:43 +0100, Alexander Kanavin wrote:
> On Fri, 9 Dec 2022 at 13:01, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I'd note Alex has another patch which has been sitting for months
> > unmerged as it is in my "high risk" to the project category. I suspect
> > that one will not actually merge but I need to find the time to explain
> > why, right now it is more based on a feeling it is the wrong direction.
>=20
> I'd be happy to be 'course corrected' on oe-setup-build, I personally
> feel it does more 'guessing' than I'm comfortable with but I can't
> figure out a better way to handle things. The problems it's aiming to
> address are real, so it shouldn't be formally rejected without a plan.

Right, I do need to explain why I'm reluctant about it and what the
concerns are.=C2=A0Sadly doing that isn't straightforward, particularly if
the bar is set to the height of "show how a better approach would work"
since I then have to think through a new design before I can reply.=C2=A0Th=
e
challenge with that patch is that it uses a very predominant namespace
and can't easily change once we take that direction so that makes
merging much harder.

My point here was that patches from everyone are treated fairly, some
merge quickly, some don't, it really does depend.

There are also patches from some guy called Richard on the bitbake
mailing list which Richard is refusing to merge due to performance
concerns :)

Cheers,

Richard


