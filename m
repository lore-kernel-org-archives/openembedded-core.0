Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 196E4606CB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 18:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A6182085D;
	Thu,  2 Nov 2017 18:45:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JaHTzv0fszG1; Thu,  2 Nov 2017 18:45:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6A875204D6;
	Thu,  2 Nov 2017 18:45:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E682A162711; Thu,  2 Nov 2017 14:45:43 -0400 (EDT)
Date: Thu, 2 Nov 2017 14:45:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Message-ID: <20171102184543.GL9221@denix.org>
References: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
MIME-Version: 1.0
In-Reply-To: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] kernel-fitimage: introduce FIT_HASH_ALG
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
X-List-Received-Date: Thu, 02 Nov 2017 18:45:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 02, 2017 at 04:48:18PM +0100, Ayoub Zaki wrote:
> sanitize fitImage hash algorithm selection with FIT_HASH_ALG
> switch default hash algorithm from sha1 to sha256
> 
> Signed-off-by: Ayoub Zaki <ayoub.zaki@embexus.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta/classes/kernel-fitimage.bbclass | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 179185b..3cc3a33 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -36,6 +36,9 @@ python __anonymous () {
>  # Options for the device tree compiler passed to mkimage '-D' feature:
>  UBOOT_MKIMAGE_DTCOPTS ??= ""
>  
> +# fitImage Hash Algo
> +FIT_HASH_ALG ?= "sha256"
> +
>  #
>  # Emit the fitImage ITS header
>  #
> @@ -95,7 +98,7 @@ EOF
>  # $4 ... Compression type
>  fitimage_emit_section_kernel() {
>  
> -	kernel_csum="sha1"
> +	kernel_csum="${FIT_HASH_ALG}"
>  
>  	ENTRYPOINT=${UBOOT_ENTRYPOINT}
>  	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
> @@ -128,7 +131,7 @@ EOF
>  # $3 ... Path to DTB image
>  fitimage_emit_section_dtb() {
>  
> -	dtb_csum="sha1"
> +	dtb_csum="${FIT_HASH_ALG}"
>  
>  	cat << EOF >> ${1}
>                  fdt@${2} {
> @@ -152,7 +155,7 @@ EOF
>  # $3 ... Path to setup image
>  fitimage_emit_section_setup() {
>  
> -	setup_csum="sha1"
> +	setup_csum="${FIT_HASH_ALG}"
>  
>  	cat << EOF >> ${1}
>                  setup@${2} {
> @@ -179,7 +182,7 @@ EOF
>  # $3 ... Path to ramdisk image
>  fitimage_emit_section_ramdisk() {
>  
> -	ramdisk_csum="sha1"
> +	ramdisk_csum="${FIT_HASH_ALG}"
>  	ramdisk_ctype="none"
>  	ramdisk_loadline=""
>  	ramdisk_entryline=""
> @@ -237,7 +240,7 @@ EOF
>  # $6 ... default flag
>  fitimage_emit_section_config() {
>  
> -	conf_csum="sha1"
> +	conf_csum="${FIT_HASH_ALG}"
>  	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
>  		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
>  	fi
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

