Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFB2C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 21:20:23 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.6139.1741296015424279358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 13:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eI2W7S1v;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72a16478125so339641a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 13:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741296013; x=1741900813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EC7gRvjiN2fVHYWr1CKvXEwvXAAg3BDZbYyw3AUnZsE=;
        b=eI2W7S1v8JD5BvdibKhsOriwCu0TTNvPdRDp2jemCPA6UKBJysM+vRsIXJAwKEyXCH
         EW7fkE7rGmBbTg9GgcyjpVSGUZ1rzOCmEC2tASMZzqDaeDgI5N3rKcgKoO7axxOUXsid
         RTofmIr4OHgwYJyBTCtcHL3BeifIelxLDhy1aMDYep8fy/iMGTjrr5OO/jDc8DcXEfyD
         IHD5KIN7E/x6zg2ZEx4CDVf6QyiAYM2zE/3am0B4Cui+CPLkSxR8CdYcxKRGjKYXDtX4
         5yrlaiBlhwUKM29iQnX6v4cjQ/uwWDciqfzUHOy7+iawgC7/6yVFjaRBbV2GchiULriM
         XNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741296013; x=1741900813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EC7gRvjiN2fVHYWr1CKvXEwvXAAg3BDZbYyw3AUnZsE=;
        b=Rw1nFxbM5L4IkBXBiseux44leQyyWMY4nIQ6StWAcHqBjeFaF1IOccX6s3FO9p3okk
         xpRsExHxGq/jpfz9fC99El3q2Gov95xIOh4xT4jm8eOY8cOwtoA2vv0KfOGFLNHsH28E
         rhAPf2qwK7J7idEZYonB01MNbkLKJAIVd+DBN2i92nb12ZvamdFGfNk1ViqYsIEB/rwV
         14z0Mfe62NSEJ/monXQSgy/Sh60nsOmja0zLWxyew3S1syMeT8OeyMvFvl6x4QmwWJfz
         F4Dqc2ropzh+oNLLvNdH62b1zoWBzMcp27o9jENyF9D4MTN+UAGk9lKGWNOGXkRldd66
         jW7w==
X-Gm-Message-State: AOJu0YxGs3JqvS+9z120JNwAQDQ7aebAyYjGga6WieO3AI018CjB+610
	WWEp2SL6ukwULHWwSOmZr8b4ESl/Cw2FPa2Hv/sKnTi829k9lT0PZfjOWA==
X-Gm-Gg: ASbGncvenEvShjn/b7XgbSefkqCcsi4pb0H6OdA70JdHQX7AN5DG4GITUXdKhXVKwGX
	HC3cdcNSF87XKnskF8hjnEayhX9HyBDyoZmxPOmOy1WXpKyD0wbjOZCSEQxULV/9miAFkTQjmSc
	SV78lH1HOi6Ig9Vg6PkZ9/BDwe5gXALPsoWcB+8wxjzQGw0AZNF27L86ejRgv9P+hbKk+W/Qgzp
	75OciX2OeT3/borJNMT7sc4M9mw3YvIMBSSo4jwfpclTClzaNeAn0ovSrJkeEMavJ6fN/KST016
	cUREr7S11Mwvg8hRTRlFmmMtxpFq0XI/VRFPQeO1Qg==
X-Google-Smtp-Source: AGHT+IG0pYeVuj2ZEJ+PxsYP3iKPGwDAk4SX7Az5Mv8dKx7Oloj0Ub+O8bw+s9QVUmy5sXXEL8eyNQ==
X-Received: by 2002:a05:6830:6f44:b0:72a:d54:a77c with SMTP id 46e09a7af769-72a37b378bbmr508569a34.6.1741296013372;
        Thu, 06 Mar 2025 13:20:13 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::152])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72a2db0c42bsm404829a34.40.2025.03.06.13.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 13:20:11 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: spdx30_tasks: Handle patched CVEs
Date: Thu,  6 Mar 2025 14:20:07 -0700
Message-ID: <20250306212007.44880-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 21:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212404

The code to iterate over patched CVEs (e.g. those patched by a .patch
file in SRC_URI) was accidentally omitted when writing the SPDX 3
handling. Add it in now

[YOCTO #15789]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index e3e5dbc7427..e20bb0c86f3 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -498,6 +498,16 @@ def create_spdx(d):
     # Add CVEs
     cve_by_status = {}
     if include_vex != "none":
+        for cve in oe.cve_check.get_patched_cves(d):
+            spdx_cve = build_objset.new_cve_vuln(cve)
+            build_objset.set_element_alias(spdx_cve)
+
+            cve_by_status.setdefault("Patched", {})[cve] = (
+                spdx_cve,
+                "patched",
+                "",
+            )
+
         for cve in d.getVarFlags("CVE_STATUS") or {}:
             decoded_status = oe.cve_check.decode_cve_status(d, cve)
 
-- 
2.47.1


