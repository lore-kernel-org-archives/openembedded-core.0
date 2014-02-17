Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id C3A516E7BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 16:46:53 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id n7so24147186qcx.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 08:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bXzsXCoBxF4Nh2kPPo4YD6eqgfMUUX2mMkJJ9q9QA0Y=;
	b=FueHpqNxpd9Kow4TyThDsildIRw2J6imKIJ9cgeVdLF2Yu0ZwvWo70NUnUXMiSmqfL
	zyDudWNqOveA2ArjGSnJFosg8jamm/MHN6RnvIu0m8ghxjipgWJKhFE1Bl1ZKFnnaf5K
	BMYVhThh1vOuSXMMHaeMMHyiyAn3rzvNpagARwvSypeNgOfeqLC8t+6ktvXkik7Xs6o7
	C5AZ2f6C3LFeMeJV6Q5rt60iBQUIR0EIghPTgB3A1t7fMkl0aTvuNYNJUgi8txhlt0kb
	S6gafL+vUONUGwX7ZfcttV12qaWnvzq4IhDOMRt43huueXDQbN99Jdfsm/RtHyPx05FP
	uHtQ==
X-Gm-Message-State: ALoCoQlWhH93Zbfsxvfh9pL3nKxFWBWIg5NOOK5LUXPGnMUbkZpDFRI8aCj3d6O0L3SEw0L+GPTP
X-Received: by 10.224.43.144 with SMTP id w16mr3455232qae.93.1392655614565;
	Mon, 17 Feb 2014 08:46:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 17 Feb 2014 08:46:34 -0800 (PST)
In-Reply-To: <1392641399-8643-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1392641399-8643-1-git-send-email-alexandre.belloni@free-electrons.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Feb 2014 16:46:34 +0000
Message-ID: <CAJTo0LYmaVWXpwaqkDmLp-arQKHEEgpd8kewQfATM=Da0yLOZw@mail.gmail.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] matchbox-keyboard: daemonize launch
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
X-List-Received-Date: Mon, 17 Feb 2014 16:46:55 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Ross Burton <ross.burton@intel.com>

Ross

On 17 February 2014 12:49, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> The .shbg extension is not properly supported by the Xsession script
> provided by xserver-common.
>
> See discussion here:
> https://lists.yoctoproject.org/pipermail/poky/2013-December/009463.html
>
> Bug here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5546
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  .../matchbox-keyboard/files/80matchboxkeyboard.sh  | 21 ++++++++++++++++++++
>  .../files/80matchboxkeyboard.shbg                  | 23 ----------------------
>  .../matchbox-keyboard/matchbox-keyboard_git.bb     |  4 ++--
>  3 files changed, 23 insertions(+), 25 deletions(-)
>  create mode 100755 meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
>  delete mode 100755 meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.shbg
>
> diff --git a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
> new file mode 100755
> index 000000000000..6cf188b2d006
> --- /dev/null
> +++ b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
> @@ -0,0 +1,21 @@
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
> +    dbus-wait org.matchbox_project.desktop Loaded && $CMD &
> +fi
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
> diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
> index ffcabcad2215..70caf6fc0222 100644
> --- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
> +++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
> @@ -17,7 +17,7 @@ PR = "r4"
>  SRC_URI = "git://git.yoctoproject.org/${BPN} \
>             file://configure_fix.patch;maxrev=1819 \
>             file://single-instance.patch \
> -           file://80matchboxkeyboard.shbg \
> +           file://80matchboxkeyboard.sh \
>             file://png-fix.patch"
>
>  S = "${WORKDIR}/git"
> @@ -43,7 +43,7 @@ FILES_${PN}-applet = "${libdir}/matchbox-panel/*.so"
>
>  do_install_append () {
>         install -d ${D}/${sysconfdir}/X11/Xsession.d/
> -       install -m 755 ${WORKDIR}/80matchboxkeyboard.shbg ${D}/${sysconfdir}/X11/Xsession.d/
> +       install -m 755 ${WORKDIR}/80matchboxkeyboard.sh ${D}/${sysconfdir}/X11/Xsession.d/
>
>         rm -f ${D}${libdir}/gtk-2.0/*/immodules/*.la
>         rm -f ${D}${libdir}/matchbox-panel/*.la
> --
> 1.8.3.2
>

