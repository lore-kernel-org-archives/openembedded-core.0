Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.7271.1623411403743741573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 04:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JNQHr+3l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so8304934wmq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 04:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=1gJp9niU90lfSSY0egoyWDp+XfcfwhO6A1jvudAeEQU=;
        b=JNQHr+3lsA5wT5RjW2crP9Kxb/4EoAFMKAx5LlFGcWp+Z5S4kU3PM3IkirN3a4DiWK
         GZB5dOBgaC1VHB0ncIPkBxnAgpvKgeiEGmXaxfvTvriTIp5C6Ah06IHJNeRk6igUSiRh
         s3qrQaLLsEGPKLRI9xjNErO6t4sxd49KDqsQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1gJp9niU90lfSSY0egoyWDp+XfcfwhO6A1jvudAeEQU=;
        b=Q2Uz3WpRQD6vt9a7/Ci29h1X2rBXCij+dYqHjk1CrqcNuOku0PV5KWXd8W+ekcZ/87
         GhoRAZoln/wIl2g36TPG+aHj2s+J12xD+cPeazKA2GLcj0Sb707vKtxPoL9cA/hELlaW
         UAVV/2t/ta0trk9sBwkqW7F7BZSdWioPCZ85g4MNAj1DYu2xfQIIZCzPxGB+kYk71AsZ
         hFvhHefr98VSZKH7TLatyIklttdHFswhmjJkmo7+uFbuUJ9jHRUMoPbeL5r5K/kizUIJ
         i2XxtbsLU8EXao6GifvG/xpIR33O74CPthbUiGUB9ksmI3sCK/qfy5gJJ7OZrKbA0wgl
         YowQ==
X-Gm-Message-State: AOAM5338xBe9dhJtckrjDzChAC1xTS8oIFsYLOeJIXS3UKld+XnsSAY0
	1HIq/ktwCPhnZv3WgbnLPCbsaw==
X-Google-Smtp-Source: ABdhPJyZG6WhBKWaRZtwD+AaJEWJM+7dafcXGUbads+GPYwAncRAbpxNBC7YD/8MZUh4ejhr3/ZdCw==
X-Received: by 2002:a7b:c849:: with SMTP id c9mr20049926wml.84.1623411402031;
        Fri, 11 Jun 2021 04:36:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d8f2:39cb:864f:fe5b? ([2001:8b0:aba:5f3c:d8f2:39cb:864f:fe5b])
        by smtp.gmail.com with ESMTPSA id v17sm8035946wrp.36.2021.06.11.04.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 04:36:41 -0700 (PDT)
Message-ID: <22099aeed4395a3fba3e2508ecafec25b7d64c2a.camel@linuxfoundation.org>
Subject: Re: [swat] ltp failures on autobuilder
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: swat@lists.yoctoproject.org, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>, 
	Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Fri, 11 Jun 2021 12:36:38 +0100
In-Reply-To: <1687473EDD63E45B.21776@lists.yoctoproject.org>
References: <1687473EDD63E45B.21776@lists.yoctoproject.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-06-10 at 18:02 +0100, Richard Purdie via lists.yoctoproject.org wrote:
> Noting down what we know about the ltp issue:
> 
> We've seen intermittent issues on the autobuilder where some ltp tests fail or 
> hang. I've been trying to figure out how to reproduce the issue and narrow down
> the cause.
> 
> I was able to isolate a patch which reproduces the issue for me:
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=d7d65aae104caa03afc28837b0abe0b486d5a8b8
> 
> with master-next, setting:
> 
> IMAGE_INSTALL_append = ' ltp' 
> TEST_SUITES = 'ping ssh ltp' 

also:

IMAGE_CLASSES += "testimage"
QEMU_USE_KVM_qemux86-64 = "True"


> then 
> 
> bitbake core-image-sato; bitbake core-image-sato -c testimage
> 
> where the issue shows up as a kernel "BUG:" in the logs in WORKDIR/testimage/qemu_*
> 
> The above patch runs the minimum of ltp tests I could find which replicate the issue.
> 
> I've reproduced this on 5.10.1 -> 5.10.42, 5.4.123 and 5.13-rc5.
> (and we've ruled out linux-yocto with plain kernels)
> Also reproduced on both qemu 6.0.0 and 5.2.0.
> 
> My build machine is an Ubuntu 20.04.2 LTS with:
> Linux version 5.4.0-74-generic (buildd@lgw01-amd64-038) (gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #83-Ubuntu SMP Sat May 8 02:35:39 UTC 2021

Good news (for me) is that Randy and Paul can now reproduce this with the above 
additional key pieces of config.

We have confirmed that the issue is present:

* with gcc 11.1.1 and 10.3
* in hardknott
* if QB_SMP is disabled (i.e. in a single processor qemu)
* on 18.04, 20.04 and 21.04 Ubuntu host distros which have varying 5.4 and 5.11 
  host kernels

I was not able to make the bug appear with in gatesgarth as yet 
(gcc 10.2, 5.8 kernel, qemu 5.1.0) (had to hack -b /dev/null to the ltp commandline)

I did backport the qemu platform, smp and qemu commandline changes back to
gatesgarth and it still doesn't crash.

I also found that setting CONFIG_DEBUG_KERNEL makes the issue 'go away'. 
Since that is a large hammer, I tried:

CONFIG_DEBUG_KERNEL=y
# CONFIG_CGROUP_DEBUG is not set
# CONFIG_SCHED_DEBUG is not set
# CONFIG_DEBUG_PREEMPT is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_CONSOLE_POLL is not set
# CONFIG_DEBUG_INFO is not set
# CONFIG_KGDB is not set
# CONFIG_KGDB_HONOUR_BLOCKLIST is not set
# CONFIG_KGDB_SERIAL_CONSOLE is not set
# CONFIG_KGDB_LOW_LEVEL_TRAP is not set
# CONFIG_KGDB_KDB is not set
# CONFIG_KDB_KEYBOARD is not set
# CONFIG_DEBUG_MISC is not set

as a .cfg to the kernel and that still reproduced the crash. However:

CONFIG_DEBUG_KERNEL=y
CONFIG_CGROUP_DEBUG=y
CONFIG_SCHED_DEBUG=y
CONFIG_DEBUG_PREEMPT=y
# CONFIG_RCU_TRACE is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_CONSOLE_POLL is not set
# CONFIG_DEBUG_INFO is not set
# CONFIG_KGDB is not set
# CONFIG_KGDB_HONOUR_BLOCKLIST is not set
# CONFIG_KGDB_SERIAL_CONSOLE is not set
# CONFIG_KGDB_LOW_LEVEL_TRAP is not set
# CONFIG_KGDB_KDB is not set
# CONFIG_KDB_KEYBOARD is not set
# CONFIG_DEBUG_MISC is not set

doesn't seem to want to reproduce the crash so something about
those three options seems to make things 'work'.

What does that all mean? No idea.

Cheers,

Richard




