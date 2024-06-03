Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E089CC25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 14:50:27 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.85558.1717426219107939524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 07:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QUr1PkB0;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eaa5cd9f0bso16275051fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717426217; x=1718031017; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0qUPbcPC27NnjLE24Q94bRay3GCPFC5lrzteIZ+OC28=;
        b=QUr1PkB0JDNM2FO9pgJhg8mMVvWMLpRkjE79p7JyCjZGY8PQyZHNIm0gRkQ3YHRTSX
         WQfDCUka8z89tW8ab6FaSYRMMmx8I4eBIXe8XasK3g503n9NkTroqTrlVWKDLTUywrSU
         jcpKSGMVFoE5EeEVEoQuW6yocqBL/8BSxjkxbFAlHn44xYxt9vtvi23//TmLl0JCpnRp
         K7G4yZ9p2Pk3I9nE30bZML7ybGIvQet7QlVfljPckk7LKuqQY6MH6jC57vkR7Mv0nopK
         1EbqfM2dYjOfWiQ1bSuIGZ2+N6Gr9dNheW98KOqxvk/C/+Itcemrcg8CTzUMpTrdWj8v
         VaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717426217; x=1718031017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qUPbcPC27NnjLE24Q94bRay3GCPFC5lrzteIZ+OC28=;
        b=Sym5Dk9K8vWdsGzhFRIfb3drNQR8B4r+5dQ2Nw1Zzc8WfOKHFBEkcTTRPSCdjSJh9u
         xKU1qUovzgtFiPXjPgRSeTvKv6iRFE9TgUXlV+5U1iKy7XUyEhUxF3QYr8pQVYOhiTFI
         L3YAVad7a7gZdD0OUlmK2cN1Ja/LTAX1ME1KGZ4IewH41cbVgdnZQRmnAanFTwkq+fYQ
         1Lpfi10Xjfy4pUPrnn1GQK3XVXFY9H/QDt5lboZlM1cl6Ba65HPFUeBtAWA98xaTEjsP
         65qA0nXQIi+bdLywCXzZukq1IRU0NMpDBTpLFFJ3IvwzntX/AuQG/x1vL+RzVm86zcoZ
         gFcg==
X-Gm-Message-State: AOJu0YwvwtQqao1b1SfsSmIZIhcoKl1Pn0SvVkIfTaUNzXl8g+H9mD3/
	UMfhsv943o9umGy6QnnIC/dK0U91zbaH2/YxeWU6vSruX+ueejkhECwuWojGnZ/5mRSJ0Y+TdR6
	K8EbV5LzZ0M73hTXvbXp8krZGqaO1Bw==
X-Google-Smtp-Source: AGHT+IFnkU9+hbw3+zP3OpOeqUCNoWHv/BiEoJLpm5QQoOCRWyThNaqpDQ7ZQ10R3gMoTTOWaqb8sLoSWhS8MXL1ckI=
X-Received: by 2002:a05:651c:4c6:b0:2ea:ab3b:fd89 with SMTP id
 38308e7fff4ca-2eaab3c0232mr12742701fa.10.1717426216895; Mon, 03 Jun 2024
 07:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240603144545.163535-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20240603144545.163535-1-sundeep.kokkonda@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jun 2024 16:50:05 +0200
Message-ID: <CANNYZj-CgmCG3+iCoUWV=Se8gENS7TCxOS6eLGb7RCm8nzejEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: rustdoc reproducibility - disable PGO
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 14:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200261

Wait, did you test this patch locally? What was the outcome?

Alex

On Mon, 3 Jun 2024 at 16:46, Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=windriver.com@lists.openembedded.org> wrote:
>
> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>
> The rustdoc binaries are differed on their .llvm.<hash> suffixes between the builds.
> This is a test patch to verify the PGO effect on rustdoc binaries. The issue discussion is here:
> https://internals.rust-lang.org/t/rustdoc-binary-is-not-reproducible/20027
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
>  meta/recipes-devtools/rust/rust_1.75.0.bb    | 4 ++++
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
> index 97a9c3da90..80e830136f 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -16,8 +16,6 @@ import os
>  import datetime
>
>  exclude_packages = [
> -       'rust-rustdoc',
> -       'rust-dbg'
>         ]
>
>  def is_excluded(package):
> diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
> index c66c14cc5a..4caa5892e6 100644
> --- a/meta/recipes-devtools/rust/rust_1.75.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
> @@ -153,6 +153,10 @@ python do_configure() {
>      rustc = d.getVar('RUSTC_BOOTSTRAP')
>      config.set("build", "rustc", e(rustc))
>
> +    # Support for the profiler runtime to generate e.g. coverage report,
> +    # PGO etc.
> +    config.set("build", "profiler", e(False))
> +
>      cargo = d.getVar('CARGO_BOOTSTRAP')
>      config.set("build", "cargo", e(cargo))
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200260): https://lists.openembedded.org/g/openembedded-core/message/200260
> Mute This Topic: https://lists.openembedded.org/mt/106463035/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

