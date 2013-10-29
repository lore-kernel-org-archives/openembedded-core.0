Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A27E6CF40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 12:32:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9TCWvhX020607
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 05:32:57 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 29 Oct 2013 05:32:57 -0700
Message-ID: <526FAB30.9070600@windriver.com>
Date: Tue, 29 Oct 2013 20:33:52 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1380189657.git.Qi.Chen@windriver.com>
	<936abdfba1f8b3edf2f5dbfc6be803354798c4d2.1380189657.git.Qi.Chen@windriver.com>
In-Reply-To: <936abdfba1f8b3edf2f5dbfc6be803354798c4d2.1380189657.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH V2 1/1] sysvinit: fix missing of boot log
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
X-List-Received-Date: Tue, 29 Oct 2013 12:32:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

Any comment on this one?

Best Regards,
Chen Qi

On 09/26/2013 06:02 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Previously, our system had no boot log even if the bootlogd daemon was
> started correctly. The root cause is that the log file doesn't exist
> when starting the bootlogd.
>
> Add '-c' option to bootlogd so that it will create the boot log if
> it doesn't exist.
>
> Besides, we need to make sure that tmpfs has been mounted. Otherwise,
> the boot log will still be missing.
>
> [YOCTO #5273]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/sysvinit/sysvinit/bootlogd.init |    5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
> index 7b87827..3a10a3c 100755
> --- a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
> +++ b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
> @@ -42,14 +42,15 @@ esac
>   
>   case "$ACTION" in
>   	start)
> +		mount -a -t tmpfs 2>/dev/null
>   		echo -n "Starting $DESC: "
>   		if [ -d /proc/1/. ]
>   		then
>   			umask 027
>   			start-stop-daemon --start --quiet \
> -				--exec $DAEMON -- -r
> +				--exec $DAEMON -- -r -c
>   		else
> -			$DAEMON -r
> +			$DAEMON -r -c
>   		fi
>   		echo "$NAME."
>   		;;


