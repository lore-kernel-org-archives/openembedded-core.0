Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 79ED6771A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 21:32:43 +0000 (UTC)
Received: from vz-proxy-m005.mx.aol.com ([64.236.83.15])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBM009KL16JUM20@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2016 16:32:44 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=NimJJ1rWho3RDXpqkQh0Zg==:117
	a=kj9zAlcOel0A:10 a=7z1cN_iqozsA:10	a=pGLkceISAAAA:8 a=sozttTNsAAAA:8
	a=Q4-j1AaZAAAA:8 a=f0UT9EPOpJK5ekTonXMA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 0aacc688; Mon, 08 Aug 2016 21:32:44 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 47DF91620E6; Mon,
	8 Aug 2016 17:32:43 -0400 (EDT)
Date: Mon, 08 Aug 2016 17:32:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: George McCollister <george.mccollister@gmail.com>
Message-id: <20160808213243.GS8521@denix.org>
References: <cover.1470672689.git.george.mccollister@gmail.com>
	<d37bec4f77f0670b35347c367371d2cd4887b29a.1470672689.git.george.mccollister@gmail.com>
MIME-version: 1.0
In-reply-to: <d37bec4f77f0670b35347c367371d2cd4887b29a.1470672689.git.george.mccollister@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: marex@denx.de, trini@konsulko.com, denys@ti.com,
	andrew.bradford@kodakalaris.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] uboot-sign: do_concat_dtb(): cd to $B
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
X-List-Received-Date: Mon, 08 Aug 2016 21:32:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Aug 08, 2016 at 11:37:57AM -0500, George McCollister wrote:
> Prior to running oe_runmake make sure $B is the cwd. This is required
> due to bitbake commit 67a7b8b021badc17d8fdf447c250e79d291e75f7
> "build: don't use $B as the default cwd for functions".
> 
> Without this change, do_concat_dtb fails with:
> | ERROR: oe_runmake failed
> | make: *** No targets specified and no makefile found.  Stop.
> 
> Signed-off-by: George McCollister <george.mccollister@gmail.com>

Tested-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta/classes/uboot-sign.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
> index d56ad8e..3c56db8 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -66,6 +66,7 @@ do_concat_dtb () {
>  	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
>  		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
>  			[ -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
> +			cd ${B}
>  			oe_runmake EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
>  			install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>  			install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
> -- 
> 2.8.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

