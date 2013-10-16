Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A4BF06D090
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 21:13:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Oct 2013 14:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,509,1378882800"; d="scan'208";a="420236659"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.196.57]) ([10.7.196.57])
	by orsmga002.jf.intel.com with ESMTP; 16 Oct 2013 14:13:55 -0700
Message-ID: <1381958034.21283.0.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Wed, 16 Oct 2013 14:13:54 -0700
In-Reply-To: <fd09f894b40dadb8bc8b267a26dbf52e22a53d66.1381954954.git.tom.zanussi@linux.intel.com>
References: <cover.1381954954.git.tom.zanussi@linux.intel.com>
	<fd09f894b40dadb8bc8b267a26dbf52e22a53d66.1381954954.git.tom.zanussi@linux.intel.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] wic: add pseudo to the populate-extfs step
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
X-List-Received-Date: Wed, 16 Oct 2013 21:13:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-10-16 at 15:25 -0500, Tom Zanussi wrote:
> Without this, files in the generated filesystem pick up the wrong
> ownership.
> 
> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> ---
>  scripts/lib/mic/kickstart/custom_commands/partition.py | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
> index 302cace..0eb0671 100644
> --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> @@ -216,7 +216,14 @@ class Wic_PartData(Mic_PartData):
>          """
>          Prepare content for an ext2/3/4 rootfs partition.
>          """
> -        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
> +        populate_script = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> +        populate_script += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" % rootfs_dir
> +        populate_script += "export PSEUDO_PASSWD=%s;" % rootfs_dir
> +        populate_script += "export PSEUDO_NOSYMLINKEXP=1;"
> +        populate_script += "export PSEUDO_DISABLED=0;"
> +        populate_script += "%s/usr/bin/pseudo %s/usr/bin/populate-extfs.sh" % \
> +            (native_sysroot, native_sysroot)
> +
>          image_extra_space = 10240
>  
>          image_rootfs = rootfs_dir

This resolved the failure to login permissions issue.

Acked-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



