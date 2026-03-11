Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EA91049518
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:34:55 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17178.1773221691466456686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dYSwV/I+;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cd77786e97so408878385a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 02:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773221690; cv=none;
        d=google.com; s=arc-20240605;
        b=H8Gw4CB+fsOacIRCJg4rxhOrRiX1hMCdGqifbbJs2C0Ee95OBT7dCkz8OIpwIV0tDr
         0LHbEAn1JuS8An+gTmJ/hwtUZh4MG0P6/Ou5wDsyFaws+OYmM3FYTHZhd1606bPeDH8b
         qKGJ5g4HZDdz0z12sMXmjXu7jqMYZIopBBJuBM5xNtDt2ef/pGhEfmcnsEFMb0x0Z5Gb
         m8omypoVAIyCJEetIk9K0sU5+p0xpSu19GN28ryef92I0M5BNTXVDdhFPMNJweR5EFFY
         FGqQA2bBc4VPDzZBzZtQ+08nF2F8nPX4Sp0dfFu/c0OjyemZXWSZpVHGtalWQNyvHMSJ
         2n/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qArGt64HYeS3TE0/dh+7GINpNA+AGjWNIx5+btcwvIo=;
        fh=cbgl5IOPsNxVRhYTH4PVIGJOnA+jpdWoNWXXxuAa4Z0=;
        b=QwWuBZhgFoiF1nZ9ohuVeWzERKwaNqlU1W7rIz3n0AU3uuIK4oPAby2B7K89ucvV99
         9xr+tQ0OEm5Hdzy0wu2fSmvrII2EQt7G+8Ly76Rd5dj+U+Cz4U92owrVP/7eHZcptnNS
         2j7zIeXdbjT5uZMXS6hiGl1iqSjYTb+B1bC3PhcMmCJq7DVOwyLLDqQChBO4Y4yHPN3L
         NiwxSgGIkVyXN14eM0dACgqlgCBVWD6btaxRb5AxtCNVdHDgku0Q05s5fGw1Xye/9J3M
         PI1toP+GUvJrarB2hGcsigWD0Oy4GUB4S2fOlL6yAXwTFHPGM7JFsFn5shpu0uqS7c4M
         fNkw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773221690; x=1773826490; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qArGt64HYeS3TE0/dh+7GINpNA+AGjWNIx5+btcwvIo=;
        b=dYSwV/I+Hin/32ZS6jRadrg9DqDjR1wRwoGA4zvaQkvF04JtDiPfDvKUgeUbS5orHn
         d8SxkVIFT7oQ8J20JJkeg0GubvkuQLSUflvi+KodjXCDOH7fDV0eYtDpUu7Km35GdFaT
         YboIvJKwjrpfd81FYILl80U2IEcINUEfhP1RRC1n9YO3Nlo6v7jLZcg75XzMV8wg8dDi
         ogn28ZGRfxn8fBPzinXxDxLd5GDHNiqiSBHG3HrtbB/+VgvXxQFsjv9M3G4yQ/uvutXQ
         2LNmkK58GM+R1d80yUKBWXXQka3051fL95crES6da26SQ2IGJXtJuYix6ksq6iibwEFE
         rLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773221690; x=1773826490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qArGt64HYeS3TE0/dh+7GINpNA+AGjWNIx5+btcwvIo=;
        b=skJ6q+epxusnHDJcUyizGdATfRo1yvyW9HZZ6p4d53aEALpn43nNF9ncCKkHmgHd/2
         KqS0NrSSrhmlU8VWTl1xiYO5pXZgOG+LZuX2kGQKT2u3X86/47tGUhoBQ2BqVqCMID/2
         u7A/xsJ4vUkSt127jdEPTtug3+vWbtGSuyqR4XYObxz9DrCI6Qf5XFOi3oqjyDuUMrgk
         ACBpkALuE0BTdzbGmYobytrs38bHHd1AkoIA53+A+7LVEWY0iajuSSehibTKvULMUymZ
         9bQEci5T80W6qboahwbFjXXa8dZZleZFocCOtSe4danlKJVrvjpWu9qEfEOb/QaD39IC
         jElg==
X-Gm-Message-State: AOJu0Yw445YKdLycP57CC98PGNo9vgQwRUzcuDbR9dZJ4Yd2r/8XyT+h
	hlZawpNI6Lpv/pgJBa2jCuK5n0KGE/lP2wKcl+iArY//sNk0JDPuDJloHaaprmK2X6mk74uSJI5
	K9FIWrZyFLrvpWqm5gGl411fAR5nak1yUSw==
X-Gm-Gg: ATEYQzwJh7dDVuUfn2Jex2RhDc7X8NWgF1FIUNz5F9RVLO6bGZ1FzfdOMMjRz+e7IrM
	8LUn1MuHFtFYULgLiP1+1TfOXNE6A+ltdTufTsIVbZyZHzhgXkc+3Or4nCVnasNOq0eggdy5BNx
	dnLVq8c1ebtSn2XiS+Az5sNtfL/NRZzxGnihRacVqIFglLyL84llOEmqujUI/pb6bdNab6MGd+4
	/oH6agXW2lqFYaMdya+RYNYAKXZm1GTOmqZStLTks5W3VbujhYDSVTI+holCN4EK3bfh1fsyQTr
	aCKnaGxKy8J0Zi3WFol3yBZVLfBqgIuuFg/niG0xwg==
X-Received: by 2002:a05:622a:1448:b0:509:348f:bc15 with SMTP id
 d75a77b69052e-5093a1bb292mr19770421cf.69.1773221690440; Wed, 11 Mar 2026
 02:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260310233310.3364647-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260310233310.3364647-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Mar 2026 10:34:39 +0100
X-Gm-Features: AaiRm51ONp_A9M_iIUUuUXjppA13avOnlV8I6l57fTVXsa9AuqWNYU98gBC-wxE
Message-ID: <CANNYZj8c9mnr5=yGKHuxnd1p4eMcwc5hij6iXZ4F_9k8aHBP3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] scripts/runqemu: Allow VNC use as a
 fallback when there is no DISPLAY set
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232852

On Wed, 11 Mar 2026 at 00:33, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> +            if "-display gtk" in output and "DISPLAY" in os.environ:
>                  self.gtk = True
> -            elif "-display sdl" in output:
> +            elif "-display sdl" in output and "DISPLAY" in os.environ:

I would also check for WAYLAND_DISPLAY here.

Alex

