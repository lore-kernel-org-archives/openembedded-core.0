Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 767C36204F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 17:04:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jul 2013 10:01:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1037,1363158000"; d="scan'208";a="343463363"
Received: from envy.jf.intel.com (HELO [10.7.199.52]) ([10.7.199.52])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2013 10:04:01 -0700
Message-ID: <1373475837.3028.28.camel@envy.home>
From: Darren Hart <dvhart@linux.intel.com>
To: Jonathan Liu <net147@gmail.com>
Date: Wed, 10 Jul 2013 10:03:57 -0700
In-Reply-To: <1373426385-14516-1-git-send-email-net147@gmail.com>
References: <1373426385-14516-1-git-send-email-net147@gmail.com>
Organization: Intel
X-Mailer: Evolution 3.8.3 (3.8.3-2.fc19) 
Mime-Version: 1.0
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boot-directdisk: allow specifying custom MBR disk signature
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
X-List-Received-Date: Wed, 10 Jul 2013 17:04:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-07-10 at 13:19 +1000, Jonathan Liu wrote:

Thanks for your patience with this Jonathan.

> This introduces a DISK_SIGNATURE variable that allows controlling the
> 32-bit MBR disk signature. By default it is set to an automatically
> generated disk signature but it may by overridden in the image recipe
> by setting DISK_SIGNATURE to a 8 digit hex string.
> 
> This DISK_SIGNATURE variable can also be used in the image recipe to
> specify the root by UUID using:
> SYSLINUX_ROOT = "root=PARTUUID=${DISK_SIGNATURE}-02"

This DISK_SIGNATURE variable needs to be documented, Scott R on Cc for
that.

> 
> Specifying the root by UUID allows the kernel to locate the root
> filesystem even if the device name changes (e.g. /dev/hda2, /dev/hdb2 or
> /dev/sdb2 instead of /dev/sda2) due to differences in hardware
> configuration.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>

In the future, please Cc the people you are collaborating with and use
a tool like git send-email to automatically parse that and Cc them on
the patch submission. You can also use the create-pull-request and
send-pull-request scripts which automate this process (these should
probably be updated to allow for just sending the email without a pull
repo though):

Cc: Darren Hart <dvhart@linux.intel.com>

Then they will respond with their review:

Acked-by: Darren hart <dvhart@linux.intel.com>


> ---
>  meta/classes/boot-directdisk.bbclass | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
> index 3169043..182957b 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -34,6 +34,7 @@ BOOTDD_EXTRA_SPACE ?= "16384"
>  # Get the build_syslinux_cfg() function from the syslinux class
>  
>  AUTO_SYSLINUXCFG = "1"
> +DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
>  SYSLINUX_ROOT ?= "root=/dev/sda2"
>  SYSLINUX_TIMEOUT ?= "10"
>  
> @@ -80,6 +81,9 @@ build_boot_dd() {
>  	parted $IMAGE set 1 boot on 
>  	parted $IMAGE print
>  
> +	echo -ne "$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')" | \
> +		dd of=$IMAGE bs=1 seek=440 conv=notrunc
> +
>  	OFFSET=`expr $END2 / 512`
>  	dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
>  	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
> @@ -91,8 +95,24 @@ build_boot_dd() {
>  } 
>  
>  python do_bootdirectdisk() {
> +    validate_disk_signature(d)
>      bb.build.exec_func('build_syslinux_cfg', d)
>      bb.build.exec_func('build_boot_dd', d)
>  }
>  
> +def generate_disk_signature():
> +    import uuid
> +
> +    return str(uuid.uuid4())[:8]
> +
> +def validate_disk_signature(d):
> +    import re
> +
> +    disk_signature = d.getVar("DISK_SIGNATURE", True)
> +
> +    if not re.match(r'^[0-9a-fA-F]{8}$', disk_signature):
> +        bb.fatal("DISK_SIGNATURE '%s' must be an 8 digit hex string" % disk_signature)
> +
> +DISK_SIGNATURE_GENERATED := "${@generate_disk_signature()}"
> +
>  addtask bootdirectdisk before do_build

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


