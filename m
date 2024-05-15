Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AFFC25B79
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 12:57:32 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.14331.1715777851591737655
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 05:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FN/NCNo1;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2dcc8d10d39so79458661fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 05:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715777850; x=1716382650; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ncctibj638IPZUjYgz0vO7J/lMz6SXGjCgWycz/U/B4=;
        b=FN/NCNo12Cyu6XUQB3bjpQSEDm7RdpWumsObbszJ1vdlMT1D/avj1wGrMQWMkAWj73
         YgWwFljER+Cv+3uSkNv7GtizLPvWM+rQdKh24IjcrkPaF/DkE+TGHQ1WNFLAgv9zbL/G
         HaqNPn7tZp/tdIygPBQgQEn3Qo4re49grAFizTZvF0+2wbYrJkU7XEV8yQf3c9ubQpAs
         uTtYBXzVZOjxyizWwkQPxK69Ee6jZB4ymcnyHpg6TxHB5N44luV3FGe37he2wOhjcSRz
         vTrJhLtZBDIZ6MsznNBYESqQHlGnza6QeaTvNE/7Ee+lc3PvRAdJRV6gq0Ar1d4lwfR3
         AKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715777850; x=1716382650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ncctibj638IPZUjYgz0vO7J/lMz6SXGjCgWycz/U/B4=;
        b=CF23po2QqGWyk3l2V9SAEC3UWkK32VHnFIqGmLtf78kGHNmvOVxw0CSTXwFOCkFJzQ
         2B+15sIFNUOKYgcFsq6UIsYzKxPihCZlICFZaOzSDjHVoIwrKT10rL+5aCOMh0PN+mL8
         x/qnvLxV2v5LLeZI9Ti2Vy3ItupQdVkHy6E9TN09LEPjIBPnPrGLNUBG1KShFF1l0Tkf
         TmrBsbH9pnU40v1y5f7PTfHKqwPGFz4xk2dcqjs/+4brYJnSXPO/whyvD9FC4R9Z3vXA
         mVS8Buz2VDBLj6iVM7K2hAYgzfDO/xIhF/slve0ErDqOFG4T+nDfUB6TFMbxeWS5JFWl
         jNnQ==
X-Gm-Message-State: AOJu0YzjnQbPyZq3pvtoFg/rY3Myq72/6THDhdIYpXFhUimysGV6pqH2
	VFYs9IhJGp0KU8F6ZUGL9UF16taiKRt5tsYWDWmXCZL4gzOTzsdpE1u3MX48zn9DZR0S0sjZHLU
	/6QsBjQuH29T4Ju6hm9Cf+BB9WMyojQ==
X-Google-Smtp-Source: AGHT+IERxAve/uI54bmUlRLLJxOZP08EZdzyu7ydicag4sBzX4wAEmGWMTLd64wQiNTP6l6YJuQrg1rS1lwDiOQ507c=
X-Received: by 2002:a2e:a411:0:b0:2e5:6833:7c3f with SMTP id
 38308e7fff4ca-2e568337c5bmr85916951fa.12.1715777849505; Wed, 15 May 2024
 05:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-i90gLUfdk51Now0HY+=RCNkg8ugr2qcK65xXS+AypZg@mail.gmail.com>
 <a325fd9d7b923e76e0cba8786c9a4dcda81fd52f.camel@linuxfoundation.org>
 <a84b5ef9-2314-4ba7-99d0-b5292298f736@windriver.com> <835b59367fd827253789514b77e042fc99b55593.camel@linuxfoundation.org>
 <17CF26B1EA08DEA4.31802@lists.openembedded.org>
In-Reply-To: <17CF26B1EA08DEA4.31802@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 May 2024 14:57:17 +0200
Message-ID: <CANNYZj_95+h=7FfRAy2s0r0yMf19VndFSKETWs77toKoZ4HB5g@mail.gmail.com>
Subject: Re: [OE-core] build host architecture leaking into target artefacts -
 new twist on reproducibility
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>, 
	Randy MacLeod <randy.macleod@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Shinde, Yash" <Yash.Shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 12:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199288

On Mon, 13 May 2024 at 22:35, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> The incomplete patch for this issue is here on top:
> https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/package-version-updates
>
> Unfortunately, that is not all, as file names and file sizes are now
> the same in libstd-rs, but content still isn't for some of them
> (different hashes reported by sha256sum). And in target rust both
> names and content differs.
>
> I'm out of time today to look further into it, but you are welcome to
> pick it up.

This is the worst rabbit hole of this year so far, made worse by
having to confirm every point with a 30 minute build or test
execution.

The good news is I have a fix. The bad news is that the fix breaks
rust selftest, and fixing the rust selftest breaks rust
reproducibility.

Let's review:

- pre-built cargo from upstream snapshots writes output of 'rust -vV'
into hashes used to form filenames of build artefacts, and that output
includes the build host architecture.

- we can patch this out in cargo-native and I have the patch.

- to use cargo-native we need to tweak rust's build config so that it
uses that and not cargo from upstream binary snapshot for
bootstrapping. At the same time we need to tweak location of rustc in
the same config, as they would otherwise mismatch and build will
break. I have the patch for that too, and I confirmed the target
filenames start to match with it.

- this breaks the rust selftest, as it is now looking into native
sysroot instead of rust-snapshot/ and can no longer find rustdoc there
that it needs for the tests

- rustdoc is present in binary rust snapshots but not in rust-native
installations. Why? Because it used to cause reproducibility problems
(and still does), and the purported reproducibility fix simply
prevented rustdoc from being installed:
https://git.yoctoproject.org/poky/commit/?id=321aebfa281bd28e368c684ece57867f6bd0cbe7
(the culprit is the rust-demangler line which replaces rust's default
installation set (that includes rustdoc) with just that utility:
https://github.com/rust-lang/rust/blob/master/config.example.toml#L320
)

- I don't know if pgo tweak in the above indeed makes rustdoc
reproducible, as that tweak was later reverted due to causing issues
with chromium:
https://git.yoctoproject.org/poky/commit/?id=694b85a217209787fe8c503a4b697dc6c2bfbe84

I would strongly suggest that fixing random autobuilder breakage is
far more important than having a passing test suite for a specific
component or having that component pass reproducibility, so the
proposal is:

- merge my fixes
- disable rust selftest
- re-enable rustdoc installation, as that is the default and is
expected in typical rust setups
- put rust back into reproducibility exclusion due to rustdoc
- update rust to latest upstream release (we're now three releases behind)
- and only then look again, properly, into re-enabling both
reproducibility and selftests, keeping all of the above in mind

Cheers,
Alex

