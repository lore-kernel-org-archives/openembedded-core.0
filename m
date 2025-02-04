Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74BEC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 12:50:17 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.115594.1738673414794066783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 04:50:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NXIh3FeS;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e4277e4791so2711486d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 04:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738673414; x=1739278214; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AbjoSvEwdT3Kj22tmAy8U0skEtK9CrYRR6dw0Uj0yrQ=;
        b=NXIh3FeSRXhht8tBQc6txkB7JbZKMRMrxI7qOzRr6OGiYnw08kRWQBkAsls4BnWtWJ
         LcSJFTcXcEMSuGWakvkr7x3yDl0GpkdyaqKFXrTKZ5yhVPzqheaTSQn5J86Bu1PPVYsX
         P8S+EJvA/zpW/aN1siS4Ng+sXxMb8dkDSfRuq/ShjD9Ta9n10d6YKnGqrlpceXE57cq1
         +LC1knils95deP6pkaaJIGNEpEYDW+wJfgTpiEX7WgFsuP8AHS6+YA2bH7l0qg1RMMlu
         btOOhcQZcWP6MSi5bSoZDTf89p73mI0ban2pzVC3JZiJH6+sh8hMGkVFGI1SaK5xWWhM
         TGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673414; x=1739278214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbjoSvEwdT3Kj22tmAy8U0skEtK9CrYRR6dw0Uj0yrQ=;
        b=kmBFqCr4oG2zvo/aRDbSy3ZJT1BYtjbgnK7/hEWtrtXD90q955HiuhO6eVtslTIar1
         ASo5DrFEeSVavofAmgM87eoL2wQ2oz1WVevr9zBQx9H4xCHgEHPBeQovKIH6oPLmefTN
         mq+jEw4m/IYfpXMRqqe1h/pFBrbDRe2e683sjxUugOTm5aUq1rV6zpIVS3s04c9uY5I9
         oUGab50XwAh4ZCGdJixe3fjSD8XOTQmu0K+thV/FO6wAtV7MtPvm6LQCUUajBi7gZUAF
         F6rvUwbKD69UaRlPjejDomkJch3KeX2IK/0VklPhLvyDIQOPTK1uRfCa7QC3CzhFPsRN
         ntow==
X-Gm-Message-State: AOJu0Yx/9Mqr5qhlT2pdQiuD0tHTvXc0PSOaGmmPq0tIrExxcdWFIM0f
	uoWPCMiPQni7diEN8zBqDghqU5XNZtQY+FINWW0wYxEqRCxrTQM7HTtEEVpDeXckFmVYL1aw55k
	0/57qCL23VNZhsiT4ckyzLVgJqCY=
X-Gm-Gg: ASbGncsWUoYamWVboNNXDaIV8gTZ7j57ilrPYkSMJxE9sI1VbRQjHldBsx5CMIG6adS
	i5oUdSPQ3fWutv4K1iUlpGdfVoifnwRkMrpCYzCCWfydn25vvQmKrH+KsoJ6M2wIW1IyHZBRapl
	xxLlYr+W1kcfg2u/ghGr2K624tMXorua0=
X-Google-Smtp-Source: AGHT+IEtb3w01avRTe2mJrtdF/aVoux9A5AGpz9Vr4z5pNP8kAGg3jNEYNvsmVSLG9Aej5/80lBpE9lgahUh1dUUcUs=
X-Received: by 2002:a05:6214:18e6:b0:6e4:269a:c60d with SMTP id
 6a1803df08f44-6e4269ac828mr17756926d6.43.1738673413785; Tue, 04 Feb 2025
 04:50:13 -0800 (PST)
MIME-Version: 1.0
References: <20250204103744.27883-1-othacehe@gnu.org> <CANNYZj-O24h9m9gG-yHpDX4s9OxrJrfkfKDuETcXFq8X_r99ow@mail.gmail.com>
 <87y0ylga3d.fsf@gnu.org>
In-Reply-To: <87y0ylga3d.fsf@gnu.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Feb 2025 13:50:02 +0100
X-Gm-Features: AWEUYZmUE-O-QXpNbuUfgClTpmD6BvGQcLMFDhdkIxFqv8ESR0DW1c3dkp375X8
Message-ID: <CANNYZj9tjKN_Evr3KR7mNDMABXAgbLoCFL=EnoQviXa4+Mg7Kw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section support
To: Mathieu Othacehe <othacehe@gnu.org>
Cc: openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 12:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210781

On Tue, 4 Feb 2025 at 13:36, Mathieu Othacehe <othacehe@gnu.org> wrote:
> Quentin, pointed out, that we could be more generic and offer a
> PACKAGE_KEEP_SECTIONS variable instead, to prevent specific sections
> from being stripped.
>
> That's what is done in this v2. I have proposed a documentation update
> here: https://lists.yoctoproject.org/g/docs/message/6243

Thanks. But you still need to look at existing minidebuginfo tests and
see if you can enhance them. Otherwise we have a variable that isn't
tested.

Also, if minidebuginfo distro feature is enabled, do we actually need
this level of control? Why not just always have the needed bits?

> It is only modifying the run_strip function and its callers, so "all over
> the place" seems like an overstatement. I am not really sure how to
> break that into more pieces. It's just about instructing "strip" to keep
> some sections that are specified in the PACKAGE_KEEP_SECTIONS variable.

You can split into at least four commits:

- change of runstrip signature
- change of strip_execs signature
- adding new variable to package.py
- adding new variable to staging class.

Alex

