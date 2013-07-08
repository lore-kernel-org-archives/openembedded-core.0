Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 259766A5A5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 19:22:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2013 12:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1021,1363158000"; d="scan'208";a="366678013"
Received: from unknown (HELO [10.255.13.85]) ([10.255.13.85])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2013 12:22:27 -0700
Message-ID: <51DB1173.3080804@linux.intel.com>
Date: Mon, 08 Jul 2013 12:22:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Noor, Ahsan" <noor_ahsan@mentor.com>
References: <1373033018-20615-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1373033018-20615-1-git-send-email-noor_ahsan@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] lighttpd: Add systemd support.
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
X-List-Received-Date: Mon, 08 Jul 2013 19:22:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2013 07:03 AM, Noor, Ahsan wrote:
> From: Noor <noor_ahsan@mentor.com>
>
> * Enable lighttpd with systemd support.
> * Replace the hardcoded paths with sbindir, sysconfdir and base_bindir
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>   .../lighttpd/files/lighttpd.service                |   12 ++++++++++
>   meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |   24 ++++++++++++++++----
>   2 files changed, 32 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/lighttpd/files/lighttpd.service b/meta/recipes-extended/lighttpd/files/lighttpd.service
> new file mode 100644
> index 0000000..a5333b6
> --- /dev/null
> +++ b/meta/recipes-extended/lighttpd/files/lighttpd.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=Lightning Fast Webserver With Light System Requirements
> +After=network.target
> +
> +[Service]
> +ExecStartPre=/usr/sbin/lighttpd -t -f /etc/lighttpd.conf
> +ExecStart=/usr/sbin/lighttpd -D -f /etc/lighttpd.conf
> +ExecReload=/bin/kill -HUP $MAINPID
> +
> +[Install]
> +WantedBy=multi-user.target
> +
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> index df6ce97..3c03938 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> @@ -22,6 +22,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
>           file://index.html.lighttpd \
>           file://lighttpd.conf \
>           file://lighttpd \
> +        file://lighttpd.service \
>           "
>
>   SRC_URI[md5sum] = "8e2d4ae8e918d4de1aeb9842584d170b"
> @@ -39,19 +40,34 @@ EXTRA_OECONF = " \
>                --disable-static \
>   "
>
> -inherit autotools pkgconfig update-rc.d gettext
> +inherit autotools pkgconfig update-rc.d gettext systemd
>
>   INITSCRIPT_NAME = "lighttpd"
>   INITSCRIPT_PARAMS = "defaults 70"
>
> +SYSTEMD_SERVICE_${PN} = "lighttpd.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
> +
> +
>   do_install_append() {
> -    install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/dav ${D}/www/var
> -    install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
> +
> +    install -d ${D}${sysconfdir} ${D}/www/logs ${D}/www/pages/dav ${D}/www/var
>       install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
>       install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
> +    if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
I am not sure this is the best way as it may be possible to have both 
sysvinit and systemd in DISTRO_FEATURES.  I think it would be better to 
test for each individually and install based on that.

Sau!

> +        install -d ${D}${sysconfdir}/init.d
> +        install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
> +    else
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
> +        sed -i 's!/usr/sbin!${sbindir}!g' ${D}${systemd_unitdir}/system/lighttpd.service
> +        sed -i 's!/etc!${sysconfdir}!g' ${D}${systemd_unitdir}/system/lighttpd.service
> +        sed -i 's!/bin!${base_bindir}!g' ${D}${systemd_unitdir}/system/lighttpd.service
> +    fi
> +
>   }
>
> -FILES_${PN} += "${sysconfdir} /www"
> +FILES_${PN} += "${sysconfdir} /www ${systemd_unitdir}"
>
>   CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
>
>

