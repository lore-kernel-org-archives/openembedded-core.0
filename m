Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F66C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 23:31:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1507.1747265495636180067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 16:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PpFkYEdO;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54ENVNKr3290032;
	Wed, 14 May 2025 18:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747265483;
	bh=PSbqDNzfJZ5Yy02WNJwqozu4RQQA529SZBpRasMOxZc=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=PpFkYEdOGmGfeXi5hsrsoiHsTOjp81uPmuOimEOIOxci2M3NOQs4vBBHUha/dk0sj
	 jLnrSsZU1sCFVGv3EML6RX7PNqBK9dvEt7fRt2O6+GcJIfc9iIDfUArd7wozbIlYwz
	 PPNfqOui3yDDSCPsxvE5npVhfBS9l3p0NmxnU/W4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54ENVNh42427157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 14 May 2025 18:31:23 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 18:31:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 18:31:23 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54ENVN0k080455;
	Wed, 14 May 2025 18:31:23 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 May 2025 18:31:23 -0500
Message-ID: <D9W9X5U8XQSN.V0E9F69N4BHY@ti.com>
Subject: Re: [oe-core][PATCHv3 2/3] weston-init: convert to
 virtual-emptty-conf
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250514220924.2644712-1-rs@ti.com>
 <183F87DF8890A278.12622@lists.openembedded.org>
In-Reply-To: <183F87DF8890A278.12622@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 23:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216559

On Wed May 14, 2025 at 5:09 PM CDT, Randolph Sapp via lists.openembedded.or=
g wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Convert this script package into a simple config for emptty using the
> same weston user but leveraging the nopasswdlogin session provided by
> emptty. Runtime provide virtual-emptty-conf as we need to set parameters
> for the default session.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta/lib/oeqa/runtime/cases/weston.py         |  2 +-
>  meta/recipes-graphics/wayland/weston-init.bb  | 61 +++------------
>  .../wayland/weston-init/emptty.conf           | 77 +++++++++++++++++++
>  .../recipes-graphics/wayland/weston-init/init | 54 -------------
>  .../wayland/weston-init/weston-autologin      | 11 ---
>  .../wayland/weston-init/weston-socket.sh      | 20 -----
>  .../wayland/weston-init/weston-start          | 76 ------------------
>  .../wayland/weston-init/weston.env            |  0
>  .../wayland/weston-init/weston.service        | 71 -----------------
>  .../wayland/weston-init/weston.socket         | 14 ----
>  10 files changed, 90 insertions(+), 296 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.conf
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-auto=
login
>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-sock=
et.sh
>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-star=
t
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.serv=
ice
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.sock=
et
>

[snip]

Rats. I thought I had it sorted, but as it turns out the wayland failures a=
re
actually partially due to weston's xwayland launcher failing to create
/tmp/.X11-unix/ if it doesn't exist. Manually creating that directory with
root:root 777 as advised allows it to start correctly. Otherwise it just ba=
ils
out.

Suppose I'll have to fix that first.

