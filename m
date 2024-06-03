Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D32C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 06:07:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.76965.1717394836503353605
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 23:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ivo8DE2s;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71002240005;
	Mon,  3 Jun 2024 06:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717394834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eYwDGlMzmCFVnFBYCiCzDDsY+F8tNj5w9dKlIc28wHM=;
	b=Ivo8DE2sjPJNN8M4+60YgrQXJEMx1hsvqdHTW2fgfDWYneqCollXhwepKaNwbbSU4uZLAR
	efv+mx/Vk07sYlFf4QM8QAA8hI0SRm+Liatqm3sM3aX0MYFb0wdptFVNzyJ8N/o8rokcoR
	59bLcQhI4FLiYoGJXchtvHwQUiyfgU/uvONydX3Ifr+yOvESZ5VtTypKbv2Nmr3CS39UXU
	ieBFMrl1XCJ3LxVg/We5+UYDtMXnGqheHjw/50Jv/y8QbjQEA1hKcjQN/0pHODBR3QjN4j
	WuFfLGKSFkpD6zpskdaIevv2aS7XRik1xt6ebNNcVLuqxxE0GQQc6+2VQhAbgQ==
Date: Mon, 3 Jun 2024 08:07:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] iptables: Do not install /etc/ethertypes
Message-ID: <202406030607134a92d8a6@mail.local>
References: <20240528041053.11356-1-changhyeok.bae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528041053.11356-1-changhyeok.bae@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 06:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200236

Hello,

This doesn't apply on master, can you rebase?

On 28/05/2024 04:10:53+0000, Changhyeok Bae wrote:
> The patch file was deleted by mistaken during 1.8.10 upgrade.
> Re-introduce the patch file after re-writing based on 1.8.10 code.
> 
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  ...ile.am-do-not-install-etc-ethertypes.patch | 44 +++++++++++++++++++
>  .../iptables/iptables_1.8.10.bb               |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch
> 
> diff --git a/meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch b/meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch
> new file mode 100644
> index 0000000000..3aa40ac635
> --- /dev/null
> +++ b/meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch
> @@ -0,0 +1,44 @@
> +From 77024225a4d7a39e362296f0d1e5188a7c9340d4 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <trevor.gamblin@windriver.com>
> +Date: Tue, 28 May 2024 03:55:50 +0000
> +Subject: [PATCH] Makefile.am do not install etc ethertypes
> +
> +The /etc/ethertypes is provided by netbase since 6.0[1].
> +Do not instal the file in ebtables, otherwise there would be a conflict:
> +Error: Transaction test error:
> +  file /etc/ethertypes conflicts between attempted installs of
> +netbase-1:6.2-r0.corei7_64 and iptables-1.8.7-r0.corei7_64
> +
> +[1] https://salsa.debian.org/md/netbase/-/commit/316680c6a2c3641b6abc76b3eebf88781f609d35)
> +
> +This patch is based off of the same change made for the ebtables recipe:
> +
> +http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0001-Makefile.am-do-not-install-etc-ethertypes.patch?h=master
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> +---
> + Makefile.am | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 299ab46..7b60eb4 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -18,11 +18,6 @@ SUBDIRS         += iptables
> + 
> + EXTRA_DIST	= autogen.sh iptables-test.py xlate-test.py
> + 
> +-if ENABLE_NFTABLES
> +-confdir		= $(sysconfdir)
> +-dist_conf_DATA	= etc/ethertypes
> +-endif
> +-
> + .PHONY: tarball
> + tarball:
> + 	rm -Rf /tmp/${PACKAGE_TARNAME}-${PACKAGE_VERSION};
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.10.bb
> index 5a87897742..8cb9b76ca1 100644
> --- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
> @@ -14,6 +14,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
>             file://ip6tables.service \
>             file://ip6tables.rules \
>             file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
> +           file://0003-Makefile.am-do-not-install-etc-ethertypes.patch \
>             file://0002-iptables-xshared.h-add-missing-sys.types.h-include.patch \
>             file://0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch \
>             "
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199950): https://lists.openembedded.org/g/openembedded-core/message/199950
> Mute This Topic: https://lists.openembedded.org/mt/106343339/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

