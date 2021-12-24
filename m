Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD05C433F5
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 05:51:17 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web08.42403.1640325073672346355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 21:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F4mk/uYX;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id v4so4256338qtk.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 21:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JKM0M06CnSEZxWcT7RZwB4p0BJhcIowSr0NL2JjyI/0=;
        b=F4mk/uYXH5dVoveYFrL2+Akc1gKJZOimycP53ZvPB4kY9i3PLQouTLMOJpTDAxKzIR
         ZLs1UI9X+kDLJDr1QoGXWldj76uXT2GnzaE6ne0QPLn38FVT4AFKN/AdORCGYdHt8sQt
         FS2INy8XpIwajNYaXx33O9xctgNauw6M6GgpQyIxnTxQt5i+KUUio92JlsgWunkgG46h
         0u+bpCdkfl9IBPtFAIZfSQBbLd8dRwGjn3mGV9UQz0dhPq206CAkf7ToxV6Q6NzInG01
         OIfAbq6n5nN2DrugHuL1T74yN1kPZgjF4gjGzAkVffKjOkYOB5bRyQXBVfdKcgghSQHW
         Y4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JKM0M06CnSEZxWcT7RZwB4p0BJhcIowSr0NL2JjyI/0=;
        b=Kh9/AR1Sl70OksypcHtvU79IKdx/zJzIElZDF+k7d2jLLK23/KPPkRAYwEFjHStE5F
         KHWKlmBKe7CLYBD/5B7rlYiC2j58c8OYdo1hOYo77GAiPox5kygLZFxubyP632LXOaHK
         o5iR2UHU8Jm5rejEEfAQ9UwMRuQ4IhbaRimazntsa7AMGTTrm2ZP0EPoM0QNoHgwiwhX
         yvBW1zw0MTDJXsBsUj+q31hD1XDDJDSyAbIRy3j7EzRfbekRjYTvDX8j3Sr0DasZnJBy
         ej5s8pfDK5e4iLUqgq2oOHCbF0THjl/+xNz4qL2AckE+wzYRBltkQxHx65XWGpr7v/4n
         5CHA==
X-Gm-Message-State: AOAM530JarYu/zzgq0+T9Mbtx8aLr//rSM8rGYqr/GrW5+1+8hoa6WMu
	m8a/yqek017f5bOOmK0K16GgiOYoAcejd/vA2nw=
X-Google-Smtp-Source: 
 ABdhPJzBro1DbkilI+/2QXJ/u86KsXxOeJBNquH/BwBGMmfRmyYnhv8QakSbY0QMrUmdgI1sNofVV2lpD5E3wDNDpZg=
X-Received: by 2002:ac8:7f4d:: with SMTP id g13mr4513835qtk.215.1640325069817;
 Thu, 23 Dec 2021 21:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20211223122551.537927-1-andrei@gherzan.com>
In-Reply-To: <20211223122551.537927-1-andrei@gherzan.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Dec 2021 21:50:44 -0800
Message-ID: 
 <CAMKF1soJgvom8__9L3C3qXwWUh2owFQTCb=ZTQXZXuLfi2PjaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Fix compile of gcc plugins
To: Andrei Gherzan <andrei@gherzan.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bernhard.rosenkraenzer.ext@huawei.com>,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 05:51:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159993

On Thu, Dec 23, 2021 at 4:26 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Without this, compiling gcc plugins will fail with an error similar to:
> [...]
> fatal error: ./config/i386/linux64.h: No such file or directory
> [...]
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 +
>  .../0001-Fix-install-path-of-linux64.h.patch  | 33 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> index e352c958de..f07a5be507 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -59,6 +59,7 @@ SRC_URI = "\
>             file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
>             file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch \
>             file://0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
> +           file://0001-Fix-install-path-of-linux64.h.patch \
>             file://0001-CVE-2021-35465.patch \
>             file://0002-CVE-2021-35465.patch \
>             file://0003-CVE-2021-35465.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch b/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
> new file mode 100644
> index 0000000000..55f78eaa0b
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
> @@ -0,0 +1,33 @@
> +From 58211c7ceb0510b2a11a7f1da3c7fa968c658749 Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei.gherzan@huawei.com>
> +Date: Wed, 22 Dec 2021 12:49:25 +0100
> +Subject: [PATCH] Fix install path of linux64.h
> +
> +We add linux64.h to tm includes[1] as a relative path to B. This patch
> +adapts the install path of linux64.h to match the include in tm.h.
> +
> +[1] 0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> +
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> +
> +Upstream-Status: Inappropriate [configuration]
> +---
> + gcc/Makefile.in | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> +index 9b17d120a..d175ec4e3 100644
> +--- a/gcc/Makefile.in
> ++++ b/gcc/Makefile.in
> +@@ -3693,6 +3693,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
> +         "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
> +         | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
> +           base=`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
> ++        ./* ) \
> ++          base=`dirname $$path`;;\

this needs better explaining, and I have a hunch that it could be a
broad brush too,

> +         *) base=`basename $$path` ;; \
> +         esac; \
> +         dest=$(plugin_includedir)/$$base; \
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159978): https://lists.openembedded.org/g/openembedded-core/message/159978
> Mute This Topic: https://lists.openembedded.org/mt/87916998/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

