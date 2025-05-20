Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90D3C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 12:54:32 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.20041.1747745671655054366
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 05:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TwM3qJM/;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f2c45ecaffso51434656d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 05:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745671; x=1748350471; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cYyfVfMZLWW43MpybuDwmqgHPe28mIbOFpSSnxe+yeo=;
        b=TwM3qJM/u1emNKfv1Tn2GH3yWVD4TbbPDjfoAtE4Kif3aG6cIHLxBDtRUxO6iayWbq
         RHVhTCY4+ZZfnZeapHo3hc9/q2dELu82Y/d9HVR0VZL8jBuVcxzYNCFuxoaokfMBqEld
         7OolNXNRY1RRyHutyiKw5fZE4XyGIBSXEOTu8duntBsrHw1ikoF1HHZKQzcKnKdkSh+W
         SbO2VROUf1cdE6wCXrOoEFEQdspW7Bo1SbMjvrCqJl/ZlYa0Pwr206oYbeKNmYJf085Z
         KOosPjv/Yb7pBv4x4A1GMaxFgxOvKdmcGPmreQkYzCT0+6ZqW+UZFYz5FP/OnsYqymVT
         lO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745671; x=1748350471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYyfVfMZLWW43MpybuDwmqgHPe28mIbOFpSSnxe+yeo=;
        b=TUt73OezSocYgHYqCDsqAh/BjfkBUh/mGTy1V5JLYLCYQeqFQJshh8GSMSnzOnnQA8
         L0IfQkoIGAg3cOFCw+MLTX+/4xfbbI6lTO4jjMzbi4DuOSVLeutzp3KNmldaR64QMbVY
         oYZY/7fcwh3bnjlpe3vHzUDYOqTP0jEFuGRXmuGrlwVcaS5RD+zatJCUeZVYsk+RWE46
         8Iu4mbYtTucp8iKVpT+jU+8nXTp0Z/R71d6tvbY0asQgc35JzM7e6DmOM0yGWzvvUFmU
         JcsDE6BMxaThJ7TXzkVIjazNVkIRc4CNZMhZ2b8PMdavNSWaOjaOia4U1ner2MdqAA2X
         mlGA==
X-Gm-Message-State: AOJu0Yx+64DKDsodT8F8d7U/HGJMugbox7MalMBmw+cjDd62SPLnMvdJ
	LyDpGpO+Ds8Vcqd0vyFaHsXJrAgZ4A689RngqNyZoopsB6wGzk8C/R/GV6gxH4Ni5PAmIpUIVhb
	+T5dt5d0phOK8mYnAxhxacZ8F9KCHWUcsWg==
X-Gm-Gg: ASbGnctxCpAipyAPMZvVPDXEY1gKYR4J+YrIB+ATizmMT1NQ1PwJY9oIxWrthY3P2ED
	x3a6zZpkxyMcC94ls1XaHjcfmn2p7V+3REV2USxdEtSqFAXOSFFUJJ4BTTOq6oNHqxvu6nOnxyD
	5htPiuwqUOJ7SH184s/uUgNLGRVsireXmbzg==
X-Google-Smtp-Source: AGHT+IHaFaPnQ4DMD7SIp1KztN9Hoel2GI3HE6EEbsBzMUgB+JE4bmrAWpxNoNSvIqTGhKCzHEO5AjWDm/JAAFLKfJY=
X-Received: by 2002:a05:6214:21aa:b0:6f8:e66b:5744 with SMTP id
 6a1803df08f44-6f8e66b57camr34251886d6.18.1747745670588; Tue, 20 May 2025
 05:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250519081000.2298461-1-hongxu.jia@windriver.com> <20250519081000.2298461-2-hongxu.jia@windriver.com>
In-Reply-To: <20250519081000.2298461-2-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 May 2025 14:54:19 +0200
X-Gm-Features: AX0GCFsXAXCvKdOtA5frXIDhY-qoYL_nV3_hCPOnLd7YudA-weK8UNhEuHKQiK4
Message-ID: <CANNYZj9RPcXfkkD1hhMeZTekOMG4bnwjK3d6CWbJF3KUeV7m6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] patch: upgrade 2.7.6 -> 2.8
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 12:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216907

On Mon, 19 May 2025 at 10:10, hongxu via lists.openembedded.org
<hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:

> - Drop backport patches

...

> -From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 13 Apr 2015 17:02:13 -0700
> -Subject: [PATCH] Unset need_charset_alias when building for musl
> -
> -localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
> -which actually shoudl be fixed in gnulib and then all downstream
> -projects will get it eventually. For now we apply the fix to
> -coreutils
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - lib/gnulib.mk | 2 +-

This patch is not marked as a backport, rather lib/gnulib.mk has been
removed upstream. This should be mentioned in the commit message, so
reviewers don't have to go and separately check the tarball, or ask
questions.

Alex

