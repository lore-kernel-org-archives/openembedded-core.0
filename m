Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340E2C77B60
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:45:46 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.48109.1680241532941983417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gplt0hVo;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so13096197wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680241538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGH29FceE2dVUctPUs6ZvBTWuC/FcRbNfd59SqGc7T0=;
        b=Gplt0hVoJzEh6MtoOYy82t0ylMu49Oog8rmUim/DZ/7MkjYoL5QLl3ZbLwmMwt/TLY
         CzL6CTBqATL3YTchcjqOYINCq/Ut4afRX/rTTTluAlIgb3d/0FvTg5aIPyzBKvauCOpE
         I0malRy+fX/EAZZgBJyVKD8sak/YAMflmMsBJv+fbwNKwqMYXNhY9uHPUJwccr70Y8at
         h0K5+fOi1VNE4Wu7DNQkVeehFkyAbCvsGwmQVutsngskx/HM8z/XWOGeZKGIy1YWQg7f
         XB8ymmg7opApKSyxFsRPZEiGyT7XI7L/NWjB/OCFLAEImE0Tifa3FDYnR+A7bb2qkOnK
         0k9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680241538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGH29FceE2dVUctPUs6ZvBTWuC/FcRbNfd59SqGc7T0=;
        b=cz+UEpE+xniHVDPPLQogSU1q5sUOILWFUCPekVBg8ilPkCuuIEH4XNWKytZEhaK6Cn
         gE7GoDlG7eXQz1jsiBJJo0gVosGM1YaHlxKBBDCv/0apjPRQQPc6lCr9iuiKkNv4SXmB
         vNrelILKHzvLGOPTv/MgfKljvyKfUMlNj2DcAhxaTkL5TxmwGkfQ8BDpo8jbUCyggZwg
         fbwFWyluYdWTKxNlsDlZrirPa34AArFhyHHtvyccOrWFJ01crwMePWymIIWmKrSZkipH
         37ntcKucBtEiTVjLpCNEQ+G+7i9lhsougTOtu9NaOC6cIk9PCIkY3c2aWDUFq9pQi32c
         wzMQ==
X-Gm-Message-State: AAQBX9fBHc1I560Y1X6se7TvQ0/dkA/20gg24QMyAfsnp98KLElRZr6Q
	bDb7idipM3gjb6Y1JOIABINSL5UN+H8=
X-Google-Smtp-Source: AKy350YCgyNS9NEsrGUOlEDbbcKpggX8hc77OEPYEwcjT4x0mSSn6PrQaK8d8QhHwLTErRlhp94R2Q==
X-Received: by 2002:a1c:7714:0:b0:3ed:ea48:cd92 with SMTP id t20-20020a1c7714000000b003edea48cd92mr12790685wmi.15.1680241537802;
        Thu, 30 Mar 2023 22:45:37 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:72d4:654d:401f:66ef])
        by smtp.gmail.com with ESMTPSA id hg13-20020a05600c538d00b003ed793d9de0sm12664307wmb.1.2023.03.30.22.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:45:37 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V6 6/6] cargo-update-recipe-crates: force name overrides
Date: Fri, 31 Mar 2023 07:45:27 +0200
Message-Id: <1db80cb09c1495bf2c7ae98ebc74300efc6949ae.1680238655.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680238655.git.frederic.martinsons@gmail.com>
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179398

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


