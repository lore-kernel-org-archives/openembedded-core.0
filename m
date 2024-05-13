Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B130C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 14:28:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.61727.1715610482861066497
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 07:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gwA6VKyz;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41fd5dc04e2so26366755e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 07:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715610481; x=1716215281; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aN2UM/ayrOx2wWC59nVm5lcavotARXD59IwM1yWpsfw=;
        b=gwA6VKyzrcJGBn0mJ4oYkLaq3vJoWUVYGE4VIYYVrPLvb0Rz0wQL9IfTMa4PXxVqAy
         lSRqh9VSrsoxn3fxCjTdcKxWGgRU2sERbFNxU8wGbLlmY1B6r7d4E3DnhgAFQ8YmJByy
         n4zN0Tp7IHUxnTwBQyOrNhDWM3XqHRdfsZbR3g4eLWymWLJpCdw8VHn+0fcLDdABhMhr
         lAM37W5EOHufd1sYaLIr++bxlqg1rZO1p2cCOUJcG/qSkN25t0zNKls9oV8xWqO19xVF
         JNRWN6H4YCM6PiZdhuD9wjAxSchafsKvJRd0tQEOsoP9VpcAVAUJVLb8WRbf7mVIzv/N
         mLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715610481; x=1716215281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aN2UM/ayrOx2wWC59nVm5lcavotARXD59IwM1yWpsfw=;
        b=i8p6d1bJ+AA4Nef1K/80luDQpfWAIIvn82eO80ZVL1wY5UcAVG+LmV+6UwnJdVCk8a
         4nqf7tCJWl/jliaYAp8QU+XhT7wZAbOVyN0koCXg7J3PW57ZUXBnDowV3PwT95CgGYd+
         /5mZHRq5CnVoQvM88TA9OQ/HIApZUwBSNO3uLTAjFH0S28Z3qFgYb8k+7La6uqcyujJR
         Gtwe0DimP9zwIXO3fAgRHBdE9Sa0cHUOM8akJklCaTk5syLL5pe8XDxw4COuW0DTjX0l
         y0WFgTDV1ahoB6IpV3rrCG3+3hyBr80U/Jv7BJ6CVfhaF8Uhsx1OStW91PJVpR9XB0Q+
         iFEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWERd3L/FdvwEGq1zPbYDoszSYPCNKzRx2l8LupdT9eyJvS3FBZNJbHnFtd3crRhOO52l04sWGXLyRXxOvyPCDEHaKDZXFS9aTE+2dkNb/oCU8ivXbf+yBJ
X-Gm-Message-State: AOJu0YyU/AB5MxoVTafZwO8SXUQ4bUDnl0hnomXCYbLX8YH9J75u5V2Z
	RLpLk2m+Ctl8ovS0cYMErh0YrJiIBTE8HEaKJG8I/Jy1BKL44Mcu
X-Google-Smtp-Source: AGHT+IEsjRO8AX7i8v3wYLx5f4AdcqU/nGRq0a4RJ2F4hx7AXm15Xzyq+OXuGHYhlEn7Fm0dTKrW6Q==
X-Received: by 2002:a05:600c:1c9f:b0:419:d91e:ba41 with SMTP id 5b1f17b1804b1-41feac5ba6cmr67433515e9.32.1715610481033;
        Mon, 13 May 2024 07:28:01 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce24efsm159541385e9.19.2024.05.13.07.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 07:28:00 -0700 (PDT)
Message-ID: <1d0d45e7-b12b-4f9f-be5f-89b85b9d0b41@gmail.com>
Date: Mon, 13 May 2024 16:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4 ->
 2.80.0, 1.78.1 -> 1.80.0
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20240502103252.1102710-1-alex.kanavin@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20240502103252.1102710-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 14:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199240

2024. 05. 02. 12:32 keltezéssel, Alexander Kanavin via lists.openembedded.org írta:
> ...
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
> similarity index 96%
> rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
> rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
> index 05a08a50e08..582ac248fda 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
>   SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
>              "
>   
> -SRC_URI[sha256sum] = "bd7babd99af7258e76819e45ba4a6bc399608fe762d83fde3cac033c50841bb4"
> +SRC_URI[sha256sum] = "a1df7c424e15bda1ab639c00e9051b9adf5cea1a9e512f8a603b53cd199bc6d8"
>   
>   SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
>   
> @@ -26,7 +26,9 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>   
>   MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
>   
> -DEPENDS += " libffi zlib glib-2.0 python3 flex-native bison-native"
> +DEPENDS += " libffi zlib python3 flex-native bison-native"
> +DEPENDS:append:class-native = " glib-2.0"
> +DEPENDS:append:class-target = " glib-2.0-initial"
>   
>   # target build needs qemu to run temporary introspection binaries created
>   # on the fly by g-ir-scanner and a native version of itself to run
> @@ -189,6 +191,6 @@ FILES:${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
>   FILES:${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
>   
>   # setuptools can be removed when upstream removes all uses of distutils
> -RDEPENDS:${PN} = "python3-pickle python3-xml python3-setuptools"
> +RDEPENDS:${PN} = "python3-pickle python3-xml python3-setuptools glib-2.0"
>   
>   BBCLASSEXTEND = "native"

This needs to be BBCLASSEXTEND = "native nativesdk" to match glib.inc. An image build may 
contain this dependency chain now: nativesdk-glib-2.0 -> nativesdk-gobject-introspection 
-> nativesdk-glib-2.0-initial

