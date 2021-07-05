Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.15129.1625514122164460920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 12:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4D0EBE0003;
	Mon,  5 Jul 2021 19:41:59 +0000 (UTC)
Date: Mon, 5 Jul 2021 21:41:58 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Einar Gunnarsson <tolvupostur@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] update-rc.d: Fix enable/disable command
Message-ID: <YONghuqz1Glw3XQ7@piout.net>
References: <20210705070740.10780-1-tolvupostur@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210705070740.10780-1-tolvupostur@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

This was actually applied on saturday:
https://git.yoctoproject.org/cgit/cgit.cgi/update-rc.d/commit/?id=8636cf478d426b568c1be11dbd9346f67e03adac

On 05/07/2021 09:07:40+0200, Einar Gunnarsson wrote:
> $[] is a bashism and does not work on POSIX shells.
> 
> enable/disable on links numbered 08 and 09 gave the error:
> 'bash: 100-08: value too great for base (error token is "08")'
> Links numbered 91-99 created a single digit link.
> 
> Links numbered 91 or higher now create a double digit link
> with a leading zero.
> 
> Signed-off-by: Einar Gunnarsson <tolvupostur@gmail.com>
> ---
>  update-rc.d | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/update-rc.d b/update-rc.d
> index c9355d7..95d1c22 100644
> --- a/update-rc.d
> +++ b/update-rc.d
> @@ -114,7 +114,7 @@ renamelink()
>          # or stop link to start link with a sequence number equal to the difference of 100 minus the original sequence number.
>  	if ls ${etcd}${lev}.d/${oldstartstop}*${bn} >/dev/null 2>&1; then
>  		oldnn=`basename ${etcd}${lev}.d/${oldstartstop}*${bn}|cut -c2-3`
> -		newnn=$[100-$oldnn]
> +		newnn=$(printf "%02d" $((100-${oldnn#0})))
>  		[ $verbose -eq 1 ] && echo "rename ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} -> ${etcd}${lev}.d/${newstartstop}${newnn}${bn}"
>  		if [ $notreally -eq 0 ];then
>  			mv ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} ${etcd}${lev}.d/${newstartstop}${newnn}${bn}
> -- 
> 2.17.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
