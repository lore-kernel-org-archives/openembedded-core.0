Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60482C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 22:24:14 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.9215.1706826245756091712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 14:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I6eLkhxR;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d746856d85so11312155ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 14:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706826245; x=1707431045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLgF9r+/Tgoa+UynkdnqLYtypwahxAJ98lVUPwVunPk=;
        b=I6eLkhxRZ9stTM0RdxuiUMxg6sqcgg9SvHqrwSX+QI6vs3xqp7AQ04uJZNqf0CfPqQ
         ETMZ5AYV1XZRurSLjn0NkOM7FP5m3HrYZt7kK4AApT7fVZToMoUMOPhBk1IGyMcwykpB
         wNY4DVZc7WNW1jIoOzZcQ3Qdu11redFXL/OwvijMza3l9BfLw54+pP8dnOY9NdmvpuJE
         aWF2baUB4MSTxQnfvMXHtndJOorvUNYbtBtvHKcsj5knuBQxE3IdI65a58aabTQV9ezj
         d1KqXCo4MYMCC1htViaNZTqc70tw2k+ftZjUFS4c7VZ1r3uy8X4wqV/vbYW/7Ufm8GUV
         4DxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706826245; x=1707431045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLgF9r+/Tgoa+UynkdnqLYtypwahxAJ98lVUPwVunPk=;
        b=NSUy9aFOmaKMLyQi5fhYUyrgvXouzDy0nb4M9pbrDcvdQoZcslvURPYAqYJI4YVbnY
         eWUA5EMfjL8U0RPkWmsyjZI0VckV3v56ytu9Dj5gckzfL0bWCq+mlCA1IvpC9TP6f8Wp
         h8XeWswhd0d8JdO+wrH8Hw27BwijYMW+NrqoUJwprbqnUNItUKRS8Ii7BdLdU/qi53Qk
         kpJq6tRJdELdyRpsOVt58w35O+eXohNnlKN+/iuEc/xB+ZjHx6VBHIwV0oMgt6cwNYS1
         fjGk4Z84C7u3JztVdJcsGkXc6SkDPdOri5tGT3T8mykLOGoJ6gsdop3H4ugk6y5FhX8r
         XUMQ==
X-Gm-Message-State: AOJu0YwWKG6PaOw9K43spNQ1qRZz3B8/ZL7bKGeTvERLhCj2xxwUxQdo
	ziOBh7fBqYGwYn/iiNwfNJHpM9K71ECp7y4qIf+lqNDNtNC3jzWIBpyc9Gqq2n0=
X-Google-Smtp-Source: AGHT+IGUIFJwc9/n0U0wSlXWNavgN7Gn3gAZNnakdN1/EnMfc3u6touCOx18RMlBMUxnfnJUS7m1pA==
X-Received: by 2002:a17:902:e88f:b0:1d5:e413:c139 with SMTP id w15-20020a170902e88f00b001d5e413c139mr507995plg.24.1706826244901;
        Thu, 01 Feb 2024 14:24:04 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWRsnj7JfHeGvvr1SKX8rUYcN+F4qM7cjRaOfdUjz2hxHqmUbuUpxviMpHmpNzEiNPAXAuZfM+DcT0RpD8xeTLSKmc=
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e58e])
        by smtp.gmail.com with ESMTPSA id o10-20020a170903008a00b001d940ae8ffasm324239pld.6.2024.02.01.14.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 14:24:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Valek Andrej <andrej.v@skyrain.eu>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] glibc: Refresh CVE status w.r.t 2.39 release
Date: Thu,  1 Feb 2024 14:24:01 -0800
Message-ID: <20240201222401.565583-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201222401.565583-1-raj.khem@gmail.com>
References: <20240201222401.565583-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 22:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194757

From: Valek Andrej <andrej.v@skyrain.eu>

- drop irrelevant CVEs for 2.39 release

Signed-off-by: Valek Andrej <andrej.v@skyrain.eu>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 5 -----
 meta/recipes-core/glibc/glibc_2.39.bb     | 2 --
 2 files changed, 7 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 848648b5994..a35c7b28a70 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -7,9 +7,4 @@ GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
 
-CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4911] = "fixed-version: Fixed in stable branch updates"
-CVE_STATUS[CVE-2023-4806] = "fixed-version: Fixed in stable branch updates"
-CVE_STATUS[CVE-2023-5156] = "fixed-version: Fixed in stable branch updates"
-CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
-CVE_STATUS[CVE-2023-0687] = "fixed-version: Fixed in stable branch updates"
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 0273be713f8..577ff1ad2c4 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -16,8 +16,6 @@ CVE_STATUS[CVE-2019-1010025] = "disputed: \
 Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, may allow \
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
-CVE_STATUS[CVE-2023-25139] = "cpe-stable-backport: This is integrated into the 2.37 branch as of 07b9521fc6"
-
 DEPENDS += "gperf-native bison-native"
 
 NATIVESDKFIXES ?= ""
-- 
2.43.0


