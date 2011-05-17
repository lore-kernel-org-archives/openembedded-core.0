Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMLFJ-0006B3-5Z for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 16:27:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HEOiTl017361
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 15:24:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16971-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 15:24:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HEOY4n017355
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 15:24:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305640549.2429.226.camel@phil-desktop>
References: <1305640549.2429.226.camel@phil-desktop>
Date: Tue, 17 May 2011 15:24:33 +0100
Message-ID: <1305642273.3424.244.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] rootfs_ipk: respect ONLINE_PACKAGE_MANAGEMENT
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
X-List-Received-Date: Tue, 17 May 2011 14:27:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 14:55 +0100, Phil Blundell wrote:
> This makes it work more or less the same way as the current tip of oe
> master, except that I didn't copy over the behaviour for O_P_M="add"
> because it seemed slightly bogus to me.  
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/classes/rootfs_ipk.bbclass |   12 ++++++++++--
>  1 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> index 5727d15..c7c8325 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -69,8 +69,16 @@ fakeroot rootfs_ipk_do_rootfs () {
>  	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
>  
>  	${ROOTFS_POSTPROCESS_COMMAND}
> -	
> -	rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
> +
> +	case "${ONLINE_PACKAGE_MANAGEMENT}" in
> +	none)
> + 		rm -rf ${IMAGE_ROOTFS}${opkglibdir}
> +		;;
> +
> +	*)
> +		rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
> +		;;
> +	esac
>  
>  	log_check rootfs 	
>  }

What's wrong with:

ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "

as used in the minimal image? The nice thing about this is it works over
several package backends too...

Cheers,

Richard



