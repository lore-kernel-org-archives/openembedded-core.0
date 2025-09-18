Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AECCA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 23:05:22 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.2690.1758236717755520801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 16:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hE+lw/1R;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-724b9ba77d5so16247107b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 16:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758236717; x=1758841517; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy9mfaLKdOaigdBHGeBzqWHJdLZVeFp288qzApmjCf8=;
        b=hE+lw/1RJVYPMHR1REDH54xLZGnDGeP9s5nDt9o0OHdzK7hXDLEgKypG/QhzJq53zz
         M+Uabv7Y5ptgY0+QzbiIsaeF3jag4o7CxRLlo+m5rqVsgWyFM3XwLtxL1eQWy6U5PEN8
         yr/HMkjzk3EhVBTquiA3HVCN48/ZeQ4lsPTtGKh9u3tywMe3W/u6tbQb0SjCpyE0elHA
         4mjvpvNaLnZPoVr7PmqKXQAH3MVo56P6Ge0HsKJjh2BgStfwcoDn8k+qtor5Em85Pn5H
         PIVXB9lpwALIysmxaSq8h67bLPdI/nsM/xRvyd9RTQRdPSAbmIUkv0vlb8q0cASgvdZz
         jOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758236717; x=1758841517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sy9mfaLKdOaigdBHGeBzqWHJdLZVeFp288qzApmjCf8=;
        b=ky6YjpKGvvG+tS1UbtampA5x7QKNbNdyML5gUIkLNnffbb3/IkjAHayZiasVplXf3Z
         j0ozs2PzzDs5wt+9ImDUSU8vYBa+tRm9eMiGjB1fL+6Q4MJgqq//kHNymFLcnOoBi9Ph
         7L4FV10Ti2MO3WuKUd8J4llo6XMeNUqqJ5V/sI7aRvlIUxxIsxJDMfBXwGWR0E4qrJ68
         y5hUzSK8HsIfRiSwTQ0cqws0edcecrryLugAGxa9b9B/Vtjee52KWxoXBfB6Fh75z7mF
         q6KgZTqSsy5pvve/zwMf2adn0zmO5gIr7FyRYoxF76RSjiszU574d2ToPgpTBSm5sQpw
         sCuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD2ITugu/fwlMVhZQSJ/mWSkRjXfBvfnJHmokY4/Fi5FhY9u+qLzoAaxdxHuvEmNWmvkQJtpII3zcg9jTycErSzQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyQwkj1Zt1r6JbXfh2oDt5MbzdyeFUh7dXT9JiHouvaV5V7bGdy
	ofeWKvHUGCN0gcMdm33uyZrKM567lue6+JkDT/TiNpG9tYyjjpLrzNFH4ZMbFXhbSGx3a2wbWtD
	jj7yL1mNH9tILLl0a46eS/mdsa2uiRdI=
X-Gm-Gg: ASbGncszjc51YXviFc+eK5fxoF5tqAsSv/+VgUPsYnZxq+Mr5fnMOhNaBC6nrAAS/Pf
	6yBmZ+59wTLcJWiBY3JQVMZxpoqcZ2dL7umSn3aiwyEfqVHlknFliqVTLsmWA5QoicVO2jfeR97
	/9s8wps3PQkfuoj8IpkawMx02L0FnrSMfDThp4u+hVPVVjcStdFO87bXL3kleeQOxGkdeLZfm31
	2ZcEruKF9/NbzTcxaVD0crskJ3qOmFnTJNKu6mY
X-Google-Smtp-Source: AGHT+IEnhXl3gEMvYxeLBmmTeNEYxV7/qrztKembhQQR71mPFXyPeo3SbPKfZ9Joqvt5VErjFJLqBEfjYpcR8PzEO+w=
X-Received: by 2002:a05:690c:7005:b0:722:7119:313e with SMTP id
 00721157ae682-73d3b0b7518mr11111487b3.31.1758236716618; Thu, 18 Sep 2025
 16:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250918213053.339280-2-rs@ti.com> <20250918213053.339280-6-rs@ti.com>
In-Reply-To: <20250918213053.339280-6-rs@ti.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 18 Sep 2025 17:05:05 -0600
X-Gm-Features: AS18NWD7gx6KAUqrcNp8g6h-US1asfUjvaYVKac2O4kz5hS-l0I5t7QFUIN7a48
Message-ID: <CAJdd5GYMWbO2DRWx9eP4jBad9EHNhv-GJeAh_o=aD73mjh-z4A@mail.gmail.com>
Subject: Re: [oe-core][PATCHv8 4/6] weston-init: convert to virtual-emptty-conf
To: rs@ti.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, richard.purdie@linuxfoundation.org, 
	ross.burton@arm.com, alex@linutronix.de, otavio@ossystems.com.br, 
	kexin.hao@windriver.com, afd@ti.com, detheridge@ti.com, denis@denix.org, 
	reatmon@ti.com, openembedded-core@lists.openembedded.org, vijayp@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 23:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223709

On Thu, Sep 18, 2025 at 3:31=E2=80=AFPM Randolph Sapp via
lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
>
> From: Randolph Sapp <rs@ti.com>
>
> Convert this script package into a simple config for emptty using the
> same weston user but leveraging the nopasswdlogin session provided by
> emptty. Runtime provide virtual-emptty-conf as we need to set parameters
> for the default session.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta/lib/oeqa/runtime/cases/weston.py         | 18 +++--
>  meta/recipes-graphics/wayland/weston-init.bb  | 61 +++------------
>  .../wayland/weston-init/emptty.conf           | 77 +++++++++++++++++++
>  .../recipes-graphics/wayland/weston-init/init | 54 -------------
>  .../wayland/weston-init/weston-autologin      | 11 ---
>  .../wayland/weston-init/weston-socket.sh      | 20 -----
>  .../wayland/weston-init/weston-start          | 76 ------------------
>  .../wayland/weston-init/weston.env            |  0
>  .../wayland/weston-init/weston.service        | 71 -----------------
>  .../wayland/weston-init/weston.socket         | 14 ----
>  10 files changed, 101 insertions(+), 301 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.conf
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-auto=
login
>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-sock=
et.sh
>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-star=
t
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.serv=
ice
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.sock=
et
>
> diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtim=
e/cases/weston.py
> index ee4d336482..69be1f65e3 100644
> --- a/meta/lib/oeqa/runtime/cases/weston.py
> +++ b/meta/lib/oeqa/runtime/cases/weston.py
> @@ -37,7 +37,7 @@ class WestonTest(OERuntimeTestCase):
>
>      def run_weston_init(self):
>          if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
> -            self.target.run('systemd-run --collect --unit=3Dweston-ptest=
.service --uid=3D0 -p PAMName=3Dlogin -p TTYPath=3D/dev/tty6 -E XDG_RUNTIME=
_DIR=3D/tmp -E WAYLAND_DISPLAY=3Dwayland-0 /usr/bin/weston --socket=3Dwayla=
nd-1 --log=3D%s' % self.weston_log_file)
> +            self.target.run(self.get_weston_command('systemd-run --colle=
ct --unit=3Dweston-ptest.service --uid=3D0 -p PAMName=3Dlogin -p TTYPath=3D=
/dev/tty6 -E XDG_RUNTIME_DIR -E WAYLAND_DISPLAY /usr/bin/weston --socket=3D=
wayland-2 --log=3D%s' % self.weston_log_file))
>          else:
>              self.target.run(self.get_weston_command('openvt -- weston --=
socket=3Dwayland-2 --log=3D%s' % self.weston_log_file))
>
> @@ -55,12 +55,18 @@ class WestonTest(OERuntimeTestCase):
>
>      @OEHasPackage(['wayland-utils'])
>      def test_wayland_info(self):
> -        if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
> -            command =3D 'XDG_RUNTIME_DIR=3D/run wayland-info'
> -        else:
> -            command =3D self.get_weston_command('wayland-info')
> +        command =3D self.get_weston_command('wayland-info')
>          status, output =3D self.target.run(command)
> -        self.assertEqual(status, 0, msg=3D'wayland-info error: %s' % out=
put)
> +        msg =3D 'wayland-info error: %s' % output
> +
> +        # dump last 20 lines of emptty log in case of failure
> +        log_cmd =3D 'tail -n 20 /var/log/emptty/7.log'
> +        msg +=3D '\n\n=3D=3D=3D=3D=3D start: snippet =3D=3D=3D=3D=3D\n\n=
'
> +        msg +=3D 'file: /var/log/emptty/7.log\n\n'
> +        msg +=3D '\n\n%s\n\n' % self.target.run(log_cmd)[1]
> +        msg +=3D '\n\n=3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D\n\n'
> +
> +        self.assertEqual(status, 0, msg=3Dmsg)
>
>      @OEHasPackage(['weston'])
>      def test_weston_can_initialize_new_wayland_compositor(self):
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-=
graphics/wayland/weston-init.bb
> index fc817d113f..6caf2a0387 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -1,17 +1,13 @@
> -SUMMARY =3D "Startup script and systemd unit file for the Weston Wayland=
 compositor"
> +SUMMARY =3D "Autologin package for the Weston Wayland compositor"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
>
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
> -SRC_URI =3D "file://init \
> -           file://weston.env \
> +SRC_URI =3D "\
>             file://weston.ini \
> -           file://weston.service \
> -           file://weston.socket \
> -           file://weston-socket.sh \
> -           file://weston-autologin \
> -           file://weston-start"
> +           file://emptty.conf \
> +"
>
>  S =3D "${UNPACKDIR}"
>
> @@ -27,32 +23,8 @@ DEFAULTBACKEND ??=3D ""
>  DEFAULTBACKEND:qemuall ?=3D "drm"
>
>  do_install() {
> -       # Install weston-start script
> -       if [ "${VIRTUAL-RUNTIME_init_manager}" !=3D "systemd" ]; then
> -               install -Dm755 ${S}/weston-start ${D}${bindir}/weston-sta=
rt
> -               sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-st=
art
> -               sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindi=
r}/weston-start
> -               install -Dm755 ${S}/init ${D}/${sysconfdir}/init.d/weston
> -               sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init=
.d/weston
> -       fi
> -
> -       # Install Weston systemd service
> -       if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false=
',d)}; then
> -               install -D -p -m0644 ${S}/weston.service ${D}${systemd_sy=
stem_unitdir}/weston.service
> -               install -D -p -m0644 ${S}/weston.socket ${D}${systemd_sys=
tem_unitdir}/weston.socket
> -               install -D -p -m0644 ${S}/weston-socket.sh ${D}${sysconfd=
ir}/profile.d/weston-socket.sh
> -               sed -i -e s:/etc:${sysconfdir}:g \
> -                       -e s:/usr/bin:${bindir}:g \
> -                       -e s:/var:${localstatedir}:g \
> -                       ${D}${systemd_system_unitdir}/weston.service
> -       fi
> -
> -       if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
> -               install -D -p -m0644 ${S}/weston-autologin ${D}${sysconfd=
ir}/pam.d/weston-autologin
> -       fi
> -
>         install -D -p -m0644 ${S}/weston.ini ${D}${sysconfdir}/xdg/weston=
/weston.ini
> -       install -Dm644 ${S}/weston.env ${D}${sysconfdir}/default/weston
> +       install -D -p -m0644 ${S}/emptty.conf ${D}${sysconfdir}/emptty/co=
nf
>
>         if [ -n "${DEFAULTBACKEND}" ]; then
>                 sed -i -e "/^\[core\]/a backend=3D${DEFAULTBACKEND}-backe=
nd.so" ${D}${sysconfdir}/xdg/weston/weston.ini
> @@ -73,9 +45,7 @@ do_install() {
>         install -dm 755 -o weston -g weston ${D}/home/weston
>  }
>
> -INHIBIT_UPDATERCD_BBCLASS =3D "${@oe.utils.conditional('VIRTUAL-RUNTIME_=
init_manager', 'systemd', '1', '', d)}"
> -
> -inherit update-rc.d systemd useradd
> +inherit useradd
>
>  USERADD_PACKAGES =3D "${PN}"
>
> @@ -83,23 +53,16 @@ USERADD_PACKAGES =3D "${PN}"
>  #
>  require ${THISDIR}/required-distro-features.inc
>
> -RDEPENDS:${PN} =3D "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xw=
ayland', 'weston-xwayland', '', d)}"
> -
> -INITSCRIPT_NAME =3D "weston"
> -INITSCRIPT_PARAMS =3D "start 9 5 2 . stop 20 0 1 6 ."
> +RDEPENDS:${PN} =3D "emptty weston kbd ${@bb.utils.contains('PACKAGECONFI=
G', 'xwayland', 'weston-xwayland', '', d)}"
>
>  FILES:${PN} +=3D "\
>      ${sysconfdir}/xdg/weston/weston.ini \
> -    ${sysconfdir}/profile.d/weston-socket.sh \
> -    ${systemd_system_unitdir}/weston.service \
> -    ${systemd_system_unitdir}/weston.socket \
> -    ${sysconfdir}/default/weston \
> -    ${sysconfdir}/pam.d/ \
> +    ${sysconfdir}/emptty/conf \
>      /home/weston \
>      "
>
> -CONFFILES:${PN} +=3D "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/=
default/weston"
> +CONFFILES:${PN} +=3D "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/=
emptty/conf"
> +RPROVIDES:${PN} +=3D "virtual-emptty-conf"
>
> -SYSTEMD_SERVICE:${PN} =3D "weston.service weston.socket"
> -USERADD_PARAM:${PN} =3D "--home /home/weston --shell /bin/sh --user-grou=
p -G video,input,render,seat,wayland weston"
> -GROUPADD_PARAM:${PN} =3D "-r wayland; -r render; -r seat"
> +USERADD_PARAM:${PN} =3D "--home /home/weston --shell /bin/sh --user-grou=
p -G video,input,render,seat,nopasswdlogin weston"
> +GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin; -r render; -r seat"
> diff --git a/meta/recipes-graphics/wayland/weston-init/emptty.conf b/meta=
/recipes-graphics/wayland/weston-init/emptty.conf
> new file mode 100644
> index 0000000000..1918cc02a7
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston-init/emptty.conf
> @@ -0,0 +1,77 @@
> +# TTY, where emptty will start.
> +TTY_NUMBER=3D7
> +
> +# Enables switching to defined TTY number.
> +SWITCH_TTY=3Dtrue
> +
> +# Enables printing of /etc/issue in daemon mode.
> +PRINT_ISSUE=3Dtrue
> +
> +# Enables printing of default motd, /etc/emptty/motd or /etc/emptty/motd=
-gen.sh.
> +PRINT_MOTD=3Dtrue
> +
> +# Preselected user, if AUTOLOGIN is enabled, this user is logged in.
> +DEFAULT_USER=3Dweston
> +
> +# Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogi=
n group. Possible values are "true" or "false".
> +AUTOLOGIN=3Dtrue
> +
> +# The default session used, if Autologin is enabled. If session is not f=
ound in list of session, it proceeds to manual selection.
> +AUTOLOGIN_SESSION=3DWeston
> +
> +# If Autologin is enabled and session does not start correctly, the numb=
er of retries in short period is kept to eventually stop the infinite loop =
of restarts. -1 is for infinite retries, 0 is for no retry.
> +# AUTOLOGIN_MAX_RETRY=3D2
> +
> +# Default LANG, if user does not have set own in init script.
> +#LANG=3Den_US.UTF-8
> +
> +# Starts desktop with calling "dbus-launch".
> +DBUS_LAUNCH=3Dtrue
> +
> +# Starts Xorg desktop with calling "~/.xinitrc" script, if is true, file=
 exists and selected WM/DE is Xorg session, it overrides DBUS_LAUNCH.
> +XINITRC_LAUNCH=3Dfalse
> +
> +# Prints available WM/DE each on new line instead of printing on single =
line.
> +VERTICAL_SELECTION=3Dfalse
> +
> +# Defines the way, how is logging handled. Possible values are "rotate",=
 "appending" or "disabled".
> +#LOGGING=3Drotate
> +
> +# Overrides path of log file
> +#LOGGING_FILE=3D/var/log/emptty/[TTY_NUMBER].log
> +
> +# Arguments passed to Xorg server.
> +#XORG_ARGS=3D
> +
> +# Allows to use dynamic motd script to generate custom MOTD.
> +#DYNAMIC_MOTD=3Dfalse
> +
> +# Allows to override default path to dynamic motd.
> +#DYNAMIC_MOTD_PATH=3D/etc/emptty/motd-gen.sh
> +
> +# Allows to override default path to static motd.
> +#MOTD_PATH=3D/etc/emptty/motd
> +
> +# Foreground color, available only in daemon mode.
> +#FG_COLOR=3DLIGHT_BLACK
> +
> +# Background color, available only in daemon mode.
> +#BG_COLOR=3DBLACK
> +
> +# Enables numlock in daemon mode. Possible values are "true" or "false".
> +#ENABLE_NUMLOCK=3Dfalse
> +
> +# Defines the way, how is logging of session errors handled. Possible va=
lues are "rotate", "appending" or "disabled".
> +SESSION_ERROR_LOGGING=3Drotate
> +
> +# Overrides path of session errors log file
> +#SESSION_ERROR_LOGGING_FILE=3D/var/log/emptty/session-errors.[TTY_NUMBER=
].log
> +
> +# If set true, it will not use `.emptty-xauth` file, but the standard `~=
/.Xauthority` file. This allows to handle xauth issues.
> +#DEFAULT_XAUTHORITY=3Dfalse
> +
> +#If set true, Xorg will be started as rootless, if system allows and emp=
tty is running in daemon mode.
> +#ROOTLESS_XORG=3Dfalse
> +
> +#If set true, environmental groups are printed to differ Xorg/Wayland/Cu=
stom/UserCustom desktops.
> +IDENTIFY_ENVS=3Dfalse
> diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipe=
s-graphics/wayland/weston-init/init
> deleted file mode 100644
> index a5c54e001e..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/init
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -#!/bin/sh
> -#
> -### BEGIN INIT INFO
> -# Provides: weston
> -# Required-Start: $local_fs $remote_fs
> -# Required-Stop: $local_fs $remote_fs
> -# Default-Start:     2 3 4 5
> -# Default-Stop:      0 1 6
> -### END INIT INFO
> -
> -if test -e /etc/default/weston ; then
> -        . /etc/default/weston
> -fi
> -
> -killproc() {
> -        pid=3D`/bin/pidof $1`
> -        [ "$pid" !=3D "" ] && kill $pid
> -}
> -
> -read CMDLINE < /proc/cmdline
> -for x in $CMDLINE; do
> -        case $x in
> -        weston=3Dfalse)
> -               echo "Weston disabled"
> -               exit 0;
> -                ;;
> -        esac
> -done
> -
> -case "$1" in
> -  start)
> -        . /etc/profile
> -             export HOME=3DROOTHOME
> -
> -        WESTON_USER=3Dweston weston-start $OPTARGS &
> -  ;;
> -
> -  stop)
> -        echo "Stopping Weston"
> -        killproc weston
> -  ;;
> -
> -  restart)
> -       $0 stop
> -        sleep 1
> -        $0 start
> -  ;;
> -
> -  *)
> -        echo "usage: $0 { start | stop | restart }"
> -  ;;
> -esac
> -
> -exit 0
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-autologin b=
/meta/recipes-graphics/wayland/weston-init/weston-autologin
> deleted file mode 100644
> index f6e6d106de..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/weston-autologin
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -auth      required  pam_nologin.so
> -auth      required  pam_unix.so     try_first_pass nullok
> -
> -account   required  pam_nologin.so
> -account   required  pam_unix.so
> -
> -session   required  pam_env.so
> -session   required  pam_unix.so
> --session  optional  pam_systemd.so type=3Dwayland class=3Duser desktop=
=3Dweston
> --session  optional  pam_loginuid.so
> -
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-socket.sh b=
/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
> deleted file mode 100755
> index 86389d63a3..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/bin/sh
> -
> -# set weston variables for use with global weston socket
> -global_socket=3D"/run/wayland-0"
> -if [ -e "$global_socket" ]; then
> -       weston_group=3D$(stat -c "%G" "$global_socket")
> -       if [ "$(id -u)" =3D "0" ]; then
> -               export WAYLAND_DISPLAY=3D"$global_socket"
> -       else
> -               case "$(groups "$USER")" in
> -                       *"$weston_group"*)
> -                               export WAYLAND_DISPLAY=3D"$global_socket"
> -                               ;;
> -                       *)
> -                               ;;
> -               esac
> -       fi
> -       unset weston_group
> -fi
> -unset global_socket
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/met=
a/recipes-graphics/wayland/weston-init/weston-start
> deleted file mode 100755
> index 3b13a0047a..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/weston-start
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -#!/bin/sh
> -# Copyright (C) 2016 O.S. Systems Software LTDA.
> -# Copyright (C) 2016 Freescale Semiconductor
> -
> -export PATH=3D"/sbin:/usr/sbin:/bin:/usr/bin"
> -
> -usage() {
> -       cat <<EOF
> -       $0 [<weston options>]
> -EOF
> -}
> -
> -## Module support
> -modules_dir=3D@DATADIR@/weston-start
> -
> -# Add weston extra argument
> -add_weston_argument() {
> -       weston_args=3D"$weston_args $1"
> -}
> -
> -## Add module to --modules argument
> -add_weston_module() {
> -       if [[ "x${weston_modules}" =3D=3D "x" ]]; then
> -               weston_modules=3D"--modules "
> -       fi;
> -       weston_modules+=3D"${1},"
> -}
> -
> -if [ -n "$WAYLAND_DISPLAY" ]; then
> -       echo "ERROR: A Wayland compositor is already running, nested West=
on instance is not supported yet."
> -       exit 1
> -fi
> -
> -if [ -n "$WESTON_USER" ]; then
> -       if [ -z "$WESTON_GROUP" ]; then
> -               # no explicit WESTON_GROUP given, therefore use WESTON_US=
ER
> -               export WESTON_GROUP=3D"${WESTON_USER}"
> -       fi
> -fi
> -
> -weston_args=3D$*
> -
> -# Load and run modules
> -if [ -d "$modules_dir" ]; then
> -       for m in "$modules_dir"/*; do
> -               # Skip backup files
> -               if [ "`echo $m | sed -e 's/\~$//'`" !=3D "$m" ]; then
> -                       continue
> -               fi
> -
> -               # process module
> -               . $m
> -               if [[ x"{$weston_modules}" !=3D "x" ]]; then
> -                       add_weston_argument "${weston_modules}"
> -               fi;
> -       done
> -fi
> -
> -if test -z "$XDG_RUNTIME_DIR"; then
> -       export XDG_RUNTIME_DIR=3D/run/user/`id -u ${WESTON_USER}`
> -       if test -d "$XDG_RUNTIME_DIR"; then
> -           # Check permissions on existing directory
> -           if [ "$(stat -c %u-%a "$XDG_RUNTIME_DIR")" !=3D "$(id -u ${WE=
STON_USER})-700" ]; then
> -                       echo "ERROR: $XDG_RUNTIME_DIR has incorrect permi=
ssions"
> -                       exit 1
> -               fi
> -       else
> -               mkdir --mode 0700 --parents $XDG_RUNTIME_DIR
> -               if [ -n "$WESTON_USER" ]
> -               then
> -                       chown $WESTON_USER:$WESTON_GROUP $XDG_RUNTIME_DIR
> -               fi
> -       fi
> -fi
> -
> -su -c "XDG_RUNTIME_DIR=3D$XDG_RUNTIME_DIR weston $weston_args --log=3D/t=
mp/weston.log" $WESTON_USER
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.env b/meta/=
recipes-graphics/wayland/weston-init/weston.env
> deleted file mode 100644
> index e69de29bb2..0000000000
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/m=
eta/recipes-graphics/wayland/weston-init/weston.service
> deleted file mode 100644
> index 80745998ed..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/weston.service
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -# This is a system unit for launching Weston with auto-login as the
> -# user configured here.
> -#
> -# Weston must be built with systemd support, and your weston.ini must lo=
ad
> -# the plugin systemd-notify.so.
> -[Unit]
> -Description=3DWeston, a Wayland compositor, as a system service
> -Documentation=3Dman:weston(1) man:weston.ini(5)
> -Documentation=3Dhttp://wayland.freedesktop.org/
> -
> -# Make sure we are started after logins are permitted.
> -Requires=3Dsystemd-user-sessions.service
> -After=3Dsystemd-user-sessions.service
> -
> -# If Plymouth is used, we want to start when it is on its way out.
> -After=3Dplymouth-quit-wait.service
> -
> -# D-Bus is necessary for contacting logind. Logind is required.
> -Wants=3Ddbus.socket
> -After=3Ddbus.socket
> -
> -# Ensure the socket is present
> -Requires=3Dweston.socket
> -
> -# Since we are part of the graphical session, make sure we are started b=
efore
> -# it is complete.
> -Before=3Dgraphical.target
> -
> -# Prevent starting on systems without virtual consoles, Weston requires =
one
> -# for now.
> -ConditionPathExists=3D/dev/tty0
> -
> -[Service]
> -# Requires systemd-notify.so Weston plugin.
> -Type=3Dnotify
> -EnvironmentFile=3D/etc/default/weston
> -ExecStart=3D/usr/bin/weston --modules=3Dsystemd-notify.so
> -
> -# Optional watchdog setup
> -#TimeoutStartSec=3D60
> -#WatchdogSec=3D20
> -
> -# The user to run Weston as.
> -User=3Dweston
> -Group=3Dweston
> -
> -# Make sure the working directory is the users home directory
> -WorkingDirectory=3D/home/weston
> -
> -# Set up a full user session for the user, required by Weston.
> -PAMName=3Dweston-autologin
> -
> -# A virtual terminal is needed.
> -TTYPath=3D/dev/tty7
> -TTYReset=3Dyes
> -TTYVHangup=3Dyes
> -TTYVTDisallocate=3Dyes
> -
> -# Fail to start if not controlling the tty.
> -StandardInput=3Dtty-fail
> -StandardOutput=3Djournal
> -StandardError=3Djournal
> -
> -# Log this user with utmp, letting it show up with commands 'w' and 'who=
'.
> -UtmpIdentifier=3Dtty7
> -UtmpMode=3Duser
> -
> -[Install]
> -# Note: If you only want weston to start on-demand, remove this line wit=
h a
> -# service drop file
> -WantedBy=3Dgraphical.target
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.socket b/me=
ta/recipes-graphics/wayland/weston-init/weston.socket
> deleted file mode 100644
> index c1bdc83c05..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/weston.socket
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -[Unit]
> -Description=3DWeston socket
> -RequiresMountsFor=3D/run
> -
> -[Socket]
> -ListenStream=3D/run/wayland-0
> -SocketMode=3D0775
> -SocketUser=3Dweston
> -SocketGroup=3Dwayland
> -RemoveOnStop=3Dyes
> -
> -[Install]
> -WantedBy=3Dsockets.target
> -

This socket unit allows applications to connect to the running weston
instance, or even have weston autostart on the first client
connection, which is a feature I don't think we'd want to loose. Is
there an alternative to this?

> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223689): https://lists.openembedded.org/g/openembedde=
d-core/message/223689
> Mute This Topic: https://lists.openembedded.org/mt/115318420/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

