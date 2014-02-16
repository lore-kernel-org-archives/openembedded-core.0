Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id BEC476E7D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 13:46:12 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id k10so4387774eaj.26
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 05:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:date:message-id:in-reply-to:references:user-agent
	:subject:mime-version:content-type:content-transfer-encoding;
	bh=1EYOZdxbIZPJ0ulza3VmXHtnU3dsD1nPWKzJK3i5qbI=;
	b=VZGvMu7RHgqpNu93gCbukCLCy4pVaUOguzjfTweWSXChASIW21dvls1Y1gmmKTh/v2
	C0a8Ls+/e4LAnPRYHCmakIFFyQW71S/ow1QIni5OiJ0oU4LC6Qxc4eEoURnyg6z7zvoP
	g9xXfKLVE1Dd0eSn1sxalNQAJEA9oh5CeVCy1gMgFi/lOR9z0eqRDW2rZXfCJjNQttwR
	ImUWcBxccKkWmNaCrWedJNSK6EhdfJ7Yviuyp8OhYcDx9cNg5voZHKE4w4OWMKeVpJ0s
	QV3uRlyM/C2VE7vq8Ar5YM0BhGf6azHCPgFOVNm0tnxtsVT42hyHmNvt2fubDYdRsVSi
	VU+w==
X-Received: by 10.14.251.66 with SMTP id a42mr230433ees.108.1392558373035;
	Sun, 16 Feb 2014 05:46:13 -0800 (PST)
Received: from [176.66.127.28] (176066127028.atmpu0052.highway.a1.net.
	[176.66.127.28]) by mx.google.com with ESMTPSA id
	k41sm44888364een.19.2014.02.16.05.46.10 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Feb 2014 05:46:12 -0800 (PST)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	<ross.burton@intel.com>
Date: Sun, 16 Feb 2014 14:46:12 +0100
Message-ID: <1443af26500.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <1392482043-28060-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1392482043-28060-1-git-send-email-alexandre.belloni@free-electrons.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.3.8 (build:
	2100414)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] matchbox-keyboard: daemonize launch
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
X-List-Received-Date: Sun, 16 Feb 2014 13:46:14 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 15 February 2014 17:34:57 Alexandre Belloni 
<alexandre.belloni@free-electrons.com> wrote:

> The .shbg extension is not properly supported by the Xsession script
> provided by xserver-common.
>
> Make the matchbox-keyboard startup script wait for matchbox desktop and
> start the matchbox-keyboard daemon in its own shell, in the background.

Maybe you could remove obsolescent test(1) usage while you touch it?

Also, why do you need another shell instance, out of curiosity. ISTM that 
only wastes RAM..
Thanks,
>
> See discussion here:
> https://lists.yoctoproject.org/pipermail/poky/2013-December/009463.html
>
> Bug here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5546
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>
> Changes since v1:
>  - stop using another script to start in the background and spawn a
>    background shell from the startup script
>
>  .../matchbox-keyboard/files/80matchboxkeyboard.sh  | 21 ++++++++++++++++++++
>  .../files/80matchboxkeyboard.shbg                  | 23 ----------------------
>  .../matchbox-keyboard/matchbox-keyboard_git.bb     |  4 ++--
>  3 files changed, 23 insertions(+), 25 deletions(-)
>  create mode 100755 
>  meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
>  delete mode 100755 
>  meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.shbg
>
> diff --git 
> a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh 
> b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
> new file mode 100755
> index 000000000000..d822efa6e70c
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
> +    if [ "$HAVE_KEYBOARD_PORTRAIT" = "1" -a "$HAVE_KEYBOARD_LANDSCAPE" = 
> "0" ]; then
> +        CMD="matchbox-keyboard -d -o landscape"
> +    elif [ "$HAVE_KEYBOARD_LANDSCAPE" = "1" -a "$HAVE_KEYBOARD_PORTRAIT" = 
> "0" ]; then
> +        CMD="matchbox-keyboard -d -o portrait"
> +    fi
> +fi
> +
> +if [ "$CMD" ]; then
> +    # Delay to make sure the window manager is active
> +    # by waiting for the desktop to say its finished loading
> +	( dbus-wait org.matchbox_project.desktop Loaded && $CMD ) &
> +fi
> diff --git 
> a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.shbg 
> b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.shbg
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
> -    if [ "$HAVE_KEYBOARD_PORTRAIT" = "1" -a "$HAVE_KEYBOARD_LANDSCAPE" = 
> "0" ]; then
> -        CMD="matchbox-keyboard -d -o landscape"
> -    elif [ "$HAVE_KEYBOARD_LANDSCAPE" = "1" -a "$HAVE_KEYBOARD_PORTRAIT" = 
> "0" ]; then
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
> diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb 
> b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
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
>  	install -d ${D}/${sysconfdir}/X11/Xsession.d/
> -	install -m 755 ${WORKDIR}/80matchboxkeyboard.shbg 
> ${D}/${sysconfdir}/X11/Xsession.d/
> +	install -m 755 ${WORKDIR}/80matchboxkeyboard.sh 
> ${D}/${sysconfdir}/X11/Xsession.d/
>
>  	rm -f ${D}${libdir}/gtk-2.0/*/immodules/*.la
>  	rm -f ${D}${libdir}/matchbox-panel/*.la
> --
> 1.8.3.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



Sent with AquaMail for Android
http://www.aqua-mail.com



