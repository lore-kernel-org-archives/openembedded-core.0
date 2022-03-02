Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2347C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 08:49:46 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web08.5342.1646210986133880496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 00:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p4xC/tEc;
 spf=pass (domain: gmail.com, ip: 209.85.221.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id j9so514786vkj.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 00:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qIuZm6yPMwuppheRDrfiU7pLbC0CQIK3uot6775NOsk=;
        b=p4xC/tEcRj4d9jItB2bxH3Wj4v8ge0ONniLb68xqrwC52yYUlqNWAjoqM5UAZHu1aw
         YwIuEbdN9As5H0yFXKMxcZfsw/flSDDuQf3HRPcMT2yTbMYQLVhySSspAoN4fTtt6alL
         B+JC61i8etz33X5L+Q9u36fqGXgmiTe8eaqrcDAWt5+NHY8RYr5VKOoo2wZylAmYSf/E
         +D9qhrxTW6iUGID086QojNfvlUsp21OlXJXQVyqDbYTlO0E8x0UQBnW4tM4n60AIYSi2
         kflqa7JwyaD/S6Os5BB4i0KZCFNjY09FnW5hWhmIYBAJYzc3EP55TqZvSdG6OaU75Byl
         6cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qIuZm6yPMwuppheRDrfiU7pLbC0CQIK3uot6775NOsk=;
        b=HzlZgjM/jTJf8vIN1/PhsXosS8C7SYnD7O10yOkGp+BFWTxiwTqH2M+T4aRvxVTR36
         jT2udiHVgAQS2PjtVj7t946kj2GL1CXPn+UxJmYgXfP2LRN5xeZd234kyGaMquxEbcmO
         Wf360jEVX8RU/K6TjYJBEzW0VbqhM7eWlS4QuQ9G91s3W38WZKrGXrPa5W1IL8fa24b+
         VIBElCUKGE+RqgJBDItvFgl38NA+SsxR5eSdwb8JKlRBFuIwGE91IGfGmgv5+z2io9KX
         wIbLzgxrjsyUmLQvvgMnT+gYbx56saxFRms/lANKmT8J6VQAnbYOZs7R2SYZzFEtIthw
         oNFQ==
X-Gm-Message-State: AOAM530Ev7S8G40fXamBGs/8Z1Gox+5UrXzqzBZCA0G+FcwbHl7nv+/2
	xECY65FteT2D8Nip1ZPJYdDtIvPkUEGyXhdguI85rBCn
X-Google-Smtp-Source: 
 ABdhPJyj0XhuJyG+kuURuaghWx0y1v0ZvO/dfYaW4TfgfB5xbDNRbp/0h282vCC46jHb4/AFEBsoQYuVaJg0SQA20zI=
X-Received: by 2002:a05:6122:20aa:b0:32d:4894:f680 with SMTP id
 i42-20020a05612220aa00b0032d4894f680mr12979088vkd.1.1646210985225; Wed, 02
 Mar 2022 00:49:45 -0800 (PST)
MIME-Version: 1.0
References: <20220226150217.2793953-1-alex@linutronix.de>
 <DM5PR1101MB2361B9D94AC7EB2CD305BB79B9039@DM5PR1101MB2361.namprd11.prod.outlook.com>
In-Reply-To: 
 <DM5PR1101MB2361B9D94AC7EB2CD305BB79B9039@DM5PR1101MB2361.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Mar 2022 09:49:34 +0100
Message-ID: 
 <CANNYZj8BAD1kmETB_UfEY=420wGuttUzAuNYFF+s8XG0cA9QDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] sstate: do not add TARGET_ARCH to pkgarch
 for cross recipes.
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 08:49:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162599

I just ran this locally, and it passed - probably caused by a different commit?

Alex

On Wed, 2 Mar 2022 at 08:24, Lee, Chee Yang <chee.yang.lee@intel.com> wrote:
>
> Need to update selftest too?
>
> sstatetests.SStateTests.test_sstate_allarch_samesigs
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3234/steps/14/logs/stdio
>
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> > Sent: Saturday, 26 February, 2022 11:02 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Alexander Kanavin <alex@linutronix.de>
> > Subject: [OE-core] [PATCH 1/2] sstate: do not add TARGET_ARCH to pkgarch for
> > cross recipes.
> >
> > This is redundant (target arch is already in PN), and breaks compiling a cross-
> > canadian toolchain, as that needs populating the sysroot with two different
> > native-hosted toolchains built from cross recipes. Inserting TARGET_ARCH
> > allows only one or the other.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/classes/sstate.bbclass | 3 +--
> >  meta/lib/oe/sstatesig.py    | 2 +-
> >  2 files changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass index
> > 787172b408..dc9a2c085b 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -83,7 +83,6 @@ SSTATE_ARCHS = " \
> >      ${BUILD_ARCH} \
> >      ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
> >      ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
> > -    ${BUILD_ARCH}_${TARGET_ARCH} \
> >      ${SDK_ARCH}_${SDK_OS} \
> >      ${SDK_ARCH}_${PACKAGE_ARCH} \
> >      allarch \
> > @@ -138,7 +137,7 @@ python () {
> >      elif bb.data.inherits_class('crosssdk', d):
> >          d.setVar('SSTATE_PKGARCH',
> > d.expand("${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"))
> >      elif bb.data.inherits_class('cross', d):
> > -        d.setVar('SSTATE_PKGARCH',
> > d.expand("${BUILD_ARCH}_${TARGET_ARCH}"))
> > +        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}"))
> >      elif bb.data.inherits_class('nativesdk', d):
> >          d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${SDK_OS}"))
> >      elif bb.data.inherits_class('cross-canadian', d):
> > diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py index
> > abcd96231e..2cf858e201 100644
> > --- a/meta/lib/oe/sstatesig.py
> > +++ b/meta/lib/oe/sstatesig.py
> > @@ -443,7 +443,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname,
> > d, multilibcache):
> >      elif "-cross-canadian" in taskdata:
> >          pkgarchs = ["${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}"]
> >      elif "-cross-" in taskdata:
> > -        pkgarchs = ["${BUILD_ARCH}_${TARGET_ARCH}"]
> > +        pkgarchs = ["${BUILD_ARCH}"]
> >      elif "-crosssdk" in taskdata:
> >          pkgarchs = ["${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"]
> >      else:
> > --
> > 2.20.1
>

