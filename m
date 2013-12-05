Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 21C4A6DD0D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 12:14:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2013 04:14:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,832,1378882800"; d="scan'208";a="447345639"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.191])
	by orsmga002.jf.intel.com with ESMTP; 05 Dec 2013 04:14:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: rongqing.li@windriver.com
Date: Thu, 05 Dec 2013 12:14:39 +0000
Message-ID: <5926953.s9RiCoB0Gl@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1386205729-18878-1-git-send-email-rongqing.li@windriver.com>
References: <1386205729-18878-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass/image.bbclass: remove obsolete codes
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
X-List-Received-Date: Thu, 05 Dec 2013 12:14:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Roy,

On Thursday 05 December 2013 09:08:49 rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> After 1b8e4abd2d9c0 [bitbake.conf/package: Collapse PKGDATA_DIR into
> a single machine specific directory], oe-pkgdata-util does not use
> target_suffix parameter, so do not need to loop the vendor
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta/classes/buildhistory.bbclass |   10 ++++------
>  meta/classes/image.bbclass        |    4 +---
>  2 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index ec3f0b1..508d028 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -339,12 +339,10 @@ buildhistory_get_installed() {
>  	printf "" > $1/installed-package-sizes.tmp
>  	cat $pkgcache | while read pkg pkgfile pkgarch
>  	do
> -		for vendor in ${TARGET_VENDOR} ${MULTILIB_VENDORS} ; do
> -			size=`oe-pkgdata-util read-value ${PKGDATA_DIR} "PKGSIZE"
> ${pkg}_${pkgarch}` -			if [ "$size" != "" ] ; then
> -				echo "$size $pkg" >> $1/installed-package-sizes.tmp
> -			fi
> -		done
> +		size=`oe-pkgdata-util read-value ${PKGDATA_DIR} "PKGSIZE"
> ${pkg}_${pkgarch}` +		if [ "$size" != "" ] ; then
> +			echo "$size $pkg" >> $1/installed-package-sizes.tmp
> +		fi
>  	done
>  	cat $1/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB "
> $2}' > $1/installed-package-sizes.txt rm $1/installed-package-sizes.tmp
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index cc65e35..168f283 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -506,9 +506,7 @@ rootfs_install_complementary() {
>      if [ "$GLOBS" != "" ] ; then
>          # Use the magic script to do all the work for us :)
> 
>          : > ${WORKDIR}/complementary_pkgs.txt
> 
> -        for vendor in '${TARGET_VENDOR}' ${MULTILIB_VENDORS} ; do
> -            oe-pkgdata-util glob ${PKGDATA_DIR}
> ${WORKDIR}/installed_pkgs.txt "$GLOBS" >> ${WORKDIR}/complementary_pkgs.txt
> -        done
> +        oe-pkgdata-util glob ${PKGDATA_DIR} ${WORKDIR}/installed_pkgs.txt
> "$GLOBS" >> ${WORKDIR}/complementary_pkgs.txt
> 
>          # Install the packages, if any
>          sed -i '/^$/d' ${WORKDIR}/complementary_pkgs.txt

Good catch :)

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

