Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.8338.1628081185482861593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 05:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zn4L3n77;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id m12so2067182wru.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+3W8WHgCXsszDIfWDdu7jRc5q7P9pHHxaG0IRFCgpfQ=;
        b=Zn4L3n77hFgOcvUuZdwANp+xCUTZDNoZAmcx3NLdZscP8ERpyYZm/spZ649uKk2oJd
         rQGyyP2WQCzeyAjo8N8g4TIEFSmDXdgph9r+IC/0B2Um/CafCcwL5DGj20/+gvT3c9Hn
         YBwVFVrn4fnicAOKddqY1711iXg3nRwXW3RS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+3W8WHgCXsszDIfWDdu7jRc5q7P9pHHxaG0IRFCgpfQ=;
        b=YQ+829Un9gmiMfQAHXEZ9ntHxl0KjCY+xwDhm9NL9oHYcqJT4xj96cTaf5Fdq2UuUo
         91g9OFqYxnO3tE+Q5I/MjeD45IGF5L+hSHoGBUIogjeg7PJIp7WeJVtImpFBe3vA1ht/
         b5qXATksljm/iuoEVOsmniLsYDOdJC/0cz1QSNCE7UjiBOx1sECSCcstjvS0d9eNcMkC
         Jpli09V7eCia6uzTfA7aevC4RDiCfRXMy+Je8WKCYkUx6el2W2HfTTCQU0kMKqfAR/H+
         RJlaImpF4Lpi41cJZgFYNVNdWiU/4Bk+vy9HVz+p0VHou9XlvmCb0U44xhQLuBcio8y/
         dKVw==
X-Gm-Message-State: AOAM532nTY4/LjAZxTSKmIbUK+2drCGX3iBb79jeGOOQl0t6gLfHaqar
	WiG4M9Ta3rfxTCB19KqaxdUm2g==
X-Google-Smtp-Source: ABdhPJyy/hEGfKV/EJcrsMmcB/VwGKBTfczXcjpQ1O5lXTpzG5Z2wIx7WKCBtvXBgxxP8Dab9zjylQ==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr28540062wrv.77.1628081183921;
        Wed, 04 Aug 2021 05:46:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa? ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id j140sm2237461wmj.37.2021.08.04.05.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 05:46:23 -0700 (PDT)
Message-ID: <3e567fd7b645657303e7bf2271f8ac1d039709f5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2] systemd-boot: use ld.bfd as efi-ld even when gold or lld is used in ${LD}
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Date: Wed, 04 Aug 2021 13:46:22 +0100
In-Reply-To: <20210804103627.238411-1-Martin.Jansa@gmail.com>
References: <1697E299D6012A1A.32176@lists.openembedded.org>
	 <20210804103627.238411-1-Martin.Jansa@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-04 at 12:36 +0200, Martin Jansa wrote:
> * since the upgrade to 249.1 in:
>   https://git.openembedded.org/openembedded-core/commit/?id=323ec445dfe22860cd450c303db5ed8fcb4e791c
>   the builds with ld-is-gold are failing with:
> 
>   [17/21] Generating linuxx64.elf.stub with a custom command
>   FAILED: src/boot/efi/linuxx64.elf.stub
>   /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld -o src/boot/efi/linuxx64.elf.stub -T /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_efi.lds -shared -Bsymbolic -nostdlib -znocombreloc --build-id=sha1 -L /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/crt0-efi-x86_64.o src/boot/efi/string-util-fundamental.c.o src/boot/efi/disk.c.o src/boot/efi/graphics.c.o src/boot/efi/measure.c.o src/boot/efi/pe.c.o src/boot/efi/secure-boot.c.o src/boot/efi/util.c.o src/boot/efi/linux.c.o src/boot/efi/splash.c.o src/boot/efi/stub.c.o -lefi -lgnuefi /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.2.0/libgcc.a
>   /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld: internal error in segment_precedes, at ../../gold/layout.cc:3721
>   [18/21] Generating boot.c.o with a custom command
>   ninja: build stopped: subcommand failed.
>   WARNING: exit code 1 from a shell command.
> 
>   as reported in:
>   https://lists.openembedded.org/g/openembedded-core/message/154246
> 
> * if someone is using lld or ld.lld in ${LD} then it would fail as well:
>   https://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc49b78e6c9bf86a764e31
> 
> * work around this by always using ld.bfd instead of whatever is set in ${LD}
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd-boot_249.1.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

I suspect but haven't confirmed this is probably the cause of:

https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/2673/steps/11/logs/stdio

Cheers,

Richard

