Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B6CC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 08:42:19 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web12.5440.1646210536169861681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 00:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CXdbxNCd;
 spf=pass (domain: gmail.com, ip: 209.85.217.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id i16so1037996vsb.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 00:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zoAfSY5VeUtyA1u7dGFHnE49EtwKopKCdFwm1ZJO1pk=;
        b=CXdbxNCdj43sG0gbrtKuiYD2njVdBdgZB5YGWCi9zcS+NmTwPtA8IzcgNKrxw0QoBi
         BovjLY54exEobQQSDP9HkXPrYrHwqE2i4jraio3mY12yUt+oyFBDlUn+HkXJl3NzAYYU
         qVmzWdcgvcI/Tweb0lwQXOXtST3kXohwTkvOgFgq1N94KjOFSP3W5OSBeHTttIQrof3A
         N2m+H/Sd3Axa27fC75C0aL2N3uM3WHh05QutzbZ10NKXx1cttV+pnUedkT1OSNyVpmDP
         DYvOFhzCY5zfLWWPR7PCR+pu/+vGF+F7Vqp3fr7G4EaDjq1luwxPOLURj/tYauKlb6mc
         ZbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zoAfSY5VeUtyA1u7dGFHnE49EtwKopKCdFwm1ZJO1pk=;
        b=EbymjfAuRs5ndMk78R6zTnNN1GjZ8hv/LV83+zR8ep3gReryOnbhQ3WwUQU7oAoESr
         OH6VBs7/431OWy5A0VomBSHmgq5hrdE4FEIYzD+Se34t2pDcwYOnWu9eKpvLNoCo48lE
         T7jqv0yx7TDOa+S8ilLJngVRnVuosJxB2fBDQLRaXEOa7tu7rpe4MjGNU8Hh9A/csjh5
         p6ewekUUYi9g7Ws5JzOlY5RF5baTxp/RNLP4SFGxnRDqwNt4pFRXc8l3iX1MuaFlU3S4
         YH6avjpMVnO119cYLbFmDuSlBIXY9pJLYAUU44uLcWjL8aj+Nvj6U9NoW/1HcgGz4toF
         iZyw==
X-Gm-Message-State: AOAM531erUwsYmZs1aQzQz3OCCu2tTnmV6WMEheKcJPJgpqe3lxKd1IN
	X1yVWfm98I1KaBatGGDxLxdMqyiQFOmnnwPISx+z/Q4u
X-Google-Smtp-Source: 
 ABdhPJxCcbBgTK9k1oBQQq3XM9rGFThhCCkC8WurZ9D7eNPKmqb+dbtHg/hZIY8jEc3Dix4GohrlZWI9YSP5qFK7Aqo=
X-Received: by 2002:a05:6102:827:b0:31e:bdcf:733e with SMTP id
 k7-20020a056102082700b0031ebdcf733emr1747806vsb.73.1646210535224; Wed, 02 Mar
 2022 00:42:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646204967.git.liezhi.yang@windriver.com>
 <d4b25c6c4a2a48da96da92bd03fe060e0cb37547.1646204967.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <d4b25c6c4a2a48da96da92bd03fe060e0cb37547.1646204967.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Mar 2022 09:42:03 +0100
Message-ID: 
 <CANNYZj8Qd9uDCKQ2M_X35O__2MeiSJEP9A1J9TJzZsi+y6OCOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] perl: Makefile.PL: Fix _PATH_LOG for
 deterministic build
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 08:42:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162596

Can you file a ticket upstream for this please, and include the link
in the patch?

Alex

On Wed, 2 Mar 2022 at 08:13, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> It checks host's path such as /dev/log and uses it, this doesn't make sense for
> cross build, and it causes undeterministic, for example, the contianer os
> usually doesn't have /dev/log which leads to a different build result since
> other host usually has /dev/log, so make it always use the default value to fix
> the issue.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...Makefile.PL-Fix-_PATH_LOG-for-determ.patch | 34 +++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
>
> diff --git a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
> new file mode 100644
> index 00000000000..f6bcbce6856
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
> @@ -0,0 +1,34 @@
> +From a73fff1fcf0def4ce93964f1b63fe3ad0967259d Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Fri, 18 Feb 2022 09:44:26 +0000
> +Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
> +
> +It checks host's path such as /dev/log and uses it, this doesn't make sense for
> +cross build, and it causes undeterministic, for example, the contianer os
> +usually doesn't have /dev/log which leads to a different build result since
> +other host usually has /dev/log, so make it always use the default value to fix
> +the issue.
> +
> +Upstream-Status:Inappropriate [OE specific]
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + cpan/Sys-Syslog/Makefile.PL | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/cpan/Sys-Syslog/Makefile.PL b/cpan/Sys-Syslog/Makefile.PL
> +index d09ba69..d44e58c 100644
> +--- a/cpan/Sys-Syslog/Makefile.PL
> ++++ b/cpan/Sys-Syslog/Makefile.PL
> +@@ -130,6 +130,8 @@ else {
> +     $_PATH_LOG = "";
> + }
> +
> ++# OE specific
> ++$_PATH_LOG = "";
> +
> + # if possible, generate the code that handles the constants with
> + # ExtUtils::Constant, otherwise use cached copy in fallback/
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> index a97da872032..8a1db7ed359 100644
> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> @@ -20,6 +20,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
>             file://aacd2398e766500cb5d83c4d76b642fcf31d997a.patch \
>             file://ea57297a58b8f10ab885c19eec48ea076116cc1f.patch \
>             file://5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch \
> +           file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
>             "
>  SRC_URI:append:class-native = " \
>             file://perl-configpm-switch.patch \
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162590): https://lists.openembedded.org/g/openembedded-core/message/162590
> Mute This Topic: https://lists.openembedded.org/mt/89496472/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

