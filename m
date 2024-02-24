Return-Path: <kamatam@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B844C48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 07:21:31 +0000 (UTC)
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
 by mx.groups.io with SMTP id smtpd.web10.14975.1708759281476931171
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 23:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=DhiQsqHB;
 spf=pass (domain: amazon.com, ip: 99.78.197.217, mailfrom: prvs=777e2d521=kamatam@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1708759281; x=1740295281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rvypWJBwOlWKAixqZuWQHVB+PgFaJFwt9uvkxRTymDI=;
  b=DhiQsqHBdz3sdxKFTKJAD8WpgYXCe0BmkxCvDqm0IeamG77DolSBNObK
   c80LxdMZLoGq7VMUSSIjQ/uyKyyF1t0eKUviQU21U+L2zUUaTpvs6obsy
   l/qVqRSMPTIAtwaW8Ax4dhN6td2ZNDENRlbhBckB/AFPsWP1RjEpVo713
   g=;
X-IronPort-AV: E=Sophos;i="6.06,181,1705363200"; 
   d="scan'208";a="275557234"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 07:21:20 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:42732]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.23.221:2525] with esmtp (Farcaster)
 id f0227859-8370-4601-99f4-c6b4ff09089b; Sat, 24 Feb 2024 07:21:20 +0000 (UTC)
X-Farcaster-Flow-ID: f0227859-8370-4601-99f4-c6b4ff09089b
Received: from EX19D010UWA004.ant.amazon.com (10.13.138.204) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 24 Feb 2024 07:21:19 +0000
Received: from u0acfa43c8cad58.ant.amazon.com (10.106.100.17) by
 EX19D010UWA004.ant.amazon.com (10.13.138.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 24 Feb 2024 07:21:19 +0000
From: Munehisa Kamata <kamatam@amazon.com>
To: <bruce.ashfield@gmail.com>
CC: <kamatam@amazon.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel.bbclass: Set pkg-config variables for building modules
Date: Fri, 23 Feb 2024 23:21:06 -0800
Message-ID: <20240224072106.2702207-1-kamatam@amazon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CADkTA4OD_rO2CPSHjA240-oGGzn9OPTd+=LT4Ne3t2yFFSQtjA@mail.gmail.com>
References: <CADkTA4OD_rO2CPSHjA240-oGGzn9OPTd+=LT4Ne3t2yFFSQtjA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.100.17]
X-ClientProxiedBy: EX19D045UWA001.ant.amazon.com (10.13.139.83) To
 EX19D010UWA004.ant.amazon.com (10.13.138.204)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 07:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196119

Hi Bruce,

> That is indeed not a simple workflow!
> 
> In the past, we've always had the existing packageconfig results picked up and
> used by later stages of the kernel build which prevented things like this from
> happening.
> 
> Have you figured out exactly which packageconfig is triggering the rebuild, and
> had a look to see if something change such that the existing results
> aren't used ?

The missing of libcrypto.pc and libelf.pc triggers the rebuild of
certs/extract-cert and objtool respectively. When PKG_CONFIG_DIR is set to
recipe-sysroot at module build time, it points to a non-existent directory
and therefore pkg-config can't find .pc for the requested library whereas
they are present in the recipe-sysroot-native, then it causes make to
rebuild the target.

Although I admit that I don't fully understand how make particularly
decides to trigger the rebuild in this case.

> All that being said, rather than repeating the exports, it would be
> better to have
> them in a common place, since eventually everything but the HOSTPKG_CONFIG
> definition will be dropped.
> 
> Have you tried a more class-global export of the values ? We have a
> few of those,
> but admittedly, we have way more exports that are duplicated between do_compile
> and do_compile_kernelmodules(), so the duplicated exports aren't a big issue.

Yes, I actually tried it first and it worked at lesat for simple kernel
building. But I wasn't entirely sure if it was safe enough for the
ecosystem and came up with the change that is hopefully less impact. That
said, if you think it's fine, I'm happy to submit v3 with the class-global
export. It would be better indeed.


Thanks,
Munehisa

> Bruce
> 
> >
> > Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
> > ---
> >
> > v1 -> v2: Rewrote the commit message with the repro steps
> >
> >  meta/classes-recipe/kernel.bbclass | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> > index a76aaee5ba..db4461e551 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -239,6 +239,8 @@ KERNEL_EXTRA_ARGS ?= ""
> >  EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}"'
> >  EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
> >  EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}"'
> > +# Only for newer kernels (5.19+), native pkg-config variables are set for older kernels when building kernel and modules
> > +EXTRA_OEMAKE += ' HOSTPKG_CONFIG="pkg-config-native"'
> >
> >  KERNEL_ALT_IMAGETYPE ??= ""
> >
> > @@ -356,9 +358,6 @@ kernel_do_compile() {
> >         export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
> >         export PKG_CONFIG_SYSROOT_DIR=""
> >
> > -       # for newer kernels (5.19+) there's a dedicated variable
> > -       export HOSTPKG_CONFIG="pkg-config-native"
> > -
> >         if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
> >                 # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> >                 # be set....
> > @@ -408,6 +407,13 @@ addtask transform_kernel after do_compile before do_install
> >
> >  do_compile_kernelmodules() {
> >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> > +
> > +       # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
> > +       export PKG_CONFIG_DIR="${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig"
> > +       export PKG_CONFIG_PATH="$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkgconfig"
> > +       export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
> > +       export PKG_CONFIG_SYSROOT_DIR=""
> > +
> >         if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
> >                 # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> >                 # be set....
> > --
> > 2.34.1
> >
> 
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 
> 

