Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A1E5D77E93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 08:29:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2017 00:29:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,472,1505804400"; 
   d="scan'208";a="7130295"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Nov 2017 00:29:38 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id B11E0580381;
	Wed, 29 Nov 2017 00:29:37 -0800 (PST)
Date: Wed, 29 Nov 2017 09:16:02 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Martin =?iso-8859-1?Q?Hundeb=F8ll?= <mnhu@prevas.dk>
Message-ID: <20171129071602.4xwhzz3iwzhiikip@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20171128125611.3338-1-mnhu@prevas.dk>
MIME-Version: 1.0
In-Reply-To: <20171128125611.3338-1-mnhu@prevas.dk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: support filesystem label for rawcopy
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
X-List-Received-Date: Wed, 29 Nov 2017 08:29:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Nov 28, 2017 at 01:56:11PM +0100, Martin Hundebøll wrote:
> The '--label' argument should work for '--source rawcopy' as it does for
> '--source rootfs', so add a method in RawCopyPlugin to update the label
> on the temporary filesystem images.
> 
> Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>

Thank you for the patch!

+1

> ---
>  scripts/lib/wic/plugins/source/rawcopy.py | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
> index 424ed26ed6..e86398ac8f 100644
> --- a/scripts/lib/wic/plugins/source/rawcopy.py
> +++ b/scripts/lib/wic/plugins/source/rawcopy.py
> @@ -32,6 +32,25 @@ class RawCopyPlugin(SourcePlugin):
>  
>      name = 'rawcopy'
>  
> +    @staticmethod
> +    def do_image_label(fstype, dst, label):
> +        if fstype.startswith('ext'):
> +            cmd = 'tune2fs -L %s %s' % (label, dst)
> +        elif fstype in ('msdos', 'vfat'):
> +            cmd = 'dosfslabel %s %s' % (dst, label)
> +        elif fstype == 'btrfs':
> +            cmd = 'btrfs filesystem label %s %s' % (dst, label)
> +        elif fstype == 'swap':
> +            cmd = 'mkswap -L %s %s' % (label, dst)
> +        elif fstype == 'squashfs':
> +            raise WicError("It's not possible to update a squashfs "
> +                           "filesystem label '%s'" % (label))
> +        else:
> +            raise WicError("Cannot update filesystem label: "
> +                           "Unknown fstype: '%s'" % (fstype))
> +
> +        exec_cmd(cmd)
> +
>      @classmethod
>      def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
>                               oe_builddir, bootimg_dir, kernel_dir,
> @@ -66,4 +85,7 @@ class RawCopyPlugin(SourcePlugin):
>          if filesize > part.size:
>              part.size = filesize
>  
> +        if part.label:
> +            RawCopyPlugin.do_image_label(part.fstype, dst, part.label)
> +
>          part.source_file = dst
> -- 
> 2.15.0
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

