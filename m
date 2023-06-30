Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6F0EB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 09:46:27 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.8423.1688118378683320434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 02:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YiRDLMEq;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fa16c6a85cso2634828e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688118377; x=1690710377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FoZt9dBycngxL7yDzo3LGJC0DkbmYA8DTj8M6+J8TUw=;
        b=YiRDLMEqoafvcLUtEzipCgtxieWswFOxvY2A0reU6aCNLICtC3gaVcYIf+ToYVBEGl
         dGxv9UKjlkNGzsYQDa6T/MA84jUitfCIF7qzo4qOYt2d1Wt1kLDflqERH2+GdmqwZwqP
         RjRG0SrsJrb236pTZK3TeStKNhBOARhpACLho2C5bnxdt1NcYWSIGNEkTh9YvLOEFeGP
         BT+GEaXOl+m54/o0tumih8Ug8NQ7RKWqu5tiiwbckJOQs+pqjZC2vKB5S4Tj4hYHbFih
         IYpK/yT5kSc9NLmhUEz03G8pcxxkni1/X/qr7tLeN6tq6GmZVCOwIHAr+oLp/FOCXSZP
         2Ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688118377; x=1690710377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoZt9dBycngxL7yDzo3LGJC0DkbmYA8DTj8M6+J8TUw=;
        b=Vdp++TkVyAjy0TLUGyuKeeIhriyeD43J9hKIBUSIVE5nrHSjb8AVfkSaPRZfv14QV5
         h7bVAJpgZWSLxqafpan9dYRnz6VFIY39VY9l1REVJhUT9TcpGbB9YVQqJOm02G/nvASp
         v/wBxtTsvJy95ZuRSFkasvcdHmgLQWgFpwzfsxfgyy/yGu99hlA3QM5QF/JU4CkhSW9J
         AomaLgqRPk3OZGNJl6ynt8b+MrJNWtXP8OaIKlrQArk7cnvR3g6DzWLQmDK4gpmw8QOm
         HmiuJRL5x3BqErvr5AgiJwp8CxURr6o/VmU6KCwFFNV8BJlg7KvBS1sZGrnNtDDjYQWB
         JurQ==
X-Gm-Message-State: ABy/qLZyxTa4pFdUB1uNLBdElqqlR/DoGx72gqwh5P3Vg6cCBmDW7SKX
	YDOLBK7uG2P6TMhkNTRKOGZdc+50YzoDiSGhz6oy6H+ZAQc=
X-Google-Smtp-Source: APBJJlHKX/3wyu8oyahAr9tOErqybP+O9Oe81xOEDQ0GmuG6RgwqXVuJTlFRK1WJRPMM1F89L3zv0el0ZlpNWynkiKI=
X-Received: by 2002:a05:6512:acb:b0:4f8:661f:60a4 with SMTP id
 n11-20020a0565120acb00b004f8661f60a4mr2025890lfu.41.1688118376342; Fri, 30
 Jun 2023 02:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230629141836.3431391-1-ovidiu.panait@windriver.com>
 <20230629141836.3431391-4-ovidiu.panait@windriver.com> <CANNYZj_WmTwU_6HFL3=drWrepbXu3k6wxmkwzNawDV8_75m2kw@mail.gmail.com>
 <40e1fada-5473-47ab-541b-7d4894c0847c@windriver.com>
In-Reply-To: <40e1fada-5473-47ab-541b-7d4894c0847c@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 Jun 2023 11:46:05 +0200
Message-ID: <CANNYZj_W95VkdHC8avzSZAejQ4tzqWoUJr-W0NdXu1ja6jzXEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] mdadm: skip running known broken ptests
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 09:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183691

On Fri, 30 Jun 2023 at 11:17, Ovidiu Panait <ovidiu.panait@windriver.com> wrote:
> > Thanks for working on reenabling this. mdadm is currently taken out of
> > ptest lists because
> > #    mdadm \ # Tests rely on non-deterministic sleep() amounts
> >
> > Is this resolved, and can we re-add mdadm to SLOW or FAST lists?
> I did multiple test runs with a qemu-x86-64 image and kvm and the
> results seem consistent - always ~12 min per run, no failures:
> # ptest-runner mdadm
> ...
> PASS: /usr/lib/mdadm/ptest/tests/21raid5cache
> DURATION: 724
> END: /usr/lib/mdadm/ptest
> 2023-06-30T08:37
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> I think mdadm-ptest can be added back to PTESTS_SLOW.

Cool, can you make a patch for this please?

Alex

