Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7401BCD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 11:33:18 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9421.1778153595342961437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 04:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=krgG8CF2;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50e5c7eb565so5904121cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 04:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778153594; cv=none;
        d=google.com; s=arc-20240605;
        b=EM9bmvSJ5sfOozFjXgTmfhDdPHiAnUBGhDsOKtpF2rsl+FjXp16Tu9rfCgS8J6OvD8
         g8m2xr5Exio7lgERFAIXf8Jb3tR5jxcN9O1XZ8x3rLdAjdOks79U3FTd9coFz6vIwGTs
         vSV3I0UED6jjtO4IJ1YxipI/TuRcoIYhSs+/ycMQMvTOY+WsCC6neWhmwpdbqHJzfM3c
         MqfQdHb/DZYLz5YL3w/39A8ydSWYUS1HyofnEs4T125MQyAEvPxrttHu0YVDoN8+SPI5
         dgoN7xCRg1mtJKKhtfqVoSgsB9/xre4WDusJdAbO809CIo33XFGGyrUv+5JXgI+d5yOD
         1H3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JEHYd5pHCNPjECaDA2ajHvzfUPceEbfCXuy6LepEgSQ=;
        fh=6D08F4ViEPMn9fNUTnXxh/MfSY/OtXZrNXQvtB6wCB0=;
        b=UY/r3Mf4b8YcLIaakB03MrCVoCHFz+IXHPbGxGDbqnGhUAu9z2cTqCHo7+cUMGiGvF
         ixo/2EhpgWFl4FkXSWMP0KOjQqoLkYM7KCssJzGb+tbRzQA5tCfEFSaensfq15qE74BX
         RpN/P/HDGEFJ1e8UnzT0v169PCdxVsVNW5ys0XhUtQeFU02rpKm94yM6oOCOvlkYgD+r
         n6C4v4N03Hy93y6t65pNhgckL+As1PeY4UrQfvFIjKm0zXzp66VRbKaJey5n4pcMrhiH
         ZSrb7LX0zh+VqmmXJql0elvKXPQ8A96W/1cn8Aa1aG69UgsNugr/8g2RuljbR1ICQ/Jj
         xUzA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778153594; x=1778758394; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JEHYd5pHCNPjECaDA2ajHvzfUPceEbfCXuy6LepEgSQ=;
        b=krgG8CF20p0DYt6Dy5J5w9sdID8gxqgb1d67qNqR/1f0caQTy/hMdzZ0Adx642aySD
         dAfrouozc+wEFXBKZXdXky5gv4p7afqeXnaP/BX6FbliOQk/S3fGgKzL0nQ96o32f6OP
         /2rYx++UFuJI7WabzZu7L6v54cpV6fljLWjYHx8uaDv2QMVxcKC281je6+lCo0LMAaWt
         TCP7nQNSQdwJxlmjvoCIXFLJ//WTCDEgBM20WtkmAZ0zIFjPbWnEUP/kPLXlsyYLRP3b
         ymNJrsg7eDuqRH9wYigWpIXplH5OiUiN8Gv3IPvtl+GrV/nthpaoUcTtPkDgDLFGqXqK
         j0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778153594; x=1778758394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEHYd5pHCNPjECaDA2ajHvzfUPceEbfCXuy6LepEgSQ=;
        b=H6W0T0gCCjZnW/ZhXsCAzq3crBUCUXgm3jX50OnP7aaDB57scQ6JIIP4wmaszF2Bll
         wRxXX05J5ZqJRh7aWGVXe5mY3KjGqEcpmbWAkFQEeLzS+UqqxXuBracDCYXbRqpTZ2ow
         glH1Ke7Qq+ay1Gj/PBdAj6f/u7+NLeG2/JWQEddFPcfgx18AKwjxOUuvAnFcNmiCLpgZ
         pMHlajdueDqWOC6UeTUi3jeRIgiCe77Seys1gDdw6weptCe0TOKCNrntHomUbDB31WH7
         ai2QE0lQg6Ft+2tc4E9pxs7i8tAuTkg+VwpclKAL7SE2ei7N/X5nbeQty+MV8anCRTIu
         Rf9A==
X-Gm-Message-State: AOJu0YzjODxR/ApKbGd7T9JMuhQtEu4avgz0N3ZHMrI8uKs4ns+r2tnr
	bNJGURuhoBN68P/sqwGijt8XK5cTiX/GJgGrPlK4DpyhBhurS3M0lqwGzCycANhEeIR/uIs+3xY
	iUZig1HjJOSnFgvIux4g6au7IosflrSD5C+Ng
X-Gm-Gg: AeBDieu8OMQojxFTQEsB+VUYHCvjBuQC3Ak8kNldHXmwqcuHtUfX6ZAzV8HLAW8wDTz
	79yDjcY6eA/sczinnD89mLrQ5pE4yAQEof3Jj9gcphEsPQ/M570utBEtZe3ye7f2m47PrTuEVOL
	JHbgVjRunHSWj6f8LZ1yXTbE9maZQfZaKPTeRevKUGqncGG5bCRfd1+kkqxYC4D+tH+IQ4ZwVcF
	lMfleq8Dhsa1ULSPWs5AypvqWB2jW0j1w9amYwNqUyZPx3Ngyc866AD79CLn5y8pSoTteA7Hzp9
	2b1yvtqpBFoSmllE+nu9MwsNlIHKra6aafUTUc1bbcgkjQQHRZ/+
X-Received: by 2002:a05:622a:6096:b0:50d:900e:c1c1 with SMTP id
 d75a77b69052e-51461be0109mr102329461cf.7.1778153594305; Thu, 07 May 2026
 04:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260507062010.1461027-1-Qi.Chen@windriver.com>
In-Reply-To: <20260507062010.1461027-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 May 2026 13:33:00 +0200
X-Gm-Features: AVHnY4Iu7J0XaSI11url8VW6UXvSJpwFL-Sj3bXrOqw_BPYeWRpdsUz-P4HRdrM
Message-ID: <CANNYZj_8xSNRRQSzWmUvxDb_r5dh46Ht1h5Ot9NBGu_MOpbvYw@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2 1/4] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 11:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236579

On Thu, 7 May 2026 at 08:20, <Qi.Chen@windriver.com> wrote:
> If it's not set, we give
> it a reasonable default value, which means if a version consists of
> at least three parts, the bump in last one is considered as a stable
> upgrade.

I strongly disagree and think we should be a lot more careful. This
default will result in a lot of point version updates where the LTS
maintainer would have to go and check whether the updates include new
features or not. Yoann already had to reject a bunch of such updates,
produced in a similar way with custom AUH tweaks.

Rather this should be enabled on a case by case basis for components
that are known to do stable maintenance (a good indicator is presence
of stable branches with a major.minor version in branch name
somewhere), by setting UPSTREAM_STABLE_RELEASE_REGEX for them (perhaps
via class inherit to avoid repetition).

No explicitly set UPSTREAM_STABLE_RELEASE_REGEX means no stable
updates exist, or the situation hasn't yet been checked.

Alex

