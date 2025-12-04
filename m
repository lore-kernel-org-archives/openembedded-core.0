Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F39D1CDDE
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:31:02 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35397.1764822653322539525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xh9drCEx;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8823cde292eso4542586d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822652; x=1765427452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TR9DwbapUTNhPUZEy9ns9+TQP9rjjdxk9hh4q49hXDI=;
        b=Xh9drCExBKqNvUS9+jFu5w3QO9g3U/POHTtXfU2XU44yxkjzeo/hE9thQB3R5DrelG
         5WCZJkIwAEiRQ0kOYMKEEYxBqLb9NLytCYWOj0mWoB38C3r+d9gxV2VLrmh0AnNT76Vc
         n6wCevSQ8ESY3F5Gcdj1i6EnYlq/5Js/kG+PlnAPvwCHP214JNj4b/ITOW5ISXM7Adu1
         WNgMsFMIH6D9oGRJrLbjcTYT8RQmpUiU0Wy4GVM7mkHkAT7RS12fYvU1rp502bX+cCA6
         JYJhXLoLLrT3l9aMta945Js4cncrAIX9yinz6mXFiA04CusnI4CF3mLjGiDoFXQQ//PN
         Gi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822652; x=1765427452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TR9DwbapUTNhPUZEy9ns9+TQP9rjjdxk9hh4q49hXDI=;
        b=r7hUp01y7+MlTDJ+jjIIwHfgGIm0G5xn7WW9UPyyN167/oD/R6o3rU8qNePi1eJguv
         5tmW98CyK+fSzMSXCUmVGqooAKTwVzVurGXAHK03CUV0QH/2BOYJmHcXCtsgfltvwxit
         J56XWde2rUVD6jtok0jxyoIG55o/Y2aWgJ7QZ1ItZuKV6NUgyyCU19QubQdnCkxAkaTP
         5bO61zOJM8OhNnNGITYmWMPTdf/NT66a+qdcZ7feKbdIj4i4LQS9Hjje7dLfZgW2GH8J
         TMBFcORIM2jU3GeTFaj+cAjVz7g9vB4iaZjJhfrBvTu6+wsayhDX2lY2doOrzr54/90C
         /wqQ==
X-Gm-Message-State: AOJu0YzWZgZPjD87T08QaLBIlUCdMnaQ2Sb+0RZ3G833SVd8nXcnU/Xk
	mEvkBzsFvVMhnLFF9xM1N8Z6N3gP5YYJ11GVFazN8PajVDAOB9hbANBe
X-Gm-Gg: ASbGncuCWzV2ksfxrCBNSydQqfOrtbmrFmSTRW0s1E3kKSiILAZyuDLHcKT6CFx3bME
	gsCTi6KfuteNGjBI5vScMuTqVbrbViyMWZ0EUKIkw4rNWb4jYU1LjvluACvSjsp0jNiSr27nDTr
	D/JEJu0oFP7MtUR+IAIwKGhHd1XkCzIjAaS4IV6cNi7i9435hTWjHQDCKec7F0Pf+vn+H+36jCp
	eDOF2YwfH8SwFiqmBSbbAjUffvr3w8586PKfctS2Jq17fdtYZkBoLJ04YS7kH/Z2EiLpSrmTGZP
	UGA2a8Ak+X34YfxwQDBbHm+vkzOQh59oEA+YkLUrKEbHg/D5ookc8l8aQeflY9UkJEA8r/7N53O
	K+xcsI2qvh+9cj31zFC9SELbgVeLQJ9tjglvpR0iK24gVFwrvTW0ZYl2APPkk+XGednH3ffwZB4
	BtvueyIK751aQG1isMilaBn2ko51OJgw494BTKlUqwoERpHM6zRyny2sZDWc5d+ISglsrDVol9i
	DDd9aS68LkNPgQ=
X-Google-Smtp-Source: AGHT+IFi6e7KzNEUnXSjZER9dzYddWR4+1J76HlHeJUL2H6LQvFl9qjxly0EHsRhnjDelX2WliiNkw==
X-Received: by 2002:a05:6214:226e:b0:880:4b27:1888 with SMTP id 6a1803df08f44-8881949baf0mr70159976d6.3.1764822652192;
        Wed, 03 Dec 2025 20:30:52 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:51 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/16] linux-yocto/6.12: update CVE exclusions (6.12.60)
Date: Wed,  3 Dec 2025 23:30:28 -0500
Message-Id: <67ba3ecb8b8d6e1918796d3e1d8af74956243f42.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227267

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 1 changes (0 new | 1 updated): - 0 new CVEs: - 1 updated CVEs: CVE-2025-7195
        Date: Tue, 2 Dec 2025 23:31:01 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 583ce7aa405..5ca6f53fde4 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-12-01 16:43:28.801277+00:00 for kernel version 6.12.59
-# From linux_kernel_cves cve_2025-12-01_1600Z-2-g8d7b13eec97
+# Generated at 2025-12-02 23:35:41.082808+00:00 for kernel version 6.12.60
+# From linux_kernel_cves cve_2025-12-02_2300Z-2-g67370d1b4b8
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.59"
+    this_version = "6.12.60"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4028,8 +4028,6 @@ CVE_STATUS[CVE-2022-49907] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-49908] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2022-49909] = "fixed-version: Fixed from version 6.1"
-
 CVE_STATUS[CVE-2022-49910] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-49911] = "fixed-version: Fixed from version 6.1"
-- 
2.39.2


