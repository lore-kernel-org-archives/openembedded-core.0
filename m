Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC37745D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 06:25:43 +0000 (UTC)
Received: from [172.21.2.124] (unknown [87.54.42.112])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 5DE531C08AB;
	Mon, 18 Jun 2018 08:25:42 +0200 (CEST)
To: Alex Kiernan <alex.kiernan@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1529133425-9806-1-git-send-email-alex.kiernan@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <2bf570bc-3025-b7dc-e305-891c807a99d8@geanix.com>
Date: Mon, 18 Jun 2018 08:25:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1529133425-9806-1-git-send-email-alex.kiernan@gmail.com>
Subject: Re: [PATCH 1/2] kernel-fitimage: Allow setting of DTB/DTBO relocation address
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
X-List-Received-Date: Mon, 18 Jun 2018 06:25:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Alex,

On 2018-06-16 09:17, Alex Kiernan wrote:
> Introduce UBOOT_DTB_LOADADDRESS and UBOOT_DTBO_LOADADDRESS so that you
> can set where U-Boot loads full and overlay DTBs. This is required when
> using bootm's overlay support to construct the final DTB.
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> This commit conflicts with this patch:
> 
> https://patchwork.openembedded.org/series/12589/
> 
> Either that needs applying first and this needs rebasing on top of it, or
> use this one in its place.
> 
>   meta/classes/kernel-fitimage.bbclass | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 50a91e1..f3c2ff0 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -135,6 +135,15 @@ fitimage_emit_section_dtb() {
>   
>   	dtb_csum="sha1"
>   
> +	dtb_loadline=""
> +	dtb_ext=${DTB##*.}
> +	if [ "${dtb_ext}" = "dtbo" ]; then
> +		if [ -n "${UBOOT_DTBO_LOADADDRESS}" ]; then
> +			dtb_loadline="load = <${UBOOT_DTBO_LOADADDRESS}>;"
> +		fi
> +	elif [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
> +		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
> +	fi

I haven't looked into the use of DTB overlays in fitimages, but 
shouldn't it be possible to specify multiple overlays?

 From the way I read your patch, only a single overlay is supported...

// Martin

>   	cat << EOF >> ${1}
>                   fdt@${2} {
>                           description = "Flattened Device Tree blob";
> @@ -142,6 +151,7 @@ fitimage_emit_section_dtb() {
>                           type = "flat_dt";
>                           arch = "${UBOOT_ARCH}";
>                           compression = "none";
> +                        ${dtb_loadline}
>                           hash@1 {
>                                   algo = "${dtb_csum}";
>                           };
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
DK39600706

