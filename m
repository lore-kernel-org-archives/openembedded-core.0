Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 87E02783E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:45:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 17 Aug 2017 12:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,389,1498546800"; d="scan'208";a="138859236"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga005.jf.intel.com with ESMTP; 17 Aug 2017 12:45:26 -0700
Message-ID: <1502999657.28682.22.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Date: Thu, 17 Aug 2017 14:54:17 -0500
In-Reply-To: <1502300913-40295-3-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
	<1502300913-40295-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: jurobystricky@hotmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 02/11] image-prelink.bbclass: support binary reproducibility
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
X-List-Received-Date: Thu, 17 Aug 2017 19:45:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-08-09 at 10:48 -0700, Juro Bystricky wrote:
> Conditionally support binary reproducibility in built images.
> If BUILD_REPRODUCIBLE_BINARIES = 1 then:
> 
> 1. Do not randomize library addresses
> 2. Set/export PRELINK_TIMESTAMP to a reproducible value.
>    If REPRODUCIBLE_TIMESTAMP_ROOTFS is specified, then the value will
>    be used. Otherwise the timestamp will be derived from the top git commit.
> 
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/classes/image-prelink.bbclass | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
> index 4157df0..e833d47 100644
> --- a/meta/classes/image-prelink.bbclass
> +++ b/meta/classes/image-prelink.bbclass
> @@ -36,7 +36,17 @@ prelink_image () {
>  	dynamic_loader=$(linuxloader)
>  
>  	# prelink!
> -	${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
> +	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
> +		bbnote " prelink: BUILD_REPRODUCIBLE_BINARIES..."
> +		if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> +			export PRELINK_TIMESTAMP=`git log -1 --pretty=%ct `


as Chris suggested in other email, better to used $() instead of ``



> +		else
> +			export PRELINK_TIMESTAMP=$REPRODUCIBLE_TIMESTAMP_ROOTFS
> +		fi
> +		${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -am -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
> +	else
> +		${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
> +	fi
>  
>  	# Remove the prelink.conf if we had to add it.
>  	if [ "$dummy_prelink_conf" = "true" ]; then
> -- 
> 2.7.4
> 



