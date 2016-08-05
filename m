Return-Path: <denis@denix.org>
X-Greylist: delayed 3603 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 Aug 2016 22:25:34 UTC
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 7E89F77161
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 22:25:34 +0000 (UTC)
Received: from vz-proxy-m001.mx.aol.com ([64.236.83.14])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBG00K6MGTZ2F80@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2016 16:25:17 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=kj9zAlcOel0A:10 a=7z1cN_iqozsA:10	a=pGLkceISAAAA:8
	a=iOXC_SvI7piijs__KRUA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 1c1e8013; Fri, 05 Aug 2016 21:25:17 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5E4F21620DA; Fri,
	5 Aug 2016 17:25:11 -0400 (EDT)
Date: Fri, 05 Aug 2016 17:25:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: George McCollister <george.mccollister@gmail.com>
Message-id: <20160805212511.GO8521@denix.org>
References: <cover.1468862824.git.george.mccollister@gmail.com>
	<1c06daa2a3dad03821aff6a7f7502036fb90f2b4.1468862824.git.george.mccollister@gmail.com>
MIME-version: 1.0
In-reply-to: <1c06daa2a3dad03821aff6a7f7502036fb90f2b4.1468862824.git.george.mccollister@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: marex@denx.de, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/3] kernel-fitimage: add initramfs support
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
X-List-Received-Date: Fri, 05 Aug 2016 22:25:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jul 18, 2016 at 12:57:55PM -0500, George McCollister wrote:
> If INITRAMFS_IMAGE is set, build an additional fitImage containing the
> initramfs. Copy the additional fitImage and the source (*.its) file, used
> to create it to DEPLOYDIR. The fitImage containing the initramfs must be
> built before do_deploy and after do_install to avoid circular dependencies.
> 
> UBOOT_RD_LOADADDRESS - Specifies the load address used by u-boot for the
>                        initramfs.
> UBOOT_RD_ENTRYPOINT  - Specifies the entry point used by u-boot for the
>                        initramfs.
> 
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 282 +++++++++++++++++++++++------------
>  1 file changed, 187 insertions(+), 95 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 9a3caf5..ede69e7 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -16,7 +16,7 @@ python __anonymous () {
>  

<snip>


> +	#
> +	# Step 3: Prepare a ramdisk section.
> +	#
> +	if [ "x${ramdiskcount}" = "x1" ] ; then
> +		copy_initramfs
> +		fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio

May I suggest dropping ${B} here to get the ramdisk path shorter and easier to 
read? It's relative to ${B} anyway - same as all the DTBs...

+ fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio


> +	fi
>  

<snip>

-- 
Denys

