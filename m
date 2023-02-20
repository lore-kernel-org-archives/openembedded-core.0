Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFABC05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:18:40 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.14045.1676902719910757701
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=S3VQBX17;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id u10so1471029pjc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LzYi2SzAV+hQcYeSTSNbrhtogzYbWe8uRslCp8SS68=;
        b=S3VQBX177FffthP3WfEUmIfUTc2fHULsZmNqcnOxDgp5+n2EmVEKRb+6lkadMX/OOh
         3xeQaEdMylf4o7LgxAI2WsORWPUyF2S2j6K6kEYzIlefKmBD82ne0OIVNQ7RYv4IyNLJ
         hrM5e9WbAV6Dy2CqMsfGV8/B2rqh6qgE/OOwEIHKXR1LC56LCYCJyF/vYDi0rzqtXFv+
         rCufJ+Z3QIA3jSMlr1E/N7nzKTgH4DoQ3Jbs8/cbpY4G7ltR+LXcb7ELmJrb5uN5k9TD
         jn2j+gcxQXwddV3f7z68e3LfZHWCjlgtOfId2N2XjRdENmqNDGNJEurB+k+pRGzA9gAX
         kyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LzYi2SzAV+hQcYeSTSNbrhtogzYbWe8uRslCp8SS68=;
        b=NJj5oFZoH7w28OJgEeknWbZHxq8Pcs47hMVNHmCmWiEoynFWISBRfUUITzkuQXjhs7
         ugYAYC0aNUsCUg2EEllWMIl3qRwgI6rlDLI3Fz8ZXfIq/5RO5FPdkys1V14FPa6eCBSS
         5njYVQO4X2fyvINWIAkCx7oMIadYFka63E7Nkx/2cl36oNrh8FVtGLxR3WcxGoxa8e2G
         t4/NIIdaSFPum1+LwYp+jd8Vz8ovqN9qizz/4tww/N43kOAZEeiCoMG/716tttfSYslc
         X51A3kpsoiR7SatNmcuZ2TLnAB/ydCrn2cs6sFO2P3iAZc0tDbKFioNY9Qgs16VjMThj
         tNEA==
X-Gm-Message-State: AO0yUKVuXMa8K2hxBAp8hSvJNBzB1D0cKk867DhYXJRTclDRVKsu2drU
	gylxK0nZORkU30nn59+I7ehMRfTV86WN2QSakVs=
X-Google-Smtp-Source: AK7set/X5CWum9xaavx420MJEXDA3GzAS4ucmltzUqQmb0Gf0sa0gGlxfNW9D62auabTUVtjJeA3Bg==
X-Received: by 2002:a05:6a20:698c:b0:c7:346b:71a9 with SMTP id t12-20020a056a20698c00b000c7346b71a9mr1736727pzk.27.1676902718608;
        Mon, 20 Feb 2023 06:18:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.18.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:18:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/22] tar: CVE-2022-48303
Date: Mon, 20 Feb 2023 04:18:08 -1000
Message-Id: <5223319b43811228d83c2bdac3e542b9a8852dfd.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177407

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

Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../tar/tar/CVE-2022-48303.patch              | 43 +++++++++++++++++++
 meta/recipes-extended/tar/tar_1.34.bb         |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index 7307cd57a2..1ef5fe221e 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -6,7 +6,9 @@ SECTION = "base"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
+           file://CVE-2022-48303.patch \
+"
 
 SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
 
-- 
2.34.1


