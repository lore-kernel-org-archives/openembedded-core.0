Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoJth-0001an-Nz
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 20:40:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2011 11:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,307,1309762800"; d="scan'208";a="34371521"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by azsmga001.ch.intel.com with ESMTP; 02 Aug 2011 11:36:34 -0700
Message-ID: <4E3843B1.2060008@linux.intel.com>
Date: Tue, 02 Aug 2011 11:36:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311942290-27217-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1311942290-27217-1-git-send-email-noor_ahsan@mentor.com>
Subject: Re: [PATCH] kernel,cml1.bbclass: Move menuconfig to cml1
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
X-List-Received-Date: Tue, 02 Aug 2011 18:40:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/29/2011 05:24 AM, Noor, Ahsan wrote:
> * The menuconfig target exists in places other than the kernel that use kernel style config.
>
> Signed-off-by: Noor, Ahsan<noor_ahsan@mentor.com>
> ---
>   meta/classes/cml1.bbclass   |   12 ++++++++++++
>   meta/classes/kernel.bbclass |   15 ---------------
>   2 files changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index 79218b4..a747af5 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -6,3 +6,15 @@ cml1_do_configure() {
>
>   EXPORT_FUNCTIONS do_configure
>   addtask configure after do_unpack do_patch before do_compile
> +
> +do_menuconfig() {
> +	export TERMWINDOWTITLE="${PN} Configuration"
> +	export SHELLCMDS="make menuconfig"
> +	${TERMCMDRUN}
> +	if [ $? -ne 0 ]; then
> +		oefatal "'${TERMCMD}' not found. Check TERMCMD variable."
> +	fi
> +}
> +do_menuconfig[nostamp] = "1"
> +addtask menuconfig after do_configure
> +
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 9c492a3..25d2629 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -197,21 +197,6 @@ kernel_do_configure() {
>
>   do_configure[depends] += "${INITRAMFS_TASK}"
>
> -do_menuconfig() {
> -        export DISPLAY='${DISPLAY}'
> -        export DBUS_SESSION_BUS_ADDRESS='${DBUS_SESSION_BUS_ADDRESS}'
> -        export XAUTHORITY='${XAUTHORITY}'
> -	export TERMWINDOWTITLE="${PN} Kernel Configuration"
> -	export SHELLCMDS="make menuconfig"
> -	${TERMCMDRUN}
> -	if [ $? -ne 0 ]; then
> -		echo "Fatal: '${TERMCMD}' not found. Check TERMCMD variable."
> -		exit 1
> -	fi
> -}
> -do_menuconfig[nostamp] = "1"
> -addtask menuconfig after do_configure
> -
>   pkg_postinst_kernel () {
>   	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
>   }

I think this patch will break the linux-* recipes if someone tries to 
use the menuconfig task.

I think you need to also modify the linux-* recipes that currently 
inherit kernel to also include cmd1

Thanks
	Sau!


