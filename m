Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16EEC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:10:24 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.11907.1747314624223825842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kTa9mCql;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476b89782c3so10435771cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 06:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747314623; x=1747919423; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YNgfaWrOIqp3rOZGAMJfy2kSYqnwzyqYQL9b7MoxXcU=;
        b=kTa9mCql+gL8qkOiIWPzi74VSMrZmp11SIQGREW28OORnBeLO8kAU/oqdiNMdKtwat
         50ByeaPD/VIwoOWvROcaGQtWjsCOcoOj3XZbgpZAF7P9pEChUkZ56NRpdWptNt6LqapL
         p3o+oC3C4uO3V1hUloJ1Is7LfrkSFr4bQTwIGbkIpsO4ezrlvjPh3z5NFTXH/8S9ZgLo
         U8LHPDTYmMERTrPYGund7WYnQAbjKf6BKiIIsyhMBjxhdq7mFRipiOYhRmm1SBsDAqXA
         dfxIt0Vd1JU/d/jMG6Lv3u2i+RevB8eSSZGOd1r0ZEJw+TuZa5CR+5GX0qNEtQdR5yaB
         Mtqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747314623; x=1747919423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNgfaWrOIqp3rOZGAMJfy2kSYqnwzyqYQL9b7MoxXcU=;
        b=DYy6ZHMP3FDBd8NwMNfVinq+QFPOYbUozerPjKTjpvJ3fgU9XqZ8OBOGUhTpkWfzex
         /6MXxF6+gNgmiyYhkWyOxt48hRRRA2b/BLHRplWvd1ikxg2y8DHWop7CFaiDvbfoOM70
         s1Tp4sWdSK3ou05L4yE5UGNfXc7zMiA5bPnXsa9Nrvvr7svfFMOhv9xBW79BbgnpoL6O
         l7oqK9ww8BiGj14kGhr4xD2oMdn9zAlVL72FkRl9E1ibmhdL15Z/I3DD3CF1dkGgq+Jo
         6mPIUzRHfb7RYxWpyP4YhTQa/8pi0reTSTJmFQdH073UU3dYzDd2dZxU/c/3ON9gj+SG
         NqMw==
X-Gm-Message-State: AOJu0YynaifSvzobv4FvwlaXbAAqHI0/6zSRNTWGw64UcHZYyD+M/0Tu
	uIGdAGsE+RoyfR/cY5OTPtdzKk9PAhHSrADmth/rMGMD4kKVTe4gWEzknBx/Kxm9bWaSRIAin8X
	frenRIsiwiyEhCPETnvIUAdJa2Qw=
X-Gm-Gg: ASbGncsdFgDHTGAZAsc9JewWhv1yPPfJIJfJ6hesWCdAGK93zjTnQ6K9Xc7POsNTRls
	IyPyEbFjAbusOvl4YxXK0HyjFsWU2E4MDqZEfc15p9SaeySpm6qAQLQziJgZJ9QPDX6CcYpvjgJ
	wA+QB6CEDf8AF+CiFs34uei8SXMm3pz1O9Ykjd5U4VX/oEhEifRCK2DvDD+IAitymdKhhKRNvE0
	ao=
X-Google-Smtp-Source: AGHT+IFFTz1PzIAahv3gtvD+i/7yniktefcO9KVCM1+Jr3dLLRj7Ftwlx11FDGxkUnP7jsX0yY1vsm/WdpAID4QD0o0=
X-Received: by 2002:a05:622a:1f90:b0:48e:1f6c:227c with SMTP id
 d75a77b69052e-49495cdea0amr130378991cf.39.1747314622953; Thu, 15 May 2025
 06:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250515130753.326236-1-luca.fancellu@arm.com>
In-Reply-To: <20250515130753.326236-1-luca.fancellu@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 May 2025 15:10:10 +0200
X-Gm-Features: AX0GCFvGiLPbaQRTOsKAIClMWseXJ5L7PDP0EBAFHsMyehX4MH2RjvbJtRIFbDs
Message-ID: <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
To: luca.fancellu@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216673

On Thu, 15 May 2025 at 15:08, luca fancellu via lists.openembedded.org
<luca.fancellu=arm.com@lists.openembedded.org> wrote:
> Modify the clang recipe to provide also the python module
> 'clang' when building libclang.

Why? Can that be a PACKAGECONFIG?

Alex

