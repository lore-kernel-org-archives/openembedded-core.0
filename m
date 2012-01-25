Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RpvvA-00041X-LG
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 07:01:24 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jan 2012 21:53:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115864056"
Received: from unknown (HELO [10.255.13.231]) ([10.255.13.231])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2012 21:53:37 -0800
From: Tom Zanussi <tom.zanussi@intel.com>
To: Darren Hart <dvhart@linux.intel.com>
In-Reply-To: <68ac20e3e44f7da9e9732c1dc38448c07708475e.1327468756.git.dvhart@linux.intel.com>
References: <cover.1327468756.git.dvhart@linux.intel.com>
	<68ac20e3e44f7da9e9732c1dc38448c07708475e.1327468756.git.dvhart@linux.intel.com>
Date: Tue, 24 Jan 2012 23:53:00 -0600
Message-ID: <1327470780.21937.55.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] bootimg: Fix a math thinko in the block count calculation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2012 06:01:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-24 at 21:20 -0800, Darren Hart wrote:
> Fixes [YOCTO #1852] ... again.
> 
> The conversion from sectors to blocks was multiplying by 2 instead
> of dividing by 2. Blocks are 1024 bytes, sectors are 512 bytes. The
> result was images being much larger than intended.
> 

Much better, thanks for the quick fix.

Tested-by: Tom Zanussi <tom.zanussi@intel.com>

> Reported-by: Tom Zanussi <tom.zanussi@intel.com>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/classes/bootimg.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index df3ee73..e65bef7 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -133,7 +133,7 @@ build_hddimg() {
>  		SECTORS=$(expr $SECTORS + $(expr $DIR_SECTORS + $FAT_SECTORS))
>  
>  		# Determine the final size in blocks accounting for some padding
> -		BLOCKS=$(expr $(expr $SECTORS \* 2) + ${BOOTIMG_EXTRA_SPACE})
> +		BLOCKS=$(expr $(expr $SECTORS / 2) + ${BOOTIMG_EXTRA_SPACE})
>  
>  		# Ensure total sectors is an integral number of sectors per
>  		# track or mcopy will complain. Sectors are 512 bytes, and we




