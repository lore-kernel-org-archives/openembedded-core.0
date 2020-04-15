Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.13294.1586954661010140553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 05:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ruBch5OV;
 spf=pass (domain: konsulko.com, ip: 209.85.221.68, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f68.google.com with SMTP id f13so18951503wrm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 05:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=FMBKB0x3eLs54uSq+A0IEoJAJm/sr9KJlX4NNe08RXs=;
        b=ruBch5OV+IHTXHkLpoTDCJTgBM6fjzgvwpIUmOSK5reHqz0GsfBoZvD3Bn+7DJ/BZq
         vMyXMhFmwcedOqg6FWWx172Ec9/Iaqf3e3INFQryh0OkT+pRTFo0oVmj66b8A3LZrqlp
         3JbFvArYjkZMICuJ9i5e0sp1J+4azd7/Ti5Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=FMBKB0x3eLs54uSq+A0IEoJAJm/sr9KJlX4NNe08RXs=;
        b=rxEpRveFJMfeIZXiyQ7n03qyCTpPa9z3uOo21K6z/4tUeh4+qSdEjMQWnDu/LwjjWA
         1v4UrHNsz0Qe3uG0SvHlr2e1IkvLA6s4BzV84LGxCeu9dElmDRxVebHmvmUqfhili0/8
         88NDElDf+ri1SJv4BXveLxdzXL67IAyD6hqcGRug6yD9+8nTGejfoy5YCHf6KVg0QJf9
         uAgLtKGZ2XBzfWIT8Ur75YR2WTUa0a+lFLqTGU5YWSjc+8RczJu7RWpu2B9ZrFh/HaS4
         rPKUoLqTY4qCOXWRFuHA8WeLJE8OVC3YWbUjz+4nvp+ka2TGkWajNZlH0iMvk9bdY7l4
         Q+kg==
X-Gm-Message-State: AGi0PubrrRSpAvj+tjIiXI2+yWTTja97L1UneLdgm8w4+Y6K4BJ/IIjH
	dy+1yRtSQ3NyRhCTBYAXITcgVg==
X-Google-Smtp-Source: APiQypJIu847VshxeQleLFq3Aaa5YU9lo+5LU3rYJ/OKiPk3Gqba536YKelNV7QVTPh64G2NyiFfcg==
X-Received: by 2002:adf:f30c:: with SMTP id i12mr11012640wro.426.1586954659245;
        Wed, 15 Apr 2020 05:44:19 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id a80sm22825239wme.37.2020.04.15.05.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:44:19 -0700 (PDT)
Date: Wed, 15 Apr 2020 13:44:13 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: "Konrad Weihmann" <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] runqemu: add ROOTFS_EXTRA_OPT parameter
Message-ID: <20200415134413.69873eb4@ub1910>
In-Reply-To: <VI1PR05MB4286CB9872D15C1FEC21AA3CA8DA0@VI1PR05MB4286.eurprd05.prod.outlook.com>
References: <20200414191915.772-1-kweihmann@outlook.com>
	<VI1PR05MB4286CB9872D15C1FEC21AA3CA8DA0@VI1PR05MB4286.eurprd05.prod.outlook.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Apr 2020 21:19:15 +0200
"Konrad Weihmann" <kweihmann@outlook.com> wrote:

> Content of the optional parameter will be appended to the rootfs-device
> in the qemu configuration, in case QB_ROOTFS_OPT is not specified.
> By default this is empty.
> 
> Example use cases are:
> 
> Defining 'readonly' when using squashfs, so multiple instances of qemu
> can share the same base image, something that cannot be done by just
> specifying 'snapshot'.
> 
> Defining 'bootindex=0' which helps to get past the EFI shell in
> ovmf-binary. This also enables the use case of running WIC images with
> EFI bootloader through the testimage.bbclass.
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/classes/qemuboot.bbclass |  5 +++++
>  scripts/runqemu               | 11 ++++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> index 68f7a03619..3162e7a8eb 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -65,6 +65,10 @@
>  #                   " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
>  #                   Note, runqemu will replace "@PORT@" with the port number which is used.
>  #
> +# QB_ROOTFS_EXTRA_OPT: extra options to be appended to the rootfs device in case there is none specified by QB_ROOTFS_OPT.
> +#                      Can be used to automatically determine the image from the other variables
> +#                      but define things link 'bootindex' when booting from EFI or 'readonly' when using squashfs
> +#                      without the need to specify a dedicated qemu configuration

The summary line of the commit should use the full variable name
`QB_ROOTFS_EXTRA_OPT`.

Thanks,

-- 
Paul Barker
Konsulko Group
