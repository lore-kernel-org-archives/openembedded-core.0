Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05932C02190
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 04:46:19 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.13103.1738298772132828358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 20:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CvTYO69b;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-303548a9361so12091091fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 20:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738298770; x=1738903570; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VSPN0nZNOxQJMo742iyYpgIWu3B96Gk9ELpMzYnoRG8=;
        b=CvTYO69b4BEFMHxketnhEdillL6CAf3rE8B970wzkJ87nVUfE8uCuCs9ihbEJrtqzv
         fsSux69Yw+Ou9RZU0wy9Bgmp9cMhKZVoixF4ulE/M26XruSAzYywMqTJKYBKpiQ5lSrC
         PP1F6feAsNQELtsgCCWgn19yYxXuUMR/ECDoIALtN/7dcLEgdBxeEW0jVH/61gReJVM/
         FRUHQpS4y410fW+iiZ9ltpBA8nUwmK6BioPk1qkAjT2bjw63GV868/vCbYBFTQ56k2FH
         qPmrZPPW6HUqI0RUDtjHCQ0osl3pOX7TBvcH/hXE0IXVlfJLsw/+AStatDULuxiiK1S9
         8gIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738298770; x=1738903570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSPN0nZNOxQJMo742iyYpgIWu3B96Gk9ELpMzYnoRG8=;
        b=Onsxe0AUHmZzsHJcy6bBiN/U47NObgU9ZAj33QCiMUrN4TLzdRu6Q68xf8jgnig0ew
         mNMFj77jo9TAgSbUYVSoTaaiKO11COUZH8upXCBqQ7EwBKYqQra3jOCi6wSgdGch12mD
         Lqd3K5Mn/GD9WlN86yfp/vFJaZu2vYakZylQiY4HQOV0qjZwnc4F5QvoRTI4fg+k/g8D
         Jp+r0PiONFkE+J1I51d2O4iPEg/CK8LBYz7t09ik59o9gNflqW4OWgyziSwTssj5+Nf6
         UQTqZzWFviH/Kf/3erd/zqCEto9hJcBxktIybmeyL9APEaiUOdQ6wSzJ9ycBbyRQtCgI
         XIpA==
X-Forwarded-Encrypted: i=1; AJvYcCU+oEJDKBZd9Sd10Z5L/sCJ+juRM7goT5Sr4v8rqlEJG6JATfo2f4KOwJ88sQ3So+heqqxOaeQ4T+jgVf0y0sNzaA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfAldjTRhmrF4tNa7C8NK3yidBiAkFM9XtykLjKSwIajgoblKg
	9vAZysJUYtj/bIXr1OXoMK+WzakTIYDk7AGxov1ow6Tyng3I3C2+m0sF3TSu0S4=
X-Gm-Gg: ASbGnctFAmhX1rr7/j7asodNKC/nTJ/nppFPq43CKbD2De0tJ73Kb87Vfr8psFy8lmY
	X4K9coMvBiTN9cHec0x5+3gHmJd1AndsY90vl4zpoOdYSBJ0n2P4QF5SufeZJG93RdujnXNV7Rg
	YiTLpZTHvPjS6XpKAYQHHlnTurdoLJRg4K8mehcepMsJAenCVK1ocRnedYftOldE+DoJD+Mi/vU
	BC5KXNvr9W5WXfxqxhU/cB5yqT72UoXQB11wKORmZ8+C9rKkmTeS8Ki5jABrXShmcjhkAbZI47w
	KVr048wjCaNUgJEtFxzJDo9m456ZW7Qun+W3boQElmcFtq2xMzORJApD7dwhb2ajvxJJewE=
X-Google-Smtp-Source: AGHT+IEdvJCSU5bVfwsga3XuiUlhzVc3F41LOzC4//ArSID0Ju9fGsM4e/bnr5Y9V3iM14Umxn0cjg==
X-Received: by 2002:a2e:b887:0:b0:2ff:d49f:dd4b with SMTP id 38308e7fff4ca-3079684b05fmr33331241fa.15.1738298770121;
        Thu, 30 Jan 2025 20:46:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3423fa1sm4522101fa.92.2025.01.30.20.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 20:46:08 -0800 (PST)
Date: Fri, 31 Jan 2025 06:46:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "steve@sakoman.com" <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Request for discussion: Kernel version for LTS releases
Message-ID: <whmzsqbgk2fgxzufpom4wnmh6rkqepcryaoiyekeqo27ggr3yf@mgqpy2epy4x7>
References: <CAOSpxdbC-=6htz0g8i8NpcrmTsTpDXM0AkxtAO334KHEmKgu5Q@mail.gmail.com>
 <AS1PR10MB569795F9BEF718384BAECBADFDE92@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS1PR10MB569795F9BEF718384BAECBADFDE92@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 04:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210469

On Thu, Jan 30, 2025 at 03:37:50PM +0000, Marko, Peter wrote:
> Hello Steve,
> Some thoughts from my side:
> 
> Linux-yocto is a reference kernel for qemu machines.
> They are good for experiments but will not go to a real product.

This is not true. E.g. meta-qcom is using linux-yocto. And, I think,
that's the only viable way. So-called vendor kernels usually lag behind
linux-yocto wrt LTS version (and the non-LTS kernels are just pain).

I think we should be encouraging vendors to switch to linux-yocto, not
discouraging them.

> So are the linux-yocto qemu kernel CVEs interesting at all?
> I bet that users of yocto have their own kernels.
> From this perspective of course upgrade is fine as no one is using it, but is it needed at all?
> Isn't it better to keep the original one so users who don't upgrade have a good comparison base?
> Maybe it would be interesting to have two kernel version - original + newest so that components can be tested on both, but only if both would also be tested on autobuilder.
> 
> We have split kernel and non-kernel CVEs in our reports since the beginning.
> For a different reason (each SOC needed its own vendor kernel at that time), but it made the metrics focused on what we needed.
> Kernel and other components are other worlds and probably no developer will be fixing both.
> I'd suggest doing the same in oe-core - split the kernel CVEs to a separate tables.
> This will not fix the numbers, but maybe help most users to see status of what they are using without overflowing from unused component with astronomical numbers.
> 
> Third topic is regarding NVD CVE metric reporting.
> Currently it's bogus - not showing majority of CVEs and showing some which are already backported but never updated in the DB.
> I remember that Marta was working on annotations from cvelistV5, but somehow that activity died.
> Maybe there should be a restart of this to make the reports reliable/trustworthy?
> I think that kernel maintainers are backporting all relevant CVE fixes to all affected LTS branches.
> That should mean that with every update, we should be getting back close to 0 CVEs and just need a reliable data.
> 
> Maybe a final comment...
> When we open this topic for kernel, there are other components where there is lot of CVEs which realistically cannot be backported.
> Those are usually handled via https://git.yoctoproject.org/meta-lts-mixins/, shouldn't it be the same for kernel?
> 
> TLDR: Since I'm not using linux-yocto, I have just suggestions to reporting, no strong opinion on its upgrade.
> 
> Peter
> 
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Steve Sakoman via
> > lists.openembedded.org
> > Sent: Thursday, January 30, 2025 15:31
> > To: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: [OE-core] Request for discussion: Kernel version for LTS releases
> > 
> > As you may be aware, the support period for Linux kernel LTS releases
> > has changed to two years. This presents a challenge for our Yocto LTS
> > releases, which have 4 year support periods.
> > 
> > In light of this, Richard sent an email to the Yocto architecture list
> > in January of 2024 outlining the project's plans for kernel support in
> > future LTS releases (copied below)
> > 
> > TLDR: Around the midpoint of the Yocto Scarthgap LTS lifecycle we will
> > backport the then current LTS kernel version and make it the default
> > kernel version. The linux-libc-headers version would remain at the
> > released version.
> > 
> > At a recent Yocto Project Technical Team Meeting there was some
> > discussion around the growing kernel CVE counts in the stable
> > branches:
> > 
> > kirkstone: 552
> > scarthgap: 225
> > 
> > For comparison the master branch CVE count for the kernel is 18
> > 
> > The suggestion was made that we do this kernel version update sooner
> > rather than later, and also include the Kirkstone LTS branch in order
> > to deal with its large number of CVEs.  The original plan was to only
> > do this version bump for Scarthgap, so this would be a change to the
> > plan of record.
> > 
> > Please consider the above and respond to this email with any thoughts
> > or concerns you may have about implementing this version bump in both
> > LTS branches in the coming weeks.
> > 
> > Thanks!
> > 
> > Steve
> > 
> > 
> > Full text of Richard's email:
> > 
> > The project is aware that the kernel versions that ship in our next LTS
> > in April will likely not have support for the full lifetime of our LTS
> > (four years). We've been asked a few questions about this so we wanted
> > to write down what our plan is.
> > 
> > Our intent is to support the versions we ship with for as long as is
> > practical. If they become end of life around the mid point of the LTS
> > as expected, our plan is to backport a current LTS kernel at that time
> > into the release and make it the default, leaving the older recipes
> > there for anyone who still needs to use them. It would be based on the
> > kernel in one of our future releases, as appropriate.
> > 
> > The linux-libc-headers version would remain at the released version.
> > This is used to control the features in the toolchain/userspace and
> > there is no need to upgrade this to work with a newer kernel version.
> > Upgrading it would potentially change the toolchain and userspace
> > functionality and this is not desirable in the LTS. To be clear, this
> > does mean bleeding edge features in the newer kernel may not be
> > available but that is desirable in the context of the purpose of the
> > LTS.
> > 
> > The only reason the headers version would change would be to address a
> > security issue in the toolchain or kernel/userspace interface.
> > 
> > Since we don't know what the upstream kernel will do, or when exactly,
> > it is hard to make a definitive plan beyond this.
> > 
> > We appreciate this isn't our usual policy of "no upgrades", however if
> > everyone knows this is the plan from the start, we believe that is
> > different and everyone can plan accordingly, hence wanting to make this
> > clear now.
> > 
> > Since the project is planning to execute the full QA process against
> > this new version, it is putting a plan in place to switch from the
> > start and it plans not to test against any other version beyond that
> > point, it makes most sense to directly integrate the changes rather
> > than the mix in layer approach which is there for unplanned changes.
> > 
> > To be clear, we may also update this plan if/as things develop in the
> > other dependent ecosystems such as kernel as we can't know what will
> > happen in these on the timescales involved.
> > 
> > Cheers,
> > 
> > Richard
> > (on behalf of the Yocto Project TSC, LTS and kernel maintainers)

-- 
With best wishes
Dmitry

