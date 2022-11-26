Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F088C4332F
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 18:12:57 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.75502.1669486369799473000
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 10:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HOuL8f1A;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E65FA100002;
	Sat, 26 Nov 2022 18:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669486367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9EmZrEblx85yupdfkefdHBiELUTbc5mf6BnRqcqldlw=;
	b=HOuL8f1A8KTYot9WVFwoY9w9QVjN4fb5IHGqhBQL0huoMVr0grm5oX0+mD735nYtH6Txys
	Fb6EGoZDCCKRENlhz/R5qhwSE1V8Q7WflOXJ6Ln9BmJSIHt83Gue05R7M+54V0yrPuQaUk
	Chxyq8/e+0QLrD+uEbT3qiPtYdg2uez4YyNVOQUdkt7xCww0ELY4/Q6d+hNDypSnuvlGzs
	uTSiKr7ng02o329ieaODNIyUtfh4kE1boJzWDhLmMP35PnSxqlcMbVUko2y1vG/WuBQR0b
	1VPQgEw1l0JnYNzZ7Yz08Cn7ez3gr+Vnm3P48ZOyGAe58eEtQHX3DSdBC+uHLA==
Date: Sat, 26 Nov 2022 19:12:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Petr Vorel <pevik@seznam.cz>
Cc: openembedded-core@lists.openembedded.org,
	Petr Vorel <petr.vorel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Changhyeok Bae <changhyeok.bae@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] iputils: update to 20221126
Message-ID: <Y4JXHYTQhS5ODuBy@mail.local>
References: <20221126005057.464290-1-pevik@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221126005057.464290-1-pevik@seznam.cz>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 18:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173831

On 26/11/2022 01:50:57+0100, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> This release removed: ninfod, rarpd, rdisc.
> Remove also related, not yet upstreamed patch.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi all,
> 
> I'm sorry, I haven't managed to test patch.
> Can anybody do it for me?
> Thank you.
> 
> Kind regards,
> Petr
> 
>  .../0001-rarpd-rdisc-Drop-PrivateUsers.patch  | 27 -------------------
>  ...putils_20211215.bb => iputils_20221126.bb} | 21 +++------------
>  2 files changed, 4 insertions(+), 44 deletions(-)
>  delete mode 100644 meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
>  rename meta/recipes-extended/iputils/{iputils_20211215.bb => iputils_20221126.bb} (66%)
> 
> diff --git a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch b/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
> deleted file mode 100644
> index c61e39dc80..0000000000
> --- a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From dfeeb3f1328d09f516edeb6349bd63e3c87f9397 Mon Sep 17 00:00:00 2001
> -From: Alex Kiernan <alex.kiernan@gmail.com>
> -Date: Thu, 13 Feb 2020 06:08:45 +0000
> -Subject: [PATCH] rarpd:Drop PrivateUsers
> -
> -rarpd cannot gain the necessary capabilities with
> -PrivateUsers enabled.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> -
> ----
> - systemd/rarpd.service.in | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/systemd/rarpd.service.in b/systemd/rarpd.service.in
> -index e600c10..f5d7621 100644
> ---- a/systemd/rarpd.service.in
> -+++ b/systemd/rarpd.service.in
> -@@ -12,7 +12,6 @@ AmbientCapabilities=CAP_NET_RAW
> - DynamicUser=yes
> - PrivateTmp=yes
> - PrivateDevices=yes
> --PrivateUsers=yes
> - ProtectSystem=strict
> - ProtectHome=yes
> - ProtectControlGroups=yes
> diff --git a/meta/recipes-extended/iputils/iputils_20211215.bb b/meta/recipes-extended/iputils/iputils_20221126.bb
> similarity index 66%
> rename from meta/recipes-extended/iputils/iputils_20211215.bb
> rename to meta/recipes-extended/iputils/iputils_20221126.bb
> index 3ddce0be54..b4ab2fce5e 100644
> --- a/meta/recipes-extended/iputils/iputils_20211215.bb
> +++ b/meta/recipes-extended/iputils/iputils_20221126.bb
> @@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb64c89bb0e23b72930d2380894c47a1"
>  DEPENDS = "gnutls"
>  
>  SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
> -           file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
>             "
> -SRCREV = "1d1e7c43210d8af316a41cb2c53d612a4c16f34d"
> +SRCREV = "5ffabc4190cab975c7332645259e286a032e183b"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -23,14 +22,12 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>20\d+)"
>  # breaks the version order.
>  CVE_CHECK_IGNORE += "CVE-2000-1213 CVE-2000-1214"
>  
> -PACKAGECONFIG ??= "libcap rarpd \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod', '', d)} \
> +PACKAGECONFIG ??= "libcap \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', d)} \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>  PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false -DNO_SETCAP_OR_SUID=true, libcap libcap-native"
>  PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
>  PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
> -PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
> -PACKAGECONFIG[rarpd] = "-DBUILD_RARPD=true,-DBUILD_RARPD=false,"
>  PACKAGECONFIG[systemd] = "-Dsystemdunitdir=${systemd_system_unitdir},,systemd"
>  PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MANS=false -DBUILD_MANS=false, libxslt"
>  
> @@ -43,9 +40,7 @@ ALTERNATIVE_PRIORITY = "100"
>  ALTERNATIVE:${PN}-ping = "ping"
>  ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
>  
> -SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff ${PN}-rdisc \
> -             ${@bb.utils.contains('PACKAGECONFIG', 'rarpd', '${PN}-rarpd', '', d)} \
> -             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ninfod', '', d)}"
> +SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff \

This line can't ever parse.

>  PACKAGES += "${SPLITPKGS}"
>  
>  ALLOW_EMPTY:${PN} = "1"
> @@ -56,11 +51,3 @@ FILES:${PN}-ping = "${base_bindir}/ping.${BPN}"
>  FILES:${PN}-arping = "${base_bindir}/arping"
>  FILES:${PN}-tracepath = "${base_bindir}/tracepath"
>  FILES:${PN}-clockdiff = "${base_bindir}/clockdiff"
> -FILES:${PN}-rarpd = "${base_sbindir}/rarpd  ${systemd_system_unitdir}/rarpd@.service"
> -FILES:${PN}-rdisc = "${base_sbindir}/rdisc"
> -FILES:${PN}-ninfod = "${base_sbindir}/ninfod ${sysconfdir}/init.d/ninfod.sh"
> -
> -SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ninfod', '', d)} \
> -                    ${PN}-rdisc"
> -SYSTEMD_SERVICE:${PN}-ninfod = "ninfod.service"
> -SYSTEMD_SERVICE:${PN}-rdisc = "rdisc.service"
> -- 
> 2.38.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173790): https://lists.openembedded.org/g/openembedded-core/message/173790
> Mute This Topic: https://lists.openembedded.org/mt/95265570/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

