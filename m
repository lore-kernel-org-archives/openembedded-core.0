Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C92C38142
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 16:50:00 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.47398.1674492596465155419
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 08:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nRCYK4gI;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id u19so32124808ejm.8
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 08:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DNeSbSpd4ecc6CfzxJwbRzH29k8rQehfg2qxeVLGvAI=;
        b=nRCYK4gIfwUg3CcIvleahwl04rQdstquAV0iXh76ppoN1hXw5jhSKJZ+vnA8ycD/At
         eygK49yd0bKTEV2QdUO6gMdYuwDtO9m2oDeA6IOVyP/HacfDOorf6U0XqSMS1VuH4Byj
         zILZoMLw9T7/zEKuZM4ep+bU3koasNQqqJv6RfUziV/j897iji315VDGj+WjqG7Ab8dm
         OK6YPhnkMBtA0RBXOvJXg1EL70PH4PLwXfiszMhSg7J1AEDZdewUoMEqK0O7s9mpaFUq
         ZyH4u3wgqR6f/wB3zd3bmgAfPuZ7zqQK2uHC7JMYIb+uqPrWtZFeCJdG68GPjx8irpVk
         8Tyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNeSbSpd4ecc6CfzxJwbRzH29k8rQehfg2qxeVLGvAI=;
        b=5Wkh+0rNezHPoHDXYLjRGQMgJeAVR5WR9q8FYZ3pI0TSqBKbQDTOqdj9ZsEdoYGhj3
         +vospFUBYnjm+D0zHVTkCVmUeW2S7esqISJXN30jlvzbLYh3hVjPobrv8YdJbgGGuv9Q
         pFZpzmO1tDkGRKcm/01iXedQNMd/3rFwLMiH4pETxy+58Bse+eyCvdnPXiwepl6f67h8
         ThKCqYacmGBgGHNU3Hue9Xj6Dk4xpsEvoi2WI3RxbD+6XgqsXEXUNoP72n5y6IyVDYRa
         PoVhUkajSnuHFb5l1IDFfekyLvnrRtIUKw9VSpDYz4P2JdOzDGjXfLxLyqS8OkF2EyUI
         rJwQ==
X-Gm-Message-State: AFqh2krHs9tvavpCpjgQliSpCLL1ZgrOf91unWDlZup1LGVtXx1BuSTj
	+VM7CTiU29fHMuKpDyIEV5QPLd34uEJLxl4wd2J3sg==
X-Google-Smtp-Source: AMrXdXtdMolP/iXHtGDE82/ZNTa5yWXV83+OzWVso+Xdf7kojL7seg6t/YSzcUIMw2RT4AwWX5rNMPvzOACG3mfovF0=
X-Received: by 2002:a17:906:eea:b0:872:b01f:2e1c with SMTP id
 x10-20020a1709060eea00b00872b01f2e1cmr2233211eji.406.1674492594523; Mon, 23
 Jan 2023 08:49:54 -0800 (PST)
MIME-Version: 1.0
References: <20230123163404.2725145-1-vkumbhar@mvista.com>
In-Reply-To: <20230123163404.2725145-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 23 Jan 2023 06:49:43 -1000
Message-ID: <CAOSpxdYhGbYzOwnL7BX7aMHYvpE9gPN9fg5Hyk8jo9MqM7vz2Q@mail.gmail.com>
Subject: Re: [OE-core][langdale][PATCH] openssl: fix CVE-2022-3996 double
 locking leads to denial of service
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 16:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176312

Hi Vivek,

You sent two seemingly identical patches for langdale.  Was one
perhaps intended for master?

Steve

On Mon, Jan 23, 2023 at 6:34 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> From: Vivek Kumbhar <vkumbhar@mvista.com>
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../openssl/openssl/CVE-2022-3996.patch       | 43 +++++++++++++++++++
>  .../openssl/openssl_3.0.7.bb                  |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> new file mode 100644
> index 0000000000..6d70b323d1
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
> @@ -0,0 +1,43 @@
> +From 7725e7bfe6f2ce8146b6552b44e0d226be7638e7 Mon Sep 17 00:00:00 2001
> +From: Pauli <pauli@openssl.org>
> +Date: Fri, 11 Nov 2022 09:40:19 +1100
> +Subject: [PATCH] x509: fix double locking problem
> +
> +This reverts commit 9aa4be691f5c73eb3c68606d824c104550c053f7 and removed the
> +redundant flag setting.
> +
> +Fixes #19643
> +
> +Fixes LOW CVE-2022-3996
> +
> +Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/19652)
> +
> +(cherry picked from commit 4d0340a6d2f327700a059f0b8f954d6160f8eef5)
> +
> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/7725e7bfe6f2ce8146b6552b44e0d226be7638e7]
> +CVE: CVE-2022-3996
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + crypto/x509/pcy_map.c | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/crypto/x509/pcy_map.c b/crypto/x509/pcy_map.c
> +index 05406c6493..60dfd1e320 100644
> +--- a/crypto/x509/pcy_map.c
> ++++ b/crypto/x509/pcy_map.c
> +@@ -73,10 +73,6 @@ int ossl_policy_cache_set_mapping(X509 *x, POLICY_MAPPINGS *maps)
> +
> +     ret = 1;
> +  bad_mapping:
> +-    if (ret == -1 && CRYPTO_THREAD_write_lock(x->lock)) {
> +-        x->ex_flags |= EXFLAG_INVALID_POLICY;
> +-        CRYPTO_THREAD_unlock(x->lock);
> +-    }
> +     sk_POLICY_MAPPING_pop_free(maps, POLICY_MAPPING_free);
> +     return ret;
> +
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> index 45fd1de2fd..1842148592 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> @@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
>             file://afalg.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> +           file://CVE-2022-3996.patch \
>             "
>
>  SRC_URI:append:class-nativesdk = " \
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176311): https://lists.openembedded.org/g/openembedded-core/message/176311
> Mute This Topic: https://lists.openembedded.org/mt/96477598/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

