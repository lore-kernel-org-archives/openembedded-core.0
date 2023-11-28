Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E50DC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 10:45:45 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.29935.1701168338702565164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 02:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G7mz1YRj;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a04196fc957so764827666b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 02:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701168337; x=1701773137; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aaOij2vlPQaskv0SurWX2hhU6fbs+d3w0uewF+ZgaIQ=;
        b=G7mz1YRjB/fZGds7Oh9NeV+aEP93EbZiMU0ydg7z2MNIx9rXHLxHWJOCu3OspFOYZu
         OeKUV3hiTJIyuNQDeJcvNuQqjmWV6Zc4fGlsncfrd82iPpul1ySCwGg4r9pcuv+Td4AG
         v0b/Z6cxYkEp1RBA7MykXEmb1qL/HW3K/4PEaUBTwXEdhz0wO6Bl2pN1NWKlcN+moIVL
         auk88Q6n/SxnsQ96AGjt0ae2s5ssxawy4G0JA+6isJMVqDDa1jdgqtKB3sKy1xdjN8ch
         EQ7ztdHz4AmIbaBVkDmEyAQH7kNWX5t4426ogRKlTQFyl1/VJNErLHacOAAhO9wh1zEe
         MfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701168337; x=1701773137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaOij2vlPQaskv0SurWX2hhU6fbs+d3w0uewF+ZgaIQ=;
        b=rSRsjpT829ezCNdkV4qQiwKGJRGvmzOCQiLpVr5Y5Y8ghOOnd6ciIsLt5wyHGnw/Ub
         l+MyHAQK3JNehkNgfl/FyC98P7eoU+PExFX8tuLVXOM9xs98gNw8LEjeQV6rOAVjQjg5
         uqwLLLnlZncf6QveRNeMgxeOZHFworxqxBvGhAje59ZepPlPCFYhfKsRbkpEeH5/8H8z
         x2/DBm+jKnAGksFHofJsW4yT6StZyPb47gu4ptGtzTF9se1MD9IDeZpDFtjOOikKHCY8
         8+7qiXNnUQqadKOcJ9t9Ryr+3P/Dsj68RiZCgW3ohPLxicHQlNbO0z6LUGWHYb41kVDa
         IDww==
X-Gm-Message-State: AOJu0YwRXU9iGYXSP+zYmIPUDvg0KXUKuPdi3WtvBH1IzuM+ykS5jdfQ
	yKDdsRP7/LyeftyMtBrdg1TbupR5nUQBhrWrytQ=
X-Google-Smtp-Source: AGHT+IEvj6j1W8Od2cNBHWrour1RSRLE509AuP9ijTMl+k57cmVOTmy+JRNjLEU4f2if5lwyVX42MtRZC1opCbkC0uE=
X-Received: by 2002:a17:906:f6c4:b0:a10:f715:6f07 with SMTP id
 jo4-20020a170906f6c400b00a10f7156f07mr3770819ejb.0.1701168336822; Tue, 28 Nov
 2023 02:45:36 -0800 (PST)
MIME-Version: 1.0
References: <0101018c10fc33e6-6df3ff32-13c7-48ff-aac3-24978e69be2a-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c10fc33e6-6df3ff32-13c7-48ff-aac3-24978e69be2a-000000@us-west-2.amazonses.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 28 Nov 2023 12:45:25 +0200
Message-ID: <CALT56yOkiWRvEh1nJOXrZ+JRLc+L2CO5rqxUe6o7q2yanU41=A@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [PATCH v2] systemd-boot: fix
 build issues on armv7a-linux
To: Patchtest <patchtest@automation.yoctoproject.org>
Cc: Viswanath Kraleti <quic_vkraleti@quicinc.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 10:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191356

Hello,

On Mon, 27 Nov 2023 at 15:33, Patchtest
<patchtest@automation.yoctoproject.org> wrote:
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Tests failed for the patch, but the results log could not be processed due to excessive result line length.

How can we proceed? If we do not know, which tests have failed, there
is no way to fix the issue.

> ---
>
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191301): https://lists.openembedded.org/g/openembedded-core/message/191301
> Mute This Topic: https://lists.openembedded.org/mt/102828551/3618183
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [dbaryshkov@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
With best wishes
Dmitry

