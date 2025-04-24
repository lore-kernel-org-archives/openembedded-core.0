Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928FEC369D1
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:48:33 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.12102.1745491710042733274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P5GmQRkC;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso9096616d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 03:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491709; x=1746096509; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z1dGD71mz3TJ985NDEHI8H5EzZmF93Fo3eUNNe7i+UY=;
        b=P5GmQRkCpGo/tK7w7qk9qNhsF0SRj8AhQSnAiWHfcNBN23GheiOELPHrBw/nhR3Pe+
         YKuOvruKUCojAyPkppdeMJHa10g29WvxvClI3dn5MsicG/3ZMDmDnlZl+mbv9Nm6OoI0
         LWfvNnWhSGZnjpQfMXCa2qdCv5y7vtswkG1+EStZgtfAlndyUY0uw1R4sm7v/hF7It55
         tHigEpXjmM2DRrp1KTQEOFLUKYQ6Hd6LXYNCmctsRo2ikvQ70mfYGq+6Q4N0fmKoJVZc
         No8Y8a+VmOwr0EIuanJcghzxBchWvJlJqSx7APdgBXfIQvMXCs60HZXTX3W9Lt0ys2Wj
         jzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491709; x=1746096509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1dGD71mz3TJ985NDEHI8H5EzZmF93Fo3eUNNe7i+UY=;
        b=oC0/MqnDyGvljxFBlxZR5cJd2BhMSr38ATGWRwtR8REuJvBlv7pldW4M5FegGPRgxa
         401lRlolmGTyKbi6gGE/JtiHytwlLCJi8N+6f9yyPqCcjoz6Fx33hv4rLN8dBpOs8zlH
         2vmeq5gjonf3gswuhqNHRZXUT5HwMq7rUoBbYEmcifdBmJXyMsD8noNQ02FQyuc6hoTe
         y2C44D0Eg+M/R+VvmYMzkzcDdJyY5732J8d7bWVkdHxMFEYDQ2O+FZzShng4RIajks12
         uscKy3NHP0Tv+3ehM8BNxSCzqLFpr+K4Yj4C40g03SRW4ckYlfZnwqwl7kdaC6gKAQOa
         My3w==
X-Gm-Message-State: AOJu0YwExyp3GwxoJgDPmdDsnDsdxgEgJQrkbLow744gBiZVnBppW8OW
	YYbBYopSSLkNwLl96Z1yWsWgG1LO8SOXBKUtIA6oo9zGj4nwuXkcnvlkS5TKJ8L4CArcAh3RxKT
	K4tDxjbGIEIs/IxOPTmYZNSO80W0=
X-Gm-Gg: ASbGncsEJbtwJKQvAWY6tMoFisyhQ1VxISLiGPbTfYq4/GyVnt6YGhOQiTKo5iF7azu
	oBj7XOuaevmvLq0O8lnvmIrCebEWph5GVdFji+YDvWEEB2r17qyoj0TrFcAA3zjPFPgLLXGl8ap
	Y1QV8JpMm1Kuu5JUqatBYRa1bKbuQmeYaUxYBJIOgRkiPtlKXwBjns/0/o
X-Google-Smtp-Source: AGHT+IG1FJZpl9Q/1VxiKo9WlMIXP8oOZd0EDl2wolZh3472bIixncsI5GOEmvCkLevVm9SF/b4JuNculNgry1Z9M+s=
X-Received: by 2002:a05:6214:1c88:b0:6f2:b7d9:689b with SMTP id
 6a1803df08f44-6f4bfc7b74emr35667096d6.35.1745491709071; Thu, 24 Apr 2025
 03:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com> <20250424-clang-merge-v1-1-5a492a8461aa@gmail.com>
In-Reply-To: <20250424-clang-merge-v1-1-5a492a8461aa@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Apr 2025 12:48:18 +0200
X-Gm-Features: ATxdqUHj2oVbtmgOik7_gJVB0fXFIvmdDxUuQwdc0y8K6wlZQdRl3Pa15U5LDK8
Message-ID: <CANNYZj-_wX2XPBXZs4ZqVc7h85H=_KcK+5E4VH+VPNNZiyWYgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/11] cmake-native.bbclass: Abstraction to use
 cmake with native toolchains
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215358

On Thu, 24 Apr 2025 at 09:21, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> +# Native C/C++ compiler (without cpu arch/tune arguments)
> +OECMAKE_NATIVE_C_COMPILER ?= "`echo ${BUILD_CC} | sed 's/^\([^ ]*\).*/\1/'`"
> +OECMAKE_NATIVE_CXX_COMPILER ?= "`echo ${BUILD_CXX} | sed 's/^\([^ ]*\).*/\1/'`"
> +set( CMAKE_SYSTEM_NAME `echo ${BUILD_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )

I think we need to set a higher standard for adding cryptic sed
expressions: why it's used and example transformations both need to be
given in comments just above the sed line.

Also, can we rather define BUILD_CC from pieces such that one of them
can be used here directly?

Alex

