Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UcUoI-0004W6-2p for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 08:03:36 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4F5h4Tu012398; Wed, 15 May 2013 06:43:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nG7z1_lc9MHH; Wed, 15 May 2013 06:43:04 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4F5gwK7012390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 15 May 2013 06:43:01 +0100
Message-ID: <1368596392.25898.61.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Drew Moseley <drew_moseley@mentor.com>, "Ashfield, Bruce"
	<Bruce.Ashfield@windriver.com>, "Zanussi, Tom" <tom.zanussi@intel.com>
Date: Wed, 15 May 2013 08:39:52 +0300
In-Reply-To: <1368579545-16079-1-git-send-email-drew_moseley@mentor.com>
References: <1368579545-16079-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: Package additional modules files needed for systemtap
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 06:03:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-05-14 at 17:59 -0700, Drew Moseley wrote:
> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> ---
>  meta/classes/kernel.bbclass |    8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6ba31bd..f23818e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -108,8 +108,6 @@ kernel_do_install() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>  	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>  		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
> -		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
> -		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
>  		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
>  		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
>  	else
> @@ -259,7 +257,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>  # kernel-image becomes kernel-image-${KERNEL_VERISON}
>  PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
>  FILES = ""
> -FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
> +FILES_kernel-image = " \
> +	/boot/${KERNEL_IMAGETYPE}* \
> +	${base_libdir}/modules/${KERNEL_VERSION}/modules.order \
> +	${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin \
> +"
>  FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
>  FILES_kernel-vmlinux = "/boot/vmlinux*"
>  RDEPENDS_kernel = "kernel-base"

Should these really be installed into every system with a kernel?
Doesn't systemtap also need other symbol information so these files
would be better off in whatever other packages systemtap also needs?

Cheers,

Richard





