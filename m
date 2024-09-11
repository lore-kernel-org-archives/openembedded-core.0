Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7235EEE57ED
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:23:57 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.35235.1726097034827503361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yabXu37O;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71781f42f75so249002b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097034; x=1726701834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukaO00bt5PrYe0mgQLWNUEO9del1WjPcl9Katlw+dcU=;
        b=yabXu37OiJyRh+ti3kA0bsAA7ACkfwISmS0HfpkTR1+7cGik9oBuPC/XC5Bgi9v85k
         gkXLoZd9eptU529ZXqEjAkUMLOrH8nXEzH40g5Ocf+f76cpNrJSG8IWz4QLeK0kMQdTB
         RNataLkRV9v9QPs0/zWRawdKzD4TAbDUrLXRmatLnRXmwIp1Hv1d69p5Zq3gbzP04WTE
         qzoD1McPogCwe8ZUTFz+fwodvjyMTRJ9to/z3WQ8s7KQZq5zGj620//5qcXgwZ3NzSb2
         jsDvxr3rbBk0RVZLPZVV/YHaaY/PRvG3c7sXxfSHTtp2CR8wGGm5j57ujk4egl/gzEhv
         dw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097034; x=1726701834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukaO00bt5PrYe0mgQLWNUEO9del1WjPcl9Katlw+dcU=;
        b=nKAYzshl3hpsx5pdhdchuTtclqnkV2liir326nKBPlgdJ6/MQg/EREplydFN7cRSei
         Vt8zFGvCAzfKmjACygWtgwjd/vsdpJu+NPI1gUGOha1sdAGsEAC2mYdcEXAyWTLEGawy
         EN6jQU9FzwYsrk6N18mob0SHqeNh4y9PIDzWAHa9FxMqZ03FwtvDn1Xs7LBY+Mg3DukS
         w0jY+mzn+EMQm4Em2g6wOuhMkgPHoEOAKSWCxK2EZIlKkvF7OTsNtgPHP67m8UYMIpyv
         m8/1FuiBVsJj/uDD/aS4fQ9hOx3jAoBLaHy7IiLfVb1/B4ibnTwbDy3OLIn7PcsMnoeu
         f53A==
X-Gm-Message-State: AOJu0YyuRD+IAYUWKwzSbGtrq+6eMESV1CD9nd0y/lgwjzQRdizSc+SC
	+grLUEg3O7r9Z6qra1on6XVuFxlsWvDvXfURjV8WLZ4k7woNt4AvrLxJGdw/ncdTnRacbIyfexV
	I
X-Google-Smtp-Source: AGHT+IEmNtyaZrX6MRZfBYnRN3Lx2P1TECH/nkXwMbN0p3ENFUHlYDXyoIWnsEkV+mg8/NUs9sRpFQ==
X-Received: by 2002:a05:6a00:2e11:b0:717:86e9:cc34 with SMTP id d2e1a72fcca58-719260812cfmr1543729b3a.8.1726097033984;
        Wed, 11 Sep 2024 16:23:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/22] cve-exclusion: Drop the version comparision/warning
Date: Wed, 11 Sep 2024 16:23:11 -0700
Message-Id: <73336ee2416b78ef8ec6c9a16d4371488233610c.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204408

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Since the CVE repository is no longer being updated, drop the warning
comparision since it is no longer valid.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_5.10.inc | 14 +++++++-------
 meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
index 4d959c90b1..4ce0664c0d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
@@ -2,13 +2,13 @@
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
 # Generated at 2024-02-21 03:55:27.305577 for version 5.10.209
 
-python check_kernel_cve_status_version() {
-    this_version = "5.10.209"
-    kernel_version = d.getVar("LINUX_VERSION")
-    if kernel_version != this_version:
-        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-}
-do_cve_check[prefuncs] += "check_kernel_cve_status_version"
+#python check_kernel_cve_status_version() {
+#    this_version = "5.10.209"
+#    kernel_version = d.getVar("LINUX_VERSION")
+#    if kernel_version != this_version:
+#        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
+#}
+#do_cve_check[prefuncs] += "check_kernel_cve_status_version"
 
 # fixed-version: Fixed after version 2.6.12rc2
 CVE_CHECK_IGNORE += "CVE-2003-1604"
diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index f5ccf2bc22..1f5c783db4 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -2,13 +2,13 @@
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
 # Generated at 2024-05-02 12:18:54.390781 for version 5.15.157
 
-python check_kernel_cve_status_version() {
-    this_version = "5.15.157"
-    kernel_version = d.getVar("LINUX_VERSION")
-    if kernel_version != this_version:
-        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-}
-do_cve_check[prefuncs] += "check_kernel_cve_status_version"
+#python check_kernel_cve_status_version() {
+#    this_version = "5.15.157"
+#    kernel_version = d.getVar("LINUX_VERSION")
+#    if kernel_version != this_version:
+#        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
+#}
+#do_cve_check[prefuncs] += "check_kernel_cve_status_version"
 
 # fixed-version: Fixed after version 2.6.12rc2
 CVE_CHECK_IGNORE += "CVE-2003-1604"
-- 
2.34.1


