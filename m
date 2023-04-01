Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42043C6FD1D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 09:31:07 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.17483.1680341457001012790
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 02:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L9qRJWxM;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id e18so24689085wra.9
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 02:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680341460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGH29FceE2dVUctPUs6ZvBTWuC/FcRbNfd59SqGc7T0=;
        b=L9qRJWxM3ZX62sBKsKF6Ky4xy8S5Y2xeHHmkW8fu2reEaqKnINtOKblMnSNtROOsQE
         bG9BWqU9FU3hF07eBZe4ViNgJ6Eu2kwyZdzC4yFUn/MvQ3vbW9vSPEteOv3cZJgd1+JU
         Y4uh2EdFfgeFV7fFDyswvvmjztZ1wzdRQGnRn7wER63SCyYxOSRLZ97PpF3KflFoSGpi
         WN9VSm0M278TJru3scOwII4puFMbjS5MgWjqN3FoErMgnKz7CPuPgLOt0CIa/zXdDQXe
         3zFu4FouPQW4DRvh+VvrFg08Ru9sIKskSa1vv5Hyd2CeHMXzZ6BEdSc9YZBX06h0VlKY
         qbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680341460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGH29FceE2dVUctPUs6ZvBTWuC/FcRbNfd59SqGc7T0=;
        b=mCAfLa5C+0iVWPAtuPik8A+FEMwvo8oNhVsqcTaF2HNuPepor4cD/kfzqQd/3zHebi
         TSOnFL8Lq9ZHIaESCwYyd9WzoI+O/qc0V5iwR+oUZl6A6dc10JZ/Hvxc8G+VYIHJxsD/
         GeRjdYzhWendbWzwzJn8FltDwhVrCkNcaVP+OW3qkJKB57cn4U2qeYsgOB3dMJRT192g
         Kf2mwFusXN/AZpwK4arPY0nVuhTHObtM9Wa3rPubrVbyI2dgaQCLzeOoSgIB8bE9BkiJ
         060JsFRIc/LGIt5ZtETYnsihANscc8Xz0yqq+FTMNWwPBJCS1Z0avmMdLpPV39Wg1lh2
         TO5w==
X-Gm-Message-State: AAQBX9dIH8IEHZwzvvRGMcnDtLuMEMDg1+DfTNGupFoOqYhMWs2zqwnq
	QqgIWuUlFQTWIs7QvMON9dlQ1sspISU=
X-Google-Smtp-Source: AKy350bFq8o+6oMjIMJRwss8eD4Xkfbc90tMgTyCwFnYN9sSP7CkECTCFnC18lJaOamB2EiN1kejhA==
X-Received: by 2002:a5d:4884:0:b0:2e4:aa42:7880 with SMTP id g4-20020a5d4884000000b002e4aa427880mr6494828wrq.50.1680341460044;
        Sat, 01 Apr 2023 02:31:00 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:eb6d:89c5:4fce:e824])
        by smtp.gmail.com with ESMTPSA id p11-20020a5d4e0b000000b002e71156b0fcsm1522232wrt.6.2023.04.01.02.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 02:30:59 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: martin.jansa@gmail.com
Subject: [PATCH V7 6/6] cargo-update-recipe-crates: force name overrides
Date: Sat,  1 Apr 2023 11:30:51 +0200
Message-Id: <43f57a5a0a0c142132040398a875f6755eccbc93.1680340685.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680340685.git.frederic.martinsons@gmail.com>
References: <cover.1680340685.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 09:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179464

From: Frederic Martinsons <frederic.martinsons@gmail.com>

A project can have multiple Cargo.lock (provides
multiple binaries for example) and each one can
depends on differenct version of the same crates.
Even within the same Cargo.lock file, it is possible
to have different version of same crates.

To avoid conflicts, override the name with the version
for all crates checksum

Moreover, when searching for Cargo.lock, we should ignore
specific dir like .git (no use to walk down there) and .pc
(because it can have a Cargo.lock if this file was patched)

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 .../cargo-update-recipe-crates.bbclass        | 35 +++++++++----------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index daa363b0dd..322b4e4d79 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -38,25 +38,12 @@ def get_crates(f):
     if not crates_candidates:
         raise ValueError("Unable to find any candidate crates that use crates.io")
 
-    # Build a list of crates name that have multiple version
-    crates_multiple_vers = []
-    tmp = []
-    for c in crates_candidates:
-        if c['name'] in tmp:
-            crates_multiple_vers.append(c['name'])
-        else:
-            tmp.append(c['name'])
-
     # Update crates uri and their checksum, to avoid name clashing on the checksum
-    # we need to rename crates of the same name but different version
+    # we need to rename crates with name and version to have a unique key
     cksum_list = ''
     for c in crates_candidates:
-        if c['name'] in crates_multiple_vers:
-            rename = "%s-%s" % (c['name'], c['version'])
-            c_list += '\n    crate://crates.io/%s/%s;name=%s \\\' % (c['name'], c['version'], rename)
-        else:
-            rename = c['name']
-            c_list += '\n    crate://crates.io/%s/%s \\\' % (c['name'], c['version'])
+        rename = "%s-%s" % (c['name'], c['version'])
+        c_list += '\n    crate://crates.io/%s/%s;name=%s \\\' % (c['name'], c['version'], rename)
         if 'checksum' in c:
             cksum_list += '\nSRC_URI[%s.sha256sum] = "%s"' % (rename, c['checksum'])
 
@@ -69,12 +56,22 @@ import os
 crates = "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
 found = False
 for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
+    # ignore git and patches directories
+    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.pc')):
+        continue
+    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.git')):
+        continue
     for file in files:
         if file == 'Cargo.lock':
-            crates += get_crates(os.path.join(root, file))
-            found = True
+            try:
+                cargo_lock_path = os.path.join(root, file)
+                crates += get_crates(os.path.join(root, file))
+            except Exception as e:
+                raise ValueError("Cannot parse '%s'" % cargo_lock_path) from e
+            else:
+                found = True
 if not found:
-    raise ValueError("Unable to find Cargo.lock in ${CARGO_LOCK_SRC_DIR}")
+    raise ValueError("Unable to find any Cargo.lock in ${CARGO_LOCK_SRC_DIR}")
 open("${TARGET_FILE}", 'w').write(crates)
 EOF
 
-- 
2.34.1


