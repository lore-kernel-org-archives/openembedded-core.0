Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D49C36010
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 18:39:20 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.1518.1743187153560599256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 11:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gh7A4vL2;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e41e17645dso23406946d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 11:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743187152; x=1743791952; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BAhA9TpGlD1WqFg/LW8WwiVoY5mYWYR5V9e6jeN+kAI=;
        b=Gh7A4vL29SByiNEcEZlUQKOAif+cwSyEcH/CKHDXrs0l47zVOfsLblHYjNxU1x0h4A
         3HDOi2/MqDo+Pp94/aGgGMyyq3jTA3ICDZuX9TluZ90mpvyCE/fyop3UwM3HVnocd4CQ
         5fMg2I8I+naB0QDJWtIV6ace6wQFSzcPEI8lJfLy2dxNJ/IQt9qniHi1cVTpS0++mmYn
         oDtpuHlbXYE69vMgn70f6P5JVpTXc4t7mphkC5puzBU52kn10dauVX4Vitj63w0vit90
         i+Ki+RyL1YosoLiRe0G+xxgIsHoxDlENB5337Row5TKDg2EofWDKK7v+1+TC40OXgrSC
         kVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743187152; x=1743791952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAhA9TpGlD1WqFg/LW8WwiVoY5mYWYR5V9e6jeN+kAI=;
        b=mAkfbJ+5nzsTb5QaAymnnnZX/I0M1Kqf4y7pAT7LTXZC6dTY2gaegZllUlMwhLMlfP
         qprpwZJ/1912V6JDuXjr2913neWnOwLhX0YnZvcYAGzsZ6lvtFO09UOxwW/L/BBA7BZh
         kshpr5G2zQyu8qjU4aUJ52Z+JOzf6orJPvFnezFzvNLZO9opqHiwgjlRR3MsZyMDA6AH
         V97i08QExM2bHY+kP358P/T0wQTd3WtTN2tFu2E1tdbIFPmJSAszRKsDW31UBKAidFmj
         hW3T86UkPGny+jGjIbc/bGytg/cAoj7O41PBRCFypAh7c3rbKJdL5qvBZWQOWvBFVUMk
         8B8A==
X-Gm-Message-State: AOJu0YzmF+AqM2LBBDiVP7CwQm7uu3jMnVexHv4E2T4eC7hli8GKlu5D
	f8zy/cr2SIcypu9HSM/1jEJ/2GRDxTjO4VfrbD2ljiZ+zobW4ptyerdRxROglyG26o+mNpmghyP
	kWIQUVun8YoC9AtUzRfoU4T1waCk=
X-Gm-Gg: ASbGnctjjodyAKl28EQxXj/gRwjp8inQ71nR07oVRUr05p6IVQIxieRPpd793pLJKb9
	Rsxt25Oytk7lH/F4kXN3lNeVlzsa4tV8z3/0JIEv0nZ9UupubA5hNa+Nfe+h4cc9JlC/HCL6fsB
	4m95M5InTkgM5Ev77P0FM5dkCrzyv2xkO2okabcZkj0sTM8Rlzfb53Lhc5va42
X-Google-Smtp-Source: AGHT+IEHDt4tgg7JJSAjXXz1Vjchk5F66/wjdIAJcSZUSZfGb6KnM3BrXU1kceKSIPXcL2Mp251EM5Uvmvy2wGC981o=
X-Received: by 2002:a05:6214:2507:b0:6e6:61a5:aa4c with SMTP id
 6a1803df08f44-6eed629a9admr1337316d6.31.1743187152467; Fri, 28 Mar 2025
 11:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250328143005.880998-1-Yash.Shinde@windriver.com>
 <20250328143005.880998-2-Yash.Shinde@windriver.com> <fc9c93b1523399820a1a3b72f2da021c2780c179.camel@linuxfoundation.org>
In-Reply-To: <fc9c93b1523399820a1a3b72f2da021c2780c179.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Mar 2025 19:39:00 +0100
X-Gm-Features: AQ5f1JqOCpFSbyPStBytSVJcdC7ckBgHuD91PMlF7c37cgQcUDeonZQM0DVj8_8
Message-ID: <CANNYZj97RCxTQDccGFATZfGwf9P0u9OkysWR1OVLJyLxeR4bgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] rust: Upgrade 1.84.1->1.85.0
To: yash.shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 18:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213863

On Fri, 28 Mar 2025 at 15:40, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> On Fri, 2025-03-28 at 07:30 -0700, Yash Shinde via
> lists.openembedded.org wrote:
> > From: Yash Shinde <Yash.Shinde@windriver.com>
> >
> > Rust stable version updated to 1.85.0
> > https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
> >
> > Some of the major updates:
> >
> > - Update LIC_FILES_CHKSUM in libstd-rs and rust recipes.
>
> How did the license file change? Was the overall recipe LICENSE
> affected?
>
> You need to be clear about what changed and if LICENSE is impacted.

Also the checksum update for libstd-rs is done in this commit, but for
rust it's done in 1.85.0->1.85.1 commit, which is incorrect.

The history of changes is here:
https://github.com/rust-lang/rust/commits/master/COPYRIGHT

The latest change isn't in 1.85, but the unicode sync is - please
confirm by comparing what's in the 1.84 vs 1.85 tarballs.

Use

License-Update: <describe what changed>

in the commit message.

Alex

