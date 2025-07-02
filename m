Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0296C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:34:02 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.18083.1751441639064628413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c/Jxu+bj;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6faf66905adso32166946d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 00:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751441638; x=1752046438; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=txh0bphfyODJXPT4dXS0PKvc2I3ClQf4+ZcTt/24qBM=;
        b=c/Jxu+bjpb1S6Uo0cXjmXxjlquSOXKlBkmjoIvy92Q48aHT/SbnawnjNnU0uj+opbY
         sjuvxLE5GEduy7HGhDNjyIOrKkyjVq5ezZHHthOkwXQkIUnUqcPSiXxU6RXDRFMhwPHe
         nCMZvh84GLaVP4ax6+B9LGHOSRYIdWugR3Z87S0WNaX9CM7Tlkryeg2sqi/4dwSDpfm7
         m9K21vcTEreoiu13g35xuXD1BYHXYYspFOwjJKCVos8ty63rVdkCalwejHDLQrUjK8EI
         8GoEXkyZwjVNH+N+sA/HL7k71v6LkZY6WLJ0UABJryJUgNile5w5MbebHyCJ0dhlyaw8
         8awQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751441638; x=1752046438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txh0bphfyODJXPT4dXS0PKvc2I3ClQf4+ZcTt/24qBM=;
        b=eeLegFGJrxKwjb9knnYuvwOludbrLwH/wHyV1GcmgqDHvaEpySFD7PbIHYHnd4oTbE
         N8t0oz8Lw9Myhj1Eh0xkLh2OUXvOF7I/zfJFIR3HwS6IiaHMxcuxxzoL1fqBZR3F/X2X
         LZqjj77yRZE7tBX2vtU8Sz1WuOFXm6GF4rB9FnWDZu9khoG0VQce87RKMbT2Gte86lEm
         pCa2zrb1oFWUdWkKzS4iKbIvpP3G4CaB5lMewn1Zdz8tJFM3/yNrRK22HNZF8y/JBieA
         Bq135Vea36KKLLzUal8e2L5cYdTxvNDOcGWIyzTt1wngrHbkeSPYJZoWEfyFKti6KwU6
         6sbw==
X-Gm-Message-State: AOJu0YzcAkE1y47FVOKeLymcmUB12V0imPpx0YlfIurArCw6DFMzt3KZ
	phge5MGPkZ5GFowqz8ya/HAnVeLKjDKPC8vQduDeBOHNuGV868mibIDFVxR7m1N3kZM3ASlWtG6
	GkTQg1uLK4Q5/Im4RcQliaW/rT/NrlRA=
X-Gm-Gg: ASbGncvkPzSHEz4sZ9aZGI9EDrM3va52UjL3aJlsgcX2UPm36JKtwZcvV5nVuo9UE/2
	vHPV4Xv2CfGuLO9gRM+kgRH1843s15YcMHWvlZ0ck9tQJTIaTeBNMd6jnGE9bGIuNrCa7BTMjsN
	OHRL0dPZWwIE62i9jfDjCFASrmhXNUTQAMzKtojXbiWw==
X-Google-Smtp-Source: AGHT+IHYXmgN1zy5Ob5jppJg9P1hzdOH1PJ1VTnfLms7/KpJpPvlVIUzO7afAmbej5GksnOXrXODQMD6MFFzUoLVvPA=
X-Received: by 2002:a05:6214:4103:b0:6fa:c5be:daca with SMTP id
 6a1803df08f44-702b178fb25mr23650426d6.7.1751441637691; Wed, 02 Jul 2025
 00:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250701232440.474-1-wangmy@fujitsu.com> <20250701232440.474-7-wangmy@fujitsu.com>
In-Reply-To: <20250701232440.474-7-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Jul 2025 09:33:32 +0200
X-Gm-Features: Ac12FXzcmuKBAqXaDLuf68fg0mInifFrEfAjszj954eCehxbtwAYrzTBKE-WWMs
Message-ID: <CANNYZj8+d_F5W424A8c8qm_fXZbGuSNhzVKNKo8voT1Fjm4haQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] lttng-ust: upgrade 2.13.9 -> 2.14.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219800

This does not address the feedback given to the first version of the
patch. You need to update all three lttng recipes in lockstep.

Alex

On Wed, 2 Jul 2025 at 01:24, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-lttng-ust-common-link-with-liburcu-explicitly.patch
> 0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
> refreshed for 2.14.0
>
> License-Update: add suffix ".txt" to according files.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...0001-lttng-ust-common-link-with-liburcu-explicitly.patch | 6 +++---
>  ...thon-lttngust-Makefile.am-Add-install-lib-to-setup.patch | 6 +++---
>  .../lttng/{lttng-ust_2.13.9.bb => lttng-ust_2.14.0.bb}      | 4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
>  rename meta/recipes-kernel/lttng/{lttng-ust_2.13.9.bb => lttng-ust_2.14.0.bb} (92%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
> index ceb240680b..b72c453b96 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
> +++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
> @@ -1,4 +1,4 @@
> -From 1b6bbf14de8fdfe60e446c93969e29bc2cf5f2dc Mon Sep 17 00:00:00 2001
> +From 4cdaf17efc66423aec5e3c094b9a1c31683e1a10 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Sun, 5 Sep 2021 10:44:19 +0200
>  Subject: [PATCH] lttng-ust-common: link with liburcu explicitly
> @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/src/lib/lttng-ust-common/Makefile.am b/src/lib/lttng-ust-common/Makefile.am
> -index 1ccc290..6531fa0 100644
> +index c350edc..09212a7 100644
>  --- a/src/lib/lttng-ust-common/Makefile.am
>  +++ b/src/lib/lttng-ust-common/Makefile.am
> -@@ -16,6 +16,7 @@ liblttng_ust_common_la_SOURCES = \
> +@@ -18,6 +18,7 @@ liblttng_ust_common_la_SOURCES = \
>
>   liblttng_ust_common_la_LIBADD = \
>         $(top_builddir)/src/common/libcommon.la \
> diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
> index 7bbe5c216e..faddf55402 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
> +++ b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
> @@ -1,4 +1,4 @@
> -From 30660997d220602202d8dc7264e49095a1581947 Mon Sep 17 00:00:00 2001
> +From 92fd7a205aff290a6f20c08e62f72094100c3689 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Tue, 20 Feb 2024 12:19:06 +0000
>  Subject: [PATCH] python-lttngust/Makefile.am: Add --install-lib to setup.py
> @@ -14,10 +14,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/src/python-lttngust/Makefile.am b/src/python-lttngust/Makefile.am
> -index d53e21d..283901e 100644
> +index 30db9fb..d46b6ee 100644
>  --- a/src/python-lttngust/Makefile.am
>  +++ b/src/python-lttngust/Makefile.am
> -@@ -45,7 +45,7 @@ install-exec-local: build-python-bindings.stamp
> +@@ -47,7 +47,7 @@ install-exec-local: build-python-bindings.stamp
>         if [ "$(DESTDIR)" != "" ]; then \
>                 opts="$$opts --root=$(DESTDIR)"; \
>         fi; \
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
> similarity index 92%
> rename from meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
> rename to meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
> index dd7657e0cc..1a15c5b420 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "http://lttng.org/ust"
>  BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
>
>  LICENSE = "LGPL-2.1-or-later & MIT & GPL-2.0-only"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a46577a38ad0c36ff6ff43ccf40c480f"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b04e8f34dbcf08198c6618d05e8fe7b"
>
>  PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
>                   am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
> @@ -33,7 +33,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
>             file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
>             "
>
> -SRC_URI[sha256sum] = "2ad6d69a54a1d924c18a4aa7a233db104e3cc332bcdd240e196bf7adbed3f712"
> +SRC_URI[sha256sum] = "82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db448a0d5ca51b763"
>
>  CVE_PRODUCT = "ust"
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219741): https://lists.openembedded.org/g/openembedded-core/message/219741
> Mute This Topic: https://lists.openembedded.org/mt/113939347/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

