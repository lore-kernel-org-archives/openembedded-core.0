Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AB4C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 14:24:49 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.23505.1754663088081446470
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 07:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xpk5dZvD;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 578EOgH91062710;
	Fri, 8 Aug 2025 09:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754663082;
	bh=M/9V2fYi5JzC+74WYKAvt2iqFlNNywGlA6d26VCl28g=;
	h=Date:To:From:Subject;
	b=xpk5dZvDQeU/z6znsbLq6wr8mMXNPW9AtwCXnLJ2gTsdEOkF5CLpp9KYAHtsRlKG8
	 PfiDPu7ZzW2LU/15wRR5rDXGMnR3pau2kAYNYAA11qKJr2qzF0LpZ7aG8wzXdtnoeW
	 c8C3jsbIjJDCGH5WkzTQ1ujUj7WT5+XGNjfxuy6Q=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 578EOfgr545103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 8 Aug 2025 09:24:41 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 09:24:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 09:24:41 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 578EOfJr2870277;
	Fri, 8 Aug 2025 09:24:41 -0500
Message-ID: <f9092d37-56a3-47c7-bb04-396d7ba61691@ti.com>
Date: Fri, 8 Aug 2025 09:24:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
From: Ryan Eatmon <reatmon@ti.com>
Subject: clang package sizes
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 14:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221656


I've been noticing that the master final build sizes have increased a 
lot from scarthgap to master.  Some increase is inevitable, but I was 
seeing an almost 10gig increase in size.  So I started comparing our 
scarthgap builds against our master builds and I tracked down the 
biggest offender to the packages (.ipk).

So I dug further, wrote a perl script to compare the two directories and 
found two very big offenders.

INC:   94M -> 4.1G  4366.38%  clang-staticdev
INC:   18M -> 3.4G  19242.22%  clang-dbg

 From the meta-clang setup in scarthgap to the oe-core versions of the 
packages I'm seeing a huge blow up.  Can anyone with some knowledge of 
the differences between the two approaches verify that this is expected 
and not just something overlooked in the new setup?


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

