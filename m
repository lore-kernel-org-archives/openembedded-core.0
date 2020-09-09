Received: from mail.familie-heinold.de (mail.familie-heinold.de [85.214.48.103])
 by mx.groups.io with SMTP id smtpd.web12.7743.1599632617810219877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 23:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: itconsulting-heinold.de, ip: 85.214.48.103, mailfrom: henning@itconsulting-heinold.de)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 75E6D64368;
	Wed,  9 Sep 2020 08:23:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
Received: from mail.itconsulting-heinold.de (x4d0b6fe7.dyn.telefonica.de [77.11.111.231])
	by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Wed,  9 Sep 2020 08:23:34 +0200 (CEST)
Date: Wed, 9 Sep 2020 08:23:25 +0200
From: "Henning Heinold" <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>
Subject: Re: [OE-core] [PATCH] weston-init: Run drm udev rule after systemd multi-seat setup
Message-ID: <20200909062325.GA12119@mail.itconsulting-heinold.de>
References: <20200909061905.724541-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200909061905.724541-1-raj.khem@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2020 at 11:19:05PM -0700, Khem Raj wrote:
> Currently, weston when autolauched with systemd ends up with seat0
> related errors because its launched before seat0 is assigned. The udev
> rule to install the seat is called 72-seat-drm-pci-0000_00_02_0.rules
> which sorts after 71-weston-drm.rules, renaming it to
> 73-weston-drm.rules ensures the right sequence

Hi,

I can not see any renaming of 71-weston-drm.rules to 73-weston-drm.rules
in this patch.

Bye Henning

> 
> Fixes
> [05:16:09.357] logind: failed to get session seat
> [05:16:09.358] logind: cannot setup systemd-logind helper (-61), using legacy fallback
> 
> Also fixes weston ptests
> RESULTS - weston.WestonTest.test_weston_can_initialize_new_wayland_compositor: PASSED (8.58s)
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> ---
>  meta/recipes-graphics/wayland/weston-init.bb  |  8 ++-
>  .../wayland/weston-init/weston-autologin      | 11 +++
>  .../wayland/weston-init/weston@.service       | 69 ++++++++++++++++---
>  .../wayland/weston-init/weston@.socket        | 10 +++
>  4 files changed, 87 insertions(+), 11 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/weston-init/weston-autologin
>  create mode 100644 meta/recipes-graphics/wayland/weston-init/weston@.socket
> 
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
> index 40aa76295f..95d75556dc 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -8,7 +8,9 @@ SRC_URI = "file://init \
>             file://weston.env \
>             file://weston.ini \
>             file://weston@.service \
> +           file://weston@.socket \
>             file://71-weston-drm.rules \
> +           file://weston-autologin \
>             file://weston-start"
>  
>  S = "${WORKDIR}"
> @@ -20,6 +22,10 @@ do_install() {
>  
>  	# Install Weston systemd service and accompanying udev rule
>  	install -D -p -m0644 ${WORKDIR}/weston@.service ${D}${systemd_system_unitdir}/weston@.service
> +	install -D -p -m0644 ${WORKDIR}/weston@.socket ${D}${systemd_system_unitdir}/weston@.socket
> +        if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
> +		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
> +        fi
>  	sed -i -e s:/etc:${sysconfdir}:g \
>  		-e s:/usr/bin:${bindir}:g \
>  		-e s:/var:${localstatedir}:g \
> @@ -50,7 +56,7 @@ RDEPENDS_${PN} = "weston kbd"
>  INITSCRIPT_NAME = "weston"
>  INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
>  
> -FILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${systemd_system_unitdir}/weston@.service ${sysconfdir}/default/weston"
> +FILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${systemd_system_unitdir}/weston@.service ${systemd_system_unitdir}/weston@.socket ${sysconfdir}/default/weston ${sysconfdir}/pam.d/"
>  
>  CONFFILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
>  
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-autologin b/meta/recipes-graphics/wayland/weston-init/weston-autologin
> new file mode 100644
> index 0000000000..f6e6d106de
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston-init/weston-autologin
> @@ -0,0 +1,11 @@
> +auth      required  pam_nologin.so
> +auth      required  pam_unix.so     try_first_pass nullok
> +
> +account   required  pam_nologin.so
> +account   required  pam_unix.so
> +
> +session   required  pam_env.so
> +session   required  pam_unix.so
> +-session  optional  pam_systemd.so type=wayland class=user desktop=weston
> +-session  optional  pam_loginuid.so
> +
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service b/meta/recipes-graphics/wayland/weston-init/weston@.service
> index 39e193014a..0a1df15bdf 100644
> --- a/meta/recipes-graphics/wayland/weston-init/weston@.service
> +++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
> @@ -1,15 +1,64 @@
> +# This is a system unit for launching Weston with auto-login as the
> +# user configured here.
> +#
> +# Weston must be built with systemd support, and your weston.ini must load
> +# the plugin systemd-notify.so.
>  [Unit]
> -Description=Weston Wayland Compositor
> -RequiresMountsFor=/run
> -Conflicts=plymouth-quit.service
> -After=systemd-user-sessions.service plymouth-quit-wait.service
> +Description=Weston, a Wayland compositor, as a system service
> +Documentation=man:weston(1) man:weston.ini(5)
> +Documentation=http://wayland.freedesktop.org/
> +
> +# Make sure we are started after logins are permitted.
> +After=systemd-user-sessions.service
> +
> +# If Plymouth is used, we want to start when it is on its way out.
> +After=plymouth-quit-wait.service
> +
> +# D-Bus is necessary for contacting logind. Logind is required.
> +Wants=dbus.socket
> +After=dbus.socket
> +
> +# Since we are part of the graphical session, make sure we are started before
> +# it is complete.
> +Before=graphical.target
> +
> +# Prevent starting on systems without virtual consoles, Weston requires one
> +# for now.
> +ConditionPathExists=/dev/tty0
>  
>  [Service]
> -User=%i
> -PAMName=login
> -EnvironmentFile=-/etc/default/weston
> +# Requires systemd-notify.so Weston plugin.
> +Type=notify
> +ExecStart=/usr/bin/weston --modules=systemd-notify.so
> +
> +# Optional watchdog setup
> +TimeoutStartSec=60
> +WatchdogSec=20
> +
> +# The user to run Weston as.
> +User=%I
> +
> +# Make sure working directory is users home directory
> +WorkingDirectory=/home/%i
> +
> +# Set up a full user session for the user, required by Weston.
> +PAMName=weston-autologin
> +
> +# A virtual terminal is needed.
> +TTYPath=/dev/tty7
> +TTYReset=yes
> +TTYVHangup=yes
> +TTYVTDisallocate=yes
> +
> +# Fail to start if not controlling the tty.
> +StandardInput=tty-fail
> +StandardOutput=journal
>  StandardError=journal
> -PermissionsStartOnly=true
> -IgnoreSIGPIPE=no
>  
> -ExecStart=/usr/bin/weston-start -v -e -- $OPTARGS
> +# Log this user with utmp, letting it show up with commands 'w' and 'who'.
> +UtmpIdentifier=tty7
> +UtmpMode=user
> +
> +[Install]
> +WantedBy=graphical.target
> +DefaultInstance=tty7
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.socket b/meta/recipes-graphics/wayland/weston-init/weston@.socket
> new file mode 100644
> index 0000000000..f1790d74a8
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston-init/weston@.socket
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=Weston Wayland socket
> +After=user-runtime-dir@1000.service
> +
> +[Socket]
> +ListenStream=/run/user/1000/wayland-%I
> +
> +[Install]
> +WantedBy=sockets.target
> +
> -- 
> 2.28.0
> 

> 
