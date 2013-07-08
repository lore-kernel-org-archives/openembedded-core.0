Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3B337608C6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 15:48:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2013 08:45:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1021,1363158000"; d="scan'208";a="342199515"
Received: from unknown (HELO helios.localnet) ([10.252.122.28])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2013 08:47:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 08 Jul 2013 16:47:57 +0100
Message-ID: <5517861.pGMakEMcrE@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <1373105044-30014-1-git-send-email-Martin.Jansa@gmail.com>
References: <20130704083054.GA3259@jama>
	<1373105044-30014-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] buildhistory: Record size of installed package not compressed archive
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
X-List-Received-Date: Mon, 08 Jul 2013 15:48:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 06 July 2013 12:04:04 Martin Jansa wrote:
> * usually it's more important to know how much space will each
>   package take on target device then size of compressed package
> * example for libewebkit0 with 4 different architectures, interesting
>   that om_gta02 .ipk is bigger but it's smaller when installed
> 
>   before:
>   MACHINE     DEFAULTTUNE       SIZE (.ipk file)
>   om_gta04    cortexa8t-neon    15996 KiB libewebkit0
>   qemux86_64  x86-64            16992 KiB libewebkit0
>   spitz       xscale            16148 KiB libewebkit0
>   om_gta02    arm920t           16260 KiB libewebkit0
> 
>   after:
>   MACHINE     DEFAULTTUNE       SIZE (installed)
>   om_gta04    cortexa8t-neon    60544 KiB libewebkit0
>   qemux86_64  x86-64            63720 KiB libewebkit0
>   spitz       xscale            60588 KiB libewebkit0
>   om_gta02    arm920t           56268 KiB libewebkit0
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 11 ++++----
>  scripts/oe-pkgdata-util           | 59
> ++++++++++++++++++++++++++++++++++++--- 2 files changed, 61 insertions(+),
> 9 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index 36e7fe1..1ebe68e 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -317,6 +317,8 @@ buildhistory_get_installed() {
>  	# Get list of installed packages
>  	pkgcache="$1/installed-packages.tmp"
>  	list_installed_packages file | sort > $pkgcache
> +	pkgcachearch="$1/installed-packages-arch.tmp"
> +	list_installed_packages arch | sort > $pkgcachearch

If possible I would prefer to avoid having to query the installed package list 
twice; I know that would mean changing every backend. I can look at this if 
you're short on time.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

