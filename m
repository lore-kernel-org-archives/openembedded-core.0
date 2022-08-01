Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DAEC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 22:43:16 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.3981.1659393789499652855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 15:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=etKF8l3U;
 spf=pass (domain: gmail.com, ip: 209.85.210.41,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id
 g20-20020a9d6a14000000b0061c84e679f5so9215227otn.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 15:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fALXmUzD6zFqerxVfu/JE/mY648/HJXkvcmDVjPsTzA=;
        b=etKF8l3Uf6S7KxbCqaqMCkRAcHW7LPhGbLJY5FdjxhuCC4aYG9EIKJyfyNyk1B5GIi
         5BiPY6X88cM5bNmPn83YUlmvfSBdOOfbD1uGnW6t6Y7p3CRMMNX2YXQ4BQkYT0WGaLla
         649e5Ybz/npcSLNQR9zq5uFeuGyLD5me4sa0UgNjOUvG3sigeGVzbyxTz1NjRQ7MGnmZ
         qOSQ9O2RJmzAzVGFz/4n89CIXCFbVquFnoc7DP+a9s1J2gMN2J1BbN47NBxmmKNC5aCD
         j6q4Uwl/FuYN1zcGTVr8TJpIaCVd3qYJFAOd/311AHns4SfRCCIOHhU3V+4AnkQoHLkq
         Rbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fALXmUzD6zFqerxVfu/JE/mY648/HJXkvcmDVjPsTzA=;
        b=YPbvfMTaE0EPObnBLBG36+a6l+8IRylr4DuUu1OVJ1jVWx4qbji+c/dH7CE6vEst+1
         3Ta2fZyzs0j9D9IOHjtawSxlJxry+Vw4cWUq088AuwsgMFC8KvD9cglbLn4802fBF54+
         YVgw9HISz+vlL6VNAQyCZgHJD5MV/LK/o9mpuKseLSfJ7Cw1k+2ENXBIevgYXR8/PizA
         J0aUqa/Z/TZlCv6p0PSss4nkQOcD6tS/3tntE/74U77paoO5AKVjGG/8iTZuuhgcrE2D
         45EGro00/bOpiLY00Cvj2mR0WSEifu922bixD3FV6MgfkHFogRvr4j9uH0sSPx5Q1B/c
         uQhQ==
X-Gm-Message-State: AJIora9x4ZTYrqC2HDfqhOm+HLwvstvGdpNbLo34GDiCFhZwuaDhAkg7
	EC/tD6QEbjt1X8vXvVGpUpnr5wgXwYE=
X-Google-Smtp-Source: 
 AGRyM1svKLUT2sDL/3J9y/xYlwodplOEW6dGtF3kEK+hlBbpRVBHF97+9ZZ2X49d4oxAsyN2Cg7axQ==
X-Received: by 2002:a9d:65cd:0:b0:61d:355:b5f7 with SMTP id
 z13-20020a9d65cd000000b0061d0355b5f7mr6535776oth.119.1659393788482;
        Mon, 01 Aug 2022 15:43:08 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 g40-20020a9d12ab000000b0061c514a3b7bsm3030754otg.10.2022.08.01.15.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 15:43:08 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/own-mirror: Add hierarchical premirrors
Date: Mon,  1 Aug 2022 17:43:05 -0500
Message-Id: <20220801224305.251616-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 22:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168761

Reworks own-mirrors.bbclass to allow multiple URLs to be listed in the
SOURCE_MIRROR_URL variable. This allows a hierarchy of premirrors to be
defined where URLs earlier in the list will be tried before the later
ones.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/own-mirrors.bbclass | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index ef972740ce..dcb4456222 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -1,14 +1,17 @@
-PREMIRRORS:prepend = " \
-cvs://.*/.*     ${SOURCE_MIRROR_URL} \
-svn://.*/.*     ${SOURCE_MIRROR_URL} \
-git://.*/.*     ${SOURCE_MIRROR_URL} \
-gitsm://.*/.*   ${SOURCE_MIRROR_URL} \
-hg://.*/.*      ${SOURCE_MIRROR_URL} \
-bzr://.*/.*     ${SOURCE_MIRROR_URL} \
-p4://.*/.*      ${SOURCE_MIRROR_URL} \
-osc://.*/.*     ${SOURCE_MIRROR_URL} \
-https?://.*/.*  ${SOURCE_MIRROR_URL} \
-ftp://.*/.*     ${SOURCE_MIRROR_URL} \
-npm://.*/?.*    ${SOURCE_MIRROR_URL} \
-s3://.*/.*      ${SOURCE_MIRROR_URL} \
-"
+python() {
+    for m in reversed(d.getVar("SOURCE_MIRROR_URL").split()):
+        d.prependVar("PREMIRRORS", " \
+cvs://.*/.*     {m} \
+svn://.*/.*     {m} \
+git://.*/.*     {m} \
+gitsm://.*/.*   {m} \
+hg://.*/.*      {m} \
+bzr://.*/.*     {m} \
+p4://.*/.*      {m} \
+osc://.*/.*     {m} \
+https?://.*/.*  {m} \
+ftp://.*/.*     {m} \
+npm://.*/?.*    {m} \
+s3://.*/.*      {m} \
+".format(m=m))
+}
-- 
2.33.0


