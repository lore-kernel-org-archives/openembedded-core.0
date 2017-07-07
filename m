Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A57966E5CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 08:10:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jul 2017 01:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,321,1496127600"; d="scan'208";a="876280091"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2017 01:10:11 -0700
Date: Fri, 7 Jul 2017 11:10:43 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170707081042.GA26547@mbabyjoh-desk.ger.corp.intel.com>
References: <1497280222-11549-1-git-send-email-maxin.john@intel.com>
	<1497280222-11549-2-git-send-email-maxin.john@intel.com>
	<1499353925.5278.21.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1499353925.5278.21.camel@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: enable resolved and networkd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Jul 2017 08:10:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Patrick,

On Thu, Jul 06, 2017 at 05:12:05PM +0200, Patrick Ohly wrote:
> On Mon, 2017-06-12 at 18:10 +0300, Maxin B. John wrote:
> > Enable systemd-resolved and systemd-networkd by default.
> > Make it co-exist with connman and  Fix associated problems
> > in read-only rootfs.
> > 
> > Fixes [YOCTO #11331]
> 
> Let me come back to this, because I think it is not quite working as
> intended yet.
> 
> The goal is that the "right" resolver is chosen via alternative
> priorities, right? So during build time, we set /etc/resolv.conf to what
> is the desired resolver.

Yes. Eventhough for practical reasons, ConnMan's resolver is preferred when
we use ConnMan in the image. That is the reason why we have
"Conflicts=systemd-resolved.service" in "connman.service.in"

> However, there's still a L+ entry for /etc/resolv.conf
> in /usr/lib/tmpfiles.d/connman_resolvconf.conf:
> 
> L+	/etc/resolv.conf	- - - -	/var/run/connman/resolv.conf
> As a result, when systemd is used and the rootfs is read/write, then
> systemd overwrites /etc/resolv.conf, leading to:
> 
> # ls -l /etc/resolv.conf 
> lrwxrwxrwx    1 root     root            28 Jul  6 14:44 /etc/resolv.conf -> /var/run/connman/resolv.conf
> 
> That happens even if systemd-resolved has a higher priority and should
> be used.
> 
> Maxin, do you agree? Can you finish this work and patch the ConnMan
> recipe so that it behaves as expected?

Looks reasonable to me. Thanks for suggesting this. Will update the recipe.

> -- 
> Best Regards, Patrick Ohly

Best Regards,
Maxin

