Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QfDC0-0001u1-2b
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:42:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2011 08:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,499,1304319600"; d="scan'208";a="27897833"
Received: from unknown (HELO [10.255.13.187]) ([10.255.13.187])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2011 08:38:14 -0700
Message-ID: <4E172466.6040805@linux.intel.com>
Date: Fri, 08 Jul 2011 08:38:14 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310079506.git.andrea.adami@gmail.com>
	<54796cbee0dc1928f2295a57b4a4783a1222ace1.1310079506.git.andrea.adami@gmail.com>
In-Reply-To: <54796cbee0dc1928f2295a57b4a4783a1222ace1.1310079506.git.andrea.adami@gmail.com>
Subject: Re: [PATCH 1/2] kernel.bbclass: handle embedding of initramfs images
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
X-List-Received-Date: Fri, 08 Jul 2011 15:42:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/07/2011 04:11 PM, Andrea Adami wrote:
> * from org.openembedded.dev (oe-classic)

Hi Andrea,

Please include a descriptive blurb about the patch. When people read
through the commit log they need to know what problem this patch
addresses and how it intends to go about it. If possible, it should also
include the commit id from the source (I suspect that isn't an option here).


> +INITRAMFS_IMAGE ?= ""
> +INITRAMFS_TASK ?= ""
> +
>  inherit kernel-arch deploy
>  
>  PACKAGES_DYNAMIC += "kernel-module-*"
> @@ -179,8 +191,18 @@ kernel_do_configure() {
>  		cp "${WORKDIR}/defconfig" "${S}/.config"
>  	fi
>          yes '' | oe_runmake oldconfig
> +
> +	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
> +		for img in cpio.gz cpio.lzo cpio.lzma; do
> +		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img"
> +			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$i
> +		fi
> +		done
> +	fi


Hrm... Why is this part of do_configure? Seems a lot more like a deploy
or install step. Also, the cp line has been truncated here.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


