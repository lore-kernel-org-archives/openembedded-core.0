Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 3C65773163
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 20:51:19 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y00CT675LPD60@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2016 14:51:21 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=Q4-j1AaZAAAA:8
	a=vpHCeqO0snYvOhBZCvYA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 5daaeaca; Wed, 20 Apr 2016 19:51:21 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2EBAA161FB3; Wed,
	20 Apr 2016 15:51:20 -0400 (EDT)
Date: Wed, 20 Apr 2016 15:51:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-id: <20160420195120.GQ16135@denix.org>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461160239-7799-3-git-send-email-yannick.gicquel@iot.bzh>
MIME-version: 1.0
In-reply-to: <1461160239-7799-3-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH v2 2/4] u-boot: deploy u-boot-nodtb and dtb files
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
X-List-Received-Date: Wed, 20 Apr 2016 20:51:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 20, 2016 at 03:50:37PM +0200, Yannick Gicquel wrote:
> This enable the deployment of u-boot-nodtb.bin and u-boot.dtb files.
> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
> ---
>  meta/classes/uboot-sign.bbclass | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
> index 63a5181..adb24d4 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -38,6 +38,22 @@ UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
>  # Following is relevant only for u-boot recipes:
>  #
>  
> +do_deploy_append_pn-u-boot () {

Same question here about _pn-u-boot.


> +	# OF_SEPARATE generated files deployment
> +	if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then
> +		install ${B}/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
> +		rm -f ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SYMLINK}
> +		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_SYMLINK}
> +		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_BINARY}
> +	fi
> +	if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then
> +		install ${B}/${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
> +		rm -f ${UBOOT_NODTB_BINARY} ${UBOOT_NODTB_SYMLINK}
> +		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
> +		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
> +	fi
> +}
> +
>  do_install_prepend_pn-u-boot () {
>  	# Concatenate U-Boot w/o DTB & DTB with public key
>  	# (cf. kernel-fitimage.bbclass for more details)
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

