Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A593860EB6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 08:24:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9H8OlmJ028880
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 01:24:47 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 17 Oct 2013 01:24:47 -0700
Message-ID: <525F9ECD.1040301@windriver.com>
Date: Thu, 17 Oct 2013 16:24:45 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <rongqing.li@windriver.com>
References: <1381997565-10172-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1381997565-10172-1-git-send-email-rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Thu, 17 Oct 2013 08:24:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Drop it, the commit header is wrong

On 10/17/2013 04:12 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Create connmand-nfs.service, which will run a script to ignore the
> networking device when root is nfs.
> Connmand-nfs.service will be run only when root is not nfs
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc      |   17 +++++---
>   .../connman/connman/connmand-nfs                   |   42 ++++++++++++++++++++
>   .../connman/connman/nfs-connman.service            |   15 +++++++
>   meta/recipes-connectivity/connman/connman_1.17.bb  |    2 +
>   4 files changed, 70 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-connectivity/connman/connman/connmand-nfs
>   create mode 100644 meta/recipes-connectivity/connman/connman/nfs-connman.service
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 37ce3ec..ebfef35 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -64,7 +64,7 @@ python __anonymous () {
>       d.setVar('SYSTEMD_PACKAGES', systemd_packages)
>   }
>
> -SYSTEMD_SERVICE_${PN} = "connman.service"
> +SYSTEMD_SERVICE_${PN} = "connman.service nfs-connman.service"
>   SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
>   SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
>
> @@ -84,10 +84,15 @@ do_compile_append() {
>   }
>
>   do_install_append() {
> -	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
> -		install -d ${D}${sysconfdir}/init.d
> -		install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
> -		sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
> +	sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
> +
> +	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +		install -m 0755 ${WORKDIR}/connmand-nfs ${D}${sbindir}/
> +		install -m 0644 ${WORKDIR}/nfs-connman.service  ${D}/${systemd_unitdir}/system/
> +		sed -i "3 i ConditionKernelCommandLine=!root=/dev/nfs" \
> +		${D}${systemd_unitdir}/system/connman.service
>   	fi
>
>   	install -d ${D}${bindir}
> @@ -165,7 +170,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
>               ${libdir}/connman/plugins \
>               ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>               ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
> -            ${datadir}/dbus-1/system-services/*"
> +            ${datadir}/dbus-1/system-services/* ${systemd_unitdir}/system/nfs-connman.service"
>
>   FILES_${PN}-dbg += "${libdir}/connman/*/.debug"
>
> diff --git a/meta/recipes-connectivity/connman/connman/connmand-nfs b/meta/recipes-connectivity/connman/connman/connmand-nfs
> new file mode 100644
> index 0000000..1058787
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/connmand-nfs
> @@ -0,0 +1,42 @@
> +#!/bin/sh
> +
> +nfsroot=0
> +
> +exec 9<&0 < /proc/mounts
> +while read dev mtpt fstype rest; do
> +	if test $mtpt = "/" ; then
> +		case $fstype in
> +		    nfs | nfs4)
> +			nfsroot=1
> +			break
> +			;;
> +		    *)
> +			;;
> +		esac
> +	fi
> +done
> +
> +EXTRA_PARAM=""
> +if test $nfsroot -eq 1 ; then
> +    NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
> +    NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ :]*\).*$/\1/p'`
> +
> +    if [ ! -z "$NET_ADDR" ]; then
> +	if [ "$NET_ADDR" = dhcp ]; then
> +	    ethn=`ifconfig | grep "^eth" | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
> +	    if [ ! -z "$ethn" ]; then
> +		EXTRA_PARAM="-I $ethn"
> +	    fi
> +	else
> +	    for i in $NET_DEVS; do
> +		ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
> +		if [ "$NET_ADDR" = "$ADDR" ]; then
> +		    EXTRA_PARAM="-I $i"
> +		    break
> +		fi
> +	    done
> +	fi
> +    fi
> +fi
> +
> +/usr/sbin/connmand -n $EXTRA_PARAM
> diff --git a/meta/recipes-connectivity/connman/connman/nfs-connman.service b/meta/recipes-connectivity/connman/connman/nfs-connman.service
> new file mode 100644
> index 0000000..1cb82b8
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/nfs-connman.service
> @@ -0,0 +1,15 @@
> +[Unit]
> +Description=Connection service when root is /dev/nfs
> +ConditionKernelCommandLine=root=/dev/nfs
> +After=syslog.target
> +
> +[Service]
> +Type=dbus
> +BusName=net.connman
> +Restart=on-failure
> +ExecStartPre=-/usr/lib64/connman/wired-setup
> +ExecStart=/bin/sh /usr/sbin/connmand-nfs
> +StandardOutput=null
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-connectivity/connman/connman_1.17.bb b/meta/recipes-connectivity/connman/connman_1.17.bb
> index 461157f..9e8112c 100644
> --- a/meta/recipes-connectivity/connman/connman_1.17.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.17.bb
> @@ -4,6 +4,8 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>               file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
>               file://add_xuser_dbus_permission.patch \
>               file://connman \
> +            file://connmand-nfs \
> +            file://nfs-connman.service \
>               "
>
>   SRC_URI[md5sum] = "dd4a13f789de1b69fcddf0cf613f2d5b"
>

-- 
Best Reagrds,
Roy | RongQing Li

