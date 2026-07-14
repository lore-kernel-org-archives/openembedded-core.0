Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E36C44501
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 16:53:37 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1145.1784048009583626542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 09:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I/H1QrgN;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ee88fce572so17018856d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 09:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784048008; cv=none;
        d=google.com; s=arc-20260327;
        b=QWq+zykW5KSioodk2SF9HxVp+0DSuxjJwqQspNRtjEJcxHMNosg26DDvb3+gVspoDT
         VSMBpbjcOYA4Qpn64pSMwQ4L8yTnZ1A3mGuFTHUMGBIBxBQgtEFRVB8pJuiXPE/0Wo0g
         OqV3jk+tY4hHS1RbzHeFxytZPCDTOXPID9aBsE6UnQlv+VNPGkAPNWCF4sorDW8F9hID
         kFee89AvaFZHEUAXQ6wQHRh1JzNrWN0MFCGox6S6sqjvFG3cjZ4kvo26LbPONaS+Aqvg
         IrwFdB1aGurlwUg16YvkgHzhf68DwTX2LXqAaQq3prCGqEgNecFi70GouAoNI0Lo+kwD
         Huog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wDp8TbOL+qU2/vo9ZWbVb4h226+sAoy3Ur2U2KPI2iM=;
        fh=Gm82lJGUGgBpHVVqNsCo8FTHyXidvwg3U5sEWFmbn4k=;
        b=KtnO9G6ccmg3UWl74msw13kxnbL84r5xbddwNcde8wQzc8SndlfVSJzFftDsdTonAG
         4j7q/Mp7uHIiaK4P01EMR62GEaDsq3VfnQ3JDx9pUia3lglW+39En5JSNkA0Ftofrbtq
         plEFNETR7bVRqigud38Xr5dq/jXA3zucXkKCafeMZnzGFGjjMSDDoJDVFgipmdn21Ubc
         2VgYLWkXX1Y9KRSrlp2KJn+VxCcwYuo5u1IvflDqEpqvDYgqWNC/KnlFS8G5UoJefOc+
         XYK9w1/JgWH7jlPdqUM1lv2Tnlb68KnZyoO4UCkxxv9/F5fEOrf2cKMCvX6ZZNmMjYZ3
         +UhA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784048008; x=1784652808; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wDp8TbOL+qU2/vo9ZWbVb4h226+sAoy3Ur2U2KPI2iM=;
        b=I/H1QrgN0g6TBk03wD1FLOzUDLMhksPexEHQ75SmSKgz1yrOZzH67ZQox2vArMs1Iz
         WHTjT7Mf5Xe3XQZA1qCg2CL/5+RfKE3s3DPel3FaESyYx6pdYOUV1UF57T219wdWTy96
         d319roptQFgMIxBmiej7V+lg42l9BiVB7C9nx+jw6IH9ty3Tjl6UBOp/U+sJVFH45kx8
         Cf6Z+Henmf44W2b5u2JiKwFCzRivdixwze2Ye52RweaeN972vo8Bwzuv9cECbqtLTmwO
         YjT/i7AcyKyvNoytzrF6Lyw7hY8d7+Z7Nn1p+rLhy3qmTuZhDUvbB/Gp+29Wpl4NYPBc
         Sg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784048008; x=1784652808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wDp8TbOL+qU2/vo9ZWbVb4h226+sAoy3Ur2U2KPI2iM=;
        b=juHSRBVlxPwloHUYUbfgAIcnEmdrhyQE/5c73VcDyhoAKAJ6KiITxsf0oaXrFgM+Ly
         8Mdu9XeKFv7Of10kE7cTv9WQAkAsCEroJaV8MaXED40v4l92ZqWzNLFVVDa7cYTrj80P
         FgRUMfKFzMkLcJmGU+KWbhY1bivNcAXcos6utpOWga92PtbQ3i0LEScse1+YTLIAOIY3
         4hVmVWnuWXFOPVB5CmGMgNly9y/y8k5ljrslQSvni9OEE+WUhYncziP9QgfeQrIr+xBL
         c6yqKYlMyBuxxealORWgIXV//IYCOSsSscoIpXpJKBQvnjhIKqsTkNS6yJPunk0PqzuF
         5J7Q==
X-Gm-Message-State: AOJu0Yyv3FJgS5sXBuf09zZveCDgZRxrJJqsLHDeEPCW1rFwi5uLnDkt
	od4F8Yezm92pLIKCnS6MDficDosQegV6e7vfD1hQvr4Jky2NbauPpzHQnWzkjGErFKrdgA2TXzL
	iinAzHfwheAinL3URUOVyK/se5D/ns04=
X-Gm-Gg: AfdE7cntm7LSDocDF5wIyzMFrMBdU42mCoYQPHzOfmcW/9Lu9CfnLPqeKIlIU3eLg4n
	468kuz8EcP8XNxykg6gHoZYb/8j2G47ODX57zmnJbh+F+9kPuWGPyBc3RErDeNMhzlFQmZUcuRK
	x5BVYJXiJ+KNNMb2e37oMvmo+6OqyyNKzJF9kdL9TAcbD5i//ZPRDU8QhBVHupuOulgbIu+z9VW
	BsnQBLU45bP6y11Yt2KpScMsewSWF/n0ZNWj4AI0JOObIttpPVWjisSFfDhsXh1xtqhfT2T51ke
	FvgH9cGZngCA3IqGswHZ1MgTjXy57/Q=
X-Received: by 2002:a05:6214:411a:b0:8ce:f1b:74ec with SMTP id
 6a1803df08f44-90402262ad7mr149555106d6.25.1784048008514; Tue, 14 Jul 2026
 09:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260713185154.4171585-1-Ishaan.Desai@ibm.com>
 <CANNYZj_HBsupBnzMvb_z1OxE3f38MAf+7x9N1FSPGKQKVumqJw@mail.gmail.com> <777420.1784046906500517885@lists.openembedded.org>
In-Reply-To: <777420.1784046906500517885@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jul 2026 18:53:16 +0200
X-Gm-Features: AUfX_myJ610U_PlDtTzOHdQfvzZxWXMAtdLU4BKjwSr2RkNcjW89koFOvNG_maE
Message-ID: <CANNYZj-iVhChLSJxraiwHo3f5Unvu-N6MyQo1KcHSuNKRG2EzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] memory-control: add recipe and bbclass for
 cgroup v2 memory limiting
To: Ishaan.Desai@ibm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 16:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240903

On Tue, 14 Jul 2026 at 18:35, Ishaan Desai via lists.openembedded.org
<Ishaan.Desai=ibm.com@lists.openembedded.org> wrote:
> I'm committed to maintaining this recipe and bbclass going forward, and I've added myself to maintainers.inc. If the consensus is that this is too niche for OE-Core and belongs in a more specific layer, I'm open to that feedback.

I think this should go into a separate layer for now, perhaps a small
layer made specifically for that purpose. You also need to develop
tests and examples.

FWIW, I don't think the bbclass is the best approach. I would make a
special memory-control-config recipe that installs the needed systemd
configurations without touching any of the original recipes that
provide the services.

The control script is written in bash (which carries a problematic
gpl3 license and isn't a great choice for maintainability), I would
rather add needed tweaks to existing systemd tooling.

Alex

