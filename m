Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7E6609C0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 19:00:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s75J0bSb008987
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Aug 2014 12:00:38 -0700 (PDT)
Received: from [128.224.56.84] (128.224.56.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 5 Aug 2014 12:00:37 -0700
Message-ID: <53E129D4.3050402@windriver.com>
Date: Tue, 5 Aug 2014 15:00:36 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Ben Shelton <ben.shelton@ni.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>
In-Reply-To: <78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>
X-Originating-IP: [128.224.56.84]
Subject: Re: [PATCH 01/20] udev-cache: Compress the cache
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
X-List-Received-Date: Tue, 05 Aug 2014 19:00:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-08-04 02:40 PM, Ben Shelton wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>
> $DEVCACHE is observed to be 100k uncompressed; compressing it reduces
> its size to ~5k.
>
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58620


This is a good series of patches; thanks for sending them.

It would be nice if you could remove your company's ID tags
from the commit log. For example, you create and use could use
a YP bugzilla ID ( https://bugzilla.yoctoproject.org/ ) and
then match that up in your internal process.

Thanks,
../Randy


> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
>   meta/recipes-core/udev/udev/init               | 2 +-
>   meta/recipes-core/udev/udev/udev-cache         | 2 +-
>   meta/recipes-core/udev/udev/udev-cache.default | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> index f2c84d5..1e69861 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -69,7 +69,7 @@ case "$1" in
>   		    readfiles /etc/udev/cache.data
>   		    OLDDATA="$READDATA"
>   		    if [ "$OLDDATA" = "$NEWDATA" ]; then
> -                            (cd /; tar xf $DEVCACHE > /dev/null 2>&1)
> +                            (cd /; tar xzf $DEVCACHE > /dev/null 2>&1)
>                               not_first_boot=1
>                               [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
>                               [ -e /dev/shm/udev.cache ] && rm -f /dev/shm/udev.cache
> diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
> index db5a513..3769062 100644
> --- a/meta/recipes-core/udev/udev/udev-cache
> +++ b/meta/recipes-core/udev/udev/udev-cache
> @@ -25,7 +25,7 @@ fi
>
>   if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
>   	echo "Populating dev cache"
> -	(cd /; tar cf "$DEVCACHE" dev)
> +	(cd /; tar czf "$DEVCACHE" dev)
>   	mv /dev/shm/udev.cache /etc/udev/cache.data
>   fi
>
> diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/udev/udev-cache.default
> index 2093336..909ec87 100644
> --- a/meta/recipes-core/udev/udev/udev-cache.default
> +++ b/meta/recipes-core/udev/udev/udev-cache.default
> @@ -1,5 +1,5 @@
>   # Default for /etc/init.d/udev
>
>   # Comment this out to disable device cache
> -DEVCACHE="/etc/dev.tar"
> +DEVCACHE="/etc/dev.tar.gz"
>   PROBE_PLATFORM_BUS="yes"
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

