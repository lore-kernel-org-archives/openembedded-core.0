Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5506AD93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 16:20:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jun 2013 09:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,938,1363158000"; d="scan'208";a="360258736"
Received: from unknown (HELO helios.localnet) ([10.252.122.97])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jun 2013 09:19:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marc Ferland <ferlandm@sonatest.com>
Date: Tue, 25 Jun 2013 17:19:54 +0100
Message-ID: <24505754.0ImPQusv2K@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <1372174539-18297-1-git-send-email-ferlandm@sonatest.com>
References: <1372174539-18297-1-git-send-email-ferlandm@sonatest.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] lmsensors: fix fancontrol init script
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
X-List-Received-Date: Tue, 25 Jun 2013 16:20:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 25 June 2013 11:35:39 Marc Ferland wrote:
> Make the 'fancontrol stop' command work again by using the fancontrol
> pid file instead of matching the process by name. While at it, also do
> a bit of cleaning.
> 
> Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
> ---
>  meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
> b/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init index
> f179310..4433020 100644
> --- a/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
> +++ b/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
> @@ -1,4 +1,4 @@
> -#! /bin/sh
> +#!/bin/sh
>  ### BEGIN INIT INFO
>  # Provides:          fancontrol
>  # Required-Start:    $local_fs
> @@ -16,8 +16,7 @@ PATH=/sbin:/usr/sbin:/bin:/usr/bin
>  DESC="fan control daemon"
>  NAME="fancontrol"
>  FANCONTROL=`which $NAME`
> -
> -. /etc/init.d/functions || exit 1
> +PIDFILE="/var/run/fancontrol.pid"
> 
>  # Exit if the package is not installed
>  [ -x "$FANCONTROL" ] || exit 0
> @@ -25,12 +24,12 @@ FANCONTROL=`which $NAME`
>  case "$1" in
>      start)
>          echo -n "Starting $DESC: $NAME... "
> -        /sbin/start-stop-daemon -S -x $FANCONTROL -b -- $FANCONTROL_ARGS
> +        start-stop-daemon -S -p $PIDFILE -b -x $FANCONTROL
>          echo "done."
>          ;;
>      stop)
>          echo -n "Stopping $DESC: $NAME... "
> -        /sbin/start-stop-daemon -K -x $FANCONTROL
> +        start-stop-daemon -K -p $PIDFILE
>          echo "done."
>          ;;
>      restart)

This is a patch against meta-oe, so it needs to go to openembedded-
devel@lists.openembedded.org.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

