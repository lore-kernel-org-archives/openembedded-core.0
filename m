Return-Path: <california.l.sullivan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD2672EAE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 01:28:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2018 18:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,398,1517904000"; d="scan'208";a="188138333"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 02 Apr 2018 18:28:17 -0700
To: openembedded-core@lists.openembedded.org
References: <20180403011517.22772-1-california.l.sullivan@intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <79202746-ae4e-fb47-9591-98f79ce0fc75@intel.com>
Date: Mon, 2 Apr 2018 18:28:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180403011517.22772-1-california.l.sullivan@intel.com>
Subject: Re: [PATCH] initrdscripts: init-install(-efi).sh: don't assume 20M boot partition
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
X-List-Received-Date: Tue, 03 Apr 2018 01:28:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I forgot to deal with RDEPENDS here. With the addition of du the script 
will depend on ${VIRTUAL-RUNTIME_base-utils}. This happens to be present 
in core-image-minimal-initramfs, so it worked for me, but could fail for 
others using their own initramfs.

I'll send a v2 adding to RDEPENDS on the recipes that use this.

Thanks,
Cal

On 04/02/2018 06:15 PM, California Sullivan wrote:
> With multi kernel support in the installer we can exceed this limit.
> Calculate a sane size by checking the size of the original boot
> partition minus some objects we know won't be installed, plus some extra
> space for users.
>
> In addition, in the common case where only one small kernel is present
> to be installed, we actually get a smaller boot partition with less
> wasted space.
>
> [YOCTO #12583].
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>   meta/recipes-core/initrdscripts/files/init-install-efi.sh | 15 +++++++++++++--
>   meta/recipes-core/initrdscripts/files/init-install.sh     | 15 +++++++++++++--
>   2 files changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> index 43b75b01751..82b0aa819e3 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> @@ -8,8 +8,19 @@
>   
>   PATH=/sbin:/bin:/usr/sbin:/usr/bin
>   
> -# We need 20 Mb for the boot partition
> -boot_size=20
> +# figure out how big of a boot partition we need
> +boot_size=$(du -ms /run/media/$1/ | awk '{print $1}')
> +# remove rootfs.img ($2) from the size if it exists, as its not installed to /boot
> +if [ -e /run/media/$1/$2 ]; then
> +    boot_size=$(( boot_size - $( du -ms /run/media/$1/$2 | awk '{print $1}') ))
> +fi
> +# remove initrd from size since its not currently installed
> +if [ -e /run/media/$1/initrd ]; then
> +    boot_size=$(( boot_size - $( du -ms /run/media/$1/initrd | awk '{print $1}') ))
> +fi
> +# add 10M to provide some extra space for users and account
> +# for rounding in the above subtractions
> +boot_size=$(( boot_size + 10 ))
>   
>   # 5% for swap
>   swap_ratio=5
> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
> index aa9476660ba..28e8f09d19d 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
> @@ -7,8 +7,19 @@
>   
>   PATH=/sbin:/bin:/usr/sbin:/usr/bin
>   
> -# We need 20 Mb for the boot partition
> -boot_size=20
> +# figure out how big of a boot partition we need
> +boot_size=$(du -ms /run/media/$1/ | awk '{print $1}')
> +# remove rootfs.img ($2) from the size if it exists, as its not installed to /boot
> +if [ -e /run/media/$1/$2 ]; then
> +    boot_size=$(( boot_size - $( du -ms /run/media/$1/$2 | awk '{print $1}') ))
> +fi
> +# remove initrd from size since its not currently installed
> +if [ -e /run/media/$1/initrd ]; then
> +    boot_size=$(( boot_size - $( du -ms /run/media/$1/initrd | awk '{print $1}') ))
> +fi
> +# add 10M to provide some extra space for users and account
> +# for rounding in the above subtractions
> +boot_size=$(( boot_size + 10 ))
>   
>   # 5% for the swap
>   swap_ratio=5


