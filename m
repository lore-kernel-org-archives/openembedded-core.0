Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6BDC6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:17 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.43525.1676990474552571898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qWLBLAtb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id x24so2709852pfn.7
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LzYi2SzAV+hQcYeSTSNbrhtogzYbWe8uRslCp8SS68=;
        b=qWLBLAtbRfnQuhLTqq8McwYOJ0MMknSAldn3rKg9GsfRLknNE7xNTax2kJQKbuNLjT
         Sk50zKs9aWnX8JxwpzWztU8cPCjJx5U70sqnCRVe2y0I+kFLR9neqnBuxRTYZyJmt9JN
         FEbaXWgX8rSDbY+CBSOSkm96o+15MpB3YL7rBfFspFVgf4hm9xK4KtXJSe5pXKfyG2xQ
         KJvCKzHKJVFcJndHJ9wjZTKONDovzF0DWadK0gLLsWNnbKR3zBANPgN/69zbsyBBJfJ7
         jgO5px/v8imm5bh7zj0zJStZhxGYQigN0JsCLuHbaZ0725yT9ny9wAXYyYDPQhdauwYr
         kXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LzYi2SzAV+hQcYeSTSNbrhtogzYbWe8uRslCp8SS68=;
        b=XYxqEtJxrENDVQfUMu/duLkkSDG1iHWPBfTdyfpeRL2ip55BdHlVjmnCBXCqModgns
         cYGv0CInLYNt9ImOWeGQuCsWMCUTzKahuRX/8+KPZz8mUqO2ALM7JkeqSSxCcXrJ/2GS
         KLn93bcowQ6/K/bp/XCQfVeD8EeEJwJKYOA33CjCQteionZbod59D4oircJXwGdG+4+8
         wKs1o/5ffYRDRSCpWWvn42l7Vv/pjf5rkoV4K+NH29LxLrfj86/8sahpDMMxOKZt1FD/
         G5Pm4cQGBDnxm6QZIXIzCy23vyzixLYQ7/HneTNc3Cj3syeA6cLrWv/sihmjewEu6NJr
         L9CA==
X-Gm-Message-State: AO0yUKVy/gWvsVNzb370njdK8/IM0gxi/FSlaaECp1UdWaAXgrAhUEnA
	R+oChJH9sEiNqs4Vr9LAsFU+S//zO4QcaqmseAw=
X-Google-Smtp-Source: AK7set+s5zULjt2GhyB9zomqZGJzD0OxOmC0czgK5v5dJfWCGi1bN9meeQLIQ7BQoWY+wt2XPakfRA==
X-Received: by 2002:a05:6a00:4ac4:b0:5a9:cad5:b283 with SMTP id ds4-20020a056a004ac400b005a9cad5b283mr4339552pfb.14.1676990473443;
        Tue, 21 Feb 2023 06:41:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/23] tar: CVE-2022-48303
Date: Tue, 21 Feb 2023 04:40:44 -1000
Message-Id: <231360a55bf1b96d6bb1cf94820b08788677c58b.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177501

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


