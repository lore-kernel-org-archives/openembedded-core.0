Return-Path: <eekmecic@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10D3C04A6A
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 13:26:08 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.15098.1690982762580191097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 06:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=PvzRTpnB;
 spf=pass (domain: snapchat.com, ip: 209.85.214.181, mailfrom: eekmecic@snapchat.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b8ad907ba4so43868445ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1690982762; x=1691587562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMhkLTPpgfqWudDstDW1t9GWC+wC0QungsKjE6pFl1U=;
        b=PvzRTpnB1IkAFFBuo+UdVdjFdnJ31xt0K4QRwebivWHHJ2N577stDIgXpV/qy50sHP
         0gFCEKkP22fk2vGm2UixVbFA7ZzqYKmN3u3TFbOWS1cOkV6KNlCY9GeVS50iv6PQiPCV
         X/xkG+I/t/beXhInElH+TERfK95T8pRTdfVRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690982762; x=1691587562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMhkLTPpgfqWudDstDW1t9GWC+wC0QungsKjE6pFl1U=;
        b=dK4ThZAZtR+NyWu2fqYuJ91wT8rwyRNIL1gF47+e8hKtYstPcXAbmhsDmekkFmDT7o
         jKhZguW2vOfVVd8LMAGeRlgEkFvP93Ug3eGFNa4OlRn/kRTRm7gPVSixD2VE6KtuSJiQ
         DxVn/M2eI8FIq4XyV+ydAPu45eS64TwVqfvuWVyQViprSFLE/8Ek4Z2Bpo+OsM0znBxJ
         2RIMaXaMYRLxDLaUwtJfvS/gWyyCJKqoiXqlNoZwKcciVmA52JKRnIE+eY2ijRKbQPVd
         WYt9eYebY5firGoeKRBgINq2089UPsd/u4BncGrJXYeBrwSOekkiFv04eyUcVn4wpFyj
         CIUA==
X-Gm-Message-State: ABy/qLYj39klN16s7vyngpNC51b0bkBGDxPiC/A5bzG+/xE3sDgTlfPE
	2czHP+NCec8HZcokQZnmX23jInY5Mnd2VsTOwYKBQUnq+p8=
X-Google-Smtp-Source: APBJJlGM1iPRyLCNVkAx+qsDMRSXcUbVHnG4rvqAwaEsu4rmm4MvCMHoOeOUYs233R1LxMBv6vZn1g==
X-Received: by 2002:a17:903:2308:b0:1b9:f97a:16ab with SMTP id d8-20020a170903230800b001b9f97a16abmr15650176plh.57.1690982761731;
        Wed, 02 Aug 2023 06:26:01 -0700 (PDT)
Received: from 4SK64Z2.sc-core.net ([144.232.179.190])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902a5c400b001b8baa83639sm7634726plq.200.2023.08.02.06.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 06:26:01 -0700 (PDT)
From: eekmecic@snap.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Emil=20Ekme=C4=8Di=C4=87?= <eekmecic@snap.com>
Subject: [PATCH v2] Add GCP fetcher to list of supported protocols
Date: Wed,  2 Aug 2023 06:25:41 -0700
Message-Id: <20230802132540.807837-1-eekmecic@snap.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 13:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185397

From: Emil Ekmečić <eekmecic@snap.com>

If accepted, this patch should merge with the corresponding BitBake
patch titled "fetch2: add Google Cloud Platform (GCP) fetcher".

Signed-off-by: Emil Ekmečić <eekmecic@snap.com>
---
 meta/classes-global/sanity.bbclass | 3 ++-
 meta/classes/own-mirrors.bbclass   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index abb52fbe21..9b824915f2 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -871,7 +871,8 @@ def check_sanity_everybuild(status, d):
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az', 'ftps', 'crate']
+                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', \
+                 'az', 'ftps', 'crate', 'gs']
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var) or '').replace('\\n', ' ').split()
 
diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index 62258e4160..36c7f8e3f3 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -18,4 +18,5 @@ ftp://.*/.*     ${SOURCE_MIRROR_URL} \
 npm://.*/?.*    ${SOURCE_MIRROR_URL} \
 s3://.*/.*      ${SOURCE_MIRROR_URL} \
 crate://.*/.*   ${SOURCE_MIRROR_URL} \
+gs://.*/.*      ${SOURCE_MIRROR_URL} \
 "
-- 
2.40.1


