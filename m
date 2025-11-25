Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F03D0EE1C
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:59:10 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4279.1764104340775484961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1ocLpHIn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so7194167b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104340; x=1764709140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgResOp9jEEAaIVq8oR9Ci0XzoKiBG9Q+c7V5Q03t3Q=;
        b=1ocLpHInu9CkCX9jyZa2F19m/9kpxQiMkZLJRSYZrkdQugTVvzyLdP4FRHVAg6dBSq
         502gmnkEVFqJcStee1zbMjX9jo87RsEabQ3OLUXUbMAuS8qjcTBkuIF1A9WFNqs73zR6
         gRCEjmirpgQlFmEab4WxmCnzUrU9oGdCM0Jk5mv/lt8V7vX1xELhHtXlxmD370IuEKCA
         rtaTdmjsEFixfoTRJC0QdDrSc/bvhPhwImdc9X4wDNI09uhSf83zPQb1P5oQ375N4cMo
         tft10m+ud9sbyQfLyq6W5PG5Pqg2PX9MyI3r9NGsbnAtFQpfWUJ3tJIoIuhQQ3pK80yu
         X5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104340; x=1764709140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RgResOp9jEEAaIVq8oR9Ci0XzoKiBG9Q+c7V5Q03t3Q=;
        b=Abv5b+hCp7m4DdS3L9KYFdCfk3JW0iR64cdcpatEyDB+k07/7b7/3qwkHivY/VG2uX
         Cpz8wbIAgg3tDjIa6j896xfFl1MSnvB7CCDzxXiekdPen2qbguzWD2JV3WZi6zCQmxRq
         EtzqNu6pOxcL1G5kmSR7QDGRp8RsJ0YRsRRfnoW8mGSfCIVoVTKJfC51TIvH2OlbkD4U
         dGF3lKPqXyGizkZhrLpFsj4XvCAjRiIgCDx+965IASS2beEMKXFXUG+odICF871Zc7wB
         155VjpeXl8Q1mo89veNiRvnVwJ2E3VPQ/mk89AxlwPxtIbfaPa/Nxq11kfKo2z95DH/w
         IYfA==
X-Gm-Message-State: AOJu0YxXHRrDJrigsXQ8ei3eMB/ITmuwjmIFwY6sx2MNPse1PiVvUvt6
	4a3LoWxgUOzk12BbDpIl9SQpVnwB7+L++ChWLGbpqG3gmc+7CZ8p6YtjyictdbLzuuSC2a0IEjG
	ern/F
X-Gm-Gg: ASbGncueDD4vGJXs7+YhJJqy1wny2RKgaJx01K3eR1E9mO64/M0OzGjDEzU3xizj/xF
	x+0DHoy/ZCZ6C5gfW8F1adsa64/zW1lZyg6k3A9CC2dtnF3/wHLSjrDii+sjvIlw5aT0OiGaNWY
	q0GG5Fz+3lO5e+X3cfUgk+OZjZCosS7Aw8BnMOjf9bJHh6IqWCcoSNpPVXK8bJMog5fh+FrijUy
	Wti3/QkSlC+DVmE+GuX9VbfLddqgT6y+sz5eukwML2RS4Z8FaJF0NQpgeZ06dqHTo2uJ+TLn8Py
	N11rKkRzA5ExVgjwjmdI8Jqmk8GZsgJnQFjpHkGVAcQy3VhTtnQ1FDVCv27eCg7suWFOOzMPJIN
	ysjJjkwqITjMNlQyR0wNXsvzlAWSonMB8hG5n6PZwduJDFzq59PMTeeEgLM2OkEfPGF9nUvw6ul
	sdnw==
X-Google-Smtp-Source: AGHT+IElbLOT466zjdSUaEzuMkmToe4EojZUBDWZlYqwH7lj4P7+m0PlMfLNthsBuRciJ3s2+tH7NQ==
X-Received: by 2002:a05:6a20:a12a:b0:342:e2ef:332d with SMTP id adf61e73a8af0-3614edf0345mr18764125637.40.1764104339951;
        Tue, 25 Nov 2025 12:58:59 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm17340755a12.4.2025.11.25.12.58.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:58:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/9] spdx30: provide all CVE_STATUS, not only Patched status
Date: Tue, 25 Nov 2025 12:58:40 -0800
Message-ID: <9a204670b1c0daedf1ed8ff944f8e5443b39c8f7.1764104199.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764104199.git.steve@sakoman.com>
References: <cover.1764104199.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226787

From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>

In scarthgap, the `oe.cve_check.get_patched_cves()` method only returns
CVEs with a "Patched" status. We want to retrieve all annotations,
including those with an "Ignored" status. Therefore, to avoid modifying
the current API, we integrate the logic for retrieving all CVE_STATUS
values ​​directly into `spdx30_task`.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/spdx30_tasks.py | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 0fa9a7d724..e425958991 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -453,6 +453,22 @@ def set_purposes(d, element, *var_names, force_purposes=[]):
     ]
 
 
+def _get_cves_info(d):
+    patched_cves = oe.cve_check.get_patched_cves(d)
+    for cve_id in (d.getVarFlags("CVE_STATUS") or {}):
+        mapping, detail, description = oe.cve_check.decode_cve_status(d, cve_id)
+        if not mapping or not detail:
+            bb.warn(f"Skipping {cve_id} — missing or unknown CVE status")
+            continue
+        yield cve_id, mapping, detail, description
+        patched_cves.discard(cve_id)
+
+    # decode_cve_status is decoding CVE_STATUS, so patch files need to be hardcoded
+    for cve_id in patched_cves:
+        # fix-file-included is not available in scarthgap
+        yield cve_id, "Patched", "backported-patch", None
+
+
 def create_spdx(d):
     def set_var_field(var, obj, name, package=None):
         val = None
@@ -502,20 +518,7 @@ def create_spdx(d):
     # Add CVEs
     cve_by_status = {}
     if include_vex != "none":
-        patched_cves = oe.cve_check.get_patched_cves(d)
-        for cve_id in patched_cves:
-            # decode_cve_status is decoding CVE_STATUS, so patch files need to be hardcoded
-            if cve_id in (d.getVarFlags("CVE_STATUS") or {}):
-                mapping, detail, description = oe.cve_check.decode_cve_status(d, cve_id)
-            else:
-                mapping = "Patched"
-                detail = "backported-patch"  # fix-file-included is not available in scarthgap
-                description = None
-
-            if not mapping or not detail:
-                bb.warn(f"Skipping {cve_id} — missing or unknown CVE status")
-                continue
-
+        for cve_id, mapping, detail, description in _get_cves_info(d):
             # If this CVE is fixed upstream, skip it unless all CVEs are
             # specified.
             if (
-- 
2.43.0


