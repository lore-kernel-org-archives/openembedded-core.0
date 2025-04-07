Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F365C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:41:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.43313.1744018863095613639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JxGj0GT2;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf848528aso34005175e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018861; x=1744623661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzSai3ITPKMzGdaYq9x/uq+Xk1lpS+Eh2lHHNzUFXFk=;
        b=JxGj0GT2fQXdzT013e3QPRFKSZ+yONVi/MBzZ482GIB9a2n+I1MtsWH+VnLTHTa0Lj
         AyOsmeQoM5bgIoK5pPW6yn3pYCBpFLjoy2Xox+Lbn6mtqhETYx5bA4+Ft/8nmfXVvqFs
         3MKDwrHxoY4v17sVOoiWHPlrjRoybNxqPLLUseIYbHI/hs8+nzb164BN54xKWdtW5ceK
         gxsP27GQCF5keYLUUQyiJgxCQcYJ44zQOPdTsldeSfK0I504vXOzpOc9as9XY76uASFj
         J0oWRgrKXeeD8UmZvrbniDg7JhdbVhxTm0uXtb2H9lfsFE+Pyz5SQXXtqXjmoWze76B3
         QIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018861; x=1744623661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzSai3ITPKMzGdaYq9x/uq+Xk1lpS+Eh2lHHNzUFXFk=;
        b=Z5YpKzLXg/b8+6abV5R68X4AH61e2fwdMlWSH/ATvR8MwRicWAniaexXUqw00xjwlF
         3jVDiIcHMrXHtXshhPtz3rbXPyZVjpoi3r42wORN7z/Bb5rJl1wqDmzcbx43bu60nIXD
         xlgYsZvH29S6ZIHMLIFxJLfQN/FQAheCi4gSjNS3Dn0yOAqJZxA7wFaOF99t8I6rhGLH
         QnwbaoTbKZbySdLAJVlw9QWOu0D26R0db8ECiruM0atQUEw+GtCaMZXMTyOrBW6a5pg9
         /UUQw6Hj0hBWxjduZCfmz7sf8eU+i/kxC6ZYwhlQ8Q3gsPT/09KR7B+v/+Gc0IpuvSgi
         Mbug==
X-Gm-Message-State: AOJu0YykD8ySfr0CUfoc1L9RaNBjGPcToVa4pbn+OJWrC5R82stCbAm5
	2y1fOWayQY2kXAHkNXhz02DcGI/AsKWRLvHV3UuQp1djfA3VUmGxlK18dg==
X-Gm-Gg: ASbGncsmzs6VKs2/Hx84Db0c9/SSg/hrhKri52aIX3vTU7Dso5wgC2RU/Tm2vZgAjgY
	IodI4IkDSpWeO75zaRNj/YweDxW++vR2TmrF5fE0qqKY4Doo0pJbJWovcDFvwhMD5wZdQon/Zah
	M01KsCieyMHgleItc7oqbfLJZ4Uj4uWrxpze4iqErzJChPm8yPTurFqr8SuTKb/H6sB84G9MheU
	APdDAL4LBcIo0h+ps0fpPOsXYvlYZXljOJgoVBKxGUD+V0rlEe8M3058miNVha2XzmAKIOvq2g7
	N5C01JBz7LfSWf+XWykM4ozSZ6M8qhta0yAqbD8dr3kxc1vBGzY8IhSYh0YBL72MtkAZyR2hai2
	oBSgddg==
X-Google-Smtp-Source: AGHT+IEz0rn9hOeDG2fYM2KoZbya5ZxOE3gWH4kVeppCd71wxxBXebYnP6d4gnJo5fEBalIjX57O7w==
X-Received: by 2002:a05:600c:a016:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-43ee0613661mr101936125e9.3.1744018861148;
        Mon, 07 Apr 2025 02:41:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:41:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/18] numactl: mark Fix-the-test-output-format.patch as Inappropriate
Date: Mon,  7 Apr 2025 11:40:45 +0200
Message-Id: <20250407094045.753021-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214427

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../numactl/numactl/Fix-the-test-output-format.patch            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
index 8345f71d72b..b7a2e51582b 100644
--- a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
+++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -3,7 +3,7 @@ From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Tue, 21 Jul 2015 02:01:22 +0900
 Subject: [PATCH] Fix the test output format
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [needs a Makefile fix: regress/regress2 should be part of 'make check' rather than 'make test']
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
-- 
2.39.5


