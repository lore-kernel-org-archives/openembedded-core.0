Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Q5Kki-0002MX-7E
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 18:29:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Mar 2011 09:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,276,1299484800"; d="scan'208";a="621703837"
Received: from doubt.jf.intel.com (HELO [10.24.0.166]) ([10.24.0.166])
	by orsmga002.jf.intel.com with ESMTP; 31 Mar 2011 09:27:42 -0700
Message-ID: <4D94AB7E.4030603@linux.intel.com>
Date: Thu, 31 Mar 2011 09:27:42 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1301578942.git.paul.eggleton@linux.intel.com>
	<41ae31ba057b63d3c518e2edf217109c59b64603.1301578942.git.paul.eggleton@linux.intel.com>
In-Reply-To: <41ae31ba057b63d3c518e2edf217109c59b64603.1301578942.git.paul.eggleton@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 1/1] README.hardware: remove u-boot flashing	instructions for mpc8315e-rdb
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
X-List-Received-Date: Thu, 31 Mar 2011 16:29:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 03/31/2011 06:46 AM, Paul Eggleton wrote:
> From: Paul Eggleton<paul.eggleton@linux.intel.com>
>
> Upgrading u-boot is apparently not necessary with current board revisions,
> and these instructions may not work properly anyway (our toolchain seems not
> to be able to compile u-boot in the way described), and given that they are
> potentially risky they should be removed.
>
> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>   README.hardware |   29 +++--------------------------
>   1 files changed, 3 insertions(+), 26 deletions(-)
>
> diff --git a/README.hardware b/README.hardware
> index 79607f7..025c678 100644
> --- a/README.hardware
> +++ b/README.hardware
> @@ -234,32 +234,7 @@ You will need the following:
>   * nfs root setup on your workstation
>   * tftp server installed on your workstation
>
> -The original U-Boot image on board can't boot kernel versions 2.6.34 or later
> -successfully, so the U-Boot image should be upgraded to the latest U-Boot.
> -
> - 1. First build a new U-Boot image for mpc8315e-rdb, u-boot.bin.mpc8315erdb,
> -    then make it available on your tftp server. To compile the new u-boot:
> -
> - $ git clone git://git.denx.de/u-boot.git
> - $ cd u-boot
> - $ git checkout -b v2010.09-mpc8315erdb v2010.09
> - $ make ARCH=powerpc CROSS_COMPILE=<powerpc cross compiler path>  MPC8315ERDB_config
> - $ make ARCH=powerpc CROSS_COMPILE=<powerpc cross compiler path>  all
> - $ cp u-boot.bin u-boot.bin.mpc8315erdb
> -
> - 2. Set up the environment in U-Boot:
> -
> - =>setenv ipaddr<board ip>
> - =>setenv serverip<tftp server ip>
> -
> - 3. Flash the new U-Boot image:
> -
> - =>tftp 200000 u-boot.bin.mpc8315erdb
> - =>protect off all
> - =>erase fe000000 +60000
> - =>cp.b 200000 fe000000 60000
> -
> -Then the kernel can be booted successfully:
> +Load the kernel and boot it as follows:
>
>    1. Get the kernel (uImage.mpc8315erdb) and dtb (mpc8315erdb.dtb) files from
>       the Poky build tmp/deploy directory, and make them available on your tftp
> @@ -267,6 +242,8 @@ Then the kernel can be booted successfully:
>
>    2. Set up the environment in U-Boot:
>
> + =>setenv ipaddr<board ip>
> + =>setenv serverip<tftp server ip>
>    =>setenv bootargs root=/dev/nfs rw nfsroot=<nfsroot ip>:<rootfs path>  ip=<board ip>:<server ip>:<gateway ip>:255.255.255.0:mpc8315e:eth0:off console=ttyS0,115200
>
>    3. Download kernel and dtb to boot kernel.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


