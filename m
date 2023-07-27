Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A1EC001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:28:50 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.8793.1690468125184698281
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gVHJotxW;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fe04882c66so1819012e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468123; x=1691072923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9KyT6PbDSuWdSFToUz/D3fOB9xULBBgIaTtluNEubmU=;
        b=gVHJotxWfhKp9/IA+azyRM33H2KaI2t1wNoUpMoEbW4G3QIsufQaHvPed9kTLjLZQW
         LQsYuIsSXKNKpH5TSoLvQN2K8x52wd/MgYvysYRR39eetXYTc5AG1MuzvOwIaTGl+UOj
         KTZkKcKOyxgggdAKi8VY5mdZrFeJL5a8KzdeIYmLUkZwEcJExvU7sOBHmdLdCaf9pSLx
         yI2ixOxy4zubyHhpuNuQgKWb5dKW8FnzcPXRnw2duwK/96ZvNjtqESTB6GvdC2guMTBK
         iIPGwZmyW8NzFacsyGvgB5F2MwxGOYFs/jXtxGqDlJUn7piJEBXSSOQU4hvy1PHnpP81
         InIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468123; x=1691072923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KyT6PbDSuWdSFToUz/D3fOB9xULBBgIaTtluNEubmU=;
        b=QVrkd+64QX1/BTu0op1NMK0Bxn9EoqE+2hprL89D47OBtWKuaGrurDUuHu8uzGO0ya
         XOSV8y9X7gT0+RzRwK8sqfARG/O58EMJegkkfDhAPh1skmModu9DnGItOE/o36a7oCjY
         F6dhcoxXXQSiNfkEhyLcxa076jB9fdCcB7wuX8NozNWvnTfpWe14/SvkbPORSdLJb2fc
         I/PB2AEE9AeU5Sy/UeEVU7cpRnNksY3VXrRAQbtefB15ryzWh5Kxz8uwLvNEXUDPz8kI
         gNPicO2VRcJ6AMl/XrUgM4nC57UUFw+hAkXUHyIXDRyX03hjbf+OhnHgwUcMayc5d1fA
         aBHw==
X-Gm-Message-State: ABy/qLaC/ZJAuYj+N+N8TC+St/dwE0uNJvgoadn/9tZyrbw1HUAxDqol
	8lA5Biu3VL9D1bB06Tn02Jc34iaXKZkpuWiEhow=
X-Google-Smtp-Source: APBJJlHNaU0PqbL/2VYLWbU+ufOmxZ2preP8BEfVCmYcNjSYmwOLQbTDaMGoLYR0Rz6BIQVt/ysLCG4Y+PUUleNrTFw=
X-Received: by 2002:a05:6512:33c9:b0:4f8:5ede:d452 with SMTP id
 d9-20020a05651233c900b004f85eded452mr2058861lfg.55.1690468122956; Thu, 27 Jul
 2023 07:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230721142543.246415-1-jstephan@baylibre.com>
 <CANNYZj8tCEDM51XrCgfUfMu0ExJqJEwQ7=vU+4e7vrRqdpsKCg@mail.gmail.com>
 <b7qoln53fio3pwdngj2god5iy7lemvh46pys43lfewimdyfgam@d2vfmfbti4q6>
 <CANNYZj_4GRz3j20Mc5wow2fpgHyhoTRsuwnYyHe6yiwnQM-vvA@mail.gmail.com> <ythwlmw5z74zvdz5csmmccksb4jmcyjckthqn6qhl2m27tisan@w3ng7x7q2gy6>
In-Reply-To: <ythwlmw5z74zvdz5csmmccksb4jmcyjckthqn6qhl2m27tisan@w3ng7x7q2gy6>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Jul 2023 16:28:31 +0200
Message-ID: <CANNYZj9iZVZ8qunaPQxLCk8x3MiVFEhTbr2i=hO=U138EmwHLg@mail.gmail.com>
Subject: Re: [OE-core] [RFC v2 0/2] Add bblock helper script
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184939

Sure; if you can write a script and show it here, we can figure out
where to place the test officially.

Alex

On Thu, 27 Jul 2023 at 16:15, Julien Stephan <jstephan@baylibre.com> wrote:
>
> On Mon, Jul 24, 2023 at 10:36:28AM +0200, Alexander Kanavin wrote:
> > On Mon, 24 Jul 2023 at 10:25, Julien Stephan <jstephan@baylibre.com> wrote:
> > > > Thanks for working on this. Should we think about how this could be tested?
> > > Do you mean we should consider addind self test for bblock? or you want
> > > to discuss about acceptance criteria for bblock?
> >
> > Hello,
> > I mean mostly about what should be tested. How can we verify that the
> > script does what it's supposed to, in an automated way, so it won't
> > silently break as new changes to bitbake/oe-core are added? What
> > should such a test contain?
> > The specific form of tests (whether it's selftest, or maybe a part of
> > SDK testing, or something else) is secondary.
> >
> > Alex
>
> Hi Alex,
>
> I just send the v3 with a lot of improvements!
>
> Here is what I do during my dev:
> - lock a recipe's task for a given arch (qemux86-64 vs qemuarm)
> - modify the given task
> - check that for the selected arch, task is locked (but not for other arch)
>
> Maybe we need to be more formal with that?
>
> I would be happy to provide a test script if needed.
>
> Cheers
> Julien

