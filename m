Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 852EB73CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 12:36:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Apr 2015 05:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,537,1422950400"; d="scan'208";a="691406788"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.25.100])
	([10.252.25.100])
	by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2015 05:36:33 -0700
Message-ID: <1428410191.12283.32.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Date: Tue, 07 Apr 2015 15:36:31 +0300
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F496D80@irsmsx105.ger.corp.intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<1428402422.12283.5.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F496CEA@irsmsx105.ger.corp.intel.com>
	<1428406875.12283.8.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F496D80@irsmsx105.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Tue, 07 Apr 2015 12:36:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

(A friendly request: could you use interleaved posting style as
described in the mailing list guidelines here:
https://wiki.yoctoproject.org/wiki/Community_Guidelines )

On Tue, 2015-04-07 at 11:51 +0000, Iorga, Cristian wrote:
> The only way this could be fixed is to remove the aforementioned guidelines..
> Like I said, there are plenty of examples in the code.
> Those packageconfigs where elaborated based on:
> 1. if a package has support for both BlueZ versions;
> 2. If not, usually only BlueZ 4 is supported;
> 
> Care to elaborate how I can fix them otherwise? I am open to suggestions.

Sure, I can give concrete suggestions. This one I already gave in my
first mail:

# Use this with:
#  inherit bluetooth
#  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
#  PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4"
#  PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5"

When someone applies that example to a recipe that only supports one
bluetooth implementation, then the example of course needs some
adaptation, but that's ok. I think the example gives a clear enough idea
how the BLUEZ variable is supposed to be used.

Note that if you anyway want to also give an example of how to deal with
recipes that only support one bluetooth implmementation, I think this
line should be changed:

  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"

The reason is that if the recipe only supports bluez4, for example, then
PACKAGECONFIG should never include bluez5, but that line will put bluez5
to PACKAGECONFIG if the distro's chosen bluetooth implementation is
bluez5. I suppose that doesn't actually break anything, but I don't
think it's a good idea to recommend adding garbage to PACKAGECONFIG.

This would be more appropriate for recipes that only support bluez4:

#  inherit bluetooth
#  PACKAGECONFIG ??= "${@bb.utils.contains('BLUEZ', 'bluez4', 'bluez4, '', d}"
#  PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4"

-- 
Tanu


