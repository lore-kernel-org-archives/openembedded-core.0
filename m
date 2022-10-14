Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE17C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 06:55:06 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.4348.1665730497136754845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 23:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IR2lVg1P;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id w18so8452080ejq.11
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 23:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPv6Dtg+/w856M3TzidIBhWz08m0tZ/8frNjW6d2Q40=;
        b=IR2lVg1P9rmfYWJ/N9DdDyu3KNQTdONYQdG7ph/qiB6JiAEfQOQk83Qs6HoFa/BHWA
         +G555U5zwZ5dMZ5Fq7kGwmT38JWZdau4lQJ8xKDiYfcKwNJFN/RfMY3sTphEuDIcxKil
         Ze3he8r5AKKAbfPUL6pde0Ieh4Nq4y4/VExVeTGXOMhUejDROU7EWHrMH/ckANplL9Bj
         J06PHA9mLEHAYs1xhoY9L04M3R4xeJgRRU64VqQFwnP/BCKFI7lbV3H1ChLZe5RPE+Tp
         YV2C+8qfeuFHr2abg4FH3xWOVHLCqac/d2Xw0rM1aAumWXkmEOcR+TKMe07DBr/nV8DL
         VgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPv6Dtg+/w856M3TzidIBhWz08m0tZ/8frNjW6d2Q40=;
        b=kO7qefEWyLuxT+A1jGb8qbIe0Xi+VRSVvVHSr/AOXmr6ROVzS3TkkNNveD9jsuwrq9
         mTzZaS8rv/1QxF96MAgIxhHeg41xO2Fip92FFb8wbXqHZVHZn4NxUv7gpoHe08GxDbGM
         04PZZHv2BXvAYMpiCh/BfBXmLAUC2v/Vu3adwvWdEWt89w0FqLYgqQ1uMUQYpa6W5ocr
         DXWprSRqoide6sbuP+jxu/OhKAmtwjyScERPBtOpyWCcj5CCzVK+ypR5nrjcp0PyMB6U
         ojDSa0RXd/1eYiaeb6w8PIZnkpcPQ/10LLyMuuZKMTsF9cX1b8YLPDUlDkrKYcWLvyeC
         7nOA==
X-Gm-Message-State: ACrzQf1Vv6kSRuJ4B9ng/A917K3EcIIdv11YAXJavc0UySUDMEbF+niu
	AWqVvyLGWlXDdDfy261TqXWl10y2kHE=
X-Google-Smtp-Source: AMsMyM7gevt5+FhcbFQnOsDXZxl/bNmEDWGoOw3sVzUeGWZE34rhcQf7XG57iplFFR3RFguRmdtGkQ==
X-Received: by 2002:a17:907:6088:b0:78d:8e24:40d0 with SMTP id ht8-20020a170907608800b0078d8e2440d0mr2524290ejc.590.1665730495129;
        Thu, 13 Oct 2022 23:54:55 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id j12-20020a170906474c00b0076f0ab9591esm1007180ejs.125.2022.10.13.23.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 23:54:54 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] own-mirrors: add crate
Date: Fri, 14 Oct 2022 08:54:48 +0200
Message-Id: <20221014065448.1826445-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 06:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171726

Support downloading crate files from a mirror at SOURCE_MIRROR_URL.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-global/sanity.bbclass | 2 +-
 meta/classes/own-mirrors.bbclass   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 4a403a2590..15067e78d3 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -865,7 +865,7 @@ def check_sanity_everybuild(status, d):
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az', 'ftps']
+                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az', 'ftps', 'crate']
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var) or '').replace('\\n', ' ').split()
 
diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index 2f24ff1830..62258e4160 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -17,4 +17,5 @@ https?://.*/.*  ${SOURCE_MIRROR_URL} \
 ftp://.*/.*     ${SOURCE_MIRROR_URL} \
 npm://.*/?.*    ${SOURCE_MIRROR_URL} \
 s3://.*/.*      ${SOURCE_MIRROR_URL} \
+crate://.*/.*   ${SOURCE_MIRROR_URL} \
 "
-- 
2.37.3


