Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266ADC433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 13:54:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.61307.1638194094552942655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 05:54:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=E4F7pNNu;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.54,
 mailfrom: steve@sakoman.com)
Received: by mail-wm1-f54.google.com with SMTP id 133so14726285wme.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 05:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zBCjUPmTpF1K4aMX1BZhn8tYmNytQBFJEJ784Tfty6c=;
        b=E4F7pNNuBIR/HkyOEwyOH7r58iejGV0BVXE/QJDZ4nHkqKYrMQN3rJGx3GeEWrdjMn
         deIyQwYroRz/4hI46fJhuyuEqPf8Jk4NpHJhd7mj2UM+OWQtDvV1R/7UqrOXP64eNYxY
         WSTeLO90/5GWlSjT1enDVNcbQRjMdIwgzgTw6x/YAhh/Fu3bz0fi+cuvyak+C41R/zHc
         FfG34yJ/DKAq3rjt95rRZcMYEHvxoEGPc7rZJywKIvjWoXIqrhLHZRKJct2ECe+xNmdS
         iZJPSFI2CVExOkIlcbhvftkWQSdmap5agqr6c1f4S+e6mND75/zV5gpqZCKWbU9jOVBh
         +hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zBCjUPmTpF1K4aMX1BZhn8tYmNytQBFJEJ784Tfty6c=;
        b=SqHPGV+mYKngR2o411hHaRHNGSjcSMiGAGnJgWAN0oNu6l7sjsjwsbg0fJelfwFLfc
         mApF7JdKztwYwHpgp81xLtwILFY5zi4j3b+Irjjld97b4X6JJhY1ueJ0hcuyl+SZOl1/
         LzhMIjS2rOmcuF+Ccog2MyRp/x1p3QnDiUQ8wg3eVOEsBSRu6hjm/EZrNd0gB0lzTa70
         /JpdMfvHCupz3zYONZWd8bzxei6lBZaxKh4+pVObEWylC8SIdaw7pke1auwhjgZi0IFf
         hr6IlikDMmqy33tpHNi/bJxA+ez3ipT2LIvZg/Lcqw8JpFRyVDtz8G1jSG1ZwQ5xPfaq
         9tIA==
X-Gm-Message-State: AOAM5306nz9XWYdNsJ0sG+Lso/ye8b8t849BUZh3vY6nlaaVoOmQ3F3b
	5JERtuCTOXt8yq8960wB9qBuzsWgLKqBW8l21wDuRQ==
X-Google-Smtp-Source: 
 ABdhPJz/be0dJJDPD88264aAIK6quPIPMDUYTVDG/6NZTPtCl1UkgZ8UxyiMVLPc3kysW13n52apAHSn4uYcNGKYhOA=
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr35865967wma.69.1638194092799;
 Mon, 29 Nov 2021 05:54:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638136329.git.steve@sakoman.com>
 <bc0c1234b7ae48394af92a4d14c2b47f2e3b98a1.1638136329.git.steve@sakoman.com>
 <b52dbaf4aff622f57855dbd73b034fe6258b9be1.camel@intel.com>
In-Reply-To: <b52dbaf4aff622f57855dbd73b034fe6258b9be1.camel@intel.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 29 Nov 2021 03:54:41 -1000
Message-ID: 
 <CAOSpxdbDwvL3LLZ6183aCwutMc5iBRG2SfPo+SpT6efEwNbfyw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 36/42] dnf: Backport bugfix for upgrade
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Jate Sujjavanich <jatedev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 13:54:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158939

On Sun, Nov 28, 2021 at 6:43 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Sun, 2021-11-28 at 11:57 -1000, Steve Sakoman wrote:
> > From: Jate Sujjavanich <jatedev@gmail.com>
> >
> > Keep installed packages in upgrade job
> >
> > This prevents duplicate identical packages from being reinstalled
> > with each upgrade
> >
> > Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  ...ackages-in-upgrade-job-RhBug-1728252.patch | 60
> > +++++++++++++++++++
> >  meta/recipes-devtools/dnf/dnf_4.2.2.bbappend  |  3 +
>
> Why is this being added to a bbappend instead of the recipe itself?

Arghh . . . I noticed this only after testing on the autobuilder and
forgot to remove these two dnf patches prior to generating the series
for review.  Thanks for catching this Anuj!

Jate, can you revise the patches and resubmit?

Steve

> >  2 files changed, 63 insertions(+)
> >  create mode 100644 meta/recipes-devtools/dnf/dnf/0040-Keep-
> > installed-packages-in-upgrade-job-RhBug-1728252.patch
> >  create mode 100644 meta/recipes-devtools/dnf/dnf_4.2.2.bbappend
> >
> > diff --git a/meta/recipes-devtools/dnf/dnf/0040-Keep-installed-
> > packages-in-upgrade-job-RhBug-1728252.patch b/meta/recipes-
> > devtools/dnf/dnf/0040-Keep-installed-packages-in-upgrade-job-RhBug-
> > 1728252.patch
> > new file mode 100644
> > index 0000000000..57c2375a54
> > --- /dev/null
> > +++ b/meta/recipes-devtools/dnf/dnf/0040-Keep-installed-packages-in-
> > upgrade-job-RhBug-1728252.patch
> > @@ -0,0 +1,60 @@
> > +From c88a77198c0156e425c2725f30e481207de5162f Mon Sep 17 00:00:00
> > 2001
> > +From: Jaroslav Mracek <jmracek@redhat.com>
> > +Date: Tue, 3 Sep 2019 11:01:51 +0200
> > +Subject: [PATCH] Keep installed packages in upgrade job
> > + (RhBug:1728252,1644241,1741381)
> > +
> > +In combination with marking of job as TARGETED it prevents from
> > +reinstalling of modified packages with same NEVRA.
> > +
> > +https://bugzilla.redhat.com/show_bug.cgi?id=1728252
> > +https://bugzilla.redhat.com/show_bug.cgi?id=1644241
> > +https://bugzilla.redhat.com/show_bug.cgi?id=1741381
> > +
> > +Closes: #1474
> > +Approved by: m-blaha
> > +
> > +
> > +Backport to fix bug in dnf in oe-core
> > +from https://github.com/rpm-software-management/dnf
> > +
> > +Removed spec file portion of patch
> > +
> > +Upstream-Status: Backport
> > +Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
> > +---
> > + dnf.spec                  | 4 ++--
> > + dnf/base.py               | 3 ---
> > + dnf/module/module_base.py | 2 +-
> > + 3 files changed, 3 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/dnf/base.py b/dnf/base.py
> > +index b2ced61..628c154 100644
> > +--- a/dnf/base.py
> > ++++ b/dnf/base.py
> > +@@ -1968,9 +1968,6 @@ class Base(object):
> > +                 obsoletes=q.installed().union(q.upgrades()))
> > +             # add obsoletes into transaction
> > +             q = q.union(obsoletes)
> > +-        # provide only available packages to solver otherwise
> > selection of available
> > +-        # possibilities will be ignored
> > +-        q = q.available()
> > +         if reponame is not None:
> > +             q.filterm(reponame=reponame)
> > +         q = self._merge_update_filters(q, pkg_spec=pkg_spec)
> > +diff --git a/dnf/module/module_base.py b/dnf/module/module_base.py
> > +index 976d730..ce70f63 100644
> > +--- a/dnf/module/module_base.py
> > ++++ b/dnf/module/module_base.py
> > +@@ -214,7 +214,7 @@ class ModuleBase(object):
> > +
> > +             if not upgrade_package_set:
> > +                 logger.error(_("Unable to match profile in argument
> > {}").format(spec))
> > +-            query =
> > self.base.sack.query().available().filterm(name=upgrade_package_set)
> > ++            query =
> > self.base.sack.query().filterm(name=upgrade_package_set)
> > +             if query:
> > +                 sltr = dnf.selector.Selector(self.base.sack)
> > +                 sltr.set(pkg=query)
> > +--
> > +2.7.4
> > +
> > diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bbappend
> > b/meta/recipes-devtools/dnf/dnf_4.2.2.bbappend
> > new file mode 100644
> > index 0000000000..3811db604b
> > --- /dev/null
> > +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bbappend
> > @@ -0,0 +1,3 @@
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > +
> > +SRC_URI +=
> > "file://0040-Keep-installed-packages-in-upgrade-job-RhBug-1728252.patch
> > "
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#158918):
> > https://lists.openembedded.org/g/openembedded-core/message/158918
> > Mute This Topic: https://lists.openembedded.org/mt/87365202/3616702
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub [
> > anuj.mittal@intel.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

