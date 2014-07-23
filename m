Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C045162252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 15:42:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6NFg2eq008185; Wed, 23 Jul 2014 16:42:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hMWWi7Ybp7JB; Wed, 23 Jul 2014 16:42:02 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6NFfwbY008012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 23 Jul 2014 16:42:00 +0100
Message-ID: <1406130118.22985.124.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ben Shelton <ben.shelton@ni.com>
Date: Wed, 23 Jul 2014 16:41:58 +0100
In-Reply-To: <1406126945-10647-1-git-send-email-ben.shelton@ni.com>
References: <1406126945-10647-1-git-send-email-ben.shelton@ni.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] initscripts: fix bashism in bootmisc.sh
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
X-List-Received-Date: Wed, 23 Jul 2014 15:42:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-07-23 at 09:49 -0500, Ben Shelton wrote:
> In the commit 'initscripts: save /etc/timestamp with seconds accuracy',
> a bashism was introduced in the bootmisc.sh script in the code to set
> the current date from the stored value in /etc/timestamp.  This causes
> that operation to fail with the following message when /bin/sh is not
> bash:
> 
> /etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 73: syntax error: bad substitution
> 
> Fixed by using 'cut' (standard under POSIX) rather than bash-specific
> substring expansion.
> 
> [YOCTO #6566]
> 
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> Tested-by: Maxin B. John <maxin.john@enea.com>
> ---
>  meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> index ccc7f9f..923fa88 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> @@ -70,7 +70,10 @@ then
>  	read TIMESTAMP < /etc/timestamp
>  	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
>  		# format the timestamp as date expects it (2m2d2H2M4Y.2S)
> -		date -u ${TIMESTAMP:4:8}${TIMESTAMP:0:4}.${TIMESTAMP:(-2)}
> +		TS_YR=$(echo $TIMESTAMP | cut -c 1-4)
> +		TS_SEC=$(echo $TIMESTAMP | cut -c 13-14)
> +		TS_REST=$(echo $TIMESTAMP | cut -c 5-12)
> +		date -u ${TS_REST}${TS_YR}.${TS_SEC}
>  		test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh stop
>  	fi
>  fi

We have tried hard to remove exec/fork/subshell calls from the init
processes since each one does cost quite some time. The above introduces
more than I'm comfortable with. Can we find some other way to do this
please?

Cheers,

Richard


