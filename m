Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 882946065F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 06:39:55 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VBfbf-0003rf-FI; Tue, 20 Aug 2013 08:39:55 +0200
Message-ID: <1376980784.4083.27.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: jackie.huang@windriver.com
Date: Tue, 20 Aug 2013 07:39:44 +0100
In-Reply-To: <0502058d180d47c81b6431d01868dd9bba6653f5.1376968627.git.jackie.huang@windriver.com>
References: <cover.1376968627.git.jackie.huang@windriver.com>
	<0502058d180d47c81b6431d01868dd9bba6653f5.1376968627.git.jackie.huang@windriver.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] sysvinit: add init.d/bootlogd status command for LSB compliance
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
X-List-Received-Date: Tue, 20 Aug 2013 06:39:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-20 at 11:25 +0800, jackie.huang@windriver.com wrote:
> @@ -37,6 +40,19 @@ case "$0" in
>  		;;
>  esac
>  
> +# default /var/log/boot is not an option since /var/log becomes
> +# /var/volatile/log
> +logfile=/var/local/bootlogd.log
> +
> +#
> +# Create initial log files
> +#
> +if [ ! -f "$logfile" ] && touch "$logfile" >/dev/null 2>&1; then
> +	echo "(Nothing has been logged yet.)" >| "$logfile"
> +	chown root:adm "$logfile"
> +	chmod 640 "$logfile"
> +fi
> +
>  case "$ACTION" in
>  	start)
>  		echo -n "Starting $DESC: "
> @@ -44,9 +60,9 @@ case "$ACTION" in
>  		then
>  			umask 027
>  			start-stop-daemon --start --quiet \
> -				--exec $DAEMON -- -r
> +				--exec $DAEMON -- -r -l $logfile
>  		else
> -			$DAEMON -r
> +			$DAEMON -r -l $logfile
>  		fi
>  		echo "$NAME."
>  		;;

It's not totally obvious that the changes are related to the "status"
command.  If you're creating new logfiles that didn't exist previously
then I think the commit message ought to explain why.

p.



