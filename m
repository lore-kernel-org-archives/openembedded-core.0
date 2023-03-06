Return-Path: <rak3033@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB793C678D4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 11:05:13 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.30642.1678100707139676200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 03:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uv20hL5M;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: rak3033@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id c4so5507935pfl.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 03:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678100706;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPPf/kseG4cKVh8qWiBE99GXnTCwaOPN43Klz0KT6L0=;
        b=Uv20hL5METd12uRoNNM+SM9BdDmNNHMLWuglyEWAICUXa1GIak57/r0uU6KLhDhQ3X
         QqRYSEx48QSZnpWld/PtXgGq+tK0oRCsKDdx9+oddF+EDGBXxBWf+9ZXvNqh4GwQHSQn
         dfUyI8shXU6i7mXKWfqSI+yMEmfGpnPKya+XPS+3vsuIv6Y16O+4kR6PG+ih4VsZdIDe
         jE5te2G0ws4QunZeFIHqYfIdNuQQhIH3uuSzlQWczbzpGP8g/y/jX4ZcNgsd6Sl7uDVw
         yb1XFxlkOj7fZpX+a+MvRc/wNnjkGWO5yiGGOrL9Vooj0pICzZ9RXRG87CyclmFww6/c
         n6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678100706;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPPf/kseG4cKVh8qWiBE99GXnTCwaOPN43Klz0KT6L0=;
        b=MGH4yhkSR4qD8UwYbT8/ZJUZDnjnetbLme9BxpZK0CsJ8sN55fL+f7Q5Vrj2GBQAWh
         3FpDhgjFQE0f/hv80pR268p6ijfK6TfQ/FS7/voE0I//ITvm6B0OJ2mCqg7lpfO30MOG
         ETv8PwPAK07tzkDUB+61lyPqPHNycBP3Ph3dsZNyi955bcE5IWwKdYKVTa63s1IBh8PX
         IAY+0NgggbiHQ2P2RwixuwnNHghjH+xN6oFJArtl6jakMKY6rx8s97WL3WxUZWex/R8D
         QIvv1fU7kGaVNbSF/E0YbHC18b1qXkhBwM6XIKv5zYhnWZRtx4niwJaaZhnSBcC5ilNm
         B4HA==
X-Gm-Message-State: AO0yUKWBgjzEslQyuHrhmMcTYI2mdA3cPVUoGeqLlC6OANEZlpr4q6ec
	BzSw8q0htdqO60zwAZ/urNR/h+3uEcrgJnEk
X-Google-Smtp-Source: AK7set/J5/zCvbvt0UwcMY2OsNNDCNZM+V3qPRv/t9IA4LF0WYHav7q0xAlFNfpZy2L0y0By+UCL6g==
X-Received: by 2002:a62:19c5:0:b0:5a8:ba74:7a7b with SMTP id 188-20020a6219c5000000b005a8ba747a7bmr9218400pfz.1.1678100705817;
        Mon, 06 Mar 2023 03:05:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d00a:6133:7037:a8ae:d1e9:8e48])
        by smtp.gmail.com with ESMTPSA id i5-20020aa79085000000b0058d54960eccsm6055355pfa.151.2023.03.06.03.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 03:05:05 -0800 (PST)
From: Riyaz Khan <rak3033@gmail.com>
To: openembedded-core@lists.openembedded.org,
	rak3033@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	riyaz.khan@kpit.com,
	Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>,
	Joe Slater <joe.slater@windriver.com>,
	Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Riyaz Khan <Riyaz.Khan@kpit.com>
Subject: [meta][dunfell][PATCH] tar: CVE-2022-48303
Date: Mon,  6 Mar 2023 16:34:38 +0530
Message-Id: <20230306110438.12130-1-rak3033@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 11:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178068

From: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>

Fixes CVE-2022-48303 by checking Base-256 encoding is at least
2 bytes long. GNU Tar through 1.34 has a one-byte out-of-bounds
read that results in use of uninitialized memory for a conditional
jump. Exploitation to change the flow of control has not been
demonstrated. The issue occurs in from_header in list.c via a
V7 archive in which mtime has approximately 11 whitespace characters.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-48303

Upstream patch:
https://savannah.gnu.org/bugs/?62387
https://git.savannah.gnu.org/cgit/tar.git/patch/src/list.c?id=3da78400eafcccb97e2f2fd4b227ea40d794ede8

(From OE-Core rev: 231360a55bf1b96d6bb1cf94820b08788677c58b)

Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a00f15354084cee6b2183fcdbfdfc7826c365da)

Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
Signed-off-by: Riyaz Khan <rak3033@gmail.com>
---
 .../tar/tar/CVE-2022-48303.patch              | 43 +++++++++++++++++++
 meta/recipes-extended/tar/tar_1.32.bb         |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2022-48303.patch

diff --git a/meta/recipes-extended/tar/tar/CVE-2022-48303.patch b/meta/recipes-extended/tar/tar/CVE-2022-48303.patch
new file mode 100644
index 0000000000..b2f40f3e64
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2022-48303.patch
@@ -0,0 +1,43 @@
+From 3da78400eafcccb97e2f2fd4b227ea40d794ede8 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Sat, 11 Feb 2023 11:57:39 +0200
+Subject: Fix boundary checking in base-256 decoder
+
+* src/list.c (from_header): Base-256 encoding is at least 2 bytes
+long.
+
+Upstream-Status: Backport [see reference below]
+CVE: CVE-2022-48303
+
+Reference to upstream patch:
+https://savannah.gnu.org/bugs/?62387
+https://git.savannah.gnu.org/cgit/tar.git/patch/src/list.c?id=3da78400eafcccb97e2f2fd4b227ea40d794ede8
+
+Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ src/list.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
+
+
+(limited to 'src/list.c')
+
+diff --git a/src/list.c b/src/list.c
+index 9fafc42..86bcfdd 100644
+--- a/src/list.c
++++ b/src/list.c
+@@ -881,8 +881,9 @@ from_header (char const *where0, size_t digs, char const *type,
+ 	  where++;
+ 	}
+     }
+-  else if (*where == '\200' /* positive base-256 */
+-	   || *where == '\377' /* negative base-256 */)
++  else if (where <= lim - 2
++	   && (*where == '\200' /* positive base-256 */
++	       || *where == '\377' /* negative base-256 */))
+     {
+       /* Parse base-256 output.  A nonnegative number N is
+ 	 represented as (256**DIGS)/2 + N; a negative number -N is
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.32.bb
index db1540dbd6..1246f01256 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://musl_dirent.patch \
            file://CVE-2021-20193.patch \
+           file://CVE-2022-48303.patch \
 "
 
 SRC_URI[md5sum] = "17917356fff5cb4bd3cd5a6c3e727b05"
-- 
2.17.1


