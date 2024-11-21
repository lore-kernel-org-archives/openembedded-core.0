Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B73DD78764
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 14:17:13 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.11714.1732198629030891000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 06:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mdo/CR/f;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6d41864d745so5667946d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732198628; x=1732803428; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj3CzpymanB+7fq/EWxt26jxpQu7/uOR+SqTI9Rl/2w=;
        b=Mdo/CR/fzIptB6H8wm/M0XhupmuQeXtZH5p+4dIiZngIYXtLe6T2m1AQ2xY4ZUnhRv
         mLo04Z6X5tX8EsfuXGDD4SZJTDe9V0wXHVADPkxZcVMYIwcRIQCktu5trHFMCnXu5w7R
         cywEHB2afPM2p7TvJRk6kZOPd09FsPqsSpBSu9zvL4MitPDE4eRCs8nVCK8X9GUs4Ioe
         QJFdcgxRqNixdOcwz8J5r0d9fSCiyn8hFVxHiPcbXGfl9Cz+LXuIg9qf9Z/5vdYR9qBh
         rfLDHU3E6HDcZigQ2R7GLuJBBoK5dpJ9MRG834EPqbT51Pc8ToSjxpZq75Pna1B6aWHB
         DAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732198628; x=1732803428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yj3CzpymanB+7fq/EWxt26jxpQu7/uOR+SqTI9Rl/2w=;
        b=h4zlRykvnKonMo78FGVED0bYN0BSvT+lNbZ6u8/HMit2nycS69aClI83vX2RGcfQL5
         tFnVczdaH33Zqcj6+FKDGtL/kboB4iYm5UdCtUoEEKD+0ZT6q+ZxoAk9IBpAXqkjrmPr
         UeiOd49Q5Y0n77POiLTOSo2QR7svWAIP4gW6cExwwXlDavTOudP2Ir/1+gcUs3bT0NS2
         onqFM1vRM/ClYDFvvPATUGCeYST33PbGnN1gNzAJExu5YAlRdASQe8ogFIBd39ow6gCb
         WSLzBqIXOjICvqlrcNbJ1R9zrxmcGYoX+1yExDXmt+1HU8QbAR0XkjjH1I1DoHQn3X7p
         P8fg==
X-Gm-Message-State: AOJu0YxTEGNkHV41Xye9USOXypgLNPeJg7jfZ/U0ZvnndIBZRmFZ7zZY
	F7tTzgdZXhwSl/ZKP92Xv/FKU+i0KSSnBfJhUq2AM0BAl/BJvGc7/bqsNh8FBDlUD0pB81BRWVf
	/u0bGtbdGEQeioCHNeB/yHxq9vlWQiA==
X-Gm-Gg: ASbGnctshnXfefKCemyjPGZXCKl2ZYO2M0GZ2ed2l07hMHn2CAssAblqPzBryYWvUJF
	oR0v3ujJhQWcl5OtxY4T7kOTIp1BdiNlDY/Ipc9EOMXqUsJU5uH7Nq0NZZMpYzUQDBQ==
X-Google-Smtp-Source: AGHT+IE7yiAXmxeT+w1xEMA6ZT2tVwBvVEIgx65l95GHHjrsr6uGWOytJuIqcNo1+wsXyxB+o93ARhCpnUBA2iZpCis=
X-Received: by 2002:a05:6214:2688:b0:6d4:f77:613c with SMTP id
 6a1803df08f44-6d43780e434mr78191756d6.25.1732198627916; Thu, 21 Nov 2024
 06:17:07 -0800 (PST)
MIME-Version: 1.0
References: <010101934edde36d-f9e0fb82-e00b-4a0a-a148-278f0f5b895b-000000@us-west-2.amazonses.com>
 <20241121141411.4476-1-schonm@gmail.com>
In-Reply-To: <20241121141411.4476-1-schonm@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Nov 2024 15:16:56 +0100
Message-ID: <CANNYZj9gYOPtAvptPQsB714Yykhj2xkEt1VqioOqSVP-BrFuvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Update
To: schonm@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 14:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207538

This was presumably done to appease patchtest, and is actually worse
than the first attempt. 'webkitgtk: update' is not a good commit
header at all.

What patchtest says is not a hard requirement; if a commit description
isn't actually necessary, then there's no need to try to fake one.

Alex

On Thu, 21 Nov 2024 at 15:14, J. S. via lists.openembedded.org
<schonm=gmail.com@lists.openembedded.org> wrote:
>
>  Add backported patch to support ICU-76.1
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../0001-Support-ICU-76.1-build.patch         | 36 +++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.44.3.bb  |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch
> new file mode 100644
> index 0000000000..31535e7ae2
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch
> @@ -0,0 +1,36 @@
> +From 57b80aa00be614218552fda67b2bf8d535b4f4cf Mon Sep 17 00:00:00 2001
> +From: Jason Schonberg <schonm@gmail.com>
> +Date: Wed, 20 Nov 2024 11:05:52 -0500
> +Subject: [PATCH]  Support ICU 76.1 build
> +
> +https://bugs.webkit.org/show_bug.cgi?id=282120
> +
> +Reviewed by Yusuke Suzuki.
> +
> +In ICU 76.1 an additional macro `U_SHOW_CPLUSPLUS_HEADER_API` was added to
> +control visibility of the C++ API within ICU. Set this value to `0` since WebKit
> +wants to only use the C API.
> +
> +* Source/WTF/wtf/Platform.h:
> +
> +Canonical link: https://commits.webkit.org/285727@main
> +
> +Upstream-Status: Backport [ from webkitgtk-2.47.1 https://github.com/WebKit/WebKit/commit/63f7badbada070ebaadd318b2801818ecf7e7ea0 ]
> +
> +Signed-off-by: Jason Schonberg <schonm@gmail.com>
> +---
> + Source/WTF/wtf/Platform.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
> +index 23070df2..51a8dce9 100644
> +--- a/Source/WTF/wtf/Platform.h
> ++++ b/Source/WTF/wtf/Platform.h
> +@@ -115,6 +115,7 @@
> + /* ICU configuration. Some of these match ICU defaults on some platforms, but we would like them consistently set everywhere we build WebKit. */
> + #define U_HIDE_DEPRECATED_API 1
> + #define U_SHOW_CPLUSPLUS_API 0
> ++#define U_SHOW_CPLUSPLUS_HEADER_API 0
> + #ifdef __cplusplus
> + #define UCHAR_TYPE char16_t
> + #endif
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
> index 00431407fa..2bb6316d89 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
> @@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://t6-not-declared.patch \
>             file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
>             file://0001-Fix-build-issues-with-latest-Clang.patch \
> +           file://0001-Support-ICU-76.1-build.patch \
>             "
>  SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207537): https://lists.openembedded.org/g/openembedded-core/message/207537
> Mute This Topic: https://lists.openembedded.org/mt/109703951/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

