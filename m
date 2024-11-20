Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256A4D63942
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:24 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.13826.1732111034126910237
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m22GLL68;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-212581a0b33so18142115ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111033; x=1732715833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2ZoAUDsD9gFrpjf4v57J+FwWvz6UR7XJrYWf7eabN0=;
        b=m22GLL68WNT1FS11LB4kjUm/eDtezqP4S2Ewajuh+LWJzXy+BM7tRlOfS5gf6Ui/9A
         VgvsxgZUOV0WJveAIblCXC3ItmBJMC/n/Z18c804uXo4F6EEt6TCreMt2+Tr9MWt3fko
         gixEksMfP6tkQwwN0tkaAHoF/tp8LRyKrYDc2OG+6GV1WaB/QQYjv+sLZnHl7DIbeQ/U
         cIxNrYEMxCjoGjy3ZAi+Ym1yhkfGRZ3mpBxCLvWVwfVguzllEHjLaN1o+1lNaon+vFT6
         raS3KQm75NQyzGm0LuNCawJJIpHe40qEZVmrNotnRt0rgwz0pPm7ezl3T6L9uFUBC0/j
         thcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111033; x=1732715833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2ZoAUDsD9gFrpjf4v57J+FwWvz6UR7XJrYWf7eabN0=;
        b=DRwm6Gi+EnGZwSUy0D69nxRFNG5Q58FRPB3V0IfhjG2dynqdPhCqidBcepxJNcA8i9
         Xfki1yUPDO7izALoL1dDh3ZfM7S2CAz1dgSS9KMXk8wP3q+9U3AWsCBS2hoUPDx7y0HO
         aMEdrD4TbVEJqf0UhfQ626KH3gbYF8G5AR+TocwImSw89VZkLCRJgT3fjvg1UtWVGH98
         5+w+iMCbDzIaLXHI6SKzM7qe0yEQnbc0CA3yD1ElEuka5py1lxcs8RWEM2wqdDP7YkSc
         YVeewlSC9w4wGpoNaR2Paoj5VSxuTyJFhKzNscXmwcgRS6sLLVgTzbAWUxrD0uXMp0JR
         PImg==
X-Gm-Message-State: AOJu0YzOyrO3pLCHhGPXcGkvqbttliAkofNcQ2fIXmHUHM5nd0JVIRSn
	TtiO27baXSrCch7QMHx7T/g+iW84zReIVgKJ5Lu50/AwMfugvRWD+k7R6cv2IYQcIrKsAX9aQZv
	h
X-Google-Smtp-Source: AGHT+IHO43x0waBdyk10txDm6AVpeuqCIqSfoEWnjb24dvTbMRkB/k6XfJKLQa+tFTDcXV1ACANeUg==
X-Received: by 2002:a17:902:fc46:b0:212:13ec:bb5b with SMTP id d9443c01a7336-2126a3a3118mr33609985ad.13.1732111033424;
        Wed, 20 Nov 2024 05:57:13 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 01/31] cve-check: add field "modified" to JSON report
Date: Wed, 20 Nov 2024 05:56:33 -0800
Message-Id: <242bf4dcd4f85ec4d212fd68e060cf9fb307e96e.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207425

From: Katawann <quent_55@hotmail.com>

Added the "modified" field to the JSON export in the
cve-check.class. This field captures the last modification date of each
CVE, providing more detailed information on changes and updates within
the exported data.

Signed-off-by: Katawann <quent_55@hotmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 740b8a0b23c4021d07c3714420e3ea8b46e61454)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index a5104f210b..6245594dd7 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -534,6 +534,7 @@ def cve_write_data_json(d, cve_data, cve_status):
             cve_item["summary"] = cve_data[cve]["NVD-summary"]
             cve_item["scorev2"] = cve_data[cve]["NVD-scorev2"]
             cve_item["scorev3"] = cve_data[cve]["NVD-scorev3"]
+            cve_item["modified"] = cve_data[cve]["NVD-modified"]
             cve_item["vector"] = cve_data[cve]["NVD-vector"]
             cve_item["vectorString"] = cve_data[cve]["NVD-vectorString"]
         if 'status' in cve_data[cve]:
-- 
2.34.1


