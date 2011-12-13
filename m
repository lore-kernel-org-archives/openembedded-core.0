Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaRYR-0001EL-R6 for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 13:33:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDCR0RO008672
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:27:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07989-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:26:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDCQsDV008666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:26:54 GMT
Message-ID: <1323779213.2731.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 12:26:53 +0000
In-Reply-To: <1323759539-23945-1-git-send-email-lauri.hintsala@bluegiga.com>
References: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>
	<1323759539-23945-1-git-send-email-lauri.hintsala@bluegiga.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] initscripts: fix timestamp check at bootmisc.sh
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
X-List-Received-Date: Tue, 13 Dec 2011 12:33:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-13 at 08:58 +0200, Lauri Hintsala wrote:
> Timestamp checking has been broken by the commit
> 2078af333d704fd894a2dedbc19cef5775cdadbb. Fix timestamp checking
> and clean the code.
> 
> cc: sgw@linux.intel.com
> cc: gary@mlbassoc.com
> 
> Signed-off-by: Lauri Hintsala <lauri.hintsala@bluegiga.com>
> ---
>  .../initscripts/initscripts-1.0/bootmisc.sh        |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> index 03fd67c..6d68b35 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> @@ -62,16 +62,16 @@ then
>  fi
>  
>  # Set the system clock from hardware clock
> -# If the timestamp is 1 day or more recent than the current time,
> +# If the timestamp is more recent than the current time,
>  # use the timestamp instead.
>  /etc/init.d/hwclock.sh start
>  if test -e /etc/timestamp
>  then
> -	SYSTEMDATE=`date  -u +%2m%2d%2H%2M%4Y`
> -	read TIMESTAMP < /etc/timestamp
> -        NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE + 10000 \)`
> -        if [ $NEEDUPDATE -eq 1 ]; then 
> -		date -u $TIMESTAMP
> +	SYSTEMDATE=`date -u +%4Y%2m%2d`
> +	TIMESTAMP=`cat /etc/timestamp | awk '{ print substr($0,9,4) substr($0,1,4); }'`
> +	NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE \)`
> +	if [ $NEEDUPDATE -eq 1 ]; then
> +		date -u `cat /etc/timestamp`
>  		/etc/init.d/hwclock.sh stop
>  	fi
>  fi


For reference, the code in the boot process is trying not to cause
fork/exec calls. This is why it does:

read TIMESTAMP < /etc/timestamp

since this is faster than forking to run cat. Could we fix this in a
different way to avoid the fork/execs?

I appreciate this is a small detail but over the whole boot process it
mounts up!

Cheers,

Richard



