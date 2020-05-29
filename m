Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.677.1590789818899334693
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 15:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vPOD6QBJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id n5so5658551wmd.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 15:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A8nXv5bHRcEk18J7cu5dLNIQbG+jBmaSOndPKulDjLw=;
        b=vPOD6QBJwPwFBe8XSt2OF3UNnSCqlIluTgdEaAFTNCldFD4hYdQw/SZe8Pid3GHQD/
         inRrO8S+QcKXgx/Mzy0C6iljUkzAI6o1VuVifFEALju+oHVDkusHwNUF+H5QHpWSRUBV
         sWsK6XNfGBmHoG4RLGrGbamogloyP7SodhrjUVHf42ADumkYYpVswkMds8+WRknKCeDJ
         r3UpEMQSCLMWI/JFZqwO3gQjllYgmkbBLjsXUmTxZCdJVp7Ve8yKfp+I+KX0y/SrxlJo
         jjMXYKIFfEAUjQaD9xzHg/CmEaoSA+KYBpACcUY2EP7HkDY2TiGU7cXuBwrBzHySaXL/
         ic9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A8nXv5bHRcEk18J7cu5dLNIQbG+jBmaSOndPKulDjLw=;
        b=fZnkbfBIhM9sd+t8w52fR6D2QhfDF0LrUUdHPsE6BdlFGN/vmHpTxJJtYuA1uXI4f6
         4paG3Uf6MZWW6nnD+RFZl0p/C/mpSgl4YdfUobLaemdOj0Z+WskkOENI2pYWzP/oUorT
         OOsepwbEZzL+DPYQqNtoJqIJ2EEnylVRZ8TXsmugcy8OSY2CBVcLWEUfZRx06a5X6NMu
         WAemCRnIYOlY+hYtPWz2sZcVOXRQEkemxFQP0iLKaH95h3lJktIio8tMaKNr+NVigRdK
         zPUDytD/1OXQZtOg+7Za4cEpDY6Z98JCD9U5EIDcSySpgJFOziNKngw7vGGc2FKJoJAJ
         l7lA==
X-Gm-Message-State: AOAM530CUsXS5o9P2GQnWKK3LBo+Wf1Bgy4CX7ID54s7FFBrNi5s3AFf
	WysG5XRLPZOdd3FWLRPY9/UoJ/py
X-Google-Smtp-Source: ABdhPJyJOru6vygIztCWkh+/D0ntC9IJwnduKsazwW/AvrHGsZC1e48A+rVnIFN90NhGyw3C9kJQKg==
X-Received: by 2002:a1c:2082:: with SMTP id g124mr10888941wmg.21.1590789817261;
        Fri, 29 May 2020 15:03:37 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 23sm1177631wmo.18.2020.05.29.15.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 15:03:36 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 4/6] lib/oe/patch: GitApplyTree: save 1 echo in commit-msg hook
Date: Sat, 30 May 2020 00:03:26 +0200
Message-Id: <20200529220328.3480555-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
References: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* also remove the extra blank lines which is often added to patches
  when refreshed with devtool (GitApplyTree.patch_line_prefix lines
  are ignored when refreshing .patch files, but newly added blank
  lines aren't - the leading blank line wasneeded for patches with
  just the subject line (to prevent the GitApplyTree.patch_line_prefix
  line ending appended to the commit summary), but we can add it
  in prepareCommit instead

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/patch.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index fa92abe248..bb1c40aa1e 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -508,8 +508,7 @@ class GitApplyTree(PatchTree):
         with open(commithook, 'w') as f:
             # NOTE: the formatting here is significant; if you change it you'll also need to
             # change other places which read it back
-            f.write('echo >> $1\n')
-            f.write('echo "%s: $PATCHFILE" >> $1\n' % GitApplyTree.patch_line_prefix)
+            f.write('echo "\n%s: $PATCHFILE" >> $1' % GitApplyTree.patch_line_prefix)
         os.chmod(commithook, 0o755)
         shutil.copy2(commithook, applyhook)
         try:
-- 
2.25.1

