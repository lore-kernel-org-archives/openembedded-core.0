Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A05ACD6E6B
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 11:09:22 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8814.1780571359664683327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 04:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HYe+a7YN;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8cc0ef7c306so4755716d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 04:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780571359; cv=none;
        d=google.com; s=arc-20240605;
        b=B4zwwPD147KR19r03b/Q+incojZ9wkr/IWSgbRz7L1cI4e03GhSPgzb0bikH8flCk7
         1B7KeY2Yv708nUJ6xVdTq40uqv2xopA22UvHAeNN2H1365VVBmU9xXDLvUMX5AdyNXyK
         D7hOfpLd3pLYnQdPxCbM25FXkXNktkQQppcRdA5N1rpJZMmauA5HpZ/RieJ+YfxOZFDn
         zzAcQStSGjPnAJIIyqRT3Rp7IjfiVfQrW92c5EMvWw89mZKNF0SlR2v3LCzG5axJfi0K
         LbYCg5mb02oG2MUcd8wggXYPlE7v9pZXSkQY9Tk7slC9r0qIOwzYejPeeFoSCKAUkQJK
         /iEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1JzEK0ffLBDTL6A9d+JE+JtpiwCiQO4fM204Xwmu+dM=;
        fh=RSFk4pL4bfm5MSB7zObP0Cvbl7470V79MDUvEL2Pmv0=;
        b=eyaM48BSdrnsSQpd+IwaOw39H3HL0M0CGF/VLoHqyupHx54AChnlb63O1kQbidL1qZ
         ofoVPEAyB1vNo3h0f8Q7m3QQ96VpV+lW2Ea2AaQXZKhEYA0uKJpeiPYi2rLTxqJTDz7S
         sCy2NkVnUWIOBrIzWuRWthlDQGzcQpBC8GyvGT0j6OMxwroc+6Pj2Vo5xE4FH6Az//yD
         w67/zlXobuQX4Hrt1M+LUftYO0xTtUfVMvlZdEzaAnnTrEGTWWufFlcctg0UkMFnw200
         faRflq1iW3HwXMocghIvm0kXiWCTZzm4DYo84xLlQDgsgg4B0LDPdUkEAgI4KDL1fRND
         nyNg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780571359; x=1781176159; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1JzEK0ffLBDTL6A9d+JE+JtpiwCiQO4fM204Xwmu+dM=;
        b=HYe+a7YNG31+buQ03dWyGZczsySyLAX2BhTv7RDySUIJduwaCFwg8cW973jtpBdBo+
         pb4AjcGXpShKcdW/4A7QAYt86NArZgAihAj/S7QNHSSwiHqStp7L7eWXRdtGfio75re5
         NywJVXkm2ffjLSoMU5wLKWaxzrysCxM1g4gC98PhSAgNKwStz8+/BckncjOvS0u+6ayu
         6DMhy9YOQHecgz6B7LEBVylDF09JSTtpVVuRZlBt5iD5oFxFtDZQU6OGHTsLG2AJ+7Lb
         qm78GaR8UsBiKIvIdk2r7+ePQCPTpwS/aRKeKeOp7z4Rex5Ca7CfUOOgHUJ9kBa5ys9L
         AL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571359; x=1781176159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JzEK0ffLBDTL6A9d+JE+JtpiwCiQO4fM204Xwmu+dM=;
        b=HqTkbh+F5wNhZmRxiB4ooen9HYFkNrZXIVCo12jh/Zk6Ys0bsglIj+McEiqx/BtMcU
         XbMGKwce37CBrtDlcdNqASf0kWz1x8ORfDDdnwkKhU5IN0s1nYbInbYvokS0iJCgF4ko
         RhpuEcsiWWdtoMTft1SoY2R+9gHqtxq4DFhFFlNfYOCT77PQY9GYfClGYDD39EijRNte
         VP638PZHOnhqST5DgEaGsub4/yzGK8+dGu1xafiLrE9wNk3HqzchOLPgDgqyz8s/cAb5
         cj5PkZSidZEdI/op7cDGWNINuXcpq21haVVBcmU/vlhx4oesrRlEjzWbYZw3YQrocx4E
         QrPA==
X-Forwarded-Encrypted: i=1; AFNElJ9jb+s4Ugzbel1x4iYDkygJy2tlBwJfZBf+b3UJzRO8sBVBqggaV/NhVGNkPabovSZOdfIspZgWmfR/nzQwjwBj6Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyS4fkVl2WxrZL9U/4CvZYprIii53uRKmxovr8fFSeIpZL+QV0a
	E6UxVcr3siLyNVf9KlA8TAzS9wHbWqwAxhSx+BTYyuGppU9SK2y4hschcopQ57czdExy6W0AEcW
	rMeE4+a4f8onizdwkWBl4LQn6o6C5xOE=
X-Gm-Gg: Acq92OGCVAf0XY9mDsOsUSTTFyKrVtgslGeBt2cLMfNzQcnAyil1vAGhyyaukSb7KGY
	N+lkepFph8Ssh4vmYdkaX4yFCLG53iRX5HTPEPKTA1ouFNNhMLzIMXmY9Wb6gLihVsU9mK3CUsM
	wKuKL96YlzEhnpcPa4WQD6OPgpOKxg+sFXE3V8occRW6kM3Gjmc5yf3GhYH2NDNQ83NjVKG57pq
	JMTrbvA0zkOXO8qC5/VS8z7GLM/yQ1jQBJbEFx//0RU2kZIuMNK67vU2JNG+xZlOI2ncas5N7WT
	PzbOcPgFugFA9attwrW6rpc18kkElL8iUDFpa7m2fTLxB+hGg5Bi
X-Received: by 2002:a05:6214:3204:b0:8be:17c6:cab2 with SMTP id
 6a1803df08f44-8cecdc3a1abmr123192146d6.13.1780571358693; Thu, 04 Jun 2026
 04:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <85CB8A63-D069-40E7-A0C4-74D615E6CAAD@arm.com> <867f6a81-8f8e-40e5-8440-31c6694bf5f0@windriver.com>
 <18B55B33A6799835.3712505@lists.openembedded.org>
In-Reply-To: <18B55B33A6799835.3712505@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jun 2026 13:09:06 +0200
X-Gm-Features: AVHnY4JUcOVA0JkKPtkonFoUNtHxiYbR424RjzDv96lzEibeBroZ0a_jMRzqNjM
Message-ID: <CANNYZj_AvPtJPWuDOfegDSdCXBLHwwxa4DZVFUxACobyqDpbmw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: alex.kanavin@gmail.com
Cc: Quan.Sun@windriver.com, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 11:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238127

On Tue, 2 Jun 2026 at 21:45, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> Yes, basically split the introduction of separate qemu-qmp recipe (and
> tweaks to existing qemu recipe to use it) into its own commit, and
> then do the qemu version update in a second, separate commit on top of
> that. That makes the changes easier to review and merge.

I went ahead and have done the split, and sent the patches.
Unfortunately the commit author has been reset to me, even though
you've done almost all the work, but your signed-off-by is kept.

Alex

