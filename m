Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RbGv3-0000Xn-Ie
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 20:24:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Dec 2011 11:17:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96643837"
Received: from unknown (HELO [10.255.12.229]) ([10.255.12.229])
	by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2011 11:17:28 -0800
Message-ID: <4EEA47C8.9030900@linux.intel.com>
Date: Thu, 15 Dec 2011 11:17:28 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>
	<1323844047-16390-1-git-send-email-lauri.hintsala@bluegiga.com>
In-Reply-To: <1323844047-16390-1-git-send-email-lauri.hintsala@bluegiga.com>
Subject: Re: [PATCH v3] initscripts: fix timestamp checking at bootmisc.sh
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
X-List-Received-Date: Thu, 15 Dec 2011 19:24:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2011 10:27 PM, Lauri Hintsala wrote:
> Timestamp checking has been broken by the commit
> 2078af333d704fd894a2dedbc19cef5775cdadbb. Currently the RTC time
> is always overwritten with the time from /etc/timestmap. Fix timestamp
> checking and clean the code.
>
> Signed-off-by: Lauri Hintsala<lauri.hintsala@bluegiga.com>
>
> ---
> changes since V2
> * reduce number of forks/execs
> ---
>   .../initscripts/initscripts-1.0/bootmisc.sh        |    7 +++----
>   1 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> index 03fd67c..ab18ad9 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> @@ -62,15 +62,14 @@ then
>   fi
>
>   # Set the system clock from hardware clock
> -# If the timestamp is 1 day or more recent than the current time,
> +# If the timestamp is more recent than the current time,
>   # use the timestamp instead.
>   /etc/init.d/hwclock.sh start
>   if test -e /etc/timestamp
>   then
> -	SYSTEMDATE=`date  -u +%2m%2d%2H%2M%4Y`
> +	SYSTEMDATE=`date -u +%4Y%2m%2d`
>   	read TIMESTAMP<  /etc/timestamp
> -        NEEDUPDATE=`expr \( $TIMESTAMP \>  $SYSTEMDATE + 10000 \)`
> -        if [ $NEEDUPDATE -eq 1 ]; then
> +	if [ ${TIMESTAMP#????????}${TIMESTAMP%????????} -gt $SYSTEMDATE ]; then
>   		date -u $TIMESTAMP
>   		/etc/init.d/hwclock.sh stop
>   	fi
Merged into OE-Core

Thanks
	Sau!


