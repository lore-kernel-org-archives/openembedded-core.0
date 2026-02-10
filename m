Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A71EA3F35
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 09:55:03 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16333.1770717293506558716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 01:54:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=huAsUTi/;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c7120353f1so414618185a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 01:54:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770717292; cv=none;
        d=google.com; s=arc-20240605;
        b=TYNTvJFisMj3ixUAJ6pwLIFh34HpiTtkmkpuOyRA5QP+iI9geqhStXaVIBmMoTnfoN
         3R87YIWrhR9oJksoYHwYw9mUVCA+3BpTvzmsFcdq2Slf0L+sEsIgiUnNuMW3nCf0EbJU
         pU3A2E2w7V4ZzvcsXa97waUx/S/nm18w/kUtvwYLpmIVrwjE11DoWoimGp5Cogq0zI5w
         s/2aAKiA9SMIFSM5RK6YEomHYodObPiLbrNLixN2aHkvftJz1T1lF3jKw9uJqQtssQfE
         G7aoz654Gst0hVnWk4P7WW1rV/QqYaHsuG81t9yPVPU+8w5wsRCIC5r2MpU1MqKKw3BO
         /rRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1ZeiaB9enq4Gg6s5K/iEVKFeMjncVMlh0wb7/krFIj4=;
        fh=3dFdSa06sIBSurIbwyKgVgvfprkdWimgIZOm9DdWiG8=;
        b=EfeRIgsvl2peoIVSnl2fQ/sCM6BMMLrp639j4FUZPmZVS1bLNCJWJHMOKVrddF0fiv
         iKgLzCwqQjLn8yOUA4r3q3IdgqrCpk3r0Ifete2kF4GELPFzGyxcc6EeSTLa/ZzrjyqW
         ARSglMxyMB3PVf7af4f1DCnM5s/dFE3G38plBDVccD7z9LWxZjdCraFgmO74e1cNHvFq
         LUjB9bqbbGj9q0+FyfcbzLU5H25A88gmmkXKKD2YLg/pIYG10qjU8jWcOcJg1TXCLlt8
         YCtg/GD8IkIJcfpXUNPhoL6c3Ha2GxwyLJEYkbyOhehs2sndSn53VbIsaCH/Fq01FRLV
         lYHw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770717292; x=1771322092; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZeiaB9enq4Gg6s5K/iEVKFeMjncVMlh0wb7/krFIj4=;
        b=huAsUTi/NiMd4VwDTdQirbVIKaIMdyQVBH1xgb0IAdZJ3yS1GrJoO7aleIA1rssAYB
         V2eSVb8wFVx6Vod4g4tSoroCjyjBCatyoX0j04VjrQdclXSTRVjMEOhxLvORC7V26LN4
         D7VVPw29/ndnQp536qCoXGYmc1hFSyL4XDxR+yeMdPok1bNX2SuZfWPe5dMOmEEgOBKv
         jurdvgo3NNVSS9K5BXosGjVLyvIgg84lQqZqDu6yNpPBWeg+bqFVwF27jQtU45LKtkOe
         uwpbz9JRvxW9JB3NhcCj/e0QH9uSOMr9yjunHMA6yY/Og9PzL79yOTCumc61/nxYBvRv
         E+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717292; x=1771322092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZeiaB9enq4Gg6s5K/iEVKFeMjncVMlh0wb7/krFIj4=;
        b=UHXhww2CdtxAaU4TtjJHdl8lf3TB1AJs7PBZIbXU08eQ7aQ58rL19cTW7c+/o83W9i
         Bmt7JWHkcWP1RlpJhYpRlATzcSXbmJQilKmxQNz/fQSmXqy9M58g76u+fQpymQfsMg9E
         OkuACdrArlv6MhOy5Fwhm3XrjOAdPr6Hi0p2KXpvYgQncL7yxtSoZcktuwL8G0uOiB5H
         4mzUTLdMtHzOMiJK5PC8w4hxKD6AGE3RvkLVBo28m+DpeR6IzsBR6vt9s+w2iTC5fQaf
         p0fcLmZ6cjxH+lIodcH2jeXDND66lEWbIrwb70xlcAx+1VPt19ts6JcNGmOiWXP9qC0P
         TWNg==
X-Gm-Message-State: AOJu0YzIyY248+aB8QXV2ZXDobv+gaeE/lAHzBXH3K+ONsQYTX+CiaXM
	IXWD16PPZnvIUi3N7H7ptGoJR59yFKTVOzFj2TZTr9slLL8QTRbjaNF4wcFrHrw28rfdhuAWX22
	RdhfQyxt+guJn+EHy+hY/W4E//ZiN8Z9NYA==
X-Gm-Gg: AZuq6aLjW7Y2zmR+YNybGzkwNdCcnr6uTfaHBieoT5FyhWqCOYzskFM6RnU2SWIpJHb
	PcDGMl0ChgrbXnthBXaJxz7Ezx/2TBuVwExHI6t5n6JKYPb62wDKsYwvOyxkdmVs/Z9a6TBg9nO
	ggIAK/PsLpgO9jqwuaSFopK1vDvAI5ypWs+xXRanuxkq37rKOQpyEVtfES8yTp2XQE9RKA4Leui
	hxZoxhdiDzyYTPV67LmUDrl+PuIr6YpVUzQVnUryM6yC+7tAC62+NRwENGfL8ovmL4Jsu/hL3Vl
	4BQYEK8PuxMM7E/sOeWncR4PWQnilgXrvj/30XMHlQ==
X-Received: by 2002:a05:620a:4006:b0:8a3:cd9e:e404 with SMTP id
 af79cd13be357-8caf13078camr1753660585a.68.1770717292567; Tue, 10 Feb 2026
 01:54:52 -0800 (PST)
MIME-Version: 1.0
References: <20260210095025.633860-1-hongxu.jia@windriver.com>
In-Reply-To: <20260210095025.633860-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Feb 2026 10:54:41 +0100
X-Gm-Features: AZwV_QgfFd10mdyDg-ZI3BZfUWxMOrUGIpGIj8BrAwxxOvbm8adumwXVzhGTkS4
Message-ID: <CANNYZj8-pjs91R-TiLUo22nZ+bWAyN-P084AmAUPuyY-GY1mQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] vte: 0.82.2 -> 0.83.90
To: hongxu.jia@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230876

On Tue, 10 Feb 2026 at 10:50, hongxu via lists.openembedded.org
<hongxu.jia=windriver.com@lists.openembedded.org> wrote:
>  .../vte/{vte_0.82.2.bb => vte_0.83.90.bb}     |  4 +-

0.83.90 is a pre-release, we should wait for 0.84

Unfortunately gnome release schedule always is just a bit too late for
yocto releases, and typically there's no time to test and merge
version updates. Can the backport be added to existing recipe?

Alex

