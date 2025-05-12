Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37388C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:40:34 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.46405.1747042825776739163
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZbeDLYE5;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4775ccf3e56so64308081cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 02:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747042825; x=1747647625; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AgBn+0x8ahLsLnxQckP0ZmRRFZFJJlvIhElTw7wS7P0=;
        b=ZbeDLYE5ra+o+Fxdj3Ck9lumevaXvNjSdG2oR1xKOdWmPV7mF6X3wHs2HZ6RSLbFbz
         cqQ3Y87pOwD+Stn5n6Ul2XOXUEqtqlimuUWymgPLDekkb5nSlbuyWWDeRD5I71pRoj9E
         piZy7G3PC4tnHb+1RipIetXD10242iMtSBZB57nfbSSa48s2VghLAxmKUCkwI0rM3BkI
         lCIHswWWxh+slTmK6w89eypHLb4OWTGGayMAjo1KHWm0MB+4HfV3K2pAC0EyEiCO8ydZ
         Jpu9y42qd/zNbCR6x5vm8duQ0wLZc0ySgPSMzlPGKn7Kt2ERSGmlCFJwn38AysF640gy
         PSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747042825; x=1747647625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgBn+0x8ahLsLnxQckP0ZmRRFZFJJlvIhElTw7wS7P0=;
        b=OL9xNCDjyh7KUxOAlXgywCPf3JQxSVOJNbmXFaoO/VmUMnObJ1uqVGjPUlcYxhtOdn
         Ic6CSsntTC8cIWKS6Bt8d1+Hnp5dfhHySx2KDlFH5hOQVbyZXJib0Dgvl2vVW3ICNqbI
         7+QHGqTiivP98WCU1akeZCEExuBSQb4lahPXp+I7FxRDmhlIixrgmDjjYIHHtq1h69Np
         kXS7QdATouBx6bT6imDK8Ni7OwPw6WJy0nWhQdLXcITSydseWIqcciASVpKvjUcxvgMt
         9YDnHt8S1PASg7cpMJu01qt4bwYMuacd7NLPXFeK8cfLCXIi/GJqeoq3015sjZ0z+dVM
         E+cQ==
X-Gm-Message-State: AOJu0YzBVol7QoWiPb/0L+p8nBZN+0RH/paSKb3MyP0R98xqUTwSh9FK
	0Pmh6JVXpu4EHPsW9HzwMD6gwwhdL/X3SeZceVmVa/CeeCaDllYGmYLsRLbZn9grMj/y+YR+5uD
	RiBONV1n44Wf2vTnTuLm1A5CiAao=
X-Gm-Gg: ASbGncvbvRzAW2Q23lZ5lMX+d6e+D2hl/a17qHwlMMIiqUx0/TPN+VmkgPuscsLn1h2
	UrpMxffVPdZTKKOp/fB3FBohU0s8oWpmCvpN2XmWIWBnd88c9C1AZfpFta7vnu9jW4KSuk2Ilcq
	6PRe4HXINXlmLI0QWU895Cv3Fn6iCngH6/cA==
X-Google-Smtp-Source: AGHT+IE1cOWRrlpt+mIb51EiH13l/mbzv3FxFcOQaG116JMu/3tygcev+EMSgLUUflHlkkIEG6mGE7vex/bNqzYks/I=
X-Received: by 2002:a05:6214:f0d:b0:6f5:4711:2a6f with SMTP id
 6a1803df08f44-6f6e472bb07mr176135626d6.4.1747042824776; Mon, 12 May 2025
 02:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_qhgsSZ540jiih6LoaSaJ7c+xmmk0ccA9sGJauBBUjQA@mail.gmail.com>
 <13242.1747042308632801416@lists.openembedded.org>
In-Reply-To: <13242.1747042308632801416@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 May 2025 11:40:14 +0200
X-Gm-Features: AX0GCFv0YjSE9teRxJ3mbI37DsDR4HEKHoy9ahuiOg8FZgnPKB3m48TZKyVEu4M
Message-ID: <CANNYZj96qMX_tZf-yu+jSac6R3+_BqjigTO=4kvkuSW=ja-G4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package: disable renamed dependency error if
 allarch is overridden
To: ohnatiuk@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216359

On Mon, 12 May 2025 at 11:31, Oleksandr Hnatiuk via
lists.openembedded.org <ohnatiuk=cisco.com@lists.openembedded.org>
wrote:
> There was a report of this on yocto mailing list with detailed info 2 years ago, but nobody responded to it.
> See: https://lists.yoctoproject.org/g/yocto/topic/nativesdk_packagegroup_sdk_host/98365178

Adding library-only packages to packagegroups is simply not currently
supported. What is the use case for it?

Alex

