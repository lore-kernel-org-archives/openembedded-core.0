Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 810AB65D71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 02:04:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3O24Wwl004436
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 19:04:33 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 23 Apr 2014 19:04:31 -0700
Message-ID: <53587170.4030908@windriver.com>
Date: Thu, 24 Apr 2014 10:05:36 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1398245851.git.Qi.Chen@windriver.com>
	<27724edd46c2e83992b3ef37af3b9863342d2968.1398245851.git.Qi.Chen@windriver.com>
In-Reply-To: <27724edd46c2e83992b3ef37af3b9863342d2968.1398245851.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 2/4] bind: add systemd support
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
X-List-Received-Date: Thu, 24 Apr 2014 02:04:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

In generate-rndc-key.sh, I should use `chmod' instead of `chown'.
Sorry for my mistake.
I'll send out a V2 for this patch.

//Chen Qi

On 04/23/2014 05:40 PM, Chen Qi wrote:
> Add systemd support for bind.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../bind/bind/generate-rndc-key.sh                 |    7 +++++++
>   meta/recipes-connectivity/bind/bind/named.service  |   22 ++++++++++++++++++++
>   meta/recipes-connectivity/bind/bind_9.9.5.bb       |   17 ++++++++++++++-
>   3 files changed, 45 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
>   create mode 100644 meta/recipes-connectivity/bind/bind/named.service
>
> diff --git a/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
> new file mode 100644
> index 0000000..c2e88bf
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +if [ ! -s /etc/bind/rndc.key ]; then
> +    echo -n "Generating /etc/bind/rndc.key:"
> +    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
> +    chown 0640 /etc/bind/rndc.key
> +fi
> diff --git a/meta/recipes-connectivity/bind/bind/named.service b/meta/recipes-connectivity/bind/bind/named.service
> new file mode 100644
> index 0000000..1792e41
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/named.service
> @@ -0,0 +1,22 @@
> +[Unit]
> +Description=Berkeley Internet Name Domain (DNS)
> +Wants=nss-lookup.target
> +Before=nss-lookup.target
> +After=network.target
> +
> +[Service]
> +Type=forking
> +EnvironmentFile=-/etc/sysconfig/named
> +PIDFile=/run/named/named.pid
> +
> +ExecStartPre=@SBINDIR@/generate-rndc-key.sh
> +ExecStart=@SBINDIR@/named $OPTIONS
> +
> +ExecReload=@BASE_BINDIR@/sh -c '@SBINDIR@/rndc reload > /dev/null 2>&1 || @BASE_BINDIR@/kill -HUP $MAINPID'
> +
> +ExecStop=@BASE_BINDIR@/sh -c '@SBINDIR@/rndc stop > /dev/null 2>&1 || @BASE_BINDIR@/kill -TERM $MAINPID'
> +
> +PrivateTmp=true
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
> index 604deb6..053c352 100644
> --- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
> @@ -13,6 +13,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>              file://make-etc-initd-bind-stop-work.patch \
>              file://mips1-not-support-opcode.diff \
>              file://dont-test-on-host.patch \
> +           file://generate-rndc-key.sh \
> +           file://named.service \
>   	   "
>   
>   SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
> @@ -27,11 +29,13 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
>                    --with-openssl=${STAGING_LIBDIR}/.. --with-libxml2=${STAGING_LIBDIR}/.. \
>                    --enable-exportlib --with-export-includedir=${includedir} --with-export-libdir=${libdir} \
>                  "
> -inherit autotools-brokensep update-rc.d
> +inherit autotools-brokensep update-rc.d systemd
>   
>   INITSCRIPT_NAME = "bind"
>   INITSCRIPT_PARAMS = "defaults"
>   
> +SYSTEMD_SERVICE_${PN} = "named.service"
> +
>   PARALLEL_MAKE = ""
>   
>   RDEPENDS_${PN} = "python-core"
> @@ -39,6 +43,7 @@ RDEPENDS_${PN} = "python-core"
>   PACKAGES_prepend = " ${PN}-utils "
>   FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
>   FILES_${PN}-dev += "${bindir}/isc-config.h"
> +FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
>   
>   do_install_append() {
>   	rm "${D}${bindir}/nslookup"
> @@ -50,6 +55,16 @@ do_install_append() {
>   	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>   	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
>   	sed -i -e '1s,#!.*python,#! /usr/bin/env python,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
> +
> +	# Install systemd related files
> +	install -d ${D}${localstatedir}/cache/bind
> +	install -d ${D}${sbindir}
> +	install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/named.service ${D}${systemd_unitdir}/system
> +	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> +	       -e 's,@SBINDIR@,${sbindir},g' \
> +	       ${D}${systemd_unitdir}/system/named.service
>   }
>   
>   CONFFILES_${PN} = " \


