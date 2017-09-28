Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1D24C60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 15:48:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Sep 2017 08:48:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,450,1500966000"; d="scan'208";a="1176718613"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 28 Sep 2017 08:48:51 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 43E585802DC;
	Thu, 28 Sep 2017 08:48:50 -0700 (PDT)
Date: Thu, 28 Sep 2017 18:47:07 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20170928154707.362zfbhccbydkdox@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1505923407-31734-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1505923407-31734-1-git-send-email-trini@konsulko.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: Generate startup.nsh for EFI cases if none found
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
X-List-Received-Date: Thu, 28 Sep 2017 15:48:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 20, 2017 at 12:03:27PM -0400, Tom Rini wrote:
> In the case of non-wic images there is logic today to generate a
> startup.nsh file that will be executed by EFI to run the loader that the
> image contains.  In the WIC case is currently depends on that file being
> generated elsewhere and placed in DEPLOY_DIR_IMAGE and only used if
> present there.

What's wrong with this approach?

I'd be happy to make wic to do only partitioning and assembling the
image and avoiding to modify image content as much as possible.
That would make wic design much more clear and let us to remove
a lot of duplication between wic and meta/classes code.

Regarding boot partition content, I think preparing it from bootfs
directory the same way as it's done for root partition is the way to go.
You can find more details about it here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10073

>  This extends the logic we have today in wic to save the
> name of the loader that's being placed and if no startup.nsh is provided
> already generate the default kind that grub-efi/systemd-boot.bbclass
> generate.
> 
> Cc: Ed Bartosh <ed.bartosh@linux.intel.com>
> Cc: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 4c4f36a32f56..f4643fc233b2 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -204,13 +204,15 @@ class BootimgEFIPlugin(SourcePlugin):
>                  shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
>                                  "%s/grub.cfg" % cr_workdir)
>                  for mod in [x for x in os.listdir(kernel_dir) if x.startswith("grub-efi-")]:
> -                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[9:])
> +                    loader = mod[9:]
> +                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, loader)
>                      exec_cmd(cp_cmd, True)
>                  shutil.move("%s/grub.cfg" % cr_workdir,
>                              "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
>              elif source_params['loader'] == 'systemd-boot':
>                  for mod in [x for x in os.listdir(kernel_dir) if x.startswith("systemd-")]:
> -                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
> +                    loader = mod[8:]
> +                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, loader)
>                      exec_cmd(cp_cmd, True)
>              else:
>                  raise WicError("unrecognized bootimg-efi loader: %s" %
> @@ -222,6 +224,10 @@ class BootimgEFIPlugin(SourcePlugin):
>          if os.path.exists(startup):
>              cp_cmd = "cp %s %s/" % (startup, hdddir)
>              exec_cmd(cp_cmd, True)
> +        else:
> +            cfg = open("%s/startup.nsh" % hdddir, "w")
> +            cfg.write("fs0:EFI\\BOOT\\%s\n" % loader)
> +            cfg.close()
>  
>          du_cmd = "du -bks %s" % hdddir
>          out = exec_cmd(du_cmd)
> -- 
> 1.9.1
> 

-- 
--
Regards,
Ed

