Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678AFC4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 15:28:04 +0000 (UTC)
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com [207.171.188.200])
 by mx.groups.io with SMTP id smtpd.web11.6815.1668180481169277822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 07:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=F1Ny3O6a;
 spf=pass (domain: amazon.com, ip: 207.171.188.200, mailfrom: prvs=3074a5097=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1668180481; x=1699716481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NlpmbhYzG1VGeLR4dyYePTK1BGC2mgot4EACmJ2wKyk=;
  b=F1Ny3O6aTdDoy//WrqYO4ADo+ub4AaTMcg/rH6rZYSGHig3yNFj8zEnh
   f7xPpLCtbbkOlWi863J78XjeCODyOzBioNzXgvaCx2w6594b7e5dA/ljd
   WTjdi23bPCGVkeiddVf7MmjYxT9ZgCsOCABeTDf2XziWNCw+ZMkUUzRnZ
   4=;
X-IronPort-AV: E=Sophos;i="5.96,156,1665446400"; 
   d="scan'208";a="1072978573"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-7dc0ecf1.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-9103.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 15:27:59 +0000
Received: from EX13MTAUWB002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1e-m6i4x-7dc0ecf1.us-east-1.amazon.com (Postfix) with ESMTPS id E48E981A92;
	Fri, 11 Nov 2022 15:27:57 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX13MTAUWB002.ant.amazon.com (10.43.161.202) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Fri, 11 Nov 2022 15:27:57 +0000
Received: from amazon.com (10.43.160.223) by EX19D047UWB002.ant.amazon.com
 (10.13.138.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20; Fri, 11 Nov 2022
 15:27:57 +0000
Date: Fri, 11 Nov 2022 08:27:55 -0700
From: Jordan Crouse <jorcrous@amazon.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] vulkan-validation: Add the official Vulkan
 validation layers
Message-ID: <20221111152755.ztodymtsd72kbdjo@amazon.com>
References: <20221110204232.12768-1-jorcrous@amazon.com>
 <20221110204232.12768-4-jorcrous@amazon.com>
 <CANNYZj8Q4yDjr-=-u4VCMYf8khBDUmwu9+c7qKezqKSx-9grZA@mail.gmail.com>
 <20221110213024.ob3bvz4g2hsixmu3@amazon.com>
 <CANNYZj8v2Ps2GTJv_4hhGr09VjPWO2LwHPOFUcncenX8SfCY8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CANNYZj8v2Ps2GTJv_4hhGr09VjPWO2LwHPOFUcncenX8SfCY8g@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-Originating-IP: [10.43.160.223]
X-ClientProxiedBy: EX13D43UWC004.ant.amazon.com (10.43.162.42) To
 EX19D047UWB002.ant.amazon.com (10.13.138.34)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 15:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173134

On Fri, Nov 11, 2022 at 09:03:02AM +0100, Alexander Kanavin wrote:
> On Thu, 10 Nov 2022 at 22:30, Jordan Crouse <jorcrous@amazon.com> wrote:
> > ERROR: vulkan-validation-1.3.231.1-r0 do_package_qa: QA Issue: -dev package vulkan-validation-dev contains non-symlink .so '/usr/lib/libVkLayer_khronos_validation.so' [dev-elf]
> >
> > I borrowed the QA inhibit from vulkan-loader (since they are built
> > mostly the same) but if there is a different path forward, that would be
> > great.
> 
> Thanks. I am not seeing QA inhibits or any special handling in the
> current vulkan-loader:
> https://git.yoctoproject.org/poky/tree/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb?h=master-next

That was my mistake, I guess I don't clearly remember why these were
added in our downstream tree - clearly a poorly executed effort at
getting rid of the error.

> Can you find out why the /usr/lib/libVkLayer_khronos_validation.so is
> built unversioned and where in the source tree that decision is made?

These libraries (plugins, really) are dynamically loaded by the vulkan-loader at runtime. 

I couldn't immediately find an standard online but a cursory glance of the vulkan
drivers/layers from other distros use a .so format, for example:

https://packages.debian.org/buster/amd64/mesa-vulkan-drivers/filelist

And from mesa in OE:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/mesa/mesa.inc#n304

I agree that the existing INSANE_SKIP was the wrong way to go about it -
perhaps the better option would be to do this:

FILES:${PN} = "${libdir}/*.so ${datadir}/vulkan"

I think ${PN}-dev would nominally be empty anyway - the two
outputs of this package are .so layers and a .manifest file for the
loader.

Jordan

