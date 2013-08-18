Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 608576AFC2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Aug 2013 01:20:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7I1KSuB029080
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 17 Aug 2013 21:20:29 -0400 (EDT)
Received: from bruce-ashfields-macbook.local (128.224.21.103) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sat, 17 Aug 2013 18:20:28 -0700
Message-ID: <5210215B.5060908@windriver.com>
Date: Sat, 17 Aug 2013 21:20:27 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1376678068-31668-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1376678068-31668-1-git-send-email-otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dtb.inc: Fix dtb generation for kernels newer than 3.8
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
X-List-Received-Date: Sun, 18 Aug 2013 01:20:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-16 2:34 PM, Otavio Salvador wrote:
> The 3.8 kernel has change the default directory where the dtb file is
> stored. The change has been done at:

Indeed. I've been working around this with the reference boards during
my efforts to bump them to 3.10. I just didn't have my patch quite
ready yet .. so let's review this one!

>
> ,----[ Quote of 3.8 kernel change ]
> | commit 499cd8298628eeabf0eb5eb6525d4faa0eec80d8
> | Author: Grant Likely <grant.likely@secretlab.ca>
> | Date:   Tue Nov 27 16:29:11 2012 -0700
> |
> |     ARM: dt: change .dtb build rules to build in dts directory
> |
> |     The current rules have the .dtb files build in a different directory
> |     from the .dts files. The only reason for this is that it was what
> |     PowerPC has done historically. This patch changes ARM to use the generic
> |     dtb rule which builds .dtb files in the same directory as the source .dts.
> |
> |     Cc: Russell King <linux@arm.linux.org.uk>
> |     Cc: Arnd Bergmann <arnd@arndb.de>
> |     Acked-by: Olof Johansson <olof@lixom.net>
> |     Cc: linux-arm-kernel@lists.infradead.org
> |     Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> |     [swarren: added rm command for old stale .dtb files]
> |     Signed-off-by: Stephen Warren <swarren@nvidia.com>
> |     Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> `----
>
> This change adds support for both places to backward and forward
> compatibility.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta/recipes-kernel/linux/linux-dtb.inc | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index cebc76a..6b8f1a5 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -15,8 +15,12 @@ do_install_append() {
>   			DTB_BASE_NAME=`basename ${DTB} .dtb`
>   			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>   			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
>   			oe_runmake ${DTB}
> -			install -m 0644 ${B}/arch/${ARCH}/boot/${DTB} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
> +			if [ ! -e "${DTB_PATH}" ]; then
> +				DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
> +			fi

perfect. Just what I was looking for, allowing the older style
kernels to continue to work.

> +			install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
>   		done
>   	fi
>   }
> @@ -31,8 +35,12 @@ do_deploy_append() {
>   			DTB_BASE_NAME=`basename ${DTB} .dtb`
>   			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>   			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
> +			if [ ! -e "${DTB_PATH}" ]; then
> +				DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
> +			fi
>   			install -d ${DEPLOYDIR}
> -			install -m 0644 ${B}/arch/${ARCH}/boot/${DTB} ${DEPLOYDIR}/${DTB_NAME}.dtb
> +			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb

The change looks fine to me.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Cheers,

Bruce

>   			cd ${DEPLOYDIR}
>   			ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
>   			cd -
>


