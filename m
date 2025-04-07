Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7525BC369A9
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:40:59 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.42756.1744018852517192585
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eNeGBTZ3;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913b539aabso2332521f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018851; x=1744623651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPxpzOmXY5nf0+AsqEJm2UNoYbIZc4IeeLhqWxYpQ8k=;
        b=eNeGBTZ3OAdfwEROQ/xp5dtySrI4/4NHfJ28xp0NdzvhvJM97R1QHYdLUh8MAFGm1g
         +9e2X8kVPnV2Jf9T1BXYzyLLEDsWa9F0xY/v/0nqX9Rndys+gC2iD4ksZMy/9Qs99Vwx
         tAiAF2byV+CXogsacvbT3PbgqFRu+JuLkWUa6VvXydALtOCahMHGCPOq0yz29lsV/lIk
         skRmAqDJUqM0sYmSL7VeYBLO/xSHFvLqc1QgAxR6dj5JAK59Rdbmo7YQzhqCE8QHgxo4
         jIaEWQ+LXUWsaRqWv1aPX88OTjoqvwJmhZGsDAdBrUGPerMsQs9A0R0F3onUPlx7ss17
         +63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018851; x=1744623651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPxpzOmXY5nf0+AsqEJm2UNoYbIZc4IeeLhqWxYpQ8k=;
        b=XFycX8hIYiO3mOuXldj+PRmyAflb6pnIQAUVowYsblXb8pimFGs1ewQRrQHrBPp067
         XHjkrg1t38ogmdrODGAlJKwV1Zua25tMz4Dkw5JBl2fbgNLmPXb1lTquun+goUNYvBIp
         mOyFVVUtUWVTFwGhnlHQSqivyzABTwpW1hnUTSkRsVa5NkujY9TYcHbiJ6kFcvLC33h+
         DzQXRGAozBsFK+K/6vcYYP935CmCOoCfxBKOxfOqNm210tpUJruWSaejQ5LugM6Qk3AQ
         B5T9CSuMrBk7aypwM83iPbntj4ppFOvemXwWNntx2PBtF/Ujsa9s+VurpKCy1R5MoVXa
         rhPA==
X-Gm-Message-State: AOJu0YwUS15F8CQEyoq89GHg5kResRff7CVsu4a0Saauas7GpcnPLR0K
	wukrGhnxFpsHRf/uox8W+nQPdMJjeQy2q7wccJW7T8OtKI9WcNDITBFRNA==
X-Gm-Gg: ASbGncsR/dYHYC//dGrO+W3sZLZy/1ieuNXu81nzQowhwUQvEb1TqeKqtOKY1oMaHPw
	hwISB0SCo78+w5Kl+calbmsKbPEjhaHk36mMjMfmPAMjzA33Rv4ORY0tpVkiiHDdK9+utIskz8P
	KR0NnQCxjYDIOfLNHhltSLVqOycCa7QJtbvacpD4RwuJZc1ozce+jRXCMO+oXr8F2LxI1sOTY6E
	Gob/SfZ2lXfJj4s5806MFnw78CaXkkSfjK9zkPKqHF+e8PyR8sJuKiNk61KNpXSiyN0Iw+UfsrS
	G5ZXLar5Pu6J/7dTIdUjYpS+oR7mJqatdgiYOf9iHFK4g6Lx7/zUiZ6GFihmZVbSQsK733C3rpJ
	NOOUUF+nQ9VhaXlDF
X-Google-Smtp-Source: AGHT+IEMngnZNJmw0VWXp4nLLcJDmxVGeYA37SONTjuLefMyNJJBzgbM82kbcSXpHNTorXDdAa16RA==
X-Received: by 2002:a05:6000:1867:b0:39c:cc7:3db5 with SMTP id ffacd0b85a97d-39cba9331d6mr8900231f8f.40.1744018850485;
        Mon, 07 Apr 2025 02:40:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/18] perl-cross: submit determinism.patch upstream
Date: Mon,  7 Apr 2025 11:40:29 +0200
Message-Id: <20250407094045.753021-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214411

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/perl-cross/files/determinism.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/meta/recipes-devtools/perl-cross/files/determinism.patch
index 29de36cbafb..71a405ab6b5 100644
--- a/meta/recipes-devtools/perl-cross/files/determinism.patch
+++ b/meta/recipes-devtools/perl-cross/files/determinism.patch
@@ -21,7 +21,7 @@ d) Use bash for perl-cross configure since otherwise trnl gets set to "\n" with
 
 RP 2020/2/7
 
-Upstream-Status: Pending [75% submitted]
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/154 https://github.com/arsv/perl-cross/pull/155]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
 ---
  cnf/configure         | 2 +-
-- 
2.39.5


