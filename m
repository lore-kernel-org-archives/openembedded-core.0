Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99EA36013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 15:16:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4EFFu4M023728
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 May 2015 08:15:56 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 08:15:56 -0700
Message-ID: <5554BC2B.8070906@windriver.com>
Date: Thu, 14 May 2015 11:15:55 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>, <openembedded-core@lists.openembedded.org>
References: <1431606674-5173-1-git-send-email-marex@denx.de>
	<1431606674-5173-2-git-send-email-marex@denx.de>
In-Reply-To: <1431606674-5173-2-git-send-email-marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/9] kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Thu, 14 May 2015 15:16:07 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

The series looks good to me.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

On 2015-05-14 08:31 AM, Marek Vasut wrote:
> Remove the lambda function setting KERNEL_IMAGETYPE_FOR_MAKE and instead
> set it in the anonymous python function. This also allows us to handle
> image types which are not supported directly by kernel, but require some
> other kernel target to be built. This is the case for example with the
> fitImage, which is the uImage successor.
>
> There is no functional change.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   meta/classes/kernel.bbclass | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 125ed88..75bfd76 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -17,12 +17,16 @@ INITRAMFS_TASK ?= ""
>   INITRAMFS_IMAGE_BUNDLE ?= ""
>
>   python __anonymous () {
> +    import re
> +
>       kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
>       if kerneltype == 'uImage':
>           depends = d.getVar("DEPENDS", True)
>           depends = "%s u-boot-mkimage-native" % depends
>           d.setVar("DEPENDS", depends)
>
> +    d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.gz$', '', kerneltype))
> +
>       image = d.getVar('INITRAMFS_IMAGE', True)
>       if image:
>           d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_rootfs')
> @@ -104,8 +108,6 @@ KERNEL_ALT_IMAGETYPE ??= ""
>   # they are staged.
>   KERNEL_SRC_PATH = "/usr/src/kernel"
>
> -KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
> -
>   copy_initramfs() {
>   	echo "Copying initramfs into ./usr ..."
>   	# In case the directory is not created yet from the first pass compile:
>


