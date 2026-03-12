Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E1CFED2FB
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 09:58:05 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17777.1773309481451287299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 02:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EibH9gCG;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899ee87355dso11570816d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 02:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773309480; cv=none;
        d=google.com; s=arc-20240605;
        b=TnX59XbVBvBLVjTYhx81PRp7D7T0Er+plsK3435KDFKfbkrWYgDx0CsoNpT98nFSnM
         dSD4so93YXVRPFZRcIsvJefNKAta/yvqNt7ZzF7sn3EaN+BS0Uz8/ykvWKQhWjfhOh0L
         zvEOlLFcFt9jvS0A1QhvbQF1381dcfYiWG0Xcs1ooEtLdSa0uL7eBF642LPj6WT5ShYH
         JehfILsWoV+I9VqH4RdtJqs4fp2AIEv7leb4OgRktydp88J+CV5nO2r6Pe7j2mYxV8Id
         VB6e3X3yndGbIrO7WZg2oRuIeSx1dFsz0jDrjbc1lkJtcH1BmdVCSPQWvJpnVdk5bHnY
         nolg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fobh5GyO7VbNOyRhKBkxFdNOC8bU1Dd/OlIUmyjWo30=;
        fh=yRup0gQd4Qk9N6eUNj8kXkuKvdCTwWcKSeXZ5+LSHis=;
        b=AS5fd8kCcMF64Q4yG0UmU34Qcr0t2X2xO1BPzidjX7gMHS8oqGJJ3NFXh8UZO4T/Jb
         11YoHaAanmDnxYs9dLFrEDRvSY9BOOVEUqSF/nSVSSQiUFbSE15RiyDdTIgFOFflcqtT
         /+Wi3pbFIMqu/bmOhopSQ0BGlCBTip98KnbV3id1eR/NS/N+pa5DIu9u/szGJ5MHDPZg
         2pjzOKw5gkIJD8b4MIldipvORjP4lHv/ftLla2KdlvWl0beE4jpKnQj12KBfbVT5nGc9
         rU90ldwtsiogiZiX8DiDxPoYhGLXLF3Z1GY/Rt2j520n03loaadhxfcjmtLBM41UW9cj
         0Fuw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773309480; x=1773914280; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fobh5GyO7VbNOyRhKBkxFdNOC8bU1Dd/OlIUmyjWo30=;
        b=EibH9gCGSMZtw6LwEGhabqSDrKumwjLmmWAONmbadBe5u13p7KvBAHEgOLfpt3kkxt
         PywlhdiLKTsA1gRTaR98b3lkG1THtPQPx/4q/Ybao9berNjcPxTQ1Z+MFlA8IVFgm/TO
         g4Z1up8gBdwWMAKEuVAdgKnVWdcgqJvq79Ib1/+WVRLdeNN0B+TK46jg5K+eEWIYb9Sm
         DdkRFAUuWPsTHRuOJdYnur231WUGEyLMfxr7gUftLtHyLP/yKiwBkG9aJkTwyGpX/b9e
         Ilv2tM+jC94IHxmz/kZwNNmywHp+wda8DAle0kfl9bN6y2s2eH9DImhlycf0ceyV1MWK
         0hLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773309480; x=1773914280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fobh5GyO7VbNOyRhKBkxFdNOC8bU1Dd/OlIUmyjWo30=;
        b=IRkOjOqOOlJ6K6fdPMC8di1gafJ6LtjCOVnsnV7ybyzM/SB/5+EbcP/0LAOV8VyS51
         kn5Q04B3DvHD3cUCyIJAOwm3p4GBryRnlpmF4tVcs6e6ED/euEwTrDjejHx6knZvJXuh
         srnFSB2iPZHBBkE/8EbY0fNuBiScfUF7zg0pOVyUWE2NZDn7j8yMH7Dm4JGqf73UT6Hk
         rehuinYmVxldKlw4wU//ncPonkh+3MmFKB9JxzqF9MFE7RQD5V6cr7QRPpuwoXJfTQzB
         hO0+Gbg2VS5At7XBceiykMizNnWrNcdMaPRbEcD45oVZqx5YqcaPsRsWNNaoxCJIEkj6
         8kgQ==
X-Gm-Message-State: AOJu0Yz/uRz59/5Xk+r9AZ68UiWaHCe8iw3W1xEM9s0lHfkra4UDV+nf
	t189mke0krXfl7qooDg3ASOBS+dbDH2yVTz4KyDY3wfocJZW1tlINo6hN2hLqg+alM10jPf/K7C
	zF4dpmSOcKQxd/CA2NxeRdvBAQ/FKq0c=
X-Gm-Gg: ATEYQzzpuAKFP6nLbQmF07/0e/uAATKbYnh1fWzzvwxOH7vvVnzIZ/gUQ7VpmPXfuTD
	piB0Ku8zIW+LZz7X7LZWmf0d2p/5iU4RRt0rGPgfPeolNNoCQQ8TosspU81FHYg8jN9bY8Br8C0
	bn2tau+Za2Xocpyyt0o5UjFh2k5QPhi1sFPFHHplOmPxm652tSJjPKg2AByRfPhIAjBQA3c88Nc
	x+5VkikUdrPaqkRHcBoqW/8KVlStz2aGt0YA5iMqX41zNTVHLpPIK+QPvMp1/IdtChOqrHfkven
	wt58b1Q6vPSCMfhCichxmw/MHFXAY5ceWKHCZQ2imQ==
X-Received: by 2002:ad4:5765:0:b0:895:369c:e3e5 with SMTP id
 6a1803df08f44-89a66afe28emr80131066d6.64.1773309480243; Thu, 12 Mar 2026
 02:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260312081506.970978-1-changqing.li@windriver.com> <20260312081506.970978-2-changqing.li@windriver.com>
In-Reply-To: <20260312081506.970978-2-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Mar 2026 10:57:49 +0100
X-Gm-Features: AaiRm51ZsOqg3SJkuXzFRpKuEMGrD-FRLtYAHhQ19z2R7RGnBz2yGbuBrSuDwuc
Message-ID: <CANNYZj_tbas12TC6VHcO4cWKA2JwpDUtE3Dr+ANOGP8ThO-Zjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-good: remove
 PACKAGECONFIG soup2
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 09:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232936

On Thu, 12 Mar 2026 at 09:15, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:
> -PACKAGECONFIG[soup2]      = "-Dsoup=enabled,,libsoup-2.4,,,soup3"
> -PACKAGECONFIG[soup3]      = "-Dsoup=enabled,,libsoup,,,soup2"
> +PACKAGECONFIG[soup3]      = "-Dsoup=enabled,,libsoup"

This should add a disabling option for determinism, as soup2 and soup3
are no longer in conflict with each other.

Alex

