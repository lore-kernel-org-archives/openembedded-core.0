Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 955766FF93
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 17:21:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 29 Feb 2016 09:20:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="56931597"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 29 Feb 2016 09:20:41 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 231DF2C8001;
	Mon, 29 Feb 2016 10:08:28 -0800 (PST)
Date: Mon, 29 Feb 2016 17:11:06 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160229151106.GA3674@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1456420909-9926-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1456420909-9926-1-git-send-email-kergoth@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: don't throw away our created swap partition
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
X-List-Received-Date: Mon, 29 Feb 2016 17:21:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cristopher,

Thank you for the patch!

Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>

On Thu, Feb 25, 2016 at 10:21:49AM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> We were creating the partition, mkswap'ing it, and then not dd'ing it into
> place in the final image, as source_file wasn't being set for swap partitions.
> This would result in a swap partition that couldn't be enabled on target until
> mkswap was run.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  scripts/lib/wic/kickstart/custom_commands/partition.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
> index eee25a4..a0e74aa 100644
> --- a/scripts/lib/wic/kickstart/custom_commands/partition.py
> +++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
> @@ -173,6 +173,7 @@ class Wic_PartData(FC4_PartData):
>              if self.fstype and self.fstype == "swap":
>                  self.prepare_swap_partition(cr_workdir, oe_builddir,
>                                              native_sysroot)
> +                self.source_file = "%s/fs.%s" % (cr_workdir, self.fstype)
>              elif self.fstype:
>                  rootfs = "%s/fs_%s.%s.%s" % (cr_workdir, self.label,
>                                               self.lineno, self.fstype)
> -- 
> 2.2.1
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

