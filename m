Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C45CCCA491
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:47:39 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.7352.1654699650641785798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GUB4JEKq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso23985236pjl.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1U6O0970yR015m6Lh4r6ilbUUrdUMV8OCaew+Gvjjaw=;
        b=GUB4JEKqbKJHNcdu7BLu5NLQw+4TlGFCwYqW8MD8NJdMP3UPt5tpXEz2vaBPIWL+3Z
         61K9ZZMe4NDOsohCOWAL86bm3oDDFX1fZCCI6QkeYo20AmRxDEIE7ZPf1WiBHvQ0WbIJ
         ah316Yy62shyyh+lY31OaEy4HQGVlsac5Noz2tN9RuZ6u+Lrk0h1l1HNbGaD+W6WH+Yh
         f3KDk5LYAdbRS+7w1Jeys/AMIJczWjzP/Xy3j8HBCMMAQ8aCs2+PWP+HHMT8due9xhjK
         RT5dxURt6/TdXsCbthUIjtfydEzG/Lyqe9rjk4kczSNeKS2KUXMTQvYq3zrzkNuw+zxg
         xjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1U6O0970yR015m6Lh4r6ilbUUrdUMV8OCaew+Gvjjaw=;
        b=lfhCjNTWDeWYSwhh51OF3Skz4LivqV1jHm6I3RRs5rJVOB0M8j69MOzy+QKpGqaUwT
         nRxGoECO9KYYx+HmUF+0i+t0ZMslVhHJav5SX6Ootc3t34oIm7WZfhIsE60fzXBVf7lH
         JkiENsAS0dm3wHOqaIGo7jSy99Rk0KeN/M1EKi4A2DQQBXJN+9njYxDcayEMZli2rr4Q
         JdrtDvXwksGv1BbdKlEPYW4UxYt0/yjhTZtx6L5h2j5Yd0HMEqkjDq+i1k+0R9oC1cFR
         WG/xtFIF10dTG0x7QEVB4IQ5e4LfS87o6p36blwiVgzpPtlnpM5hBZ3fRCNOss800zJr
         DkCA==
X-Gm-Message-State: AOAM530awotEYJiye2wVBwi6ymWxWZXuZ829NWXNllAs8tw3SnjdN9Nv
	+pA+Qcjz5BgnEd0eLVs9glN6zsLwJysl0xra
X-Google-Smtp-Source: 
 ABdhPJxH+CymXgSp5w6ZqD1VkCwvgc7Y7lWQflstZcQsLUDzZrLLypMF/rSpVO4w0HFdnl2+slQIdA==
X-Received: by 2002:a17:90a:4a0a:b0:1ea:2f87:3e1c with SMTP id
 e10-20020a17090a4a0a00b001ea2f873e1cmr5816214pjh.177.1654699649699;
        Wed, 08 Jun 2022 07:47:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm16709701pjb.37.2022.06.08.07.47.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:47:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/14] cve-update-db-native: make it possible to
 disable database updates
Date: Wed,  8 Jun 2022 04:46:37 -1000
Message-Id: 
 <487a53522a739b9a52720c4c40b93f88ad77d242.1654699348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654699348.git.steve@sakoman.com>
References: <cover.1654699348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:47:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166748

From: Marta Rybczynska <rybczynska@gmail.com>

Make it possible to disable the database update completely by using
a negative update interval CVE_DB_UPDATE_INTERVAL.

Disabling the update is useful when running multiple parallel builds
when we want to have a control on the database version. This allows
coherent cve-check results without an database update for only
some of the builds.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b5c2269240327c2a8f93b9e55354698f52c976f3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 594bf947c8..a49f446a53 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -14,6 +14,7 @@ deltask do_populate_sysroot
 
 # CVE database update interval, in seconds. By default: once a day (24*60*60).
 # Use 0 to force the update
+# Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
 python () {
@@ -51,8 +52,9 @@ python do_fetch() {
     try:
         import time
         update_interval = int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
-        if (update_interval < 0):
-            update_interval = 0
+        if update_interval < 0:
+            bb.note("CVE database update skipped")
+            return
         if time.time() - os.path.getmtime(db_file) < update_interval:
             return
 
-- 
2.25.1


