Subject: Re: [V2][PATCH] kea: add init scripts
To: openembedded-core@lists.openembedded.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Texas, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 85
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 15 Oct 2020 02:08:35 -0700
References: <20201015054831.24685-1-akuster808@gmail.com>
In-Reply-To: <20201015054831.24685-1-akuster808@gmail.com>
Message-ID: <4831.1602752915966532881@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2020 at 06:48 AM, akuster wrote:

>
> [ Yocto # 14074 ]
>=20
> Add init scripts for dhcp4,6 and ddns
>=20
> Signed-off-by: Armin kuster <akuster808@gmail.com>
>=20
> --
> V2]
>=20
> remove 'status' from usage
> add patch to fix ps -p in keactrl.in

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../kea/files/fix_pid_keactrl.patch           | 22 +++++++++
>  .../kea/files/kea-dhcp-ddns-server            | 46 ++++++++++++++++++
>  .../kea/files/kea-dhcp4-server                | 46 ++++++++++++++++++
>  .../kea/files/kea-dhcp6-server                | 47 +++++++++++++++++++
>  meta/recipes-connectivity/kea/kea_1.7.10.bb   | 14 +++++-
>  5 files changed, 174 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/kea/files/fix_pid_keactrl.=
patch
>  create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp-ddns-se=
rver
>  create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp4-server
>  create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp6-server
>=20
> diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
> b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
> new file mode 100644
> index 00000000000..eeeb89942bd
> --- /dev/null
> +++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
> @@ -0,0 +1,22 @@
> +Busybox does not support ps -p so use pgrep
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
> +
> +Signed-off-by: Armin kuster <akuster808@gmail.com>
> +
> +Index: kea-1.7.10/src/bin/keactrl/keactrl.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- kea-1.7.10.orig/src/bin/keactrl/keactrl.in
> ++++ kea-1.7.10/src/bin/keactrl/keactrl.in
> +@@ -137,8 +137,8 @@ check_running() {
> +     # Get the PID from the PID file (if it exists)
> +     get_pid_from_file "${proc_name}"
> +     if [ ${_pid} -gt 0 ]; then
> +-        # Use ps to check if PID is alive
> +-        ps -p ${_pid} 1>/dev/null
> ++        # Use pgrep and grep to check if PID is alive
> ++        pgrep -v 1 | grep ${_pid} 1>/dev/null
> +         retcode=3D$?
> +         if [ $retcode -eq 0 ]; then
> +             # No error, so PID IS ALIVE
> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
> b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
> new file mode 100644
> index 00000000000..50fe40d4391
> --- /dev/null
> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
> @@ -0,0 +1,46 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:          kea-dhcp-ddns-server
> +# Required-Start:    $local_fs $network $remote_fs $syslog
> +# Required-Stop:     $local_fs $network $remote_fs $syslog
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: ISC KEA DHCP IPv6 Server
> +### END INIT INFO
> +
> +PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
> +DESC=3D"kea-dhcp-ddns-server"
> +NAME=3Dkea-dhcp-ddns
> +DAEMON=3D/usr/sbin/keactrl
> +DAEMON_ARGS=3D" -s dhcp_ddns"
> +
> +set -e
> +
> +# Exit if the package is not installed
> +[ -x "$DAEMON" ] || exit 0
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +case "$1" in
> +  start)
> +        echo -n "Starting $DESC: "
> +        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_AR=
GS
> +        echo "done."
> +        ;;
> +  stop)
> +        echo -n "Stopping $DESC: "
> +        kpid=3D`pidof $NAME`
> +        kill $kpid
> +        echo "done."
> +        ;;
> +  restart|force-reload)
> +        #
> +        $0 stop
> +        $0 start
> +        ;;
> +  *)
> +        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
> +        exit 1
> +        ;;
> +esac
> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4-server
> b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
> new file mode 100644
> index 00000000000..e83e51025d5
> --- /dev/null
> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
> @@ -0,0 +1,46 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:          kea-dhcp4-server
> +# Required-Start:    $local_fs $network $remote_fs $syslog
> +# Required-Stop:     $local_fs $network $remote_fs $syslog
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: ISC KEA DHCP IPv6 Server
> +### END INIT INFO
> +
> +PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
> +DESC=3D"kea-dhcp4-server"
> +NAME=3Dkea-dhcp4
> +DAEMON=3D/usr/sbin/keactrl
> +DAEMON_ARGS=3D" -s dhcp4"
> +
> +set -e
> +
> +# Exit if the package is not installed
> +[ -x "$DAEMON" ] || exit 0
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +case "$1" in
> +  start)
> +        echo -n "Starting $DESC: "
> +        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_AR=
GS
> +        echo "done."
> +        ;;
> +  stop)
> +        echo -n "Stopping $DESC: "
> +        kpid=3D`pidof $NAME`
> +        kill $kpid
> +        echo "done."
> +        ;;
> +  restart|force-reload)
> +        #
> +        $0 stop
> +        $0 start
> +        ;;
> +  *)
> +        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
> +        exit 1
> +        ;;
> +esac
> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6-server
> b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
> new file mode 100644
> index 00000000000..10f2d226412
> --- /dev/null
> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
> @@ -0,0 +1,47 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:          kea-dhcp6-server
> +# Required-Start:    $local_fs $network $remote_fs $syslog
> +# Required-Stop:     $local_fs $network $remote_fs $syslog
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: ISC KEA DHCP IPv6 Server
> +### END INIT INFO
> +
> +# PATH should only include /usr/* if it runs after the mountnfs.sh scri=
pt
> +PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
> +DESC=3D"kea-dhcp6-server"
> +NAME=3Dkea-dhcp6
> +DAEMON=3D/usr/sbin/keactrl
> +DAEMON_ARGS=3D" -s dhcp6"
> +
> +set -e
> +
> +# Exit if the package is not installed
> +[ -x "$DAEMON" ] || exit 0
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +case "$1" in
> +  start)
> +        echo -n "Starting $DESC: "
> +        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_AR=
GS
> +        echo "done."
> +        ;;
> +  stop)
> +        echo -n "Stopping $DESC: "
> +        kpid=3D`pidof $NAME`
> +        kill $kpid
> +        echo "done."
> +        ;;
> +  restart|force-reload)
> +        #
> +        $0 stop
> +        $0 start
> +        ;;
> +  *)
> +        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
> +        exit 1
> +        ;;
> +esac
> diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb
> b/meta/recipes-connectivity/kea/kea_1.7.10.bb
> index 2ea4b12758e..c9a5819e475 100644
> --- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
> +++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
> @@ -13,11 +13,18 @@ SRC_URI =3D "\
>      file://kea-dhcp4.service \
>      file://kea-dhcp6.service \
>      file://kea-dhcp-ddns.service \
> +    file://kea-dhcp4-server \
> +    file://kea-dhcp6-server \
> +    file://kea-dhcp-ddns-server \
>      file://fix-multilib-conflict.patch \
> +    file://fix_pid_keactrl.patch \
>  "
>  SRC_URI[sha256sum] =3D
> "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
>  
> -inherit autotools systemd
> +inherit autotools systemd update-rc.d
> +
> +INITSCRIPT_NAME =3D "kea-dhcp4-server"
> +INITSCRIPT_PARAMS =3D "defaults 30"
>  
>  SYSTEMD_SERVICE_${PN} =3D "kea-dhcp4.service kea-dhcp6.service
> kea-dhcp-ddns.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> @@ -44,8 +51,11 @@ do_configure_prepend() {
>  }
>  
>  do_install_append() {
> +    install -d ${D}${sysconfdir}/init.d
>      install -d ${D}${systemd_system_unitdir}
> +
>      install -m 0644 ${WORKDIR}/kea-dhcp*service ${D}${systemd_system_un=
itdir}
> +    install -m 0755 ${WORKDIR}/kea-*-server ${D}${sysconfdir}/init.d
>      sed -i -e 's,@SBINDIR@,${sbindir},g' -e
> 's,@BASE_BINDIR@,${base_bindir},g' \
>             -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e
> 's,@SYSCONFDIR@,${sysconfdir},g' \
>             ${D}${systemd_system_unitdir}/kea-dhcp*service
> ${D}${sbindir}/keactrl
> @@ -55,6 +65,8 @@ do_install_append() {
>      rm -rf "${D}${localstatedir}"
>  }
>  
> +CONFFILES_${PN} =3D "${sysconfdir}/kea/keactrl.conf"
> +
>  FILES_${PN}-staticdev +=3D "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a=
"
>  FILES_${PN} +=3D "${libdir}/hooks/*.so"
>  
> --=20
> 2.17.1
>=20
>
