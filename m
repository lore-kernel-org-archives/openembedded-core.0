Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 919BF72491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 18:43:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3SIhnBZ005597
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Apr 2015 11:43:50 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 28 Apr 2015 11:43:49 -0700
Message-ID: <553FD4E4.3000900@windriver.com>
Date: Tue, 28 Apr 2015 14:43:48 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>, <openembedded-core@lists.openembedded.org>
References: <1430239116-7671-1-git-send-email-marex@denx.de>
	<1430239116-7671-9-git-send-email-marex@denx.de>
In-Reply-To: <1430239116-7671-9-git-send-email-marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 8/8] kernel: Build uImage only when really needed
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
X-List-Received-Date: Tue, 28 Apr 2015 18:44:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-04-28 12:38 PM, Marek Vasut wrote:
> Build the uImage file using the kernel build system only when
> it is really required, which is only in case KEEPUIMAGE == yes.
> Otherwise, just build zImage, since the Yocto build system will
> handle the uImage generation for us.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   meta/classes/kernel-uimage.bbclass | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
> index ce8f96f..acde9ae 100644
> --- a/meta/classes/kernel-uimage.bbclass
> +++ b/meta/classes/kernel-uimage.bbclass
> @@ -6,6 +6,14 @@ python __anonymous () {
>           depends = d.getVar("DEPENDS", True)
>           depends = "%s u-boot-mkimage-native" % depends
>           d.setVar("DEPENDS", depends)
> +
> +	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
> +	# to kernel.bbclass . We override the variable here, since we need
> +	# to build uImage using the kernel build system if and only if
> +	# KEEPUIMAGE != yes. Otherwise, we pack compressed vmlinux into
> +	# the uImage .


I keep reading this, and must be inverting the logic in my head.

If we've set KEEPUIMAGE = yes, that means we just want to let the
kernel build the uImage and perform no extra generation steps.

When I read this, it looks like if I set the keep flag, I'll be
overriden to build a zImage. Is that intentional ? I'd think we
would have just left it alone or set it to uImage (unless we
are saying that everyone should be building zImage now .. but
I know some old ppc targets that do want to build uImages).

Bruce

> +	if d.getVar("KEEPUIMAGE", True) == 'yes':
> +            d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "zImage")
>   }
>
>   do_uboot_mkimage() {
>


