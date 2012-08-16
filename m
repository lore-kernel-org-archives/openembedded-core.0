Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T251c-0000JC-GU
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:42:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Aug 2012 11:30:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="181894550"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by azsmga001.ch.intel.com with ESMTP; 16 Aug 2012 11:30:33 -0700
Message-ID: <502D3C49.9080509@linux.intel.com>
Date: Thu, 16 Aug 2012 11:30:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344625241-15300-1-git-send-email-andy.ross@windriver.com>
In-Reply-To: <1344625241-15300-1-git-send-email-andy.ross@windriver.com>
Subject: Re: [PATCH] dbus: Fix pid file in dbus init script
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
X-List-Received-Date: Thu, 16 Aug 2012 18:42:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2012 12:00 PM, Andy Ross wrote:
> The PIDFILE (/var/run/dbus/pid) referenced by /etc/init.d/dbus-1 did
> not match the path (/var/run/messagebus.pid) configured in
> /etc/dbus-1/system.conf, so the initscript could start the daemon, but
> not stop it.  Also remove needless directory ownership logic
> (dbus-daemon drops its pid file as root before calling setuid).
>
> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> ---
>   meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init | 11 +++--------
>   meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init | 11 +++--------
>   2 files changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init b/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
> index 4abc4cb..17b58ed 100644
> --- a/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
> +++ b/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
> @@ -18,9 +18,8 @@ set -e
>
>   DAEMON=/usr/bin/dbus-daemon
>   NAME=dbus
> -DAEMONUSER=messagebus
> -PIDDIR=/var/run/dbus
> -PIDFILE=$PIDDIR/pid
> +DAEMONUSER=messagebus           # must match /etc/dbus-1/system.conf
> +PIDFILE=/var/run/messagebus.pid # must match /etc/dbus-1/system.conf
>   UUIDDIR=/var/lib/dbus
>   DESC="system message bus"
>   EVENTDIR=/etc/dbus-1/event.d
> @@ -38,11 +37,7 @@ test "$ENABLED" != "0" || exit 0
>
>   start_it_up()
>   {
> -  if [ ! -d $PIDDIR ]; then
> -    mkdir -p $PIDDIR
> -    chown $DAEMONUSER $PIDDIR
> -    chgrp $DAEMONUSER $PIDDIR
> -  fi
> +  mkdir -p "`dirname $PIDFILE`"
>     if [ -e $PIDFILE ]; then
>       PIDDIR=/proc/$(cat $PIDFILE)
>       if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" = "${DAEMON}" ]; then
> diff --git a/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init b/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
> index 4abc4cb..17b58ed 100644
> --- a/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
> +++ b/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
> @@ -18,9 +18,8 @@ set -e
>
>   DAEMON=/usr/bin/dbus-daemon
>   NAME=dbus
> -DAEMONUSER=messagebus
> -PIDDIR=/var/run/dbus
> -PIDFILE=$PIDDIR/pid
> +DAEMONUSER=messagebus           # must match /etc/dbus-1/system.conf
> +PIDFILE=/var/run/messagebus.pid # must match /etc/dbus-1/system.conf
>   UUIDDIR=/var/lib/dbus
>   DESC="system message bus"
>   EVENTDIR=/etc/dbus-1/event.d
> @@ -38,11 +37,7 @@ test "$ENABLED" != "0" || exit 0
>
>   start_it_up()
>   {
> -  if [ ! -d $PIDDIR ]; then
> -    mkdir -p $PIDDIR
> -    chown $DAEMONUSER $PIDDIR
> -    chgrp $DAEMONUSER $PIDDIR
> -  fi
> +  mkdir -p "`dirname $PIDFILE`"
>     if [ -e $PIDFILE ]; thenOn 08/10/2012 12:00 PM, Andy Ross wrote:> The PIDFILE (/var/run/dbus/pid) referenced by /etc/init.d/dbus-1 did
> not match the path (/var/run/messagebus.pid) configured in
> /etc/dbus-1/system.conf, so the initscript could start the daemon, but
> not stop it.  Also remove needless directory ownership logic
> (dbus-daemon drops its pid file as root before calling setuid).
>
> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> ---
>   meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init | 11 +++--------
>   meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init | 11 +++--------
>   2 files changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init b/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
> index 4abc4cb..17b58ed 100644
> --- a/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
> +++ b/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
> @@ -18,9 +18,8 @@ set -e
>
>   DAEMON=/usr/bin/dbus-daemon
>   NAME=dbus
> -DAEMONUSER=messagebus
> -PIDDIR=/var/run/dbus
> -PIDFILE=$PIDDIR/pid
> +DAEMONUSER=messagebus           # must match /etc/dbus-1/system.conf
> +PIDFILE=/var/run/messagebus.pid # must match /etc/dbus-1/system.conf
>   UUIDDIR=/var/lib/dbus
>   DESC="system message bus"
>   EVENTDIR=/etc/dbus-1/event.d
> @@ -38,11 +37,7 @@ test "$ENABLED" != "0" || exit 0
>
>   start_it_up()
>   {
> -  if [ ! -d $PIDDIR ]; then
> -    mkdir -p $PIDDIR
> -    chown $DAEMONUSER $PIDDIR
> -    chgrp $DAEMONUSER $PIDDIR
> -  fi
> +  mkdir -p "`dirname $PIDFILE`"
>     if [ -e $PIDFILE ]; then
>       PIDDIR=/proc/$(cat $PIDFILE)
>       if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" = "${DAEMON}" ]; then
> diff --git a/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init b/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
> index 4abc4cb..17b58ed 100644
> --- a/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
> +++ b/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
> @@ -18,9 +18,8 @@ set -e
>
>   DAEMON=/usr/bin/dbus-daemon
>   NAME=dbus
> -DAEMONUSER=messagebus
> -PIDDIR=/var/run/dbus
> -PIDFILE=$PIDDIR/pid
> +DAEMONUSER=messagebus           # must match /etc/dbus-1/system.conf
> +PIDFILE=/var/run/messagebus.pid # must match /etc/dbus-1/system.conf
>   UUIDDIR=/var/lib/dbus
>   DESC="system message bus"
>   EVENTDIR=/etc/dbus-1/event.d
> @@ -38,11 +37,7 @@ test "$ENABLED" != "0" || exit 0
>
>   start_it_up()
>   {
> -  if [ ! -d $PIDDIR ]; then
> -    mkdir -p $PIDDIR
> -    chown $DAEMONUSER $PIDDIR
> -    chgrp $DAEMONUSER $PIDDIR
> -  fi
> +  mkdir -p "`dirname $PIDFILE`"
>     if [ -e $PIDFILE ]; then
>       PIDDIR=/proc/$(cat $PIDFILE)
>       if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" = "${DAEMON}" ]; then
>
>       PIDDIR=/proc/$(cat $PIDFILE)
>       if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" = "${DAEMON}" ]; then
>

Merged into OE-Core

Thanks
	Sau!



