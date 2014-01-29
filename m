Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id 15E276E9A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:06:18 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 0BD02811; Wed, 29 Jan 2014 14:06:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 7A81C7BF;
	Wed, 29 Jan 2014 14:06:17 +0100 (CET)
Date: Wed, 29 Jan 2014 14:06:16 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140129130616.GF24156@piout.net>
References: <1389953343-19029-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1389953343-19029-1-git-send-email-alexandre.belloni@free-electrons.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] matchbox-keyboard: daemonize launch
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
X-List-Received-Date: Wed, 29 Jan 2014 13:06:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping ?

On Fri, Jan 17, 2014 at 11:09:03 +0100, Alexandre Belloni wrote :
> The .shbg extension is not properly supported by the Xsession script
> provided by xserver-common.
> 
> Move the main part of the Xsession.d script to a script in usr/bin then
> add a Xsession.d script to start it in the background.
> 
> See discussion here:
> https://lists.yoctoproject.org/pipermail/poky/2013-December/009463.html
> 
> Bug here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5546
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  .../matchbox-keyboard/files/80matchboxkeyboard.sh  |  3 +++
>  .../files/80matchboxkeyboard.shbg                  | 23 ----------------------
>  .../files/matchbox-keyboard-daemon.sh              | 22 +++++++++++++++++++++
>  .../matchbox-keyboard/matchbox-keyboard_git.bb     |  8 ++++++--
>  4 files changed, 31 insertions(+), 25 deletions(-)
>  create mode 100755 meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
>  delete mode 100755 meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.shbg
>  create mode 100755 meta/recipes-sato/matchbox-keyboard/files/matchbox-keyboard-daemon.sh
> 
> diff --git a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
> new file mode 100755
> index 000000000000..d10fd8c32c0e
> --- /dev/null
> +++ b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +/usr/bin/matchbox-keyboard-daemon.sh &
> diff --git a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.shbg b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.shbg
> deleted file mode 100755
> index 43c5d3ed6a32..000000000000
> --- a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.shbg
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -#!/bin/sh
> -
> -. /etc/formfactor/config
> -
> -CMD=""
> -
> -if [ "$HAVE_KEYBOARD" = "0" ]; then
> -    CMD="matchbox-keyboard -d"
> -elif [ "$DISPLAY_CAN_ROTATE" = "1" ]; then
> -    if [ "$HAVE_KEYBOARD_PORTRAIT" = "1" -a "$HAVE_KEYBOARD_LANDSCAPE" = "0" ]; then
> -        CMD="matchbox-keyboard -d -o landscape"
> -    elif [ "$HAVE_KEYBOARD_LANDSCAPE" = "1" -a "$HAVE_KEYBOARD_PORTRAIT" = "0" ]; then
> -        CMD="matchbox-keyboard -d -o portrait"
> -    fi
> -fi
> -					
> -
> -if [ "$CMD" ]; then
> -    # Delay to make sure the window manager is active
> -    # by waiting for the desktop to say its finished loading
> -    dbus-wait org.matchbox_project.desktop Loaded
> -    exec $CMD
> -fi
> diff --git a/meta/recipes-sato/matchbox-keyboard/files/matchbox-keyboard-daemon.sh b/meta/recipes-sato/matchbox-keyboard/files/matchbox-keyboard-daemon.sh
> new file mode 100755
> index 000000000000..2975cef7e38a
> --- /dev/null
> +++ b/meta/recipes-sato/matchbox-keyboard/files/matchbox-keyboard-daemon.sh
> @@ -0,0 +1,22 @@
> +#!/bin/sh
> +
> +. /etc/formfactor/config
> +
> +CMD=""
> +
> +if [ "$HAVE_KEYBOARD" = "0" ]; then
> +    CMD="matchbox-keyboard -d"
> +elif [ "$DISPLAY_CAN_ROTATE" = "1" ]; then
> +    if [ "$HAVE_KEYBOARD_PORTRAIT" = "1" -a "$HAVE_KEYBOARD_LANDSCAPE" = "0" ]; then
> +        CMD="matchbox-keyboard -d -o landscape"
> +    elif [ "$HAVE_KEYBOARD_LANDSCAPE" = "1" -a "$HAVE_KEYBOARD_PORTRAIT" = "0" ]; then
> +        CMD="matchbox-keyboard -d -o portrait"
> +    fi
> +fi
> +
> +if [ "$CMD" ]; then
> +    # Delay to make sure the window manager is active
> +    # by waiting for the desktop to say its finished loading
> +    dbus-wait org.matchbox_project.desktop Loaded
> +    exec $CMD
> +fi
> diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
> index 00a75af60eb0..66c89ad5da41 100644
> --- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
> +++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
> @@ -16,7 +16,8 @@ PR = "r4"
>  
>  SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1 \
>             file://single-instance.patch \
> -           file://80matchboxkeyboard.shbg"
> +           file://matchbox-keyboard-daemon.sh \
> +           file://80matchboxkeyboard.sh"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -41,7 +42,10 @@ FILES_${PN}-applet = "${libdir}/matchbox-panel/*.so"
>  
>  do_install_append () {
>  	install -d ${D}/${sysconfdir}/X11/Xsession.d/
> -	install -m 755 ${WORKDIR}/80matchboxkeyboard.shbg ${D}/${sysconfdir}/X11/Xsession.d/
> +	install -m 755 ${WORKDIR}/80matchboxkeyboard.sh ${D}/${sysconfdir}/X11/Xsession.d/
> +
> +	install -d ${D}${bindir}
> +	install -m 755 ${WORKDIR}/matchbox-keyboard-daemon.sh ${D}${bindir}/
>  
>  	rm -f ${D}${libdir}/gtk-2.0/*/immodules/*.la
>  	rm -f ${D}${libdir}/matchbox-panel/*.la
> -- 
> 1.8.3.2
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

