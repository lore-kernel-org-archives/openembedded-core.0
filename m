Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12ECCC6FA83
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 15:42:25 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.12835.1664293335058350628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 08:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LdLxyeB8;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id h3so11414305lja.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=mpf4/esdMYHJmq8uSsAy/Dcw7zEHPaLLesGbA2oq7HM=;
        b=LdLxyeB85ysNdLFb8AUei9nl2axWE1mxochGXnlWb/to3ZvQ1AJJkRGM+f8/SCj0LS
         9AGUYaABxTc31isXM7oMzk/qCPt3c1M0rXzl/WBeHeRWBitKWBZ6erUC2U2yHd74M2ek
         dGhknhm6qvaEbR/3Na/MLHywt99E12tB41l2TBEUbiXCoDQhU+3OldS5hEDrN8FY/FCI
         yciDNVLvC+0c04Mwu6mV7+BtL/3SEovIW9jfCAKhy3xnhaYN4NCu6hk04xhABzzTBvkU
         MP2tS+ZUYdKTk8cZW8cHuGn6h7lCiQwd0Vt2sqQp5k9ISBRgYxVTeUV78ikg2BcbopTO
         aHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mpf4/esdMYHJmq8uSsAy/Dcw7zEHPaLLesGbA2oq7HM=;
        b=EB+mA1QuZZruvvJPrvylXgki8y7TCJOVyr0s0eL03zXpdmwU799LLE3cIkr11mVw64
         Q3Xe6REkEbJyggfY+15fsZBY/Irz4bHBt6OQ52ESroXaEHNodteoVdagnwuoyGEPFyo6
         IRKIBEXp4tQHM29aScSKv7OTDtuJMPLK/kZc/bawHoDd60fISYvW0/r/mVydNtKh4oQ4
         IN4AZCmevSBkW5KKzVSHHJ1E8l7tzdvHcCKtIVqa5rewWmMgMhZgZBxt/R7ImFMzEC/k
         UBeVZpmsb3HkS+V6tYPb1fzQak7zOstKME+PhKtZBTMQLllitBXrhz4h+cQ+pHjTlrub
         AqKg==
X-Gm-Message-State: ACrzQf27RJwF6ttiB+sfewL/RBcIFTHyLH3g27Tfsx7/f/6d7RPkDnGY
	6kNWHyoEoXqMUME1LC0nwvcFBaHug2NinYFfBjs=
X-Google-Smtp-Source: 
 AMsMyM5ALbG13HmZgrS5bWJjNLYwCDDVGbrL3vrnRgIoMDfxUGWJEYxQtW2vkBcqDMSDkPUdfMHdiv+R1HT8I4hQh+U=
X-Received: by 2002:a05:651c:104e:b0:26b:fceb:a526 with SMTP id
 x14-20020a05651c104e00b0026bfceba526mr9335604ljm.109.1664293333108; Tue, 27
 Sep 2022 08:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
 <6dbf0e264c68433a8aee1a772015c852@axis.com>
 <1718C14CEB633922.9698@lists.openembedded.org>
In-Reply-To: <1718C14CEB633922.9698@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Sep 2022 17:42:01 +0200
Message-ID: 
 <CANNYZj_rRJFsnOcSrkONYfmkZdUe1eCZKYcvnkpPj7jm7eVu+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 15:42:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171108

Now it's my time to rant at you, Peter. Brace yourself.

Let me just say this, you don't get to have expectations and
entitlements, if none of your '500 developers' are working fulltime to
help the core. I think you've been in the room last week when Nico and
Philip presented the numbers and the downward trend of who is doing
the work in core; what are you doing to address that situation, given
the resources your organization has?

We have a small handful of exhausted maintainers, I in particular have
to squeeze my maintenance work between fixing various customer BSPs,
and so it is on you to help us first. Otherwise, yes, I will say this:
fix your scripts, and stop complaining. I have a large amount of
manual recipe updates I need to do, because no one else wants to do
it, and so I will not be arguing with you anymore.

Alex

On Tue, 27 Sept 2022 at 17:29, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Tue, 27 Sept 2022 at 16:56, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> > Since I of course do not want for my developers to face this
> > error when they update, I have two options:
> >
> > 1) I can remove the old templateconf.cfg file in our wrapper.
> >    This means I have to duplicate the code in
> >    scripts/oe-buildenv-internal that calculates the BUILDDIR
> >    variable. It also means I will have to keep and maintain this
> >    code for the foreseeable future.
> > 2) Change the code in scripts/oe-setup-builddir so that it is
> >    not hardcoded to only support OE and Poky, but instead is
> >    generic and works the same for anyone.
> >
> > From my point of view, option 2 should be the natural choice.
>
> Three options. You can also instruct your developers to simply remove
> their build directories. Is that such a catastrophe? We do not promise
> that build directories stay backwards compatible and never explode on
> distro upgrades, we try out best, but sometimes they just don't.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171107): https://lists.openembedded.org/g/openembedded-core/message/171107
> Mute This Topic: https://lists.openembedded.org/mt/93847437/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

