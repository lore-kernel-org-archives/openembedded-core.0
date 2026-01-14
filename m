Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE379D29FE8
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 10:50:23 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7440.1768387815232348977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 02:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=myXEIVGk;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c52f15c5b3so85682485a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 02:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768387814; x=1768992614; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ntyE8KktNMLB8gDtFxdnzZGopE/lmqYtYTDwEpKBPB0=;
        b=myXEIVGkJm6tqgQPR+XUpwfNspLPeYxXdhq7mt5qAJ59ILoEo5pqwUikECg775qPBr
         thH9V0jZVZGKPVYz8xvAekAaO+IfOmZfD9sOOBD5HbnNTzv2va1G9EnyVz+CenTJE4wN
         XETeZgMFObCyw9nSrnw8zw+QR5JixLiYI4e8Kg8smx2MDFg3DhRoFhPTVOhmE1BQHo7y
         /H4mCef7wf8/P7r2mN6VKFRorT6AWsdzTGKMf1Gq6g4lxedsuuPGYNKMn/6N5ABJdlM3
         sRrTLKTruPyh4QjBc73jloLvQsl2Cqk/RmuAjGYtUadzVMZtt/3WQvyji8M4Yi0QzqCp
         by9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387814; x=1768992614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntyE8KktNMLB8gDtFxdnzZGopE/lmqYtYTDwEpKBPB0=;
        b=kfO44+/b2ADauxG5uXx/5/cDC5T483un6A/NdD3jeRu06XgOmoNx/ZyawBv2bQj6UK
         D+ORv1xQnQkkKMriXHic0Col3R7Z3NMhKLh2BcP4fXwVaxOBtVnqzNIbiLRMCadrglDa
         AkQxB48dFqVVMqeL0Prd3XqDNDJa9oQev3DSG0aetxdSr/QuG50KOXlITYb0lmuz7KNG
         GVqHv2vUzowSAAxQtT605zFj7IB8dox0mr2mhpH7PHJms1CAe/KvCZZCq1ByAiq/zuLU
         lYPDxM5eLth7Cs2c1gAsnFhJjbtEzo5Q7bM00q1pi3vdjYK72aPWtlcLep6qFkzpB0iS
         CRXw==
X-Forwarded-Encrypted: i=1; AJvYcCXxuOg2SH18Cge/+77o8rEYMbo3JmgoaNLXSWbslpSQTBfIDwdy61ae1frxPxc005h0SdMo7C+ZBCXXDfKxoiLAqg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxXxsXFGvP5BBwxM93pCbgsxNQlJsKChRRttlslwi79kGIJ17Rh
	1stQJBIRXXz10lRd6mMvhqvIB5xSKqymNda0Fda0rU/strbMfMj05v6+A8ypS0/Pa2CB7o3AgDR
	ZWFzFVyS+EtV9hzsnDk0V8hgoOpdoNoObWrfA
X-Gm-Gg: AY/fxX4BXedEBlaApOEypD6iutIVvQnvUEWrqhYb4x/Jj1RBsZobcfMFWTSU/zs3NYL
	K/ryomXt7zgmizxZwI3Be68ZbKEauT5muUbZX44CA8vlvZAYMS87Y5OT3YVIgAGQ7055rTZB9EN
	Cf8ENAKsE6qABjpO3QSqDplLVxR+LIAh1/sgcE7JvqsiFTWFUAxBJkwSv2EFvR3svKujbALG4Fs
	D4Xjv6G1d5o71bWBEqgWNT7GsfbJbPc7DUm/wTrTJd0t+qWU4I9DSMhgnX1ygYDEHDOjxQs
X-Received: by 2002:a05:620a:1721:b0:8b2:664a:309b with SMTP id
 af79cd13be357-8c52fc0cd2bmr319286985a.84.1768387814130; Wed, 14 Jan 2026
 02:50:14 -0800 (PST)
MIME-Version: 1.0
References: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
 <1750203584-32065-8-git-send-email-mark.hatle@kernel.crashing.org>
 <CANNYZj-7dDr=UwCzDHW-EqMRPWvsSKX3DABLoAtQx1D0ba8k7g@mail.gmail.com> <4ba4ca643eb20de0eddbcb4895598d22831b12be.camel@linuxfoundation.org>
In-Reply-To: <4ba4ca643eb20de0eddbcb4895598d22831b12be.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Jan 2026 11:50:02 +0100
X-Gm-Features: AZwV_QimdEquHtOKkOX7wGNuPksddwrSo1KLn2G9sNdlvax8rDPJHiDrbm7PY7w
Message-ID: <CANNYZj8VxKnzaq67qmXEziy8k+iMn-n8AGBQgC8rt48P8b35ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/7] rust-target-config.bbclass: Update for
 new riscv TUNE_FEATURES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: mark.hatle@kernel.crashing.org, openembedded-core@lists.openembedded.org, 
	Paul Barker <paul@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229318

On Wed, 14 Jan 2026 at 11:33, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Nice find. I worry about our sstate tests not covering this. We might need to do:
>
> -rust_gen_target[vardepsexclude] += "ABIEXTENSION llvm_cpu"
> +rust_gen_target[vardepsexclude] += "ABIEXTENSION llvm_cpu TUNE_RISCV_ABI"

I thought of that, but would this rebuild correctly if someone first
builds for one TUNE_RISCV_ABI, then for another? I just don't know
enough about it to run experiments. It probably would, as that
variable feeds into TUNE_CCARGS.

Alex

