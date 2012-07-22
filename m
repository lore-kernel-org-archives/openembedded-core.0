Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ssru4-0003PX-Qz for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 10:52:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6M8fFcZ026822;
	Sun, 22 Jul 2012 09:41:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19932-07; Sun, 22 Jul 2012 09:41:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6M8f4bN026816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 22 Jul 2012 09:41:06 +0100
Message-ID: <1342946469.21788.54.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jul 2012 09:41:09 +0100
In-Reply-To: <1342871746-14583-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1342871746-14583-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] bitbake: do not set CCACHE_DISABLE=0
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
X-List-Received-Date: Sun, 22 Jul 2012 08:52:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-07-21 at 13:55 +0200, Enrico Scholz wrote:
> ccache checks for existence of environment; not for its value:
> 
>   ---- ccache-3.1.7/ccache.c ---
>         if (getenv("CCACHE_DISABLE")) {
>                 cc_log("ccache is disabled");
> 
> Hence, avoid setting of $CCACHE_DISABLE instead of assigning '0'.
> 
> Unfortunately, bitbake has a similar behavior when evaluating 'export'
> and 'unexport' flags so that this variable must be set in a python
> function instead of declaring it in bitbake.conf.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/classes/base.bbclass |    8 ++++++++
>  meta/conf/bitbake.conf    |    3 ---
>  2 files changed, 8 insertions(+), 3 deletions(-)

Why doesn't CCACHE_DISABLE[unexport] = "1" help here? Doesn't the
unexport flag stop this entering the environment?

Cheers,

Richard


> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 1f76023..9f9c803 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -309,6 +309,14 @@ do_build () {
>  python () {
>      import exceptions, string, re
>  
> +    # Disable ccache explicitly if CCACHE is null since gcc may be a
> +    # symlink of ccache some distributions (e.g., Fedora 17). Please
> +    # note that only the existence of $CCACHE_DISABLE matters; the
> +    # value is ignored.
> +    if d.getVar('CCACHE', True) == '':
> +        d.setVar('CCACHE_DISABLE', True)
> +        d.setVarFlag('CCACHE_DISABLE', 'export', True)
> +
>      # Handle PACKAGECONFIG
>      #
>      # These take the form:
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a8a1665..1bb66ad 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -420,9 +420,6 @@ export PATH
>  ##################################################################
>  
>  CCACHE ??= ""
> -# Disable ccache explicitly if CCACHE is null since gcc may be a symlink
> -# of ccache some distributions (e.g., Fedora 17).
> -export CCACHE_DISABLE ??= "${@[0,1][d.getVar('CCACHE', True) == '']}"
>  # Assign CCACHE_DIR a default value to fix a bug of ccache 3.1.7,
>  # since it would always create CCACHE_DIR/.ccache even if
>  # CCACHE_DISABLE = 1.




