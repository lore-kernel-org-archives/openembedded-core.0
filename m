Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2D4C74A5B
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:35 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.8621.1678229309831789921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ML7UPmkG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id ay18so9116078pfb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaNQM5Lx8geW+XiJ0amDj822wZPb8dukSiicOU/oVW8=;
        b=ML7UPmkGHdrqcmY2BAfOyKnTppv+av+GzUY5gEzsAWlFYPzQWpHxTuvGzw6Og4eTxz
         GvM4wbVJR4tcpGQID6IRy1p6+8o8lWEwtml1k5nhouSB0b+UMEE3OIdKii6J/EXUd9RF
         /Qz8FRdUbua524KsDpGJuIeF5DjlQ678J73u2ZIACec6BWc/co3E/rWR4bmiuAwtB5fs
         YG0xaSAXsCpiAcpytKeItXQ6ilaaNHQtGdcqvK2gIYlf8m/tbH7k9dgOxnAmixH8KOa2
         fvcj+EEKqK8/aJfl8/wdTErCrL2C8NuXh1IR1Gyc8BiGPnvq2yuDF+WaDB/r5K5XScib
         PzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaNQM5Lx8geW+XiJ0amDj822wZPb8dukSiicOU/oVW8=;
        b=dt03pbIVwGi33xsNrCr7FHF6HC/1glmj9axdzG+o50GcWHHYV3vNSNzmXXRnCaDDKG
         IbFj61Wyn8sAGe0vLxpHb6rvg4iry27jCL5U/bnza399VZNVaifkHnWpGEfhiSDAhMLY
         RdsBxGIgbeaQxFyWF2aOeSFROvccNJATx8Qvnt0hTt6U8Vwf8oOzJaz2uORyZC0wNwEN
         htYaOZ/IXFEz0oJ2tOvkM8iiKiWwl/UK7Y/W9yTfo73gCWsZV3L6b3qckE2ISD5yJWpX
         ARGd/kMaNAgnKFQc5hKCOywpPBAJaBDVQ1/XdCTCQmWM6GI9SetlI6goLp8jRaU7h1Dd
         qNAA==
X-Gm-Message-State: AO0yUKXO3fFtIdWSjSSjzSpM+Tovce5J0M6AEJwJHnix/HNkqSK5iohs
	zBIQsPKL3L/v0im+QIK1MxV12FmC4lCzFhZBN9c=
X-Google-Smtp-Source: AK7set+5tvjh+0EQcwMYQxKGNdc2O6v+QZ1vr3iBKrW4WdiTfacYczfij2rHX/ayh54UgI6Xe27OEQ==
X-Received: by 2002:a62:1c16:0:b0:5a8:ada1:cc6f with SMTP id c22-20020a621c16000000b005a8ada1cc6fmr12554512pfc.33.1678229308715;
        Tue, 07 Mar 2023 14:48:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/23] tar: CVE-2022-48303
Date: Tue,  7 Mar 2023 12:47:40 -1000
Message-Id: <af77a413db59863a898c32dc7536b680473ae9c5.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178128

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


