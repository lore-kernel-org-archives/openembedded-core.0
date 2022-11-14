Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3A9C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 15:24:00 +0000 (UTC)
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
 by mx.groups.io with SMTP id smtpd.web09.6837.1668439434839472776
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 07:23:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=NpBgCYyh;
 spf=pass (domain: amazon.com, ip: 99.78.197.218, mailfrom: prvs=310f54154=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1668439435; x=1699975435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yn6M3HbcqYFP44+WlyJHYEmOYl4vkFV+fUM0I6ss1Vs=;
  b=NpBgCYyhZvHcasDeLz3RauFclMVbPHwQNDWgtw1rL5flkKPYxVNlPmyt
   GoxBLWLCtdgR0iyzCasT55VDzuM8eaPwvkpYQ3+u2se5tXLDsqgRVksc+
   AMSv1pEU8eqEZ8Z0H9SoFawz+5T5U1PWg6s6umLk9ezUb/9rNS9oXDc8Q
   I=;
X-IronPort-AV: E=Sophos;i="5.96,164,1665446400"; 
   d="scan'208";a="150526401"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-3554bfcf.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 15:23:53 +0000
Received: from EX13MTAUWB002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1e-m6i4x-3554bfcf.us-east-1.amazon.com (Postfix) with ESMTPS id CD189859EB;
	Mon, 14 Nov 2022 15:23:51 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX13MTAUWB002.ant.amazon.com (10.43.161.202) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Mon, 14 Nov 2022 15:23:49 +0000
Received: from amazon.com (10.43.162.178) by EX19D047UWB002.ant.amazon.com
 (10.13.138.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20; Mon, 14 Nov 2022
 15:23:49 +0000
Date: Mon, 14 Nov 2022 08:23:47 -0700
From: Jordan Crouse <jorcrous@amazon.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] vulkan-validation: Add the official Vulkan
 validation layers
Message-ID: <20221114152347.z67ftsylidd3tfjt@amazon.com>
References: <20221110204232.12768-1-jorcrous@amazon.com>
 <20221110204232.12768-4-jorcrous@amazon.com>
 <Y3Frpp2ImWRduS8k@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y3Frpp2ImWRduS8k@mail.local>
User-Agent: NeoMutt/20171215
X-Originating-IP: [10.43.162.178]
X-ClientProxiedBy: EX13D29UWA001.ant.amazon.com (10.43.160.187) To
 EX19D047UWB002.ant.amazon.com (10.13.138.34)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 15:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173249

On Sun, Nov 13, 2022 at 11:11:50PM +0100, Alexandre Belloni wrote:
> Hello,
> 
> On 10/11/2022 20:42:32+0000, Jordan Crouse via lists.openembedded.org wrote:
> > Add a recipe to build the Khronos official Vulkan validation layers that can
> > assist developers in verifying that their applications correctly use the
> > Vulkan APIs.
> >
> 
> 
> This failed on the autobuilders:
> 
> NOTE: recipe vulkan-validation-1.3.231.1-r0: task do_compile: Started
> ERROR: vulkan-validation-1.3.231.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/run.do_compile.3939056', 1, None, None)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/log.do_compile.3939056
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/build --target all --
> | ninja: error: '/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/recipe-sysroot/usr/lib', needed by 'layers/libVkLayer_khronos_validation.so', missing and no known rule to make it
> | WARNING: /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/run.do_compile.3939056:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
> | WARNING: Backtrace (BB generated script):
> |       #1: cmake_runcmake_build, /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/run.do_compile.3939056, line 153
> |       #2: cmake_do_compile, /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/run.do_compile.3939056, line 147
> |       #3: do_compile, /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/run.do_compile.3939056, line 142
> |       #4: main, /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/vulkan-validation/1.3.231.1-r0/temp/run.do_compile.3939056, line 166
> NOTE: recipe vulkan-validation-1.3.231.1-r0: task do_compile: Failed
> ERROR: Task (/home/pokybuild/yocto-worker/qemux86-world/build/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb:do_compile) failed with exit code '1'
> 
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/6064/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3735/steps/12/logs/stdio

Thanks, I'll see if I can figure out what happened here.

Jordan

