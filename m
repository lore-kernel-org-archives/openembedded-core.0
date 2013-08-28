Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 042BC6BA22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 08:41:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2013 01:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,974,1367996400"; d="scan'208";a="394598194"
Received: from unknown (HELO helios.localnet) ([10.252.123.7])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2013 01:41:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mikhail Durnev <Mikhail_Durnev@mentor.com>
Date: Wed, 28 Aug 2013 09:41:19 +0100
Message-ID: <3236564.Bbn6H3DI5P@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <521C48D3.3010901@mentor.com>
References: <521C48D3.3010901@mentor.com>
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: classes/insane: add check for PN in OVERRIDES
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
X-List-Received-Date: Wed, 28 Aug 2013 08:41:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mikhail,

On Tuesday 27 August 2013 17:36:03 Mikhail Durnev wrote:
> I have a question about your commit c331f0a:
> 
> -------------------------------------------
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 4d2392e..fb18022 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -907,6 +907,11 @@ python () {
>       if d.getVar('do_stage', True) is not None:
>           bb.fatal("Legacy staging found for %s as it has a do_stage
> function. This will need conversion to a do_install or often simply
> removal to work with OE-core" % d.getVar("FILE", True))
> 
> +    overrides = d.getVar('OVERRIDES', True).split(':')
> +    pn = d.getVar('PN', True)
> +    if pn in overrides:
> +        bb.warn('Recipe %s has PN of "%s" which is in OVERRIDES, this
> can result in unexpected behaviour.' % (d.getVar("FILE", True), pn))
> +
>       issues = []
>       if (d.getVar('PACKAGES', True) or "").split():
>           for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS',
> 'RCONFLICTS', 'RPROVIDES', 'RREPLACES', 'FILES', 'pkg_preinst',
> 'pkg_postinst', 'pkg_prerm', 'pkg_postrm', 'ALLOW_EMPTY':
> ----------------------------------------------
> 
> A recipe (lets say linux_git.bb) has its PN in OVERRIDES with prefix
> 'pn-' (pn-linux). So, if we have 'linux' in OVERRIDES then it cannot
> interfere.

Unfortunately that is not the case. If PN is "linux" and TARGET_OS is "linux" 
(note, for ARM machines only TARGET_OS may be "linux-gnueabi" rather than 
"linux") then statements such as this:

FILES_${PN} = "/path/to/file"

will immediately become:

FILES = "/path/to/file"

Which itself will trigger a warning about FILES not being package specific. 
Without an explicit check on PN being in OVERRIDES it's not immediately 
obvious what has happened.

Additionally consider the following case in local.conf:

PREFERRED_VERSION_linux = "3.8.10"

This will turn into PREFERRED_VERSION = "3.8.10" and then you'll get a bunch 
of spewed notices about version "3.8.10" being unavailable for every recipe in 
the system that you're building.

PN in OVERRIDES is bad news, which is why we added this warning. You really do 
need to name your recipes so that they don't clash with items in OVERRIDES.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

