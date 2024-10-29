Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC62D2AB24
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 11:40:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.17052.1730201992221562104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 04:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=atZNM0Zu;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d533b5412so3782168f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730201990; x=1730806790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58K8swsLeITC7NR/rB9uPEBYGsTq61YuoAmhhPw2RpI=;
        b=atZNM0Zud6PgWiqMQUoQRGhclOLzSkHKO/oNuoL19fgu/5QV6fQQxvWCmjsqEEmOpc
         cql+ZKMZe4gSqFUVUAoyo+/cDe2HwUjL484Lamy+fN61Bpa4eEv0xyIMPaiibTQokH2/
         IfJRfmaiyKJuk5lpeJK7N+AgNF7/bnQkVAcYQwUlUUQqGrAqb33Vkp9IkAZRj86nAnDv
         RJku/C+w2/MALOB8LSMLIXHlOZKtRbMECJWj4HGc5i2+P9YsodnBRqgWpF2pfOGtDKKq
         YarOfm1+ZRrolLNAHVMzWYZWj/cndBI2Ts9EyjwPfaSxrsptPwfQedMq1BkTBtfV6Yqt
         WE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730201990; x=1730806790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58K8swsLeITC7NR/rB9uPEBYGsTq61YuoAmhhPw2RpI=;
        b=vttla51z/zGL4YPg9bV7EuZ0zHutRCNiWlzz+mx/+MT5b6/070S53W6pgyHGqopOfI
         8aMqgPQoPPIQen9jIdzYlwWIUvbGPGE7VB7ckLmGsBUvKLPB1P/JQcqUNSRAKMgI6yUR
         3kQ1tZ3pcCaI7H59Py1u5Kwt1AUECB3eE+VAxeVtLia9ilwVT4UDGkwjhpSs2X9LRlQ/
         JgDy82PxJs63LFR80tn7v9n/rmxD5KdarEl6uTKb0fVqPHAV9my+miPsHx8ICaMfuQfY
         1BOeR1QDnmB4fhqJ8FhrwJPzgEWw/aO0LYDDEgHrbJS/B5L7RBOcOVTan0tpTHe48aLn
         Tzng==
X-Gm-Message-State: AOJu0YxrgSL0LQcdjjwkmaK9aD+S9h9dOuuCYL2JBnocIMF+vwUSD9Oe
	YQPYlEyIdWSxWTHMKMb0mqrAK4ckNchU7DmSQaf/n2HeSZnYAxsTFdKhOg==
X-Google-Smtp-Source: AGHT+IGhkADD8PM61ms/AWxTYz7hQza5G9r43QMAWzwlgUekphIS1ejQbS+bBRZRDhP1i3mxjT1s5A==
X-Received: by 2002:adf:cc8f:0:b0:37d:52b5:451e with SMTP id ffacd0b85a97d-3806118aa34mr8702127f8f.33.1730201990267;
        Tue, 29 Oct 2024 04:39:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b132ecsm12343457f8f.5.2024.10.29.04.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 04:39:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] python3-markupsafe: fix upstream version check
Date: Tue, 29 Oct 2024 12:39:46 +0100
Message-Id: <20241029113946.748003-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241029113946.748003-1-alex.kanavin@gmail.com>
References: <20241029113946.748003-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 11:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206493

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb b/meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb
index 40fec4fa98b..03be78a022d 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 SRC_URI[sha256sum] = "3e683ee4f5d0fa2dde4db77ed8dd8a876686e3fc417655c2ece9a90576905344"
 
 PYPI_PACKAGE = "markupsafe"
+UPSTREAM_CHECK_PYPI_PACKAGE = "MarkupSafe"
 inherit pypi python_setuptools_build_meta ptest
 
 RDEPENDS:${PN} += "python3-html python3-stringold"
-- 
2.39.5


