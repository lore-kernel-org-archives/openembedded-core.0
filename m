Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 42BBE61EEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 09:33:12 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Jul 2013 02:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,726,1367996400"; d="scan'208";a="335449780"
Received: from unknown (HELO helios.localnet) ([10.252.122.115])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2013 02:33:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
Date: Tue, 23 Jul 2013 10:33:10 +0100
Message-ID: <4759105.uFzpf2uN4o@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/11] Add read PV into recipes
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
X-List-Received-Date: Tue, 23 Jul 2013 09:33:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Emilia,

On Thursday 18 July 2013 17:16:24 Emilia Ciobanu wrote:
> Tested for backwards packages.
> 
> The following changes since commit 3dee534f1e25109e0bdb681de0746c336f4b8840:
> 
>   lib/oeqa: fix dependecy check (2013-07-16 10:04:17 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib emac/pv_fixes
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=emac/pv_fixes
> 
> Emilia Ciobanu (11):
>   rt-tests: add PV variable into recipe
>   kmod: add PV variable into recipe
>   hwlatdetect: add PV variable into recipe
>   lttng-ust: add PV variable into recipe
>   connman-gnome: add PV variable into recipe
>   mtd-utils: add PV variable into recipe
>   update-rc.d: add PV variable into recipe
>   build-appliance-image: add PV variable into recipe
>   lttng-modules: Append _git to recipe name and update PV with git
>     token
>   chkconfig-alternatives-native: add git token in package version
>   docbook-sgml-dtd-4.5-native.bb: Add real PV inside the recipe

Reviewing these for the consolidated pull I noticed that one or two change the 
filename to _git (or that's already the filename) whereas others don't. 

For recipes that do point to a git repository but are fetching the revision 
tagged for a release, it is correct to say they have a fixed PV without 
+git${SRCPV}, which is why we have done this. However, perhaps for consistency 
and avoidance of future confusion if SRCREV is changed we should ignore this.

When the recipe does set PV, it is probably best that the recipe's filename 
doesn't contain a specific version otherwise it could be that it gets upgraded 
later and the version in the filename no longer matches the new PV value. 
Therefore I'd suggest If PV is being set and the recipe is fetching from a git 
repository, we should rename the recipe to use _git.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

