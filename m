Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506DBC4167B
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 19:10:59 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.60846.1702235453537831685
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 11:10:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KGYPnPY6;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-334b2ffaa3eso3511153f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 11:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702235451; x=1702840251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vi4ZSqwO73yOjyvPNIcAmOP0/l70gPpMpWjSv243DBw=;
        b=KGYPnPY6oSAjU5n9uVn1E1+FTA5uohyck25rwSa2lE8dD7PaoJ1n0fQGy54qZFco4r
         BN+wIZUJKNGMT6J9m/fwlEMX2rQbo6EIZOJam03DRVKomFR4bEGoc6ZCyBBCUigXoRPX
         DR3wY1joH+o+bP5FQYpEh3i9HpuF38tr0iMnpjnxteVefmQy1jGlpl8zeaUJv3pGXz0c
         FzZ07ZUgijUkxfNwTzHp0g0ynbhI69GEnOgmapM/5VVrUqM8DDH+iMFvnR8XbtPLkG9x
         kqb6/lY+JvH9Cfr/+9pd3ZrqRNvKub6kYTe1F27quST2scMsQIeSEGjDCff/quEmZudX
         DKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702235451; x=1702840251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vi4ZSqwO73yOjyvPNIcAmOP0/l70gPpMpWjSv243DBw=;
        b=hFzfmOakdnxGIlgFwWCR2M3tu+wDQr0y5x86gZXIJI8NsFF13wxrc/9yJGbvIqnGuD
         xAhZxRERHlbG3r2ZYEKsgqregGLhDNKKif8NqY/7xweenN4zcSGuaDsu9dVoA73a2BIb
         kxBhR+HH6MvM4PzWyCPtWYRt57dpKsN3pK2ILnFKCYA8ZZPYG92EMxgVZM5tcANsl3yP
         rPsizqUp0vScViZWRpjmxVWLCtWCpwmo4Hl2QeemOnEEBKNf0y3kMYAr2+x+T0WtRjIr
         jn1gSSbOYhAQQupLQa/diiOQdZDO9LZQSkGz+zElqmsScnnOalSH1yS85H2boijTj8/A
         fETA==
X-Gm-Message-State: AOJu0YyNZzzVBwXbWyqqPlk9cWq+zuxqCaq9BryWjdwrCTi7XZXNqGhD
	yJ5VCIMft6qZMTK7eIpRyWHfR0v35RY=
X-Google-Smtp-Source: AGHT+IHMLBO00VkxK44FkpLxpJsl6IM4aHD11VX56mEuuu0kfh5k1FiogAxoL/RhBF1coyUXxAyfMw==
X-Received: by 2002:a5d:6e85:0:b0:336:18f6:aee with SMTP id k5-20020a5d6e85000000b0033618f60aeemr1217356wrz.48.1702235450878;
        Sun, 10 Dec 2023 11:10:50 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:81c9:b637:ed55:7895])
        by smtp.gmail.com with ESMTPSA id n13-20020adff08d000000b00333590f3bf9sm6893526wro.19.2023.12.10.11.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 11:10:50 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 1/2] cargo-update-recipe-crates: Use CARGO_LOCK_PATH
Date: Sun, 10 Dec 2023 19:10:45 +0000
Message-Id: <20231210191046.4785-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 19:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192116

Rather than searching for Cargo.lock, just use CARGO_LOCK_PATH, since we
have to know where the lock file is, else cargo_common_do_patch_paths
will fail. There should only ever be one lock file associated with a
project, so trying to aggregate across all of them makes no sense.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../cargo-update-recipe-crates.bbclass        | 30 +++++--------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index 8980137d02cf..59415ee8cb45 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+inherit cargo_common
+
 ##
 ## Purpose:
 ## This class is used to update the list of crates in SRC_URI
@@ -18,9 +20,6 @@ do_update_crates[depends] = "python3-native:do_populate_sysroot"
 do_update_crates[nostamp] = "1"
 do_update_crates[doc] = "Update the recipe by reading Cargo.lock and write in ${THISDIR}/${BPN}-crates.inc"
 
-# The directory where to search for Cargo.lock files
-CARGO_LOCK_SRC_DIR ??= "${S}"
-
 do_update_crates() {
     TARGET_FILE="${THISDIR}/${BPN}-crates.inc"
 
@@ -28,8 +27,7 @@ do_update_crates() {
 
 def get_crates(f):
     import tomllib
-    c_list = '# from %s' % os.path.relpath(f, '${CARGO_LOCK_SRC_DIR}')
-    c_list += '\nSRC_URI += " \\\'
+    c_list = 'SRC_URI += " \\\'
     crates = tomllib.load(open(f, 'rb'))
 
     # Build a list with crates info that have crates.io in the source
@@ -55,23 +53,11 @@ def get_crates(f):
 import os
 crates = "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
 found = False
-for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
-    # ignore git and patches directories
-    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.pc')):
-        continue
-    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.git')):
-        continue
-    for file in files:
-        if file == 'Cargo.lock':
-            try:
-                cargo_lock_path = os.path.join(root, file)
-                crates += get_crates(os.path.join(root, file))
-            except Exception as e:
-                raise ValueError("Cannot parse '%s'" % cargo_lock_path) from e
-            else:
-                found = True
-if not found:
-    raise ValueError("Unable to find any Cargo.lock in ${CARGO_LOCK_SRC_DIR}")
+try:
+    cargo_lock_path = '${CARGO_LOCK_PATH}'
+    crates += get_crates(cargo_lock_path)
+except Exception as e:
+    raise ValueError("Cannot parse '%s'" % cargo_lock_path) from e
 open("${TARGET_FILE}", 'w').write(crates)
 EOF
 
-- 
2.39.0


