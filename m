Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id A799378369
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 01:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0EF2720879;
	Thu, 15 Jun 2017 01:42:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TVBuT4ih0GSv; Thu, 15 Jun 2017 01:42:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CA23C20567;
	Thu, 15 Jun 2017 01:42:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4B3AF162500; Wed, 14 Jun 2017 21:42:33 -0400 (EDT)
Date: Wed, 14 Jun 2017 21:42:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: yin.thong.choong@intel.com
Message-ID: <20170615014230.GF28053@denix.org>
References: <1497461477-151292-1-git-send-email-yin.thong.choong@intel.com>
	<1497461477-151292-2-git-send-email-yin.thong.choong@intel.com>
MIME-Version: 1.0
In-Reply-To: <1497461477-151292-2-git-send-email-yin.thong.choong@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: otc-pg-team@eclists.intel.com, paul.eggleton@intel.com, saul.wold@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types.bbclass: Added default argument for ubi and ubifs image creation
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
X-List-Received-Date: Thu, 15 Jun 2017 01:42:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 14, 2017 at 10:31:17AM -0700, yin.thong.choong@intel.com wrote:
> From: Choong YinThong <yin.thong.choong@intel.com>
> 
> Added default argument for ubi and ubifs image creation.
> MKUBIFS_ARGS and UBINIZE_ARGS both argument still able to
> edit in local.conf
> 
> [YOCTO #11589]
> 
> Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
> ---
>  meta/classes/image_types.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 7749b00..815f1ea 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -292,3 +292,12 @@ IMAGE_EXTENSION_live = "hddimg iso"
>  # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
>  # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
>  IMAGE_TYPES_MASKED ?= ""
> +
> +# Default argument to create ubi and ubifs image with core-image-sato-sdk (http://www.linux-mtd.infradead.org/faq/ubifs.html)
> +# -m 2048: tells mkfs.ubifs that the minimum input/output unit size of the flash this UBIFS image is created for is 2048 bytes (NAND page in this case);
> +# -e 129024: logical eraseblock size of the UBI volume this image is created for;
> +# -c 8749: specifies maximum file-system size in logical eraseblocks; this means that it will be possible to use the resulting file-system on volumes up to this size (less or equivalent); so in this particular case, the resulting FS may be put on volumes up to about 251MiB (129024 multiplied by 2047); See this section for more details.
> +# -p 128KiB: tells ubinize that physical eraseblock size of the flash chip the UBI image is created for is 128KiB (128 * 1024 bytes);
> +# -s 512: tells ubinize that the flash supports sub-pages and sub-page size is 512 bytes; ubinize will take this into account and put the VID header to the same NAND page as the EC header.
> +MKUBIFS_ARGS = " -m 2048 -e 129024 -c 8749 "
> +UBINIZE_ARGS = " -p 128KiB -m 2048 -s 512 "

This will override machine-specific settings.

-- 
Denys

