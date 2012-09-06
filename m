Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9j0m-0000CS-Jm
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 22:49:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2012 13:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,381,1344236400"; d="scan'208";a="219037827"
Received: from unknown (HELO helios.localnet) ([10.252.121.173])
	by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2012 13:36:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Thu, 06 Sep 2012 21:36:31 +0100
Message-ID: <2236591.qU5F3vlEoV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1346957634-22312-1-git-send-email-jason.wessel@windriver.com>
References: <1346957634-22312-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packageinfo.bbclass: Fix crash in hob
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 20:49:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 06 September 2012 13:53:54 Jason Wessel wrote:
> The hob internally fails after executing a build and invoking
> the hob a second time when it tries to use the values found in
> BUILDDIR/tmp/pkgdata/*/runtime/*
> 
> The internal failure of the hob will manifest itself as
> stating "Populated recipes 99%" forever after selecting
> a machine just after starting the hob interface.
> 
> The internal trace looks like:
> 
> Traceback (most recent call last):
>   File "packageinfo_handler(e)", line 24, in packageinfo_handler
> KeyError: 'PKGV'
> 
> It is a result of using an override for a package version for
> pieces of the toolchain, in the bb file e.g.
>     PKGV_gdb-dbg = "1234.5678"
> 
> The work around for now is to populate the sdata PKGV value
> and to assign the pkgv variable with the correct value
> from the values found in the pkgdata store.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/packageinfo.bbclass |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/packageinfo.bbclass
> b/meta/classes/packageinfo.bbclass index 26cce60..53965e4 100644
> --- a/meta/classes/packageinfo.bbclass
> +++ b/meta/classes/packageinfo.bbclass
> @@ -18,7 +18,12 @@ python packageinfo_handler () {
>                          sdata = oe.packagedata.read_pkgdatafile(root +
> pkgname) sdata['PKG'] = pkgname
>                          pkgrename = sdata['PKG_%s' % pkgname]
> -                        pkgv = sdata['PKGV'].replace('-', '+')
> +                        try:
> +                            pkgv = sdata['PKGV']
> +                        except:
> +			    sdata['PKGV'] = sdata['PKGV_%s' % pkgname]
> +                        pkgv = sdata['PKGV']
> +                        pkgv = pkgv.replace('-', '+')
>                          pkgr = sdata['PKGR']
>                          # We found there are some renaming issue with
> certain architecture. # For example, armv7a-vfp-neon, it will use armv7a in
> the rpm file. This is the workaround for it.

Rather than a blanket try...except which could catch other errors I would 
suggest using .get() to which you can supply a default value if no such key 
exists in the dict.

I'm afraid I didn't get around to determining whether we should be recording 
these package name overrides in the pkgdata files today, I will check into that 
tomorrow.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


