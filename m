Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54DDC43327
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 14:57:57 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37163.1782485867835949880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 07:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nL83nTt6;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51a857539d1so4746261cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 07:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782485867; cv=none;
        d=google.com; s=arc-20260327;
        b=MNaEDkFTC6t4BEFIa3S6o9jBctIuJUX2VJEdlNa/R+VYi5IHcxLlgy2aHV6X0EuFry
         aFo5XtvFJxYCCCDq0EXFMfZIIW2CI4v4tf1SwJz7aPWPYN5q6tufSPcnTl6+JUFIC63G
         kcbf8cAkD+hFwgQVKJvOmqZsKJNGKOcjtcjdPmN+yMJKiLlHmfXtxfNBudF/T0zhzujD
         see0mCDPWUmpF1i4lAf3n2BjjQILxm5GHYycxnFbouayG1b293twOjm6ahNJ2hnsQAsW
         /2/JRy0Rp5eAAoFbaW4105wyzUbfk3JcwGPB/nMC9u/wIMfT7lWgkAK3pY4cxlb3X/9t
         0AAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VvOd07SGiDF5SuOCHCGQ4hGxnWYRBRhBP8UOIQG0kpk=;
        fh=ydN80OVXL/Geam8lM55wCsCwJshcesBoEk21wk6VDRQ=;
        b=pwBHZgeWUwd4SOPA3Ak9rcqrthEOZ5tRriKNDKNsg0rjFfvvLHu3OdE4+cpBxum/5r
         LTW1a/cXHVUsBeE/SXoEognX131ZrC1sJ7Rr2bf34lNhGz+xpI0e22rZJnXIWSw7jnIv
         6OrSDKRG0+/uj4hfpyII0STFlRecNwCHeHjn9sQqYZaxLrNr8oLVZ0tRoXYyppN/mWcU
         N0ptoKuheHxbDeYyUWjYeyRr0ymcsqY/QfnPfDPJG98jeD8Efnmffrp6KXT46gGrMubB
         X6Rj1sMRWU4blR62wLyBcZhvfMOQ2Haa1x9fPqMelZop1PEOGTntcW+Gwtdm+GoY8r92
         S2jA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782485867; x=1783090667; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VvOd07SGiDF5SuOCHCGQ4hGxnWYRBRhBP8UOIQG0kpk=;
        b=nL83nTt6BtgXMpkiuJqzIfyw23PHKPDpaKMz5fUuDUKEvOzxsmnjQtXMCHRrRJHC0t
         bxyM2dgmZSq+3TBq1uPIxfqFgdGfGaaqd3MZyMIvGiCOKvyoA5Ig62orxhrlngqoZB52
         T0pdr7wFM6+TxhjGEw/K78kaN6DAiVBdY6hGQcJv7dADRHQ9bLtmtxrB7EPR7ocvlTKn
         XwQM4lT0M//0fu0xWwX3JBIdJshgBg+GRRx/iqJN48uKEiIIQjyElh5jdhxEM017lSfT
         HXcNcHzRP/OE9pBLUoXcUde+UpTG25Lflkzv7wVCHo2VOSQcmFRe5CKlBRUV/QyNWkYp
         MDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782485867; x=1783090667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvOd07SGiDF5SuOCHCGQ4hGxnWYRBRhBP8UOIQG0kpk=;
        b=bcyo6eL7zDdUMXN+4ifDo7I91FsiuX6evbgWGRSEadZkuLuVQHl689+PA7+GoAVuwf
         gVtJv+9VZeeficMGg0uayMnaEd39UA5b8Zh/LtAfcxyv0knHHIBJk5b9eGx9AWE9/Q/u
         IFB1c1jo60R0uM6ZfkIV//cjqwR8DuvHW917Pp2lAFtrdqE/0lrXbkQzeLOA7Jb7bhBQ
         0X2UkbzsDNXCAGsnMRvVUszFBOzdcNvbHNY1vHPgD3RKih2zOxsgPCNyAAGsG8mP4rcn
         FDuX2cOKPS0PVWvEFPyPD0hEoownLkN/CEOwt/w+lEmzglDSyVCzID59KydstVRoSnpU
         0jmg==
X-Gm-Message-State: AOJu0Yyb4DG3XK4zVL9vl6bigFOVJ0mW/ZiOmky9HQkmH5RgNqEqLw24
	dJZvij0t9L7Kle0GILg+7LqRynyQoWO3glGVX4C5i6H2lcvjqQdeV6AIcqJyaoCv35GkZg8iOAZ
	WZtcEHqOvbOk1E6LFL+TxJ52rmIDtxe4=
X-Gm-Gg: AfdE7ckeEwhxEkoDIzv2EDh/7q4YsK7D3Q3rwYJ0pyE0ehtJb0h/nJdHtX11tYDggC7
	PtUvQzlZyAs8x0kznxgufc9fwi1AvgfvtSahgMzxQbyiOpbZE5Ngyxk+4wxj4hTRukamorpUIDL
	bJFXpSDcb0pg/9qc35MF98fHWim6tOVo8Y3FteYFhm5l5WFPDQC7Vma+dLFduseESlrm9kNveeu
	Ldwm9Jg317amqLsDDFj6aiyxMo05QWpnok/ef8TW9vg9OrgFhXePdcXJ2gLsrmFTm80xqqeLw==
X-Received: by 2002:ac8:5f85:0:b0:517:83e5:7859 with SMTP id
 d75a77b69052e-51a72a8d81fmr103027081cf.53.1782485866786; Fri, 26 Jun 2026
 07:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
In-Reply-To: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jun 2026 16:57:35 +0200
X-Gm-Features: AVVi8Cc4Z1UC4c_qFPKZxE5KMFDsJg5ghBcM8puiim9SD6yGwXkr23eYg4TTL1I
Message-ID: <CANNYZj81E4G9gSBPHNNsxg4JiJ_wEnmCoSkNdQ2bzJBjF5q=DA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] RFC: Fixing rust segfault (#16058) to support
 Ubuntu 26.04 on Scarthgap
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, ccasciato@21sw.us, 
	paul@pbarker.dev, randy.macleod@windriver.com, ross.burton@arm.com, 
	sundeep.kokkonda@windriver.com, SunilKumar.Dora@windriver.com, 
	Alexander Kanavin <alex@linutronix.de>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 14:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239641

On Fri, 26 Jun 2026 at 13:38, Yoann Congal <yoann.congal@smile.fr> wrote:
> I've hacked the backport until it passes testing:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4085
> ... but I'm really *NOT* sure this is the right approach. Hence this RFC
> with the patches I ended-up with.
>
> If anyone could check/review/improve these patches to help me get them
> to a mergable state, that'd be nice. Otherwise, I would have no other
> choice than never support Ubuntu 26.04 on Scarthgap.

I had a quick look, and they're basically ok.

The key check is to run ldd on the rust-native pieces and confirm that
they indeed start linking libLLVM*so dynamically after the patches (if
it comes from rust-llvm, it's probably named differently). E.g. on my
master build:

alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ ldd
tmp/sysroots-components/x86_64/rust-native/usr/lib/librustc_driver-5e2c75e9f7705310.so
    linux-vdso.so.1 (0x00007f8f929d0000)
    libLLVM.so.22.1 => not found
    libstdc++.so.6 => /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f8f8ca00000)

alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ ldd
tmp/sysroots-components/x86_64/rust-native/usr/bin/rustc
    linux-vdso.so.1 (0x00007f3eee009000)
    librustc_driver-5e2c75e9f7705310.so =>
/srv/storage/alex/yocto/build-64-alt/tmp/sysroots-components/x86_64/rust-native/usr/bin/../lib/librustc_driver-5e2c75e9f7705310.so
(0x00007f3ee8400000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f3ee820c000)
    libLLVM.so.22.1 => not found
    libstdc++.so.6 => /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f3ee7e00000)

Alex

