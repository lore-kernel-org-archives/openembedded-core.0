Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1FF731D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:09:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jan 2017 05:09:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,289,1477983600"; d="scan'208";a="1087535157"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 26 Jan 2017 05:09:25 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A1E3D6A4006;
	Thu, 26 Jan 2017 05:08:27 -0800 (PST)
Date: Thu, 26 Jan 2017 14:47:01 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Jukka Laitinen <jukka.laitinen@intel.com>
Message-ID: <20170126124701.GA28320@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1485445413-10553-1-git-send-email-jukka.laitinen@intel.com>
MIME-Version: 1.0
In-Reply-To: <1485445413-10553-1-git-send-email-jukka.laitinen@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: partitionedfs: set partition name for gpt partitions
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
X-List-Received-Date: Thu, 26 Jan 2017 13:09:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jukka,

On Thu, Jan 26, 2017 at 05:43:33PM +0200, Jukka Laitinen wrote:
> Set proper gpt partition name for the partitions in case given
> in the configuration
> 
> Signed-off-by: Jukka Laitinen <jukka.laitinen@intel.com>
> ---
>  scripts/lib/wic/utils/partitionedfs.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
> index 721d514..ed67b9a 100644
> --- a/scripts/lib/wic/utils/partitionedfs.py
> +++ b/scripts/lib/wic/utils/partitionedfs.py
> @@ -316,6 +316,13 @@ class Image():
>                                  (part['num'], part['uuid'], disk['disk'].device),
>                                  self.native_sysroot)
>  
> +            if part['label'] and disk['ptable_format'] == "gpt":
> +                msger.debug("partition %d: set name to %s" % \
> +                            (part['num'], part['label']))
> +                exec_native_cmd("parted -s %s name %d %s" % \
> +                                (disk['disk'].device, part['num'], part['label']),
> +                                self.native_sysroot)
> +
>              if part['boot']:
>                  flag_name = "legacy_boot" if disk['ptable_format'] == 'gpt' else "boot"
>                  msger.debug("Set '%s' flag for partition '%s' on disk '%s'" % \

Thank you for the patch!

+1

--
Regards,
Ed

