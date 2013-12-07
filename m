Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE9F61634
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2013 06:55:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB76tDYp001869
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Dec 2013 22:55:13 -0800 (PST)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 6 Dec 2013 22:55:11 -0800
Message-ID: <52A2C656.4030008@windriver.com>
Date: Sat, 7 Dec 2013 14:55:18 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1384242441-27215-1-git-send-email-rongqing.li@windriver.com>
	<528C7216.9040501@windriver.com>
In-Reply-To: <528C7216.9040501@windriver.com>
Subject: Re: [PATCH v8] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Sat, 07 Dec 2013 06:55:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Could we merge this patch?

It does not satisfy everyone, but it fixes a bug,
and make nfs not hang when start the system which installs
systemd and connman


-Roy



On 11/20/2013 04:25 PM, Rongqing Li wrote:
> Ping
>
> On 11/12/2013 03:47 PM, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> Create connman-evn.service, which will run a script to compute the
>> networking
>> device when nfs root is on, and pass the result to connman.service
>>
>> Connmand.service add ExecStartPre into Connmand.service to release
>> do_configure_append work, use the options which is passed by
>> connman-evn.service
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   meta/recipes-connectivity/connman/connman.inc      |   17 +++++-----
>>   .../connman/connman/connman-env.service            |   13 ++++++++
>>   .../connman/connman/connmand-env                   |   26
>> +++++++++++++++
>>   ...ardcode-and-add-EnvironmentFile-and-Wants.patch |   33
>> ++++++++++++++++++++
>>   meta/recipes-connectivity/connman/connman_1.19.bb  |    3 ++
>>   5 files changed, 85 insertions(+), 7 deletions(-)
>>   create mode 100644
>> meta/recipes-connectivity/connman/connman/connman-env.service
>>   create mode 100644
>> meta/recipes-connectivity/connman/connman/connmand-env
>>   create mode 100644
>> meta/recipes-connectivity/connman/connman/replace-hardcode-and-add-EnvironmentFile-and-Wants.patch
>>
>>
>> diff --git a/meta/recipes-connectivity/connman/connman.inc
>> b/meta/recipes-connectivity/connman/connman.inc
>> index 12f3edd..648b9f6 100644
>> --- a/meta/recipes-connectivity/connman/connman.inc
>> +++ b/meta/recipes-connectivity/connman/connman.inc
>> @@ -64,15 +64,9 @@ python __anonymous () {
>>
>>   SYSTEMD_SERVICE_${PN} = "connman.service"
>>   SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
>> -SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
>>
>>   inherit autotools gtk-doc pkgconfig systemd update-rc.d
>>
>> -do_configure_append () {
>> -    sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#"
>> ${S}/src/connman.service
>> -
>> -}
>> -
>>   # This allows *everyone* to access ConnMan over DBus, without any
>> access
>>   # control.  Really the at_console flag should work, which would mean
>> that
>>   # both this and the xuser patch can be dropped.
>> @@ -88,6 +82,15 @@ do_install_append() {
>>           sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
>>       fi
>>
>> +    if
>> ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>> +        install -m 0755 ${WORKDIR}/connmand-env ${D}${sbindir}/
>> +        install -m 0644 ${WORKDIR}/connman-env.service
>> ${D}/${systemd_unitdir}/system/
>> +        sed -i  -e 's,@SBINDIR@,${sbindir},g' \
>> +            -e 's,@LIBDIR@,${libdir},g' \
>> +            -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
>> +            ${D}${systemd_unitdir}/system/*.service
>> +    fi
>> +
>>       install -d ${D}${bindir}
>>       install -m 0755 ${S}/tools/*-test ${D}${bindir}
>>       if [ -e ${S}/tools/wispr ]; then
>> @@ -163,7 +166,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/*
>> ${libexecdir}/* ${libdir}/lib*.so.* \
>>               ${libdir}/connman/plugins \
>>               ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>>               ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so*
>> ${datadir}/${PN} \
>> -            ${datadir}/dbus-1/system-services/*"
>> +            ${datadir}/dbus-1/system-services/*
>> ${systemd_unitdir}/system/connman-env.service"
>>
>>   FILES_${PN}-dbg += "${libdir}/connman/*/.debug"
>>
>> diff --git
>> a/meta/recipes-connectivity/connman/connman/connman-env.service
>> b/meta/recipes-connectivity/connman/connman/connman-env.service
>> new file mode 100644
>> index 0000000..c4dc278
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/connman/connman/connman-env.service
>> @@ -0,0 +1,13 @@
>> +[Unit]
>> +Description=Generate options for connection service
>> +Before=connman.service
>> +ConditionKernelCommandLine=root=/dev/nfs
>> +After=syslog.target
>> +
>> +[Service]
>> +Type=oneshot
>> +ExecStart=@SBINDIR@/connmand-env
>> +StandardOutput=null
>> +
>> +[Install]
>> +WantedBy=connman.service
>> diff --git a/meta/recipes-connectivity/connman/connman/connmand-env
>> b/meta/recipes-connectivity/connman/connman/connmand-env
>> new file mode 100644
>> index 0000000..9c04d61
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/connman/connman/connmand-env
>> @@ -0,0 +1,26 @@
>> +#!/bin/sh
>> +
>> +EXTRA_PARAM=""
>> +
>> +NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
>> +NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ :]*\).*$/\1/p'`
>> +
>> +if [ ! -z "$NET_ADDR" ]; then
>> +    if [ "$NET_ADDR" = dhcp ]; then
>> +        ethn=`ifconfig | grep "^eth" | sed -e
>> "s/\(eth[0-9]\)\(.*\)/\1/"`
>> +        if [ ! -z "$ethn" ]; then
>> +            EXTRA_PARAM="-I $ethn"
>> +        fi
>> +    else
>> +        for i in $NET_DEVS; do
>> +        ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet
>> \([0-9.]*\) .*$/\1/p'`
>> +        if [ "$NET_ADDR" = "$ADDR" ]; then
>> +            EXTRA_PARAM="-I $i"
>> +            break
>> +        fi
>> +        done
>> +    fi
>> +fi
>> +
>> +[ ! -d /run/connmand ] && mkdir -p /run/connmand
>> +echo "CONNMAND_OPTS=$EXTRA_PARAM">/run/connmand/connmand.env
>> diff --git
>> a/meta/recipes-connectivity/connman/connman/replace-hardcode-and-add-EnvironmentFile-and-Wants.patch
>> b/meta/recipes-connectivity/connman/connman/replace-hardcode-and-add-EnvironmentFile-and-Wants.patch
>>
>> new file mode 100644
>> index 0000000..1394335
>> --- /dev/null
>> +++
>> b/meta/recipes-connectivity/connman/connman/replace-hardcode-and-add-EnvironmentFile-and-Wants.patch
>>
>> @@ -0,0 +1,33 @@
>> +replace hardcode, and add EnvironmentFile and Wants
>> +
>> +Upstream-Status: Inappropriate [distribution]
>> +
>> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> +---
>> + src/connman.service.in |    5 ++++-
>> + 1 file changed, 4 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/src/connman.service.in b/src/connman.service.in
>> +index 2e9e4d5..9984519 100644
>> +--- a/src/connman.service.in
>> ++++ b/src/connman.service.in
>> +@@ -1,12 +1,15 @@
>> + [Unit]
>> + Description=Connection service
>> + After=syslog.target
>> ++Wants=connman-env.service
>> +
>> + [Service]
>> + Type=dbus
>> + BusName=net.connman
>> + Restart=on-failure
>> +-ExecStart=@prefix@/sbin/connmand -n
>> ++EnvironmentFile=-@LOCALSTATEDIR@/run/connmand/connmand.env
>> ++ExecStartPre=-@LIBDIR@/connman/wired-setup
>> ++ExecStart=@SBINDIR@/connmand -n $CONNMAND_OPTS
>> + StandardOutput=null
>> +
>> + [Install]
>> +--
>> +1.7.10.4
>> +
>> diff --git a/meta/recipes-connectivity/connman/connman_1.19.bb
>> b/meta/recipes-connectivity/connman/connman_1.19.bb
>> index c63dfe4..94bd8cc 100644
>> --- a/meta/recipes-connectivity/connman/connman_1.19.bb
>> +++ b/meta/recipes-connectivity/connman/connman_1.19.bb
>> @@ -4,6 +4,9 @@ SRC_URI  =
>> "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>>
>> file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
>>               file://add_xuser_dbus_permission.patch \
>>               file://connman \
>> +            file://connmand-env \
>> +
>> file://replace-hardcode-and-add-EnvironmentFile-and-Wants.patch \
>> +            file://connman-env.service \
>>               "
>>
>>   SRC_URI[md5sum] = "47cce1d17a693dc307e6796c81991bd0"
>>
>

-- 
Best Reagrds,
Roy | RongQing Li

