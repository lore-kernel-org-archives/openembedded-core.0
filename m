Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMLPm-0006SU-Ov for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 16:38:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HEZXpr017523
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 15:35:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17364-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 15:35:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HEZPa9017517
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 15:35:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305641835.2429.228.camel@phil-desktop>
References: <1305633118.2429.188.camel@phil-desktop>
	<1305633770.3424.229.camel@rex>
	<1305634164.2429.193.camel@phil-desktop>
	<1305641835.2429.228.camel@phil-desktop>
Date: Tue, 17 May 2011 15:35:25 +0100
Message-ID: <1305642925.3424.251.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] image-prelink: remove hardcoded path assumptions
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
X-List-Received-Date: Tue, 17 May 2011 14:38:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 15:17 +0100, Phil Blundell wrote:
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/classes/image-prelink.bbclass |   13 +++++--------
>  1 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
> index ee0951c..350c29d 100644
> --- a/meta/classes/image-prelink.bbclass
> +++ b/meta/classes/image-prelink.bbclass
> @@ -12,25 +12,22 @@ prelink_image () {
>  	echo "Size before prelinking $pre_prelink_size."
>  
>  	# We need a prelink conf on the filesystem, add one if it's missing
> -	if [ ! -e ${IMAGE_ROOTFS}/etc/prelink.conf ]; then
> -		cp ${STAGING_DIR_NATIVE}/etc/prelink.conf \
> -			${IMAGE_ROOTFS}/etc/prelink.conf
> +	if [ ! -e ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf ]; then
> +		cp ${STAGING_DIR_NATIVE}${sysconfdir_native}/prelink.conf \
> +			${IMAGE_ROOTFS}${sysconfdir}/prelink.conf
>  		dummy_prelink_conf=true;
>  	else
>  		dummy_prelink_conf=false;
>  	fi
>  
>  	# prelink!
> -	${STAGING_DIR_NATIVE}/usr/sbin/prelink --root ${IMAGE_ROOTFS} -amR
> +	${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf
>  
>  	# Remove the prelink.conf if we had to add it.
>  	if [ "$dummy_prelink_conf" == "true" ]; then
> -		rm -f ${IMAGE_ROOTFS}/etc/prelink.conf
> +		rm -f ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf
>  	fi
>  
> -	# Cleanup temporary file, it's not needed...
> -	rm -f ${IMAGE_ROOTFS}/etc/prelink.cache
> -

The patch description and what it does don't quite match (the rm is
removed and options are added to prelink).

Cheers,

Richard



