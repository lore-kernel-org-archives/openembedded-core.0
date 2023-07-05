Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3210CEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 18:24:25 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.2572.1688581459263691123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 11:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IEo3rD7b;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fba03becc6so1349483e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688581457; x=1691173457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IBx256f7Q6EdNnnJOCFhsvEpu/pe0Rmbiocu4A9ZkzU=;
        b=IEo3rD7b2ULP33TLeBqUnZ2UbjbnwYk1uM+mqbBBVSLOk9UtSuqw6B6HuOvrzOZTfz
         6uIHG2L9iqH0B0EljTWk1SaUHjbKRSF+2SZm7/F8f5/0aXq92YrFjVM1J0TxzkdWJlkW
         Efn3eInpkZcqs0GkiWgIn+l9/aRs9RMLg2OtPV2q+I+lZA+WBYmgoZg7d/XQ953w9Qfx
         bSSyrmHusILA3hV6xkzl2y9h1NriO4XOxscfEcuk8iMA+qFHofMmWC62kZ8bH9EM5mlL
         knXqpVRcbfR/zCjtzEYnNHGHBsqjOvF44H8Col+Bqno9c5a/z48nHVjrvVA6fxnuhOoj
         WIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688581457; x=1691173457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IBx256f7Q6EdNnnJOCFhsvEpu/pe0Rmbiocu4A9ZkzU=;
        b=OzNUkCenCowDfDkHKgYqxY++U7L9B6IGrpUI8jIuykHCAd6O6wt1m4oiRRGYzRTc7j
         F2mshAIro5Y7lr6nhesE2ufMfb0BN6SsY1S9jNbKVhvghyS/5BOzegV1LnRUMFS0cR6q
         X99C3jdymBoAPoHdOup8wfN3KDfrBtJh3jpTkpyVJgWN47b7m2Oi8dzxF3dKzF9aNL7a
         OVixfoVKHo1kThSm4b7YPp/EbtnJMQjyNtaeNit0jEc5L/QNjqqiBGWcAyqb95T2LcHB
         0pnV6s5Uxg+jlOma22udjFmUE7eB0Zk8P3hb85SwN+Ie8kF+23W1bAyl3Ly2NFxXA7kl
         hn1A==
X-Gm-Message-State: ABy/qLbV7pwE1b/amPkhXx7r04WdadF6GAm7h99EDOFusGt9unylduMk
	8UA5vHLgMSXYUi20sYt7NoZr5Nav/+omt75fgZA=
X-Google-Smtp-Source: APBJJlF+o5QLfnA5bJ8UCb7o2HbWq+Rkx2r5yNKAAbLcog/mvuaZR4BG0pl90DZnMHetrE5nBbQc09j3uKDWKgUWAM8=
X-Received: by 2002:a05:6512:2509:b0:4f7:6462:e036 with SMTP id
 be9-20020a056512250900b004f76462e036mr1198872lfb.11.1688581457133; Wed, 05
 Jul 2023 11:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230705180358.382955-1-jose.quaresma@foundries.io>
In-Reply-To: <20230705180358.382955-1-jose.quaresma@foundries.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Jul 2023 20:24:05 +0200
Message-ID: <CANNYZj-s4hu9q+j1rgHw5rndJzBn_WbX+z_tZkA9boC5HP-g8w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] openssl: check the existence of the PERL5LIB path
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 18:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183902

There is no need to export the other two variables, they can stay as they were.

Alex


On Wed, 5 Jul 2023 at 20:04, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> When upstream change is better to fail or removing the PERL5LIB
> if they are nott need anymore.
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/recipes-connectivity/openssl/openssl_3.1.1.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
> index f5f3f32a97..0dce7f71bc 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
> @@ -137,7 +137,10 @@ do_configure () {
>         fi
>         # WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
>         # environment variables set by bitbake. Adjust the environment variables instead.
> -       HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
> +       export HASHBANGPERL="/usr/bin/env perl"
> +       export PERL=perl
> +       export PERL5LIB="${S}/external/perl/Text-Template-1.46/lib"
> +       test -d "$PERL5LIB" || bberror "PERL5LIB '$PERL5LIB' not found!"
>         perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-3 --libdir=${libdir} $target
>         perl ${B}/configdata.pm --dump
>  }
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183900): https://lists.openembedded.org/g/openembedded-core/message/183900
> Mute This Topic: https://lists.openembedded.org/mt/99970131/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

