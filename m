Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D619AE67497
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:56 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68800.1766353068914840546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IbQeu3FF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7ba55660769so2635060b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353068; x=1766957868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldZUvdLjyG0gT3/3b8KphIq7frlXhwTWLvUXVvHFm5g=;
        b=IbQeu3FFY7DtJs7TmQDLqwG1nvk6CXqsH0EwzGyF8z7UK+K/9RHZZ2/ldb8sr0H6Re
         15KraCQ8RCZ9sNFB4OcTc5UaKshJgHrKAkYq5daLppezT1sQNNBjC8cXjSrjDtybMyS1
         uCKWh1jotubBIvAxWudVMc4WWHmHVb1SwspLzL0uV8dDZsWlVcog2X6UKk5iquaAYtCV
         A8J7IblE98bHRe0yzzNyIyY3EEHz1z2G1hWG0B/m8Qdsu3JufVXJGPM9JcxG+qxiyrXR
         VMmnEDhNy7FwUJmnq8OIP9f3ZqdD2RIwmEhWVUKrZThaIUynK7lTkhKPP8Q6iBhwOoNR
         yGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353068; x=1766957868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ldZUvdLjyG0gT3/3b8KphIq7frlXhwTWLvUXVvHFm5g=;
        b=Qg1gaDr6j8SLiaTXAtB0kuEYabueaKNSvNi7HXl4N4PgKIRQlbmU/rbo5F+kY60I8d
         pW/S+n1LRHR+CILNUf30Q8Y5q91/58O1d5Enn6lUr3+7X1cT5jr3tsCCe4E8HIqLn0RR
         /UoelXOnMhL0xla0FeCfwAZReVTVNb3h4d3+RGfgZQhW5tYRPqPVYg3XjYTBsPazP2j7
         2Xq8GQl5Py789WeiIqobsYKaAtbSK9gIZSViSdtC+lhP8ESwbyQZ9LJKe2Z6P+X/yohF
         EpD65SFj9yMLpUq+FxyXXhEY9CcEZNtlggBjYIl38KQcqjg6kcde3apBznhSNpp51F/T
         RbXg==
X-Gm-Message-State: AOJu0Yzk3c30E4/7n6LXbz8Y8hLqu7a0mfzkghVXjWQNtShBqGvChzRh
	hOKBNk8okzReZA/+z3cJgJlYROJ7q3UwjVAImB9nT0/G82ckIKVdVUa9TX6ZJR1wzM8TQzcAPaq
	fhAv6J7Y=
X-Gm-Gg: AY/fxX5+5iXP00pZAd1L8R41hdH8vUx1nmrS/1HtM8xfaioYaBsG4aiu5zsgCKv5uY1
	G2urPtMd3rXL3xX3iCrJcsw5zZIXrcQ0vhVtpdANmtwUrdqj62YVFYj0E1JbinITU85fL8txLp+
	innXqlNbjSjOlyjgnvkYqXPbKG06Jmj64G1sLaCKmR40yeBozVI/IqIvySBkvrakPP0Vu1ZSU31
	+bEJlFC/1wmxZnoHisN3pRhqQmEi6ligcW1emnHFg9lhk7z1ufZ8Ikigftg7sBOGnFASEg3gm8b
	X6lNs6aItWqBqB8UHV/kcTvIbBU643v5ilr88hTNvSaohe9Qkn3zmTJJHeNqU+vReETf1slBuJn
	/kZQrbSsdShlrh1DP3lTWl2GugvnXoIr+38VqNIaa6W04A5f35dx5gEhrtylgVKO41Mzxqq0pJf
	pT
X-Google-Smtp-Source: AGHT+IFRGsCBC6Xg+qpHZnluUuLsYnmwbvOumJKCtnVSapHPiCBkxeKZUIwrdU5USGCEFP71tlIj8Q==
X-Received: by 2002:a05:6a00:451c:b0:7e8:4471:8c6 with SMTP id d2e1a72fcca58-7ff66277f50mr7951082b3a.39.1766353068094;
        Sun, 21 Dec 2025 13:37:48 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 16/18] cve-update: Avoid NFS caching issues
Date: Sun, 21 Dec 2025 13:37:09 -0800
Message-ID: <7f02b3f811ad3c289fb0d3cb119950dcb67e6410.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228274

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb   | 9 +++++++--
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 3a6dc95580..01f942dcdb 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -78,8 +78,13 @@ python do_fetch() {
         shutil.copy2(db_file, db_tmp_file)
 
     if update_db_file(db_tmp_file, d):
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
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index abcbcffcc6..8c8148dd92 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -93,8 +93,13 @@ python do_fetch() {
         shutil.copy2(db_file, db_tmp_file)
 
     if update_db_file(db_tmp_file, d, database_time):
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
-- 
2.43.0


