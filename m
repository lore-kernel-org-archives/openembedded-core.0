Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C29C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 17:12:47 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.1853.1743095564647896536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 10:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cQf3iYVx;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so2853589a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 10:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743095564; x=1743700364; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lQZ8fkwIEO6HxR6AVhhAmn5NKNW+t+RyQ5Sk0tPF4cw=;
        b=cQf3iYVxj8T1173gct9uDh9a1VM4phHQ/pYCx796bMGwBcGOB22/cPwuJf5B7KEJyo
         84HPbkllegEitWKyMsfI8N1xWl7I1SmI0hAulwkTX0JpFraYk8yqwwtM8Py/tdOkoCMa
         WN9ZiP/XpHSur/WfzSn7o2+RkmYz+pHw+9kkXzC91D+68kjxx+gcLgeSllvIkyHEuh92
         0mzNzdiQsX/XiLF9gY2JAsWxvenkaJk9kzmhjQZONd6LV7slBskqNKYXE3a5FaZElNEd
         WWpRW+Mf1dG982LjfZQieQzr2VWFo9E5tN3V9ONaKCsQmZ/N5uaMsHYjdT6LBViQAluF
         zzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743095564; x=1743700364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQZ8fkwIEO6HxR6AVhhAmn5NKNW+t+RyQ5Sk0tPF4cw=;
        b=ByG8Lu1Zba5N4iJc9aeBYkVEGhle5Pw22CzXqI05pd53A29bU1WLIjqGFvcpAEE9MK
         SlVA/t8y0TMK3s3fNv+ulR15H3SaW3pLdeSUiKAE4Bp2blHz+VQBc0Pq+BqwAgSPJRgE
         rDhzSJG8N7e7aC1ZYCVuNO4CiO7wncFb268xbupC4kCfCHy1JW/X7oK3H0lMye8hFGVA
         LAr0yVDLbhA6RM3lEoCC04VtbBC5wsNYzLCQyDJx/MVNxQspDyHRCniUI1PUYqksQlVm
         JrdXly8ZQsI0ywqZdI096eeZapjQ+VDyZFPXsNdxDg1hb9dXV/WLkIBgZHq4fdd73WZ4
         9T+Q==
X-Gm-Message-State: AOJu0Ywy/f9y0+rHMqmVJN8A6EM8R+R0xmBe4QZkY9QogvJTdHotFsWX
	BsIafrj5MguHrhVPW4lJbTlJT3ZdTUO72AVPgL7/YgPMCisJGZ31
X-Gm-Gg: ASbGncvEMp7AGp3BGeD3Y/1Ai6jSeCBgImQqyPwzSIt86/2sRuUb3VN9thpBDSpdLVE
	FIddKTOeuAioPq/YocSFZ1j0UwvKD/ukcfylE94b2tXnJQezbReIDT/pk0MUgNXPT2KVnome+9H
	J3+MZD4swgvn8HI/52uT7KnOBSL6+5jfY/ra6c/7np2Hx3bIRXp6wrB5IuXQHMSpXyxBTfb5WoL
	foT7cppEIkMRNwa9hTZoNjCE9k48x97sm3wuJTRL5s0tPAnIY6g4p/3lozK7by7Zjv5S5Yz6d/N
	koWFHl0F8jwKtHOm0P6xkUtbrwc1S4Yi+EVTDFCvfvilNg7CyDQwQw==
X-Google-Smtp-Source: AGHT+IFuv2ljpwPibwUuLEtLTs42TEgTybu5wAZgVPomSbqs14cswPWPZ1tjph/1r76yL+RzrtosTg==
X-Received: by 2002:a17:90b:5403:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-303a7d699b2mr7962966a91.12.1743095563719;
        Thu, 27 Mar 2025 10:12:43 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d56521sm150355a91.19.2025.03.27.10.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 10:12:43 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:12:39 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [styhead][PATCH v2 00/31] linux-firmware: upgrade 20240909 ->
 20250311
Message-ID: <20250327171239.kvs4jtetjkcs3i2u@hiago-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a7b5f6c-1be9-4c5d-bf2e-59e115762d6a@cherry.de>
 <CAOSpxdajP0E0uVMR3QmRCqqmmRMAMnXiZM3bPmOXHGyRrVTfDw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 17:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213770

Hi Quentin and Steve,

On Thu, Mar 27, 2025 at 05:27:44PM +0100, Quentin Schulz wrote:
> Hi Hiago,
> 
> On 3/27/25 5:19 PM, Hiago De Franco wrote:
> > Hi Steve,
> > 
> > On Thu, Mar 27, 2025 at 07:54:53AM -0700, Steve Sakoman wrote:
> > > On Wed, Mar 26, 2025 at 1:29 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > > 
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > 
> > > > Update the linux-firmware recipe to the most recent upstream tag.
> > > > 
> > > > This is basically a backport of the commits from master into styhead,
> > > > related to the linux-firmware recipe.
> > > 
> > > Sorry I missed seeing this yesterday.
> > > 
> > > The final release of styhead is now in QA, there are no further
> > > releases planned.
> > > 
> > > If this changes for any reason I will consider this series.
> > > 
> > > The project weekly status report publishes the complete schedule of
> > > releases for all branches.
> > 
> > All right, thanks for letting me know. I did not realise that.
> > 
> > I think the real work is on scarthgap and kirkstone, which I will send
> > another series. Can you comment if this is the right approach for
> > kirkstone and scarhgap as well?
> > 
> >  From what I understood, I need to backport these patches for the other
> > LTS branches as well, without breaking the compatibility. Is this
> > correct?
> > 
> 
> Will let Steve confirm but seems right to me.
> 
> As for the compatibility part, for firmware files being split into a new
> package, I would suggest to have the "old" package the firmware used to be
> in have an RDEPENDS on the new package so that anything that was requesting
> the old package still gets the firmware, except from the new package, but it
> gets brought in the image via the RDEPENDS mechanism. That could be the case
> for a bunch of files moved out of the catch-all -misc packages for example.
> 
> For when firmware files are moved from one package to another that already
> has other files that's a different topic. I would assume we simply do not
> backport that part of the change and keep the firmware in its original
> package.

Ok, got it, thanks for sharing. I will proceed as you described, if we
agree to continue the work.

> 
> Cheers,
> Quentin

On Thu, Mar 27, 2025 at 09:45:21AM -0700, Steve Sakoman wrote:
> On Thu, Mar 27, 2025 at 9:19 AM Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > Hi Steve,
> >
> > On Thu, Mar 27, 2025 at 07:54:53AM -0700, Steve Sakoman wrote:
> > > On Wed, Mar 26, 2025 at 1:29 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > >
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > >
> > > > Update the linux-firmware recipe to the most recent upstream tag.
> > > >
> > > > This is basically a backport of the commits from master into styhead,
> > > > related to the linux-firmware recipe.
> > >
> > > Sorry I missed seeing this yesterday.
> > >
> > > The final release of styhead is now in QA, there are no further
> > > releases planned.
> > >
> > > If this changes for any reason I will consider this series.
> > >
> > > The project weekly status report publishes the complete schedule of
> > > releases for all branches.
> >
> > All right, thanks for letting me know. I did not realise that.
> >
> > I think the real work is on scarthgap and kirkstone, which I will send
> > another series. Can you comment if this is the right approach for
> > kirkstone and scarhgap as well?
> >
> > From what I understood, I need to backport these patches for the other
> > LTS branches as well, without breaking the compatibility. Is this
> > correct?
> 
> In theory, yes.  However after seeing the extent of changes required
> to bring styhead up to date (31 patches!) I fear that the changes for
> older releases will be way more extensive than I feel comfortable
> with.

Yes, I think the recipes deviates a bit. For example, a simple git log
between scarthgap and master for linux-firmware shows 47 commits.

We do have commits creating new packages, which I think we could keep
them out of the backport (for example, create the ibt-18 package). I do
not know how many commits are only fixes or related to 20250311 itself,
I will have to check, but maybe we are able to keep only minimal amount
of patches.

> 
> I don't see how we can assert that compatibility will be maintained
> with that level of change.  Especially since our automated testing of
> the linux-firmware package is pretty minimal :-(
> 
> So I'm not inclined to take such a patchset, since I think the risk
> outweighs the benefit.

I think the benefit here would be the bugfixes we would integrate with
the firmware bump. For example, in our case I am doing the bump because
we experienced a bug on the sd8997 firmware release 20240909 which was
later fixed on 20250311. I know I can easily add a bbappend into our
layer, but would be great to instead upstream this change.

What do you reccomend? Should I try to keep the patch with minimal
differences as possible?

> 
> Steve

Thanks!

Hiago.

