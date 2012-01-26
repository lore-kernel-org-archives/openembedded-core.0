Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RqWPQ-0004Vk-Lt for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 21:59:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QKpFTZ028425;
	Thu, 26 Jan 2012 20:51:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27844-07; Thu, 26 Jan 2012 20:51:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QKp9pk028417
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 26 Jan 2012 20:51:10 GMT
Message-ID: <1327611071.19643.405.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 20:51:11 +0000
In-Reply-To: <1327597394-31990-1-git-send-email-koen@dominion.thruhere.net>
References: <1327597394-31990-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] package bbclass: allow per package PRIVATE_LIBS
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
X-List-Received-Date: Thu, 26 Jan 2012 20:59:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-26 at 18:03 +0100, Koen Kooi wrote:
> If a recipe packages multiple versions of shlib (e.g. powervr drivers) we only want the shlib code to pickup $PN, not $PN-foo subpackages.
> This keeps backward compatibility with the global PRIVATE_LIBS usage if no per package PRIVATE_LIBS are set for a given package. In other words: this doesn't break the firefox recipe.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/classes/package.bbclass |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 45447e3..22a76cf 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1246,7 +1246,8 @@ python package_do_shlibs() {
>  				if not this_soname in sonames:
>  					# if library is private (only used by package) then do not build shlib for it
>  					if not private_libs or -1 == private_libs.find(this_soname):
> -						sonames.append(this_soname)
> +						if not private_libs_pkg or -1 == private_libs_pkg.find(this_soname):
> +							sonames.append(this_soname)
>  				if libdir_re.match(root):
>  					needs_ldconfig = True
>  				if snap_symlinks and (file != this_soname):
> @@ -1328,6 +1329,8 @@ python package_do_shlibs() {
>  	shlib_provider = {}
>  	private_libs = d.getVar('PRIVATE_LIBS', True)
>  	for pkg in packages.split():
> +		if not private_libs:
> +			private_libs_pkg = d.getVar('PRIVATE_LIBS_' + pkg, True)

You might as well just put:

                         private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True)

and drop the first bit of the patch.

Cheers,

Richard



