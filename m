Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.4614.1609850228002611555
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 04:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KAGpAzfl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id a12so36004044wrv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 04:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Iwy1hnc+MIiew86VFTpcy3wdxvjR79oOcjQtuDU2eXU=;
        b=KAGpAzfl09WGtEwBTV7TcTMph5dm+G/LuerepN/p70fLDNj4H7aA/feo4zVK5coIqJ
         KJLeI6Uii4zKPwhH4MJHYvXpr0dq4GpqDxNAIUcMzAepM3Ulo7zfLMD3Ldn4IPIKW0ev
         CYJH0PcjNYONuPmmZd+MYVSaYZobopzI5baKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Iwy1hnc+MIiew86VFTpcy3wdxvjR79oOcjQtuDU2eXU=;
        b=dZQkQOOKBSRGN6MbzTowpwsZEjpaov2o48bD5/SV+0PiLQWKoi+RhFEdxvPC/6vBD7
         lRGv1xCyl+SZUnXMPnCfVQuwxAULkLabksqyJ1UDfeNG+z2+zabMU96/x40kjCjS0lcR
         s6awUzf/SnsMYwclHUaUnDk97pc0teHtPRwQQyF6rQ0KZYzVtTxzL6BwRvQYIoHPQMR5
         dUrBRHnKn+llSJy5jiPBzyRUlzvy15EOtEmeLhVog9VcF0Pv8N6S0KA4DqzGSS743Gnf
         DgzPrhUzjkZyI2k7T6lKrEEzLFcM+ntHFS/S372mW+wzkXzMZ7Q6wo0oIaBfgG2RdRwj
         +jVQ==
X-Gm-Message-State: AOAM530H5n/pvbnz35ZOpWgRFhOTbvUNlyD/KKU+20f+A34LLwwMM2Le
	v9ZyZqkr0rE7/PA41BgTUNnlQw==
X-Google-Smtp-Source: ABdhPJxDF2kzqPEmFHiJlosZMRLSXaFEuFAyA31Cib09vRlQ1ao8SM4xteEgnxGRSLMVPDqCJH/lMA==
X-Received: by 2002:a5d:570e:: with SMTP id a14mr83644529wrv.126.1609850226143;
        Tue, 05 Jan 2021 04:37:06 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:fe9c:e0b5:40a1:adaf? ([2001:8b0:aba:5f3c:fe9c:e0b5:40a1:adaf])
        by smtp.gmail.com with ESMTPSA id v11sm95038926wrt.25.2021.01.05.04.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:37:05 -0800 (PST)
Message-ID: <89cb1de79cc242d0545829a3138685ebc4ffe8cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] pulseaudio: define -mfloat-abi=softfp for CC on armv5
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
 openembedded-core@lists.openembedded.org, armccurdy@gmail.com, Tanu
 Kaskinen <tanuk@iki.fi>
Date: Tue, 05 Jan 2021 12:37:02 +0000
In-Reply-To: <20210105033719.809-1-mingli.yu@windriver.com>
References: 
	<CAJ86T=VZtAHf2cP==VnVK1mM4XEY+DaJqyokmzPfCzGT0UvwAQ@mail.gmail.com>
	 <20210105033719.809-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-05 at 11:37 +0800, Yu, Mingli wrote:
From: Mingli Yu <mingli.yu@windriver.com>

After pulseaudio upgrades from 13.0 to 14.0, it also switches from
autotools
to meson. In autotools, there is --disable-neon-opt option for
disabling NEON
optimizations, but there is no counterpart in meson.

And the meson build system adds -mfpu=neon at the end of the compiler
command
line which overrids any earlier -mfpu options and result below build
failure
on armv5:

> /prj/tmp-glibc/work/armv5e-wrs-linux-gnueabi/pulseaudio/14.0-
> r0/recipe-sysroot-native/usr/lib/arm-wrs-linux-gnueabi/gcc/arm-wrs-
> linux-gnueabi/10.2.0/include/arm_neon.h:31:2: error: #error "NEON
> intrinsics not available with the soft-float ABI.  Please use -
> mfloat-abi=softfp or -mfloat-abi=hard"
>  31 | #error "NEON intrinsics not available with the soft-float ABI. 
> Please use -mfloat-abi=softfp or -mfloat-abi=hard"
      |  ^~~~~
> ../pulseaudio-14.0/src/pulsecore/mix_neon.c: In function
> 'pa_mix_ch2_s16ne_neon':
> ../pulseaudio-14.0/src/pulsecore/mix_neon.c:38:9: error: unknown type
> name 'int32x4_t'; did you mean 'int32_t'?
>   38 |         int32x4_t sum0, sum1;

Define -mfloat-abi=softfp for CC on armv5 to fix the above issue.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index e40b8c1c40..761e4f74dc 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -123,6 +123,11 @@ PACKAGECONFIG[ipv6] = "-Dipv6=true,-Dipv6=false,"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,"
 
 export TARGET_PFPU = "${TARGET_FPU}"
+# workaround build failure on qemuarmv5 as the neon optimizations is
+# enabled by default and no option to disable neon with meson build
+# system
+CC_append_armv5 = " -mfloat-abi=softfp"
+export CC
 
 set_cfg_value () {
        sed -i -e "s/\(; *\)\?$2 =.*/$2 = $3/" "$1"

I really don't want to add things like this to the recipe, I think it
will interfere with other parts of the compilation. In many ways I'd
prefer an option added to meson. Do we know what upstream are thinking
in relation to this?

Cheers,

Richard


