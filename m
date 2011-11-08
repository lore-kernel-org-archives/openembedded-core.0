Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNqvZ-0001XB-Ot
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:01:46 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 10:55:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="71946293"
Received: from unknown (HELO [10.255.12.16]) ([10.255.12.16])
	by azsmga001.ch.intel.com with ESMTP; 08 Nov 2011 10:55:28 -0800
Message-ID: <4EB97B20.6030502@linux.intel.com>
Date: Tue, 08 Nov 2011 10:55:28 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1320775061.10843.100.camel@ted>
In-Reply-To: <1320775061.10843.100.camel@ted>
Subject: Re: [PATCH] classes: Remove various bashisms
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
X-List-Received-Date: Tue, 08 Nov 2011 19:01:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Great, this was on my To Do!

On 08/11/11 09:57, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Joshua Lock <josh@linux.intel.com>

> ---
> diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
> index 350c29d..53ef47e 100644
> --- a/meta/classes/image-prelink.bbclass
> +++ b/meta/classes/image-prelink.bbclass
> @@ -24,7 +24,7 @@ prelink_image () {
>  	${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf
>  
>  	# Remove the prelink.conf if we had to add it.
> -	if [ "$dummy_prelink_conf" == "true" ]; then
> +	if [ "$dummy_prelink_conf" = "true" ]; then
>  		rm -f ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf
>  	fi
>  
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 42543e0..dc711f2 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -152,7 +152,7 @@ kernel_do_install() {
>  	#
>  	cp -fR * $kerneldir
>  	cp .config $kerneldir
> -	if [ ! "${S}" == "${B}" ]; then
> +	if [ "${S}" != "${B}" ]; then
>  		cp -fR ${S}/* $kerneldir
>  	fi
>  	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index ba4feee..e8bdcae 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -87,22 +87,22 @@ package_generate_rpm_conf_common() {
>  	shift
>  
>  	printf "_solve_dbpath " > ${rpmconf_base}.macro
> -	o_colon=false
> +	o_colon="false"
>  
>  	for archvar in "$@"; do
>  		printf "_solve_dbpath " > ${rpmconf_base}-${archvar}.macro
> -		colon=false
> +		colon="false"
>  		for each in `cat ${rpmconf_base}-${archvar}.conf` ; do
> -			if [ "$o_colon" == true ]; then
> +			if [ "$o_colon" = "true" ]; then
>  				printf ":" >> ${rpmconf_base}.macro
>  			fi
> -			if [ "$colon" == true ]; then
> +			if [ "$colon" = "true" ]; then
>  				printf ":" >> ${rpmconf_base}-${archvar}.macro
>  			fi
>  			printf "%s" $each >> ${rpmconf_base}.macro
> -			o_colon=true
> +			o_colon="true"
>  			printf "%s" $each >> ${rpmconf_base}-${archvar}.macro
> -			colon=true
> +			colon="true"
>  		done
>  		printf "\n" >> ${rpmconf_base}-${archvar}.macro
>  	done
> @@ -214,7 +214,7 @@ package_install_internal_rpm () {
>  				ml_prefix=`echo ${pkg} | cut -d'-' -f1`
>  				ml_pkg=$pkg
>  				for i in ${MULTILIB_PREFIX_LIST} ; do
> -					if [ ${ml_prefix} == ${i} ]; then
> +					if [ ${ml_prefix} = ${i} ]; then
>  						ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
>  						archvar=ml_archs
>  						break
> @@ -238,7 +238,7 @@ package_install_internal_rpm () {
>  			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
>  			ml_pkg=$pkg
>  			for i in ${MULTILIB_PREFIX_LIST} ; do
> -				if [ ${ml_prefix} == ${i} ]; then
> +				if [ ${ml_prefix} = ${i} ]; then
>  					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
>  					archvar=ml_archs
>  					break
> @@ -273,7 +273,7 @@ package_install_internal_rpm () {
>  			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
>  			ml_pkg=$pkg
>  			for i in ${MULTILIB_PREFIX_LIST} ; do
> -				if [ ${ml_prefix} == ${i} ]; then
> +				if [ ${ml_prefix} = ${i} ]; then
>  					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
>  					archvar=ml_archs
>  					break
> @@ -364,7 +364,7 @@ package_install_internal_rpm () {
>  			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
>  			ml_pkg=$pkg
>  			for i in ${MULTILIB_PREFIX_LIST} ; do
> -				if [ ${ml_prefix} == ${i} ]; then
> +				if [ ${ml_prefix} = ${i} ]; then
>  					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
>  					archvar=ml_archs
>  					break
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


