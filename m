Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB63CD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 13:11:03 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90730.1781356262953805973
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 06:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I1PbuoFo;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ce9df31130so28975226d6.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 06:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781356262; cv=none;
        d=google.com; s=arc-20240605;
        b=cUtOM+OBPCA310nalyo+4n+988zDJw2x2BpOsV/ZZTMXzcDGWkga56v2pONILYiwDH
         6j3ckLGwUUugZ7b8YQE3xHYIecfPYrtLLy4NBVVfxwqjCrC88WznM7FEl9veUyC/zyAD
         BGKoVsZPX8JOL928FkgbWOio2C0pvFIS23DbC/D7ATj7g9yzTPSsh7wFJxcW2WoJ3XcR
         rNpjBhE9t+Jmt+/xCpxND1SyjG8SqFB9HxohtOy3323VcgJ5T7NyUXurSol8OrBRhYBk
         NcrvqBIIA47q/KX0FgGn754s9NAaiZs2+dbgBOMMYUBwpKMVyGAmrQTf/tbVbvgTZILM
         JYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SS2weZduxJTYqj8kne1k/wXQfUlGoUheJ0vXMBVm7WE=;
        fh=9Xr2V7xF112RMmU1ucfuZwpuXpyyvC7X5UcOQoKq0g4=;
        b=RpfFB9qPawubAP5o8/+pG9A2wr/ez0o+oCJoKbWMutlF590lSm/fE4jipXMI/cZI0F
         S7yXKaNujQ1OJ/7DY3jo+1cbjbRaxb1GgSpUxdxl8hkovGzO0WhcMov3/zrmlmGU/Rc9
         PmdYofM8FCGsl3fkSTbx5Hh1ICNZ/p3qngsezyYqIewZIxpPXufLCU+HbD6T6jRPvFPT
         p+ljBUaROtjhnYL+7utSleZhzZ6k/bwAMOtiT/u2o2iDp+EMsEFyy2qNH20MzEKwBjKS
         WPAEaZlQ20XwajI0W38JMjJRjlPfo3YmSMJz44xvSv8yPjmwMFbeRB2tfw/2F2eGAABw
         DckQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781356262; x=1781961062; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SS2weZduxJTYqj8kne1k/wXQfUlGoUheJ0vXMBVm7WE=;
        b=I1PbuoFomtwYUMm7x0kYQHupG194eiT0WOnFFLOowTmEVbNCxbCOQ40k69dtfhrnpy
         Ns6bSp/mLTpaNz0DcKgEZuoexg1ESq0Pmq69GP/A06+Nj0S0Nt5gRLBv+aF7AXGBnsjH
         LfdIxbYuWFaS8taR0LGRGjhRr6e6e41G7GW2ndnGO9ViM0kJ/K3wWPw8LpRZj8bzg0Av
         se1+lssrVr4u7rh856zrY6W2RAHpAd5GpQtJvd+VY+GL4wvA6afmQQFi8NH7FiwINHns
         1qIuLuwV7TkopckBTo8D2OT1iAWlCdz8DAQzmxD0CJXYUSPi18ZsPfsz9cw9Xm6jJHGu
         2Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781356262; x=1781961062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SS2weZduxJTYqj8kne1k/wXQfUlGoUheJ0vXMBVm7WE=;
        b=W1MlXVOsx0IIUo6Ig5PThqGJahFUJHfcHwO5Mfjwe9fmSvGOk0zPBQvfVz7sp0ruX+
         +t8HSs6kejgYDYf6DwSd1KFdnNA2V1CZksnxBQMJc38l1Sxuu9nPQn5FM6rbKCLRh55e
         sXZ9FUb/N+9njNOgbrASTbMehSA8AN9lHQl5+W8Gg5v5PmHUzGdViKodGuSwxD52qnJe
         +eYzs6AhRqC2EpGKrdCqGpRsQ4Gpyximn8tCObnXsHbioFJYzlPwceXw12szR5R0LmOh
         jsXcEeKHywcSeo0TUtGotNOEcYLB9f6rPf0uh39p9DGQySpidM25Dp8YolD5AxxTPafi
         S9zQ==
X-Gm-Message-State: AOJu0YzmXbUQw0+7U95r/ULJ9VLvd0qEDiWpYFYhqhWUBPq7M0nmrO88
	ZJ7nlqR3JRBkVMxNW4a1dsiktDjQddia9RGd45tzTqiGQfvMRzItGwvCIVNgsrF/Xsfq2S/5Zkm
	p3y9xc3H5F5pNEeuwOABwrhFmi9e8hfM=
X-Gm-Gg: Acq92OHCoPiE8F7z7iIH1x2aUa6Lz871Dnhj1mnuxURlk234k7wStdjAij9hXQcnJco
	LZ1Bvl1p7CVAAqp01GrPKVmHyx/VeMQ9MH3zwNf0+lc/L8ewzJkdNdspzxy45Xf5wZOG84JGjoe
	7q7Wtrs25zi6YyzI7oHnSs1I8FJ9nMexCLgiI8yDg27ZUl+jSF9YVEdfc5jp3mOuTEjWpCr1XVl
	vi5qyrqWEwjk1TvAjgIMdx+YYLLWyTU5XMHOr8Wt5RHz8GYCa2/TQuPu2OWU7ym3v1vNTccXzfE
	MK5RWss0IPXJsW6GvPKpipRL7tJwLCxwrKmvOk6k9Br32IZMlNIM
X-Received: by 2002:a05:6214:2465:b0:8cc:f135:52af with SMTP id
 6a1803df08f44-8d44e97a699mr59039326d6.24.1781356261832; Sat, 13 Jun 2026
 06:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260611090957.2606-1-adityags2004@gmail.com>
In-Reply-To: <20260611090957.2606-1-adityags2004@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 13 Jun 2026 15:10:50 +0200
X-Gm-Features: AVVi8Cd1yTYfO3TMEw6_OI4MWH3e2uaxKvpVGGDAwxpbw8BCx85sanMjEpvcmds
Message-ID: <CANNYZj_GQpodkUJxX6BvTUz6=ZrRGQJ2b+5fSvm9KJVtBaOzpg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] patchtest: warn if Upstream-Status is after
 patch scissors
To: adityags2004@gmail.com
Cc: openembedded-core@lists.openembedded.org, tgamblin@baylibre.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 13:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238681

On Thu, 11 Jun 2026 at 18:05, Aditya GS via lists.openembedded.org
<adityags2004=gmail.com@lists.openembedded.org> wrote:
>
> [YOCTO #15940]
>
> Detect cases where Upstream-Status is placed after the patch
> scissors ("---") and emit a warning instead of failing.
>
> Such placement may be intentional in some workflows to avoid
> including the tag in upstream commits.

I'm afraid there has been a confusion here, and the patch is not correct.

 The bug was already addressed in oe-core earlier:

commit 2156ef9e6defa3ec9087789fcea25fb4fee7b83c
Author: Luka Krstic <lukakrstic031@gmail.com>
Date:   Thu Dec 18 10:11:38 2025 +0100

    patchtest: reject Upstream-Status after scissors

but the bugzilla ticket was never closed.

Then https://bugzilla.yoctoproject.org/show_bug.cgi?id=15940#c1 was
interpreted as a request to downgrade it to a warning, but we should
not be doing that: it means patchtest will not longer actually notify
of the issue on the oe-core mailing list.

I understand some other layers intentionally put it after the
scissors; if they're using patchtest, they can disable this particular
test or configure it to produce some kind of soft fail, but in oe-core
it should remain a hard fail.

Alex

