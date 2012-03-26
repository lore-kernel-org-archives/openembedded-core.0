Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SCEqX-0004J5-6z
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 20:40:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Mar 2012 11:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="121860035"
Received: from unknown (HELO envy.home) ([10.7.199.147])
	by orsmga001.jf.intel.com with ESMTP; 26 Mar 2012 11:31:48 -0700
Message-ID: <4F70B5E8.10101@linux.intel.com>
Date: Mon, 26 Mar 2012 11:31:04 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332744104.git.sgw@linux.intel.com>
	<6a68cf7d22e94be417215b12cac4cf1c5b9baefa.1332744104.git.sgw@linux.intel.com>
In-Reply-To: <6a68cf7d22e94be417215b12cac4cf1c5b9baefa.1332744104.git.sgw@linux.intel.com>
X-Enigmail-Version: 1.4
Subject: Re: [Build App RFC 4/5] vmdk: Update for direstdisk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2012 18:40:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The conversion to directdisk is necessary due to the limitation in the
mkdosfs version we carry and larger filesystems. Please note in the
commit message so readers can know WHY the change was made.


On 03/25/2012 11:47 PM, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/image-vmdk.bbclass |   15 ++++++++++++---
>  1 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
> index 9d596cd..736d1d7 100644
> --- a/meta/classes/image-vmdk.bbclass
> +++ b/meta/classes/image-vmdk.bbclass
> @@ -1,15 +1,23 @@
>  
>  NOISO = "1"
> +
> +SYSLINUX_ROOT = "root=/dev/hda2 "
>  SYSLINUX_PROMPT = "0"
>  SYSLINUX_TIMEOUT = "1"
>  SYSLINUX_LABELS = "boot"
> +LABELS_append = " ${SYSLINUX_LABELS} "
> +
> +# need to define the dependency and the ROOTFS for directdisk
> +do_bootdirectdisk[depends] += "${IMAGE_BASENAME}:do_rootfs"
> +ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
>  
>  # creating VMDK relies on having a live hddimg so ensure we
>  # inherit it here.
> -inherit image-live
> +#inherit image-live


A development artifact I presume? No need to leave the old image type
commented out. Should probably also remove the comment as with
directdisk that is no longer the case - right?


> +inherit boot-directdisk
>  
>  create_vmdk_image () {
> -	qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
> +	qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
>  	ln -s ${IMAGE_NAME}.vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
>  
>  }
> @@ -18,7 +26,8 @@ python do_vmdkimg() {
>          bb.build.exec_func('create_vmdk_image', d)
>  }
>  
> -addtask vmdkimg after do_bootimg before do_build
> +#addtask vmdkimg after do_bootimg before do_build

Ditto.

> +addtask vmdkimg after do_bootdirectdisk before do_build
>  do_vmdkimg[nostamp] = "1"
>  
>  do_vmdkimg[depends] += "qemu-native:do_populate_sysroot" 

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


