Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED59C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 12:50:45 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.43513.1736858062136823036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 04:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uq/7/XvI;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: arturkow2000@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30613802a59so30351211fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858060; x=1737462860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGkYoniNL+WDKzmUuH939EbSlPSgF9FFhsyM1NdmrQA=;
        b=Uq/7/XvIG/uxKGif47VwaTfmMzNdm+uHdgWD5jzoWmJGnv1DRXlefNJCbejxIf93m9
         weUHqod0YZiYJWT7dYt71eeK95vpi2nPkjoulTOozjjU0/0moI5tppRg7L1+5CbVlq01
         FnlYODIe1D07NCf/lvxtEkTPEZVaI8DxsscW8+AdjEteIV+e4kqK19Ftt06UnbNrmOft
         WwzWqwLULJd/RBKYFRYSj+EtL+Wl/ATbQdXmz7/adV9BxqO1x5m0XjWar1QlSUOI2sba
         ikg/YJBatgU9LceZIsiKvXoyL56pztNLB4JG18yXbwk0OYLLHIjrKjpR1PgJOtqDuTKe
         0opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858060; x=1737462860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGkYoniNL+WDKzmUuH939EbSlPSgF9FFhsyM1NdmrQA=;
        b=aYdDCPpqx8+TDOwyxwwO8iOGGH+rSI8oQkVVkAC5i5BQt2eEqxV4LSsymE0hL2VVfA
         gMYYdXlvvQig81P43aJaUDndlf2WvZjQr3vAw5huVkZHhyz1C6ZjR80e26dWsRl+uPbq
         vIkfsdk9VvUQ1uVSLYaB0wYHZHMO5s5oTAcbg69c0VdS9nwcYYgEgPA/NF3sO0gII2uG
         IQZG5ZAMRxCdhIJ2K0tQYuo/ejykVtb0sA9SPmB7XhNIiHtsrjhb50QNJ3SO+uqScd/+
         mZfSWSFlugPxhEqf/oUk5XzUV/oJxkFaHsQr9sGq4SRkEyJ++Lm8N0kH2viDQIbvNdnM
         /t4g==
X-Gm-Message-State: AOJu0YxEcJGHuPZtwROdtvSGdnyfRdRxUvL+I9hwJs7E0YvuVMHexfa9
	O8U6cD1YKwDofHrUK10iNHI6EzqCNoYr9EE9uuS0dGnxpRZqukmaNHbZ0Q==
X-Gm-Gg: ASbGnctmvYlEzZyJgZ8Gr4ztEMx3dwm7pTzhfDYN4xKquLsQwMR6/7OYthCwgEmZv+X
	tVSSLzwzzoGOYfoLgHxMsrDKkk2uoFp9jngbXDGwME7IpJV/k1eCjqEc3DMVoE1B53Es2pGrPxP
	WuF1NZ5DtDGxqS8p0mfR+S/EEbY5IUPTKcv/LHOD2YY5VIAhOtKWX6ZJE7Ny/XaYTvDi02udXgw
	P94OhVj09MDfOtMgj06MzsuheVef/10lDvQuMHKMK/DlTP/NYOj+8R4pYccRqzL
X-Google-Smtp-Source: AGHT+IGuwiSHJztevMFvm/u4rA6mJDlTe+4eLfsWtxUpp4Pi526HCbfqoYJgFAF+l5JNu5RY7D+lPQ==
X-Received: by 2002:a2e:a98b:0:b0:300:3de4:ff7f with SMTP id 38308e7fff4ca-305f45300a1mr83788981fa.6.1736858059595;
        Tue, 14 Jan 2025 04:34:19 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:86d6:2e13:1a85:5192])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec4d6sm17230521fa.111.2025.01.14.04.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:34:18 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v2 4/8] systemd.bbclass: introduce systemd_service_searchpaths()
Date: Tue, 14 Jan 2025 13:26:12 +0100
Message-ID: <20250114122613.3046925-8-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250114122613.3046925-4-arturkow2000@gmail.com>
References: <20250114122613.3046925-4-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 12:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209796

systemd_service_searchpaths accepts boolean value indicating whether we
are dealing with system or user units and returns search paths
accordingly.

Previously search path list was created in systemd_check_services() but
following commits will introduce additional places. The
systemd_service_searchpaths helper function is meant to reduce code
duplication.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 14fef2d7a6..a3c2c6eb20 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -90,6 +90,18 @@ def systemd_service_path(service, searchpaths, d):
 
     return path_found, base
 
+def systemd_service_searchpaths(user, d):
+    if user:
+        return [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
+            d.getVar("systemd_user_unitdir"),
+        ]
+    else:
+        return [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
+            d.getVar("systemd_system_unitdir"),
+        ]
+
 python systemd_populate_packages() {
     import re
     import shlex
@@ -169,12 +181,9 @@ python systemd_populate_packages() {
 
     # Check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-        searchpaths = [
-            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
-            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
-        ]
-        searchpaths.append(d.getVar("systemd_system_unitdir"))
-        searchpaths.append(d.getVar("systemd_user_unitdir"))
+        searchpaths = systemd_service_searchpaths(False, d)
+        searchpaths.extend(systemd_service_searchpaths(True, d))
+
         systemd_packages = d.getVar('SYSTEMD_PACKAGES')
 
         # scan for all in SYSTEMD_SERVICE[]
-- 
2.47.0


