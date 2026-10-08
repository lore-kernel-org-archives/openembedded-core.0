Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64178CA6007
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 01:17:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6280.1791422234137323916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 18:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 15F3440CAB;
	Thu,  8 Oct 2026 01:17:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zwjNhFMGrlME; Thu,  8 Oct 2026 01:17:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C415140A22;
	Thu,  8 Oct 2026 01:17:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F355517EEF3; Wed,  7 Oct 2026 21:17:08 -0400 (EDT)
Date: Wed, 7 Oct 2026 21:17:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: joerg.vehlow@emlix.com, openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH] libgcc: fix build for baremetal
Message-ID: <20261008011708.GQ4190@denix.org>
References: <20261007055706.1493585-1-joerg.vehlow@emlix.com>
 <5982d605-36e8-4a04-810f-d4fdebf75cdd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5982d605-36e8-4a04-810f-d4fdebf75cdd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 01:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247405

On Wed, Oct 07, 2026 at 03:33:56PM -0500, Ryan Eatmon wrote:
> 
> 
> On 10/7/2026 12:57 AM, Joerg Vehlow via lists.openembedded.org wrote:
> >By removing the erroneous EXTRA_OECONF override in 020d5f0, gcc-cross is now configured with correct sysroot flags, which removes the hosts include directory from the internal paths.
> >This in turn leads to libgcc not finding libc headers (as it should) and breaks libgcc build.
> >In order to fix this, libgcc must be built almost like libgcc-initial.
> >
> >Signed-off-by: Joerg Vehlow <joerg.vehlow@emlix.com>
> >---
> >  meta/recipes-devtools/gcc/libgcc.inc | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> >diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
> >index e92dadf021..93e217f567 100644
> >--- a/meta/recipes-devtools/gcc/libgcc.inc
> >+++ b/meta/recipes-devtools/gcc/libgcc.inc
> >@@ -37,6 +37,16 @@ LICENSE:${PN}-dev = "GPL-3.0-or-later WITH GCC-exception-3.1"
> >  LICENSE:${PN}-dbg = "GPL-3.0-or-later WITH GCC-exception-3.1"
> >  LICENSE:${PN}-src = "GPL-3.0-or-later WITH GCC-exception-3.1"
> >+# On baremetal there is no libc:
> >+# configure need limits.h for its sanity check
> >+# libc dependencies have to be patched out just like in libgcc-initial
> >+do_configure:prepend:libc-baremetal () {
> >+	install -d ${STAGING_INCDIR}
> >+	touch ${STAGING_INCDIR}/limits.h
> >+	sed -i -e 's#INHIBIT_LIBC_CFLAGS =.*#INHIBIT_LIBC_CFLAGS = -Dinhibit_libc#' ${B}/gcc/libgcc.mvars
> >+	sed -i -e 's#inhibit_libc = false#inhibit_libc = true#' ${B}/gcc/Makefile
> >+}
> >+
> >  FILES:${PN}-dev = "\
> >      ${base_libdir}/libgcc*.so \
> >      ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
> 
> 
> This does fix our build issue.  So it should be safe to pick up this
> patch and not revert the original change.

Yes, I can confirm this change fixes all my other test builds for this issue.

-- 
Denys

