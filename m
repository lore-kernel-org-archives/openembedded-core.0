Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.81.1626021683601181942
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 09:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C1o6a/vy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso9693477wmj.4
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jul 2021 09:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=g/KAc0+jhqizS5BUlOKfRisAd29lHJwk27TAcDKZt7c=;
        b=C1o6a/vy2sMzE7raI4ElrB/9YoUjleRL6EZK6LG+b9YoxVW/MrQQfSj3KjLsuAEGCs
         hjx49DmNin2dCO054/roFp8atO4Mlf6PfBYpk/GTh0Me8GOSWOwPUM3ahGfec4mJp4Iv
         KGHI6Oznlcr1vbGJrXzLvtRf3etsuERotkizc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=g/KAc0+jhqizS5BUlOKfRisAd29lHJwk27TAcDKZt7c=;
        b=bzA4cVMYbaVff8acnlb9UR/cxAXkM/vOZGItOHgP377HTYmD6SejAPvsS30WM6mGnB
         8oatpjiwbHa3gA7enkpEJGsQRRpYcRvHLXW2l7F908GsCm5DqRpTwxx/ZeKCJuYFPOrk
         H58hwb1YQn1GYtHY3n3qUzqUwPk1Y5ruPmkG1zXaHrgwDgoAP/zEddpY56+sM8mkpeLK
         jZTr+0DBtIG8mlQ36VlvJRJHgE8Z+DS9akbgRouuJq16SrGfb99gd/uwEGeZEIzsYIJp
         09FBdevO8W7G9Yl3ESPLRTh4rSGiTZKehoZcEQQVBZEJquYbtjiYpgBx08r+D0IPtXTB
         SHhA==
X-Gm-Message-State: AOAM530dfHUyQRc+jyr7K4NiUuMLbZJr8KA2y4QZdBxnmxPbs64PDLp9
	mj2Q0CxYVJJHsoTdymJQRnel4A==
X-Google-Smtp-Source: ABdhPJy5A7CUDMlx/pgSFlt7XvdDbhDwVB7MvN5cKT00VFyW5KSK2ze/2VkR8KBK9d4X73MXL43ghQ==
X-Received: by 2002:a1c:5985:: with SMTP id n127mr50784266wmb.75.1626021681941;
        Sun, 11 Jul 2021 09:41:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5e67:1ea9:260d:3e7f? ([2001:8b0:aba:5f3c:5e67:1ea9:260d:3e7f])
        by smtp.gmail.com with ESMTPSA id o19sm17190851wmc.12.2021.07.11.09.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 09:41:21 -0700 (PDT)
Message-ID: <96206ed69d600f7e9beaba2774065c33908fe9c3.camel@linuxfoundation.org>
Subject: Re: [PATCH] linux-yocto/5.13: add devupstream support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 11 Jul 2021 17:41:17 +0100
In-Reply-To: <CADkTA4OBhNxtY+z=i4F9LJq2w0rbq9whmcQH-dyxLpWJa2-qiA@mail.gmail.com>
References: <20210706175821.41519-1-bruce.ashfield@gmail.com>
	 <d781befb33cb4f3b53e1e7989311ef52ce56e927.camel@linuxfoundation.org>
	 <CADkTA4OBhNxtY+z=i4F9LJq2w0rbq9whmcQH-dyxLpWJa2-qiA@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-07-11 at 12:10 -0400, Bruce Ashfield wrote:
> On Sun, Jul 11, 2021 at 5:53 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Tue, 2021-07-06 at 13:58 -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > 
> > > We are always getting questions about building -stable, or mainline
> > > master. Rather than introducing a separate set of recipes, we can
> > > facilitate this sort of testing by using the existing devupstream
> > > bbclass support.
> > > 
> > > To build an unpatched or otherwise modifed -stable of 5.13, simply
> > > set the linux-yocto preferred version to:
> > > 
> > >   upstream+5.13%
> > > 
> > > And your wish will be granted, as the build will use v5.13/base
> > > which matches the main linux-yocto version, simply with no extra
> > > changes applied.
> > > 
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > > 
> > > Richard,
> > > 
> > > This is the patch that I was talking about earlier in the yocto dev
> > > meeting.
> > > 
> > > I personally find this the easiest to maintain, since it is just
> > > a variant of linux-yocto_<version>, and ends up just being a
> > > different branch versus anything radically different.
> > > 
> > > I am open to making this a different / named recipe to make the
> > > distinction more clear, but I'm worried about the impression
> > > that we were doing extensive testing on the bare -stable branches
> > > when most of the testing (which is transient to the base -stable)
> > > happens on our standard/base branch.
> > > 
> > > Either way, I'll work on getting this and the -dev tweaks I sent
> > > earlier added to some part of our AB testing to make sure that
> > > they stay in good shape.
> > 
> > Sorry for the delay on this one, I wanted to try something. I have a
> > tweak to propose and since patches speak louder than words:
> > 
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
> > index cd51e04b95d..ab81a977b8a 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
> > @@ -25,13 +25,13 @@ SRCREV_machine_qemumips64 ?= "b74fe3dcca0653609fcb75aad883b1db07619081"
> >  SRCREV_machine ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
> >  SRCREV_meta ?= "ceb5fa598d08902fe2934c041875aa92d9a6fa19"
> > 
> > -# set your preferred version of linux-yocto to 'upstream+<version>%', and you'll
> > +# set your preferred provider of virtual/kernel to 'linux-yocto-upstream', and you'll
> >  # get the <version>/base branch, which is pure upstream -stable, and the same
> >  # meta SRCREV as the linux-yocto-standard builds
> >  BBCLASSEXTEND = "devupstream:target"
> >  DEFAULT_PREFERENCE_class-devupstream = "-1"
> >  SRCREV_class-devupstream = "62fb9874f5da54fdb243003b386128037319b219"
> > -PV_class-devupstream = "upstream+${LINUX_VERSION}+git${SRCPV}"
> > +PN_class-devupstream = "linux-yocto-upstream"
> >  KBRANCH_class-devupstream = "v5.13/base"
> > 
> >  # remap qemuarm to qemuarma15 for the 5.8 kernel
> > 
> > Basically this does what you were doing but brings with it the advantages
> > of having the target in it's own recipe namespace by changing PN.
> > 
> > This means you'd set:
> > 
> > PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-upstream"
> > 
> > to enable and the advantage is that if multiple linux-yocto recipes have
> > this, you can do:
> > 
> > PREFERRED_VERSION_linux-yocto-upstream = "5.13%"
> > 
> > or whatever, it all works as normal.
> > 
> > This drops the hacked up PV field and I think makes things work nicely.
> > 
> > Does that seem reasonable to you? It should work just as well with your workflows?
> > 
> 
> Most definitely.
> 
> That meets my goals of just having one more SRCREV to bump in the main
> recipe, and it is easily accessible.
> 
> I can spin a v2, unless you want to just take your changes and merge
> them as-is ?

v2 is probably best as it does change the commit message and so on quite 
a bit? I can fix it all up so don't mind either way really but I'll assume
v2 unless you say otherwise :)

Cheers,

Richard

