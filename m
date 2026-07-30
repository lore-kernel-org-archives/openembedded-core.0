Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC02C5516D
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 23:17:57 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.159.1785453472595952087
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 16:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=h7s8sVK1;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954afac04bso3359615e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 16:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785453471; x=1786058271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OjUcPO7yAkiIOz99FdJjrSOYDRX4rEZ47007go9hn5k=;
        b=h7s8sVK10Fmki9UwjgL0uYj6IcEjV8TV2WP9jaxg3wpY3FTos65u2Ge1tC1Tuyj3x/
         /1QXavtwb2oIvp4Z9c26ooYeydUXycFZG8IKXBjNvy2GX8uU7R1wMjFZzgGIklAbJ59Z
         KyZtGuUEmYbc70Ap5hY0mgz+mUovPysMCiLVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453471; x=1786058271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OjUcPO7yAkiIOz99FdJjrSOYDRX4rEZ47007go9hn5k=;
        b=SScZyA0eBZYMm9VCTMsjVO5MRrBD2KUpKQ2GOdqgFTpI8jCD1aTpdSyjwxUbBaNIOx
         TXcXuTlnCWbe13pnhXu+IzZecnmzNu6RkY/AC27pntToef9nXe0KZCSjK80RiZVninh7
         dkGFRgRqRV41t+RVTE8psI3psFDH3ASqvQe2dhC+q+x4VxughRODZdiSKt4cjaG/ZLxv
         vam8p+wCjZ6j/d6fQuqShk6eKRxhCNt3AqTroS5Ve8KYxHVrFEsqwNeVfCaTjCn5TUv+
         SWlIR3XDxOuNbpXrYscUk8/zMp4TgXMLdCEnXcr9BVQr4EQTcrrhfabrO1FtNPWn6wP0
         YV0g==
X-Gm-Message-State: AOJu0YwgyFNnDSzr+5314Ix6mbH9Lbj9vYWYjrs2alp//VdSNpuBvCtz
	o2975dcjrCFJz18pojJ9VvN5plv+WeNt17rnSKf7VEdyQBDiUw79et9qAB+PadTxduJh/FJoNnM
	73lbLJW8=
X-Gm-Gg: AR+sD11U6+n1D0oM/ipCeLhCwFglShLAP42E1fB/HMSAUyCIhGNPVYU5gT4x5p5LZmd
	FZCOhDwtlFpbqYYQ/STBe+3jRrlr/8ZNnMnbUKvnjZA9NprAO8r7O53i4MwUXlevwKHl5qcnzxV
	Oa7jdhlwhn+I7YN/vfx40UA5ruMoV08I2f9Mo8zZ7KY024ipPHmpYpuH/o0Q7kD97LCo/RMnYRs
	1y7tbESi3OjqMpLi636TLVYgyuRO50aAQ8d9dukVwvhZnrf0b3Hvub4qgogd9fgv/wfSKQYKuZW
	26dhoLNCIcQ7WuXz6kxy5hLcCT7zxCLGftmzYxTXZ/Quab3pIgpjlhCxleAp2I1/NZQ1fywJ9sO
	He+pmfeN+sflXWkGRrNlm8isPrC1HF2nHVMIgTpo+jBkr4QkUg/sTc8Hu68mhjJh3ccm1UgsUFx
	vv1H9SxBbJX5AgKzsteJb6cFsR7BFgcv+KGlJzoBRx0pXtvA86x6Yp47XYzDj3naEUiAe+39u8R
	oxgTgKLvTPCW3VvH3PMKn8GMe/McS8roJW83y0aeB+Clw8QcgKSCUjTOleHKA/P
X-Received: by 2002:a05:600c:8105:b0:495:641a:bd3f with SMTP id 5b1f17b1804b1-49800e7afa1mr65292205e9.13.1785453470621;
        Thu, 30 Jul 2026 16:17:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010a0ae3sm100670755e9.9.2026.07.30.16.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:17:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone 1/1] cve-update: Avoid NFS caching issues
Date: Fri, 31 Jul 2026 01:17:44 +0200
Message-ID: <9687b9409d3a1e121f0f04de856055764d0a392e.1785453214.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785453214.git.yoann.congal@smile.fr>
References: <cover.1785453214.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 23:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242386

From: Paul Barker <paul@pbarker.dev>

When moving the updated CVE database file to the downloads directory,
ensure that it has a different inode number to the previous version of
this file.

We have seen "sqlite3.DatabaseError: database disk image is malformed"
exceptions on our autobuilder when trying to read the CVE database in
do_cve_check tasks. The context here is that the downloads directory
(where the updated database file is copied to) is shared between workers
as an NFS mount. Different autobuilder workers were seeing different
checksums for the database file, which indicates that a mix of both new
and stale data was being read. Forcing each new version of the database
file to have a different inode number will prevent stale data from being
read from local caches.

This should fix [YOCTO #16086].

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f63622bbec1cfaca6d0b3e05e11466e4c10fa86e)
[YC: backported to also fix [YOCTO #15660] ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/meta/cve-update-db-native.bb   | 9 +++++++--
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index e042e67b09a..d6a3cf0dd66 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -64,8 +64,13 @@ python do_fetch() {
         shutil.copy2(db_file, db_tmp_file)
 
     if update_db_file(db_tmp_file, d) == True:
-        # Update downloaded correctly, can swap files
-        shutil.move(db_tmp_file, db_file)
+        # Update downloaded correctly, we can swap files. To avoid potential
+        # NFS caching issues, ensure that the destination file has a new inode
+        # number. We do this in two steps as the downloads directory may be on
+        # a different filesystem to tmpdir we're working in.
+        new_file = "%s.new" % (db_file)
+        shutil.move(db_tmp_file, new_file)
+        os.rename(new_file, db_file)
     else:
         # Update failed, do not modify the database
         bb.note("CVE database update failed")
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index d50d9a2ceaf..f9d265479d9 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -83,8 +83,13 @@ python do_fetch() {
         shutil.copy2(db_file, db_tmp_file)
 
     if update_db_file(db_tmp_file, d, database_time) == True:
-        # Update downloaded correctly, can swap files
-        shutil.move(db_tmp_file, db_file)
+        # Update downloaded correctly, we can swap files. To avoid potential
+        # NFS caching issues, ensure that the destination file has a new inode
+        # number. We do this in two steps as the downloads directory may be on
+        # a different filesystem to tmpdir we're working in.
+        new_file = "%s.new" % (db_file)
+        shutil.move(db_tmp_file, new_file)
+        os.rename(new_file, db_file)
     else:
         # Update failed, do not modify the database
         bb.warn("CVE database update failed")

