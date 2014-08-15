Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 53137601A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 17:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7FHHli4010309; Fri, 15 Aug 2014 18:17:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zCsn6jGjKvXn; Fri, 15 Aug 2014 18:17:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7FHHiQo010298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 15 Aug 2014 18:17:45 +0100
Message-ID: <1408123065.21596.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Aug 2014 18:17:45 +0100
In-Reply-To: <1408009882-28210-1-git-send-email-raj.khem@gmail.com>
References: <1408009882-28210-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Repace if-else with case and add musl triplet
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
X-List-Received-Date: Fri, 15 Aug 2014 17:17:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-08-14 at 02:51 -0700, Khem Raj wrote:
> Simplifies the code and adds knowlwdge about musl targets
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc |   18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)

This breaks x32 builds:

https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/204/steps/BuildImages/logs/stdio

(target doesn't end up set to linux-x32 which it needs to be)

Cheers,

Richard

> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index b839c00..e585dbb 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -60,17 +60,15 @@ do_configure () {
>  	ln -sf apps/openssl.pod crypto/crypto.pod ssl/ssl.pod doc/
>  
>  	os=${HOST_OS}
> -	if [ "x$os" = "xlinux-uclibc" ]; then
> +	case $os in
> +	linux-uclibc* |\
> +	linux-musl* |\
> +	linux-gnu*)
>  		os=linux
> -	elif [ "x$os" = "xlinux-uclibceabi" ]; then
> -		os=linux
> -	elif [ "x$os" = "xlinux-uclibcspe" ]; then
> -		os=linux
> -	elif [ "x$os" = "xlinux-gnuspe" ]; then
> -		os=linux
> -	elif [ "x$os" = "xlinux-gnueabi" ]; then
> -		os=linux
> -	fi
> +		;;
> +		*)
> +		;;
> +	esac
>  	target="$os-${HOST_ARCH}"
>  	case $target in
>  	linux-arm)
> -- 
> 1.7.10.4
> 



