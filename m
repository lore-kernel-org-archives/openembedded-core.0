Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E223FCCD184
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 17:32:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.23052.1760290329945720955
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 10:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YI8tiDyF;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-421b93ee372so1833349f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 10:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760290328; x=1760895128; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hYIahW4MCfFwuHE/VEUsFIOsWH0HVG8XRJ6fE7pNEbc=;
        b=YI8tiDyFbYPr8hVOD6vVa3wiheEnNaBLR4MPY6msophNkZuLixrVT4+v/5v4RWYtlj
         2iTzo+oU73aweQZf7X4zut8pfHcAPXRT6K5v5uADml3xh0xnWN3zBub2e2JJfOdPIb3Q
         ny4v/YI+xmr/Ywb543D3szco9PpB88DVi6L69U0RCGh9YrIwEbM88tKdMzWXelDP16s8
         sxwvORu9S7KX9y557oeCi6/6c7MQV47WFzAnHVufJqkEv0M4S2nKzPocPC0TofvU/TVE
         QCmpEHso8648vOMYMc9J2UR5yq6VMQ9N5nxmqmPEDTktm9G67bOHcaKuBmGLZTQedxEJ
         dohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760290328; x=1760895128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hYIahW4MCfFwuHE/VEUsFIOsWH0HVG8XRJ6fE7pNEbc=;
        b=G/SZHhlNeqbWV21Jbw3uZmltrM4mBoALVmlyzNs/VlO8OVNwCOsG083xntFrirNQAN
         N2k8TTlU1nMvWM/3t0Yig2GfFS8X0aIDlnGTHwmwRcY4GVtmwV/pOs7VuK7P7jbMvyOa
         yLFD3zdqLut4zlT2r5B9aEmO4mw9ET4NTPBukLDZdBBGOUsHDJpzdAeYLSqjapH+RXdP
         8b8ei7hFrezBu270q90H5NdPpixoYRijAexXbV7dHqxf7M3FtPxPcvfWujM1CTEzjyY3
         I/IgbHy+LB7lOX0TBN4qew7k1CGS9OSpX6ZlpQa9rLh3r3eY/8eIhhdLC/hOGw60AJJT
         kC/A==
X-Forwarded-Encrypted: i=1; AJvYcCXvjTSLiWpqwwk61mZjenBk90U9XH1O2TlSz3VT1K+MDvSDZuLR/QdYwWIo9saZ1jMZoIIcxhdtLK0oY/RHq722PQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzwMljs6RNxP8zOWAcJSaBujeXEtu/rP1rDrJ+FUQmizahQqF1G
	l6Re0YV9zrylKOMJJFADZ5kJmq8e6X14ckdjlIkos9eEQ6GJhtHimGXk
X-Gm-Gg: ASbGncvKbcD6InegcntvmTD41BoEZ1TuinQd4Z0AwM8htVOywPff/lVDEpWb0aODLwy
	8DonmIuTBNHkwcagiJOkV7hhUIKsfNwBigP4U7jhHstalzhPNxC/WaFLLuev21CoITDGt3pNM90
	rSJdNVXfP0nWLRCN8Jj6d43j4alvGMFIMVStToorv8hxNdfXxzZtGHRpaittzYryKq+oIUC3LZZ
	ISAMEsiEJWrjNXhyKgL1w0VnODFwNIn07LzdhCuaOzxSNGRVZhtQEXidUxr/mDQXj0N1CACCi1i
	bibPdss34p3yGJm+Pa3kS32CFXsrXjszRHcTM/L6QmOXyfRbE1slvXICDvk418apZI4hgYKZTuq
	8MV7R4RRkAQHnBm5KL2LmEoXrfT3LGXHUVSsI5TAg+yZZH13qIhPdpcG2KESL
X-Google-Smtp-Source: AGHT+IH84MGSYNMcL76Q3IdsdxHu3497Z3EfHm7mUALkeRxSWCKx2ahdeVgB/eWllPV39dhtJjDjog==
X-Received: by 2002:a05:6000:2902:b0:425:7e3f:f314 with SMTP id ffacd0b85a97d-4266726c401mr10207397f8f.24.1760290328139;
        Sun, 12 Oct 2025 10:32:08 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf71dsm13669786f8f.29.2025.10.12.10.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 10:32:06 -0700 (PDT)
Message-ID: <1ed65c41-c418-416d-ab99-705116ce4221@gmail.com>
Date: Sun, 12 Oct 2025 19:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] kernel-fit-image: enable compatible string for
 kernel built-in DTBs
To: kavinaya@qti.qualcomm.com, openembedded-core@lists.openembedded.org
References: <20251012171634.2110563-1-kavinaya@qti.qualcomm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251012171634.2110563-1-kavinaya@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 17:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224744

On 10/12/25 19:16, Kavinaya S via lists.openembedded.org wrote:
> At present, the kernel-fit-image bbclass is adding compatible strings only
> for external DTBs, omitting them for DTBs built from the kernel tree. This
> behavior is limiting the ability to clearly identify the DTBs in FIT image
> that includes multiple kernel built-in DTBs and possibly mix of in tree and
> external ones, due to lack of consistent compatible strings.
>
> To fix this, introduce a new BitBake variable, FIT_DTB_ADD_COMPATIBLE
> when set to "True", the bbclass will extract and include the compatible
> string from kernel-built DTBs also in the .its file, just like it does
> for external DTBs.
>
> Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
> ---
>  meta/classes-recipe/kernel-fit-image.bbclass | 3 ++-
>  meta/conf/image-fitimage.conf                | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
> index f04aee1807..0e6764cb17 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -85,7 +85,8 @@ python do_compile() {
>              # Copy the dtb or dtbo file into the FIT image assembly directory
>              shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
>              root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
> -                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
> +                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"),
> +                add_compatible = d.getVar("FIT_DTB_ADD_COMPATIBLE"))

I think something like bb.utils.to_boolean() should be used, otherwise
the non-empty string will always evaluate as True.

>  
>      if external_kernel_devicetree:
>          # iterate over all .dtb and .dtbo files in the external kernel devicetree directory
> diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
> index 090ee148f4..35e0459d09 100644
> --- a/meta/conf/image-fitimage.conf
> +++ b/meta/conf/image-fitimage.conf
> @@ -47,6 +47,9 @@ FIT_LINUX_BIN ?= "linux.bin"
>  # Allow user to select the default DTB for FIT image when multiple dtb's exists.
>  FIT_CONF_DEFAULT_DTB ?= ""
>  
> +# Allow user to choose if DTB in FIT image can have compatible strings.
> +FIT_DTB_ADD_COMPATIBLE ?= "False"
> +
>  # length of address in number of <u32> cells
>  # ex: 1 32bits address, 2 64bits address
>  FIT_ADDRESS_CELLS ?= "1"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224743): https://lists.openembedded.org/g/openembedded-core/message/224743
> Mute This Topic: https://lists.openembedded.org/mt/115721367/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


