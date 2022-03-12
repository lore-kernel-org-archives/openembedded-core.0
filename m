Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A10C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 20:06:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8499.1647115609071952264
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 12:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=aA7QnTFA;
 spf=pass (domain: burtonini.com, ip: 209.85.128.49,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f49.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so7266296wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 12:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5EUud3D5EFSVeNg0yVXx6LKpj5M2IbxfrSj7s0fPQIg=;
        b=aA7QnTFAQlxeEfPIqb2kgvxGNbq1mSgPHLrIeELFpchP/lO9GUL2y7a64ooI/gkz3S
         xuRdcdUNj5fzj8AQlBm3PiVqV6HE9T41XoMJE+GYj5rz3eZ0Gzo8YqvBHlyb4XXyMv0H
         ldEcnAquA1IhqxMtnAF8sXz6jscHPS7tuRLUgHOwxGVb/CXTZtPn84rGMlta6OjUTe5I
         WDhlquP0ZmIt4sZZHbizAF1KzA8fW0UlUQP7z+llwJT5/nlHwI8yxCDeX3bLIrBMsRP/
         ueMsWMK4/gs4QVoXbwOxi9ZXos0CGM7KWys5U0SxtV5Pt7MJmF+Pcvi69/ahHFVMjaGa
         D+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5EUud3D5EFSVeNg0yVXx6LKpj5M2IbxfrSj7s0fPQIg=;
        b=ULYyBjGI3WtC7vLca8m0TS86S9KZa3FWT5YD6iCoMjYOsDD0+4FhRWrLDwIBTieL5F
         ulmxgYHImrupR3dQHK2MA7GHQ0tauw/J+ui5VahuKwUapjID6RgnYGTxfR6jMtDhcLgX
         DuJwoQcS5OrkTACG8s3u5eh6Ndt7hMVecpJLsth6vdBwlq6MXQNNgwh/Iog8zuIczXAp
         uXMii8S6PDmqqWwPFF2yNu3ZPWYcE9dMdSP+hrWULKBk06p2V5Dw/y52ZDNlrAYiqejQ
         CmKOLmjZk7T3A8NXu3CS0Z3BsR3Ds56bY/3mVMpyhKnL8+6ExdyUprZXQ1VfMuZFfMpW
         miuQ==
X-Gm-Message-State: AOAM532gDw2/agX2EO2iLX5KVnJCjJYt6ee2oXBprqu8z01TZMcTOOeL
	KAvFhZkPHWo3BCZwTN7lUNKVwk9QXLe+ApmDv2XpFg==
X-Google-Smtp-Source: 
 ABdhPJx7kUraQg3FqMy25Y4TBcoQHgdyLPkG4/PHxsjAs/VjiU6zXOUzwtnil8UG2C/Fv34DgpH3TQf5YGdhbycZIHQ=
X-Received: by 2002:a05:600c:4b86:b0:385:2800:2915 with SMTP id
 e6-20020a05600c4b8600b0038528002915mr20988638wmp.117.1647115607422; Sat, 12
 Mar 2022 12:06:47 -0800 (PST)
MIME-Version: 1.0
References: <20220311171206.41094-1-ross.burton@arm.com>
 <CAMKF1so=5Nf=-trZpcH8XNoFgduw0KGZgO_Z5J6jDs4scWgwnQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so=5Nf=-trZpcH8XNoFgduw0KGZgO_Z5J6jDs4scWgwnQ@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Sat, 12 Mar 2022 20:06:36 +0000
Message-ID: 
 <CAAnfSTsbS0FR-fHONtTG_QV-bFCwWkV7JoQy40PxXPkjSFxNFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python_pep517: move PEP517_SOURCE_PATH to
 python_pep517
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 20:06:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163100

Sorry, I should have sent the meta-oe fix, but I know it's not easy to
say "only merge this patch when these in other layers have merged", so
I tend to wait and then post.

The patch you sent was only half of the fix, I just posted a patch to oe-devel.

Ross

On Sat, 12 Mar 2022 at 16:41, Khem Raj <raj.khem@gmail.com> wrote:
>
> seeing this
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1517
>
> On Fri, Mar 11, 2022 at 9:12 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > Now we have the start of a PEP-517 base class, the PEP517_SOURCE_PATH
> > variable can be defined in there instead of the classes that use it.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/classes/flit_core.bbclass             | 3 ---
> >  meta/classes/python_pep517.bbclass         | 3 +++
> >  meta/classes/setuptools_build_meta.bbclass | 3 ---
> >  3 files changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbclass
> > index 1ef8ce9429..5a602f54ab 100644
> > --- a/meta/classes/flit_core.bbclass
> > +++ b/meta/classes/flit_core.bbclass
> > @@ -6,9 +6,6 @@ flit_core_do_configure () {
> >      :
> >  }
> >
> > -# Where to execute the build process from
> > -PEP517_SOURCE_PATH ?= "${S}"
> > -
> >  # TODO: ideally this uses pypa/build
> >  flit_core_do_compile () {
> >      cd ${PEP517_SOURCE_PATH}
> > diff --git a/meta/classes/python_pep517.bbclass b/meta/classes/python_pep517.bbclass
> > index 76660e70f8..756333bcf2 100644
> > --- a/meta/classes/python_pep517.bbclass
> > +++ b/meta/classes/python_pep517.bbclass
> > @@ -3,6 +3,9 @@
> >
> >  DEPENDS:append = " python3-pip-native"
> >
> > +# Where to execute the build process from
> > +PEP517_SOURCE_PATH ?= "${S}"
> > +
> >  # The directory where wheels should be written too. Build classes
> >  # will ideally [cleandirs] this but we don't do that here in case
> >  # a recipe wants to install prebuilt wheels.
> > diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/setuptools_build_meta.bbclass
> > index 424be85608..8791a2965f 100644
> > --- a/meta/classes/setuptools_build_meta.bbclass
> > +++ b/meta/classes/setuptools_build_meta.bbclass
> > @@ -2,9 +2,6 @@ inherit setuptools3-base python_pep517
> >
> >  DEPENDS += "python3-setuptools-native python3-wheel-native"
> >
> > -# Where to execute the build process from
> > -PEP517_SOURCE_PATH ?= "${S}"
> > -
> >  setuptools_build_meta_do_configure () {
> >      :
> >  }
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#163067): https://lists.openembedded.org/g/openembedded-core/message/163067
> > Mute This Topic: https://lists.openembedded.org/mt/89715331/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

