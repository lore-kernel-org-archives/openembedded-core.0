Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TT77b-0001Ec-Dg for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 09:24:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9U8AoQW014164;
	Tue, 30 Oct 2012 08:10:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12522-04; Tue, 30 Oct 2012 08:10:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9U8AhTl014158
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 30 Oct 2012 08:10:44 GMT
Message-ID: <1351584642.2828.58.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Tue, 30 Oct 2012 08:10:42 +0000
In-Reply-To: <1351534455.13864.25.camel@phil-desktop>
References: <1351534455.13864.25.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools: Attempt to clean build directory when rerunning configure
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
X-List-Received-Date: Tue, 30 Oct 2012 08:24:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-29 at 18:14 +0000, Phil Blundell wrote:
> Existing logic in autotools_preconfigure() will clean the build directory
> before rerunning configure in the case where ${S} != ${B}.  It is, however,
> desirable to make at least some attempt to clean the build artifacts for
> in-tree builds since many packages lack the appropriate dependency rules
> to force a recompile if (for example) CFLAGS has changed.  Making distclean
> would be better but is not practical because many packages don't support it
> properly.  Even "make clean" is not universally available, so we ignore any
> failure from that command and just carry on regardless.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/classes/autotools.bbclass |   13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

How extensively has this been tested? I have a suspicion that we might
run into a number of issues doing this throughout the tree :(

I'm wondering how many recipes will suffer from issues with "make clean"
verses how many recipes would struggle if we defaulted ${B} != ${S}?

Cheers,

Richard


> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index b97d74b..6539df9 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -93,10 +93,15 @@ CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
>  
>  autotools_preconfigure() {
>  	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
> -		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${S}" != "${B}" ]; then
> -			echo "Previously configured separate build directory detected, cleaning ${B}"
> -			rm -rf ${B}
> -			mkdir ${B}
> +		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" ]; then
> +			if [ "${S}" != "${B}" ]; then
> +				echo "Previously configured separate build directory detected, cleaning ${B}"
> +				rm -rf ${B}
> +				mkdir ${B}
> +			else
> +				echo "Previously configured source directory detected, cleaning ${S}"
> +				( oe_runmake clean ) || true
> +			fi
>  		fi
>  	fi
>  }




