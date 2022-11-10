Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0225EC433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 21:30:40 +0000 (UTC)
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by mx.groups.io with SMTP id smtpd.web08.1585.1668115830747758010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 13:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=YaLTn+fT;
 spf=pass (domain: amazon.com, ip: 72.21.196.25, mailfrom: prvs=3066031d8=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1668115831; x=1699651831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8vZGzGK7ejJz4UtCKcu3eGO8Tyu5O4eveLADrYhYvh4=;
  b=YaLTn+fTyJBlDy+PQ48l2q1NEJn3SMm2xNFDPxRCRGs7l/rCFFmqPil1
   UNpAsssq7TQfNTMWPbiebw+CYZv7EEr1F0XwQRWXQiLWlpuFesmnDYzCE
   eGiFtr+iGMGD77+8wdieyKIeb6Gx3tofj+6LYzDVGv8LHKA/xswVWDY4T
   I=;
X-IronPort-AV: E=Sophos;i="5.96,154,1665446400"; 
   d="scan'208";a="261912973"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1d-m6i4x-153b24bc.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 21:30:29 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1d-m6i4x-153b24bc.us-east-1.amazon.com (Postfix) with ESMTPS id 664DFC1F93;
	Thu, 10 Nov 2022 21:30:28 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Thu, 10 Nov 2022 21:30:27 +0000
Received: from amazon.com (10.43.161.14) by EX19D047UWB002.ant.amazon.com
 (10.13.138.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20; Thu, 10 Nov 2022
 21:30:27 +0000
Date: Thu, 10 Nov 2022 14:30:24 -0700
From: Jordan Crouse <jorcrous@amazon.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] vulkan-validation: Add the official Vulkan
 validation layers
Message-ID: <20221110213024.ob3bvz4g2hsixmu3@amazon.com>
References: <20221110204232.12768-1-jorcrous@amazon.com>
 <20221110204232.12768-4-jorcrous@amazon.com>
 <CANNYZj8Q4yDjr-=-u4VCMYf8khBDUmwu9+c7qKezqKSx-9grZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CANNYZj8Q4yDjr-=-u4VCMYf8khBDUmwu9+c7qKezqKSx-9grZA@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-Originating-IP: [10.43.161.14]
X-ClientProxiedBy: EX13D24UWA002.ant.amazon.com (10.43.160.200) To
 EX19D047UWB002.ant.amazon.com (10.13.138.34)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 21:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173111

On Thu, Nov 10, 2022 at 09:57:55PM +0100, Alexander Kanavin wrote:
> On Thu, 10 Nov 2022 at 21:42, Jordan Crouse via lists.openembedded.org

<snip>

> > +FILES:${PN} += "/usr/share/vulkan/ /usr/lib/"
> > +
> > +INSANE_SKIP:${PN} += " ldflags"
> > +INHIBIT_PACKAGE_STRIP = "1"
> > +INHIBIT_SYSROOT_STRIP = "1"
> > +SOLIBS = ".so"
> > +FILES_SOLIBSDEV = ""
> 
> All of the above should be removed. If there are error messages due to
> that, please show them, and we'll figure out how to address them
> properly.

ERROR: vulkan-validation-1.3.231.1-r0 do_package_qa: QA Issue: -dev package vulkan-validation-dev contains non-symlink .so '/usr/lib/libVkLayer_khronos_validation.so' [dev-elf]

I borrowed the QA inhibit from vulkan-loader (since they are built
mostly the same) but if there is a different path forward, that would be
great.

Jordan

