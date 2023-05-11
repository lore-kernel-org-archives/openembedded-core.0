Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D89EC7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 19:59:18 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.6835.1683835148974189073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 12:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GahBUa71;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 70DFC60005;
	Thu, 11 May 2023 19:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683835147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MYgYW5mKNgF9iWEkB3ejqQwRqKDov7S76tMI8NKf+6c=;
	b=GahBUa71RjfiqWW2yd4DgPO0qnffDkuVyIc/9l4WCB4cSp0IB1kO4z7vGuTw/SC5YRzYZF
	R5hhzALs7fbSTbIB3SgbiebsA8rcylNM1ZnPyYcXHdzMNnf3PBATAhysvkmMNNz5ofMJt3
	0Gn8LrE2V1a8r8J9zeYaXV5JoRZN31j9c13CpALh6Zwppgb5V6kI1lYNaEiDz1hB6nDgNL
	mF8nTFUnQXqtclBlReN7OI23WweVCpI7GWyui28necK/ktp+L3I1xyvud077//UqeOU/mA
	f4dWQvpo7I9PAuKkkS3orP/qevhkxMT7ufg7NWe3BIgXm5ZwKZPxwgzkHz6qBA==
Date: Thu, 11 May 2023 21:59:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
	raj.khem@gmail.com, quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [OE-core][Patch v3 1/3] libtraceevent: import from
 meta-openembedded
Message-ID: <2023051119590599c5f06d@mail.local>
References: <20230511125603.958144-1-max.oss.09@gmail.com>
 <20230511125603.958144-2-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511125603.958144-2-max.oss.09@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 19:59:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181144

Hello,

On 11/05/2023 14:56:01+0200, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Import from meta-openembedded at commit d250a0dc0 ("libtraceevent:
> upgrade 1.7.1 -> 1.7.2").
> Starting with kernel 6.4 libtraceevent is a dependency of perf. While
> one can still build perf without it by opting out one would loose its
> functionality compared with building perf from kernels before 6.4
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  ...not-preserve-ownership-in-cp-command.patch | 40 +++++++++++++++++++
>  .../libtraceevent/libtraceevent_1.7.2.bb      | 25 ++++++++++++
>  3 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
>  create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
> 

This causes:
libtraceevent-1.7.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libtraceevent.so.1.7.2 in package libtraceevent-dbg contains reference to TMPDIR [buildpaths]

> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index ec7ea90d16..3071671850 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -402,6 +402,7 @@ RECIPE_MAINTAINER:pn-libtirpc = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-libtool = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-libtool-cross = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-libtool-native = "Robert Yang <liezhi.yang@windriver.com>"
> +RECIPE_MAINTAINER:pn-libtraceevent = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-libtry-tiny-perl = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-libucontext = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-libunistring = "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
> new file mode 100644
> index 0000000000..5e88048817
> --- /dev/null
> +++ b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
> @@ -0,0 +1,40 @@
> +From ed0a31000305d937abe47c44d705b5b52bb36f79 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 22 Dec 2022 18:32:17 -0800
> +Subject: [PATCH] makefile: Do not preserve ownership in cp command
> +
> +Fixes
> +
> +ERROR: libtraceevent-1.7.0-r0 do_package_qa: QA Issue: libtraceevent: /usr/lib/libtraceevent.a is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 965ff47..0e782cb 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -287,7 +287,7 @@ $(BUILD_PREFIX): force
> + 	$(Q)$(call build_prefix,$(prefix))
> + 
> + define do_make_pkgconfig_file
> +-	cp -f ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_FILE};	\
> ++	install -m 0644 ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_FILE};	\
> + 	sed -i "s|INSTALL_PREFIX|${1}|g" ${PKG_CONFIG_FILE}; 		\
> + 	sed -i "s|LIB_VERSION|${EVENT_PARSE_VERSION}|g" ${PKG_CONFIG_FILE}; \
> + 	sed -i "s|LIB_DIR|${libdir_relative}|g" ${PKG_CONFIG_FILE}; \
> +@@ -335,7 +335,7 @@ install: install_libs install_plugins
> + 
> + install_libs: libs install_headers install_pkgconfig
> + 	$(Q)$(call do_install,$(LIBTRACEEVENT_SHARED),$(libdir_SQ)); \
> +-		cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
> ++		cp --no-preserve=ownership --recursive $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
> + 	$(Q)$(call install_ld_config)
> + 
> + install_pkgconfig: $(PKG_CONFIG_FILE)
> +-- 
> +2.39.0
> +
> diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
> new file mode 100644
> index 0000000000..089b6814c7
> --- /dev/null
> +++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
> @@ -0,0 +1,25 @@
> +# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "API to access the kernel tracefs directory"
> +HOMEPAGE = "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/"
> +LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
> +                    file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
> +SECTION = "libs"
> +
> +SRCREV = "1c6f0f3b2bb47571fc455dc565dc343152517d98"
> +SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
> +           file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig
> +
> +do_install() {
> +    oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig
> +}
> +
> +PACKAGES += "${PN}-plugins"
> +
> +FILES:${PN}-plugins += "${libdir}/traceevent/plugins"
> -- 
> 2.35.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181133): https://lists.openembedded.org/g/openembedded-core/message/181133
> Mute This Topic: https://lists.openembedded.org/mt/98826712/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

