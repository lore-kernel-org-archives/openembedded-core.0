Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4968B722C3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jan 2015 17:34:37 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 19so11814006ykq.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jan 2015 09:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=cDPYVDSABD7x9cLL6sWc2mbaTowdWq7mQJtGzuzMkKA=;
	b=JAe0SoLbwEuX2YrKglfPX5U4n5g8Xuy6BNSu/kfH5GeuCdTbGkTR3N4KU9LPdSgvJw
	6xH6QticA8GFsN88U2Hy6T8MiZGe37qtS9dAJNyYzAoRCM0LBUJJFOwO8OBnFy6d6/NS
	HiinbuTk18fGSw/gCkx74bxndZIlAEhzxk19lDe8Vf2eMHY6DlusQsIRQpzaotPgo3PO
	/PM4Vw+4N1OZUtiXicb2eTFRxLrhyJa98++yextQomy677HGw4KhaqhH7etQ5lq8RSvZ
	ZJTBw0Gm1vhWiTk8s/MLCHCZySav/79lx6rlDdBe1rbPtoUxkP3oZ6KyKrzMTduIQ7DP
	Vg4w==
MIME-Version: 1.0
X-Received: by 10.236.199.103 with SMTP id w67mr13333370yhn.37.1421516078022; 
	Sat, 17 Jan 2015 09:34:38 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Sat, 17 Jan 2015 09:34:37 -0800 (PST)
In-Reply-To: <1421444195-10330-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1421444195-10330-1-git-send-email-randy.e.witt@linux.intel.com>
Date: Sat, 17 Jan 2015 15:34:37 -0200
X-Google-Sender-Auth: 4clSiVqRpVvaFrOyGEoIrBwHJ4Y
Message-ID: <CAP9ODKqxAvmb8LoWkVzMYamJzpJa80pSeD6u1u2ftVRr2U0+8w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xorg: Always disable systemd-logind.
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
X-List-Received-Date: Sat, 17 Jan 2015 17:34:45 -0000
Content-Type: text/plain; charset=UTF-8

Hello Randy,

On Fri, Jan 16, 2015 at 7:36 PM, Randy Witt
<randy.e.witt@linux.intel.com> wrote:
> Without a dm to handle the session management systemd-logind can make it
> difficult for X to gain ownership of devices and behave properly.
>
> Since X seems to work without enabling systemd-logind, always disable it for
> now, and we can revisit it if we ever want to try to take advantage of
> multi-user sessions/seats.
>
> [Yocto # 7100]

I have with the default change but not in making it harder to be
experimented. See below...

> ---
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 5b47e34..6154295 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -114,10 +114,10 @@ EXTRA_OECONF += "--with-fop=no \
>                   --with-xkb-output=/var/lib/xkb \
>                   --with-sha1=libcrypto \
>                   ac_cv_file__usr_share_sgml_X11_defs_ent=no \
> +                 --disable-systemd-logind \
>  "

Drop.

> -PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> +PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)}"

Ok.

>  PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
>  PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86driproto"
> @@ -128,7 +128,6 @@ PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtua
>  PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
>  PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
>  PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
> -PACKAGECONFIG[systemd] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,dbus-lib"

Rename to logind

So someone wanting to enable it can use:

PACKAGECONFIG_append = " logind"

in a bbappend file.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

