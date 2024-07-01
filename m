Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD3BC3065A
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:51:38 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.1895.1719852691007267821
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GTng5VdI;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c9cc681e4fso1760509b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719852689; x=1720457489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjOFcEWRVxc9kvmVoXTLJa7F6dAyYfcdCMNCYFzImr4=;
        b=GTng5VdI0i+WTcPzitzokabJc9u3tAUWjrKtL0886bGlpUyNdvI5qo8iQQxDFUV6TI
         NQFfuLhwU8IGF/MNXMU4jbI/hYYhzploekNZ8jFseMKDqIQlYOrKmhVJlaJw1R+r3jec
         +8UZqp+ahtbIyXcbBdHri2Nsi9ngx/YZDhfR0fMijRsyfSnSWDRUx7ck7wgoUflogAOG
         cHRey2vGXiFdo7sV5BUp5vnbl0r61jHhrx7HYece2hG4G4/IJeSHl5MMMcI6htfGVYnS
         k0UjTWJ2bxrEPfRFjcCB0HbF1jgmjd/+5JQSxByCW/yuHmxjob8zqjSPiNTpFZ4mP206
         Cvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719852689; x=1720457489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjOFcEWRVxc9kvmVoXTLJa7F6dAyYfcdCMNCYFzImr4=;
        b=MMKSARYfqXkP/Ab4QR8RP7SCgTv//bvQ/b9AtEXOaIxuPrlsHL5vstC2HiF6gcng6R
         HQFwbVZeh2LX1IWC02Xa91mWEVu0tAZ9i3cQ6FVYQAuztZQ+nLn1obDh9CYEPc7nCCT4
         MtvhruO3/EvseN5tAgx1ouvH0YMBNkAtRR86CyMeAkyElX9kbtrG4/7iauLnfTD8tdrZ
         xtQX6zKssGI/HO2jXhcjOHSaZy0czk/0w4czr4K7FQGppD0Vj/lTN9YqmIKKgpbk5WOh
         bkgWciGnu+i+c7+cpc5LOL+WXyIlnh60jZ6Dk+prUGHDRKiav48es5xoymL6m+mpgZ0b
         tLgg==
X-Gm-Message-State: AOJu0YwoQD6JYU+jXh85ovhWqzxBximEjuSa8i7ADO3FMYcsqEzb4WKb
	wZCOODLJWB3zQV/E4rvKXIFNEw8eU94SVnPQLJLvm5DhzcCmfjfDjrTziw==
X-Google-Smtp-Source: AGHT+IH0PZHyJ6TqrWRY8F79RPavE+QZQjt+NpCLdxOalsuXf9dnCyUS2pb9l3B5YOgKyIEsmDMtiQ==
X-Received: by 2002:a05:6808:308d:b0:3d5:5cc2:fd54 with SMTP id 5614622812f47-3d6b50c1b77mr9906447b6e.47.1719852689483;
        Mon, 01 Jul 2024 09:51:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::c8b3])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62fb5234esm1419525b6e.58.2024.07.01.09.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:51:28 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] classes/create-spdx-2.2: Handle SemVer License List Versions
Date: Mon,  1 Jul 2024 10:51:24 -0600
Message-ID: <20240701165124.1883255-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701144152.1018433-1-JPEWhacker@gmail.com>
References: <20240701144152.1018433-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201313

SPDX transitioned the license list to use SemVer visioning, (e.g.
"MAJOR.MINOR.MICRO"), but SPDX 2 only allows "MAJOR.MINOR". For maximum
compatibility, only keep the first two version numbers and discard the
rest which allows it to work with either scheme

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 99061320e53..3bcde1acc84 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -376,6 +376,11 @@ def add_download_packages(d, doc, recipe):
             # but this should be sufficient for now
             doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
 
+def get_license_list_version(d):
+    # Newer versions of the SPDX license list are SemVer ("MAJOR.MINOR.MICRO"),
+    # but SPDX 2 only uses "MAJOR.MINOR".
+    return ".".join(d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"].split(".")[:2])
+
 
 python do_create_spdx() {
     from datetime import datetime, timezone
@@ -417,7 +422,7 @@ python do_create_spdx() {
     doc.documentNamespace = get_namespace(d, doc.name)
     doc.creationInfo.created = creation_time
     doc.creationInfo.comment = "This document was created by analyzing recipe files during the build."
-    doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
+    doc.creationInfo.licenseListVersion = get_license_list_version(d)
     doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
     doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
     doc.creationInfo.creators.append("Person: N/A ()")
@@ -521,7 +526,7 @@ python do_create_spdx() {
             package_doc.documentNamespace = get_namespace(d, package_doc.name)
             package_doc.creationInfo.created = creation_time
             package_doc.creationInfo.comment = "This document was created by analyzing packages created during the build."
-            package_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
+            package_doc.creationInfo.licenseListVersion = get_license_list_version(d)
             package_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
             package_doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
             package_doc.creationInfo.creators.append("Person: N/A ()")
@@ -628,7 +633,7 @@ python do_create_runtime_spdx() {
             runtime_doc.documentNamespace = get_namespace(localdata, runtime_doc.name)
             runtime_doc.creationInfo.created = creation_time
             runtime_doc.creationInfo.comment = "This document was created by analyzing package runtime dependencies."
-            runtime_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
+            runtime_doc.creationInfo.licenseListVersion = get_license_list_version(d)
             runtime_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
             runtime_doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
             runtime_doc.creationInfo.creators.append("Person: N/A ()")
@@ -793,7 +798,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     doc.documentNamespace = get_namespace(d, doc.name)
     doc.creationInfo.created = creation_time
     doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
-    doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
+    doc.creationInfo.licenseListVersion = get_license_list_version(d)
     doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
     doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
     doc.creationInfo.creators.append("Person: N/A ()")
-- 
2.45.2


