Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE13CC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 13:53:13 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.7366.1705067591075218702
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 05:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=QvwD17Ft;
 spf=pass (domain: snapchat.com, ip: 209.85.208.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-553ba2f0c8fso7301623a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 05:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1705067589; x=1705672389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a7ROV0aNcam74NCVED7fI74pZz7GKWGnbWdM5CSV5B8=;
        b=QvwD17FtIZ6RgLu8ID1b8ckV3dtyX+lPYnGdU4kLiAzj/xGp1lfpnHx3YyPeCXRL+t
         jkhEdKwHVz9hlH+h83HzpZrRDarEjYADLFJubtvWdw1nGJ0h6ZZGDPekqINQdGMRwBoY
         P2lgJ0NH4lMz8LwYE3Z507BbseeZL4xaf+cL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705067589; x=1705672389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7ROV0aNcam74NCVED7fI74pZz7GKWGnbWdM5CSV5B8=;
        b=RX5oI6u55bEWbC3QJlDXmRTD+2auK4bdVgLxYqYDtxJeux4fzVrN4kfr4N5fczNajy
         qD3LJDF0Xv8LcAQWxamgxXehktJ7nlCx9d5bHWzU2hWvgOUKCJixr34IFw1ZNfe8iZUs
         NKz+sICNnkBsfQQ6RXIf2hz6PpeTiG+A69WiEeMydSjdi9zIlDmcnaNCE3nUiP/gpJrE
         40LpclEc2+HvTZat65Ep14U3aolY+ydzS6fMJQ1CFWNXGRGTDezVgA4nnYOCgO+D96st
         fR6ij3qPIaEn6+0O5VZUSKZUlXk50A8eHk2Ca2i6qQA8VokZqu1CKhGj+TiPpLHY84km
         1Cwg==
X-Gm-Message-State: AOJu0YyTiMC85xvAKVUOi0tn+ghy/Sb97/mDxamfMKKR46gva3u5a+EX
	BsLejrKWPlKuhv0EtIRugcYLvCrmvmImlw4MSKQ0iu1R6yotaVm+
X-Google-Smtp-Source: AGHT+IG4VMybEODun3K0mX7MUNBGB4iP6E1CKy15w3S7LB3VXhCYkhBVv4Bxf8HnvomNkmO2cH/y1A==
X-Received: by 2002:a05:6402:3127:b0:558:a8a2:9534 with SMTP id dd7-20020a056402312700b00558a8a29534mr335708edb.65.1705067588929;
        Fri, 12 Jan 2024 05:53:08 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id n14-20020a056402060e00b0055344b92fb6sm1813607edv.75.2024.01.12.05.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 05:53:08 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Dominik Schnitzer <dominik@snap.com>
Subject: [PATCH] package.py: fix Darwin support
Date: Fri, 12 Jan 2024 14:52:52 +0100
Message-Id: <20240112135252.1871340-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 13:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193581

From: Etienne Cordonnier <ecordonnier@snap.com>

Signed-off-by: Dominik Schnitzer <dominik@snap.com>
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/lib/oe/package.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 9a465eaa09..635efc9763 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1615,7 +1615,7 @@ def process_shlibs(pkgfiles, d):
                     sonames.add(prov)
         if file.endswith('.dylib') or file.endswith('.so'):
             rpath = []
-            p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+            p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
             out, err = p.communicate()
             # If returned successfully, process stdout for results
             if p.returncode == 0:
@@ -1624,7 +1624,7 @@ def process_shlibs(pkgfiles, d):
                     if l.startswith('path '):
                         rpath.append(l.split()[1])
 
-        p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+        p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
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


