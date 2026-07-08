Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F66C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 02:19:31 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.106.1783477163845887630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 19:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FvAdnJm7;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c5382806fso1159871cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 19:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477163; x=1784081963; darn=lists.openembedded.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O/CtOBkbEOZah2T3g5HuXRdWQ0QJ2b1OQ07C99At3I8=;
        b=FvAdnJm7xAkj7BplSrg+TslGbOjGpyxXvh8UULP/vmFSZ8KX+nOvns4orf53MqutSC
         7sU1CeHzLS355IccT05PjLjXVuDlQ+SmFkbXqacaMRS1PMEbYgRktB26wZpH355OJTGK
         rzez0C9gZEzWIqmKIJLB45PQVy5q6ekRXl9hfQqJtXe67vdRtqDybxUz4LrhNO2wW5lQ
         uEXnBg6dhb3vF5kcVFtbc0kLF02hEK3hqTMAr9pgN2QvDamNToRVu1ZwheX11B+BkAm6
         GnxKHXEPS2EFhUUGDjKI/sB8OqyniWXpZcltRYURx4s2pfvO1VU8SJHheuS7lMFjaEFg
         r9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477163; x=1784081963;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/CtOBkbEOZah2T3g5HuXRdWQ0QJ2b1OQ07C99At3I8=;
        b=mSkyYUmWpmxbqMh4e8GZkSBMUM/t9haNOrRTMebxOlOM/COg1jcnwtAdXBvZPWG6lt
         kbCVNmNrcozHK9Z7dnHbdoirKK/fxjH5oDBvTUJ+xTcskFlgPqpIUbxLh6eu3tNoCGY1
         Tn0Td3r76phdAEAiZxZl03sG4SK3WqcoD71ykK0ar/nnZtGYE+t6dReQaviDhTnorYjy
         LdQ9cATl1bWhgWrFD1Qv2XIAlljf201gFbmwM/JslEiJWXuewsZVYju35bKC32bslOWw
         1wFQI+eeMId7m5UMvmyQ4Jhm3Mn7pesHR3hN6HNHDCrJYLLkVL66278HF/T2g2mpavCZ
         AOFw==
X-Gm-Message-State: AOJu0YxOZkS5upRlosNzj6RElv8rpf+3x2vwk6BohdG6Q4GX852lGgU0
	mFcV3HUmSVRZuOPKupYywjEXFlQCC1PxTdGFlN4BdFrWetGTPSePe3yD4Ri9XiKV
X-Gm-Gg: AfdE7ckRoLSuFyM3SHcmkC1EHbDgioCseXF62M8AgDhecNtCPRJ1yuq0gSiFn+28FG5
	c02umNo2EQPyt+zZ9aVufte/bUOgP99VOYUyhhJgrwYgN59Q776axwpigrF56bz9ukD6q0zTHEE
	3mZaPKYEJIzTvj2KJq22QCln+bCloREUx2eOD2qXny7cigyiNIHVGoNuf8KdV1bcI5Jm1QlKIJc
	yALgBb9zcs8JiTxyBF5MPX5VnIYqlgmLUfxgBLm1ndyHNsVzsvVtFK0uQ3xN+6a4nE33MehnMd8
	qQ8gNtYb6HxgzozgeIJnRXTse5LGO9PxluHEIlVOCZ/GRPHVMDvM8CTtkFAewgFysCoFiyg5t2N
	sUdPGhK6HyKwmw4isjS8pPoktrekdh5M8rnT8UDIKiQY34MG8JnFJNPcMFdQxwPS+DNoI2nrCR9
	ORk79u2ZzV5S7tYvH3MG3hTKAmKoAaf/NiC3yveuHft3ZYuSUAanrYk83DA07V1SjLAyVeSXUqA
	+6O282J7DHMrfs1rSr+71xAfdScCXA1oQXiV6TwA2d0sxWGC17qDrycjzwx0gdyCkwogCkrWnxg
	RN+AbrEjUVvg9w==
X-Received: by 2002:a05:622a:258c:b0:51c:12c3:efe1 with SMTP id d75a77b69052e-51c8b48e9fbmr7786801cf.42.1783477162615;
        Tue, 07 Jul 2026 19:19:22 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41da510dsm123100171cf.22.2026.07.07.19.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:19:21 -0700 (PDT)
Message-ID: <6a4db3a9.bb1272e9.250696.19ba@mx.google.com>
Date: Tue, 07 Jul 2026 19:19:21 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-core@lists.openembedded.org, Harish.Sadineni@windriver.com
Cc: Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com, tgamblin@baylibre.com
Subject: Re: [OE-core] [PATCH v2 1/4] kernel-arch: Add clang toolchain support
In-Reply-To: <20260707085552.981820-1-Harish.Sadineni@windriver.com>
References: <20260707085552.981820-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 02:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240411

On Mon, Jul 7, 2026, Harish Sadineni wrote:
> Convert the existing GCC tool definitions to use the `:toolchain-gcc`
> override so they only apply when `TOOLCHAIN = "gcc"` (the default).

I went through the series with a focus on making sure it's a no-op for the
common gcc / non-riscv64 kernel build, and it checks out:

 - toolchain-gcc lands in OVERRIDES for a default build (base.bbclass does
   inherit_defer toolchain/${TOOLCHAIN}, gcc.bbclass sets
   TCOVERRIDE = "toolchain-gcc", and OVERRIDES carries ${TCOVERRIDE}), so
   KERNEL_CC:toolchain-gcc et al resolve to exactly what the unconditional
   assignments produced before.

 - The KERNEL_CC:append:{aarch64,nios2,arc} appends in linux-yocto.inc still
   stack correctly on top of the :toolchain-gcc value, so the arch-specific
   TOOLCHAIN_OPTIONS aren't lost.

 - Patches 2-4 are gated to riscv64 and/or the rust KERNEL_FEATURE
   (kernel-yocto-rust.bbclass is only inherited when 'rust' is set), so
   they're inert everywhere else.

For the whole series:

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Two things worth noting, neither blocking:

 - One behavioural subtlety from this conversion: a KERNEL_CC:toolchain-gcc
   assignment now outranks any *unconditional* KERNEL_CC = "..." a downstream
   BSP might set, where previously it was a plain last-assignment-wins. No
   in-tree machine/recipe does that today, so there's no regression, but it's
   a change in precedence worth being aware of if a BSP overrides these.

 - In patch 4, `if 'clang' in toolchain:` will throw if TOOLCHAIN is ever
   unset (getVar returns None). It's always set for kernel recipes today so
   it's fine, but `d.getVar('TOOLCHAIN') or ''` would be a touch more robust.

Bruce

