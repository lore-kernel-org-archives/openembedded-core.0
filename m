Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B6FC001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 10:30:09 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.58094.1691490604773642649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 03:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ulu9RZmn;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fe4762173bso9034033e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691490603; x=1692095403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xivsfQ7NbJlomPK7Dy94MzL0IQ95oJFmoesX/oGAavo=;
        b=Ulu9RZmnukTD9L1PKZh8vuT/2Zej8Q872nxEk6qqN+4uT16+InDkIYKq+JXiugrOxb
         NWwviDLsFuJ61KRo8f/2BbGchV+kqf6kFuPVEnDKXTxthh0+MVWibdrEVSsUKa4f9u+1
         SQ4f6+X33M1Wx2fusIzDoLBCFTErUA9ODG0MOllRV18t17pwB+xz2DyE5qAwNNpwAGxK
         Mx4RzvV+ks7+bf6Vzcw7NMrKryNwxHJPu8+pIQcBP7IMiwk5pBFqVnb5kKYSuJEpUwmI
         hfVwXwXQ4rkg9o2MixfJcpQBAMzsd7QQnYtEwXjPp/GZFkrXwbYS+MVq7VaE7EJBkNJu
         p2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691490603; x=1692095403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xivsfQ7NbJlomPK7Dy94MzL0IQ95oJFmoesX/oGAavo=;
        b=XtdL5NlELTK4qCtCaxuwquRJWexwQT+ziRCzVr3Gj8KZKML0s3Z0sK0lXGsTPEAyJM
         L+BylxUbwMK5GWV9SxYz58aq7aI3Af3Fb8mofyokOWSfGmewDml1UpWoN+N6IS6WoSS5
         aV3tfcG/4RgVnMBPmT/IziRK0SJfMsYtYBywt32NxgaMyWpW1/O7L4hkE04S7Jl1NPqH
         sIBuHCoq42+mNMKj/E+ba/IHv5tB2KwO1zmJn9wIBvjRxAJ6LCM3ZSLddRFP0X5/3p9l
         LOxlcLdHrhg4Vle1ElNM+L7omvkraUhJf4/QdsHc0GBGd1sZon/pECuzEzzWyMXuxHbh
         3Tyw==
X-Gm-Message-State: AOJu0Yw/CwyIPVR0GdjOJj2ilsWsnrpQBuI4dVELfAOMRBXSjoMYuOOm
	SvDpYvK2DM9oLGAOkKSVauiJpTJAL5wjx51Wow8=
X-Google-Smtp-Source: AGHT+IGZdxogCTrYZVhvi6wqV14aNd0H7ekIdAizImIFfnNJOtnqdB7ypLUpsNreNdRIOk49EaekZh4WPfNBJpS+MFs=
X-Received: by 2002:a05:6512:2347:b0:4f9:5580:1894 with SMTP id
 p7-20020a056512234700b004f955801894mr8457563lfu.15.1691490602643; Tue, 08 Aug
 2023 03:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <BL1PR11MB53994CAE41FD6DD380B2A385D30BA@BL1PR11MB5399.namprd11.prod.outlook.com>
 <CAMKF1spgyqxTC=dt_CmJZnFRLkqdzP6AkrWewKP4BCH23ahB-w@mail.gmail.com>
 <17778B3F05D2711D.2497@lists.openembedded.org> <BL1PR11MB53992D765F36FDF974C0F8E2D30CA@BL1PR11MB5399.namprd11.prod.outlook.com>
 <CANNYZj9N-zBbH6s44dLqu1NodLOogCdWU-LMAhUWfkaV52CJ6g@mail.gmail.com> <BL1PR11MB5399CA14E5ECA919EAC6B5E5D30DA@BL1PR11MB5399.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5399CA14E5ECA919EAC6B5E5D30DA@BL1PR11MB5399.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Aug 2023 12:29:45 +0200
Message-ID: <CANNYZj_JjQQXW_DiyxG7Hy1pn3Y5tS-cUjGGj+GNCQKga75RFw@mail.gmail.com>
Subject: Re: [OE-core] Python3-bcrypt fails for Power Pc
To: "Krupal Ka Patel -X (krkapate - E-INFO CHIPS INC at Cisco)" <krkapate@cisco.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 10:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185656

You are welcome. Now regarding your actual issue: what I would do is
set up an identical build for a different architecture that works to
successful completion (e.g. arm), and start comparing them.
Specifically:
- do the builds have the same things in their respective sysroots? Is
something missing?
- are the command lines the same? Is there something different in the
command invocation that ends in an error?
- the error is complaining about missing symbols. Are they present in
the build that works? Or if they are absent, why is the working build
not producing an error? Is it using some other symbols?

I hope you see the theme here: people will be much more willing to
help, if you position yourself, from the start, as a leading, active
participant in finding a solution.

Alex

On Tue, 8 Aug 2023 at 06:50, Krupal Ka Patel -X (krkapate - E-INFO
CHIPS INC at Cisco) <krkapate@cisco.com> wrote:
>
> Hi Alex,
>
> I wanted to extend my sincerest apologies if my previous emails came across as overly persistent or demanding.
> I truly value your insight and guidance regarding interactions within the Yocto community and open-source communities.
>
> I sincerely regret any inconvenience my prior communications may have caused.
> Going forward, I am committed to adopting a more thoughtful and respectful approach when seeking help and collaborating within these communities.
>
> Your guidance has been invaluable, and I am eager to apply it to enhance my interactions within the Yocto community.
>
> Thanks,
> Krupal
>

> > > Mute This Topic: https://lists.openembedded.org/mt/100499985/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-
> > core/unsub [alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

