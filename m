Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9abX-0004m9-Sh for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 12:46:16 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UAkw2h011356 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 11:46:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id z8zscTlrnS51
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 11:46:58 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8U9Npu9007405
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 10:24:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 10:17:25 +0100
In-Reply-To: <121b26267ee494182d88e07b7fe63761088b8bde.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
	<121b26267ee494182d88e07b7fe63761088b8bde.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317374312.12332.132.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 09/13] xserver-nodm-init: merge some changes from meta-oe
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
X-List-Received-Date: Fri, 30 Sep 2011 10:46:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 09:27 +0200, Martin Jansa wrote:
> * /etc/X11/Xusername handling should be moved to x11-common so the same
>   username and logic is used from initscript and when user starts it
>   from terminal
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../x11-common/xserver-nodm-init/xserver-nodm      |   30 ++++++--------------
>  1 files changed, 9 insertions(+), 21 deletions(-)
> 
> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> index c707a4b..9cd7904 100755
> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> @@ -8,10 +8,7 @@
>  # Default-Stop:      0 1 6
>  ### END INIT INFO
>  
> -killproc() {            # kill the named process(es)
> -        pid=`/bin/pidof $1`
> -        [ "$pid" != "" ] && kill $pid
> -}
> +. /etc/init.d/functions
>  
>  read CMDLINE < /proc/cmdline
>  for x in $CMDLINE; do
> @@ -25,25 +22,16 @@ done
>  
>  case "$1" in
>    start)
> +    # We don't want this script to block the rest of the boot process
> +    if [ "$2" != "background" ]; then
> +      $0 $1 background &
> +    else
>         . /etc/profile
> -       username=root
> +
>         echo "Starting Xserver"
> -       if [ -f /etc/X11/Xusername ]; then
> -           username=`cat /etc/X11/Xusername`
> -           # setting for rootless X
> -           chmod o+w /var/log
> -           chmod g+r /dev/tty[0-3]
> -           chmod o+rw /dev/input/*
> -           # hidraw device is probably needed
> -           if [ -e /dev/hidraw0 ]; then
> -               chmod o+rw /dev/hidraw*
> -           fi
> -       fi
> -       # Using su rather than sudo as latest 1.8.1 cause failure [YOCTO #1211]
> -       su -l -c '/etc/X11/Xserver&' $username 
> -       # Wait for the desktop to say its finished loading
> -       # before loading the rest of the system
> -       # dbus-wait org.matchbox_project.desktop Loaded
> +       . /etc/X11/xserver-common
> +       xinit /etc/X11/Xsession -- `which $XSERVER` $ARGS >/var/log/Xsession.log 2>&1
> +    fi 
>    ;;
>  
>    stop)

This is not "merge some changes from meta-oe", this is "overwrite
whatever is in oe-core with meta-oe" :(.

The above wipes out rootless X support.

I've noticed this theme in several of the patches where for example a
decent long DESCRIPTION and a separate short SUMMARY are replaced with a
single one line SUMMARY.

The fact you've done this means I'm going to have to go over every line
of changes in this and double check what is happening. Some of the
patches look ok but some like this are not.

Cheers,

Richard





