Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CFCC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 07:57:39 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.29266.1744271853165694124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 00:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RkEXwsYG;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so16079926d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 00:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744271852; x=1744876652; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=adwfvRNeGuNaEbAZ6Q/7N5YG4xBfHEC3wwVOA3gZUY4=;
        b=RkEXwsYGfnr53XqZKb7jnd8jnFaQ39RdoX56/2Ny5dWTQB+6/Ov+mBlPYLUQBWtF2p
         /CwPppsrypaPUkPYwopCTMfgmi1ct1MkJkDlgAMTLaCTcBeBZXqkCaXpe6BNbLpWWm0b
         Rn/E6aQUIzKCgK31v8lxS/KGaf3RjuWa+WNcdMTCnOY2GgYECR7GkV2wZOhOpIxCHP5T
         8hEprKrXchNcmmZgVl/jqHcOQM4Zbgsqy1fp7id5XBH84/+O4OhEXtIentAOrNgdrqMJ
         qbNCnLtoWHaP/T5sjZPrpqqFLAZb9N/47pMw4AAe5+svNUgU0Tj0FQoyzRjt2k9xztNn
         PZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744271852; x=1744876652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adwfvRNeGuNaEbAZ6Q/7N5YG4xBfHEC3wwVOA3gZUY4=;
        b=hnmJq3H7i+n0Em3RzBa6UZbabBJmHbyZ4j7O+Om0DNqPW1wTeLgJes2Bw5XXTbhALh
         a2jv06oqXPZBVQpVtO93oV9Hc5+Rh5s2UkAH18LFltOyAFbgXyBO2j8eubwnRNq8JjhU
         nkYyGwUxj456GDKNK3fNCphqr4rZ//Kz/WkDNufRiAObKtiQBGD5OcpSa7X/pXOrKarR
         vjrrHs6vby3kDikIYYY0Rd1QKQvoNThaG9jmvYbCK+Kbbr8+x07KSkx+gdsED4zYsYiz
         hNA3UBUJDsqJbuhRt31R8LacJuotIMckmEUAxIkCYOgsn90vhbT3/BVDAufjKG1P7aVW
         bpAg==
X-Gm-Message-State: AOJu0YytyZW6iZLmzc6TeKUU3tvbduuSW00jTF/3o7qb/TgUaZ+bTCxi
	GC5XlmKoVo9Igul+2qFD8OqqGA2fTjY6neipkzAMlybfBfqRpfeIzkSIXJs+1zAl5J/c5IHdoau
	VC8J8xhmQO2n1mm7JJrmeIj3T0M6dW/Ha
X-Gm-Gg: ASbGncuGj8+DDqeqLciYXDnKUhRzMDkMmcw861A4lARkwUUOTtWwh+AjJZpXcX7fPM3
	Dxao2eFbeFOxbPXmInblhwC7SQc/MKb7yRc1JMg2Ho0VjB0y9cnTEinc32NlkZg8M9WuYKCx8Yk
	kBgY0Me3XcZ/AZFY0R36edsJqnv4riTII4VJu9XiGO+vpFEcFNB2Ioqpig
X-Google-Smtp-Source: AGHT+IFt0I/t3INf0GZq7zNyw5gBZB6NIHOj2H1IOOFBUEv+e9Fh6QN+n5uuCiXQH442LlJ/bCsh7mneMnBjfqkVOQ8=
X-Received: by 2002:a05:6214:2aa7:b0:6eb:1c23:63c3 with SMTP id
 6a1803df08f44-6f0e5f5c5fdmr22032666d6.0.1744271852114; Thu, 10 Apr 2025
 00:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <14bccfd5-f8fb-4120-a779-7219fa18983e@hqv.ch>
In-Reply-To: <14bccfd5-f8fb-4120-a779-7219fa18983e@hqv.ch>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 09:57:21 +0200
X-Gm-Features: ATxdqUHJyS4mNTdeqDZeZ4ScR6cOS9mqoIiuAujZDleNeV8X6oNSbNkaRmU7BqA
Message-ID: <CANNYZj839xLM-4SrgibZqof_BtBep9=GCJ0s1e7J0PNH2TtTHA@mail.gmail.com>
Subject: Re: [OE-core] Option to change default optimization level of Python
To: lw@hqv.ch
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 07:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214629

This needs to be proposed to python upstream first. And definitely
first reworked as an option to configure script, rather than
conditional patches that hardcode the level.

You can also install a runtime wrapper for python executable that adds
the command line option, or sets the environment variable.

As it is, it's unsuitable.

Alex

On Thu, 10 Apr 2025 at 08:23, Lukas Woodtli via lists.openembedded.org
<lw=hqv.ch@lists.openembedded.org> wrote:
>
>  From 1614b1bb21b164d11aa88ff428c6bae9439b82d6 Mon Sep 17 00:00:00 2001
> From: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
> Date: Mon, 7 Apr 2025 13:18:41 +0200
> Subject: [PATCH] python3: Allow to set the default optimization level
>
> It's possible to compile the Python interpreter for the target, that it
> uses a given optimization level by default. This is as providing the
> `-O` option to the interpreter (possibly one or two times) or setting
> the environment variable `PYTHONOPTIMIZE`.
>
> Signed-off-by: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
> ---
>   ...zation-level-1-as-default-for-Python.patch | 25 ++++++++++++++++++
>   ...zation-level-2-as-default-for-Python.patch | 26 +++++++++++++++++++
>   .../recipes-devtools/python/python3_3.13.2.bb |  9 +++++++
>   3 files changed, 60 insertions(+)
>   create mode 100644
> meta/recipes-devtools/python/python3/0001-Use-optimization-level-1-as-default-for-Python.patch
>   create mode 100644
> meta/recipes-devtools/python/python3/0001-Use-optimization-level-2-as-default-for-Python.patch
>
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Use-optimization-level-1-as-default-for-Python.patch
> b/meta/recipes-devtools/python/python3/0001-Use-optimization-level-1-as-default-for-Python.patch
> new file mode 100644
> index 0000000000..98e4355b1d
> --- /dev/null
> +++
> b/meta/recipes-devtools/python/python3/0001-Use-optimization-level-1-as-default-for-Python.patch
> @@ -0,0 +1,25 @@
> +From ef51db9528916493d23a7e7a63cfc3b12b4ce3d9 Mon Sep 17 00:00:00 2001
> +From: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
> +Date: Tue, 8 Apr 2025 08:26:35 +0200
> +Subject: [PATCH] Use optimization level 1 as default for Python
> +
> +This is as if the command line option `-O` is set implicitly.
> +
> +Upstream-Status: Inappropriate [this is an optional enhancement just
> useful for a custom build for an embedded system]
> +---
> + Python/initconfig.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Python/initconfig.c b/Python/initconfig.c
> +index 192089b..c451b15 100644
> +--- a/Python/initconfig.c
> ++++ b/Python/initconfig.c
> +@@ -788,7 +788,7 @@ config_init_defaults(PyConfig *config)
> +     config->bytes_warning = 0;
> +     config->inspect = 0;
> +     config->interactive = 0;
> +-    config->optimization_level = 0;
> ++    config->optimization_level = 1;
> +     config->parser_debug= 0;
> +     config->write_bytecode = 1;
> +     config->verbose = 0;
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Use-optimization-level-2-as-default-for-Python.patch
> b/meta/recipes-devtools/python/python3/0001-Use-optimization-level-2-as-default-for-Python.patch
> new file mode 100644
> index 0000000000..ca196970a6
> --- /dev/null
> +++
> b/meta/recipes-devtools/python/python3/0001-Use-optimization-level-2-as-default-for-Python.patch
> @@ -0,0 +1,26 @@
> +From 31d904e770437cf47b7b56161687a0d90b1bc982 Mon Sep 17 00:00:00 2001
> +From: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
> +Date: Mon, 7 Apr 2025 13:11:02 +0200
> +Subject: [PATCH] Use optimization level 2 as default for Python
> +
> +This is as if the command line option `-OO` is set implicitly.
> +
> +Upstream-Status: Inappropriate [this is an optional enhancement just
> useful for a custom build for an embedded system]
> +
> +---
> + Python/initconfig.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Python/initconfig.c b/Python/initconfig.c
> +index 192089b..3f91fac 100644
> +--- a/Python/initconfig.c
> ++++ b/Python/initconfig.c
> +@@ -788,7 +788,7 @@ config_init_defaults(PyConfig *config)
> +     config->bytes_warning = 0;
> +     config->inspect = 0;
> +     config->interactive = 0;
> +-    config->optimization_level = 0;
> ++    config->optimization_level = 2;
> +     config->parser_debug= 0;
> +     config->write_bytecode = 1;
> +     config->verbose = 0;
> diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb
> b/meta/recipes-devtools/python/python3_3.13.2.bb
> index 7c36fd92ed..f86c150534 100644
> --- a/meta/recipes-devtools/python/python3_3.13.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.2.bb
> @@ -36,6 +36,15 @@ SRC_URI:append:class-native = " \
> file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
>              "
>
> +
> +# Default optimization level when running the Python interpreter (`-O`
> flag)
> +PYTHON_DEFAULT_OPT_LEVEL ?= "0"
> +
> +SRC_URI:append:class-target = " \
> + ${@'file://0001-Use-optimization-level-1-as-default-for-Python.patch'
> if d.getVar('PYTHON_DEFAULT_OPT_LEVEL') == '1' else ''} \
> + ${@'file://0001-Use-optimization-level-2-as-default-for-Python.patch'
> if d.getVar('PYTHON_DEFAULT_OPT_LEVEL') == '2' else ''} \
> +"
> +
>   SRC_URI[sha256sum] =
> "d984bcc57cd67caab26f7def42e523b1c015bbc5dc07836cf4f0b63fa159eb56"
>
>   # exclude pre-releases for both python 2.x and 3.x
> --
> 2.43.0
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214619): https://lists.openembedded.org/g/openembedded-core/message/214619
> Mute This Topic: https://lists.openembedded.org/mt/112186757/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

