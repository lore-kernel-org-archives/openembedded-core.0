Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67628C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 17:21:01 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.16560.1721841656587223403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 10:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QqrTXwKj;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so5621588e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721841655; x=1722446455; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NFIZR77fvDxNzuK7uJWr2DcBPhokh5ARWLjCXBjRyaA=;
        b=QqrTXwKjYoECrZOv71QT4l/w5fPiGU5si0oNJ0nac0GqDUag4pXZ1FWg2kxYwaYZpX
         I7IugNgZb3xVbxLbD7nzxsf9q75QlplG3y5pNR2a/sxq03tkum4jswyy3niXp7a3iHVe
         qSxmnWASXIMk2rZnNuc9u0WlQGiBwlV0natDuMUzP+eovFvLCQyUUWTTs8YBdV/OWog7
         bzWDJlP0FnaTY4D2vqSvFPc16X6ZqvOcVjLBM4hlX2E3uEmAgC42O5+RjJyYS3cqaZTz
         vrvt9CMlSKuLePRKuNGZYPdxuxuKVXMj42trc4W1fEaMNz8lNc83h7Iy1sQpZK6qi0D7
         helQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721841655; x=1722446455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFIZR77fvDxNzuK7uJWr2DcBPhokh5ARWLjCXBjRyaA=;
        b=R1cNorbXqYtvpcxLYuOgzjCvk78ozS6n5KIEtiDRDE7QADMm6ykpdfz+1CIDNpctfK
         2rNIvlpeSTVX3I13V3rVgeqUIzhCDaRVz1IlmCZ1rx9oYARXp1Hxs+TkIARhwj6W587M
         oN/an/8XmUCjqLZ4t/TLys5COzymnK/boRTaZwTpmiTMeJpgXmhaeZWLPdyEb1zOcqbw
         TLU/cRtyw5hfqKuZLjk/56lc3thiNuuphkySLZ4sF/CXlefDQpbWsahfsplpiA1gdzNU
         lm6ZazKA9wF5oztRxqZSopWy64gVidQ4Pf9PcaaZ48UR5dCLLUXFVeocs1bnB37qBuuN
         1Aaw==
X-Gm-Message-State: AOJu0Yyvg6iiHemoJRuZqCh+hbXrbovrXGO/z6E+UmzcNZ/Qn3PjqOJq
	hHbsog2RWI0zTyuV68Om45ZB3M7rx2JPWLw4VPNQNo6VD57iH3BuP+M9O7xJgHbDYwoOS4nPDaR
	FfqtgZf0N1xxzSibMWsXAXEwPfXE=
X-Google-Smtp-Source: AGHT+IFx3auS8w++aIi3rtFpT9uMSP0LbCZWneYZrnw6MdWI2pBnkxJUTeNFzTErQQFzAIsUQUErlQxTdRX45G5ucEM=
X-Received: by 2002:a05:6512:1101:b0:52e:9fe0:bee4 with SMTP id
 2adb3069b0e04-52fd3ef002fmr281394e87.9.1721841654397; Wed, 24 Jul 2024
 10:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240724170829.3456577-1-tom.hochstein@oss.nxp.com>
In-Reply-To: <20240724170829.3456577-1-tom.hochstein@oss.nxp.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Jul 2024 19:20:42 +0200
Message-ID: <CANNYZj_GkEBefDmtp_ANbdZEv2r+i_RfTAYd0TpEbYD1kUZ+3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] time64.inc: Simplify GLIBC_64BIT_TIME_FLAGS usage
To: tom.hochstein@oss.nxp.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 17:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202474

On Wed, 24 Jul 2024 at 19:10, Tom Hochstein via lists.openembedded.org
<tom.hochstein=oss.nxp.com@lists.openembedded.org> wrote:
> -GLIBC_64BIT_TIME_FLAGS = " -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> +TARGET_CC_ARCH += "${GLIBC_64BIT_TIME_FLAGS}"
>
>  # Only needed for some 32-bit architectures, some relatively newer
>  # architectures do not need it ( e.g. riscv32 )
> -TARGET_CC_ARCH:append:arm = "${GLIBC_64BIT_TIME_FLAGS}"
> -TARGET_CC_ARCH:append:armeb = "${GLIBC_64BIT_TIME_FLAGS}"
> -TARGET_CC_ARCH:append:mipsarcho32 = "${GLIBC_64BIT_TIME_FLAGS}"
> -TARGET_CC_ARCH:append:powerpc = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
> -TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
> +GLIBC_64BIT_TIME_FLAGS             = ""
> +GLIBC_64BIT_TIME_FLAGS:arm         = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> +GLIBC_64BIT_TIME_FLAGS:armeb       = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> +GLIBC_64BIT_TIME_FLAGS:mipsarcho32 = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> +GLIBC_64BIT_TIME_FLAGS:powerpc     = \
> +    "${@bb.utils.contains('TUNE_FEATURES', 'm32', '-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64', '', d)}"
> +GLIBC_64BIT_TIME_FLAGS:x86         = \
> +    "${@bb.utils.contains('TUNE_FEATURES', 'm32', '-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64', '', d)}"

Apologies, but this is not simpler or better or more readable.
Repeating "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64" multiple times
should really be avoided.

What prompted this patch specifically?

Alex

