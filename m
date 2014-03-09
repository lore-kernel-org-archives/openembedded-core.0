Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0625E6EF94
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Mar 2014 00:15:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Mar 2014 16:15:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,616,1389772800"; d="scan'208";a="494789403"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2014 16:15:19 -0800
Message-ID: <1394324119.1057.3.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Sat, 08 Mar 2014 18:15:19 -0600
In-Reply-To: <1394317437-6551-1-git-send-email-joaohf@gmail.com>
References: <1394317437-6551-1-git-send-email-joaohf@gmail.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: Use mke2fs to create the ext2/3/4 image
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
X-List-Received-Date: Sun, 09 Mar 2014 00:15:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2014-03-08 at 19:23 -0300, João Henrique Ferreira de Freitas
wrote:
> OE-core commit f3a95ca6886b55e5819b068bdbd2cceb882d91a6 removed the
> populate-extfs.sh. So mke2fs should be used to create ext2/3/4 image.
> 
> Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>

Thanks for updating this.

Acked-by: Tom Zanussi <tom.zanussi@intel.com>

> ---
>  scripts/lib/mic/kickstart/custom_commands/partition.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
> index 91d751e..e0a82f5 100644
> --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> @@ -174,7 +174,6 @@ class Wic_PartData(Mic_PartData):
>          """
>          Prepare content for an ext2/3/4 rootfs partition.
>          """
> -        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
>  
>          image_rootfs = rootfs_dir
>          rootfs = "%s/rootfs.%s" % (cr_workdir, self.fstype)
> @@ -199,11 +198,10 @@ class Wic_PartData(Mic_PartData):
>  
>          extra_imagecmd = "-i 8192"
>  
> -        mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, rootfs)
> +        mkfs_cmd = "mkfs.%s -F %s %s -d %s" % \
> +            (self.fstype, extra_imagecmd, rootfs, image_rootfs)
>          rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
>  
> -        populate_cmd = populate_script + " " + image_rootfs + " " + rootfs
> -        rc, out = exec_native_cmd(pseudo + populate_cmd, native_sysroot)
>  
>          # get the rootfs size in the right units for kickstart (Mb)
>          du_cmd = "du -Lbms %s" % rootfs
> -- 
> 1.8.3.2
> 



