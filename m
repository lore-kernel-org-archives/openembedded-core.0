Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A699C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 15:36:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.19761.1715787368510996747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 08:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lwv5RpTy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-420180b5838so23371465e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 08:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715787367; x=1716392167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cn6mAukc0mpkVh3poQQbGK7yLIJ+7RdT/53kewP4qU=;
        b=Lwv5RpTyH8hiLoV0KADNd+lBGTJA/kLENqrjnUFrSHSnKkccDLPWoSyzk2EFZdNTNR
         GHyf+KoraAkXnCTEDKUgd0lILktmlJxnIP/cDfiM99YvTHPg9/g9UStaE7KTdNbKq3f7
         JZEsujdr3b9zNfUZXu8nE3ta2wenzlYoEhC4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715787367; x=1716392167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cn6mAukc0mpkVh3poQQbGK7yLIJ+7RdT/53kewP4qU=;
        b=IIQvqGYqMbxv5evgdq2++Ths57L9uc20vPgF0yORR9JVhUojddtCY287vTt+0q5Dfd
         IeeNA8iiieOiMXApJ1PCpEp85BKhxYlKt1kQnYVCDqkLKCqt4I1k90OHepeI5quCmuJi
         sq0WFeHBuY2tkpYwJ0NGGQcDZPd+CpNYSgjdVhVK5Iq3Gq+hXnzCiU+acbkIn9NDz+/o
         MojJvhTXkwTwelVbrnC/gqa9/GXlmFcXl+y/OCSVg3Z40rL5ZcX/G19lQLoYvWOe8ahw
         vywPqdexMXjDIqR5GHjY6unQ6FDgrRk6+HTwnAL++LPnna2w9dMF0wi+U2X2LRI+o3wj
         bMTw==
X-Gm-Message-State: AOJu0YwWuO6VEtx0T0JEkHVs4jGLx7Um91pIrN+iu6k1KNWucn6A44O5
	oEyjpYhL8TUTwVW6j/I3UIhy/mNbtLplvriKHmzEOJuXVzFtY67S5f9m9Due65+SyrUZgxerXPR
	lh+8=
X-Google-Smtp-Source: AGHT+IGjoAJGPt5rrm0NJEk/s10g5bM7t8ZWEPKrnuZalQvp5dtzENBWjZFb5I4+pnmRk31vdArC9g==
X-Received: by 2002:a7b:ce0e:0:b0:41f:bcd7:303f with SMTP id 5b1f17b1804b1-41feaa38a8emr172903105e9.16.1715787366418;
        Wed, 15 May 2024 08:36:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4201da9895csm79076265e9.44.2024.05.15.08.36.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 08:36:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe/reproducible: Update for WORKDIR -> UNPACKDIR
Date: Wed, 15 May 2024 16:36:05 +0100
Message-Id: <20240515153605.461248-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 15:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199292

We need to search UNPACKDIR instead of WORKDIR for git repos for
SOURCE_DATE_EPOCH.

Drop the exclusions list as these would no longer exist under UNPACKDIR.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/reproducible.py | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index a9f717159e3..e57c83b92b8 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -75,10 +75,10 @@ def get_source_date_epoch_from_known_files(d, sourcedir):
     return source_date_epoch
 
 def find_git_folder(d, sourcedir):
-    # First guess: WORKDIR/git
+    # First guess: UNPACKDIR/git
     # This is the default git fetcher unpack path
-    workdir = d.getVar('WORKDIR')
-    gitpath = os.path.join(workdir, "git/.git")
+    unpackdir = d.getVar('UNPACKDIR')
+    gitpath = os.path.join(unpackdir, "git/.git")
     if os.path.isdir(gitpath):
         return gitpath
 
@@ -88,15 +88,12 @@ def find_git_folder(d, sourcedir):
         return gitpath
 
     # Perhaps there was a subpath or destsuffix specified.
-    # Go looking in the WORKDIR
-    exclude = set(["build", "image", "license-destdir", "patches", "pseudo",
-                   "recipe-sysroot", "recipe-sysroot-native", "sysroot-destdir", "temp"])
-    for root, dirs, files in os.walk(workdir, topdown=True):
-        dirs[:] = [d for d in dirs if d not in exclude]
+    # Go looking in the UNPACKDIR
+    for root, dirs, files in os.walk(unpackdir, topdown=True):
         if '.git' in dirs:
             return os.path.join(root, ".git")
 
-    bb.warn("Failed to find a git repository in WORKDIR: %s" % workdir)
+    bb.warn("Failed to find a git repository in UNPACKDIR: %s" % unpackdir)
     return None
 
 def get_source_date_epoch_from_git(d, sourcedir):
-- 
2.40.1


