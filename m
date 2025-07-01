Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1EAC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 18:04:17 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.4028.1751393056675914677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 11:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gRMih60y;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2efbbf5a754so2483407fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 11:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751393055; x=1751997855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6AnkI+lo/ZCWq6aYH9NveZzX1IAArrkbfjhmyK15cA=;
        b=gRMih60yc2aWQsZqCqYQ9KxqxgexqoBrZgMaysuI9xQGIfhs2PIgg9BE/ziTkUZkzw
         /xvNYU3uJ16ZMLFdOFroFbinfSYIWyjhZHG1lZbpeOfdnuX0SoZmQL+D5wvzbQhlO2JC
         s2QDwBpR2eGigcU6ti3ezfqzFeL8laaJa5u07HxxKAZdeZkIpEkxD3YidNg8lxl7aY85
         1AhS7HAD5a5GbsXLrvGfJQbdg4T+8lPU+QXgb1z7t48xBh84t3dJPhE59wDWJWxcP3OD
         Tzd/IZcbAl0S52x1U36kBC2QV8pJ532qEMmbt/AZhuaD2DTFtGeU01M9LdGBYGTHcufn
         PR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393055; x=1751997855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6AnkI+lo/ZCWq6aYH9NveZzX1IAArrkbfjhmyK15cA=;
        b=qn0UNey99c3mAVo8RVsuAYd7UknUnoagS+Ba7a0UoYTJZewtn2ZNyIaqjUyCKPqQrg
         JmWlkTfimsnSZiyUvV3XwiJX3GavznSj6iNeTCyNOPq3GaLk6iSmXsvmjEkyWADuu+zJ
         A3Iv01olb3q54BizxwTSncc+th11gtiOqvghHq5BehF60xNpgL0/LTuJnWZ5oWh9le7a
         Qmx0zzceVf6WgFotITqmODakgBJbph3COeF2KHxcMwE/VcUI4yIMhFxtCICb400+me8L
         76eOVSt/CzustA8z/AcA08bz2rq2FGYI7lxbTRDxloyxEAVRSK0B7Ll34gfO4ZxbfN//
         M+5w==
X-Gm-Message-State: AOJu0YxzwJMH6GqUX/rBzbSp2s0r10UWYIbY/kVqzcUQQqU6ObS73RQe
	PN26p/D0CjI2axi9Ti8Jww5FWfztqSnBdQyFeEXpSCL329hNlsGDQjIg7a4DCQ==
X-Gm-Gg: ASbGncuJGwXWDMoMNfHGBNVxkeBOSwKpW734C6N+24N0dby6/9NYaHyx8IFcuQCJbdk
	DzJsajF7l1EcXZy5mlHbc5uV7yEDQCEMJbZxrXCpVpptFHlD1RRkHddK09uK8ITLIeRQL7jV7lv
	1m5rNWrrc+Hx2r3lQCJNWr3A8x2lzUtBzWbd8AC3JWHfvMtdsWPAA1zShs7ao+Uqab7PjeXJdyg
	Jq9g7GkKVG3pKOUz540fS/PV+ye99K2jX1/c60YsBBQfIQppYL08nEIs0zSBpSPJRMQBMmsQoYt
	uazaMvRqB5tlfRXc3xjX+rpZKV0PwBO8g3FG6hG4Q2GBTr3kEQ9ALdV6SDBB
X-Google-Smtp-Source: AGHT+IH6p/zbUxiSlYezc517FsHYneUHHF38aVPGrCCaEzWWz105/di9zssTvuo/FEddIZy9ZCA/vw==
X-Received: by 2002:a05:6871:691:b0:29e:69a9:8311 with SMTP id 586e51a60fabf-2efed7ace9cmr12117365fac.36.1751393055116;
        Tue, 01 Jul 2025 11:04:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::22c3])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50b20d4sm3461230fac.30.2025.07.01.11.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:04:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] spdx30: Allow VEX Justification to be configurable
Date: Tue,  1 Jul 2025 12:04:10 -0600
Message-ID: <20250701180410.33055-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 18:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219713

Instead of hard coding the VEX justifications for "Ignored" CVE status,
add a map that configures what justification should be used for each
status.

This allows other justifications to be easily added, and also ensures
that status fields added externally (by downstream) can set an
appropriate justification if necessary.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/cve-check-map.conf |  4 ++++
 meta/lib/oe/spdx30_tasks.py  | 33 ++++++++++++++++-----------------
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
index ac956379d19..0563bcaf94b 100644
--- a/meta/conf/cve-check-map.conf
+++ b/meta/conf/cve-check-map.conf
@@ -28,8 +28,12 @@ CVE_CHECK_STATUSMAP[cpe-incorrect] = "Ignored"
 CVE_CHECK_STATUSMAP[disputed] = "Ignored"
 # use when vulnerability depends on build or runtime configuration which is not used
 CVE_CHECK_STATUSMAP[not-applicable-config] = "Ignored"
+CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] = "vulnerableCodeNotPresent"
+
 # use when vulnerability affects other platform (e.g. Windows or Debian)
 CVE_CHECK_STATUSMAP[not-applicable-platform] = "Ignored"
+CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] = "vulnerableCodeNotPresent"
+
 # use when upstream acknowledged the vulnerability but does not plan to fix it
 CVE_CHECK_STATUSMAP[upstream-wontfix] = "Ignored"
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 5d9f3168d97..c352dab1520 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -724,24 +724,23 @@ def create_spdx(d):
                             impact_statement=description,
                         )
 
-                        if detail in (
-                            "ignored",
-                            "cpe-incorrect",
-                            "disputed",
-                            "upstream-wontfix",
-                        ):
-                            # VEX doesn't have justifications for this
-                            pass
-                        elif detail in (
-                            "not-applicable-config",
-                            "not-applicable-platform",
-                        ):
-                            for v in spdx_vex:
-                                v.security_justificationType = (
-                                    oe.spdx30.security_VexJustificationType.vulnerableCodeNotPresent
+                        vex_just_type = d.getVarFlag(
+                            "CVE_CHECK_VEX_JUSTIFICATION", detail
+                        )
+                        if vex_just_type:
+                            if (
+                                vex_just_type
+                                not in oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS
+                            ):
+                                bb.fatal(
+                                    f"Unknown vex justification '{vex_just_type}', detail '{detail}', for ignored {cve}"
                                 )
-                        else:
-                            bb.fatal(f"Unknown detail '{detail}' for ignored {cve}")
+
+                            for v in spdx_vex:
+                                v.security_justificationType = oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS[
+                                    vex_just_type
+                                ]
+
                     elif status == "Unknown":
                         bb.note(f"Skipping {cve} with status 'Unknown'")
                     else:
-- 
2.49.0


