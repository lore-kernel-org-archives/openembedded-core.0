Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE001049527
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:57:45 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17521.1773223061790939065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QvCb5YT6;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-509101189f1so34469701cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 02:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773223061; cv=none;
        d=google.com; s=arc-20240605;
        b=ckEKez73uXhvpNtCYTATWjh5qDj4OdF0hUh/GGb3/KY8PS94FgpxMEXUiViCBD2uOO
         noCMHLJaR1WhtPNE3rER+Vimhvc3Glr0lmJTY84N8PDbRgd09QGPOmzYg3QGnjjMx9ta
         SQ7Yng5HuOmPpJZnEhAAgYc0/xMiSbmPeKerPt5Ju+ybnB+5izOOUXKayGhUMOzvwq0M
         +UTwji/OFECYT3jT62q5tQiKiJWX0O9CYJy8eYpRtdPwTG6bMIbxirf2z9gw8r7vcMhl
         2YU1DKSQmbOr3+HZEMuwo+xgUm6ZruFXT1V8Zmm6q1+RxhPItEBwSwIbTEMePRMJyWte
         bh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TVAOmuB+KEXeB46qc17tKZ89UB/+4P9OilZcr7iOrp0=;
        fh=DfocafE2n9xBFuzQZo0EY542jL2CoN06RCX9ffBWJLM=;
        b=Gpjyea18VE/+lz1o1ntCCnUFwOEX097pC0/dJOl8w4K6VJA5a2FysNRv3o4eqa2PCh
         YZWhl7VKDGBde2/7LNZjEoKlFsoypfSlnfW/DsPOOMfw2VkzlEN+uzlZd4VxxwqXvbKg
         5mYlcm7FsA9FKKB9HNxoZJMVq686cKwDGaT/7IsGstr8xQI1RtZKw638yd2mq3Q3HxhB
         Hk44PxKUYy3ifw90qaE18F2cMvgAUFYeSItCTXX0sk2WeowKXcPpspr9KSUHYcLkrvNS
         phPQ7e73Qavf4gQmsUI/3ZZbdG18NnEvMMwGQdmlBJHNKGNlzdDGbvhDDob4Ormcu0FX
         kJ3w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773223061; x=1773827861; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TVAOmuB+KEXeB46qc17tKZ89UB/+4P9OilZcr7iOrp0=;
        b=QvCb5YT6ImGOb7pwe3bIUIPLuW14qwqzQcZK5I1hq1CN0kf3kGrPNFQdIGZrC2nC9i
         n4VPtB7gCOQhWBCWiDoqqGCUPB0AICNDxA5a9JBTuQsHICoRSpTYmRsEk9fb09x38L50
         jnzROvBWf7SLgDYYzE37ZRGeb5Uzm6l2dXNjaW9CY6C7EzxWrvWyRMRkETnh3r8D/c8i
         uNfdw6oquqtBKEnymzrYtxNk6vsdjBK74K8qtuekG3sOBvum9yPqq3I9IzrP4v2QcFCJ
         9SA4MpDudm2tHASWS4RjOlstoZNwQna20zLxATArZk23ypF3g8Xn7TFyvpZbLBnYIcBs
         VAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773223061; x=1773827861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVAOmuB+KEXeB46qc17tKZ89UB/+4P9OilZcr7iOrp0=;
        b=pYlUHWgDx3Efz2GHRDqd/w9gQKeLRLiGpcCN4dnqLu/NTu28rwVkiW3pyE/X1AYjCE
         P/ZTh1x+0CwEIKO3CT0ESJpaN9YKBRfgZUMliPzCtT4gKT5e9WaWlL605n6D6wrU26DB
         wEw0Lbr7yTb0/PAnZ2mui6itogMV+Xxh7VUWA1DpQOpje+wK+bKo8fRVQKAP8KJBcm2W
         CgDspkyb2JElmI4n74Hb9ThbT2Ao5dGpKrrKISw7d+FFvI59szOndX6zOLOI1itd7Pd9
         Ks+fSCphRZk9vWXE5Fsqv9VI+P5eGam8pMhCFlanzjXikYakp5dBywnim26jtXcpxxtJ
         OWdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS8u1sDpXTb5TpYyLmDlT5plZ9MgjdWtSlgVaQ17NSha32C39o/UQkjb1uMz90p4z+ExAOgl4BxTV1BsYTPO8OwA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGFe0XmvuxHiw2aq/aeOXIXaP+shlu0GjIrT3/ThemYbGh0CVX
	yhlDV9YXmfp32138UrHNYUrVtZyRRzpEQqY0LPEVMoYtjrBMS0fA7xkWavRsDmlgiWCRR/ldQwT
	DMctz+hnO0qmy51+6KCLQ1QeqdIg86W+3Cg==
X-Gm-Gg: ATEYQzx3aIjjpd2nWoMf6DEsEkmQrcWQP4Ild5EHQkDAPPd4GAXT9UGpSTlJQ895RFc
	gLg/xhaSTd7waoAKC7EZ7r6DWIaSUzNGJbNKz5oc0CPhqsGKazCjeJastnb2aAB2fcKa3iTBOuw
	Gp8S1Qmebfukk0PhlerD1pS9+izcNKgkIx70HCUYHTJLT6bGb1irMkBEym5l5oNtFxrFf2jrMTw
	0tVz2N+vSYr1K9fSd5LQpu73uGQHQatXx4f174puw7XQDhHAKk+afJKHi2f6mdPyR8PcC2msGWZ
	g+rZXSqoUMMita8VO+Ey9mrGEk5Q7B5lHWkVAc/nxQ==
X-Received: by 2002:ac8:5d8c:0:b0:509:d76:fe5f with SMTP id
 d75a77b69052e-5093a0d3959mr19670481cf.17.1773223060734; Wed, 11 Mar 2026
 02:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260310233310.3364647-1-richard.purdie@linuxfoundation.org> <189BBFBBD1C8EEE1.2412760@lists.openembedded.org>
In-Reply-To: <189BBFBBD1C8EEE1.2412760@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Mar 2026 10:57:29 +0100
X-Gm-Features: AaiRm53l7Yig5zMEO7hl8qeW8Y3GXcm7DOB_ot0NLFDE4GXFEfoDhHQ5fgsKj0c
Message-ID: <CANNYZj8n1ETdMFjZ08iYYtaRox3ToNwU_mcSzM4hGBwNyKPJVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] scripts/runqemu: Allow VNC use as a
 fallback when there is no DISPLAY set
To: alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232859

On Wed, 11 Mar 2026 at 10:34, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Wed, 11 Mar 2026 at 00:33, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> > +            if "-display gtk" in output and "DISPLAY" in os.environ:
> >                  self.gtk = True
> > -            elif "-display sdl" in output:
> > +            elif "-display sdl" in output and "DISPLAY" in os.environ:
>
> I would also check for WAYLAND_DISPLAY here.

Actually, nvm, this first needs checking that both gtk-native and
sdl-native are built with wayland backend support, and that it
actually works.

Alex

