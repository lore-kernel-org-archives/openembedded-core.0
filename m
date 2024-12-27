Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFAAE7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 18:56:32 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.17636.1735325785503006166
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Dec 2024 10:56:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i47+cE32;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6dcc42b5e30so87688266d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 10:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735325784; x=1735930584; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hjgc5VMLlbe+fLOBcPpEVk8Vf6qE+7i0nY5vqIPpiT8=;
        b=i47+cE32ZT1CQrKjiSNvGKD4AcgrKlAj7o7jjWn3u8sdtMSg2YDySvRwxyenyZ0Ajc
         neKjeBlbXOlm8lHI6/89PrOPnr3n83jPNNCKU9iJ0z15hQ9HYOa2eVewFoy1q9pfG5/O
         sGtvUKfcA96tfCoM59YxjEpCzJXpXkargLs9HKSk7IRFjOudYsyDLDLt9WPQyHfuHvc9
         922Tv2bPwlxFr0z8nB4yqICxr7WPLTtnIQ2y+r/JztcOxI5nTedRX/bhW6HBqpiJlf8m
         N4o/Ja8vWz+PzivNtsOqd0hvygY0A5lyr0l3uKzSwFoqxneD5vQ6Enzu6sTKgYjFl2Pa
         jtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735325784; x=1735930584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hjgc5VMLlbe+fLOBcPpEVk8Vf6qE+7i0nY5vqIPpiT8=;
        b=XXlibqWtDwdQfq+tlEYX2gHwWDuZesE9MzT5IMqPGulal2L08FNxU3869QHl4dzLJX
         c0INb8x3teIRjTcrqqOV6EVA8L+mdDfCNT5fBNFTV3pziI5e9Y9mFxmbfPxdZdmxZxCo
         tfwVN6BbRQLOGzbYCKtvSwmOYQ5BtGAXToXbrn3230c6C64vQmIc9sMcWPaUqU+m0S2o
         E+TZt2l7iT9vtrsz9F6D4mBBVMxCucSbJc31WW600F5CQ7JMVKT1ZwF8wU4+Z02nUgd1
         jtLQJOdw8Fsl4frWpFU6kuCspAkq0MwABQLfc9dH9vxXmWgyTf5Bnu6i2fYiC6H8cNxy
         rr/w==
X-Gm-Message-State: AOJu0YwQWpthsVPUz/R2Q9qfZOzosu+QJyYqhd2bzGlv5/gBQ4rcKOV6
	UHrdfEQwNf+PYqZvautr3wk/b5a+U5y1ByD1BtT8P7ikHbh2p7Cns5/RqKTBgEQCs+N52FGc/+b
	IrNlV02D2WRtqq6qR+13aTZNzB6KxSQ==
X-Gm-Gg: ASbGncuhh2Gq4zdXSDxA4ySWnjDkoM7xUd9f2Z/y/YyHYbm4Ox/eTUpz48dIrM92iAT
	Agcj/+UsDLG/0QdlX68Gj99XFPy2PNTbssWR5G5vnp0NjTll7swiFmLLyJIMeMkTDPMAwlq8e
X-Google-Smtp-Source: AGHT+IE10BY6NudKwyBVUboVT981IPjraUlFU17y8ioUQ18zt2qORARDWSMNW8hM5omnzX+9LuA+TROCkDhsUUD/qxM=
X-Received: by 2002:a05:6214:250c:b0:6d8:8496:6b00 with SMTP id
 6a1803df08f44-6dd2339abf3mr418687966d6.35.1735325784513; Fri, 27 Dec 2024
 10:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com> <20241227065337.1257972-2-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20241227065337.1257972-2-Deepesh.Varatharajan@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Dec 2024 19:56:13 +0100
Message-ID: <CANNYZj-8a-wb6PUbqm=6MUj6jUVWJYcwcZ6X_TbkDkH9s1Q8DA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] rust: Fix for duplicate libstd.so
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 18:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209110

On Fri, 27 Dec 2024 at 07:54, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> The `do_package` task fail with below error due to multiple `libstd.so` files installed in lib dir.
>
> ---------------------------------------------------------------------------------------------------------------------------
> ERROR: rust-1.81.0-r0 do_package: rust-rustdoc: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-rustdoc/usr/bin/rustdoc)
> ERROR: rust-1.81.0-r0 do_package: rust-tools-rustfmt: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-tools-rustfmt/usr/bin/rustfmt)
> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustc)
> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/clippy-driver)
> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/cargo-clippy)
> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/lib/
> librustc_driver-fc36770e343ef852.so)
> ---------------------------------------------------------------------------------------------------------------------------
>
> To fix the redundant `libstd.so` files are removed from the usr/lib/.

What installs the redundant files in the first place? Shouldn't it be
adjusted to not do that?

Also, as noted elsewhere, you cannot hardcode 'poky', or special-case
based on TCLIBC.

Alex

