Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED724C433EF
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 14:59:40 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.17508.1652626776179727831
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 07:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fGD14xwH;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id fd25so2748917edb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 07:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yvL2IRtv7YghqoGUQBCZpI/Rj39h4xsQKAAoAnqtamA=;
        b=fGD14xwH6RjRFuV7KLLW3RWhFq6ZpnN8vM+MkLBjEGMmE1Ylt9bXGfusbRfC0PNUG7
         uuhZLGa+bkBKM+Xzq6EGW6JSQya7qjkESX3csDqvjjMH62bHSgz9ZL0NG8+aOuAPfsTF
         utrVM3DX/5kKuCTwKktyhpO7i+AJ7zHAYU97aguzSlQiL++Uj3u+UABK2rq0toQlDPUO
         qVHf1cyo+yMZgiKuRgKU4Icft7OtNMOs09zEWj2IqM1FzcpWtk8q7v4l3FB8+S30PA2W
         1svOlv6e7zjOcf2tQ5w62nok6NrQI4uVeHaucJEwvN0DFBbyvdRq9ND6pXVYjGKPGB9U
         C1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yvL2IRtv7YghqoGUQBCZpI/Rj39h4xsQKAAoAnqtamA=;
        b=4kYjL33IuKfmM/NjQ3p1Uq6QhtPBpfMbCV2NzUQ/jEZk4xxUKgF1L6aGfe1go92k7K
         2uO1k6O9KxNTl4ty31hWaIIvep2ddmXjQdVqYSYLP5jw6UaZQ8aabTnRNb/Bu4f9YwwY
         hVwA5RUaeF9sXl1pWg8xrEpLEU5Q4Ewv9vljyasBYelV51O32w9Ij5lCVvrJ5SJUvM+D
         WZ+ys7d6BPnrmX9MXakUOOnZvRFqqS8VfZcjltWlWVorCyDs4dB/pf6XBFlKN2U6LlCr
         v+pwpytKxB7A5gX4kFJS9MP9ybKNxCa45oq7TyNyg9mRQfGi4414YagG0MTtdsMpkiyj
         uXnQ==
X-Gm-Message-State: AOAM532+RzXb/XhOagypp2k2HnRKJD1/VeB2cfsDWcotbSjHaDwxLziZ
	QJyNo1P05FiVRQK3IJrVCR0Fj+AJl+sOlgyXlVQ=
X-Google-Smtp-Source: 
 ABdhPJwUv/etA5uuDykGchBwzV/ZJd4JV2hkj+Js54xqjepQxTzoia9p/TQboy2beeH32W7gBkpZOaminJfpn069j7Q=
X-Received: by 2002:a05:6402:1804:b0:42a:b015:4acc with SMTP id
 g4-20020a056402180400b0042ab0154accmr1525635edy.163.1652626774601; Sun, 15
 May 2022 07:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220512054303.429208-1-changqing.li@windriver.com>
 <CAO5Uq5TO3gZQNkucAy9s8aiJ=0+nMJDe-zw=SBT+wOjbUQwniQ@mail.gmail.com>
 <dbf5957af1a1afd39a90465b47eeae90fa6f350e.camel@linuxfoundation.org>
 <SN6PR11MB25578B38EF44CB5A0D00A40782CA9@SN6PR11MB2557.namprd11.prod.outlook.com>
In-Reply-To: 
 <SN6PR11MB25578B38EF44CB5A0D00A40782CA9@SN6PR11MB2557.namprd11.prod.outlook.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 15 May 2022 15:59:22 +0100
Message-ID: 
 <CAO5Uq5Tyakm1_Q26j93ok83of5Uru-J07i4657fg58AYxBTaQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
To: "Li, Changqing" <Changqing.Li@windriver.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 14:59:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165605

On Fri, May 13, 2022 at 2:42 AM Li, Changqing
<Changqing.Li@windriver.com> wrote:
>
>
>
> ________________________________
> From: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.org>
> Sent: Thursday, May 12, 2022 6:33 PM
> To: Alex Kiernan <alex.kiernan@gmail.com>; Li, Changqing <Changqing.Li@windriver.com>
> Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Thu, 2022-05-12 at 08:45 +0100, Alex Kiernan wrote:
> > On Thu, May 12, 2022 at 6:43 AM Changqing Li <changqing.li@windriver.com> wrote:
> > >
> > > From: Changqing Li <changqing.li@windriver.com>
> > >
> > > dev in modules.devname should be populated in /dev on boot.
> > > remove create static mode from udevd will make these devices
> > > cannot be populated. When use sysVinit, devices like /dev/net/tun
> > > will not be created.
> > >
> > > more info:
> > > udevd in systemd also remove create static mode in udevd, but using
> > > service kmod-static-nodes.service and
> > > systemd-tmpfiles-setup-dev.service in systemd to create these node, so
> > > systemd works well.
> > >
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > ---
> > >  ...dev-create-static-nodes-from-modules.patch | 115 ++++++++++++++++++
> > >  meta/recipes-core/udev/eudev_3.2.11.bb        |   1 +
> > >  2 files changed, 116 insertions(+)
> > >  create mode 100644 meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
> > >
> > > diff --git a/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
> > > new file mode 100644
> > > index 0000000000..19611f4e89
> > > --- /dev/null
> > > +++ b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
> > > @@ -0,0 +1,115 @@
> > > +From 573d6c4106d5b3828da43d2843c1d599ae3cd1cd Mon Sep 17 00:00:00 2001
> > > +From: Changqing Li <changqing.li@windriver.com>
> > > +Date: Tue, 10 May 2022 14:04:35 +0800
> > > +Subject: [PATCH] eudev: create static nodes from modules
> > > +
> > > +Revert commit <src/udev/udevd.c: remove create static nodes from modules>
> > > +https://gitweb.gentoo.org/proj/eudev.git/commit/?id=2b7abd5ec9cc47a8b895df6db77fb1537c6f1a39
> > > +
> > > +Upstream-Status: Inappropriate [oe-specific]
> > > +
> > > +Upstream intentionally remove create static nodes from modules, it is
> > > +expected handled by tmpfiles services, refer [1].
> > > +[1] https://github.com/eudev-project/eudev/issues/229
> > > +
> > > +For yocto, when start with sysVinit, to enable systemd distro feature,
> > > +and install systemd-tmpfiles is not proper, so revert this commit.
> > > +
> >
> > Reading the upstream issue, I'm not sure this really is an
> > "Inappropriate" upstream. eudev has dropped this commit, because you
> > can use systemd-tmpfiles ("as it works without systemd and can be
> > compiled individually" - presumably using our unsupported musl
> > patches...) or opentmpfiles (which is dead and points you back to
> > systemd-tmpfiles).
> >
> > Feels like this is an engage with upstream rather than carry a patch
> > forever which just causes us to be perpetually divergent.
>
> I agree, this does sound like something we need to address to keep the
> project maintainable...
>
> I tried to suggest  upstream to add this back,  but  upstream seems prefer to use tmpfile solution.
>

Given how limited the output format which static-nodes generates for
tmpfiles is (just d and c! entries), parsing that output directly as
part the eudev init script wouldn't be horrible. Or make kmod generate
files in the format that volatiles expects? Though that would need
populate-volatile extending to generate device nodes.

-- 
Alex Kiernan

