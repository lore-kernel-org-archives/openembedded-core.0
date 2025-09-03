Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CEFCA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 17:53:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.19425.1756921987229414701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 10:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jpSPjqkb;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b88bff3ebso1768525e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 10:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756921986; x=1757526786; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DkwYE4fcmsafTWU8sa2IkLQvgbQvMdYXMCmS/XU4/9U=;
        b=jpSPjqkbL/OOKrIu+/TeTb8y51OacfQkx9U+oC9cSTuaBEB8yQx8WPG1JZoIWURC9Q
         XLpiNHhgpBvclxOmLTPAYnrtqCGEkTcwyxuc4acPaBZX4YJJT/u8o11KA8S0c13NL+iE
         tP4wswmF+YfigNfDsJKwCd6azTSDELJ51dG5bWdcJ0bsKL9ydPHlWsWwjHKAffb9aT6h
         uFE1hXK9QVrf/aurlqoaKUsKlXzFqmryPRehxj151mPQuRDvxoL9rWMouguVzCbh1RBp
         /RezKzgf1uHjNGBLmdPB0fTXzOkq9lTPj7fVr2hFA9z5zP/MOjlpZ9YoyJatU1oUh0ti
         SY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756921986; x=1757526786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkwYE4fcmsafTWU8sa2IkLQvgbQvMdYXMCmS/XU4/9U=;
        b=Dak/eAsRlpGXV03grN63t65uby5VkNadT8AnGHG7TEtRIzkA9dIDWcJICtJCGwEh3W
         /btH/qedOyJhmBDEQV1NSPrxpvuxY2yDej8dCOO2jKLrN7shW6/yojklByhbPAiwZK2F
         YsPKpEge/kYjIQ2xFhVawgdABOfZr0Lao6hFT+Z/wvGBRPr05WnzDt7fIl/SgOTRlmsf
         dhgMFi3OTW4tPSIQRPCzeGP4qthX+m5LLnswTYgQ6bqXcGbqZKUHczj9sgsKJkiLT+16
         7YB62PsLDbhnMcVihjsfq1bTb3P1k4PkLDdudISHC/mwE6W7mvuGlklxsLVGpNuaYan+
         NJfg==
X-Forwarded-Encrypted: i=1; AJvYcCX0+/vvvNRWLxMbIbKcxdZm+u5ynAXBOkUHvkSMP8pjr0cW3g1zI/DhDx50qqq5C6u/FqlN7+Jmmy/GqpfJoEiS7w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzbK4kmhb3Cq7FdOZZI/zS6mxaSByYwOZZzjvlvTdT/3bkw8d0Y
	fuzNzALjGe/EQ2X6UIC8P1ClHqUUqp/3QGfYWaD6WumOA/7qeblgGZH8
X-Gm-Gg: ASbGncudMIYGVrubq0nDZIy/utI6GnKQ1NRLef1RPJrqY4JvvrY5p+56+rkhbMCOCM/
	5SjL0zAp5jF4a96vhxkPbfBzTKGcT5F7BgvjeKaxYM/jwlUKVbQPir6SnKPviyUCXG2u1RViNe2
	5NqB0l3dn1tjprXBzskDNTaiLZlJiuzWnHu7xOZS6ItJ5EbDos+T3N1jjiyfQ/rN6uXiTgsC6NU
	a8MT26XyMkVJZddgsX6b+DMJiLJ/RdZ0k8EtQ29fMbL8sAYowu9VaHrh2vkeF2H8k35gQ+THrpE
	ti8NZZ+1odJ04+Z8aguNHk3IjHRl0AYiPi/qt3V2DK3/D37L50CDWpAUOLWq20P4/XxWxIipMJ2
	IOkAGgcCVYuu1qpimw8YzkHUSiVBPf2DR9O+4RFMi1Q==
X-Google-Smtp-Source: AGHT+IGm7P+l2zXxWXvfT7A0585TDAjSEksTvz6Ka7XhXgSpgCjBlJDeDC7nXwxsYmCqKj4ZNqoIGg==
X-Received: by 2002:a05:600c:1913:b0:45b:7e68:c6a3 with SMTP id 5b1f17b1804b1-45b877bdcbfmr166366135e9.16.1756921985328;
        Wed, 03 Sep 2025 10:53:05 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7efb79sm250881035e9.9.2025.09.03.10.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 10:53:04 -0700 (PDT)
Message-ID: <895bb06c-5f5f-42f1-82c7-866b8f0e0c6b@gmail.com>
Date: Wed, 3 Sep 2025 19:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4] apt: upgrade 2.6.1 -> 3.0.3
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20250901151529.294450-1-skandigraun@gmail.com>
 <DCI89KAUZ6YS.3A65NFQ8FGKFJ@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DCI89KAUZ6YS.3A65NFQ8FGKFJ@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 17:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222879

On 9/2/25 12:04, Mathieu Dubois-Briand wrote:
> On Mon Sep 1, 2025 at 5:15 PM CEST, Gyorgy Sarvari via lists.openembedded.org wrote:
>> Changelog:
>> https://metadata.ftp-master.debian.org/changelogs/main/a/apt/apt_3.0.3_changelog
>>
>> Dropped patches which are included in this release, or became obsolete:
>> 0001-Fix-compilation-error-with-clang-libc-18.patch - included in this release
>> 0001-Fix-musl-build.patch - included in this release
>> 0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch - included in this release
>> 0001-Remove-using-std-binary_function.patch - became obsolete, fixed upstream
>> 0001-aptwebserver.cc-Include-array.patch - became obsolete, fixed upstream
>> 0001-strutl-Add-missing-include-cstdint-gcc-15.patch - included in this release
>>
>> Added a new patch to avoid compilation error with musl:
>> error: 'basename' was not declared in this scope; did you mean 'rename'?
>>
>> Adapted DEPENDS list - gnutls and gcrypt dependencies were dropped in favor of openssl
>> in version 2.9.19.
>>
>> Added a new PACKAGECONFIG, 'usrmerge', which displays a gentle warning if the system
>> isn't a usrmerge system during package installation.
>>
>> Added new COMMON_ARCH CMake argument - if it is not defined, CMake is trying to
>> determine the value of this variable by running dpkg, which is usually a futile
>> endeavour. It is used in config creation, and to print some system info.
>>
>> Also adapt a self test: the apt-key command has been deprecated since a while,
>> and in this release it was completely removed. Instead sources.list file
>> contains the signature data, on a per-repository basis.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
> Hi Gyorgy,
>
> Thanks for the new version, but we still have a similar issue:
>
> AssertionError: 100 != 0 : apt-get update
> ...
> W: http://192.168.7.1:32987/all/./Release.gpg: The key(s) in the keyring /etc/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-poky-whinlatter are ignored as the file has an unsupported filetype.
> W: OpenPGP signature verification failed: http://192.168.7.1:32987/all ./ Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 7B31316B5D64AD52
> E: The repository 'http://192.168.7.1:32987/all ./ Release' is not signed.
> W: http://192.168.7.1:32987/x86-64-v3/./Release.gpg: The key(s) in the keyring /etc/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-poky-whinlatter are ignored as the file has an unsupported filetype.
> W: OpenPGP signature verification failed: http://192.168.7.1:32987/x86-64-v3 ./ Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 7B31316B5D64AD52
> E: The repository 'http://192.168.7.1:32987/x86-64-v3 ./ Release' is not signed.
> W: http://192.168.7.1:32987/qemux86_64/./Release.gpg: The key(s) in the keyring /etc/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-poky-whinlatter are ignored as the file has an unsupported filetype.
> W: OpenPGP signature verification failed: http://192.168.7.1:32987/qemux86_64 ./ Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 7B31316B5D64AD52
> E: The repository 'http://192.168.7.1:32987/qemux86_64 ./ Release' is not signed.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2182
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2253
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2398
>
> Can you have a look at the issue please?

Ahh, I'm sorry for that - the new version shouldn't have this.


