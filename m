Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43CA36017E
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 21:00:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8UL0qnq011961
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Sep 2014 14:00:52 -0700 (PDT)
Received: from server.local (128.224.21.58) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 30 Sep 2014 14:00:51 -0700
Message-ID: <542B19F8.4030805@windriver.com>
Date: Tue, 30 Sep 2014 17:00:40 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <nitin.a.kamble@intel.com>, <richard.purdie@linuxfoundation.org>,
	<saul.wold@intel.com>, <ross.burton@intel.com>,
	<dvhart@linux.intel.com>, <Openembedded-core@lists.openembedded.org>
References: <cover.1412108536.git.nitin.a.kamble@intel.com>
	<09a0bf7dab7a1152fe19faa74436eb4856ce631a.1412108536.git.nitin.a.kamble@intel.com>
In-Reply-To: <09a0bf7dab7a1152fe19faa74436eb4856ce631a.1412108536.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 1/1] kernel.bbclass: enable a link for external module building
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
X-List-Received-Date: Tue, 30 Sep 2014 21:00:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-09-30, 4:57 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> To build external modules, the link /lib/modules/<kernel-version>/build
> must exist, and point to the proper kernel source area.
>
> The kernel-dev package already provides the needed source files. Now
> putting a link in place to unblock the external module building.

This description is not entirely accurate, at least from my point of
view.

You can build external modules on the target without this link .. it is
that many scripts and utilities look in this location for the kernel
source.

We are fixing that case, not the general case of building an external
module.

Cheers,

Bruce

>
> Fixes Bug:
> [YOCTO #2968]
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>   meta/classes/kernel.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 78b33ce..5ac4ff4 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -213,6 +213,7 @@ kernel_do_install() {
>   	#
>   	kerneldir=${D}${KERNEL_SRC_PATH}
>   	install -d $kerneldir
> +	ln -sf ${KERNEL_SRC_PATH} "${D}/lib/modules/${KERNEL_VERSION}/build"
>
>   	#
>   	# Store the kernel version in sysroots for module-base.bbclass
> @@ -346,7 +347,7 @@ PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-mod
>   FILES_${PN} = ""
>   FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
>   FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
> +FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>   FILES_kernel-vmlinux = "/boot/vmlinux*"
>   FILES_kernel-modules = ""
>   RDEPENDS_kernel = "kernel-base"
>


