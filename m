Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD51C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:26 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.5800.1651048815946700917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g+yk0XT2;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id dk23so1951062ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T1bVeHL0R2f5T7HQGxMN6St73hoEgPQaO5AFIfO/1Co=;
        b=g+yk0XT2Jq9ytmHEgrTOt4R+d9RpdLbbK0X1vxn6r+84ZikBkglucFxrk7b8oS0FcG
         TgrUjjZwHKco3n03LbW81/ElqnY/8/3A1JIYMh5Y4nUHm6z6FcxqvpzJDyZlHKPUokBW
         aKt7dbdZF+kdjuEQ+w0O5uHr9yEgxEZc8DW7Mil51rS+bnV3FMwzQaPZH7jM5mo3Dbza
         gydEk9HLMsB/FbgBVz5FaExn1ScCekTDBH+oKKDxfeySDJqUSjzGCpJxh6/ArVJiSv31
         nIyGUB5G7dPrrNFY/KdX2DMR65i78OCZGRhWS57ndyz/2mhC+/6x6r0dSUwH60Tevfpk
         fvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T1bVeHL0R2f5T7HQGxMN6St73hoEgPQaO5AFIfO/1Co=;
        b=NyALyWWV+JH/vh92Yn1eDXAnF+sYeyum51FmO9XQsYjsfoSqJC67WHniBHkb1Jl9lt
         vZYZgzToz0GILuJp4EJ5+YhNz4KpavyZm0AYK1AJdrss66CvfnffcVx90YJOEIf1nOjQ
         hL4Dbwp6HI4PpDB/2IpKzzm1EHbSeuG1PXiT+btNPzgMgNxDnM62pFw6J/5vAREgFQ+R
         TK7X9ymBh1qZ8tQL2h0TO0nIrR+5nwCui6P+wCqUUE5/xoGJZ467GDnmu+wZAvr7smXm
         zfwoXTHFsDibAkmnIDPlmthUxQYPvNfSLwz5hTyQMUgDYnMEeO2rJ9KCNOlDT864eZNk
         JmLQ==
X-Gm-Message-State: AOAM533y93Fh/aO0afhEPPKRxUhgr9mM3+yeFZQF4/nrt7oH2/1YCoab
	du1QUWQRzQz5aR5s3YUrLkvG/uO7D+8=
X-Google-Smtp-Source: 
 ABdhPJwszzT1kJ3TUCpKvJIFtt7Vi+A4igt+/D436l3RSgZq3zue3VhlUoMZDbkiV6eal8nDN1mmXA==
X-Received: by 2002:a17:906:58c7:b0:6da:955b:d300 with SMTP id
 e7-20020a17090658c700b006da955bd300mr25475130ejs.481.1651048814504;
        Wed, 27 Apr 2022 01:40:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/18] python3-psutil: submit patch upstream
Date: Wed, 27 Apr 2022 10:39:53 +0200
Message-Id: <20220427084009.3406717-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164893

I had to significantly rework it to make a set that's hopefully
acceptable for the upstream:
https://github.com/giampaolo/psutil/pull/2097

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-psutil/0001-fix-failure-test-cases.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch b/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
index 34ea03b27f..99bfccca3f 100644
--- a/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
+++ b/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
@@ -16,7 +16,7 @@ not suitable for all conditions.
 * test_against_findmnt/test_comparisons/test_disk_partitions_mocked/
   test_disk_partitions is not suitable for Linux nfs boot
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/giampaolo/psutil/pull/2097]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
-- 
2.30.2


