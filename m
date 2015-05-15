Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3A94E6AD0D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 08:39:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 15 May 2015 01:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,433,1427785200"; d="scan'208";a="729633839"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2015 01:39:08 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 05FD66A4005;
	Fri, 15 May 2015 01:38:37 -0700 (PDT)
Date: Fri, 15 May 2015 09:45:36 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Message-ID: <20150515064536.GA23106@linux.intel.com>
References: <1431112634-16635-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1431112634-16635-1-git-send-email-alexandre.belloni@free-electrons.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] wic: remove intermediate partitions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 May 2015 08:39:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexandre,

Thank you for the patch! Sorry for delayed review. I was on vacation.

Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>

On Fri, May 08, 2015 at 09:17:14PM +0200, Alexandre Belloni wrote:
> Remove intermediate partitions that may have been created by a previous
> wic invocation. Those partitions are causing issues on some systems. In
> particular vfat partition creation is hanging on mcopy execution on
> Fedora.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
> 
> Changes in v2:
>  - use os.remove instead of executing rm directly.
> 
>  scripts/lib/wic/kickstart/custom_commands/partition.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
> index ff906010b8bf..e864076c992d 100644
> --- a/scripts/lib/wic/kickstart/custom_commands/partition.py
> +++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
> @@ -230,6 +230,7 @@ class Wic_PartData(Mic_PartData):
>          image_rootfs = rootfs_dir
>          rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
>  
> +        os.remove(rootfs)
>          du_cmd = "du -ks %s" % image_rootfs
>          out = exec_cmd(du_cmd)
>          actual_rootfs_size = int(out.split()[0])
> @@ -281,6 +282,7 @@ class Wic_PartData(Mic_PartData):
>          image_rootfs = rootfs_dir
>          rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
>  
> +        os.remove(rootfs)
>          du_cmd = "du -ks %s" % image_rootfs
>          out = exec_cmd(du_cmd)
>          actual_rootfs_size = int(out.split()[0])
> @@ -325,6 +327,7 @@ class Wic_PartData(Mic_PartData):
>          image_rootfs = rootfs_dir
>          rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
>  
> +        os.remove(rootfs)
>          du_cmd = "du -bks %s" % image_rootfs
>          out = exec_cmd(du_cmd)
>          blocks = int(out.split()[0])
> @@ -377,6 +380,7 @@ class Wic_PartData(Mic_PartData):
>          image_rootfs = rootfs_dir
>          rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
>  
> +        os.remove(rootfs)
>          squashfs_cmd = "mksquashfs %s %s -noappend" % \
>                         (image_rootfs, rootfs)
>          exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
> @@ -415,6 +419,7 @@ class Wic_PartData(Mic_PartData):
>          """
>          fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
>  
> +        os.remove(fs)
>          dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
>              (fs, self.size)
>          exec_cmd(dd_cmd)
> @@ -442,6 +447,7 @@ class Wic_PartData(Mic_PartData):
>          """
>          fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
>  
> +        os.remove(fs)
>          dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
>              (fs, self.size)
>          exec_cmd(dd_cmd)
> @@ -466,6 +472,7 @@ class Wic_PartData(Mic_PartData):
>          Prepare an empty vfat partition.
>          """
>          fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
> +        os.remove(fs)
>  
>          blocks = self.size
>  
> @@ -492,6 +499,7 @@ class Wic_PartData(Mic_PartData):
>                        "Proceeding as requested." % self.mountpoint)
>  
>          fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
> +        os.remove(fs)
>  
>          # it is not possible to create a squashfs without source data,
>          # thus prepare an empty temp dir that is used as source
> -- 
> 2.1.4
> 

-- 
--
Regards,
Ed

