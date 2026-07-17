Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7720FC4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 15:28:07 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.523.1784302078735173411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 08:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EYJpLYb7;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c2cce930cso44831011cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784302078; cv=none;
        d=google.com; s=arc-20260327;
        b=gc1eAvODjb3wimOAPw3QOwqLgJeL82+p9y8niHlAWWNTHHQuC+Hfjkph3rhnKPOUnZ
         Ar2GLLXDh0SDC4IPr24Xp2oPDQu9nbruOsABoja0meNqbp8NbCnUtSY6H2idB1Z+sGv/
         TE6NWSHjCm+5RoFNVW5e2gL+7NGDXTf8JOmgiaO6o0T7luZzgKOZ4uznom93f+f9XOGs
         ajtNGwBQoD4GyFxfrR7pr6ii3kT/jU0KX3qVmPGxfmzlPQEIxYyYVpM33Y0I3dYtYxOz
         YtJSmLxiDtLUozh88s4zjdEMCUWJma5MtYkVfHrptuDs/ljn0/9Xl7vwP9wtZWkinawc
         u99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=deGuZkv08H/RFQr1JUBEqOYTIDSqrsVVJt2PfeorEi0=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=SNhwwD7HrZ8jRnmfprjxHdJRdFhz8bp+I3okUZ6upDTU/Zmtw3nj8wjXjfYY6HZwAd
         AHgipICW1nyn23mbSYUh08+wF4p6Et4BG22VSD9Bte1b5EgBZBx5kU+tOqE+IPD1G6Jx
         v4BDVJWrZiQIelShx8NkAM+hikOQyKvA/OiCygaWqHEGzLbbLjFV4boWkyCQ+rcDjPp1
         xsrQ2VdVMbR9WYD9CqgliulMA1vwoKTtCKxk9GorT33UCAwS7lqZuPMxyh3AlrXHZOzR
         WCRe/rsxfBIfUzQnz3G+3HR2C9jhqrh2nmdKGH24M7u278Vdy5BPKYrET+hwprf3aJu7
         T2Sw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784302078; x=1784906878; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=deGuZkv08H/RFQr1JUBEqOYTIDSqrsVVJt2PfeorEi0=;
        b=EYJpLYb7ohlUq3Idro79gDUZSFPnjOvD4OrUZdqDq2TeAF6DszzoT4HASVPM/82Zag
         XI8cmJNeYcOYz0SREHn6KwdzgwXBQGppRuc4kH+oxVFnRXxxo87n8IaAph436NMZCBnh
         94QwnP3txQKHiFOECoXpKQ2iR2L1l5fcjb1ieU7ui6UotOfbK5n5fKxE7NnGs+fj/L+s
         tPWymCgXQUEssWgQd3BvQLCrCgPx/odLNecTDCLvlSJ5We11syS5QbqwviPqpLCTzBkt
         +29BMH8DKSMy5f/VdIlmczAyS66cSngFR4Cru19F5JDQdGW2FU+M2u5F+Ji5F2u5A6k1
         AaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784302078; x=1784906878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=deGuZkv08H/RFQr1JUBEqOYTIDSqrsVVJt2PfeorEi0=;
        b=akkNmXUINDbY09J13EfG6I9BVBytjyALv5W43N0IuvUJDEyLezeL58Xtw927Lcr1ma
         p3UZDIBNRUoUu2C2iRN3T5xNVFsaGE6lgSKsiB5HiwBX2oOqilxIHXZ6PedNMjqe7Z/p
         4oqPKupDkmJfTsx4SfhzvgTnpe65Z6gIjCfR1cVtmwX134VGvDUXb0HbVaD6c0h1hICB
         EYTnZL+H7Zq9GKmuZQIAk5bjQbrlXG6xFiviIbVyrFke+UqAltwgiby+1/tcATvQN9JK
         WT8k2m/R3vZGVLEQ6RaJKq9qj7l+Qrej1YfBoVC3WcJoN1S0XboK/iSz9PBvp/NMiP02
         gejg==
X-Gm-Message-State: AOJu0YzxfCixXAs3WAnnQR0OGrbj0WhNvTi6G+wOrTiXqlJgyczPSxmU
	4T3WgSYei0GAKXc57E4L+9TD74eAIRoYGDqyr6ugB6fkyGhfk5eqy+Mgr2dw8kjStdrSYxdHvq4
	fYnS5VIeTH+5sdDjViMg+5p1696AdHEg=
X-Gm-Gg: AfdE7cntVQiQurXTiBbIwaWege8PnLVY02zJ1s61LL1kFXH66kiOaUK/BY1nA7m3zl5
	qYC68W5QP5f3URtb47qOuUg2kvxi/vUjpDVDsXJ6X/dCWmBTjdT6wWDPinbsyWmgR2/w0Kz9+Wl
	1aXG0Utq47cojunmAUROScq/KW1np90hyIkMqGq56ih1L8g7bq9v1xi4cAjgp1wSGHs1GVymEhf
	wroskVpMOYNPYXLXUVVhzibQBYoaKYIw9we2ygpimbAkUDq1VKXx/2GxruFORrpbXF4XTpkmFqa
	A0cWCsVB6B4KYJKl2dDa
X-Received: by 2002:a05:622a:5a17:b0:51c:1641:e73a with SMTP id
 d75a77b69052e-5213f666cd7mr30304261cf.44.1784302077599; Fri, 17 Jul 2026
 08:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260710185207.3999639-2-yoann.congal@smile.fr>
 <CANNYZj8SEdTeTZDr5dyQfMxQ5cm_3CcXEc_5Vs22tYMP5Tb8Og@mail.gmail.com>
 <DK05T1YBIVAY.6B2L4BKB3HAF@smile.fr> <CANNYZj_q-EHN+GxGT0--7BcnpYWptBT-8DC8Mi6CvGnXaMQfNg@mail.gmail.com>
 <DK08YDP0HG03.1YUY01SIYRENG@smile.fr>
In-Reply-To: <DK08YDP0HG03.1YUY01SIYRENG@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Jul 2026 17:27:46 +0200
X-Gm-Features: AUfX_mylU8M0RrEWR00-Y9f9JNcsB9x7FVquhJYCmqxRMhVBtpuZcrVC1y1WExQ
Message-ID: <CANNYZj9Ze5O-f8fNhhEFKNdgSHARgagvQHkHSyisPfid2gwO9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/patch: avoid duplicated "From:" in
 generated patches
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 15:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241206

On Thu, 16 Jul 2026 at 21:36, Yoann Congal <yoann.congal@smile.fr> wrote:
>   # Config to avoid groups.io "From:" rewrites issues
>   $ git config --global format.from true
>   $ git config --global format.forceInBodyFrom true

Thanks, I was going to say this should not be set globally, but only
for repositories which explicitly use groups.io (e.g. oe-core). Then
devtool managed repos in devtool workspace will not have this problem.
But I see how this can be tedious to set in every bitbake-setup
checkout, and it's for some users easier as a global setting.

So the patch is right, but can you fold this additional discussion
into the commit message?

Alex

