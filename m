Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56A5360166
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 08:45:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0D8jSBE022946
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jan 2014 00:45:28 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 13 Jan 2014 00:45:27 -0800
Message-ID: <52D3A7A6.6060502@windriver.com>
Date: Mon, 13 Jan 2014 16:45:26 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Nathan Rossi <nathan.rossi@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
References: <2bba5e79-d06e-4b11-98ab-59506c84f896@AM1EHSMHS006.ehs.local>
In-Reply-To: <2bba5e79-d06e-4b11-98ab-59506c84f896@AM1EHSMHS006.ehs.local>
Subject: Re: [PATCH] kernel.bbclass: Fix empty modules directory QA issue
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
X-List-Received-Date: Mon, 13 Jan 2014 08:45:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/13/2014 04:33 PM, Nathan Rossi wrote:
> If a kernel is built without any external modules (aka no CONFIG_*=m),
> then during a modules_install of the kernel an empty directory is
> created at /lib/modules/${KERNEL_VERIONS}/kernel. This is behaviour of
> the kernel infrastructure, the directory would normally be populated
> with the modules that were built.
>
> However because of the expectations of kernel-modules-split, no packages
> are created when there are no modules and an empty directory lingers.
> This raises QA issues as warning or errors (depending on the distro).
>
> The following patch changes the kernel_do_install task to check if the
> directory is empty and if so removes it.
>
> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
> ---
>   meta/classes/kernel.bbclass |    4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 5fef446..6b4e992 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -183,6 +183,10 @@ kernel_do_install() {
>   		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
>   		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
>   		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
> +		# If the kernel/ directory is empty remove it to prevent QA issues

How about:

rmdir --ignore-fail-on-non-empty ${D}/lib/modules/${KERNEL_VERSION}/kernel

// Robert

> +		if [ ! "$(ls -A "${D}/lib/modules/${KERNEL_VERSION}/kernel")" ]; then
> +			rm -r "${D}/lib/modules/${KERNEL_VERSION}/kernel"
> +		fi
>   	else
>   		bbnote "no modules to install"
>   	fi
>

