Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SyQAQ-0003zh-Ed
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 18:28:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Aug 2012 09:16:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="182266042"
Received: from unknown (HELO envy.home) ([10.7.199.152])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2012 09:16:40 -0700
Message-ID: <501FED7B.6050309@linux.intel.com>
Date: Mon, 06 Aug 2012 09:14:51 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
	<1344196136-7643-17-git-send-email-javier@dowhile0.org>
In-Reply-To: <1344196136-7643-17-git-send-email-javier@dowhile0.org>
X-Enigmail-Version: 1.4.3
Subject: Re: [PATCH v2 16/28] kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib and /etc
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
X-List-Received-Date: Mon, 06 Aug 2012 16:28:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08/05/2012 12:48 PM, Javier Martinez Canillas wrote:

Hi Javier,

> It is considered good practice to use the build system provided
> variables instead of directly specify hardcoded paths.

Have you tested this with a build using a base_libdir other than /lib ?

> Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
> ---
>  meta/classes/kernel.bbclass |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 1d8dff9..b434093 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -109,10 +109,10 @@ kernel_do_install() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>  	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>  		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install

The install doesn't specify base_libdir, so does the kernel make system
honor it?

> -		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
> -		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
> -		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
> -		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
> +		rm -f "${D}${base_libdir}/modules/${KERNEL_VERSION}/modules.order"
> +		rm -f "${D}${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
> +		rm "${D}${base_libdir}/modules/${KERNEL_VERSION}/build"
> +		rm "${D}${base_libdir}/modules/${KERNEL_VERSION}/source"

if not, these will fail.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


