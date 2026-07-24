Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB695C531FA
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:45:03 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15793.1784886289924694497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h7Uk1j74;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92ed19f4d60so19589985a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784886289; cv=none;
        d=google.com; s=arc-20260327;
        b=sEO6AAmVYCFeDFSdWv17sKT1C+3WQevTKMz7xcskCBCoPsXXFn9ktTFMNnenXTQwWA
         rFTN3wojHLloN2Q1Z16eTkrr/fZTZj2zAJ4lIIwKGWemu3RXDrJHyfyKuO/xiaMGE4o5
         jz1gCWoj5/KobhkfcW3PJd3vO2DvmQ9Lb50sWhCGrlWYKL2sdwdUUBfp0WtuB9/AaNIB
         Zih0MqeDn4QRTlpOyQIeFSH3hKfMs8qPgqxDUeqLH8PWyLGk82Z559boyM84nZHP3eO1
         /a0AKEVt4LerzzXwAOUDWyG7Kzy4D5fH/ZJtKxWwN6FO7vapchMuA/1DBaCgwyfQBkNV
         SWpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iCbzTt2Ec5zcXskkC4C4oAkqHTHWWl9yLtRXSXwwoQw=;
        fh=TMIfwxgAU8BuWOyKrzhPp3htqU9AnG2dhnCwktNY3t8=;
        b=EaDP0g27fOId0XMvECcEtnx06rYqVwQJXhbzpKYpHbHjueh/t+RbZcLrfvcUZifaC7
         h/2A4acvmkGDrCq7IJF/gv+p3IRiAtNONX8w4qVGRYZCz5Gw8y1xMVP0qBk2WICKAhhy
         XNAO5Q+rKkYsPkP47L0vi+ZwL5YPCmbqo5l6Q+5lUAEpF0b1mYmlBTRVQbspBDVSTSRZ
         QmjmrkERcxAwp2W1QMSCdHXZIwJ3nysYSUFXVKii3YOkTtmpaG1BInaE05KUwe0s8M2N
         TuOxhqGfOhC/R14dvo4t9hDyO5aFuPxb7xKULnCriPspYZjMBaxC8pz/FhdOYb5/CwmB
         qpvw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784886289; x=1785491089; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCbzTt2Ec5zcXskkC4C4oAkqHTHWWl9yLtRXSXwwoQw=;
        b=h7Uk1j74Ran43ggZUra/MtTi6NN181+H9zd9g9nSPuvPhOh/W1DjB6Rr1FYoUAkaSx
         DhyBCzbKFntRuMKuAiZwKOWQ4XCAGh3RYTuYjjQ21CZUrmovSVYxfGBmYI9SAXAIrdF2
         lomPTVhYVAJ8eI33tT1ZY/UtA6RUTIUXBDHd1uyCiR753wblnJiAvFE1MWQr5i/zd+iO
         7W5rdt6QcACuu+tHEPMSRVY1V2nLMerHkV4e8l58hYeJM2Dp09+uOT6GpLwD+P137sHC
         IkoIk3NmwrcUHW/LDlEV9G5XISZhAyelPwb71CemzVQ6vBqsN8QzE3TBYq+80RyZzM0h
         nSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886289; x=1785491089;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCbzTt2Ec5zcXskkC4C4oAkqHTHWWl9yLtRXSXwwoQw=;
        b=oXO+cRApHyn4juxk56FUYMaSueFzGTUGupFIrus6Wg34tedQ9j479ypmVFNSKNUHkS
         +TEQ6BJjs3kM0L/J+MKZgIi/v+rRkuHHStD4K58YYmBxQ6FUFU6eBkt4//Aa2F2oyuSU
         RsL2gNnwWyzgnVCfAZZOf+3DwYfrs5Q4EDQs4/lJCf4VtyB9NVMZ36ECoLEpCOsLlGKE
         pygannuKjvtQ2vTm36Znu+k1I0hHa11+o1HhufpGuE7bLrUDIPA0ka8zBDH4h1fksxDd
         kAKnxeD2fXGw/nkLOGgNOGjF9negQq6vwH5m9sOgL9xcvfNa7NtKkE7pHXl6tlN7o0F3
         DxmQ==
X-Gm-Message-State: AOJu0YwIyL+mPgDdrq1NdAYO0c1V0x2PuSUn/u+UeLQSvngYYk8DVvwQ
	XySJAZ8Y3UZyrL5mmr8cdjOD56GHKNdQkB/bE+QLFBTr/pkQwFEn8Dc39iKpHEWqq5uJ02xilGO
	EciYB0IH3/DAXwPMk723aX1ukGtN8dVE=
X-Gm-Gg: AR+sD13WiEzn5XES53P1yWCfF/9utOGtwRrJnYNlJoNcaQxaRFba4ru3kY/3+zRBwQA
	/fGjMZmBaXuuoRDQpkjDrP5ElxYObACG7H3OCkcrSpdghNPIwyaLVKvJKPRoVk5UUhG94I64hEL
	E1FOCzHNVKuaFuNYU+C/6CT+4ikOuEsq38VnUcVnTItAs9dA4UiR3tkpwDX8Y0S8XCpwVlIyRhB
	Gtr/ZKOIz2pKeWPsgZj3oslirsQJPzLYgt/gwrOVszN8jo38Q0PH87bT3MTpVJ5UgjCGrelVnjW
	1je9fcWHAbeAVqViEIgy
X-Received: by 2002:a05:620a:1729:b0:930:9533:5e32 with SMTP id
 af79cd13be357-9310468af9emr650366985a.7.1784886288830; Fri, 24 Jul 2026
 02:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260723112047.3535219-1-Harish.Sadineni@windriver.com> <20260723112047.3535219-3-Harish.Sadineni@windriver.com>
In-Reply-To: <20260723112047.3535219-3-Harish.Sadineni@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jul 2026 11:44:37 +0200
X-Gm-Features: AUfX_myuUWOFZkmgPPXsUsMS_f5jF1snjKUm98JCrFFGBjcIPb7LefTc-_PMe6g
Message-ID: <CANNYZj_efDSqQNCznBxU9012rGDTJ+Uf+TaWBVLqpgiFLrtg_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] oeqa/sdk/cases/rust.py: Add test to verify
 cargo build builds for target
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241924

On Thu, 23 Jul 2026 at 13:21, Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=windriver.com@lists.openembedded.org> wrote:
> Ensure that cargo build successfully builds the binary for the target by default.
> This test validates whether the default build process produces the expected output
> for the specified target.

Should the validation checks be added to existing cargo tests, rather
than making a whole new test?

Alex

