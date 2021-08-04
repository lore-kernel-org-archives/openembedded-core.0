Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.13167.1628101468435705293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 11:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C91D640C1E;
	Wed,  4 Aug 2021 18:24:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rvKE3pyi-ZgK; Wed,  4 Aug 2021 18:24:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC72540BEC;
	Wed,  4 Aug 2021 18:24:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0D4A317464F; Wed,  4 Aug 2021 14:24:26 -0400 (EDT)
Date: Wed, 4 Aug 2021 14:24:26 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libwpe: remove rpi-specific custom code
Message-ID: <20210804182426.GZ1528@denix.org>
References: <1628040856-46307-1-git-send-email-denis@denix.org>
 <d12919cd-3e16-5980-dd3f-60df68590e61@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d12919cd-3e16-5980-dd3f-60df68590e61@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 04, 2021 at 10:54:32AM -0700, Khem Raj wrote:
> 
> 
> On 8/3/21 6:34 PM, Denys Dmytriyenko wrote:
> >This recipe was ported from another layer, which had special handling for rpi.
> >
> >OE-Core doesn't have 'rpi' override, doesn't define 'vc4graphics' DISTRO_FEATURES
> >and overall, BSP-specifics should be handled in downstream layers, not in OE-Core.
> >
> 
> Thats fine, however, this will regress rpi BSPs, so either send a
> patch to add it via a bbappend to meta-raspberrypi or open a ticket
> so someone can get it done

It has already regressed, as :append_rpi is not a correct override.
Ticket open - https://github.com/agherzan/meta-raspberrypi/issues/893


> >Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> >---
> >  meta/recipes-sato/webkit/libwpe_1.10.1.bb | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> >diff --git a/meta/recipes-sato/webkit/libwpe_1.10.1.bb b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
> >index 22fff93..6f2fe1d 100644
> >--- a/meta/recipes-sato/webkit/libwpe_1.10.1.bb
> >+++ b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
> >@@ -6,9 +6,6 @@ LICENSE = "BSD"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=371a616eb4903c6cb79e9893a5f615cc"
> >  DEPENDS = "virtual/egl libxkbcommon"
> >-# Workaround build issue with RPi userland EGL libraries.
> >-CFLAGS:append_rpi = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', '-D_GNU_SOURCE', d)}"
> >-
> >  inherit cmake features_check
> >  REQUIRED_DISTRO_FEATURES = "opengl"
