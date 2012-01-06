Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rj7fK-00065g-Na for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 12:08:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06B1UF2019497
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 11:01:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18968-04 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 11:01:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06B1MSL019491
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 11:01:23 GMT
Message-ID: <1325847684.20759.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 11:01:24 +0000
In-Reply-To: <1325836261-4251-1-git-send-email-b19537@freescale.com>
References: <1325836261-4251-1-git-send-email-b19537@freescale.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH oe-core v5] linux-dtb: add multi-dtb build support and keep dtb in deploy cache package
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
X-List-Received-Date: Fri, 06 Jan 2012 11:08:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 15:51 +0800, b19537@freescale.com wrote:
> From: Zhenhua Luo <b19537@freescale.com>
> 
>     DEPLOY_DIR_IMAGE is the images deploy folder - tmp/deploy/images
>     DEPLOYDIR is the deploy folder of linux - deploy-linux-qoriq-sdk
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  meta/recipes-kernel/linux/linux-dtb.inc |   30 +++++++++++++++++++++---------
>  1 files changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 7ec7584..f1bd2bf 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -13,15 +13,27 @@ python __anonymous () {
>  	d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
>  }
>  
> -do_install_append() {
> +kernel_do_deploy_append() {
>      if test -n "${KERNEL_DEVICETREE}"; then
> -	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree ${KERNEL_DEVICETREE}
> -	install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERSION}
> -	install -d ${DEPLOY_DIR_IMAGE}
> -	install -m 0644 devicetree ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb
> -	cd ${DEPLOY_DIR_IMAGE}
> -	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> -	ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
> +            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> +            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree ${DTS_FILE}
> +            install -m 0644 devicetree ${D}/boot/devicetree-${DTS_BASE_NAME}-${KERNEL_VERSION}
> +            install -d ${DEPLOY_DIR_IMAGE}
> +            install -m 0644 devicetree ${DEPLOY_DIR_IMAGE}/${DTB_NAME}.dtb
> +            rm -f devicetree
> +            cd ${DEPLOY_DIR_IMAGE}
> +            rm -f ${DTB_SYMLINK_NAME}.dtb
> +            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
> +            cd -
> +
> +            install -d ${DEPLOYDIR}
> +            install -m 0644 ${DEPLOY_DIR_IMAGE}/${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_NAME}.dtb
> +            cd ${DEPLOYDIR}
> +            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
> +            cd -
> +        done
>  

This is close but its still not 100% right. If you put the files into
${DEPLOYDIR} (such as ${DEPLOYDIR}/${DTB_NAME}.dtb), the sstate code
itself will ensure it makes it to ${DEPLOY_DIR_IMAGE}/${DTB_NAME}.dtb.
You can therefore remove the last bit of duplication in this function,
don't touch ${DEPLOY_DIR_IMAGE} at all and the files will still appear
there, just like kernel_do_deploy() itself does.

Cheers,

Richard




