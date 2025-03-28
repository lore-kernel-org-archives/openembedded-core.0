Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860DDC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:42:35 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.7440.1743154951691374242
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YoC1EnD9;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47691d82bfbso39190031cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 02:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743154951; x=1743759751; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KFS5YVynObdfEF/Ax+26fE0qHVBlx0HvhW8apV8PgnE=;
        b=YoC1EnD97EuNSKL+/eh7Jg+p9nqrOJEnd937wICgOxbZ9/hkawHqrzzTI23947yH76
         fvKjX4S94rI4BJTXYePODIOPiBYy4o0q/vq9CrmYJejQ6zFGC7sBIXEatSzGGOxFKbxm
         T9jkRiIjIVLf4u8RTLxEnqz5JmVhLEbAeOCFZxmpw3ynmWC0IvYqRoqa2pgvpKcBA846
         Zw0n688xYgRaHhylVnv0xz8eWyHoKZjDK2pQ3066UanGyxlMi4IN6lZWA/IhD2VC3lL0
         E9ZV7EC28/jXZnUalRVVzEyZh2UQlaetDdd1lHFUnXS2c1lgZhgqUbkQNHR+uKIKAgA/
         kDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743154951; x=1743759751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFS5YVynObdfEF/Ax+26fE0qHVBlx0HvhW8apV8PgnE=;
        b=t0BOzAo/kSV9yDl+/L4zUAThHcvYeeTXngZb7BUs2rupmWB3aE2G4/PHZjySf+urI/
         9DJNNGlluVVXcGZ3XNAD4lEsFs7d9x00dAzbsfZxAcAvpskupA2HG9Z/npTYzaDcS54+
         MvIDYEAUz/XByfgUU9IeO2ACz9meh+N15JVZwtxYcKMq16vjgaOHJjofO44MYQxlmKkF
         MElPsrlt7M/sys3jedmaJNlel8VKepDw+t1PHL5gDlKl4kQzcp8w7iSr6Sph4NfMInJk
         cZUloLq70QNm7DPUK3SLKRCumMLpqVCicNn0KXr0hl4HbuYp18+U9l8dFAfVCcgCntIC
         Vcsg==
X-Gm-Message-State: AOJu0YxxoLP8vW0iQP3QKiZ8m6FNs9UtorNSR/JFARofHd/JGQi7K8Pe
	8nH56fDxhttdhl5Svxjy4F7XjrutNdtT9+wlcco5R8z1ceDq2ra6W4pyIBnHwK6mycvzASrk9to
	14pydWPXhkBtk1ueH11yzNqiLoDM=
X-Gm-Gg: ASbGncsHv//32NfHP2VpEbxYyjZZc6teW5ScHiFvRlkOjJV/0cWtgP4GdR+ofY8Ylsu
	AMQid8l7CjFl0wLGVxm/g4htSQx4ZnK6s1Dky0Y6rMaZfpUQuch0gSYgv+yjkuiS5iaQmENBwKe
	QONJK6y+TVL9now1SxeHHIb4wICTMEiVM/yvQrMoeiM9ekmARBBjQ9RocVmvRZ
X-Google-Smtp-Source: AGHT+IGbH1fbaQJnzukj2kualHkQoi7/TEoYkzMAE3yGehcYu6rZGVSo5WoVFh8n/b8RyKP4dLIo0RrIK8SYzKLKKnw=
X-Received: by 2002:a05:6214:f2e:b0:6e5:bc9:95f8 with SMTP id
 6a1803df08f44-6ed23896813mr87864086d6.17.1743154950573; Fri, 28 Mar 2025
 02:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com> <20250327221807.2551544-5-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250327221807.2551544-5-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Mar 2025 10:42:19 +0100
X-Gm-Features: AQ5f1JrmiAVVMeMx4yQUv4l9q2N_0Xu48YcZCIapxwLJWLfqgCVEp7XE35g8mHU
Message-ID: <CANNYZj8TSD7ar573zhy9UeaOenUf9gWnMgefBi4DyxmsYbnkeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/7] llvm: add SPIRV-LLVM-Translator support
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 09:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213819

On Thu, 27 Mar 2025 at 23:18, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> +Upstream-Status: Inappropriate [OE-Specific build-system fix]

What makes it inappropriate? I know people commonly use 'oe-core
specific' as a shortcut, but there really should be a proper
explanation.

> +Subject: [PATCH] SPIRV-LLVM-Translator: fix handling of built-in SPIRV targer
> +
> +Upstream-Status: Pending

Fix handling how? Pending why?

> +INSANE_SKIP:${PN}-spirv += "staticdev"

Why this tweak?

I understand you want to get to a working patchset as quickly as
possible, but please do not take shortcuts with explaining what you
did and why. We need to make sure someone else can understand what is
going on.

Alex

