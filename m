Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3AF60CEB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 06:56:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2T6uaci018771
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 23:56:36 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 28 Mar 2014 23:56:36 -0700
Message-ID: <53366E97.2070807@windriver.com>
Date: Sat, 29 Mar 2014 14:56:23 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1395996041.git.hongxu.jia@windriver.com>
	<a2ac209bcc377adfdf62d90d7f3b09cec817d1cc.1395996041.git.hongxu.jia@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CE744CF@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1CE744CF@IRSMSX105.ger.corp.intel.com>
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 3/6] initscripts: Avoid restarting rpcbind daemon
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
X-List-Received-Date: Sat, 29 Mar 2014 06:56:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2014 12:52 AM, Iorga, Cristian wrote:
> Hi Hongxu,
> Does this change fix a bug or an inappropriate system behavior?

Yes, I got this fix from WindRiver Linux, here is the defect log:

1. From Boot logs:

Configuring network interfaces... ifup: interface lo already configured 
done.
Starting rpcbind daemon...done.
Starting rpcbind...Mounting remote filesystems...

2. From target:
  # ls -l /etc/rcS.d/S43rpcbind
lrwxrwxrwx 3 root root 17 Aug 28 07:57 /etc/rcS.d/S43rpcbind -> 
../init.d/rpcbind

3. But mountnfs also start rpcbind:
# ls -l  /etc/rcS.d/S45mountnfs.sh
lrwxrwxrwx 3 root root 21 Aug 28 07:57 /etc/rcS.d/S45mountnfs.sh -> 
../init.d/mountnfs.sh

from /etc/init.d/mountfs.sh

if test "$rpcbind" = yes
then
         if test -x /usr/sbin/rpcbind
         then
                 echo -n "Starting rpcbind..."
                 start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
                 sleep 2
         fi
fi

//Hongxu


> Thanks,
> Cristian Iorga
> YP
> Intel Corporation
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Hongxu Jia
> Sent: Friday, March 28, 2014 11:43 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Wold, Saul
> Subject: [OE-core] [PATCH 3/6] initscripts: Avoid restarting rpcbind daemon
>
> From: Yue Tao <Yue.Tao@windriver.com>
>
> Check whether rpcbind daemon already run before starting it.
>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
> index fe6c196..be9f597 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
> @@ -67,9 +67,12 @@ if test "$rpcbind" = yes  then
>   	if test -x /usr/sbin/rpcbind
>   	then
> -		echo -n "Starting rpcbind... "
> -		start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
> -		sleep 2
> +		service rpcbind status > /dev/null
> +		if [ $? != 0 ]; then
> +			echo -n "Starting rpcbind..."
> +			start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
> +			sleep 2
> +		fi
>   	fi
>   fi
>   
> --
> 1.8.1.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


