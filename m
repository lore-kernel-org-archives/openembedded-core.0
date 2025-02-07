Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F97C021A0
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 22:07:04 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.1169.1738966020841919744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 14:07:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eM+6yYuX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f5660c2fdso21494405ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 14:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738966020; x=1739570820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73MpmddYYjDSR9iz3hSiyfWixSzWJEUFikTIG8C1BY8=;
        b=eM+6yYuXwKHC9sQUZ/1GPZ0qY511LYLtIHQcsanADIvmY3cKT+22z/Ql2SpbE5uYm7
         Omeebb0DPlJZpeNYSQKRq8sai4gjoUxLj7gwa/tVwU/ZpKBEEwRCa5GJmaERKdejBeUT
         AZbIB0BL/hjIak2xX03muy/ddBCuHCsFCM8Yng3DmXyeuA1STl8pkBnfKItxOnPbVdj4
         s9gYMnjNii01hmMKwJMnCLC3xft7Nxlwe/82PoI4WxTCu3rsyVoP2YZbT+SFo5JA5unQ
         yoz/CU7pTaMgvutgKsCdnLEnL/1vQoElsSd+gz9D/nApPKH7TohwUGK63/yrV0livVzX
         W1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966020; x=1739570820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73MpmddYYjDSR9iz3hSiyfWixSzWJEUFikTIG8C1BY8=;
        b=QoWc09Q889eg8HG5wH/1VeJ32Ag8mhe3HkHyxaFSlt5x+l9Wd1K0DLkzGW8+pg6wVO
         jUdAvsPXxHEMV2WxSpgeIm4yXjBy8nhVIF2oeZYzNmpIQdCMLfFfhWoYzr2cQma/vZ5X
         4efEF7+rJWn/kwoXY7NiMJk4KY+U4I61JEnyWxr08h8Emvmm/kT72PSvU4FAW6vav5W6
         s190xsnw5JEruj48Q6jkKDFGRkKqiZIKXe2jLDTxWeJrVGDoKgMDY6s73xaMOb+OqXfL
         zP8va5A8qsA9cDatYo8lIeuv8UP0vienD6H5h/VBNN+c5ctVV4z+0c8Jvllp/LW3coEf
         dbsA==
X-Gm-Message-State: AOJu0YwfAYwQ7xFSJId9XPUJPkDJaiUY5MbBkBIa80YGH2IBGVPaeDRu
	jHEg2Tmz7doU5+joMhVh/hEU32QJZs846iRJeKeBaJZCX0PhyJ/FfZoZaK2Qyv6u8h0mxTgueA/
	T
X-Gm-Gg: ASbGnctK5BJKcCHpTmC0fP+HSjm5VtyyBGCGE8iqkeHf5JbO2kbIhUtPrWQ7fuwrMw6
	6z9Ylbh1fdy2s2rE4S2gqPSNv3v3sRBULwRNXhm6q98+wZWjj8xNintQSVS2hCIv68HtxTd8a5k
	CG0rrFE4KPzWy5UXRwnjz35NmP79jHk6QIE4b+xXS6tJW+GaHpxWHDxa0T2xrVzMJfaN2tD4hFZ
	wuVX9HbQDlrMosXD6JOp9P9ZFsO94xzTMAHUwIvtM7BTyaI9z540JuiJE4i5i4J8sCULRjo2fyj
	lnMB
X-Google-Smtp-Source: AGHT+IGp2G0ZkWQJHIADu6Vdhv5QVm+8WF1FRT6tSaMg67WwSvDF9JGD21Gh97x3nZvA+4a7hn2PDw==
X-Received: by 2002:a05:6a20:9f8e:b0:1e1:94a2:275c with SMTP id adf61e73a8af0-1ee03a3f4camr9666927637.18.1738966020108;
        Fri, 07 Feb 2025 14:07:00 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af65a31sm3586737a12.53.2025.02.07.14.06.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:06:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 02/12] cve-check: restore CVE_CHECK_SHOW_WARNINGS functionality
Date: Fri,  7 Feb 2025 14:06:43 -0800
Message-ID: <3cf7c6bcd569cb19ac2b9c05f1134fdda6e9e714.1738965898.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738965898.git.steve@sakoman.com>
References: <cover.1738965898.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 22:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211001

From: Peter Marko <peter.marko@siemens.com>

Commit 05ef4f2a7b225c8d230eaca8d333ffb921729d79 removed this
functionality by accident. It was implemented in text exporter, while it
should have been a global feature independent on exporter type to avoid
such accidental deletion.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2996b11596afca288a6b7f409a5287063d331f3b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0c92b87f52..33d41b912d 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -422,6 +422,11 @@ def check_cves(d, cve_data):
     if not cves_in_recipe:
         bb.note("No CVE records for products in recipe %s" % (pn))
 
+    if d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
+        unpatched_cves = [cve for cve in cve_data if cve_data[cve]["abbrev-status"] == "Unpatched"]
+        if unpatched_cves:
+            bb.warn("Found unpatched CVE (%s)" % " ".join(unpatched_cves))
+
     return (cve_data, cves_status)
 
 def get_cve_info(d, cve_data):
-- 
2.43.0


