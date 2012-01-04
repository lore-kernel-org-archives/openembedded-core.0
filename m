Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiUVp-0006CQ-4S for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 18:20:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04HD7ji022190
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 17:13:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21648-09 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 17:13:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04HCxHQ022184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 17:13:00 GMT
Message-ID: <1325697179.20759.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 17:12:59 +0000
In-Reply-To: <595333f997b8f8f2ecfbb361ad8a7ccfb33a993e.1325101674.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
	<595333f997b8f8f2ecfbb361ad8a7ccfb33a993e.1325101674.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 11/16] udev: ensure /dev/pts and /dev/shm does exists
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
X-List-Received-Date: Wed, 04 Jan 2012 17:20:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-28 at 19:55 +0000, Otavio Salvador wrote:
> ---
>  meta/recipes-core/udev/udev/init |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> index d0d7e5d..c2b491e 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -30,9 +30,10 @@ echo -n "Starting udev"
>  # mount the tmpfs on /dev, if not already done
>  LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /proc/mounts && {
>  	mount -n -o mode=0755 -t tmpfs none "/dev"
> -	mkdir -m 0755 /dev/pts
> -	mkdir -m 1777 /dev/shm
>  }
> +mkdir -p -m 0755 /dev/pts
> +mkdir -p -m 1777 /dev/shm
> +

Please put an if [ -e ] around these since its a couple of exec calls we
could do without if they already exist...

Cheers,

Richard



