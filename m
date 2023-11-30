Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB01C10DC1
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:30 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.5289.1701377901255389073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ovPgTVBm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5bcfc508d14so1113442a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377900; x=1701982700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ilvx18+AnOjbtGxIYMpn2T9yKtEujUBJIRBC8tXgPc=;
        b=ovPgTVBmePC6bg4hDa5R1GfGebMjkyKUYyFjz4fGhDuhUUyjMHodySrUO4k4ZvSrCZ
         bDAAT+mTbxi9RNhLBkfEzNBlo2/XlaDdNdQThBU9KDfoAeOew4lf8MfguI5F00f5V0Zz
         FJL2gM3e0WKCbBdRkJEc31GhIWTfCAbfsqHuSjPh1RezNNy5LWYlDcqGFH0pEcFCPB5x
         PRp955q4bMbm0hAFl+vzVGvDT6HuhvHf1AMrgpjW4lXr0P9EYy3BKFI0fPqZ9zRklNbf
         2iCW9QRwu15hR9+ygdhmjxmGoZph2xy8elVHGIqePaHP5w+t9Zj4wwjiOJkS/9jzqGtg
         br0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377900; x=1701982700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ilvx18+AnOjbtGxIYMpn2T9yKtEujUBJIRBC8tXgPc=;
        b=VgGcEnOTFFOcw/kC0PBM4kU7J07bukwvX/tY85u7Jbp2+SE9xrdfONvdO4elhAQMW/
         bX2/AS5iI9mNFOZenKVtR5Q4LzpzC//wZiTrMUziPkpKKSMisp0mFCKpAjREpuklyliH
         tWWttOSIXxvPUR5zLU4y0KWLiUQU+Wkfd6SmJQrmZIIUITfcJ0QXS8YAbdw+ZeaBmgbq
         2NHHJ5Y7aAVPM5Q4Cv5VvmLd4E7/pEdK472ivj7gxMm0AZFOVtNNds76V8kOp3P/tCIM
         qG5KzuT8/GEPD0yQia2Af5XfMNvgF3p2GPVpmbYjRJ6CXDW2DlyyBvu3NP0I5DK0RSDc
         x2hA==
X-Gm-Message-State: AOJu0YwhoKPp9yw000b0w5cBAeX1OlsM9As4x0u/z9U16xf2SF/w7uyd
	PaJJ3IpH6kEVAZAfGCaZYxqb98gYB8gebHcLemOmBw==
X-Google-Smtp-Source: AGHT+IG3WurXgMfcEM3xee2Ml0GG3T45P6fV/fTR1qBtaE6Fvalifl4q8KdFQ1xsb+laAsLOHNoQAA==
X-Received: by 2002:a05:6a20:7d9a:b0:18c:44d3:d314 with SMTP id v26-20020a056a207d9a00b0018c44d3d314mr23349606pzj.10.1701377900450;
        Thu, 30 Nov 2023 12:58:20 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 24/25] lib/oe/buildcfg.py: Remove unused parameter
Date: Thu, 30 Nov 2023 10:57:32 -1000
Message-Id: <ea871e7920726c7b2e57161092e21c62e6a5d91e.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191542

From: Jermain Horsman <jermain.horsman@nedap.com>

Several functions included the 'd' parameter but never used it,
additionally the value passed is always None.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9e03ce0426576ebef3739dc1dfec4f7cd73ae094)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/buildcfg.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index b9d32c7cc1..b3fe510309 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -5,23 +5,23 @@ import bb.process
 
 def detect_revision(d):
     path = get_scmbasepath(d)
-    return get_metadata_git_revision(path, d)
+    return get_metadata_git_revision(path)
 
 def detect_branch(d):
     path = get_scmbasepath(d)
-    return get_metadata_git_branch(path, d)
+    return get_metadata_git_branch(path)
 
 def get_scmbasepath(d):
     return os.path.join(d.getVar('COREBASE'), 'meta')
 
-def get_metadata_git_branch(path, d):
+def get_metadata_git_branch(path):
     try:
         rev, _ = bb.process.run('git rev-parse --abbrev-ref HEAD', cwd=path)
     except bb.process.ExecutionError:
         rev = '<unknown>'
     return rev.strip()
 
-def get_metadata_git_revision(path, d):
+def get_metadata_git_revision(path):
     try:
         rev, _ = bb.process.run('git rev-parse HEAD', cwd=path)
     except bb.process.ExecutionError:
@@ -46,5 +46,5 @@ def get_layer_revisions(d):
     layers = (d.getVar("BBLAYERS") or "").split()
     revisions = []
     for i in layers:
-        revisions.append((i, os.path.basename(i), get_metadata_git_branch(i, None).strip(), get_metadata_git_revision(i, None), is_layer_modified(i)))
+        revisions.append((i, os.path.basename(i), get_metadata_git_branch(i).strip(), get_metadata_git_revision(i), is_layer_modified(i)))
     return revisions
-- 
2.34.1


