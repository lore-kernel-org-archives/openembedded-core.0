Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549C4CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 11:34:14 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.49014.1695036849496752137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 04:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LHrZ/8cR;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so69641751fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 04:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695036848; x=1695641648; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=49K2qEzCqvF51YEjlw3bSiktZJiJXzEmTzx+JIJXYuk=;
        b=LHrZ/8cR4PVSVElqfYZjnW378OoLcT+kX0iTthRUfkWpw3UcC0LzVaRjqZLRrkHtxC
         vLrvkQo7EE2KCy313mL66Zfi6GcYCUkljCt8eJdrA/kpqP9dQ0yGx+nVsn3mHt1Q4Sj2
         bNQtkO6CfpMxMKUQPCIhJW9JH3djfhtgU6SGVgpE+1euLRl7El0atpUDmszGsyhKiPIs
         kqRMDWYioUfr4lHYTIxeTnuDo4HeGoHaz5RQTLkJChrOi/1SFwdSKCxGAFyHi8tOWC7+
         wRwmTMImdflPwInJuZ/Gm9q6Mgau/VIYgI78KrGSGmwtJYA8SUzdTQroitun3ByGcMPK
         AnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695036848; x=1695641648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49K2qEzCqvF51YEjlw3bSiktZJiJXzEmTzx+JIJXYuk=;
        b=eh46L7cHdOTwxwEBUqvDtC/8yU9G9FOce0iQOUdBRWvt0Bd7v8ZjUN6tRN33FWpnPo
         FD/KZoDO3hO8//lzPDjx4U4vJmo7HrbJbWf6jqM/TVwB/OJpBLZDbgyIKzWpbZjYIlQ+
         HqTeV5U1L0+dtWPWBVcKyGVDdFSMloleuyhkTlcbNLKJEjT76wosdt+Y9qafzZUFBR15
         jL/czR9N64kJniOYXJJhkjg54YmSiuN2klr9XjWeyqpTEkbmdAaoxJLN6HckuZB02N9+
         FJzkhBR2Z4jdbu+JMGJ5i0hhKs40bhQBLMn4sUD39eI18pGrB0pw+rxauEFA6xoTzCQX
         wTCg==
X-Gm-Message-State: AOJu0Ywo2dtSCYvF5oeO9cv5zDKAPS87S5r7hkUI8TeEPy3YQOdYOa/d
	dKHPgZhXwwxL/POCXoDq/Mu1A5PiV97zKWqaV9o=
X-Google-Smtp-Source: AGHT+IH7SGelAU+0sb+FGeFsh+cGmTK9D0MlyhyMNJN4bs61KZbtobtAgVrQwj87WGLsTky3nzCnVAngVwHrBrTgLUY=
X-Received: by 2002:a2e:a226:0:b0:2bf:eebb:7f3 with SMTP id
 i6-20020a2ea226000000b002bfeebb07f3mr4017670ljm.34.1695036847261; Mon, 18 Sep
 2023 04:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230917182829.2153680-1-f_l_k@t-online.de> <64a23553aec159f4d506efd799eca893c7d9f25c.camel@linuxfoundation.org>
 <DKI61S.U4D11V8BDTPG3@t-online.de>
In-Reply-To: <DKI61S.U4D11V8BDTPG3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Sep 2023 13:33:56 +0200
Message-ID: <CANNYZj-73pCe_yRamvNM=9U2sGdv+ty9-QO8g=5QVkPD9crmdQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/4] libxmlb: import recipe from meta-oe
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 11:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187825

You need to first check (with kvm) how long the tests are taking (and
that they pass, obviously), then add to one of the lists in
ptest-packagelists.inc.

Alex

On Mon, 18 Sept 2023 at 13:29, Markus Volk <f_l_k@t-online.de> wrote:
>
> On Mon, Sep 18 2023 at 12:24:40 PM +01:00:00, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>
> (and I suspect warnings from other targets will follow)
>
>
> yes, I noticed that too. However, I couldn't decide where it had to be entered and whether at all. That's why I left this question open
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187824): https://lists.openembedded.org/g/openembedded-core/message/187824
> Mute This Topic: https://lists.openembedded.org/mt/101419208/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

