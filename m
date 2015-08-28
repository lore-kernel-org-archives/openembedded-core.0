Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id F0A1271633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 16:39:43 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so29386321pad.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 09:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=myPM2X2eYT/dFdVrcWFBOYbcMGeGVLFU4dbgg1GLw/g=;
	b=WP6HBG5uHwlKOq8ws5BcWZWR7xKcwCK/WqvwnypaS00mT9SgdmKBbytndpwxLnsOt4
	Ku6bsm/syaqb2sDy0SeamirNU/5+SYbaCqG1hvkcYi1Lptn9oZn0C4P45UEgsFrptcN4
	LD06UeNVU8NaF4yNHn6D63U1Wpa/dSi/oBwyTHUCrYptimc5Qm2OlXI88np8EEvAN0op
	nJI0U1ayhi5l7fs55RpjBqQuJPGEAnkCWe57zrPp68W0FE7rc3BiNIC0mpYvYs2++Ukn
	Y7fPu1cMrlTpItaDqWhAv9KFY4RdIEloKXq0F4377MXWVDuwCay4uZAsEKE/TaaJh+bZ
	etog==
X-Received: by 10.68.201.105 with SMTP id jz9mr16743581pbc.86.1440779983877;
	Fri, 28 Aug 2015 09:39:43 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:d511:789c:724b:54b9?
	([2601:202:4000:1239:d511:789c:724b:54b9])
	by smtp.googlemail.com with ESMTPSA id
	p9sm6248440pdr.68.2015.08.28.09.39.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Aug 2015 09:39:42 -0700 (PDT)
Message-ID: <55E08ECC.2020109@gmail.com>
Date: Fri, 28 Aug 2015 09:39:40 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1440436338-28264-1-git-send-email-anibal.limon@linux.intel.com>
In-Reply-To: <1440436338-28264-1-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [PATCH 1/2][dizzy] license_class: fix license.manifest shows LICENSE field differently to recipe
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
X-List-Received-Date: Fri, 28 Aug 2015 16:39:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

merged to staging

thanks
armin

On 08/24/2015 10:12 AM, Aníbal Limón wrote:
> Drop removal of [|&()*] operators in pkged_lic because this removal is only
> needed to validate if license is collected.
> 
> [YOCTO #6757]
> 
> (From OE-Core rev: 57e5f74382d51f2a8df00e18b6008e3d2b44ad1a)
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/license.bbclass | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 91d8bab..dfb162d 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -49,24 +49,25 @@ license_create_manifest() {
>  
>  		pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
>  		pkged_name="$(basename $(readlink ${filename}))"
> -		pkged_lic="$(sed -n "/^LICENSE_${pkged_name}: /{ s/^LICENSE_${pkged_name}: //; s/[|&()*]/ /g; s/  */ /g; p }" ${filename})"
> +		pkged_lic="$(sed -n "/^LICENSE_${pkged_name}: /{ s/^LICENSE_${pkged_name}: //; p }" ${filename})"
>  		if [ -z ${pkged_lic} ]; then
>  			# fallback checking value of LICENSE
> -			pkged_lic="$(sed -n "/^LICENSE: /{ s/^LICENSE: //; s/[|&()*]/ /g; s/  */ /g; p }" ${filename})"
> +			pkged_lic="$(sed -n "/^LICENSE: /{ s/^LICENSE: //; p }" ${filename})"
>  		fi
>  
>  		echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_MANIFEST}
>  		echo "PACKAGE VERSION:" ${pkged_pv} >> ${LICENSE_MANIFEST}
>  		echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_MANIFEST}
> -		printf "LICENSE:" >> ${LICENSE_MANIFEST}
> -		for lic in ${pkged_lic}; do
> +		echo "LICENSE:" ${pkged_lic} >> ${LICENSE_MANIFEST}
> +		echo "" >> ${LICENSE_MANIFEST}
> +
> +		lics="$(echo ${pkged_lic} | sed "s/[|&()*]/ /g" | sed "s/  */ /g" )"
> +		for lic in ${lics}; do
>  			# to reference a license file trim trailing + symbol
>  			if ! [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic%+}" ]; then
>  				bbwarn "The license listed ${lic} was not in the licenses collected for ${pkged_pn}"
>  			fi
> -                        printf " ${lic}" >> ${LICENSE_MANIFEST}
>  		done
> -		printf "\n\n" >> ${LICENSE_MANIFEST}
>  	done
>  
>  	# Two options here:
> 

