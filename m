Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SQ3Qj-00035m-NF
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 23:19:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2012 14:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="136751931"
Received: from unknown (HELO envy.home) ([10.7.199.57])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2012 14:09:30 -0700
Message-ID: <4FA2F3EC.4000607@linux.intel.com>
Date: Thu, 03 May 2012 14:09:00 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<71993993e48a2abeb09b5c6c86a1d8d2ebec7c25.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <71993993e48a2abeb09b5c6c86a1d8d2ebec7c25.1328510188.git.raj.khem@gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH 09/20] image.bbclass, kernel.bbclass: Use kmod-native instead of module-init-tools-cross
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
X-List-Received-Date: Thu, 03 May 2012 21:19:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Some comments regarding implementation are needed here. For example, why
is HOST_PREFIX no longer necessary?

On 02/05/2012 10:40 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/image.bbclass  |    2 +-
>  meta/classes/kernel.bbclass |    9 ++++-----
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 3034725..adb9b39 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -173,7 +173,7 @@ fakeroot do_rootfs () {
>  		KERNEL_VERSION=`cat ${STAGING_KERNEL_DIR}/kernel-abiversion`
>  
>  		mkdir -p ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VERSION
> -		${TARGET_PREFIX}depmod -a -b ${IMAGE_ROOTFS} -F ${STAGING_KERNEL_DIR}/System.map-$KERNEL_VERSION $KERNEL_VERSION
> +		depmod -a -b ${IMAGE_ROOTFS} -F ${STAGING_KERNEL_DIR}/System.map-$KERNEL_VERSION $KERNEL_VERSION
>  	fi
>  
>  	${IMAGE_PREPROCESS_COMMAND}
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ec5d65e..be54f8e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>  inherit linux-kernel-base module_strip
>  
>  PROVIDES += "virtual/kernel"
> -DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
> +DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
>  
>  # we include gcc above, we dont need virtual/libc
>  INHIBIT_DEFAULT_DEPS = "1"
> @@ -259,7 +259,7 @@ if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>  	mkdir -p $D/lib/modules/${KERNEL_VERSION}
>  fi
>  if [ -n "$D" ]; then
> -	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
> +	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
>  else
>  	depmod -a
>  fi
> @@ -267,7 +267,7 @@ fi
>  
>  pkg_postinst_modules () {
>  if [ -n "$D" ]; then
> -	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
> +	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
>  else
>  	depmod -a
>  	update-modules || true
> @@ -339,9 +339,8 @@ python populate_packages_prepend () {
>  		if m:
>  			kernelver_stripped = m.group(1)
>  		path = d.getVar("PATH", 1)
> -		host_prefix = d.getVar("HOST_PREFIX", 1) or ""
>  
> -		cmd = "PATH=\"%s\" %sdepmod -n -a -r -b %s -F %s/boot/System.map-%s %s" % (path, host_prefix, dvar, dvar, kernelver, kernelver_stripped)
> +		cmd = "PATH=\"%s\" depmod -n -a -b %s -F %s/boot/System.map-%s %s" % (path, dvar, dvar, kernelver, kernelver_stripped)
>  		f = os.popen(cmd, 'r')
>  
>  		deps = {}

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


