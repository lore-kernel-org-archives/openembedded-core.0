Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380A6C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 12:55:29 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.8641.1643892927262347448
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 04:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=Qsdk/rfs;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-002-205-233-038.002.205.pools.vodafone-ip.de [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 21EAB81F7E;
	Thu,  3 Feb 2022 13:55:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643892924;
	bh=onPe2I29HMIpHflvGgw4M0o36v3QFjf4lNJiEo0tHL4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qsdk/rfswa8U4qwBwGGXlBxu+iV7r2ZJd7bmv9MeiWmIUNgGnfH2GyI10LDRy3d8s
	 N2SKczTWrjuj75u/LIHwvhshDtm/1XULL4DXBePKyiiNYIQkqD8XiUrBFUlEvn12rt
	 uZGfx3S9NjVcC+ogE8QYx3IXocuXFdaKcSfzWO/1r2LuQLGq/DLf08ZW2kxfwIayLL
	 3wZC31sJWB30jrfBVMK6GijWoRj216ev7h8dr4f/uTSSjgHJuNjZSXPgSPOUhpp8Yw
	 Xqv2UKdMZR8sFTkYhrt479pOsxaem7FjZnQdkKEUb+PxYAKewAHAlWsJKq4Krk+Uto
	 GBhFST/mMpDNQ==
Message-ID: <8f129c19-a070-e1fe-d868-960fee2b77e6@denx.de>
Date: Thu, 3 Feb 2022 13:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH 01/33] seatd: add recipe
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 12:55:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161277

Hi Alexander,

On 2022-02-02 19:27, Alexander Kanavin wrote:
> This is needed to run weston properly as non-root in the absence
> of systemd-logind, and other compositors will likely require seatd
> as well.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/conf/distro/include/maintainers.inc |  1 +
>   meta/recipes-core/seatd/seatd/init       | 45 ++++++++++++++++++++++++
>   meta/recipes-core/seatd/seatd_0.6.3.bb   | 29 +++++++++++++++
>   3 files changed, 75 insertions(+)
>   create mode 100644 meta/recipes-core/seatd/seatd/init
>   create mode 100644 meta/recipes-core/seatd/seatd_0.6.3.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index ae25287c11..cb289a0eee 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -684,6 +684,7 @@ RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned <unassigned@yoctoproject.org>"
>   RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
>   RECIPE_MAINTAINER:pn-sbc = "Unassigned <unassigned@yoctoproject.org>"
>   RECIPE_MAINTAINER:pn-screen = "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-seatd = "Alexander Kanavin <alex.kanavin@gmail.com>"
>   RECIPE_MAINTAINER:pn-sed = "Chen Qi <Qi.Chen@windriver.com>"
>   RECIPE_MAINTAINER:pn-serf = "Anuj Mittal <anuj.mittal@intel.com>"
>   RECIPE_MAINTAINER:pn-setserial = "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-core/seatd/seatd/init b/meta/recipes-core/seatd/seatd/init
> new file mode 100644
> index 0000000000..0589c765ac
> --- /dev/null
> +++ b/meta/recipes-core/seatd/seatd/init
> @@ -0,0 +1,45 @@
> +#!/bin/sh
> +#
> +### BEGIN INIT INFO
> +# Provides: seatd
> +# Required-Start: $local_fs $remote_fs
> +# Required-Stop: $local_fs $remote_fs
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +### END INIT INFO
> +
> +killproc() {
> +        pid=`/bin/pidof $1`
> +        [ "$pid" != "" ] && kill $pid
> +}
> +
> +case "$1" in
> +  start)
> +        seatd -g video -n 1 > /tmp/seatd-start-notify &
> +        [ -s /tmp/seatd-start-notify ] && exit 0
> +        sleep 0.1
> +        [ -s /tmp/seatd-start-notify ] && exit 0
> +        sleep 0.5
> +        [ -s /tmp/seatd-start-notify ] && exit 0
> +        sleep 5
> +        [ -s /tmp/seatd-start-notify ] && exit 0
> +        exit 1
> +  ;;
> +
> +  stop)
> +        echo "Stopping seatd"
> +        killproc seatd
> +  ;;
> +
> +  restart)
> +	$0 stop
> +        sleep 1
> +        $0 start
> +  ;;
> +
> +  *)
> +        echo "usage: $0 { start | stop | restart }"
> +  ;;
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-core/seatd/seatd_0.6.3.bb b/meta/recipes-core/seatd/seatd_0.6.3.bb
> new file mode 100644
> index 0000000000..0e1a79dddf
> --- /dev/null
> +++ b/meta/recipes-core/seatd/seatd_0.6.3.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "A minimal seat management daemon, and a universal seat management library."
> +DESCRIPTION = "Seat management takes care of mediating access to shared devices (graphics, input), without requiring the applications needing access to be root."
> +HOMEPAGE = "https://git.sr.ht/~kennylevinsen/seatd"
> +
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
> +
> +SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
> +           file://init"
> +SRCREV = "88db55f6068c1c01d85b61aa6adff0a6b2a8dce8"
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig update-rc.d
> +
> +PACKAGECONFIG ?= "libseat-builtin"
> +
> +PACKAGECONFIG[libseat-builtin] = "-Dlibseat-builtin=enabled,-Dlibseat-builtin=disabled"
> +
> +do_install:append() {
> +        if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
> +                install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/seatd
> +        fi
> +}
> +
> +INITSCRIPT_NAME = "seatd"
> +INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
> +INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
> +
> 

I was looking into seatd as well, in my recipe I split it up a bit:

```
PACKAGES =+ "${PN}-launch libseat libseat-dev"

FILES:${PN} = "${bindir}/seatd"
FILES:${PN}-launch = "${bindir}/seatd-launch"
FILES:libseat = "${libdir}/lib*${SOLIBS}"
FILES:libseat-dev = " \
        ${includedir} ${FILES_SOLIBSDEV} \
        ${libdir}/pkgconfig"

RDEPENDS:${PN} = "libseat (= ${EXTENDPKGV})"
RDEPENDS:${PN}-launch = "${PN} (= ${EXTENDPKGV})"
RDEPENDS:libseat-dev = "libseat (= ${EXTENDPKGV})"
```

regards,
Claudius

