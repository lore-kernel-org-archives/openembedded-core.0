Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F5DC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 14:42:46 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.21863.1719844957930706164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 07:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aYVDBzkE;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d55cfebcc5so1334422b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 07:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719844956; x=1720449756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9rRP5UabqP3uBosQAUvWnsQaDyfv3HoFpUXilrTs+D4=;
        b=aYVDBzkEl7C4BGgzX7eaI67DSQaj0NyTuPRBSVyJjDJf059oCzkF1KNX5Z97UPI+Mk
         Cyluiurg4T9c9Hs5S8PJs0Bp5mSz559fZZbv0Pmi2+vQb+B+EpIAiAwanStzpSjD0EQu
         LLfgbSd2Q3Qvzrx3HLFRSXhR1J+ggfMFP8CEMTkXlK1+dQrmzpKFh44K/h/doprOQKqH
         Suk3yzKVlkP9mF0qm/uWIB/GgoYHXnc3IqUwvSTl77SFxYX/Si5Dv75zttg6q0a9xweo
         A5MJbCGhYKCQqBqHOQv3ria4nySxPMpe3Zutvk9JBlOH4Fw0Pt/x4sqm3wxgHGVhEJRP
         gk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719844956; x=1720449756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rRP5UabqP3uBosQAUvWnsQaDyfv3HoFpUXilrTs+D4=;
        b=cgSPBsTbC9hUFMSKJShSsYkqpk/jfno9N2g5MfmyVVuFSV+gBHHRmbdYztYKoI1s/H
         aYDKE+lsoObw1GMdn6my1w3hMW6z5hckZBe4cYAuS7A5/kJC8RadAE6ysPeigO/g6BJD
         oYCuJBzHCmE6kKN1TpjoD+6zEMa2mXkNbXB7F9cm2GDguszaTQtyVggSjHWRFjEJ0Zam
         V7RLTN6S7CDyZQXIJPqKQ0KYko8AWRkmq3k6NGeArhGIGCN0ACKBg24TwyP9gIV+PAjX
         04y+Zy30cHrPz62N6pnisSVcv1OCeBZY5/gG8/H+iBo7kx0+rZRTXqjpj+flfvZ8KyEb
         8RhQ==
X-Gm-Message-State: AOJu0Yy2zxXw/lvWnEYEyu35nVVNbOItK8cviZgH/836Ki2azv4vel0d
	wHfhmBEgVzAQd7yF1QtbhvKxP6t4p6puwEu61v80KewQsNytPSFMzTXJ6Q==
X-Google-Smtp-Source: AGHT+IG4ni6a0LKN2hxOhMqyXtceLRuFFXPQcl2BGGc5RqVu1O5hSo/O6IbuMN3VAlHxjD3STVE8JQ==
X-Received: by 2002:a05:6808:159e:b0:3d5:631a:6892 with SMTP id 5614622812f47-3d6b5497584mr5366523b6e.49.1719844956498;
        Mon, 01 Jul 2024 07:42:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::c8b3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7acbb20sm1311057a34.42.2024.07.01.07.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 07:42:35 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/create-spdx-2.2: Handle SemVer License List Versions
Date: Mon,  1 Jul 2024 08:41:52 -0600
Message-ID: <20240701144152.1018433-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 14:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201307

SPDX transitioned the license list to use SemVer visioning, (e.g.
"MAJOR.MINOR.MICRO"), but SPDX 2 only allows "MAJOR.MINOR". For maximum
compatibility, only keep the first two version numbers and discard the
rest which allows it to work with either scheme

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 99061320e53..6c568d9dbb1 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -417,7 +417,9 @@ python do_create_spdx() {
     doc.documentNamespace = get_namespace(d, doc.name)
     doc.creationInfo.created = creation_time
     doc.creationInfo.comment = "This document was created by analyzing recipe files during the build."
-    doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
+    # Newer versions of the SPDX license list are SemVer ("MAJOR.MINOR.MICRO"),
+    # but SPDX 2 only uses "MAJOR.MINOR".
+    doc.creationInfo.licenseListVersion = ".".join(d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"].split(".")[:2])
     doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
     doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
     doc.creationInfo.creators.append("Person: N/A ()")
-- 
2.45.2


