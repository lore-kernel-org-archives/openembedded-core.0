Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id AC7477404A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 14:30:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 7C6F65188032
Message-ID: <1435329008.3376.5.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jun 2015 15:30:08 +0100
In-Reply-To: <1435164582-31218-1-git-send-email-anibal.limon@linux.intel.com>
References: <1435164582-31218-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: Evolution 3.16.3 (3.16.3-2.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH][fido] classes/license.bbclass: Improve generic license copy validation.
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
X-List-Received-Date: Fri, 26 Jun 2015 14:30:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2015-06-24 at 11:49 -0500, Aníbal Limón wrote:
> Remove + char in any position for cover cases when license has
> the form like GPL-2.0+-with-OpenSSL-exception.
> 
> [YOCTO #7584]

Thanks Aníbal,

This is queued in my fido-next branch[1].

Regards,

Joshua

1. http://cgit.openembedded.org/openembedded-core
-contrib/log/?h=joshuagl/fido-next

> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/license.bbclass 
> b/meta/classes/license.bbclass
> index 73a0e97..e00a695 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -71,8 +71,12 @@ license_create_manifest() {
>  
>  		lics="$(echo ${pkged_lic} | sed "s/[|&()*]/ /g" | 
> sed "s/  */ /g" )"
>  		for lic in ${lics}; do
> +			# remove + chars in any position this cover 
> cases like
> +			# GPL-2.0+-with-OpenSSL-exception -> GPL-2.0
> -with-OpenSSL-exception
> +			lic="$(echo ${lic} | sed "s/\+//g")"
> +
>  			# to reference a license file trim trailing 
> + symbol
> -			if ! [ -e 
> "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic%+}" ]; then
> +			if ! [ -e 
> "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
>  				bbwarn "The license listed ${lic} 
> was not in the licenses collected for ${pkged_pn}"
>  			fi
>  		done
> -- 
> 1.9.1
> 

