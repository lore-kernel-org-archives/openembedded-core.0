Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00467C55167
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 23:16:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147.1785453414372002400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 16:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ox/I7W9r;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495590dde14so2395615e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 16:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785453412; x=1786058212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6pdFCAF/EpiwrcYrzDSPWIvl5ipxZ7tMrDc5lxWDwo=;
        b=Ox/I7W9r1/wQqIl1Jg8QMj7aBiso4Envkx7gYAlUg5Qj0fCU+w4Pp1tzDNgRpqm8co
         z/VmPpHwa983UOBdG5feMpKCteLQGsbW9HF9u18QuwvFt4OE7MOPq0p8qo1nb9KM4oga
         W3bpC/YV5Dku3bOqGBinmjqKUUvJqYPyslj2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453412; x=1786058212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6pdFCAF/EpiwrcYrzDSPWIvl5ipxZ7tMrDc5lxWDwo=;
        b=Il9HI+6cSL2vtkmGyznBlDmYlwM1hR0VZVL2FmGgQzbSxUETKa1rBAR1aa26+dXQFV
         COC6YiuyY0I5MX/7NvV+OcZCZSpWr4mdfYuMVC7Ixi/ysLOU0w9bxF/KY7cp257VY6KG
         jYFuTYOJuR/0sMcalZYGRXTkgEcqS/LxLzgjTxvZhR1TIscO6B/V0HbHr6HsYlTFv8Aa
         fUnobS3GyIDEPoWu8tqhs3tdr6qvD9ASCrOho3Sbqt6n6IFn3qEKGOpAnI/Ay0kNJGqq
         zMncY5wX4y7YGrulz/Wd2KDJQ/Njmqh5bTqbzwNRrmvPqiw5Ev6YJmEEVMyB2B3QJGbq
         rYBw==
X-Gm-Message-State: AOJu0Yy2fLrBAjDhjyaf9BhBPJm+KnHPVW/dE6BJ7FtH8OvTxyT4x1s/
	N1WntQit5iGeMNA7m5R3IMZlTkgQjkXWTSpMzOajwq2yd0IW9eobQ2UDGPZyTKfsA4xaXdY2XP2
	+39kj3Js=
X-Gm-Gg: AR+sD13HwrXi1GZAXfTcJ4PcZr23FuMRVjnRz7ciBB2Nh6apb9mR7ppTh0hMLH2bLha
	jLRKRoInUnYyM+pATbdq1PaR0CGbQLq1rHOktGZ9DzI7QSihFtCiRrr7ye1bV6kFF5Lp43C4FKr
	noYGjDhrxySTRau/QvdUd25c98eBY7MGF1VlIywqqsPz2OixaKYw7imor3K7ofKFIMzbF6nWEFz
	muZzq7Hw47zs37Qciwjs7DQrsFPCUTV8cZ0tRyQ5dWSeQtGxmuLYq+fKjG9LFj8pQu2NSq0D4Eb
	RZ6P0od7tgPPRw61wUOppqTFHiQDuEdXyrlgdoa0hvkTzZknmAirZh9FaTQuMcJfP7ZWdO4n522
	ocRAwE9omPvbe9kbKWCPwtiGgclthjGwYp2JhKrmz7wC/wazl6jziSoJuLSs4Cxa9oBQ1er9k7I
	AtNB/hSR0X1FuQObcN/qKYma/Xbo8SO2M76ecGmdR4fPz14CfIf92+k/GkUdqETbYawGvabDs7d
	4NDzw/44KCh7/Y0J8VLlK6k+MbfIXxeH/2NgkNvJN5Qml2Gxx3ekbl2Dl7kfnOh8c6eHwPoyS8=
X-Received: by 2002:a05:600c:3b8e:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-49804c532damr33875035e9.24.1785453412621;
        Thu, 30 Jul 2026 16:16:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498062fb5a1sm6423525e9.3.2026.07.30.16.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:16:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone 2/2] cve-update: Avoid NFS caching issues
Date: Fri, 31 Jul 2026 01:16:23 +0200
Message-ID: <1e668895f80725cb4102d000c879d57464757cc1.1785450470.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785450470.git.yoann.congal@smile.fr>
References: <cover.1785450470.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 23:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242384

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
[YC: Fixing [YOCTO #15660] ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/meta/cve-update-db-native.bb   | 9 +++++++--
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index efc32470d31..4255b125bd7 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -63,8 +63,13 @@ python do_fetch() {
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
index 4f96883beba..e4628fca027 100644
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

