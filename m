Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140CCC54E71
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 00:21:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.8849.1710462079974056844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 17:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=eHmNIqhs;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-413f4cb646dso6814665e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 17:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1710462077; x=1711066877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ooaNeqNbx7A3+LWkcQ7IVvtV9i2qbMpF2nDLVwTDEY=;
        b=eHmNIqhsaDGCNJMUIGSLx+FemDTsFFZ8WOOJDrGW3a599DRCamii3KOZ6Bkba9rJus
         PqB6kDNJkYpa8866Q0oZUuu5RcYayTC3eUftozjX3mOeY20Z910QCZC0fErTlflwD1W0
         OQ+BI7DQQryMwAO4TkUt6FeCRYicgfRqoXv8OrMiPf/qTmdTgSpisYZ75f4ScDNDPIqH
         pHWKeIyCegPPxLNOMzr+n7hSqySuKTR+mQWXj/nzAwtIRxmVZq/a/l35LXSfdzMdOci3
         vGg0Gu9NCcOvrzi/SOiZGmptqvH6SIuOXEFldNzTreHyiWnlRC/1D+WQVKdtp1pWLLAZ
         7LBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710462077; x=1711066877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ooaNeqNbx7A3+LWkcQ7IVvtV9i2qbMpF2nDLVwTDEY=;
        b=mIGRwEosNSmx4LVSvcw7IuF3YxxItfbiHXE4nWf/apJHwu3I2jdvuE5wFAw596jPci
         1w6vOz5W4sQHokXDPG0d1HmX0mjz9qyyASTFPQFELIhN3ITr/P9IzEQ1Pns711SGHC0s
         LvDBLYMw5CjJm3bglPpNXDmeXbZJ9KvYOvnquea7XR7HxcEi9YHmkvjxX2Rr8lRDhG+p
         iCQAY2CKJDU/ot6/nOhvu7doogkC4kJpU5Af+S3svCSrKF67N8/qQDUS+9UHs58SD9hB
         0Zu1EJ3dNn+veBL458gRbZd1+Qjdiq2Stj4nMbBa0jYLTpjm/fAXK93Yw84naekdte9Y
         C5AA==
X-Gm-Message-State: AOJu0YwUndKjMurK0mTHTvvllGK6ReXWxTpbWaAlzSPysDaTdqnNPgpf
	s8DGEFBrPpZ3k8li9j9PDH0pO4W2FNfPuX4unysx1DPUKAy0zBq9Efw17svyOaiL9nGg28PRSeW
	k2tU=
X-Google-Smtp-Source: AGHT+IEJj5ilfuFs8OkbSzsXoOjAFBrqMJ0CegUTfANdeEB+eyAeLf40jpwFcZGNLBw3C0/3W9tgBw==
X-Received: by 2002:a05:600c:5187:b0:413:f1d7:ee0c with SMTP id fa7-20020a05600c518700b00413f1d7ee0cmr2193309wmb.6.1710462077545;
        Thu, 14 Mar 2024 17:21:17 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id bs17-20020a056000071100b0033d9f0dcb35sm1868053wrb.87.2024.03.14.17.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 17:21:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 3/4] cve-update-nvd2-native: Fix CVE configuration update
Date: Fri, 15 Mar 2024 01:20:19 +0100
Message-Id: <20240315002020.2194310-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240315002020.2194310-1-yoann.congal@smile.fr>
References: <20240315002020.2194310-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 00:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197120

When a CVE is created, it often has no precise version information and
this is stored as "-" (matching any version). After an update, version
information is added. The previous "-" must be removed, otherwise, the
CVE is still "Unpatched" for cve-check.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 5bba2219d6..4b8d01fe84 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -357,6 +357,10 @@ def update_db(conn, elt):
                 [cveId, cveDesc, cvssv2, cvssv3, date, accessVector, vectorString]).close()
 
     try:
+        # Remove any pre-existing CVE configuration. Even for partial database
+        # update, those will be repopulated. This ensures that old
+        # configuration is not kept for an updated CVE.
+        conn.execute("delete from PRODUCTS where ID = ?", [cveId]).close()
         for config in elt['cve']['configurations']:
             # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
             for node in config["nodes"]:
-- 
2.39.2


