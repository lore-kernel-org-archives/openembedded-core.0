Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FDECA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 10:40:49 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.36085.1756982448726936826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OvAwLsvb;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b109c58e29so16492011cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 03:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756982448; x=1757587248; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjzD00hPYDf/RWnEEpxuJxniYSZMM4efctPwsXUooWs=;
        b=OvAwLsvbZEpS4JJoAF7uoRMZp+Gon7oLGFhW7du3ZGgpvX5ag0aiEaMSD3La8tFZqw
         o7+618m97OA3Cs4Wr/IIapMcvV0Hx4dddYHdRx8IH9PPmL4apVO3J7oDchgCwqMD/Jhw
         Lyr26/QduJNk4ZuvVh/CxWFR9aIHAXL6bF1k57KqK+aNLyvMQC7H4dXvRSUEDjntQFby
         aV/nE2/zb7dcM19qeMzjv6jVC6oXs0v99eM4gp4DkQZw27Gosf0PHHimG6TyELhKZYFI
         lfElqGvmPs0f79z6yz8u41WXUh7CYei/F6rBARM8zfVlxxjVDQzW5lu7MjQjkFGDfgAF
         rW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756982448; x=1757587248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjzD00hPYDf/RWnEEpxuJxniYSZMM4efctPwsXUooWs=;
        b=tM6i8P2fIt04F7KP00mEXEMtLP1y4KuVtaz3NT5JIOw3ZJ1jhKou/oFRDvgfBU0q3o
         cJccC8h/zCsLEdZGX+YvvbMe9LGYgXoXfUq7yg/GYUS1JI3fxpjEaOT5kP4zMDktUxDK
         1GXJHDqR2BI9jbj6Qsn9lFLYrQQlatFNLThhDffOD0HSl1tzFdQ666og5W0/F6+SQD1c
         G+ZmOSgVbWsbswElBXbRI+uNpE3vZAE4Cp6YyewApkE+zMiOiM8fJ/KRvYy35HIFiGnf
         gs2g/T7w0+oM27OZ0TO69fx857s1i4foKSgNuC2nn+Gk/KY6bO396XNIeLWQyZUJ8gli
         MaKA==
X-Gm-Message-State: AOJu0YzlDdGh49k/26Q2VKlPNlNmM259BQpZk0BfX+mRKUdvcP3AGars
	U6p0wCZ0dNMhGtmibiR9C5gcohaoUcgy+BqbBPWpSE733utstcOex+vSH2ZrRKS201/brMwMm9V
	PfA/1Om4Gamx/UqYQUrFSJYy/erikY13KdQ==
X-Gm-Gg: ASbGnctFzvNx7PTRwcCYmZkBa3i3t03UeHjppN632MT9Ca+rpRnb8/8fE09TCk2xB5h
	aen2T/MztahzgapBOJNzHPJeKBKIK7Vgsvg2OdhG5ttnCePJe9WY5YK46D4qh4Ipzl5znjY9tZn
	z1W0QTremvU9kUV/s+LiUVugU51ZcZI8nzujSvv2i3CidYh2JjUABxSoL8jErSifB19B0im9ek+
	hRqWtM45sdExJ8Kgf6zlOdG3/7bGJFavTg0/tAMW1EPFVl2Nj2c1+1uLgva2VT4hoc5oIKqrLBB
	kfHS8uL9IHKunyZMCkUiOUuCPwkzWKoHgVPHfHoDFmXaqxhtWXA=
X-Google-Smtp-Source: AGHT+IH8UBXiTDZztTOPccyQle2uxCtDHLpwuw4hLaqmdlqCxenW1emwkuQT577dksUR4qUxvwUfWSbs40FuV/xLTls=
X-Received: by 2002:a05:6214:27ed:b0:724:fe81:9368 with SMTP id
 6a1803df08f44-724fe81960fmr56293886d6.15.1756982447639; Thu, 04 Sep 2025
 03:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250904051239.796948-1-raj.khem@gmail.com> <20250904051239.796948-2-raj.khem@gmail.com>
In-Reply-To: <20250904051239.796948-2-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Sep 2025 12:40:36 +0200
X-Gm-Features: Ac12FXwmCfCqgMLaRrD90HNpRX2PQT-8kfpfXeyEVpSnOcf_hPprgsAi15sbBsQ
Message-ID: <CANNYZj_zshmt7W1gpXh3Sfi0cVDpyRHfoqSmV9K1j9sAFmbCVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] kexec-tools: Fix build with LLD linker
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 10:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222915

On Thu, 4 Sept 2025 at 07:12, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> +Subject: [PATCH] Make the segment base match pinned section address
> +
> +ET_EXEC uses image base of 0x400000, but the build forces
> +section VMAs like .text = 0x10000. LLD now errors when any
> +section address is below the image base unless you explicitly
> +set the base. (Older LLD tolerated it.)
> +
> +To fix this, set the image base to match forced section addresses
> +
> +Fixes
> +| x86_64-yoe-linux-ld.lld: error: section '.text' address (0x10000) is smaller than image base (0x400000); specify --image-base
> +| x86_64-yoe-linux-ld.lld: error: section '.bss' address (0x12000) is smaller than image base (0x400000); specify --image-base
> +
> +Upstream-Status: Pending

Please no new pending patches without a good reason.

Alex

