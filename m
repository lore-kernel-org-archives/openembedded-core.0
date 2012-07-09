Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHPQ-0005ay-2K
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:06:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 09:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175119915"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 09:54:53 -0700
Message-ID: <4FFB0CDD.2030207@linux.intel.com>
Date: Mon, 09 Jul 2012 09:54:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341589961-14331-1-git-send-email-bruce.ashfield@windriver.com>
	<1341589961-14331-2-git-send-email-bruce.ashfield@windriver.com>
In-Reply-To: <1341589961-14331-2-git-send-email-bruce.ashfield@windriver.com>
Subject: Re: [PATCH] kernel.bbclass: add non-santized kernel provides
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
X-List-Received-Date: Mon, 09 Jul 2012 17:06:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2012 08:52 AM, Bruce Ashfield wrote:
> If the kernel version string uses characters or symbols that
> need to be santized for the package name, we can end up with a
> mismatch between module requirements and what the kernel
> provides.
>
> The kernel version is pulled from utsrelease.h, which contains
> the exact string that was passed to the kernel build, not
> one that is santized, this can result in:
>
>   echo "CONFIG_LOCALVERSION="\"MYVER+snapshot_standard\" >> ${B}/.config
>
>   <build>
>
>   % rpm -qp kernel-module-uvesafb-3.4-r0.qemux86.rpm --requires
> update-modules
> kernel-3.4.3-MYVER+snapshot_standard
>   % rpm -qp kernel-3.4.3-myver+snapshot-standard-3.4-r0.qemux86.rpm --provides
> kernel-3.4.3-myver+snapshot-standard = 3.4-r0
>
> At rootfs assembly time, we'll have a dependency issue with the kernel
> providing the santizied string and the modules requiring the utsrelease.h
> string.
>
> To not break existing use cases, we can add a second provides to the
> kernel packaging with the unsantized version string, and allowing the
> kernel module packaging to be unchanged.
>
>     RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>
>   % rpm -qp kernel-3.4.3-myver+snapshot-standard-3.4-r0.qemux86.rpm --provides
> kernel-3.4.3-MYVER+snapshot_standard
> kernel-3.4.3-myver+snapshot-standard = 3.4-r0
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   meta/classes/kernel.bbclass |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 44461bc..81c334b 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -257,6 +257,7 @@ RDEPENDS_kernel = "kernel-base"
>   RDEPENDS_kernel-base ?= "kernel-image"
>   PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
>   PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
> +RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>   ALLOW_EMPTY_kernel = "1"
>   ALLOW_EMPTY_kernel-base = "1"
>   ALLOW_EMPTY_kernel-image = "1"
>

Merged into OE-Core

Thanks
	Sau!


