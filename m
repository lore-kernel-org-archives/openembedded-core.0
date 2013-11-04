Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id AB3D56D136
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 10:12:00 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VdH8b-00023K-JS from Muhammad_Shakeel@mentor.com ;
	Mon, 04 Nov 2013 02:12:01 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 4 Nov 2013 02:12:01 -0800
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Mon, 4 Nov 2013 10:11:59 +0000
Message-ID: <52777338.3050002@mentor.com>
Date: Mon, 4 Nov 2013 15:13:12 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <rongqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1383182088-17411-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1383182088-17411-1-git-send-email-rongqing.li@windriver.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 04 Nov 2013 10:12:01.0850 (UTC)
	FILETIME=[4DEAE1A0:01CED946]
Subject: Re: [PATCH v7] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Mon, 04 Nov 2013 10:12:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2013 06:14 AM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Create connman-evn.service, which will run a script to compute the networking
> device when nfs root is on, and pass the result to connman.service
>
> Copy Connmand.service from source code, add ExecStartPre into it to release
> do_configure_append work, use the options which is passed by connman-evn.service
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
> v7: sync with conman 1.19
>
>   meta/recipes-connectivity/connman/connman.inc      |   18 ++++++++------
>   .../connman/connman/connman-env.service            |   13 ++++++++++
>   .../connman/connman/connman.service                |   14 +++++++++++
>   .../connman/connman/connmand-env                   |   25 ++++++++++++++++++++
>   meta/recipes-connectivity/connman/connman_1.19.bb  |    3 +++
>   5 files changed, 66 insertions(+), 7 deletions(-)
>   create mode 100644 meta/recipes-connectivity/connman/connman/connman-env.service
>   create mode 100644 meta/recipes-connectivity/connman/connman/connman.service
>   create mode 100644 meta/recipes-connectivity/connman/connman/connmand-env
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 12f3edd..c2d71e0 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -64,15 +64,9 @@ python __anonymous () {
>   
>   SYSTEMD_SERVICE_${PN} = "connman.service"
>   SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
> -SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
>   
>   inherit autotools gtk-doc pkgconfig systemd update-rc.d
>   
> -do_configure_append () {
> -	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${S}/src/connman.service
> -
> -}
> -
>   # This allows *everyone* to access ConnMan over DBus, without any access
>   # control.  Really the at_console flag should work, which would mean that
>   # both this and the xuser patch can be dropped.
> @@ -88,6 +82,16 @@ do_install_append() {
>   		sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
>   	fi
>   
> +	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
This check is not required. systemd class will automaticall remove 
${systemd_unitdir} if 'systemd' is not in 'DISTRO_FEATURES'.
Check 'rm_systemd_unitdir' function in systemd.bbclass.
> +		install -m 0755 ${WORKDIR}/connmand-env ${D}${sbindir}/
> +		install -m 0644 ${WORKDIR}/connman-env.service  ${D}/${systemd_unitdir}/system/
> +		install -m 0644 ${WORKDIR}/connman.service  ${D}/${systemd_unitdir}/system/
> +		sed -i  -e 's,@SBINDIR@,${sbindir},g' \
> +			-e 's,@LIBDIR@,${libdir},g' \
> +			-e 's,@LOCALSTATEDIR@,${localstatedir},g' \
> +			${D}${systemd_unitdir}/system/*.service
> +	fi
> +
>   	install -d ${D}${bindir}
>   	install -m 0755 ${S}/tools/*-test ${D}${bindir}
>   	if [ -e ${S}/tools/wispr ]; then
> @@ -163,7 +167,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
>               ${libdir}/connman/plugins \
>               ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>               ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
> -            ${datadir}/dbus-1/system-services/*"
> +            ${datadir}/dbus-1/system-services/* ${systemd_unitdir}/system/connman-env.service"
I believe this is also handled by systemd.bbclass.
>   
>   FILES_${PN}-dbg += "${libdir}/connman/*/.debug"
>   
> diff --git a/meta/recipes-connectivity/connman/connman/connman-env.service b/meta/recipes-connectivity/connman/connman/connman-env.service
> new file mode 100644
> index 0000000..c4dc278
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/connman-env.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=Generate options for connection service
> +Before=connman.service
> +ConditionKernelCommandLine=root=/dev/nfs
> +After=syslog.target
> +
> +[Service]
> +Type=oneshot
> +ExecStart=@SBINDIR@/connmand-env
> +StandardOutput=null
> +
> +[Install]
> +WantedBy=connman.service
> diff --git a/meta/recipes-connectivity/connman/connman/connman.service b/meta/recipes-connectivity/connman/connman/connman.service
> new file mode 100644
> index 0000000..aa0e49a
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/connman.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Connection service
> +After=syslog.target
> +Wants=connman-env.service
> +
> +[Service]
> +Type=dbus
> +BusName=net.connman
> +EnvironmentFile=-@LOCALSTATEDIR@/run/connmand.env
> +ExecStartPre=-@LIBDIR@/connman/wired-setup
> +ExecStart=@SBINDIR@/connmand -n $CONNMAND_OPTS
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-connectivity/connman/connman/connmand-env b/meta/recipes-connectivity/connman/connman/connmand-env
> new file mode 100644
> index 0000000..feeb850
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/connmand-env
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +
> +EXTRA_PARAM=""
> +
> +NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
> +NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ :]*\).*$/\1/p'`
> +
> +if [ ! -z "$NET_ADDR" ]; then
> +    if [ "$NET_ADDR" = dhcp ]; then
> +        ethn=`ifconfig | grep "^eth" | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
> +        if [ ! -z "$ethn" ]; then
> +            EXTRA_PARAM="-I $ethn"
> +        fi
> +    else
> +        for i in $NET_DEVS; do
> +        ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
> +        if [ "$NET_ADDR" = "$ADDR" ]; then
> +            EXTRA_PARAM="-I $i"
> +            break
> +        fi
> +        done
> +    fi
> +fi
> +
> +echo "CONNMAND_OPTS=$EXTRA_PARAM">/run/connmand.env
> diff --git a/meta/recipes-connectivity/connman/connman_1.19.bb b/meta/recipes-connectivity/connman/connman_1.19.bb
> index c63dfe4..b775a41 100644
> --- a/meta/recipes-connectivity/connman/connman_1.19.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.19.bb
> @@ -4,6 +4,9 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>               file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
>               file://add_xuser_dbus_permission.patch \
>               file://connman \
> +            file://connmand-env \
> +            file://connman.service \
> +            file://connman-env.service \
>               "
>   
>   SRC_URI[md5sum] = "47cce1d17a693dc307e6796c81991bd0"


