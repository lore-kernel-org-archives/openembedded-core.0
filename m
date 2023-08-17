Return-Path: <eekmecic@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CAD1C2FC22
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:52:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.186470.1692276766305518417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 05:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=a0HldPc4;
 spf=pass (domain: snapchat.com, ip: 209.85.214.178, mailfrom: eekmecic@snapchat.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bdca7cc28dso45392565ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 05:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1692276765; x=1692881565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KbUm2Yg7mnZ6NXiLWfueBfxHBJkMQjCT4d9fZ/GB/Tc=;
        b=a0HldPc44qR9VcFk9uV7g93E8k1yidQ7WFo5yITVSGBDfpLTq4XvCiDjaaax3fSHwm
         dt5ViyLUjQaSa7N9/gnHog2qm/l8xRUYWtd8WSkxSO6OgIDBhZcTpVhVN+iQzstlzpxq
         E7pbbOURtTVmIVpXqM9JiRPe1FOZV+OoJoA98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692276765; x=1692881565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbUm2Yg7mnZ6NXiLWfueBfxHBJkMQjCT4d9fZ/GB/Tc=;
        b=KZ0M8MBqgwT5Wl4Ncwm2TAa5DVFpuQuIRsAOQMAcYyxSP63ka0EPhbdlINn9+NMNNX
         2uQhtXcp/phOgOtA3+5VXZ/DtPJsr6f3HCNrjU4zKLI2qKyRNHngjTTa1VjDo99Z7x2R
         t6MEIP+IzFWbWpOJyKMu4v9MMYJXdwPhq3ZUs9mW8Hy7bzuMONtG7S8TuuQUHK2Vp5Mi
         luvyxQqPOdpyWnEim+rpvfK16ICFTKxaF9cnTVv1xR7KqnhHSl1FbOj3kKwo7AngSlnh
         UmxfW7CUaoKziXB0PeWeD7hT/YB6ARurhdXJhOPTlNKxawY26kb7IJMEh3LN+JGavo1P
         tGyA==
X-Gm-Message-State: AOJu0Ywvt7pWiqWYkuJEx5tvtqKdhR0Uqxo7M4yTXSnmdu3ohJLnhwAj
	YBQ/2Rd6Yf5V3aTFIEz/NTDQfqQNWQJ0xVV7dUapctwS
X-Google-Smtp-Source: AGHT+IGHbd279U5s1Fy//lRj3ZH3ihn6VTU2NVrwEWuZgviCCzY4BPw9oG8Nqi+5geZVuoPQAd4Lyw==
X-Received: by 2002:a17:903:2306:b0:1b3:d4d5:beb2 with SMTP id d6-20020a170903230600b001b3d4d5beb2mr6526932plh.9.1692276765420;
        Thu, 17 Aug 2023 05:52:45 -0700 (PDT)
Received: from 4SK64Z2.sc-core.net ([144.232.179.190])
        by smtp.gmail.com with ESMTPSA id iw10-20020a170903044a00b001bdd7579b5dsm9050505plb.240.2023.08.17.05.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 05:52:45 -0700 (PDT)
From: eekmecic@snap.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Emil=20Ekme=C4=8Di=C4=87?= <eekmecic@snap.com>
Subject: [[OE-core][kirkstone][PATCH] Add GCP fetcher to list of supported protocols
Date: Thu, 17 Aug 2023 05:52:27 -0700
Message-ID: <20230817125226.1455928-2-eekmecic@snap.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186315

From: Emil Ekmečić <eekmecic@snap.com>

Requesting a backport of this patch to Kirkstone to support use of
the GCP fetcher internally at our company.

Signed-off-by: Emil Ekmečić <eekmecic@snap.com>
---
 meta/classes/own-mirrors.bbclass | 1 +
 meta/classes/sanity.bbclass      | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index 30c7ccd8e7..2fffc78d19 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -12,4 +12,5 @@ ftp://.*/.*     ${SOURCE_MIRROR_URL} \
 npm://.*/?.*    ${SOURCE_MIRROR_URL} \
 s3://.*/.*      ${SOURCE_MIRROR_URL} \
 crate://.*/.*   ${SOURCE_MIRROR_URL} \
+gs://.*/.*      ${SOURCE_MIRROR_URL} \
 "
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 293e405f62..6463321913 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -867,7 +867,8 @@ def check_sanity_everybuild(status, d):
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az', 'ftps', 'crate']
+                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', \
+                 'az', 'ftps', 'crate', 'gs']
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var) or '').replace('\\n', ' ').split()
 
-- 
2.41.0


