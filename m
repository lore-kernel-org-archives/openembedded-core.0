Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 604A271C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 17:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E4C8820B66;
	Thu, 19 Jan 2017 17:37:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qlXVe7vAJTY3; Thu, 19 Jan 2017 17:37:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CB72C2099C;
	Thu, 19 Jan 2017 17:37:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2005B162324; Thu, 19 Jan 2017 12:37:00 -0500 (EST)
Date: Thu, 19 Jan 2017 12:37:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Rick Altherr <raltherr@google.com>
Message-ID: <20170119173700.GX15833@denix.org>
References: <20170119165803.22583-1-raltherr@google.com>
MIME-Version: 1.0
In-Reply-To: <20170119165803.22583-1-raltherr@google.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage: Let U-Boot select ramdisk load/entry address
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
X-List-Received-Date: Thu, 19 Jan 2017 17:37:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 19, 2017 at 08:58:03AM -0800, Rick Altherr wrote:
> If the ramdisk load and entry parameters are omitted in the FIT image
> specification, U-Boot will determine if the ramdisk needs to be
> relocated and will automatically allocate a location in RAM if so.

Sometimes it's useful to load ramdisk in a specific location. Your patch 
unconditionally removes this support, which is not a desired change. I have 
a patch queued up to do it conditionally, which I'll try to submit shortly.

-- 
Denys


> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 2934b3a31a..ee721d1fff 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -187,8 +187,6 @@ fitimage_emit_section_ramdisk() {
>                          arch = "${UBOOT_ARCH}";
>                          os = "linux";
>                          compression = "none";
> -                        load = <${UBOOT_RD_LOADADDRESS}>;
> -                        entry = <${UBOOT_RD_ENTRYPOINT}>;
>                          hash@1 {
>                                  algo = "${ramdisk_csum}";
>                          };
> -- 
> 2.11.0.483.g087da7b7c-goog
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

