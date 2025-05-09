Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66168C3ABCC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:03 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.1400.1746804233955980483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NQsKEIzV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7423df563d6so940842b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804233; x=1747409033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOdwbOWcFO7GOGg0ZlYtVhdYXAs64kigmMp4BrgwHjs=;
        b=NQsKEIzVOmhNrHiCBynf2iJ9vhOq4wENd2g3smeiql4kDVOnBtq5KI9ImXW9b6GzXI
         tJvqFLj2g1RIIwpsg1X75oOkL3aY3wK5CEnxBsI+Qf3M7BfAQ0J78Y3PP2urvlgAmrt8
         YiDuTZTQfO1cpHHHCuVz95wWfIIdsRzjoLY2mdNBkEjrbMlDZL3H2ZczORk0O6LOL/Y2
         slXghHnjfmwlebCL5xChNQ80f5f/WRAXyQPdJtds+bbLFQShZs648lYl3BhnM7JmEKRf
         TuNQZwBtSJmAFLoQ0T61SZ6lBPKAC498rhNf4fhlQDpmT261ev9XSIs5BYA5qgV2NayQ
         nWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804233; x=1747409033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOdwbOWcFO7GOGg0ZlYtVhdYXAs64kigmMp4BrgwHjs=;
        b=wsYqIfCWWy7C9TQKzOWtRxB0ramouN+5evT8VeYuQYsdtuSGzkbZLmaclI6txQICX6
         MZJpk8BrNfcLYXPn+7DXArsZyziT6aLnS8bUCLtRfKe+UhVJPPLwjiVZLNkP+ZObUyqa
         5giQuePHvWL+XZIkTqgQH79LPMaCZnvgA71symaW9bQsFe6L7quVC7liDwKCUKc8jLMi
         SzBrYP3kY/odgK7QzdEh2KwiJZFOr/cTwP41zf/tW5YCsB1reoYnZNFnB7tRIB6DR++7
         oeiHAv8YYK228+qdbdY/+UvEBFgORwQyBPqmN23dCBIttyqbsVFxw93Q4qn6ZBBPW2m8
         Kbdw==
X-Gm-Message-State: AOJu0YxQ/Tz5QOZiSgaC/Bh5Rz7KHVFCkrjf+4OLvtK5d0xYZQjGfE3s
	AuCT6AWmENBiJ4ZTpjqU23vsmlfKGXUr3YyEql9sd3IHxkByckm3Nih6rLV/i0/i9S7dDquPJaP
	/
X-Gm-Gg: ASbGnct07Ak7rrwW6IF3vAW/HcRlqy8/yUBTncY0nFVEjAEsNlqsLnlBIbWaM0+muKx
	Tf2+H/8uVzUdtRlah/nHrzkYP9cPwRN4nlZ6dpsdP8ZrKMyBiFbKNz22ROzjNjsOUa9OdZ0K6O2
	EGCtR/aWdqmC4to2bPIjBQS92Q+sP/WT9RBKxu4xpDyzSkJojuCwju9rqNbnUR8VJzzK/h16nHH
	wXFsSxeactFk5i+xFU3JaPFu8F2vyOV+S9pRFuuFg0LgPjYFRaLGs4i94NZq+mC80KnAxNZqthp
	y6/2v1gJC/V9Yn0UpIZVX9DokIYfAX6F
X-Google-Smtp-Source: AGHT+IFWqni3iK/1Yrb7bh0JAcZMJfDY5slQnGi4BSnWhZ0OQfFszHV8aMchrG+zlWen2vUvnyAwgA==
X-Received: by 2002:a05:6a20:cfa9:b0:1f5:80a3:b003 with SMTP id adf61e73a8af0-215abcbb528mr6228135637.37.1746804233108;
        Fri, 09 May 2025 08:23:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.23.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:23:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 01/17] qemu 8.2.7: ignore CVE-2023-1386
Date: Fri,  9 May 2025 08:23:17 -0700
Message-ID: <962cf064df6db243c182c6b53d06a4fd087cd3f2.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216209

From: Madhu Marri <madmarri@cisco.com>

Upstream Repository: https://gitlab.com/qemu-project/qemu.git

Bug Details:  https://nvd.nist.gov/vuln/detail/CVE-2023-1386
Type: Security Advisory
CVE: CVE-2023-1386
Score: 3.3

Analysis:
- According to redhat[1] this CVE has closed as not a bug.

Reference:
[1] https://bugzilla.redhat.com/show_bug.cgi?id=2223985

Signed-off-by: Madhu Marri <madmarri@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 6a5d9e3821246c39ec57fa483802e1bb74fca724)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 53f48375e4..80316af88d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -52,6 +52,8 @@ CVE_STATUS[CVE-2023-2680] = "not-applicable-platform: RHEL specific issue."
 # NVD DB has this CVE as version-less (with "-")
 CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
 
+CVE_STATUS[CVE-2023-1386] = "disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.43.0


