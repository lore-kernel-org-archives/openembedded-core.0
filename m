Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD136C83F1D
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 13:02:13 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.8264.1752152527125083859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 06:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZEMdr3Ut;
 spf=pass (domain: mvista.com, ip: 209.85.216.43, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so954864a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 06:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1752152526; x=1752757326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D/LBpqfbpCbKlHAbIOi/kBiVga6/RVfWDImX616boHQ=;
        b=ZEMdr3UtRtpu5A+FAgbtMG3vmiLLLondytE0t5tm6XXXSQ7zHR4TVkZeSqLnRx5SJe
         K7VouR6qDEJOVP/rIR1FLFvzuSxRCc0fHRnl40rBa9RBt5wESeWJo1N4ZkUuhJBRUcND
         MKd+qRBYN2AigDwVYTTnwH+r6g1KMghDn722E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752152526; x=1752757326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/LBpqfbpCbKlHAbIOi/kBiVga6/RVfWDImX616boHQ=;
        b=hYzDiMOM2JATl0PbX/g8KeASbdCcaJ7rkgIrLhoN7WIx7ZEZ6wDaeABMMxKuoUpW6v
         XDdxobdTQK0OUAtMlgohEL5+Vcoa50HF8UMkAitAgHyk5ZBBL/qrpHgLz8ehDFUfOH+E
         Bm2dqyWrneFVNypRpD9JYlAQxHL0+SrLIz0Pqqf2oG/eo0Zg/TF2nE4ZD8JLSv46OefY
         pPEkS5+DP4/u8ejJnnhejmhuY1PMnNRRTpAbJRIm44S4Gamc5cD/b1eFqA9S6eEJpaqg
         b+yE+/CL3cZYwq1Ev+R64MYMkQJoyIUZ4slmBKhX+8wostY4QluJIZcL0EoY5xlKgTIY
         H3QQ==
X-Gm-Message-State: AOJu0YzPGfQWUwQDOyC6Sj2jpGtduXkwC59yVZsGXUdajqFtu0xOpIbn
	u5P9SI0UW8FHLol8S/4BT5bBBwyg/nB9l3Oy66Jqc/ImVVEBhM5kkQQE7UeBGNjW+3BWNn7QE6i
	d1EWMFjU=
X-Gm-Gg: ASbGncvWPyIHDi+V6H6S6qKA0pWScf6jpp0KU+B7sWf9CkZFPJm+8v5wu/S4OfcHG1R
	LvQ8N8NRmSx5Hrf6QKKAOrgA1AMlMSC561j3/B3c7Kp47gBKTTXaVeYedlKo4jtLCWQegAOmj39
	zdmBjJhRtKUEDyTb3VRpQY/vyc7jZAIE6RDM26Vfe7/yHINSgNNxfx49VdzbnA3d4TQST9dqp3/
	cbyZUgLGkGGw/ncy0apG3+mGnAp+ih7bn0lM9LXXWpMArrlcuo+qGZJ259O8Y/68ixYr5p+nkdL
	4p68Lc8hsyZDNicuLk6gce3v7Rba+MT2THmGcr1m3f63NtIRKVJriZyJwDd9NeFxyr2O/LckIw=
	=
X-Google-Smtp-Source: AGHT+IFiS7eThVvD0XFJRC2c5g5cSSGGoh3ijQ4ZIvPynoVg3Uk9o856cnjrMmqqydHFy+wBVVTaUQ==
X-Received: by 2002:a17:90a:e7c6:b0:314:2892:b1e0 with SMTP id 98e67ed59e1d1-31c3c305023mr4900325a91.34.1752152524867;
        Thu, 10 Jul 2025 06:02:04 -0700 (PDT)
Received: from localhost.localdomain ([49.207.233.74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe579b0esm2176882a12.22.2025.07.10.06.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 06:02:04 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] git: Upgrade 2.44.3 -> 2.44.4
Date: Thu, 10 Jul 2025 18:31:21 +0530
Message-Id: <20250710130121.1222592-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 13:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220119

From: Vijay Anusuri <vanusuri@mvista.com>

Addresses the security issues - CVE-2025-27613, CVE-2025-27614, CVE-2025-46334,
CVE-2025-46835, CVE-2025-48384, CVE-2025-48385, and CVE-2025-48386.

Release Notes:
https://github.com/git/git/blob/v2.44.4/Documentation/RelNotes/2.44.4.txt

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/git/{git_2.44.3.bb => git_2.44.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.44.3.bb => git_2.44.4.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.44.3.bb b/meta/recipes-devtools/git/git_2.44.4.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.44.3.bb
rename to meta/recipes-devtools/git/git_2.44.4.bb
index 7b33d6071e..66936417e1 100644
--- a/meta/recipes-devtools/git/git_2.44.3.bb
+++ b/meta/recipes-devtools/git/git_2.44.4.bb
@@ -172,4 +172,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "4237c37cdf7b3d38102117b22993b2f761a4c02758dfbe33f7b7423c0b096ca9"
+SRC_URI[tarball.sha256sum] = "302ebe0f4b1c5d1ee477b5ee74f7f2f69efd8fa7f27481e45087ba9a4bb4851c"
-- 
2.25.1


