Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0007E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 19:22:43 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web10.68412.1735586557385067882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 11:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nSwd3xLr;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: colinmca242@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a8180205f3so37363995ab.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 11:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735586556; x=1736191356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gappU3xDlV4ePT37eSn6kXIG7FGYt6FgsmHQZOv98xA=;
        b=nSwd3xLrekfhfnc9n70gSeQ7kon+NQXzPhrA8NfdCzzhXFcJBfHK95nk2a3D2cHAKq
         fco/lgFNgDcUA19eUXV9kIkElTqwjVsIMhkdmZh+wOBznwHBZihsQ/Qf27W++RgAvJWx
         cB0wtH47shQ2pjGiHzGArCcvdlRr1xC7sV7u+ipV/tD6G1ho2+tGswLOtrN5BvtDLttl
         M2t5rAlDl4JC0y7W9z6kB9MljqRp4rXSh8tFIwlcHTzVl1uBdxOfPog0kLwK0gY6gSxS
         zqFJItPmayoGtZSmBGxvpoYjyoHGS3LzmGNRgFgA/qVV5d3lgj25PAXuNzfQ0EVKHyDa
         SD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735586556; x=1736191356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gappU3xDlV4ePT37eSn6kXIG7FGYt6FgsmHQZOv98xA=;
        b=J8XctcvGowBT6ksu6kWrzCgrL6D6g18cLLs6ZWWmfFUXm94L+r606UnwXZ80Ul6aSl
         3wzXyTBqrAINf56UKSFAF+WE4xZg95ebHjT5YUwNG4/AYeirmeCfBgqiClqxc7lkXPDH
         T/s/pQzZLHb1kujmLZpU9Kpe8fFtw3+czzo4KTGvo/gC0HGZyka5ao4D3yoEn9XYPrdN
         sgv2ulKcebGz6HR2lfKbuVcLjE+ZkOLL3eHV9gPvxifqUAYv3iT6J7sTMTzfb3DAkn9n
         DXCDc/PxDr8d/eKrCaUQUZqKEfCe7AJ2CmpYj6YoftRFhsqkAGvTxMiV538K4eHIf1me
         5zuA==
X-Gm-Message-State: AOJu0YwrSJ0EcMOpstkdLUrs18mRjPiMS7EvH+5EyKbXiZ3GEWLQIh8j
	gxCJBAmCpyLUe6LJvNldsLpfCCjEkn23F0qpNPkz1C2QPkcZyY9SL9xcjw==
X-Gm-Gg: ASbGncvu1wD4E893sYsU6YJJQvNpj2BWXq2YIR0Pq/xp0aNgYcXnVlnoxJlt7Bu2qWV
	0nx9/I6EaPdZEYL052ctz2v2381SbQM/rc5SYJIyAUJr2BGxW1SdqUhSJmr/h3Gwy2a3H4Lx73V
	2Cf6JMFqpMhx9Gpkz3ShSy/dGbm2kWZHNDpr1PE19vKH5dH2zskQS0mK6PvGH8gLI5gQmCsMAQA
	y+rfsMpgny+RdD2+JQNX0m/HbwlxB6pQL+D/P7Laapb2dGF9k5qq5vqaASUVHhQhYoS6TA=
X-Google-Smtp-Source: AGHT+IGTAKJTKM+V5yf0eC0aSzH6Q0IQsPI3Suo5cEhnixSIzeBpMAuaSQYTLaJS6dF4YEMm4tTs+g==
X-Received: by 2002:a92:6b03:0:b0:3a8:13d5:bd2c with SMTP id e9e14a558f8ab-3c02c703362mr306669505ab.2.1735586555940;
        Mon, 30 Dec 2024 11:22:35 -0800 (PST)
Received: from monolith.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0de0532b4sm59686225ab.13.2024.12.30.11.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:22:34 -0800 (PST)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
Subject: [PATCH 1/2] cve-check: Fix errors in log lines
Date: Mon, 30 Dec 2024 19:22:23 +0000
Message-Id: <20241230192224.113886-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 19:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209181

Two warning lines in cve_check.py reference a variable that doesn't
exist. These would cause a runtime error if the conditions they are
hidden in were to be entered. The log lines have been updated to no
longer reference an undefined variable.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
---
 meta/lib/oe/cve_check.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 647a94f5af..280f9f613d 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -253,7 +253,10 @@ def decode_cve_status(d, cve):
         description = status_split[4].strip()
     elif len(status_split) >= 2 and status_split[1].strip() == "cpe":
         # Malformed CPE
-        bb.warn('Invalid CPE information for CVE_STATUS[%s] = "%s", not setting CPE' % (detail, cve, status))
+        bb.warn(
+            'Invalid CPE information for CVE_STATUS[%s] = "%s", not setting CPE'
+            % (cve, status)
+        )
     else:
         # Other case: no CPE, the syntax is then:
         # detail: description
@@ -263,9 +266,13 @@ def decode_cve_status(d, cve):
     status_out["product"] = product
     status_out["description"] = description
 
-    status_mapping = d.getVarFlag("CVE_CHECK_STATUSMAP", status_out['detail'])
+    detail = status_out["detail"]
+    status_mapping = d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
     if status_mapping is None:
-        bb.warn('Invalid detail "%s" for CVE_STATUS[%s] = "%s", fallback to Unpatched' % (detail, cve, status))
+        bb.warn(
+            'Invalid detail "%s" for CVE_STATUS[%s] = "%s", fallback to Unpatched'
+            % (detail, cve, status)
+        )
         status_mapping = "Unpatched"
     status_out["mapping"] = status_mapping
 
-- 
2.34.1


