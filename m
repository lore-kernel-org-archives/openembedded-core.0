Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7906BCAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 15:15:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11863.1759418113897262140
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 08:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B87B640C85;
	Thu,  2 Oct 2025 15:15:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXQuqTLD23fz; Thu,  2 Oct 2025 15:15:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9336640B96;
	Thu,  2 Oct 2025 15:15:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EE6511640DC; Thu,  2 Oct 2025 11:15:09 -0400 (EDT)
Date: Thu, 2 Oct 2025 11:15:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: mathieu.dubois-briand@bootlin.com
Cc: anna-lena.marx@inovex.de, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Message-ID: <20251002151509.GD3125@denix.org>
References: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
 <DD7SOFNX7NVH.2H7W150BPF4GW@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD7SOFNX7NVH.2H7W150BPF4GW@bootlin.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 15:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224367

On Thu, Oct 02, 2025 at 01:20:35PM +0200, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Wed Oct 1, 2025 at 5:28 PM CEST, Anna-Lena Marx via lists.openembedded.org wrote:
> > With the upgrade to 3.50.4, some configure options changed
> > as the project switched from `autotools` to `autosetup`.
> > The PACKAGECONFIG "dyn_ext" is not longer available.
> > Besides, the default CONFIGUREOPTS "target", "exec_prefix"
> > and "oldincludedir" became invalid.
> >
> > Changelog: https://sqlite.org/releaselog/3_50_4.html
> >
> > Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
> > ---
> 
> Hi Anna-Lena,
> 
> Thanks for your patch.
> 
> > +INSANE_SKIP:${MLPREFIX}lib${BPN} = "useless-rpaths"

In general, adding a new INSANE_SKIP warrants a brief explanation.


> I believe this check is not allowed to be skipped. The yocto-check-layer
> script is not happy about this line:

For additional context:

https://git.openembedded.org/openembedded-core/commit/?id=ce2e42ace2d15fb6745437cf0a7f07d28398ca12


> Parsing recipes...ERROR: /srv/pokybuild/yocto-worker/check-layer/build/meta/recipes-support/sqlite/sqlite3_3.50.4.bb: QA Issue: Package libsqlite3 is skipping required QA tests. [useless-rpaths]
> ERROR: /srv/pokybuild/yocto-worker/check-layer/build/meta/recipes-support/sqlite/sqlite3_3.50.4.bb: Fatal QA errors were found, failing task.
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/27/builds/2496
> 
> Can you fix this another way?

