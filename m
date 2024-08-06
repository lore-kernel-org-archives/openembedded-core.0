Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A34C52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 19:57:23 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.16673.1722974236143302311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 12:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=byY4AaOw;
 spf=pass (domain: baylibre.com, ip: 209.85.219.45, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6b79c27dd01so5574226d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 12:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722974235; x=1723579035; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vlOoilSVb52HrkAsGdtcNQGN1yu46ZUTzyOZSjUenwQ=;
        b=byY4AaOwQSkk+D5Idhm1LE1N6C08An8vF8Bt2hnS/fYQ2sMt34G0M1AUiONniPZxZe
         xwJy8ZChgIztjCeodEB8c7KxR6kACpnCENjrivUw9h3HHDZWvDYLFbGuLVLGcdwBByBE
         LoXwdjbnmFskKa0MewoO/72kcDcvfdkzTbj9m4jx8/3sz3077ITpXAdU7rv2/0DfeyjQ
         S6wPPERVd3CcILlkztGf25g/63ICId1BxGWgv48fMgum/NL/S2IyG2fQ7pOILs+JLHkR
         ZgCNWAIp44FqI/YZiB8seb4xGqm1KRwFLSpIcT3AmfUDfpu7abBEJIigKTRG2tf5Rejd
         1bTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722974235; x=1723579035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vlOoilSVb52HrkAsGdtcNQGN1yu46ZUTzyOZSjUenwQ=;
        b=GwtMVZbkNlKFXFSmKTHNJuF6PJ1YjNGrbqhIl8rFIu/tdsbt8gcFoENStlm0h+IyOM
         WWkh0qFGn/7/lBi85jQdVSV6KfXQaR1dmz504dI3UsrSOpCiIRdD9aZWPL5e5oWTAwDL
         hbPMNkwTNnnFi4s9L4vGkexpmeez4AwPnGpjB+F+N1DPxGPF2XBzl9/E9LYKSm+S4mzl
         5px+xuLdg7sZGU3paR1zQdadsTDoPJZD94zikD1F01Rz0b/+dXN5aSV31NoSVcjenlyU
         yEZYSrBdqwj5vzvIAKnmMc97YmLYVBR/6vRPsFDkOM17ZN//4BPAGWPG023P04SlcQMh
         Ax8w==
X-Gm-Message-State: AOJu0Ywi2KBXJ2HRJq6Nmfs15AnUGmkJQjtk3oJ9oHn+n5fE9t+int1I
	pdu2GxzWXuXqLS9YZLl4qG0WHmY8wUROiGScV0IYUb1c6A53h2VclU5r0G/kbXCDujHm/OJRjdJ
	Y
X-Google-Smtp-Source: AGHT+IH1HA2wmlRG89liysgwrn9Euo/KpJiv6lKTsLAf3zo8taGpUC/sB0pUVBcEGmh5zJF15mT3Mw==
X-Received: by 2002:a05:6214:5007:b0:6bb:9d52:6a93 with SMTP id 6a1803df08f44-6bb9d526f2emr183887946d6.52.1722974234899;
        Tue, 06 Aug 2024 12:57:14 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c760453sm49648106d6.26.2024.08.06.12.57.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 12:57:14 -0700 (PDT)
Message-ID: <694ac64f-62cc-43f6-aea2-250bb1b02b9a@baylibre.com>
Date: Tue, 6 Aug 2024 15:57:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] kea: upgrade 2.4.1 -> 2.6.1
To: openembedded-core@lists.openembedded.org
References: <17E9397D7ECFD5A5.19172@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <17E9397D7ECFD5A5.19172@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 19:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203049


On 2024-08-06 3:12 p.m., Trevor Gamblin via lists.openembedded.org wrote:
> Refresh patch 'fix_pid_keactrl.patch' to apply on new version.
>
> Add an extra sed call to do_install:append() to remove a reference to
> TMPDIR from ${D}/usr/sbin/kea-admin.
>
> License-Update: Update copyright year
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v2 tweaks the extra sed call to use BPN instead of PN, so that it works
> with multilib builds.
This was supposed to be a v3. Do I need to resend?
>
>   .../kea/files/fix_pid_keactrl.patch                  | 12 +++++++++---
>   .../kea/{kea_2.4.1.bb => kea_2.6.1.bb}               |  5 +++--
>   2 files changed, 12 insertions(+), 5 deletions(-)
>   rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.6.1.bb} (92%)
>
> diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
> index 63a6a2805b..2f5a217d3f 100644
> --- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
> +++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
> @@ -1,4 +1,4 @@
> -From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
> +From f5125725e4e2e250ccc78a17a8b77431100e7c15 Mon Sep 17 00:00:00 2001
>   From: Armin kuster <akuster808@gmail.com>
>   Date: Wed, 14 Oct 2020 22:48:31 -0700
>   Subject: [PATCH] Busybox does not support ps -p so use pgrep
> @@ -8,15 +8,18 @@ Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
>   
>   Signed-off-by: Armin kuster <akuster808@gmail.com>
>   
> +Refresh to apply on top of 2.6.1.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>   ---
>    src/bin/keactrl/keactrl.in | 4 ++--
>    1 file changed, 2 insertions(+), 2 deletions(-)
>   
>   diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
> -index 450e997..c353ca9 100644
> +index cccfdac303..20ae2e6ec5 100644
>   --- a/src/bin/keactrl/keactrl.in
>   +++ b/src/bin/keactrl/keactrl.in
> -@@ -149,8 +149,8 @@ check_running() {
> +@@ -146,8 +146,8 @@ check_running() {
>        # Get the PID from the PID file (if it exists)
>        get_pid_from_file "${proc_name}"
>        if [ ${_pid} -gt 0 ]; then
> @@ -27,3 +30,6 @@ index 450e997..c353ca9 100644
>                # No error, so PID IS ALIVE
>                _running=1
>            fi
> +--
> +2.39.2
> +
> diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.6.1.bb
> similarity index 92%
> rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
> rename to meta/recipes-connectivity/kea/kea_2.6.1.bb
> index 19309ce314..05a756a6ee 100644
> --- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
> +++ b/meta/recipes-connectivity/kea/kea_2.6.1.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
>   HOMEPAGE = "http://kea.isc.org"
>   SECTION = "connectivity"
>   LICENSE = "MPL-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=618093ea9de92c70a115268c1d53421f"
>   
>   DEPENDS = "boost log4cplus openssl"
>   
> @@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
>              file://fix_pid_keactrl.patch \
>              file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
>              "
> -SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
> +SRC_URI[sha256sum] = "d2ce14a91c2e248ad2876e29152d647bcc5e433bc68dafad0ee96ec166fcfad1"
>   
>   inherit autotools systemd update-rc.d upstream-version-is-even
>   
> @@ -64,6 +64,7 @@ do_install:append() {
>       sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
>              -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
>              ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
> +    sed -i "s:${B}/../${BPN}-${PV}:@abs_top_builddir_placeholder@:g" ${D}/usr/sbin/kea-admin
>   }
>   
>   do_install:append() {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203048): https://lists.openembedded.org/g/openembedded-core/message/203048
> Mute This Topic: https://lists.openembedded.org/mt/107670507/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

