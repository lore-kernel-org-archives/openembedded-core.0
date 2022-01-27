Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CEBC433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 17:59:49 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.1419.1643306388501334514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 09:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=duYD+62w;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id k14so3137489qtq.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 09:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qa5tAA5PpvQreaDtLcuu5nuYsFsv6jgOvyOBl5XMGTo=;
        b=duYD+62wr55t8lJ/hcjYRpLhDOrqQC25aRHBGXEgZml1K+VWiY5aEmu4WFT+2NHUl2
         0AvTwJ+eGSZ41V6mWAT79hpm+0EgJ/chC4XLHOjGgVwFUbuzdMqv6voqy0yZ0iIYSELz
         5BU3RuxsNEAovBccuMwxYtP1OYq9shHMgZwbPXM61ugepZOixFuSGtB7haB7XGwGq/i0
         Bf78a1+xbUrnfgDxfFQMbaBqywu3NY0pgg1Wcfho22olOzIKO/M9xbcLsT6dtrgyksVW
         W+exdF4/zAmaZ5AFJOTA8Yoh4mpS10Vde0Jzsp2PgjBCo2f9I3xqQPnapyxNdzLnHGzx
         3roQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qa5tAA5PpvQreaDtLcuu5nuYsFsv6jgOvyOBl5XMGTo=;
        b=HBttIatlI+W1Jo/Ek+SqrGXcUv7pPpkCo0eGhdnIh6eqlYK5Le71Ac4WoLiTuHaYSR
         evzCzIclmddfubN1IBFnv+vhccnB7FV3TgDlWjjMigz8R4Qqfzt3bOTbOqc3a5TB7MVM
         IRvk+AQkmhaFbUKO5cp86+LNW1yr6Pv0PGob5WBMMAl91RxXAM1mNpXQrZEzIoUn+9wg
         V9dbgIqjDT3XujynWl2z/oH4JSuwzlkk9qAZ5VpE2dKeoDfv59UH7/BXBdO85iG0VAo6
         7USE25IxEqWNQ8VnJARmHRZ1JSj5dRaiVpYn8j3mtoU80kKR3QCbArnhVLAp/mEjdcia
         6PiQ==
X-Gm-Message-State: AOAM533uv4c8qE8OBIvGX/1mVENK6tF5okmR65EF7SHvuZugiWPqkpyJ
	56CSQESmHoKgIvUUMURU+uSkLF9OaYoWLz2MkjE=
X-Google-Smtp-Source: 
 ABdhPJx55fT9yYFsTS5wHJNlyRk5PJ4zapD4LxcjXcb7ujdb4CgrwwOX90eLZM/e8XerQAs94aF+lUrEAErXwUG52wk=
X-Received: by 2002:a05:622a:15ce:: with SMTP id
 d14mr3765813qty.330.1643306387471;
 Thu, 27 Jan 2022 09:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20220126044142.2409754-1-raj.khem@gmail.com>
 <f94b3d48518c00276d36321d76ecc1b27019f0ab.camel@linuxfoundation.org>
In-Reply-To: 
 <f94b3d48518c00276d36321d76ecc1b27019f0ab.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2022 09:59:21 -0800
Message-ID: 
 <CAMKF1spdssgQrsO0_bRuPN4B_Fepd7FYwsir+b6fO-Hhyj2UzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ruby: Fix build on riscv/musl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 17:59:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161043

On Thu, Jan 27, 2022 at 2:03 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-01-25 at 20:41 -0800, Khem Raj wrote:
> > This fixes a build issue that started with 3.1 upgrade
> > Fixes
> > > ../ruby-3.1.0/vm_dump.c:916:38: error: use of undeclared identifier 'REG_S1'
> > >         dump_machine_register(mctx->__gregs[REG_S1], "s1");
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...ine-REG_S1-and-REG_S2-for-musl-riscv.patch | 30 +++++++++++++++++++
> >  meta/recipes-devtools/ruby/ruby_3.1.0.bb      |  9 +-----
> >  2 files changed, 31 insertions(+), 8 deletions(-)
> >  create mode 100644 meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
> >
> > diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
> > new file mode 100644
> > index 00000000000..8821325c0fe
> > --- /dev/null
> > +++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
> > @@ -0,0 +1,30 @@
> > +From dfb22e4d6662bf72879eda806eaa78c7b52b519e Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 25 Jan 2022 20:29:14 -0800
> > +Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
> > +
> > +Upstream-Status: Inappropriate [musl bug]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Is there something open on the musl side to resolve this?

I have discussed a potential patch on musl IRC
https://github.com/kraj/musl/commit/383656460aa3f2ad1e7b66762f5a7d1949d419b7

the feedback is to include complete set. I dont want to apply half
cooked patch to musl in OE
since it then becomes sort of API for OE, so until this gets fixed in
musl in whatever form, its better to carry the ruby patch.

>
> Cheers,
>
> Richard
>

