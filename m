Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 181376D1B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 00:55:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9N0tQoH027751
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Oct 2013 17:55:26 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 22 Oct 2013 17:55:25 -0700
Message-ID: <52671E7C.2000401@windriver.com>
Date: Wed, 23 Oct 2013 08:55:24 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>
References: <1382419018-10273-1-git-send-email-rongqing.li@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CA0FCC@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16CA0FCC@IRSMSX105.ger.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V6] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Wed, 23 Oct 2013 00:55:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/22/2013 10:29 PM, Iorga, Cristian wrote:
> Hello,
> On the first look, this looks like a lot of changes will go in...
> Maybe we should first integrate connman 1.19 and see how we can simplify network management?
>
> Regards,
> Cristian


I did not see how they can simplify it?

I see you are updating it to 1.19, if 1.19 can simplify this case, please
update ./meta/recipes-connectivity/connman/connman/connman to fix nfs root
firstly.


commit 29be8e79a200d33555d2887578975e33b8417795
Author: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Date:   Tue Sep 17 10:48:00 2013 +0300

     connman: Try to figure out NFS root interface if using DHCP

     The commit c73487302270a7c2d3bbbb191ce1dd63ee2016dc missed the case
     where the NFS is using DHCP.

     [YOCTO #5176]

     Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit 1838671b832015ae28c8c101e8b20afbbf4b3c98
Author: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Date:   Fri Sep 6 10:23:00 2013 +0300

     connman: Ignore the NFS root network interface in init script

     The connman init.d script tried to ignore all the network interfaces
     if NFS root is configured. We should only ignore the interface
     that is used by NFS root.

     [YOCTO #4587]

     Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


commit 771fb55d6b13a92e1b30fbc95fdb1c34ddec7ebe
Author: Dongxiao Xu <dongxiao.xu@intel.com>
Date:   Mon Oct 11 15:48:03 2010 +0800

     connman: Do not take over ethernet interface if target is boot by nfs

     Detect if target system is booting by nfs, connman will
     not take over the ethernet interface.

     This fixes [BUGID #364]

     Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>

-Roy


>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of rongqing.li@windriver.com
> Sent: Tuesday, October 22, 2013 8:17 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH V6] connman: ignore the networking device which nfs for rootfs is working on
>
> From: Roy Li <rongqing.li@windriver.com>
>
> Create connman-evn.service, which will run a script to compute the networking device when nfs root is on, and pass the result to connman.service
>
> Copy Connmand.service from source code, add ExecStartPre into it to release do_configure_append work, use the options which is passed by connman-evn.service
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc      |   18 ++++++++------
>   .../connman/connman/connman-env.service            |   13 ++++++++++
>   .../connman/connman/connman.service                |   14 +++++++++++
>   .../connman/connman/connmand-env                   |   25 ++++++++++++++++++++
>   meta/recipes-connectivity/connman/connman_1.18.bb  |    3 +++
>   5 files changed, 66 insertions(+), 7 deletions(-)  create mode 100644 meta/recipes-connectivity/connman/connman/connman-env.service
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
>   # This allows *everyone* to access ConnMan over DBus, without any access  # control.  Really the at_console flag should work, which would mean that  # both this and the xuser patch can be dropped.
> @@ -88,6 +82,16 @@ do_install_append() {
>   		sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
>   	fi
>
> +	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
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
> +Before=connman.service ConditionKernelCommandLine=root=/dev/nfs
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
> diff --git a/meta/recipes-connectivity/connman/connman_1.18.bb b/meta/recipes-connectivity/connman/connman_1.18.bb
> index 44a4a07..eee8116 100644
> --- a/meta/recipes-connectivity/connman/connman_1.18.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.18.bb
> @@ -4,6 +4,9 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>               file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
>               file://add_xuser_dbus_permission.patch \
>               file://connman \
> +            file://connmand-env \
> +            file://connman.service \
> +            file://connman-env.service \
>               "
>
>   SRC_URI[md5sum] = "7578ec8f0422d34f5a4ba51b605fe576"
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

-- 
Best Reagrds,
Roy | RongQing Li

