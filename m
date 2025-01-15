Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33FBC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 15:32:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.24048.1736955115684774552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 07:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=He/TCpjW;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: pmi183@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361c705434so49369285e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 07:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736955114; x=1737559914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zd7uisVHE/x30fmxbeJEe37hWge9NguQe5J3U/LmPh8=;
        b=He/TCpjWakVjRlbvgN4zf2aupqoOh8nZbTXORP/1cNKlKIWGR7PMaiIOROWUPsL3jb
         4phQ2/mOv0W+HBOm20/MlpCDXJpaciXBIeuT/a3QIAxehaxVKgkbL62mJ3Vx7NhY7NDQ
         SsEHgJGGEgj6vQSx9CTVJR/uHfrT2fZzUAEUb0EyVan9TN8/Xn4u9oafKZBXJAGThUaP
         7F8NJZIID000oAwrJ7F+AWBNdk1SnUoj/y9Ei8JTYfR6Y+n+4vZlREfUoqxuV/fXr902
         UpbEEKzM9Oi0racFMu6vwyokOiCFpixNZ/9JP1Sb0Rtwr0sEiCib7V/knCj2OSH91J92
         XKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955114; x=1737559914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zd7uisVHE/x30fmxbeJEe37hWge9NguQe5J3U/LmPh8=;
        b=h2lPWUQXWm8BSoSX9h39bt1ETdbhWB16fWZdb+/CnnwPjokThIgO0y2cpQeOqAkHE/
         GM38VnfRf/zGDrrtJHe4t5hm5iynKzXI3ioNJcADuoFjgj9uRqKBp/BzfV+CIiu8o/gn
         3iF8JySVvU0iUkEWHyKefx9ijJt7ohrVOw+tzyB3hN//mNjD+wdg0SSQlRUxdT0MALST
         tXC1lcMVL81phjrsvpPqxyX6ttobrDZ29cfmlJvPcZ6x9aEly0CpxY6x4Y1kiRzKKGst
         lJxeLfi4HlgtQ8igesEexyDwndn6ZXa7FIdY7qcChIPtUKI3JoxtcBhKgYSe22WhCboV
         GJkg==
X-Gm-Message-State: AOJu0YwCKDyeES5Tpgwbk1BM3s/xWnnlKG0Jp79/eN9qbTL4st4C02kc
	uECtDkQh3gPe/jaflr2UPDf7+NVMKXZ5qG7xB/SZKkhr7uTG+Guj9iK8tQ==
X-Gm-Gg: ASbGncvnzx4ck7GmgqA/ypQ4JNSmWFLozcixhMRhtZWqBtzUdI3gs5/mqlsWZ5kjhwd
	MuWt5YmSkjR5HG4BVU98ump4XLajuAZ4pTSUv/b8Alp9Q81qRcIT9Xa/25vC4eJ/xlgNCGgRZ3q
	7R8U5P0l67lHuvs5VSORmCh8iyIJ8B9D1pqiMBvagDIGSQP0j1ueoaJNdaOYa6lsjYz2czvRySM
	XYadVLF8We32jYeOaqRZnH/11lsi6UrV2TyIiY3r9iNzq0Onl3WUIs27WBAWpzaB1QdxekYK2c8
	N7Sdv4s7aws=
X-Google-Smtp-Source: AGHT+IHcliVxiDvqJFyd8Wm9wJ2sEAUCtGQzMNBqfQ5w6FfU7dh2ug0izv8TNUJqI9Zvq/xwukIxyg==
X-Received: by 2002:a05:600c:154e:b0:42c:b16e:7a22 with SMTP id 5b1f17b1804b1-436e2697066mr286195135e9.12.1736955113695;
        Wed, 15 Jan 2025 07:31:53 -0800 (PST)
Received: from LAPTOP-0FHSM1V0.criticaltechworks.com ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c749989asm27873485e9.2.2025.01.15.07.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 07:31:53 -0800 (PST)
From: Pedro Ferreira <pmi183@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Subject: [PATCH] buildhistory.bbclass: restore BUILDHISTORY_PRESERVE files
Date: Wed, 15 Jan 2025 15:31:49 +0000
Message-Id: <20250115153149.1827119-1-pmi183@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 15:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209919

From: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>

On each build using sstate-cache, buildhistory will move
content to a temporary folder named `old`.
When buildhistory looks for the main dir, it wont find it
and ends up creating it.
As a consequence how code is structured wont restore any
preserved file.

Code block moved to ensure if old dir exists, it will
attempt to restore those files marked to preserve.

Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
---
 meta/classes/buildhistory.bbclass | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index d735dd5fb5..b0f395f05e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -260,14 +260,6 @@ python buildhistory_emit_pkghistory() {
     if not os.path.exists(pkghistdir):
         bb.utils.mkdirhier(pkghistdir)
     else:
-        # We need to make sure that all files kept in
-        # buildhistory/old are restored successfully
-        # otherwise next block of code wont have files to
-        # check and purge
-        if d.getVar("BUILDHISTORY_RESET"):
-            for pkg in packagelist:
-                preservebuildhistoryfiles(pkg, preserve)
-
         # Remove files for packages that no longer exist
         for item in os.listdir(pkghistdir):
             if item not in preserve:
@@ -280,6 +272,13 @@ python buildhistory_emit_pkghistory() {
                     else:
                         os.unlink(itempath)
 
+    if os.path.exists(oldpkghistdir):
+        # We need to make sure that all files in preserve
+        # are restored from buildhistory/old successfully
+        if d.getVar("BUILDHISTORY_RESET"):
+            for pkg in packagelist:
+                preservebuildhistoryfiles(pkg, preserve)
+
     rcpinfo = RecipeInfo(pn)
     rcpinfo.pe = pe
     rcpinfo.pv = pv
-- 
2.34.1


