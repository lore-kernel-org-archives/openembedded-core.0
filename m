Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AC06F7077E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 00:01:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2014 16:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,727,1400050800"; d="scan'208";a="548710103"
Received: from unknown (HELO [10.255.12.245]) ([10.255.12.245])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2014 17:00:55 -0700
Message-ID: <1406246456.6205.11.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Thu, 24 Jul 2014 19:00:56 -0500
In-Reply-To: <1406203910-16569-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1406147959.6335.44.camel@empanada>
	<1406203910-16569-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] wic: squashfs partition support
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
X-List-Received-Date: Fri, 25 Jul 2014 00:01:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-07-24 at 14:11 +0200, Maciej Borzecki wrote:
> It is possible to instruct wic to create a squashfs partition by setting
> --fstype=squashfs in *.wks. For now this is only useable for rootfs
> partitions (note that you must have squashfs support in the kernel). An
> attempt to create an empty partition will produce a warning.
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>

Acked-by: Tom Zanussi <tom.zanussi@intel.com>

> ---
>  .../lib/mic/kickstart/custom_commands/partition.py | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
> index d0f1b78..ce90aa1 100644
> --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> @@ -25,6 +25,8 @@
>  #
>  
>  import shutil
> +import os
> +import tempfile
>  
>  from pykickstart.commands.partition import *
>  from mic.utils.oe.misc import *
> @@ -192,6 +194,10 @@ class Wic_PartData(Mic_PartData):
>              return self.prepare_rootfs_vfat(cr_workdir, oe_builddir,
>                                              rootfs_dir, native_sysroot,
>                                              pseudo)
> +        elif self.fstype.startswith("squashfs"):
> +            return self.prepare_rootfs_squashfs(cr_workdir, oe_builddir,
> +                                                rootfs_dir, native_sysroot,
> +                                                pseudo)
>  
>      def prepare_rootfs_ext(self, cr_workdir, oe_builddir, rootfs_dir,
>                             native_sysroot, pseudo):
> @@ -324,6 +330,28 @@ class Wic_PartData(Mic_PartData):
>          self.set_size(rootfs_size)
>          self.set_source_file(rootfs)
>  
> +    def prepare_rootfs_squashfs(self, cr_workdir, oe_builddir, rootfs_dir,
> +                                native_sysroot, pseudo):
> +        """
> +        Prepare content for a squashfs rootfs partition.
> +        """
> +        image_rootfs = rootfs_dir
> +        rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
> +
> +        squashfs_cmd = "mksquashfs %s %s -noappend" % \
> +                       (image_rootfs, rootfs)
> +        rc, out = exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
> +
> +        # get the rootfs size in the right units for kickstart (Mb)
> +        du_cmd = "du -Lbms %s" % rootfs
> +        rc, out = exec_cmd(du_cmd)
> +        rootfs_size = out.split()[0]
> +
> +        self.size = rootfs_size
> +        self.source_file = rootfs
> +
> +        return 0
> +
>      def prepare_empty_partition(self, cr_workdir, oe_builddir, native_sysroot):
>          """
>          Prepare an empty partition.
> @@ -337,6 +365,9 @@ class Wic_PartData(Mic_PartData):
>          elif self.fstype.startswith("vfat"):
>              return self.prepare_empty_partition_vfat(cr_workdir, oe_builddir,
>                                                       native_sysroot)
> +        elif self.fstype.startswith("squashfs"):
> +            return self.prepare_empty_partition_squashfs(cr_workdir, oe_builddir,
> +                                                         native_sysroot)
>  
>      def prepare_empty_partition_ext(self, cr_workdir, oe_builddir,
>                                      native_sysroot):
> @@ -398,6 +429,36 @@ class Wic_PartData(Mic_PartData):
>  
>          return 0
>  
> +    def prepare_empty_partition_squashfs(self, cr_workdir, oe_builddir,
> +                                         native_sysroot):
> +        """
> +        Prepare an empty squashfs partition.
> +        """
> +        msger.warning("Creating of an empty squashfs %s partition was attempted. " \
> +                      "Proceeding as requested." % self.mountpoint)
> +
> +        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
> +
> +        # it is not possible to create a squashfs without source data,
> +        # thus prepare an empty temp dir that is used as source
> +        tmpdir = tempfile.mkdtemp()
> +
> +        squashfs_cmd = "mksquashfs %s %s -noappend" % \
> +                       (tmpdir, fs)
> +        rc, out = exec_native_cmd(squashfs_cmd, native_sysroot)
> +
> +        os.rmdir(tmpdir)
> +
> +        # get the rootfs size in the right units for kickstart (Mb)
> +        du_cmd = "du -Lbms %s" % fs
> +        rc, out = exec_cmd(du_cmd)
> +        fs_size = out.split()[0]
> +
> +        self.size = fs_size
> +        self.source_file = fs
> +
> +        return 0
> +
>      def prepare_swap_partition(self, cr_workdir, oe_builddir, native_sysroot):
>          """
>          Prepare a swap partition.



