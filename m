Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QluiG-0006tU-Bi
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 05:23:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6R3IvGv012919
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 20:18:57 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 26 Jul 2011 20:18:56 -0700
Message-ID: <4E2F839F.70005@windriver.com>
Date: Tue, 26 Jul 2011 22:18:55 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311720062.git.richard.purdie@linuxfoundation.org>
	<bfe5838302fbcfe989e3c26c9e04c927c4755e65.1311720062.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <bfe5838302fbcfe989e3c26c9e04c927c4755e65.1311720062.git.richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/3] package/rootfs_rpm: Implement RPM multilib package handling
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
X-List-Received-Date: Wed, 27 Jul 2011 03:23:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

We found a minor bug in the patch since it was first sent out:

On 7/26/11 5:50 PM, Richard Purdie wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
> 
> This is a first pass at adding multilib support to the RPM package
> and image handling code.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package_rpm.bbclass |  229 ++++++++++++++++++++++++--------------
>  meta/classes/rootfs_rpm.bbclass  |   17 +++-
>  2 files changed, 160 insertions(+), 86 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 2cc5742..05f3929 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -21,67 +21,71 @@ RPMCONF_HOST_BASE = "${DEPLOY_DIR_RPM}/solvedb-sdk"
>  # Update the Packages depsolver db in ${DEPLOY_DIR_RPM}
>  #
>  package_update_index_rpm () {
> -	rpmarchs="${PACKAGE_ARCHS}"
> -
>  	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" ]; then
>  		return
>  	fi
>  
> -	packagedirs=""
> -	packagedirs_sdk=""
> -	for arch in $rpmarchs ; do
> -		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
> -		extension="-nativesdk"
> -		if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
> -		    extension=""
> -		fi
> -		packagedirs="${DEPLOY_DIR_RPM}/$arch $packagedirs"
> -		packagedirs_sdk="${DEPLOY_DIR_RPM}/$sdkarch$extension $packagedirs_sdk"
> +	base_package_archs="${PACKAGE_ARCHS}"
> +	ml_package_archs="${MULTILIB_PACKAGE_ARCHS}"
> +
> +	for archvar in base_package_archs ml_package_archs; do
> +		eval archs=\${${archvar}}
> +		packagedirs=""
> +		packagedirs_sdk=""
> +		for arch in $archs; do
> +			sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
> +			extension="-nativesdk"
> +			if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
> +			    extension=""
> +			fi
> +			packagedirs="${DEPLOY_DIR_RPM}/$arch $packagedirs"
> +			packagedirs_sdk="${DEPLOY_DIR_RPM}/$sdkarch$extension $packagedirs_sdk"
>  
> -		rm -rf ${DEPLOY_DIR_RPM}/$arch/solvedb
> -		rm -rf ${DEPLOY_DIR_RPM}/$sdkarch$extension/solvedb
> -	done
> +			rm -rf ${DEPLOY_DIR_RPM}/$arch/solvedb
> +			rm -rf ${DEPLOY_DIR_RPM}/$sdkarch$extension/solvedb
> +		done
>  
> -	cat /dev/null > ${RPMCONF_TARGET_BASE}.conf
> -	for pkgdir in $packagedirs; do
> -		if [ -e $pkgdir/ ]; then
> -			echo "Generating solve db for $pkgdir..."
> -			echo $pkgdir/solvedb >> ${RPMCONF_TARGET_BASE}.conf
> -			if [ -d $pkgdir/solvedb ]; then
> -				# We've already processed this and it's a duplicate
> -				continue
> +		cat /dev/null > ${RPMCONF_TARGET_BASE}-${archvar}.conf
> +		for pkgdir in $packagedirs; do
> +			if [ -e $pkgdir/ ]; then
> +				echo "Generating solve db for $pkgdir..."
> +				echo $pkgdir/solvedb >> ${RPMCONF_TARGET_BASE}-${archvar}.conf
> +				if [ -d $pkgdir/solvedb ]; then
> +					# We've already processed this and it's a duplicate
> +					continue
> +				fi
> +				mkdir -p $pkgdir/solvedb
> +				echo "# Dynamically generated solve manifest" >> $pkgdir/solvedb/manifest
> +				find $pkgdir -maxdepth 1 -type f >> $pkgdir/solvedb/manifest
> +				${RPM} -i --replacepkgs --replacefiles --oldpackage \
> +					-D "_dbpath $pkgdir/solvedb" --justdb \
> +					--noaid --nodeps --noorder --noscripts --notriggers --noparentdirs --nolinktos --stats \
> +					--ignoresize --nosignature --nodigest \
> +					-D "__dbi_txn create nofsync" \
> +					$pkgdir/solvedb/manifest
>  			fi
> -			mkdir -p $pkgdir/solvedb
> -			echo "# Dynamically generated solve manifest" >> $pkgdir/solvedb/manifest
> -			find $pkgdir -maxdepth 1 -type f >> $pkgdir/solvedb/manifest
> -			${RPM} -i --replacepkgs --replacefiles --oldpackage \
> -				-D "_dbpath $pkgdir/solvedb" --justdb \
> -				--noaid --nodeps --noorder --noscripts --notriggers --noparentdirs --nolinktos --stats \
> -				--ignoresize --nosignature --nodigest \
> -				-D "__dbi_txn create nofsync" \
> -				$pkgdir/solvedb/manifest
> -		fi
> -	done
> +		done
>  
> -	cat /dev/null > ${RPMCONF_HOST_BASE}.conf
> -	for pkgdir in $packagedirs_sdk; do
> -		if [ -e $pkgdir/ ]; then
> -			echo "Generating solve db for $pkgdir..."
> -			echo $pkgdir/solvedb >> ${RPMCONF_HOST_BASE}.conf
> -			if [ -d $pkgdir/solvedb ]; then
> -				# We've already processed this and it's a duplicate
> -				continue
> -			fi	
> -			mkdir -p $pkgdir/solvedb
> -			echo "# Dynamically generated solve manifest" >> $pkgdir/solvedb/manifest
> -			find $pkgdir -maxdepth 1 -type f >> $pkgdir/solvedb/manifest
> -			${RPM} -i --replacepkgs --replacefiles --oldpackage \
> -				-D "_dbpath $pkgdir/solvedb" --justdb \
> -				--noaid --nodeps --noorder --noscripts --notriggers --noparentdirs --nolinktos --stats \
> -				--ignoresize --nosignature --nodigest \
> -				-D "__dbi_txn create nofsync" \
> -				$pkgdir/solvedb/manifest
> -		fi
> +		cat /dev/null > ${RPMCONF_HOST_BASE}.conf

The above line should be:

cat /dev/null > ${RPMCONF_HOST_BASE}-${archvar}.conf

....


