Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5420EC282EC
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 00:46:25 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.26446.1741740382259330846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 17:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HFJbqeTA;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52C0k4ad860553
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 19:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741740364;
	bh=+8EEUaMK8UdKV2ddnjrxeYJks6Nscr69JaeIH8paH0A=;
	h=Date:From:To:CC:Subject;
	b=HFJbqeTAPWxFynrrmgI5XebT8WWp52ADAgt0rVV27Xe4GGMO4H9HjqeELKqTAInkJ
	 rNAILXvNgqoFyIPIMgoRM7XocHOIGLPmWZFkfqRB2TRhghALc+4zello7Ah2B9XdGv
	 hyF6i1hH5ZXZT9Q9YPTJ8wEeJL6iR+8XPN2zOPTQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52C0k4oO001021
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 19:46:04 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 19:46:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 19:46:03 -0500
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52C0k3wC089497;
	Tue, 11 Mar 2025 19:46:03 -0500
Message-ID: <40fd57cb-deaa-480c-8ec6-87ca1a55e21d@ti.com>
Date: Tue, 11 Mar 2025 19:46:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, Andrew Davis <afd@ti.com>,
        Darren Etheridge
	<detheridge@ti.com>,
        Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon
	<reatmon@ti.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Pothukuchi, Vijay"
	<vijayp@ti.com>
Subject: [oe-core][RFC] Display manager proposal for x11 and wayland
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 00:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212636

We've recently run into some issues with weston-init attempting to start 
Weston prior to all drm devices being registered. There's not really a 
good, scriptable mechanism to listen in to device registration events 
that works with the existing weston-init package. Well, at least one 
that doesn't involve polling files or introducing more dependency on the 
init system being used.

I also see there is also a lot of scripting around starting X11, 
xserver-nodm-init, that (from my limited review) should experience the 
same issue.

I'd like to introduce the following display manager for oe-core, emptty 
[1]. This display manager is, as described upstream, a "Dead simple CLI 
Display Manager on TTY". It supports both x11 and wayland sessions, with 
togglable build parameters to completely remove x11 and pam 
dependencies. It's licensed MIT, which shouldn't be an issue for any 
users. (It is written in Go, if you have opinions about that.)

With this, both weston-init and the xserver-nodm-init packages can be 
re-tuned to leverage this display manager and simply add a user and 
emptty config for an autologin session. This can resolve the current 
behavior across init systems without additional scripting, and move some 
development out of this layer.

I already have a recipe for emptty, but I figured I would reach out for 
comment to recent contributors before I submit any patches playing with 
the existing init packages.

[1] https://github.com/tvrzna/emptty

- Randolph

