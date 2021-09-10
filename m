Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.6429.1631262681483308808
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 01:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CYz/KFHT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id w29so706913wra.8
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=eXW/bjzLwEKSKss4OCq+DEdGZM3axbrs1orgzmZCbsM=;
        b=CYz/KFHTLLmubBL0dehLhVrwfSk+dbtOaD1STzQbdsadRZJmDR/m6wBvoWUS/YDLZa
         8pr6Uh3t4SdKRj7goYyPkbjKVVfIZ8A627AlM88lyxJ51TOApev4tiozAT8zuiGLJ+T9
         N877jxxMAzKSJUT8YZHcxMegsRiFL2+uolcYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eXW/bjzLwEKSKss4OCq+DEdGZM3axbrs1orgzmZCbsM=;
        b=gVAHdffz3R3hhqZ5CBfLejN8NjreeXS2oMf3tcZAuNUM8TpV80PHmPg5sjzdURzH+Q
         l6nLpkzpOIipYiYwmD9FmCuzsm2vMeeCECneAQ4HjkteYo2vgacRdd+x5xhH4+JRrfwH
         Nd3ZSZWSVz8ghO+UVTwp2vAReE8eLs1YDz92iCDoqy8CJiS7UhC4y5xKCyGQpg/Y5xTa
         pD89RHgpYGokifpXpZo8RQWSjrN/Qbr2V9yNEOHS6OQaRPmzqFs23083Pa5796JEcxJB
         AtEsvXO4jFhVSi6IR9FPijDBiEB+YTdJ5OPMJsJhasjLurX4sJiDkh4iTexJ6CwfhwoR
         tOaQ==
X-Gm-Message-State: AOAM5314dXfRT9hEU0oxx654buO1PN97B6cH6JeVu1TSKvi40EuM3TK8
	KsrKvXhFwTYBKCm3MhcGJUuMxQ==
X-Google-Smtp-Source: ABdhPJxzJ0UJLhmycXomA5oKGtGVCO0+Mlm5KOYxVRQNSmpo1lNdxw955pgSo9GQ/BBI+SRNt/Wnaw==
X-Received: by 2002:adf:f543:: with SMTP id j3mr8325505wrp.287.1631262679576;
        Fri, 10 Sep 2021 01:31:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:69c:dc1e:bcce:ea45? ([2001:8b0:aba:5f3c:69c:dc1e:bcce:ea45])
        by smtp.gmail.com with ESMTPSA id l15sm4029248wrv.84.2021.09.10.01.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:31:19 -0700 (PDT)
Message-ID: <e09b8b9e26d55f71bda9afdd0c2e1e25ec2b4690.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic/bootimg-efi: Add Unified Kernel Image option
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: kristian@klausen.dk, openembedded-core@lists.openembedded.org
Date: Fri, 10 Sep 2021 09:31:18 +0100
In-Reply-To: <20210909175337.624-1-kristian@klausen.dk>
References: <20210909175337.624-1-kristian@klausen.dk>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-09-09 at 17:53 +0000, Kristian Klausen via lists.openembedded.org
wrote:
> "A unified kernel image is a single EFI PE executable combining an EFI
> stub loader, a kernel image, an initramfs image, and the kernel command
> line.
> 
> [...]
> 
> Images of this type have the advantage that all metadata and payload
> that makes up the boot entry is monopolized in a single PE file that can
> be signed cryptographically as one for the purpose of EFI
> SecureBoot."[1]
> 
> This commit adds a create-unified-kernel-image=true option to the
> bootimg-efi plugin for creating a Unified Kernel Image[1] and installing
> it into $BOOT/EFI/Linux/ with a .efi extension per the the Boot Loader
> Specification[1][2]. This is useful for implementing Secure Boot.
> 
> systemd-boot is the only mainstream bootloader implementing the
> specification, but GRUB should be able to boot the EFI binary, this
> commit however doesn't implement the necessary changes to the GRUB
> config generation logic to boot the Unified Kernel Image.
> 
> [1] https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images
> [2] https://systemd.io/BOOT_LOADER_SPECIFICATION/
> 
> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> ---
> 
> This patch supersedes:
> "[RFC][PATCH] kernel: Add Unified Kernel Image image type"[1]
> and:
> "[PATCH] wic/bootimg-efi: Add option for only installing the bootloader"[2]
> 
> The latter is perhaps still useful, but with this patch it is no longer
> needed for using a Unified Kernel Image with systemd-boot.
> 
> [1] https://lists.openembedded.org/g/openembedded-core/message/155801
> [2] https://lists.openembedded.org/g/openembedded-core/message/155789
> 
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 69 ++++++++++++++++---
>  1 file changed, 59 insertions(+), 10 deletions(-)

Do we need to add a test for this into meta/lib/oeqa/selftest/cases/wic.py?

Cheers,

Richard

