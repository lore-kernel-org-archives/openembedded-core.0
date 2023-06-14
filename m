Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D816C001DF
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.7493.1686734989900843047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cSVpGlBb;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-977d0288fd2so85548566b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734988; x=1689326988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNCxWy+XqeMv0HZcnyrYfETC3+gL4nbSHFjwPE4GevE=;
        b=cSVpGlBbOOV5f2aNBk6W33uOlxd9UlC9ti0eCo+qfBezedoSLVeY98We1GS5K81L72
         fsgSqsSCFn0ohjNlXkxquY3h6tuXGnThhvNKdWD4srGFPXWI0wM7hE0WCokAgMhzqYQY
         wOEcBlDQeG02AiMcL7ZxScCaEKurN6cxCCQqomPyokZ9nbGUHwGpZtatISm/gvRBxeDx
         5+q1zB+6EW57nzf+Y4i/rpQGbFZ9upeG82bbHzvkuNFS8d1LwktRai3IUekSiAmtIp1Y
         tWQBeq0oLbgQIa+ouza+NpI1dlAHq3cMDjfuqQ/MQNmYN1rWvsksA9nXAm+ME9LS6F/6
         OflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734988; x=1689326988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNCxWy+XqeMv0HZcnyrYfETC3+gL4nbSHFjwPE4GevE=;
        b=QVvGq00rG1jKTzpZHrPHRf8QC18+k01ihTV6cJwa651E+K/QO3r1Ux6w+RvVhKNT5X
         0YC/2G/5uECe8+Y3mT3AVvfDslKeKc1LsTJK1SSE5vngJNOHa+vIKa62a+7zTA+4DlI+
         MRBYW4H5UBSKAadvyXjK64iUYcET3kRB+0qqI2vZYXi5ASw0wHkwGQgSExFeV9nIRnhA
         vIb1leBJ7oRvUfeH5uNglGOZz8iS9BGfywzJBux9AdafvklWi3n8/FEw+Mdj2U+34K/t
         cPW4wARfWlpjaYZOM6AfYuxcQgHrxQzS2aWpgia1UnP373M4BXaB+YjK3D7ZGVg61Zxn
         XPXw==
X-Gm-Message-State: AC+VfDzL1MZvqEj/9VW27tn+ueEZINjq0ITsid9sCuQ7Iu1sVMhh9/8d
	bmGZrDnFcMilDjLE9cyZD4IW6u4dXWk=
X-Google-Smtp-Source: ACHHUZ7DqL0Jy0gz6/ARHrKCbuxQO+VOzFjJ9aXxofC7Cw30ThUBhNF84Kuk61VUBMskXPujZ4dbhw==
X-Received: by 2002:a17:906:6a1c:b0:978:ab6b:afe9 with SMTP id qw28-20020a1709066a1c00b00978ab6bafe9mr14552754ejc.66.1686734988319;
        Wed, 14 Jun 2023 02:29:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/55] python3-certifi: upgrade 2022.12.7 -> 2023.5.7
Date: Wed, 14 Jun 2023 11:29:01 +0200
Message-Id: <20230614092918.4065570-38-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182783

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...python3-certifi_2022.12.7.bb => python3-certifi_2023.5.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2022.12.7.bb => python3-certifi_2023.5.7.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb b/meta/recipes-devtools/python/python3-certifi_2023.5.7.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
rename to meta/recipes-devtools/python/python3-certifi_2023.5.7.bb
index b2e3ec125af..924b05c12cb 100644
--- a/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2023.5.7.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3c2b7404369c587c3559afb604fce2f2"
 
-SRC_URI[sha256sum] = "35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3"
+SRC_URI[sha256sum] = "0f0d56dc5a6ad56fd4ba36484d6cc34451e1c6548c61daad8c320169f91eddc7"
 
 inherit pypi setuptools3
 
-- 
2.30.2


