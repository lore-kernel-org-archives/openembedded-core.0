Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCzsz-0004G5-H9
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 22:54:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2012 13:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="134312172"
Received: from unknown (HELO helios.localnet) ([10.252.123.243])
	by fmsmga001.fm.intel.com with ESMTP; 28 Mar 2012 13:45:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Dexuan Cui <dexuan.cui@intel.com>, Saul Wold <sgw@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2012 21:45:23 +0100
Message-ID: <1489559.CsLVdoLD2R@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <5e91d5cc67fa356f9ed065aad28f978da7d29452.1332826876.git.sgw@linux.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
	<5e91d5cc67fa356f9ed065aad28f978da7d29452.1332826876.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] self-hosted-image: pre-populate the builder user with poky source
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
X-List-Received-Date: Wed, 28 Mar 2012 20:54:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 26 March 2012 22:42:55 Saul Wold wrote:
> From: Dexuan Cui <dexuan.cui@intel.com>
> 
> This patch installs the poky source into the /home/builder/poky/ of the
> self-hosted-image.
> This makes the user of self-hosted-image easier to start a build.
> 
> I think the recent poky master is stable enough, so I specify
> a commit number by SRCREV -- we may want to update this number before
> releasing 1.2.
> 
> This patch fixes [YOCTO #2065]
> 
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> 
> Added code for supporting target based pseudo
> fixed indentation
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/images/self-hosted-image.bb |   41
> +++++++++++++++++++++++- 1 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/images/self-hosted-image.bb
> b/meta/recipes-core/images/self-hosted-image.bb index d56c2cb..5aa670d
> 100644
> --- a/meta/recipes-core/images/self-hosted-image.bb
> +++ b/meta/recipes-core/images/self-hosted-image.bb
> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> 
> -PR = "r5"
> +PR = "r6"
> 
>  CORE_IMAGE_EXTRA_INSTALL = "\
>      task-self-hosted \
> @@ -13,7 +13,10 @@ CORE_IMAGE_EXTRA_INSTALL = "\
>  IMAGE_FEATURES += "x11-mini package-management"
> 
>  # Ensure there's enough space to do a core-image-minimal build, with
> rm_work enabled -IMAGE_ROOTFS_EXTRA_SPACE = "2621440"
> +IMAGE_ROOTFS_EXTRA_SPACE = "1048576"
> +#IMAGE_ROOTFS_EXTRA_SPACE = "2621440"
> +#IMAGE_ROOTFS_EXTRA_SPACE = "20971520"
> +#IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
> 
>  # Do a quiet boot with limited console messages
>  APPEND += "quiet"
> @@ -21,3 +24,37 @@ APPEND += "quiet"
>  IMAGE_FSTYPES = "vmdk"
> 
>  inherit core-image
> +
> +SRCREV = "26a46938d3ea1821e7bec4fa6cc8379babad238b"
> +SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
> +
> +fakeroot do_populate_poky_src () {
> +	# Because fetch2's git's unpack uses -s cloneflag, the unpacked git repo
> +	# will become invalid in the target.
> +	rm -rf ${WORKDIR}/git/.git
> +	rm -f ${WORKDIR}/git/.gitignore
> +
> +	cp -Rp ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
> +
> +	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
> +	cp -Rp ${DL_DIR} ${IMAGE_ROOTFS}/home/builder/poky/build

Could we change this last line to:

mkdir ${IMAGE_ROOTFS}/home/builder/poky/build/downloads
cp -RpL  ${DL_DIR}/* ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/

This does two things:

1) Handles if DL_DIR on the build machine is not called "downloads" (which by 
chance mine was not when I tested it)

2) I notice if you set up a separate downloads directory and then use own-
mirrors to fetch from your original downloads directory (possibly unorthodox, 
but it gets you a clean downloads directory without redownloading everything) 
you get symlinks into the original downloads dir rather than copied files. I 
don't know how many people will hit this but since we never want any symlinks 
in this directory in the self-hosted image, I think using -L is worth doing 
here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


