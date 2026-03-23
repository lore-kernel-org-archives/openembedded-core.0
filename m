Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96204EC01C5
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 10:29:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13956.1774261776384820465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 03:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S3Wna1LM;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so41083105e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 03:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261774; x=1774866574; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MjsjBD+BkNadCrCjD2pwz85Qvk48HzrC2AsmA3DgS7c=;
        b=S3Wna1LM4aI+RZnFYs0GaKXbOGnBPVpHul1h4l8bs14GLChfv/0YRa/vqBg6X+Bxfr
         ZTOXa6g0kPvn4/LMR3Cs9sLazJsSIWyxVbNduvbPHjYScztKvHii/u/8Yct7G584h+lv
         v4S+1S5CAsctAMXQJ79e1N98dZQVGFUa1zENNiR96/6p00byVP7tDWGLfSgXvKOPFD8u
         A1Q8LbGphApjUexncY6584OuJ2oWJ3weTB0yL6fmnVCqigoRV1yao+z90aipUg5oDas1
         68J97Mx+cqlWo5EaE1gYJGGIZT+MyeyHm/50jyYx0B4+OTMi9Q5SqsxoBhM/jmexfb11
         3c7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261774; x=1774866574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjsjBD+BkNadCrCjD2pwz85Qvk48HzrC2AsmA3DgS7c=;
        b=BBYCaSl/snOjkTZfUDzHIQBg9zqaBV2UqWjx+xDKnaIQdmN2rk9bZ0gOOVuEcQFMjE
         POR2SrRjvIx6meouoAopvG/180qPn2XsgSLnovEmzOTxJ7CCq0ef5gZuTLt30YtHvGlT
         p8tCwc0appjQj/55eFz6eP+5PRxFBSNG8ZzyYly62HGgzgr6c6YJEXgeycyE5oogcIAQ
         9ymn0Dhejwzbb4kMZ3bv+Z75iaX7CEvJiIfMvxeQ720GrDJsUEGwDOHqWnQ6hN8Eek8x
         v7z9JzO33XHqPMlEUMFllOPKV38i4lR2ZdfWjYNvuxalrKuHCz/E6OssinOeDzQP+8Zl
         jxOA==
X-Gm-Message-State: AOJu0YyUeSR0n5q+gDnsZHoGCGEMy295wXt7dOSBeyFYoRB4oo6sY5rR
	5r66jHvKcgeTl54WIa/yq3DvvyCVDKb+iLYoPs50D28xuSDdiCiq34GUKBQ+Rw==
X-Gm-Gg: ATEYQzzFxjEk3v6vmYu4yT1ir/slJSPKcA2QJI6fFINi5BIN7uiY665z3TJPyjSj2vr
	cOfi+E78q+UkFLpiMqDxwdfS3fUvrKsCPL+7gjMp+92QFv0gCvJDixgzoMZgSP/jKUHdMJ1F1QR
	a2gZCECC03uW0o1YFOXFpvhouuzTGSK+3KG0Pa/ylqP0FQlsP6ar2RjIyC5HxbpI728ERgAMNGP
	VmxQTqViJ2PkdP05neDGYX2BZtWsWUTwrO2+Q9Kx5v+jLam/PT00/QIqjh59hCsshqCYksMI7ja
	VWyYejJwya6S7DR2gxQvIHldO16NIDlBtm6ymlsaqf71XpTtP/Trz/37TXU/FtEsMGYR6GchMvd
	tqU1ChMPj1Kvh9niVTvL7wSx97EOQBNwie1bLNCEkg/G7fqLJ9zZ/rAqPbK/yYJUAhTb6QDT/RX
	a3MEv2fRN77HQsGNm1hvvP8GxMJHLc8g8QWcXsTBTbVyGe7sfQ9dcd8P1FDgYLylg40A==
X-Received: by 2002:a05:600c:3b07:b0:485:5ba3:37d8 with SMTP id 5b1f17b1804b1-486fedab1e5mr155660365e9.5.1774261774158;
        Mon, 23 Mar 2026 03:29:34 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48705135631sm195066115e9.15.2026.03.23.03.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:29:33 -0700 (PDT)
Message-ID: <4b6c7947-3009-456c-bf66-5c318dff7eed@gmail.com>
Date: Mon, 23 Mar 2026 11:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] gtk4: Fix a build error in
 examples/application8
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
References: <20260314142002.925941-1-zboszor@gmail.com>
 <189CBB0CF0DD1005.1508127@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <189CBB0CF0DD1005.1508127@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 10:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233711

2026. 03. 14. 15:20 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> Add a backported patch from master to use underscore instead of
> space in a generated filename. This fixes the build error:
>
> | /usr/bin/ld: cannot find examples/application8/exampleapp8.p/meson-generated_.._exampleapp8: No such file or directory
> | /usr/bin/ld: cannot find resources.c.o: No such file or directory
>
> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> ---
>   ...-t-use-space-in-meson-generated-file.patch | 34 +++++++++++++++++++
>   meta/recipes-gnome/gtk+/gtk4_4.20.3.bb        |  2 ++
>   2 files changed, 36 insertions(+)
>   create mode 100644 meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch
>
> diff --git a/meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch b/meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch
> new file mode 100644
> index 0000000000..2a79fc637d
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch
> @@ -0,0 +1,34 @@
> +From d26453923a21de0d908af3bf83c69263aaee5705 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
> + <zboszor@gmail.com>
> +Date: Wed, 11 Mar 2026 07:02:10 +0100
> +Subject: [PATCH] application8: Don't use space in meson generated filename
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +All other example apps use underscore, examples/application8
> +has a build error:
> +
> +| /usr/bin/ld: cannot find examples/application8/exampleapp8.p/meson-generated_.._exampleapp8: No such file or directory
> +| /usr/bin/ld: cannot find resources.c.o: No such file or directory
> +
> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/9627]
> +---
> + examples/application8/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/examples/application8/meson.build b/examples/application8/meson.build
> +index f2e1d7cea9..77987d554a 100644
> +--- a/examples/application8/meson.build
> ++++ b/examples/application8/meson.build
> +@@ -1,4 +1,4 @@
> +-app8_resources = gnome.compile_resources('exampleapp8 resources',
> ++app8_resources = gnome.compile_resources('exampleapp8_resources',
> +   'exampleapp.gresource.xml',
> +   source_dir: meson.current_source_dir())
> +
> +--
> +2.53.0
> +
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
> index ef9a05f7fe..0cca44fb5c 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
> @@ -35,6 +35,8 @@ LIC_FILES_CHKSUM = " \
>   
>   SRC_URI[archive.sha256sum] = "2873f2903088a66c71173ea2ed85ffae266a66b972c3a4842bbb2f6f187ec153"
>   
> +SRC_URI += "file://0001-application8-Don-t-use-space-in-meson-generated-file.patch"

Sorry, but this change is not completely correct.
For target builds, it only works with the latest meson if :append is used instead of +=

But 4.22.1 contains the same patch out of the box, so upgrading
to that version would be a better change.

> +
>   S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
>   
>   CVE_PRODUCT = "gnome:gtk"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233086): https://lists.openembedded.org/g/openembedded-core/message/233086
> Mute This Topic: https://lists.openembedded.org/mt/118314080/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


