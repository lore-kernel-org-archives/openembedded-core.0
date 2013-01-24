Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TyR0V-0005IU-Hc
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 18:54:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0OHd1Hf012954
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 09:39:01 -0800 (PST)
Received: from msp-dhcp30.wrs.com (172.25.34.30) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 24 Jan 2013 09:39:01 -0800
Message-ID: <510171B7.6050000@windriver.com>
Date: Thu, 24 Jan 2013 11:39:03 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<202617fa712665192de55285dc8ea3f4699315bc.1359014474.git.Qi.Chen@windriver.com>
In-Reply-To: <202617fa712665192de55285dc8ea3f4699315bc.1359014474.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 08/12] initscripts: let populate-volatile.sh create the /tmp link
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
X-List-Received-Date: Thu, 24 Jan 2013 17:54:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/24/13 2:16 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Previously, the /tmp link (/tmp -> /var/tmp) was created by the
> bootmisc.sh script. So in case of a read-only rootfs, this symlink
> would not be created correctly.
>
> The populate-volatile.sh script is intended to handle all directories
> and files related to volatile storage, so we should let it create
> the /tmp link.
>
> In addition, because of the improments of populate-volatile.sh, the data
> loss problem of bug#3404 is also resolved by this patch.
>
> [YOCTO #3406]
> [YOCTO #3404]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../initscripts/initscripts-1.0/bootmisc.sh        |    9 +--------
>   .../initscripts/initscripts-1.0/volatiles          |    1 +
>   2 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> index 4f76cb4..3b5a47f 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> @@ -54,14 +54,7 @@ fi
>
>   #
>   # This is as good a place as any for a sanity check
> -# /tmp should be a symlink to /var/tmp to cut down on the number
> -# of mounted ramdisks.
> -if test ! -L /tmp && test -d /var/tmp
> -then
> -	rm -rf /tmp
> -	ln -sf /var/tmp /tmp
> -fi
> -

I saw this the other day.  It seems like the wrong solution, if the expectation 
is that all systems want this linked behavior.  Instead the link should be 
configured in the meta/files/fs-perms.txt

Something like:

-/tmp                            01777   root    root    false - - -
+/tmp                            link    /var/tmp

Making that change would avoid this patch, and then all of the filesystems could 
inherit this behavior.  (Other distributions that don't want it can provide 
their own custom fs-perms.txt file, and simply set the older value, which will 
append to the default.)

> +#
>   # Set the system clock from hardware clock
>   # If the timestamp is more recent than the current time,
>   # use the timestamp instead.
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> index e0741aa..f7e2ef7 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> @@ -31,6 +31,7 @@ l root root 1777 /var/lock /var/volatile/lock
>   l root root 0755 /var/log /var/volatile/log
>   l root root 0755 /var/run /var/volatile/run
>   l root root 1777 /var/tmp /var/volatile/tmp
> +l root root 1777 /tmp /var/tmp
>   d root root 0755 /var/lock/subsys none
>   f root root 0664 /var/log/wtmp none
>   f root root 0664 /var/run/utmp none
>



