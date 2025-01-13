Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F00EC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 15:46:47 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.20148.1736783200025843981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 07:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dtEcgjbP;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46b1d40ac6bso35622871cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 07:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736783199; x=1737387999; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ibm+dwZI33cgyen5cVd/6mTz0Felt7y4GE7URvWCa1Q=;
        b=dtEcgjbPdrFYFWh9EEbFmKEYk5q8FYSg9hqRR1vU7AjhJbrbRoP0LSlS7ca4pSnCxJ
         Wo0OBrDXQSomzQ4Cp5PVih4c8mSNPet7WbtjiKNdKBC6Up5UD+JH6iTH6KWesV0CSFKq
         5zkSLuyr31nX7wgruSwmfGIfnyfij9TiQPc9qBeU0TYfNQIVLbuxW2TRw5wGjtdsZ9TH
         V4cDls0p36Wp9x1I2KE2XagCdqrK3IgRkeSf3QZfJNYAyAowFPcyTsqSQg4vn1FrTGaN
         9Eh8uXIYHhHWTpJKB6Q/ZL5yT7QrqwJTaLpSWtBpgZYqpg9HdpXAn+6X4+Juih1775BH
         t6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783199; x=1737387999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibm+dwZI33cgyen5cVd/6mTz0Felt7y4GE7URvWCa1Q=;
        b=OW5aZYfQM/1VkrV+Grz87z2DyQdDB4RaLU4ipLVIrcmLi5MwMXmFw2InprO9JWXFWJ
         9YT5WqVVZUEi08jDLbwg3mSlqMdbmlgVt/0mAWVPNUeBpWTYRazsYC4r7zVXJJWrb5Vt
         ioRV3VyS8UaUP6xVxtVk8axoON59O21GG4SQiBmE4BaLjjhilnj9KrJ9WHoGo56YsHOB
         ltoJgBjAzDDWswfMPvjJjgZgWL+vyRytPyZABXxUEATGcAfQl9SV3tdO5MvQHeJIzTAr
         rzPZzac2uZ+EkhRTjeOnCNWJv6ld12F14zV3x3OQ2irmo+A4/f4Jlqh98vDP5UJXo6zE
         oilw==
X-Gm-Message-State: AOJu0YxTHEW7p741P3fZqz+WGoW4bF0BmO8yLx52GX8VkcWnP703OBDm
	bwtIBFXqeBT0T9QlAjvVQoh7bObibrQ3BfJsX48xZFpkFydeXmUmT1nsR88XWq0ntSvpvHcO2ZP
	Z6nzgdTYd/7UQ792ri0FVAKJBe7s=
X-Gm-Gg: ASbGncsJcVGfRvU6PCV7dXTSqB7IDha6cSiX+CnPtCSGnL/BHMCdf/4VeW/xemvqrr6
	yCkw6OFrJ3EGsWHsR3ks2L+83Yzz+TWhRlPCSdqCjncEzbwMjO+10I16MUDRDnfWdocG/5dz6
X-Google-Smtp-Source: AGHT+IHTIHO/YRPEuTlWBYqOXTZBzB4Vn7ZH0tFQ/w3EyBdwdodjlJ661Lepkxwwx+YTq8uTR/tM+xfOpBPx3uZl7Ks=
X-Received: by 2002:a05:622a:4a84:b0:462:a9c7:e5f5 with SMTP id
 d75a77b69052e-46c7b082e6fmr293721331cf.25.1736783199046; Mon, 13 Jan 2025
 07:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20250113133936.2968211-1-Deepesh.Varatharajan@windriver.com>
 <CANNYZj_cEFw7-GZoSzAz27LQ0Rvh32xfVU9jQCGB4rdduNkGgQ@mail.gmail.com> <d3fdbb9f-029e-4e6a-9ca6-0fb138e7f637@windriver.com>
In-Reply-To: <d3fdbb9f-029e-4e6a-9ca6-0fb138e7f637@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jan 2025 16:46:28 +0100
X-Gm-Features: AbW1kvawq5NLm8l7GCPJJdzzaT5CPJ7y-mYJ5jQjPa6qaONAKTWpx7oBhMrYAx4
Message-ID: <CANNYZj-uQp6cup8ZpxqZ6Gn1gUHErDRL5v_FUadegoFurA57LA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V4 1/3] rust-target-config: Update data layout
 x86,ppc,riscv64,aarch64,loongaarch64 targets.
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 15:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209735

On Mon, 13 Jan 2025 at 15:08, Deepesh Varatharajan
<deepesh.varatharajan@windriver.com> wrote:
> Testing patch /home/patchtest/share/mboxes/V3-1-3-rust-target-config-Update-the-data-layout-for-x86-ppc-riscv64-aarch64-and-loongaarch64-targets..patch, the following test failed:
>
> FAIL: Test for shortlog length: The commit message exceeded 90 characters per line (currently 102 characters), (test_mbox.TestMbox.test_shortlog_length)
>
> To address the above issue in the V3 patch from patchtest, I updated the commit message to ensure each line is less than 90 characters and have now submitted V4.

I want to note that the 90 character check is not a hard requirement,
but a guideline. If you feel that a longer message is better and more
informative, then keep it, as long as it's not excessively long.

Alex

