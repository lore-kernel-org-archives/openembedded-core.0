Received: from mail-we0-f182.google.com ([74.125.82.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UaB39-0008VX-M7
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 22:33:22 +0200
Received: by mail-we0-f182.google.com with SMTP id t60so2235433wes.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 13:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=/lxqHnRx1cfTlUnQHZ7pr2pxhNdo4NgfuxuoQ0uHDp0=;
	b=mf3EjFYiNBChHL9JvoBfhPfsDR5XbbN7GlARYLnVyyhyXy/nY41sOkEI+3FE2B1Gdn
	xo6fv+E2PBk+vRpQs8A2oaWBgpORCBMFwlXVDzMCMfGs2RoAdLqNBT07/ikhgXq9RRMf
	TBam+zCR68Iahleuhs0Crjokzhrk2prfLRpJOaeI/YuVdbtopnAHP7YphQaqCRIvUlPQ
	L6UUzDVKS7QO44eyDemwqX8tz7hs9oUAlRMc5KNlkjUhW4TyMz2IqDKuJu0VpRFhBlte
	/wKt1OYAxtyneLs5m3fa+bN4RrYiEd/CEUscNhG0gi6BglN/vP/A5Y7UuV//vyCXn62z
	REoQ==
MIME-Version: 1.0
X-Received: by 10.194.61.10 with SMTP id l10mr13331087wjr.32.1368044117097;
	Wed, 08 May 2013 13:15:17 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Wed, 8 May 2013 13:15:17 -0700 (PDT)
In-Reply-To: <1368042043-26561-1-git-send-email-raj.khem@gmail.com>
References: <1368042043-26561-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 8 May 2013 16:15:17 -0400
Message-ID: <CAHUNapRHnd=foj1PuaJZ5gZ-p4T-udHOZq30jOpAXDwQA4H+KA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Replace use of ifconfig with ip
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
X-List-Received-Date: Wed, 08 May 2013 20:33:22 -0000
X-List-Received-Date: Wed, 08 May 2013 20:33:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 8, 2013 at 3:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> ifconfig and its ilk (net-tools package) is deprecated in favour of iproute2 package
> and is now removed by many distro's e.g. Archlinux. So we replace ifconfig with ip utility
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  scripts/runqemu-gen-tapdevs | 6 +++---
>  scripts/runqemu-ifup        | 6 +++---
>  scripts/runqemu-internal    | 6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
> index f5be30a..d3b27be 100755
> --- a/scripts/runqemu-gen-tapdevs
> +++ b/scripts/runqemu-gen-tapdevs
> @@ -59,10 +59,10 @@ if [ ! -x "$RUNQEMU_IFUP" ]; then
>         exit 1
>  fi
>
> -IFCONFIG=`which ifconfig 2> /dev/null`
> +IFCONFIG=`which ip 2> /dev/null`
>  if [ -z "$IFCONFIG" ]; then

>         # Is it ever anywhere else?
> -       IFCONFIG=/sbin/ifconfig
> +       IFCONFIG=/sbin/ip

Is the "command" command a Bourne shell builtin? If so, using

    IFCONFIG=$(command -pv ip)

might be better? (same applies to the other, following instances)

>  fi
>  if [ ! -x "$IFCONFIG" ]; then
>         echo "$IFCONFIG cannot be executed"
> @@ -70,7 +70,7 @@ if [ ! -x "$IFCONFIG" ]; then
>  fi
>
>  # Ensure we start with a clean slate
> -for tap in `$IFCONFIG | grep ^tap | awk '{ print \$1 }' | sed s/://`; do
> +for tap in `$IFCONFIG link | grep tap | awk '{ print \$2 }' | sed s/://`; do
>         echo "Note: Destroying pre-existing tap interface $tap..."
>         $TUNCTL -d $tap
>  done
> diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
> index 0926faf..8948153 100755
> --- a/scripts/runqemu-ifup
> +++ b/scripts/runqemu-ifup
> @@ -70,10 +70,10 @@ if [ $STATUS -ne 0 ]; then
>         fi
>  fi
>
> -IFCONFIG=`which ifconfig 2> /dev/null`
> +IFCONFIG=`which ip 2> /dev/null`
>  if [ "x$IFCONFIG" = "x" ]; then
>         # better than nothing...
> -       IFCONFIG=/sbin/ifconfig
> +       IFCONFIG=/sbin/ip
>  fi
>  if [ ! -x "$IFCONFIG" ]; then
>         echo "$IFCONFIG cannot be executed"
> @@ -100,7 +100,7 @@ if [ ! -x "$IPTABLES" ]; then
>  fi
>
>  n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
> -$IFCONFIG $TAP 192.168.7.$n netmask 255.255.255.255
> +$IFCONFIG addr add 192.168.7.$n/32 dev $TAP
>
>  dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
>  $ROUTE add -host 192.168.7.$dest $TAP
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index f11706d..d295013 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -139,16 +139,16 @@ if [ ! -d "$LOCKDIR" ]; then
>      chmod 777 $LOCKDIR
>  fi
>
> -IFCONFIG=`which ifconfig 2> /dev/null`
> +IFCONFIG=`which ip 2> /dev/null`
>  if [ -z "$IFCONFIG" ]; then
> -    IFCONFIG=/sbin/ifconfig
> +    IFCONFIG=/sbin/ip
>  fi
>  if [ ! -x "$IFCONFIG" ]; then
>         echo "$IFCONFIG cannot be executed"
>         exit 1
>  fi
>
> -POSSIBLE=`$IFCONFIG -a | grep '^tap' | awk '{print $1}' | sed s/://`
> +POSSIBLE=`$IFCONFIG link | grep 'tap' | awk '{print $2}' | sed s/://`
>  TAP=""
>  LOCKFILE=""
>  for tap in $POSSIBLE; do

It does seem a little silly to continue to use a variable named
IFCONFIG now that you're switching away from "ifconfig" :-)


