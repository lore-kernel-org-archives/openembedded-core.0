Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC753C6FA8B
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 21:48:08 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.964.1663883286083355825
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rJi4L4X7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id t70so10484653pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=sLpxkl/VTbCJ53iVZPLLgMRlS76jPsZP9YJBEOrq2Pw=;
        b=rJi4L4X7M3a4AAf2XKIaQyufeLYTiwjoc+hJrbnsNeMXMWgbA1LmBgXm9ig5BSwOQ8
         UPNwfAN5t1Vgryz3/BRY3J8CgthMRHiuoKMJkhvjN0kk/lagwgTPUvITqus4gErGjiZz
         gXsW7FdlBWKNK8CXsnRYIYDvDICLmvRmEEwFdoh0ipqCq3aIzJ2NpNltcORhDjfLjj9e
         hUldqgB/grW45YSUKzFY4ewChBglNxZQvtDsZ7ylyv+Vd3NDrlvY5EASbi+UYxjvhXtL
         2ddZAM+fCSqpxXWGp6EVbEZvz1DQAHhjKGEUUu9BWuceGU0ExXnm1T6FG/i71FGLMJZK
         MhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sLpxkl/VTbCJ53iVZPLLgMRlS76jPsZP9YJBEOrq2Pw=;
        b=Nb4ULNY6UhxjGH6InaspnKhXosdIRcTmhFngAO7erj68+j2wLXaSrFItTnZfRo0Y0f
         mlW0xHMxfOLdB0KUAE99Dz5vJ6TQczDRM98o7t2/WW3zu4lPQTK0HwSeIMtotY6NuGKd
         GZ7bKBltZRbNoPrV5m8PtIXy0egNLauKbwB5BIKPZjfMmWCaxOxo+Hugjd3/84EXAxFh
         OqajCcLZ2MPjikxn7YNIYwDXrzBHA4y378nPy2/XksTlxU9zODTF/3DrVnpuYOdhA0eN
         4Qg0fXxS6Gau8yivM2rSkAAuRmG/y0cIFno8FB8iMKTWcr7TtM8ugvg5tlv3Qn5nKXKB
         +2Tw==
X-Gm-Message-State: ACrzQf2nb566EPLmFOuJpD0ki0mJNH6QEmHWmw2d8a9bfcefwU91AGYW
	CF/mune7HSCp71vvvjAkofzYS+4bnqJqi+/0
X-Google-Smtp-Source: 
 AMsMyM6CDRjXmQ3hRIX5KrR81R6ws5wHU5LD2lk8masxD6Cys1SXcmZwYNx5U9L0V3xm+1Q37EvrqA==
X-Received: by 2002:a63:fe54:0:b0:42b:d11d:1490 with SMTP id
 x20-20020a63fe54000000b0042bd11d1490mr4900244pgj.51.1663883285120;
        Thu, 22 Sep 2022 14:48:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a170902714400b0016ee4b0bd60sm4574813plm.166.2022.09.22.14.48.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 14:48:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/5] sqlite3: Fix CVE-2021-20223
Date: Thu, 22 Sep 2022 11:47:47 -1000
Message-Id: 
 <b42ea2b7f9149f9066662e95fd0159d7c3d1fc84.1663883154.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663883154.git.steve@sakoman.com>
References: <cover.1663883154.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 21:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170991

From: Sana Kazi <sana.kazi@kpit.com>

Fix CVE-2021-20223 for sqlite3
Link: https://github.com/sqlite/sqlite/commit/d1d43efa4fb0f2098c0e2c5bf2e807c58d5ec05b.patch

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2021-20223.patch         | 23 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2021-20223.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2021-20223.patch b/meta/recipes-support/sqlite/files/CVE-2021-20223.patch
new file mode 100644
index 0000000000..e9d2e04d30
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2021-20223.patch
@@ -0,0 +1,23 @@
+From d1d43efa4fb0f2098c0e2c5bf2e807c58d5ec05b Mon Sep 17 00:00:00 2001
+From: dan <dan@noemail.net>
+Date: Mon, 26 Oct 2020 13:24:36 +0000
+Subject: [PATCH] Prevent fts5 tokenizer unicode61 from considering '\0' to be
+ a token characters, even if other characters of class "Cc" are.
+
+FossilOrigin-Name: b7b7bde9b7a03665e3691c6d51118965f216d2dfb1617f138b9f9e60e418ed2f
+
+CVE: CVE-2021-20223
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/d1d43efa4fb0f2098c0e2c5bf2e807c58d5ec05b.patch]
+Comment: Removed manifest, manifest.uuid and fts5tok1.test as these files are not present in the amalgamated source code
+Signed-Off-by: Sana.Kazi@kpit.com
+---
+--- a/sqlite3.c        2022-09-09 13:54:30.010768197 +0530
++++ b/sqlite3.c        2022-09-09 13:56:25.458769142 +0530
+@@ -227114,6 +227114,7 @@
+     }
+     iTbl++;
+   }
++  aAscii[0] = 0;                  /* 0x00 is never a token character */
+ }
+
+ /*
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index d9e98c9120..ef12ef0db2 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2022-35737.patch \
            file://CVE-2020-35525.patch \
            file://CVE-2020-35527.patch \
+           file://CVE-2021-20223.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.25.1


