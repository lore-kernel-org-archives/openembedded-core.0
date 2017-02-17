Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 59280763F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 03:56:17 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id D2D1268A019; Fri, 17 Feb 2017 03:56:16 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 7783A68A019;
	Fri, 17 Feb 2017 03:56:14 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id CE9F26740361;
	Fri, 17 Feb 2017 04:56:13 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <20170216204750.21475-1-slemieux.tyco@gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <bf27f4f0-f8b3-07a8-c65b-1dc563a7f6c3@mlbassoc.com>
Date: Fri, 17 Feb 2017 04:56:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170216204750.21475-1-slemieux.tyco@gmail.com>
Subject: Re: [PATCH] busybox: setup "inetd" sub-package
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
X-List-Received-Date: Fri, 17 Feb 2017 03:56:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-02-16 21:47, Sylvain Lemieux wrote:
> From: Sylvain Lemieux <slemieux@tycoint.com>
>
> Setup "inetd" as a sub-package in "busybox" and
> add the support to install "inetd" as a startup script.
>
> Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 39c2eef082..a26fa08ca8 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -21,7 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
>  # We don't want '-e MAKEFLAGS=' in EXTRA_OEMAKE
>  EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
>
> -PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
> +PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock ${PN}-inetd"
>
>  FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
>  FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
> @@ -29,8 +29,9 @@ FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfd
>  FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
>  FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
>  FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
> +FILES_${PN}-inetd = "${sysconfdir}/init.d/inetd.${BPN} ${sysconfdir}/inetd.conf"
>
> -INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
> +INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock ${PN}-inetd"
>
>  INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
>  INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
> @@ -38,6 +39,7 @@ INITSCRIPT_NAME_${PN}-mdev = "mdev"
>  INITSCRIPT_PARAMS_${PN}-mdev = "start 04 S ."
>  INITSCRIPT_NAME_${PN}-syslog = "syslog"
>  INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
> +INITSCRIPT_NAME_${PN}-inetd = "inetd.${BPN}"
>
>  SYSTEMD_PACKAGES = "${PN}-syslog"
>  SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
> @@ -45,7 +47,7 @@ SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
>  CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
>  CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
>
> -RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
> +RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc ${PN}-inetd"
>
>  inherit cml1 systemd update-rc.d ptest
>
>

Doesn't this patch conflict with your previous one adding the -cron sub-package?


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

