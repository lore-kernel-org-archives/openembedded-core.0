Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206E5C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:48:08 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8103.1784270885616350339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ra5b7+TR;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: lianux.mm@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceab75934dso74774875ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270885; x=1784875685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMDJIkOZKXykrNARDijn+TEz85pXP8OzpeV6Oaplwog=;
        b=Ra5b7+TR4tTfdsVxH1bNFu6yyW+zHWnOn/1HcWmGt6P8FD13nJg/IRM+GYFwdBtUof
         FF9eRA7gA5WmkM1Zj9LTeUYZ9PMmzrZbG1VSkei0Ip3UfNilL7+WOaNXl/d6NcfGHKSb
         t8XqkTFFk4hIJFeDDogkIyECxHyFBbWAwSYU9gwUkDhpJ8PIgKxHn/p2yX0dqoRZDgl4
         Jto18Ywm5nz3gaDwK53WTFBMwi5qNI9ahYU3kgoku8fUXJeT5r2AESlRvilI7caJuBdS
         8C3X8giprPFJNVfB6m2aSs8UfEgNQDF+dy1lx5SSBiDZE4cOJHJ0mwpDRxPwB/922LCn
         2a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270885; x=1784875685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMDJIkOZKXykrNARDijn+TEz85pXP8OzpeV6Oaplwog=;
        b=Wn/iSciIBITGDktABz8XzgEPxa2Nll+NmkizUWXqTWK/wGiGsA8QMyE1KpifCS/8P3
         pPixsrxJP6NEt90mZEjZYikMsqvp3HBONWowVkJYxd9nZ2AhzmHg3Pf1hTOdN35EBsH0
         /VP3Ad4MgNsYdbTxXiuBUg1tog3UxIYLKFbXCViTi21c+F8+O3JsA3xk2LFYtKghWy9Y
         XWgq5d5KBd2zXYlixX5zPn+EiBtkI6OvsxF+im3sOGeyNM81mS0SkhihB7j67o/j1bOQ
         25IK84zboClKkBYoXdzqq96N+27yJ3HLU7x836BApYb+wQ9IcZTjqJiOR9v5ySG5ME6F
         e9Qw==
X-Gm-Message-State: AOJu0YyI4KJ2Ofi3d6c3ecBFEApDQwt3GGKXlkA0NBs4aB0T/npdbcOI
	C4qkcUV+Fv1coFUwq7UoXTMdhkOjKi8WHzOFwIO5Q9DrCjT5eCm9UYwTNWWAoSgjOKE=
X-Gm-Gg: AfdE7ckE2/7lCY+lcqaJg8+Ipeq1bDdHjd4Dq0HnAk/boJqQb+8sIKokw50IYNAa8YE
	Ow2uGN1J68k/X7RnffsxrDLHiYCtJDpNER3GWqoeYW060s5MDPJ8Z7cW2l11DZXcmnp65MynqGa
	Htf9gw6rfSqaVGo1ib7YFxyWrKGKjtRe8ffh0jJcWwA8E6PEYe50dQCUZotb+AqQuBGRCY3ajAb
	c4HEOyCAjUvcHCuQx1wZ2MkSRyaKtWG5LDf/t1r7jxwtnQDJ3zNm6gY0dXK7K8j/EXJsMJnKDEg
	AAaqRm1ZiiDeTAWiCVK7Hudpi0vrX6EfBhiNsdmLfxvFDXJT/TihNbVdnjyZnOrVKaSuKTp1qjv
	WMi07iCbAR4eKITd8Cv68XhZoeTbpH/SMEZxpMUJMZ1ZL9+0K0fgqRt6hclqKMDwNxQY3grEvN/
	k6zYSatkf5aXYdbSM2Kdav
X-Received: by 2002:a17:903:11c3:b0:2cc:6817:d9b1 with SMTP id d9443c01a7336-2cf34a00b94mr15031745ad.41.1784270884965;
        Thu, 16 Jul 2026 23:48:04 -0700 (PDT)
Received: from localhost.localdomain ([2605:a141:2231:7698::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf345110besm5256125ad.36.2026.07.16.23.48.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 23:48:04 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
X-Google-Original-From: Lian Wang <lianux.wang@processmission.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter.Marko@siemens.com
Subject: Re: [PATCH] libpng: upgrade 1.6.42 -> 1.6.58
Date: Fri, 17 Jul 2026 14:47:56 +0800
Message-ID: <20260717064756.51099-1-lianux.wang@processmission.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716075137.18584-1-lianux.wang@processmission.com>
References: <20260716075137.18584-1-lianux.wang@processmission.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241153

Hi Peter,

Thank you for the review and guidance on the stable branch policy.

I understand that version upgrades are not accepted on the scarthgap
stable branch. Please ignore this patch - the existing 17 CVE backport
patches already cover the listed CVEs in the current recipe.

I will follow the stable branch rules going forward and send individual
CVE backport patches for any new CVEs that need to be addressed.

Thanks,
Lian

