Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472FCC48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 12:06:59 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.96643.1709554012936997160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 04:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NstgKeBx;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d22b8801b9so60443841fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 04:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709554011; x=1710158811; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SUsMvwehxjlg64rHafCdWAD2dKoC9mGkFJcL+Pof6ws=;
        b=NstgKeBxmbhUS+K8tWdF0JjEV8xZdb9gAobY0pm8yjEaq+2h+lfxBmNo/RKhygrMp5
         O19baUNHOM1l/COpqIkEgSBgUg0JjkC6zVcSW6K7yxUyFr9548y19sXpySOziZceFgRe
         h9rE3cgaLhq8iQtYcmImXDp9G8GQOW8tlf/3swpoK3BxW6FY6WIVz3/GEhKtndPjGPgZ
         9YDtpcgMeLhZ5xsBchWSwE/uvehogLJUp83cv4Qr1W7UeVY4yddeBmiSmLMX/ObfFFnn
         w0icLeVg3lxwQYgiTL72i7PasWu9eBC809mYiiGpoQMdCQthFcPeZCXXUbW27ziLNkeI
         JTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709554011; x=1710158811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUsMvwehxjlg64rHafCdWAD2dKoC9mGkFJcL+Pof6ws=;
        b=YfdGXmmcKyLDCReJS7KV6KNeleZbOA5hDh7yz3UQCHHoyDXFswhbJSniyIF8XSmT+i
         gFJ+iZRKJrPuz2lR8R7wYeQOOQoEbqvpglj8q975bt/mOXpqkwc5G+miwG3TLRo7wqRZ
         WHjSCRPV4c3wyMwQpMzl14wcf5rHKESbyY4urRHUPOntPBLNOWcjzXaeGqVjUaARINsb
         Vb6vAJVHc70Kmi086GhMN1WTMG7MxT290NG5IXzXD6H2blHXch21dYKc87AWCV1BuUFc
         OU17BdsISQGDVOetC6t4Ll+DKZ182RRfdMelo74wdtJUTB+H/KVKJSMQ74yxSjCyu575
         r9QA==
X-Gm-Message-State: AOJu0YzJ249q5SeN3R217kF2QSMdV0JoQb3m5SfBQP+JkkVGgh8XJYJ9
	0XXtaaTfDCQuY6hu2Dlx4IxbkXL55wo9Wzm3rO2sOhfQjxAeD8WPQiYMKUCaAUbAiqg6tgVLaM0
	wdDvr9Ed5xAZKCDqwfqL8OXS+LRQ=
X-Google-Smtp-Source: AGHT+IEQVWPjB89g6tNF0cNBd2QIGQF8fFaDcOaw+26jssJy/f2Y69GLN44fzbvkByPEdFIZKDh9NgrNzx8Z9/hDOgI=
X-Received: by 2002:a05:651c:d4:b0:2d2:9b00:2289 with SMTP id
 20-20020a05651c00d400b002d29b002289mr6176703ljr.29.1709554010866; Mon, 04 Mar
 2024 04:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20240304120153.67234-1-pramanik.souravkumar@gmail.com>
In-Reply-To: <20240304120153.67234-1-pramanik.souravkumar@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Mar 2024 13:06:39 +0100
Message-ID: <CANNYZj9wsdwSAnguu7i=-UXz5QC_SGRbsK4c75SpULnnmP-4gQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] libseccomp: Add back in PTESTS_SLOW list
To: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 12:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196596

This needs to be tested on master, and submitted for master first.

Alex

On Mon, 4 Mar 2024 at 13:03, Sourav Kumar Pramanik
<pramanik.souravkumar@gmail.com> wrote:
>
> Enable libseccomp-ptest in PTESTS_SLOW as
> all tests are passing now.
>
> Signed-off-by: Sourav Pramanik <pramanik.souravkumar@gmail.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 5c6a30635f..f39b048b21 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -88,6 +88,7 @@ PTESTS_SLOW = "\
>      glib-2.0-ptest \
>      gstreamer1.0-ptest \
>      libevent-ptest \
> +    libseccomp-ptest \
>      lttng-tools-ptest \
>      openssh-ptest \
>      openssl-ptest \
> @@ -112,7 +113,6 @@ PTESTS_PROBLEMS:append:riscv64 = " valgrind-ptest"
>  #    libinput-ptest \ # Tests need an unloaded system to be reliable
>  #    libpam-ptest \ # Needs pam DISTRO_FEATURE
>  #    numactl-ptest \ # qemu not (yet) configured for numa; all tests are skipped
> -#    libseccomp-ptest \ #  tests failed: 38; add to slow tests once addressed
>  #    python3-numpy-ptest \ # requires even more RAM and (possibly) disk space; multiple failures
>
>  PTESTS_PROBLEMS = "\
> @@ -124,7 +124,6 @@ PTESTS_PROBLEMS = "\
>      mdadm-ptest \
>      libinput-ptest \
>      libpam-ptest \
> -    libseccomp-ptest \
>      numactl-ptest \
>      python3-numpy-ptest \
>  "
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196595): https://lists.openembedded.org/g/openembedded-core/message/196595
> Mute This Topic: https://lists.openembedded.org/mt/104720371/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

