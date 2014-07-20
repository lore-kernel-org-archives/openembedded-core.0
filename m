Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD52170199
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jul 2014 22:56:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6KMuOme019230; Sun, 20 Jul 2014 23:56:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IBghQidiEvrg; Sun, 20 Jul 2014 23:56:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6KMuKIZ019222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 20 Jul 2014 23:56:22 +0100
Message-ID: <1405896975.22985.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ben Shelton <ben.shelton@ni.com>
Date: Sun, 20 Jul 2014 23:56:15 +0100
In-Reply-To: <c417e9dd139050026787229778db277911302044.1405633546.git.ben.shelton@ni.com>
References: <cover.1405633546.git.ben.shelton@ni.com>
	<c417e9dd139050026787229778db277911302044.1405633546.git.ben.shelton@ni.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/6] initscripts: save /etc/timestamp with seconds accuracy
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
X-List-Received-Date: Sun, 20 Jul 2014 22:56:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-07-17 at 16:56 -0500, Ben Shelton wrote:
> From: Blair Elliott <blair.elliott@ni.com>
> 
> Currently, /etc/timestamp is saved with minutes accuracy.  To increase
> the accuracy, modify the save-rtc.sh and bootmisc.sh scripts to save and
> read /etc/timestamp respectively with seconds accuracy.
> 
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>  meta/classes/image.bbclass                                | 2 +-
>  meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh | 5 +++--
>  meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index a03b880..772c3ed 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -359,7 +359,7 @@ set_image_autologin () {
>  # Can be use to create /etc/timestamp during image construction to give a reasonably 
>  # sane default time setting
>  rootfs_update_timestamp () {
> -	date -u +%4Y%2m%2d%2H%2M >${IMAGE_ROOTFS}/etc/timestamp
> +	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
>  }
>  
>  # Prevent X from being started
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> index 5211824..ccc7f9f 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> @@ -66,10 +66,11 @@ fi
>  test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh start
>  if test -e /etc/timestamp
>  then
> -	SYSTEMDATE=`date -u +%4Y%2m%2d%2H%2M`
> +	SYSTEMDATE=`date -u +%4Y%2m%2d%2H%2M%2S`
>  	read TIMESTAMP < /etc/timestamp
>  	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
> -		date -u ${TIMESTAMP#????}${TIMESTAMP%????????}
> +		# format the timestamp as date expects it (2m2d2H2M4Y.2S)
> +		date -u ${TIMESTAMP:4:8}${TIMESTAMP:0:4}.${TIMESTAMP:(-2)}
>  		test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh stop
>  	fi
>  fi

The syntax above doesn't appear to work with busybox:

/etc/init.d/rc: /etc/rcS.d/S55bootmisc.sh: line 73: syntax error: bad substitution 

:(

Cheers,

Richard


