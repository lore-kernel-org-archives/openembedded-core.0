Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0E74A701E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 22:05:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2014 15:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="574322814"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2014 15:05:41 -0700
Message-ID: <53C6F735.2060208@linux.intel.com>
Date: Wed, 16 Jul 2014 15:05:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Ben Shelton <ben.shelton@ni.com>, openembedded-core@lists.openembedded.org
References: <cover.1405542432.git.ben.shelton@ni.com>
	<0ae4bf831ba9b0ffce4eeb6403da183a5e71a445.1405542432.git.ben.shelton@ni.com>
In-Reply-To: <0ae4bf831ba9b0ffce4eeb6403da183a5e71a445.1405542432.git.ben.shelton@ni.com>
Subject: Re: [PATCH 2/5] initscripts: save /etc/timestamp with seconds accuracy
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
X-List-Received-Date: Wed, 16 Jul 2014 22:05:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2014 01:59 PM, Ben Shelton wrote:
> From: Blair Elliott <blair.elliott@ni.com>
>
> Currently, /etc/timestamp is saved with minutes accuracy.  To increase
> the accuracy, modify the save-rtc.sh and bootmisc.sh scripts to save and
> read /etc/timestamp respectively with seconds accuracy.
>

We also initialize it in the image.bbclass, you may want to tweak that one.

Since we deal with readonly it's possible it won't get updated after the 
image creation.

Sau!

> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>   meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh | 5 +++--
>   meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh | 2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> index 5211824..ccc7f9f 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> @@ -66,10 +66,11 @@ fi
>   test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh start
>   if test -e /etc/timestamp
>   then
> -	SYSTEMDATE=`date -u +%4Y%2m%2d%2H%2M`
> +	SYSTEMDATE=`date -u +%4Y%2m%2d%2H%2M%2S`
>   	read TIMESTAMP < /etc/timestamp
>   	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
> -		date -u ${TIMESTAMP#????}${TIMESTAMP%????????}
> +		# format the timestamp as date expects it (2m2d2H2M4Y.2S)
> +		date -u ${TIMESTAMP:4:8}${TIMESTAMP:0:4}.${TIMESTAMP:(-2)}
>   		test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh stop
>   	fi
>   fi
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> index 1f804e2..b038fc5 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> @@ -10,4 +10,4 @@
>   ### END INIT INFO
>
>   # Update the timestamp
> -date -u +%4Y%2m%2d%2H%2M > /etc/timestamp
> +date -u +%4Y%2m%2d%2H%2M%2S > /etc/timestamp
>

