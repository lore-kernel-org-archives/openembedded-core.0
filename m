Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6994CEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 18:25:04 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.3033.1687890303418441470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 11:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=R31leNeQ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RIOub8080015;
	Tue, 27 Jun 2023 13:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687890296;
	bh=9o8/abEm5uBhzzN/QLzemDLcTeyoGjRS+DAy6YuRVac=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=R31leNeQ2jZAlwF2aq6M4obedmYRmeJLPIkbszxbbpEELSsGhD9kWzul4JdIORdli
	 fVK4NDHXZntqACpJk9qRHHdRBy4ttPUdSVim0DNB/9cni8N4oDupxFvFu3d9NGiz2Z
	 dsrrFk7+L1tQgDyM5sr4ZG28cM+ku0aAzC898cRM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RIOuAg048096
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 13:24:56 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 13:24:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 13:24:56 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RIOtMC054546;
	Tue, 27 Jun 2023 13:24:55 -0500
Message-ID: <6e86c4e8-928a-7056-b7cd-3b0216891587@ti.com>
Date: Tue, 27 Jun 2023 13:24:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXTERNAL] Re: [oe-core][kirkstone][PATCHv2 0/8] Backport all
 weston-init qol updates
Content-Language: en-US, en-US-large
To: Steve Sakoman <steve@sakoman.com>
CC: <richard.purdie@linuxfoundation.org>, <denis@denix.org>,
        <openembedded-core@lists.openembedded.org>
References: <20230623162448.3162089-1-rs@ti.com>
 <CAOSpxdYUCYHjzu3J4ZbfeXpyx2+DkgaXvA3fWvVOtazUCSnWtA@mail.gmail.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <CAOSpxdYUCYHjzu3J4ZbfeXpyx2+DkgaXvA3fWvVOtazUCSnWtA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 18:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183496

On 6/27/23 11:00, Steve Sakoman wrote:
> Hi Randolph,
> 
> Unfortunately this patch series results in oe-selftest failures on the
> autobuilder, three examples below:
> 
> https://errors.yoctoproject.org/Errors/Details/710122/
> https://errors.yoctoproject.org/Errors/Details/710127/
> https://errors.yoctoproject.org/Errors/Details/710125/
> 
> Note in particular:
> 
> AssertionError: 1 != 0 : Log:
> /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-1203856/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0-r0/target_logs/dmesg_output.log
> -----------------------
> Central error: [    2.392519] weston[373]: segfault at 28 ip
> 00007fad628102aa sp 00007ffff5bf2410 error 4 in
> libwayland-server.so.0.20.0[7fad6280c000+8000]
> ***********************
> [    1.742836]   with environment:
> [    1.742837]     HOME=/
> [    1.742838]     TERM=linux
> [    1.800627] udevd[167]: starting version 3.2.10
> [    1.806665] udevd[168]: starting eudev-3.2.10
> [    1.964586] EXT4-fs (vda): re-mounted. Opts: (null). Quota mode: disabled.
> [    2.020081] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> [    2.223651] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [    2.224563] Bluetooth: BNEP filters: protocol multicast
> [    2.225490] Bluetooth: BNEP socket layer initialized
> [    2.392519] weston[373]: segfault at 28 ip 00007fad628102aa sp
> 00007ffff5bf2410 error 4 in
> libwayland-server.so.0.20.0[7fad6280c000+8000]
> [    2.394037] Code: 48 8b 47 08 48 8d 77 10 48 8b 78 08 e9 1f c3 ff
> ff 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 41 54 55 48 89 fd 48
> 83 ec 08 <8b> 57 28 4c 8b 67 08 85 d2 79 3b 48 8d 05 64 b0 00 00 48 39
> 07 0f
> 
> ***********************
> 1 errors found in logs.
> 
> Steve

Rats. I'm concerned what could have caused a segfault in 
libwayland-server in this series. This only tweaked Weston launch 
parameters and the only time I've seen that result in instability is 
when you ask Weston to load a module that isn't present. Even that only 
results in a safely handled runtime failure.

I hate to bother you with this, but where is the source code for this 
test? I'd like to poke around a bit more...

Randolph

