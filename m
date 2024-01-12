Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8214FC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 15:20:44 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.9665.1705072838586204609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 07:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=etQpp+oI;
 spf=pass (domain: snapchat.com, ip: 209.85.218.42, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a2cfb0196bcso26925766b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 07:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1705072836; x=1705677636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jhLXBSF3fQ0MSNGjo8gO697+TengczE1wDts9MYNFvU=;
        b=etQpp+oI/EhtalMbYdVNfzmgc4YewTeXyM4K+oiAgM5Mc8t1gIjEPly7s27V+pJFq+
         e954VawEbgeFqNu/QhwBeP4Ms6nbT2aEM/EfpWir/of8HxPl2Wdx0wPF0Qh5kVgqECrz
         8gVUqvq1/HJu+p8JtfhOdRtsApbSJ+zOCmkf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705072836; x=1705677636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhLXBSF3fQ0MSNGjo8gO697+TengczE1wDts9MYNFvU=;
        b=Iz0RxJcfmKHWbyCDJz3SnO0CoIvbamAgBrgsi27yydkNNmuqvrKaOxBa7L9fOUuCRt
         edE7P7AsGQCNJaom0l19mpLnYuWS4UbDNKOI2lLXC25056rXaZt7o+4oaPJ5ZUrX/mBd
         C55s10s0TrlC+c+z08k9dw4DKaX9eoXWey9ylr6Sv+6OlOc0lvVgmn0Yux1cWQdVB117
         epZWuMRHvEcv0m4UwqyOx8N/8rWEne5aetZBCZjD5mJ8RFXbxsjERrtgYziBlTNUAaZv
         zjUwWcf9HKwDRbS8FLwLPsTnuZKfTaov71/elxRhTinwziDiEqgZrW9x/H+4xp9TW/zq
         iA9Q==
X-Gm-Message-State: AOJu0Yz3BMiGpVGzChtXF6SZPH+5MDxJC+TCaT/4Fr30d9uRVAY8+9dt
	FydG/iyrwkymKyN8WaGo96tB/+AsW0bZCFdtzFYkteyS7N6FWsZS
X-Google-Smtp-Source: AGHT+IGDAMh/f+BRV9ffkPxrq3Wi9DiNnBE/3O5zLSVRy4RfGL7woiw4qGEUX6vpfLEWUMwFvDNnug==
X-Received: by 2002:a17:906:cc16:b0:a27:d13b:85aa with SMTP id ml22-20020a170906cc1600b00a27d13b85aamr689758ejb.148.1705072836124;
        Fri, 12 Jan 2024 07:20:36 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id x15-20020a170906298f00b00a27e4d34455sm1878397eje.183.2024.01.12.07.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 07:20:35 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Dominik Schnitzer <dominik@snap.com>
Subject: [OE-core][PATCH v2] package.py: fix Darwin support
Date: Fri, 12 Jan 2024 16:20:30 +0100
Message-Id: <20240112152030.2564482-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 15:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193593

From: Etienne Cordonnier <ecordonnier@snap.com>

- 'subprocess.Popen([d.expand("${HOST_PREFIX}otool)' requires text-mode (a more
  readable alias for the universal_newlines parameter), since otool produces
  text and the code 'out.split("\n")' expects a string, not a bytes object.
  otool is used on MacOS only, so this error isn't triggered on Linux.

- use 'startswith("darwin")' in order to support all darwin versions and not
  just specific versions (meta-darwin supports darwin21 at the moment).

Signed-off-by: Dominik Schnitzer <dominik@snap.com>
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/lib/oe/package.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 9a465eaa09..702d8403be 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1615,7 +1615,7 @@ def process_shlibs(pkgfiles, d):
                     sonames.add(prov)
         if file.endswith('.dylib') or file.endswith('.so'):
             rpath = []
-            p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+            p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
             out, err = p.communicate()
             # If returned successfully, process stdout for results
             if p.returncode == 0:
@@ -1624,7 +1624,7 @@ def process_shlibs(pkgfiles, d):
                     if l.startswith('path '):
                         rpath.append(l.split()[1])
 
-        p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+        p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
         out, err = p.communicate()
         # If returned successfully, process stdout for results
         if p.returncode == 0:
@@ -1686,7 +1686,7 @@ def process_shlibs(pkgfiles, d):
                 soname = None
                 if cpath.islink(file):
                     continue
-                if hostos == "darwin" or hostos == "darwin8":
+                if hostos.startswith("darwin"):
                     darwin_so(file, needed, sonames, renames, pkgver)
                 elif hostos.startswith("mingw"):
                     mingw_dll(file, needed, sonames, renames, pkgver)
-- 
2.36.1.vfs.0.0


