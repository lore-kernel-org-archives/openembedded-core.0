Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16137CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 20:39:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19847.1762375196677841628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 12:39:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mP0xNaMh;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so1204935e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 12:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762375195; x=1762979995; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfho8v5ray890ShA2P3hMSNPQsaJKsPXd7mNKdOnl6I=;
        b=mP0xNaMh5Sdv9LBqmDEFTfTcBw5h2Vy8BZIQq3UxRACIiniDHMqJbdqkX8mUnXj1NU
         gNIIWMu0YLKxem836YCoD25b5rVe5A7wU6eWfGdB5f5xvqxL9RWouGpLiSh4RuokwAn1
         5zJEWLKr5mDwKNQlFMmhAq/QrBd2X2o7rg/wBPsld67OMBnEYF24eYm8hUf1Y5zqBGjx
         2FvuDxmmhwW4SIIpirunPBsdOhiBmOWaxyg7iEbJGSElAXnLgwBSao3ElqKcYXY2JRBM
         T4R2BJSBJfydPqxin0UFAlBMY9sDK8xb1muzUYwv/899lHqoM4J+wYQ9vBImWw4YymU0
         zHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762375195; x=1762979995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfho8v5ray890ShA2P3hMSNPQsaJKsPXd7mNKdOnl6I=;
        b=EW2kgtAF/kb/Z2Oji+Bw++O1Q5N3k1alavzMD+voa/QI8ZbWu+oXvDmeeNhSGU3Mq+
         0+jundkM8kcLlxX3bhTsrSBwk8eUP+l/Rag/frvvA+UorPihZ5WecTLYuDuexT+ifK2w
         WM3BkKGAaP47pzV6XBJ5wDdGd9hJTKpe01bYwdoH0IaCOcm0vST+7Hizc4iD8wZDU5hf
         RVD6vZIX9MvFK9eCI3pSHclwRZRIAwTC8fFa2k4Tz6DqC6rUSQdI5yavOafwCCON7RKH
         axnt9Z3RAZsQte3ITS6MIKtQczOCO8LDIBRx5jjiNvek5evwdAye94mpRo5aevrGAnBg
         Q5/A==
X-Forwarded-Encrypted: i=1; AJvYcCWOngQjwqgr37fyocyqj9PlurinNG9NASZqkGUnjLYQDjLIEF6oOQBNi2io34hAOf/K5Y0KGfZ6B39WJy8ieufNLg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyO+UrszxcHZ+4au608NnYkgsLnMBk3XAxzf4j5nJOsV6WaE/+K
	+zQrNCB5AgpBZX5xE/xHqZnkr0A1QmyF4ul9ogQ/T8nQvt8/rq9on+hn
X-Gm-Gg: ASbGncueJtTi8w4ul9Ef/RblaWNbunkxmfAYQUZVeFR7E4tp5lYQUfcVBZEjCeOvpgr
	kWMz2YssdgBckf0JdZ0z/wArIe3rSZlF8UVTCa95rka+ueYaDRgbevgGp1qzcAnX0pdVQiiuPW8
	IpkucXUx1PczpKkt3HVmZLaZHTaQyceap5RhxbdrP3t5ALkexfah9k+MIqn7vXXUnjZyIh274KL
	9P9kMRKR/6k3x1yNgXDKSQGSC+I9H9fXqneEM9UuA+SAHz5qDunXCBW5FSR4fubKEtmgvgK9Ken
	isLYjJtPS9Gv8UtC5bIPJEIHgF2jEeOQbZWg99D+GQm/9GdfxXNfwQpA6YLCZ0H3rTz9hKFP0I/
	onNgY6n8sAzIWUNdKhBPB6gO0QVaIDK2lO9mLx7kWR/a62CtWCaOkQG42L8oap/NcXnZYqPs9Br
	25+9OwiJqnF2+JDaxgtRE=
X-Google-Smtp-Source: AGHT+IF4X/ajHijvyWCcEJXp7BRU3KszAOBaGJSHAhxl5U1aM3wIwzZiuxYgoTxa5lLIJ/tjG85f1w==
X-Received: by 2002:a05:600c:a12:b0:477:55ce:f3c3 with SMTP id 5b1f17b1804b1-4775cdad693mr34975545e9.5.1762375194805;
        Wed, 05 Nov 2025 12:39:54 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477626eb4fdsm6750875e9.17.2025.11.05.12.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 12:39:54 -0800 (PST)
Message-ID: <c1201fa6-6976-40de-be9a-9ca8dc381535@gmail.com>
Date: Wed, 5 Nov 2025 21:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RFC v2 6/8] linux-yocto: enable Rust support in
 kernel configuration
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
 sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
 <20251105130942.833204-7-Harish.Sadineni@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251105130942.833204-7-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 20:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225779

On 11/5/25 14:09, Sadineni, Harish via lists.openembedded.org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Add initial support for building the Linux kernel with Rust enabled:
>
> - Introduce `rust.cfg` to set Rust-related kernel config options, including:
>   - `CONFIG_RUST`, `CONFIG_HAVE_RUST`, and `CONFIG_RUST_IS_AVAILABLE`
>   - Rust sample modules and developer checks (overflow/debug assertions)
>   - Disable BTF and module versioning for compatibility
>
> - Add `rust.scc` to include `rust.cfg` via `kconf` in the kernel feature stack
>
> - Update `linux-yocto_${PV}.bb` to:
>   - Append `rust.scc` to `SRC_URI` and `KERNEL_FEATURES`
>
> when sending non-RFC version, we will send kernel-config-fragment to the yocto-kenrel-cache
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-kernel/linux/files/rust.cfg      | 9 +++++++++
>  meta/recipes-kernel/linux/files/rust.scc      | 1 +
>  meta/recipes-kernel/linux/linux-yocto_6.16.bb | 3 +++
>  3 files changed, 13 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/rust.scc
>
> diff --git a/meta/recipes-kernel/linux/files/rust.cfg b/meta/recipes-kernel/linux/files/rust.cfg
> new file mode 100644
> index 0000000000..a884f3cf6b
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/rust.cfg
> @@ -0,0 +1,9 @@
> +CONFIG_RUST=y
> +CONFIG_SAMPLES_RUST=y
> +CONFIG_SAMPLE_RUST_MINIMAL=m
> +CONFIG_SAMPLE_RUST_PRINT=y
> +CONFIG_SAMPLE_RUST_HOSTPROGS=y
> +CONFIG_RUST_DEBUG_ASSERTIONS=y
> +CONFIG_RUST_OVERFLOW_CHECKS=y
> +CONFIG_RUST_BUILD_ASSERT_ALLOW=y
> +
> diff --git a/meta/recipes-kernel/linux/files/rust.scc b/meta/recipes-kernel/linux/files/rust.scc
> new file mode 100644
> index 0000000000..4686d9ce5e
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/rust.scc
> @@ -0,0 +1 @@
> +kconf hardware rust.cfg
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> index 2188c7fed2..33bd8a92c3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> @@ -77,3 +77,6 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
>  # Check again during next major version upgrade
>  KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
>  INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' file://rust.scc', '', d)}"
> +KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "RUST", "rust.scc", "", d)}"

Shouldn't this check also for 'rust-kernel' instead of 'RUST'?


