Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5428DC25B78
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:26:57 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.11097.1715858815607204778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AaS1QAlE;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51ffff16400so1053707e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858814; x=1716463614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpO/g4R6QHleQ6+mYxplT+UPY3oX3PXTmYRcL+vbVEo=;
        b=AaS1QAlE94AoK4BVvGUnZKxxRhorPj0DpIzlqChV/uI1SnvzYpDFJUNJaXnIKb6e+6
         pQ2YmDH+Lomsvm7pcDQGMDFMht2Ip9JJ5i9f9tTvII2JGpl7H9LtKdLGhNJdyx0Yexn6
         bST8psA/gQyqaGXCAl/VNmK6NWptFiYNZhsf5WmjngRT+DN1o0I4cVAuCuY/mQZmToNn
         b84oAC7U/XJpNGPjCs5x53FwzZO+Tk4wKvZGYvAOahp81g1REwq4zcDhmkVZWHg0Oir8
         iHt9T+E6RXA3UcAjZebqcEEReRxZVBsT364FNAGVEvBD+SCGJ5fXjGbuK3Wk0/PS5C2c
         vDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858814; x=1716463614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpO/g4R6QHleQ6+mYxplT+UPY3oX3PXTmYRcL+vbVEo=;
        b=xFEraSit5Gk7GgTsEAfqSZvc0hVUQnw4nI303LVm1x8rQ8ZM5ZxElBbphdeY/HSjgj
         vNdbEdZY7++wi6ws1NVGfYmvp2K/4Cyv0BFBgWrO7G1ByG9iZecHyX18shNdbs8O/YnI
         2+TI1+EiWmb/RaElixETmDUzMHPqi83Il+al6ei9rm4TLVjXgGUV+Ok8kaFX71CRuygd
         ZAjnXen2gwo2+k4ej7a/fTyV/ce8jM1Py3ajlbgTCD0isFTBOP4P5P8w8KsYfdTBdZ1I
         KLvKBx2ybI0B7ZjFOcM9qtMkykhfd15yu+DEQBsArdLVMpDJlI1zg2vMWbwwEhEDXMX/
         noXQ==
X-Gm-Message-State: AOJu0YzQADTElKDM7zT0p8aATuDj7HkbGkWVJZ1TFnbPLB6laTiN4c+/
	fgr1J8UQfZ/1UGrQIYpAMj9S1dCJNSsn71+NUUaHGMMGRrfYkvYgQw6ZDg==
X-Google-Smtp-Source: AGHT+IGlucTrrWQ6/84MZBYVq7vWdGO1Z7q51Bf3s5D7UrmCVOs2dXX8UyjF6HR2OVrwLp/ZoEiOTA==
X-Received: by 2002:ac2:4643:0:b0:523:ae99:b333 with SMTP id 2adb3069b0e04-523ae99b3c5mr2368201e87.64.1715858813631;
        Thu, 16 May 2024 04:26:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:26:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/13] kexec-tools: submit 0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch upstream
Date: Thu, 16 May 2024 13:26:30 +0200
Message-Id: <20240516112640.2145789-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112640.2145789-1-alex.kanavin@gmail.com>
References: <20240516112640.2145789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199470

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
index e874a8b4f16..489b1092850 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
@@ -8,7 +8,7 @@ is used by MMU, the "SECTION_SIZE" is defined with
 (1 << 21), but 'add_buffer_phys_virt()' hardcode this
 to (1 << 20).
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [via email to horms@kernel.org,http://lists.infradead.org/pipermail/kexec/2024-April/029903.html]
 
 Suggested-By:fredrik.markstrom@gmail.com
 Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
-- 
2.39.2


