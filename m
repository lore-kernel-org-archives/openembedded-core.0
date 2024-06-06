Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CA5C27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 20:44:55 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.26026.1717706684445597832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 13:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=egQSoS7y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3550134ef25so1344780f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 13:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717706683; x=1718311483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=akLVkC+Ba/zU/nXbvvaI46cQRlX9moKhqKgZ7VSxKv0=;
        b=egQSoS7ySS9V5LLKkjmjzPeByzlgae+uTbrAxp5CzDNzV84mm8N9dsgNrx2A4F4HyP
         tqqq9bWWc5/5b1I5FrHo89I4bGZixe1d0hkQ9qRE2fbVWlzwAnv0DGX6sJ8sXHIX69GK
         gDB+BvZExcRg7fMgkzCEhSGv60lj/SDHmvEuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717706683; x=1718311483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akLVkC+Ba/zU/nXbvvaI46cQRlX9moKhqKgZ7VSxKv0=;
        b=fmM03kPhzQniH3sAYvgEjFU8lqJJbVQRIkfL1hvXZLj8O4reetvJKZKfx+CHzpplwm
         xSTwL4c1nTV0yiL6xR2g5nouoG59U8vJBxanuqQwrG5bxQezFumb68g1gK69mPvx3wvN
         +MiKvhNEILSNAgMNtWCoaVjYfuUsYN5fdHOb9v4PlF9gbRHPHupuAX9ZC6rl04ysm15Z
         enhqjYpIUu+VYwDrgLgBB2yX8wvnqaBi+WnOLzS5Kn61N10fB2MB8qdr6U6xZU6HPd7g
         0hvp5YnJ9bMr6dV9hLyuYDv9W1uj2pJ6HYHBZ1xt9AmpWlFLhefQCfOE0tMk3lBM7hYT
         Amng==
X-Gm-Message-State: AOJu0YwPZGX556eyRlzfy4qfvtFCg1H3HWdGqi2iNx76QPq2y5vtfC0p
	vaBXApr2jE/k+N8T8T+qkUeDLQgP3Dcl9fDT1j3KHU8+7a8BH5VFBjx7vOzimA+gFUni5a1BXzx
	j
X-Google-Smtp-Source: AGHT+IFyoa8Y32yO197UWzGAyHmH6F8ZdugpOyvdzw0/V0sWFzTlVV91Zcsves5ue6lr0UGfOsx87w==
X-Received: by 2002:a05:600c:3789:b0:420:171c:3d70 with SMTP id 5b1f17b1804b1-421649fe781mr6850495e9.16.1717706682400;
        Thu, 06 Jun 2024 13:44:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cadb:e931:b4e2:8fa0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2cd667sm31870545e9.44.2024.06.06.13.44.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 13:44:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-exclusion: Drop the version comparision/warning
Date: Thu,  6 Jun 2024 21:44:41 +0100
Message-ID: <20240606204441.127341-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 20:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200416

Since the CVE repository is no longer being updated, drop the warning
comparision since it is no longer valid.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-kernel/linux/cve-exclusion_6.6.inc | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 9f1f03ac533..32a0701edfa 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,14 +1,14 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-05-02 12:41:43.351358+00:00 for version 6.6.29
-
-python check_kernel_cve_status_version() {
-    this_version = "6.6.29"
-    kernel_version = d.getVar("LINUX_VERSION")
-    if kernel_version != this_version:
-        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-}
-do_cve_check[prefuncs] += "check_kernel_cve_status_version"
+# Generated at 2024-06-06 20:41:33.044442+00:00 for version 6.6.32
+
+#python check_kernel_cve_status_version() {
+#    this_version = "6.6.29"
+#    kernel_version = d.getVar("LINUX_VERSION")
+#    if kernel_version != this_version:
+#        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
+#}
+#do_cve_check[prefuncs] += "check_kernel_cve_status_version"
 
 CVE_STATUS[CVE-2003-1604] = "fixed-version: Fixed from version 2.6.12rc2"
 

