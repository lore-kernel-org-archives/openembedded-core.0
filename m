Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TeWPw-00051E-LP
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 20:38:33 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Nov 2012 11:24:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,192,1355126400"; d="scan'208";a="257291600"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.208])
	by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2012 11:24:12 -0800
Message-ID: <50B907DC.7020303@linux.intel.com>
Date: Fri, 30 Nov 2012 11:24:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Ming Liu <ming.liu@windriver.com>, "Chen, Qi" <Qi.Chen@windriver.com>
References: <1354270768-5265-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1354270768-5265-1-git-send-email-ming.liu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] initscripts/urandom: change random-seed directory
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
X-List-Received-Date: Fri, 30 Nov 2012 19:38:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/2012 02:19 AM, Ming Liu wrote:
> /etc/init.d/urandom fails to start/stop because it tries to save
> random-seed into /var/lib/urandom folder which does not exist in the
> file system.
>
Why not create it in the recipe's do_install?  Or possibly add it to 
volatiles file.

Also talk with Qi Chen about the readonly FS stuff to make sure this 
will work.

Sau!

> Fixed by using /var/lib/misc instead of /var/lib/urandom.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/recipes-core/initscripts/initscripts-1.0/urandom | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/urandom b/meta/recipes-core/initscripts/initscripts-1.0/urandom
> index eb3a7c3..1cf7c5c 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/urandom
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/urandom
> @@ -14,18 +14,19 @@
>   test -c /dev/urandom || exit 0
>   . /etc/default/rcS
>
> +SAVEDFILE=/var/lib/misc/random-seed
>   case "$1" in
>   	start|"")
>   		test "$VERBOSE" != no && echo "Initializing random number generator..."
>   		# Load and then save 512 bytes,
>   		# which is the size of the entropy pool
> -		if test -f /var/lib/urandom/random-seed
> +		if test -f $SAVEDFILE
>   		then
> -			cat /var/lib/urandom/random-seed >/dev/urandom
> +			cat $SAVEDFILE >/dev/urandom
>   		fi
> -		rm -f /var/lib/urandom/random-seed
> +		rm -f $SAVEDFILE
>   		umask 077
> -		dd if=/dev/urandom of=/var/lib/urandom/random-seed count=1 \
> +		dd if=/dev/urandom of=$SAVEDFILE count=1 \
>   			>/dev/null 2>&1 || echo "urandom start: failed."
>   		umask 022
>   		;;
> @@ -34,7 +35,7 @@ case "$1" in
>   		# see documentation in linux/drivers/char/random.c
>   		test "$VERBOSE" != no && echo "Saving random seed..."
>   		umask 077
> -		dd if=/dev/urandom of=/var/lib/urandom/random-seed count=1 \
> +		dd if=/dev/urandom of=$SAVEDFILE count=1 \
>   			>/dev/null 2>&1 || echo "urandom stop: failed."
>   		;;
>   	*)
>


