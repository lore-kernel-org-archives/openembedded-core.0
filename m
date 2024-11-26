Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF8CD3B985
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 11:18:42 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.43928.1732619912684288552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 03:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwYo091d;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d413def36cso45636836d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 03:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732619912; x=1733224712; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RTe6C9BNOd2Pf9X1twb0fOqgQMh/YiXTwkENHpQy54E=;
        b=UwYo091dJiLF3njTcvZ+NMqHoMbpDun2A8Vgs/P4u8s+E8sl/fKGCGteqp1aZ8QfSS
         xLxZzg2Zvxln1NoPNpa1N0XABltsSvGolWs9y/ZBk10krIorqGvEkWf/oaCxMaiBZtSt
         vhv5h9fHJ5yj+BqFgtW2DQuRaKOHfnuzGkBNUrRb8wcCaU7I8kIauDZObRC5IyxMe/r8
         fFa8tEAtzPD+eD8UKSE9WIuCiUEtvJObS9l2QN4YPNm/9t5/GswCmsPrY5DKPMr+O00o
         0QkL3O0OjqNhP0tgKQMNHNwh6NQfPjlqwPFF3Yl4dSlnU9Vqmu0rc5sXyKv7CqTDH2m6
         LEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732619912; x=1733224712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTe6C9BNOd2Pf9X1twb0fOqgQMh/YiXTwkENHpQy54E=;
        b=wB8mr0IV5p4YTh1z/h+MeRQhJXG3xG3TiXzhDQhkKM2r83B7jkePUDsSLwMZXtX3Af
         x9TRPaQXHUaiZmpQJz8aqFLJSE/NaOSXU2czop5VPrJ459myq/hYQu21IJmcGjXLLmqS
         7Jsg6Zr9KGhOFvoxUWP5eobc7hdPtXfMrFR4HswkmWTsYqqK4woUKSkeUHmDDVKyG/87
         PhPULFp388OACmfcJJQQowrLhnhmulGkF7WV+/RJnRsu5PA09MI2tT8X2R0pwsxzIcHW
         k/0We43HKbfNsN+BXdqBK9iWWmb2dIkeWS8efQD14B8YivOTQ6MW3Kw6Epd9hxj3IXoL
         4FtQ==
X-Gm-Message-State: AOJu0YwaJv6fdnqF2lFW4Ngp4ARkCJTGhzvgfMuVfyVP3xOIfpJiX2ci
	JDDz4ZPudfaTP2XhmtHSn4xqzFq/j3wSsG8I2hlOcbD3gkeSp3hluWiHwEwq1Tbq6U3q9w6XFKp
	gs3DwZRtYeHKGf7615LZO2E5DD0M=
X-Gm-Gg: ASbGnctexkDWfX6OhKbs6YSyVsU4GvSYeoiOAc9q7mEK1itYxeGyAvl8p9S/9HwroCH
	hffLiDNqqMBBCxstbXFlx3L3Qp7eepH1J8Yk0Zh0y8aoXRYLs8+yc01AR5sW3tMpNCw==
X-Google-Smtp-Source: AGHT+IFm6/8IQ4ScDb3E0tlQKMFXjVZyzYHVdJ4YKa6ELT4zKE65qeqVay4JHowRjKuaIrD92deoY0hp9XRxTsWqQaw=
X-Received: by 2002:ad4:4eec:0:b0:6d4:2226:b05e with SMTP id
 6a1803df08f44-6d451374bfemr259708856d6.43.1732619911760; Tue, 26 Nov 2024
 03:18:31 -0800 (PST)
MIME-Version: 1.0
References: <TYWPR01MB11861AA75103D416B518D1CEEDC2F2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861AA75103D416B518D1CEEDC2F2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Nov 2024 12:18:20 +0100
Message-ID: <CANNYZj82P1RMCicKPN5z9gvwbcVJgzXrVp7F09UbfFXok0ob-Q@mail.gmail.com>
Subject: Re: [OE-core] conflict between tcl8 and tcl
To: wangmy@fujitsu.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 11:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207847

On Tue, 26 Nov 2024 at 03:46, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
> There're lots of conflicts between tcl8-doc and tcl-doc.
> Currently considering two modification options:
> 1. Using priority to resolve the conflict. For example, set the priority of tcl to be high and setting the priority of tcl8 to be low
> 2. Rename the directory where the conflicting files of tcl8 are located, such as adding the tcl8 version number, to distinguish it from tcl

I think option 2 is a better one. What is the reason for installing both though?

Alex

