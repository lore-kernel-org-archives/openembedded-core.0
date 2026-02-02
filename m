Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50681E7DEFA
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 15:52:59 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56171.1770047569898331618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 07:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QJiBl3ou;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso54995386d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 07:52:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770047569; cv=none;
        d=google.com; s=arc-20240605;
        b=VgfwPdF9jCfaduEHBcDfE0VpGk8Ub8XaBmKzp0RGKKK4gpSanatwqQ11sM7ww5jftF
         3LWdNxeDFmzbIB/ApObyow7GLXxcYQsCVsuuCqOVJRL5hToqsdWQZbWedjwM4FsR9s87
         gsSjknT0AbRvT+WcJxIpxmWevHwU+76hZZ2h4fMZRsGRP3BImDN1Uk1HSjURQMCeFDzG
         HiZQF6nZ7nnWjj1Cjfukvu8IzeX2z2bvtE3AMdXQiVSKnramUiIBoEW/Wt2d/IAqeJDF
         3Z0PmC/KR2jo1Ri/fgTcgd/BgNpFhKAEH1wjZ3sKuMQngsRwHp4wO4R5TmRxsFKqFdWl
         WpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZUxtmWF4Dccvi7YbBpsYSjiskSMijstQA8+gflbBdM4=;
        fh=85FywoQ4TyE09dpZ07ihji6RE1UFygBEWt/2b8ei3sM=;
        b=COuXAq1vYorW3LVYwzbNUsZv7JxBDqBAXGryt3xSOkNsSO6Y5UNtJO1VDJYOiai5Jz
         sL73nJEl606jlPu3YqYs79cbf8jvRGVUECkpJLysg95jF0TYcZ7gp4Yn79sqbcTbyNKv
         NTRvfTOzBM5qESmApuJRz0aOqFeeWmE25RRVSCWzWCzebgxmvh84NZNkyhqbJOdYOt/i
         TDpI5GVRMg7QP/23bywXcbxc6PDO2GQcVTBnGRuAAFXR9M1r+DRs7lEjQ7VIxvxYQurm
         QQHS1oDdMLfq7cjSLx7kjzZy4WxkIfUF9URaUpoJkvXZZ4/HbKiA6sCiQs8BLMmuReUZ
         kCgQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770047569; x=1770652369; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUxtmWF4Dccvi7YbBpsYSjiskSMijstQA8+gflbBdM4=;
        b=QJiBl3ouJMzYD7pTsAypUiiCvvRsMpojk9fLLsRdC+SrxapyyGY9qSYhSt+u1V7B42
         CYN1Ujd+zD2ge4yig+m8Sb0JzzoAGgCtUqOFwBCMjEyVKQFx1x8dvCaOf/hZ+mJ3TGwq
         Ycz4Zn7HYrVIb41iNq+nZw8FtBpZJdoJCRNs/Qz8Z5O0gJyahb8G4dRWeShSOdxR+vQo
         z0Lh11xCvyXj7Rra6WkzfSwFd2w3I+DNctlRH54hHBtQJgj7g1S2BvtaQo/x3wxosgaH
         XikzZHMhxkdq1L5gN6xWXNMoL6sRo33zidxICgQB560PrkmnknqJfxi6Tml3abFjtOYu
         RI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770047569; x=1770652369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUxtmWF4Dccvi7YbBpsYSjiskSMijstQA8+gflbBdM4=;
        b=XvK3h+FBL2k1M6RiJuByNG8k6V4MziiN9W0uIF0DdAGqW9dnI2H/R1lR7SQEOViI27
         sRT66MYM12Y0WuBi54SSjBubfWm1QmkRHHLdm1myexB5I+/Ee6YlZWRDQHCibag4cXfG
         VMao1hVZ1AN9HdhrkQZFGvRRJEviK7Ndk1R2VtbFdplwA/SAB7gVA3zGXNwAigL7cUe8
         +UBNlDZW7GZcT69eGrpU1XmF9g81KS+2ZEpGMq5snnlLINwf0CkzM2Wx905nFNpvCVse
         0eRW5ZwLNE1D6qMdrbl+W9wkJa8zyRGaJ9IEbpogthCAewQHMDCf7GXSxPU98GQVXXdj
         hq4w==
X-Gm-Message-State: AOJu0Ywstzn3+/BPyayLb7bMatdrfK2pTAE38SPVW9J9AE5OMOemcnXh
	eMHvxPQpHF8kv2n4ntLs2KZEfENJJ0ANX9pMraiTmoaekJwdOSLInxfcRyyWRLdGVdApTOYoIT3
	mlMuXH9fpOFHfDDjeyEpIqYTRMJwtBjqAEA==
X-Gm-Gg: AZuq6aIiKOQeBevU+yFxDzTnVckpXoudijsEjjkJtGxTUfDmFv6BpEQtArfhy6+Kj1K
	F/nr/izRbUhi/V5SI3nbff4QLHmC810aQxuxwOHD+bA8ntoZ6chnskce0t4TGFJNZXpZRd3qBGw
	Dm2kQgNseI7XokefoTXUazJWnCELnpM/A8YMkG4MdOJWV9UADuydh5GS6BlklfOCdJ5wbQ2jGBi
	7XfXT3QT+SwgXT6SyzRiW/WFG/f28Hir5dfmYP0Ng1CPmD6DkMHCO4gkoH9UtZZ7V3QfuPB33yQ
	f3samhrbsovXOVCin6FXNYxApztieQ==
X-Received: by 2002:a05:6214:622:b0:888:6fde:7b72 with SMTP id
 6a1803df08f44-894eaa1f0ebmr166175146d6.32.1770047568591; Mon, 02 Feb 2026
 07:52:48 -0800 (PST)
MIME-Version: 1.0
References: <20260130030601.388697-1-Qi.Chen@windriver.com>
In-Reply-To: <20260130030601.388697-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Feb 2026 16:52:37 +0100
X-Gm-Features: AZwV_QidBxxaxSH_vmavay9GPE1e-ckP3uwFn2xPvB4Cv6Gs__9lsvND3-1tfsA
Message-ID: <CANNYZj8YOfUnv23oOyX6o=BuyX=LRQqoQaeS4osuRRoW4yiS8w@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2] runqemu: restore support to run without bitbake
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 15:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230377

On Fri, 30 Jan 2026 at 04:10, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> This patch is basically a revert of the following three patches:
> - 0c10a78796 scripts/runqemu: raise an error when bitbake was not found
> - b931f74442 scripts/runqemu: remove the code block that works around the missing bitbake environment
> - 8197be4dd3 runqemu: ensure that bitbake environment is either returned, or an exception is raised

Again, you can't just revert these commits. Please read the commit
messages for the reasons the commits were added. Particularly the
first, and the third one are real improvements, one gives users a
better error message, the other significantly improves the function
call API.

> Using runqemu from SDK is useful. Here's a typical case for it:
> Team A build different images and SDKs for different machines and copy them to a central place.
> Team B test these different images with different methods. For qemu images, they extract
> SDK and use runqemu from SDK to test these qemu images.
>
> Below are example steps for the above qemu image copying and running process:
> 1. mkdir destdir
> 2. cp -r /path/to/build/tmp/deploy/image/qemux86-64 destdir
> 3. Install SDK to destdir
> 4. Source SDK
> 5. runqemu qemux86-64 nographic slirp

So you need to start with this: a test case for these steps. Then when
we can see how the test case fails, we can work out a fix that doesn't
simply undo the changes. I've already said this in the previous
review, so please do not simply resend the patch.

Alex

