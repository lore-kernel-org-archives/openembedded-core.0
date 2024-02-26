Return-Path: <kamatam@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2B9C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 23:50:37 +0000 (UTC)
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com [52.119.213.154])
 by mx.groups.io with SMTP id smtpd.web11.736.1708991434799886609
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 15:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=EgL19E+a;
 spf=pass (domain: amazon.com, ip: 52.119.213.154, mailfrom: prvs=779f0d7f9=kamatam@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1708991435; x=1740527435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=30g+f8choBEO/+yhL9e36NBySWEq85/P1UdX8+tL0/k=;
  b=EgL19E+aarADGAQ7ieIF5xfb6ypKstRb1QBTfPNRJIXUo0e0DCF5X70K
   L+26hejRtPLS+EbYE7SRTyJ9iEzkmF2XdfE5lI6sXYGs6smZjTJmS+4uu
   xmBMryjK+ZVXcdAjGa0csW/hJ+s4KnqSJO5Ns0wfrn16RFaPd+JJU3r9G
   4=;
X-IronPort-AV: E=Sophos;i="6.06,187,1705363200"; 
   d="scan'208";a="187561432"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 23:50:34 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:25277]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.178:2525] with esmtp (Farcaster)
 id 0c9ba385-2e73-461e-b56d-b2704c5e8b7a; Mon, 26 Feb 2024 23:50:33 +0000 (UTC)
X-Farcaster-Flow-ID: 0c9ba385-2e73-461e-b56d-b2704c5e8b7a
Received: from EX19D010UWA004.ant.amazon.com (10.13.138.204) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 26 Feb 2024 23:50:31 +0000
Received: from u0acfa43c8cad58.ant.amazon.com (10.88.187.238) by
 EX19D010UWA004.ant.amazon.com (10.13.138.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 26 Feb 2024 23:50:30 +0000
From: Munehisa Kamata <kamatam@amazon.com>
To: <bruce.ashfield@gmail.com>
CC: <kamatam@amazon.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel.bbclass: Set pkg-config variables for building modules
Date: Mon, 26 Feb 2024 15:50:10 -0800
Message-ID: <20240226235010.275074-1-kamatam@amazon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CADkTA4Pmv7cL2LTSYvhXv905T6_MpsZxCgXnUZqvSS2E6BhTuQ@mail.gmail.com>
References: <CADkTA4Pmv7cL2LTSYvhXv905T6_MpsZxCgXnUZqvSS2E6BhTuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.88.187.238]
X-ClientProxiedBy: EX19D037UWC001.ant.amazon.com (10.13.139.197) To
 EX19D010UWA004.ant.amazon.com (10.13.138.204)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 23:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196234

Hi Bruce,

On Sun, 2024-02-25 06:54:58 -0800, Bruce Ashfield wrote:
>
> On Sat, Feb 24, 2024 at 2:21 AM Munehisa Kamata <kamatam@amazon.com> wrote:
> >
> > Hi Bruce,
> >
> > > That is indeed not a simple workflow!
> > >
> > > In the past, we've always had the existing packageconfig results picked up and
> > > used by later stages of the kernel build which prevented things like this from
> > > happening.
> > >
> > > Have you figured out exactly which packageconfig is triggering the rebuild, and
> > > had a look to see if something change such that the existing results
> > > aren't used ?
> >
> > The missing of libcrypto.pc and libelf.pc triggers the rebuild of
> > certs/extract-cert and objtool respectively. When PKG_CONFIG_DIR is set to
> > recipe-sysroot at module build time, it points to a non-existent directory
> > and therefore pkg-config can't find .pc for the requested library whereas
> > they are present in the recipe-sysroot-native, then it causes make to
> > rebuild the target.
> >
> > Although I admit that I don't fully understand how make particularly
> > decides to trigger the rebuild in this case.
> 
> Fair enough. I can't say that I always understand how the kernel's
> Makefiles are triggering difficult builds without significant hacking
> up of the Makefiles, and it isn't worth doing for this.
> 
> At a minimum, it is good to know that the .pc files are being consulted
> so we do have something reproducible between builds when everything
> is full defined.
> 
> >
> > > All that being said, rather than repeating the exports, it would be
> > > better to have
> > > them in a common place, since eventually everything but the HOSTPKG_CONFIG
> > > definition will be dropped.
> > >
> > > Have you tried a more class-global export of the values ? We have a
> > > few of those,
> > > but admittedly, we have way more exports that are duplicated between do_compile
> > > and do_compile_kernelmodules(), so the duplicated exports aren't a big issue.
> >
> > Yes, I actually tried it first and it worked at lesat for simple kernel
> > building. But I wasn't entirely sure if it was safe enough for the
> > ecosystem and came up with the change that is hopefully less impact. That
> > said, if you think it's fine, I'm happy to submit v3 with the class-global
> > export. It would be better indeed.
> >
> 
> It is something that should be safe, since really, whenever we build
> anything in the kernel having a consistent environment should be in
> place. The kernel modules build has expanded over the years and
> more of the kernel tools and common build components are coming
> into play, so things we didn't previously need .. are now needed in
> the modules compilation.
> 
> I had recommended that this go into test on Friday via IRC, but
> there's no harm in doing a cleaned up v3 with a class global set
> of exports. We can always apply it post release if it is decided there
> is extra risk .. but at least it will be a reference to how we should
> start consolidating some of the exports.

Since v2 has been already merged, I sent out v3 as just a new patch on the
top of the lastet master branch.


Thanks,
Munehisa
 
> Bruce
> 
> >
> > Thanks,
> > Munehisa
> >
> > > Bruce
> > >
> > > >
> > > > Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
> > > > ---
> > > >
> > > > v1 -> v2: Rewrote the commit message with the repro steps
> > > >
> > > >  meta/classes-recipe/kernel.bbclass | 12 +++++++++---
> > > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> > > > index a76aaee5ba..db4461e551 100644
> > > > --- a/meta/classes-recipe/kernel.bbclass
> > > > +++ b/meta/classes-recipe/kernel.bbclass
> > > > @@ -239,6 +239,8 @@ KERNEL_EXTRA_ARGS ?= ""
> > > >  EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}"'
> > > >  EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
> > > >  EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}"'
> > > > +# Only for newer kernels (5.19+), native pkg-config variables are set for older kernels when building kernel and modules
> > > > +EXTRA_OEMAKE += ' HOSTPKG_CONFIG="pkg-config-native"'
> > > >
> > > >  KERNEL_ALT_IMAGETYPE ??= ""
> > > >
> > > > @@ -356,9 +358,6 @@ kernel_do_compile() {
> > > >         export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
> > > >         export PKG_CONFIG_SYSROOT_DIR=""
> > > >
> > > > -       # for newer kernels (5.19+) there's a dedicated variable
> > > > -       export HOSTPKG_CONFIG="pkg-config-native"
> > > > -
> > > >         if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
> > > >                 # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> > > >                 # be set....
> > > > @@ -408,6 +407,13 @@ addtask transform_kernel after do_compile before do_install
> > > >
> > > >  do_compile_kernelmodules() {
> > > >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> > > > +
> > > > +       # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
> > > > +       export PKG_CONFIG_DIR="${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig"
> > > > +       export PKG_CONFIG_PATH="$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkgconfig"
> > > > +       export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
> > > > +       export PKG_CONFIG_SYSROOT_DIR=""
> > > > +
> > > >         if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
> > > >                 # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> > > >                 # be set....
> > > > --
> > > > 2.34.1
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> 
> 
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 
> 

