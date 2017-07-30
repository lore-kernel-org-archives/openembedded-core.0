Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 19E3C782BB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 10:25:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 30 Jul 2017 03:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,436,1496127600"; d="scan'208";a="293329708"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 30 Jul 2017 03:25:27 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 665F158039A;
	Sun, 30 Jul 2017 03:25:26 -0700 (PDT)
Date: Sun, 30 Jul 2017 13:02:36 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20170730100236.GA28203@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170728144527.24322-1-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170728144527.24322-1-net147@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] wic: ensure generated disk system identifier is non-zero
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
X-List-Received-Date: Sun, 30 Jul 2017 10:25:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 29, 2017 at 12:45:27AM +1000, Jonathan Liu wrote:
> Zero may be interpreted as no MBR signature present and another
> partitioning program might install a new MBR signature.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index f20d8433f1..fe9b688ab0 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -297,7 +297,7 @@ class PartitionedImage():
>                            # all partitions (in bytes)
>          self.ptable_format = ptable_format  # Partition table format
>          # Disk system identifier
> -        self.identifier = int.from_bytes(os.urandom(4), 'little')
> +        self.identifier = int.from_bytes(os.urandom(4), 'little') or 0xffffffff
>  

Can we generate random identifier by calling os.urandom again if
self.identifier is zero? Something like this, may be?

while True:
    self.identifier = int.from_bytes(os.urandom(4), 'little')
    if self.identifier:
        break

Assigning constant 0xffffffff can potentially create nonunique identifiers.

>          self.partitions = partitions
>          self.partimages = []
> -- 
> 2.13.2
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

