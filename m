Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1StOKZ-0007n4-PQ
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 21:30:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Jul 2012 12:18:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172111637"
Received: from unknown (HELO [10.255.12.231]) ([10.255.12.231])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2012 12:18:43 -0700
Message-ID: <500DA392.2070104@linux.intel.com>
Date: Mon, 23 Jul 2012 12:18:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342826543-23508-1-git-send-email-raj.khem@gmail.com>
	<1342826543-23508-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1342826543-23508-2-git-send-email-raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH V2 2/2] kernel bbclass: Recreate uImage only when KEEPUIMAGE != "yes"
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
X-List-Received-Date: Mon, 23 Jul 2012 19:30:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2012 04:22 PM, Khem Raj wrote:
> From: Koen Kooi <koen@dominion.thruhere.net>
>
> The intent of the uImage code in this class includes the following
>
> 1) be able to specify custom load addresses without needing to patch the kernel
> 2) add better information to the uImage description field
>
> The current state is a NOP anyway, the kernel will always build a uImage when you tell it to 'make uImage'.
>
> weakly Set KEEPUIMAGE to 'yes' in default-distrovars.inc which preserve the
> current OE-Core behavior. Machines which are being ported from oe.dev and need to
> regenerate uImage can set this to be empty
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> xx
>
????

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/classes/kernel.bbclass                     |    2 +-
>   meta/conf/distro/include/default-distrovars.inc |    1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ce4d7de..ab984e3 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -507,7 +507,7 @@ KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
>
>   do_uboot_mkimage() {
>   	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> -		if test ! -e arch/${ARCH}/boot/uImage ; then
> +		if test "x${KEEPUIMAGE}" != "xyes" ; then
>   			ENTRYPOINT=${UBOOT_ENTRYPOINT}
>   			if test -n "${UBOOT_ENTRYSYMBOL}"; then
>   				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index f770919..b72221f 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -2,6 +2,7 @@ QA_LOGFILE = "${TMPDIR}/qa.log"
>
>   OEINCLUDELOGS ?= "yes"
>   KERNEL_CONSOLE ?= "ttyS0"
> +KEEPUIMAGE ?? = "yes"
>
this really worked? (note the space between ?? = )

>   PCMCIA_MANAGER ?= "pcmciautils"
>
>



