Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F74EB8FD8
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 11:45:29 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.10838.1694087127587688450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 04:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Doj1MgMQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-501eec0a373so1348015e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 04:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694087126; x=1694691926; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6/VmE9wluMp49M8pTqea1AAzLSNsQE24KY7aO+0qNr4=;
        b=Doj1MgMQetmJ4juNZn2wguUNuEx5/Ue0PidIEyKgy4acwIrqM/BrnOecEmlwBu6NII
         di7eXC/Qk0td0XSiKDFBrKyx6BuC4oql3kNt36aymFQz4RanppUKyjOzOeSOjpw680ea
         WEAU/DbtUL+BgVNg8ea6hpLtMleQ/ARAazMMz65wHD2pHqcBDA4t23P2j8Eph5W3Icj/
         YKR8CVgtM6uxf4Zy8Wm6EWZ7qQQc47ZLFGLQRrKyfWiNQqGrs5XHs57uwN8RUX6y6QpL
         7nkAC0IpNWwhnVcWyypJFZPFvY/427u5QErXMIZUdEuIrvDzFd40jVU/Ppeul5fR9Aa9
         qHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694087126; x=1694691926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/VmE9wluMp49M8pTqea1AAzLSNsQE24KY7aO+0qNr4=;
        b=c1jnVkjngXKwxawX7R/zM4/6aYQcF7+fQymyX3S91u+4dryyd2082kTVk1oLvcbz0y
         7TQqse0DynUh/2sJE47MsG+8NWc8SMkuSNIH7CeQP/teWzDSM8I9h1kEd18GkAI8xYQQ
         0FCOm5hq1KapAq67TSdG8epfUavhVLOPKbijW5uLwPE5JR4clYUq/+5Pw02TLDe10iYL
         G7V/jDgran5vGSSFrgnAZWgHZ1AZTPhpJN9zP0spQk54QK11B50YP3SId81fhPzAvMBu
         i89SoL0AyTf9oGAa67XaSCQ4R3jox1P3m/frZiXp6TuI0QzV/ROA9l42MWY6ddDBVIwC
         rWyA==
X-Gm-Message-State: AOJu0YzKfB4P/s+J+101p8IHrnt4zpoX3XCHlVro4c+jWXh50ozNkNIq
	/cd1PleJxpsL18TxvgJsOEMsOC01mMBIfJJg/1QHQ7SF
X-Google-Smtp-Source: AGHT+IExyFRaKUtwPzYonyJup9HEIUTMX/mclUoi/Dkks9A/LA8nIgau9I9VMeiKVByBNE4rvbmv0y6FiMkEDBQPvuU=
X-Received: by 2002:a05:6512:291:b0:4fd:f7a8:a9f3 with SMTP id
 j17-20020a056512029100b004fdf7a8a9f3mr4606956lfp.38.1694087125415; Thu, 07
 Sep 2023 04:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230906165633.2382629-1-alex@linutronix.de> <20230906165633.2382629-16-alex@linutronix.de>
 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
 <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com>
 <781c93976fbd19e146ab2626a6202a0ccb23ab82.camel@linuxfoundation.org>
 <CANNYZj_RfCwHmt_TnUgdHeoTNdqMcX+f7aAzZ7e=MYSx+E-rXg@mail.gmail.com>
 <02407d75fc40487431a84d18b60476552083b1ce.camel@linuxfoundation.org>
 <CANNYZj_HBxGaz9c8X875fZ8rgPGD4MNCjv6mkANAiVZKD4vswg@mail.gmail.com>
 <ffda1a9441f4d6e947bb6aa383f5a1e2e2e0d39b.camel@linuxfoundation.org>
 <CANNYZj8zRk0SYzX-GYdwhSQGQidGrK1PT9mCH7LPeSp4ANERhg@mail.gmail.com> <e4706c56b8faab51081682ec06f1de645306f82a.camel@linuxfoundation.org>
In-Reply-To: <e4706c56b8faab51081682ec06f1de645306f82a.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Sep 2023 13:45:13 +0200
Message-ID: <CANNYZj8PfsZdgYjwUXEm2vy2wEqO2bksNSvDb02smLvMxiAoLw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 11:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187382

On Thu, 7 Sept 2023 at 13:18, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Crazy idea - can we statically link the shadow-native binaries?

Not impossible, but needs a bit of work - libbsd, libattr and libmd
all need to be made available in static versions (via resetting
DISABLE_STATIC), and shadow convinced to use them by injecting -static
into the linker flags at appropriate places. There's no precedent for
this in core that I've seen.

Alex

