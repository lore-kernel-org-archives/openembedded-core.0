Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R0f3l-0002fe-Je for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 21:42:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JbLP4001103
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 20:37:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00906-06 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2011 20:37:17 +0100 (BST)
Received: from [192.168.1.40] (dynamic10.rpnet.com [192.168.1.40])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JbGK4001096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 20:37:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314979795-13537-1-git-send-email-denis@eukrea.com>
References: <1314970267-20365-2-git-send-email-denis@eukrea.com>
	<1314979795-13537-1-git-send-email-denis@eukrea.com>
Date: Mon, 05 Sep 2011 20:37:16 +0100
Message-ID: <1315251436.1243.17.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RESEND] bitbake.conf: fix ubi images creation
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
X-List-Received-Date: Mon, 05 Sep 2011 19:42:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-02 at 18:09 +0200, Denis Carikli wrote:
> Without that commit ubinize.cfg lack a volume name value,
>   and the related ubinize.cfg line looks like that:
>     vol_name=
>   which result in a broken ubi image,which after beeing flashed produce
>   the following error:
>     UBI error: vtbl_check: volume table check failed: record 0, error 11
>   wich result in a kernel panic because the rootfs can't be mounted.
> 
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> ---
>  meta/conf/bitbake.conf |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a68be07..14ee90c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -382,6 +382,8 @@ IMAGE_BASENAME = "${PN}"
>  IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
>  IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
>  
> +UBI_VOLNAME ?= "${MACHINE}-rootfs"
> +
>  # This option allows for a percentage overage of the actual image size rather than a
>  # fixed extra space, this is space needed for initial startup and basic operations.
>  IMAGE_OVERHEAD_FACTOR ?= 1.3

Merged to master but I moved this definition to image_types.bbclass
since thats the only place its used and we may as well not pollute the
global data store when we don't need to.

Cheers,

Richard



