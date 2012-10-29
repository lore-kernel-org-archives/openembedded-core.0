Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TSs9X-0003FG-0d for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 17:25:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TGBqgK005941;
	Mon, 29 Oct 2012 16:11:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05741-03; Mon, 29 Oct 2012 16:11:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TGBg6I005935
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 16:11:43 GMT
Message-ID: <1351527102.2828.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 29 Oct 2012 16:11:42 +0000
In-Reply-To: <1351523465-26489-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1351523465-26489-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate.bbclass: preserve time when unstaging files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2012 16:25:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-29 at 16:11 +0100, Enrico Scholz wrote:
> When packages are recreated after a 'bitbake -c clean', files will get
> wrong date because tar has been invoked with the '-m' option.
> 
> Correct timestamps are useful for bug hunting and there are better
> ways (e.g. using of ntp) than using '-m'.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/classes/sstate.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index cbb14e1..d7c4e11 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -551,7 +551,7 @@ sstate_create_package () {
>  sstate_unpack_package () {
>  	mkdir -p ${SSTATE_INSTDIR}
>  	cd ${SSTATE_INSTDIR}
> -	tar -xmvzf ${SSTATE_PKG}
> +	tar -xvzf ${SSTATE_PKG}
>  }
>  
>  # Need to inject information about classes not in the global configuration scope

This is a revert of:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=2d89cff42af2bb0049224bfaaebaa2b21966169f

where the option was added deliberately to deal with time mismatch
between autobuilders which was causing real world bugs.

Cheers,

Richard



