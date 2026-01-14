Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84448D31A3C
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 10:16:53 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7190.1768385807023668361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 02:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NFoc3mge;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88a2f2e5445so103077676d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 02:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768385806; x=1768990606; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SXRp0jd8fRt5OXJsjSZAwjbUzUzot9vM8hq+I38YJAY=;
        b=NFoc3mgeH3WLuEdbyGxMt0gw9dfInb4W2EvpGxKNfAnLtPmCPMuVQzdBQHAK25oUMv
         krVkqYADbNGAn2BhvQuale7a4UextwuE2oNTHuOzQRQUII/Ab0wu3rqQm/6NTHBoToq9
         gh6kPEBm+42FcTr72Gw3jGQitmsXGOaWkiOUov3hcnGGm2KxLL6n6bQSa32rX8lTVath
         70yD6fzQDqlMG/wfH3V95W5fs5ZkyKmliS8uykkedAqL/odqHsu5t0pVjUsrqClSbF7+
         YfEgIiMt3MrF6/9vEJyEU5Yay+wY+euugZUe0hZDj9/IDrF8NtfYxO/TUFsydDBqCes6
         Sm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385806; x=1768990606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXRp0jd8fRt5OXJsjSZAwjbUzUzot9vM8hq+I38YJAY=;
        b=iSRQ9liHQhFQvYbyoHgQLMkjVKdTEA8xVGxI/KmhXhCerLiNl1PZAyr5qBS421tES8
         dmHgiCd4ZBYdI61TWTy4Gw3gnLfR45sp4J4AF10UGrfR/tbIcBRzeNyCzmEj6W7u3AFM
         YTjZdFio5YU8sYTRR2kViqHZ9M4rHXMgyJiFP7PvDLB9d9VjVKqRhQ36Sa3I/F/wksCk
         fzYt4Q7J1laAu4ObavJLQj2U3ChG6aD2FOgVIXj+9nFQPfaFV7JLI8H9n9euC0HsY5JG
         q+/L9ejJo3Gub/QAbXq4fzmEbYYJrx8FLd07RJE8Okk3Hq0RgemqrBYEPQKSgum4wVFf
         I4Dw==
X-Gm-Message-State: AOJu0YwB7asgyqrOSdFlgDhh4LBqQCompn6dtIIXN1cHgU7zqUUID0Wx
	VFg9heYY42gSmSDrPMU+wUXSHRQrpQH4p7qphxAqPTv+cCvj8+fr91Sq40qnPZVkgw2pVB0ADXV
	9mPhxUHd/7oyDflQ0xz4/AjyRtd+VZ2w=
X-Gm-Gg: AY/fxX4JyYWY0xKquev59mrNHzhn6JpaiH6hans+W36Nin36JgrfXTk59G5U0IN/VYo
	ZF5zw4DmSEPKGVnnCa+VcucMnGyZS5uUgRZxD6itdbV8IOlOkCFGG+tOTtLmEBGP5vYVviwMQsO
	yCHAxt30U4BowQ/Nvj0AzqBLxYZCkmaizqDQh/k3b6IMcrJmSoeHGbCmyo7Rg9xLnjlXkjM1MC6
	aIsgcwNDL+DuaPDSB03RyJoc1GB1NdyzYqsSODK1iqiHlnwTWBmM93qs3qJI/xt8QuK0JNi
X-Received: by 2002:ad4:4ee3:0:b0:890:247e:dce2 with SMTP id
 6a1803df08f44-8927431b6b2mr23869586d6.1.1768385805981; Wed, 14 Jan 2026
 02:16:45 -0800 (PST)
MIME-Version: 1.0
References: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org> <1750203584-32065-8-git-send-email-mark.hatle@kernel.crashing.org>
In-Reply-To: <1750203584-32065-8-git-send-email-mark.hatle@kernel.crashing.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Jan 2026 11:16:35 +0100
X-Gm-Features: AZwV_QgRyRKzhLPruQE7xgCJ1T-XVvw_b4Os_TQ7efWbYULaK3E7sWjJB2Xzmok
Message-ID: <CANNYZj-7dDr=UwCzDHW-EqMRPWvsSKX3DABLoAtQx1D0ba8k7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/7] rust-target-config.bbclass: Update for
 new riscv TUNE_FEATURES
To: mark.hatle@kernel.crashing.org
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker <paul@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229313

On Wed, 18 Jun 2025 at 01:39, Mark Hatle via lists.openembedded.org
<mark.hatle=kernel.crashing.org@lists.openembedded.org> wrote:
> -        tspec['llvm-abiname'] = "lp64d"
> +        tspec['llvm-abiname'] = d.getVar('TUNE_RISCV_ABI')
>      if "riscv32" in tspec['llvm-target']:
> -        tspec['llvm-abiname'] = "ilp32d"
> +        tspec['llvm-abiname'] = d.getVar('TUNE_RISCV_ABI')

Unfortunately this adds a dependency on TUNE_RISCV_ABI (which is set
only if the target is a risc-v machine) to rust-native's
rust_gen_targets task, breaking sstate reuse for it between risc-v and
any other target. I can imagine other native pieces written in rust
will have the same issue.

It's not immediately obvious to me how to address this, so I'd really
appreciate suggestions. The code is hairy.

Ticket: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16132

Alex

