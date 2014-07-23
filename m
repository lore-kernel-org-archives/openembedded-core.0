Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 190DB70187
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 20:21:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Jul 2014 13:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,719,1400050800"; d="scan'208";a="574401359"
Received: from unknown (HELO [10.255.12.245]) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2014 13:21:19 -0700
Message-ID: <1406146879.6335.38.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Wed, 23 Jul 2014 15:21:19 -0500
In-Reply-To: <1406111837-4287-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1406111837-4287-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: squashfs partition support
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
X-List-Received-Date: Wed, 23 Jul 2014 20:21:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi, please include a description for this.

Also, it looks like this is missing the empty_partition() part?

Thanks,

Tom

On Wed, 2014-07-23 at 12:37 +0200, Maciej Borzecki wrote:
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> ---
>  .../lib/mic/kickstart/custom_commands/partition.py | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
> index d0f1b78..c4d0113 100644
> --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> @@ -192,6 +192,10 @@ class Wic_PartData(Mic_PartData):
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
> @@ -324,6 +328,28 @@ class Wic_PartData(Mic_PartData):
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



