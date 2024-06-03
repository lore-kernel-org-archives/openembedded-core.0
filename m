Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E031BC25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 18:02:35 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1360.1717437746192009630
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 11:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jSegRbQe;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 453I23R8121031;
	Mon, 3 Jun 2024 13:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717437723;
	bh=FnbJGzDa9e0so7W9vlGGObpd0OSx6aZyUfd5Bdk4BnA=;
	h=Date:From:To:Subject;
	b=jSegRbQePhuW6t6Ro5azzRL8tx0Fkw1BNDyRGvme4lQRjbTJv78vKKXsZWg1WT3CO
	 a97xiLRCt/cfs7kUh6p0cmhIE0THrbmusiJHUP+rRYVfNmCtCroa2UJ0q2Iow7amW6
	 UbYX472R8WfbQKxQ+pLqzm/K8HsHlvjH3ziIJHPY=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 453I23cw013140
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Jun 2024 13:02:03 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jun 2024 13:02:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jun 2024 13:02:02 -0500
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 453I22ZB102033;
	Mon, 3 Jun 2024 13:02:02 -0500
Message-ID: <f709a2b1-450a-47ab-9438-577c8d5e6bba@ti.com>
Date: Mon, 3 Jun 2024 13:02:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <alex.kanavin@gmail.com>,
        <openembedded-core@lists.openembedded.org>,
        Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <cordlandwehr@kde.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Alexander
 Kanavin <alex.kanavin@gmail.com>
Subject: [oe-core] [RFC] meson.bbclass: pkg-config vs pkgconf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 18:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200276

Hello,

Forgive my ignorance, but is there any particular reason why pkg-config 
is preferred over pkgconf for meson related recipes? It seems the two 
treat the usage of the PKG_CONFIG_SYSROOT_DIR variable differently, 
resulting in issues when build scripts attempting to use package config 
variables directly.

It seems that pkgconf respects PKG_CONFIG_SYSROOT_DIR by prepending that 
path to all variables queried, where as pkg-config just populates an 
internal global variable that the *.pc file must then use (pc_sysrootdir).

The global variable method would work, if any package config generating 
scripts used it by default. Unfortunately the only use I've been able to 
find comes from Yocto related patches specifically added to work around 
this difference in behavior.

You can see some of the attempts to work around this discrepancy here:
recipes-graphics/xorg-proto/xcb-proto/0001-xcb-proto.pc.in-reinstate-libdir.patch
recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
meta-openembedded/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb

If there's not an explicit reason we're preferring pkg-config, would 
anyone be opposed to switching it out for pkgconf for meson related 
packages? Of course, with a note about this behavior discrepancy. It 
would reduce these Yocto specific patches and align meson behavior with 
distros that currently default to pkgconf.

Regards,
Randolph

