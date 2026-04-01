Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03EA1076374
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 06:12:42 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6663.1775023952935530992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 23:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GxK7P4Us;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c66eafc1easo5150185eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 23:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775023952; x=1775628752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3MPVajDjOSSgkaIRL944UT2VW96LETFncpQUOiAuqqY=;
        b=GxK7P4UsD0XA9QhYt+XtOLeCUvfFi2mDmzi42BiL+73w4+RlUtlLycuy78RNmbWxpN
         KdAstbGP+pEnaXGkqWY9n+a9v7eA1ZTMnmS4gbJxWTi7ZO1eV7JBmGuIwitbDH+sqHFH
         mx1jaeZkmuEj3LS2iwXZWD8jFfJ/eaIwXRueD2LtKXAgcbiWm8j7jXVH5VaMRTcvo1Q1
         /Pa5g7TIMKPXjkUYdfGV/R/iNR+zl8YAgSXNBWOuQzw7/avt3u2uGV/go7vCMut6xsMY
         fU9qrZEDjRry1oLN/y4e8mFzTZhCYMZurhdarQfhJoXd6VeOEwafprXNfMrJXaciISdp
         RBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775023952; x=1775628752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MPVajDjOSSgkaIRL944UT2VW96LETFncpQUOiAuqqY=;
        b=FzThgD8osZf6hR78tnwirwyHLP2NljROXfzc0yaGJmJn7MHvAqFSmRyBYjfaIhnR7o
         m6PHm0SBrWPuoY4r84xuQBVc8zJCOxTOx2JhM4P98k62/acL2ShrRu4kQYhbjXo9THRX
         LvQYx4Q8xKSjAiWfGOCFQClf40U9DWlOwEqe5kpa5P0YjOIVsGgEVFQr+kfWp2reyd5N
         F7Z183WKk5SYJkjuxO8oSZzQhzsBy8C5kquvEDk81Ht7iECwgEIm2+0Et0FWjKLp9Mjd
         nJH4sQ4t2E57tfCPq6JQm5m+r0sAOJrmqjuEtoX4gIAZC54ISqbQMoimdA/NKEjtCoKq
         F4ug==
X-Gm-Message-State: AOJu0YxnBMPyMYoVx/fgfv6DSLbOWQCCbYoB41FmTlu9FUX8iuN+9doR
	fHTF/VFG23hSESHOXwg7gj+bDIICr7af21f+ozN9bTLdXNiq0an9rlWFWmKCZ4v8
X-Gm-Gg: ATEYQzxZBivd46aTMaL8gMr3LF1L0XIbX7MxZgdU2Uadw1aTe/csGYvCUXIcsGk6K+g
	d7plNgm6PDxloftyaW6On9vwblj6Zia889osBmeds4idy26h7y9onU2NDcjyYtt4rrYKd7VF8yt
	CehXgmDiSym12THX/DFz5PeBi6bd4vDryE4hr2v+q5busWjrmUqcOJqY+6z5z5vdCUI1SySh27v
	mVSMciWa9nPOsCom/j9b/tc16tCxjJ3ljf4NXDmYtKjUQdNbHTnIH24wIjvTBX/i2rZpe9HmM/v
	eyLkOklceojk4PZ9UAnlOutZRdRJI1Zv10HhH8pdQYPpqrt4RbVOHb34L03qrsdpOxUejaff8B2
	1JRX4EbCHLkjwHdknP+F2Zcn7VNwGgGTXRbVZiMALwf5Qj1Iq18HlFVmhdrjn27dUZjlrqLSNTP
	jyfQKT5FyK6Smuc9c5/3Gf62tbKYoCRtSr46OPiUDrIcMgAKjTxSwPxKGCL/usooYFOp+6u5Msq
	DYfRmGh64YXBj2N9Y6Cnn5wsrBevoCk+i9uUev2OsGoUHwZ0oFHrQBROrUv4sUh+8HQo6c=
X-Received: by 2002:a05:7301:1e84:b0:2c5:3b87:2ff0 with SMTP id 5a478bee46e88-2c930e6c555mr1333220eec.12.1775023951912;
        Tue, 31 Mar 2026 23:12:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b272esm11782391eec.15.2026.03.31.23.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:12:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] libtirpc: fix bindresvport build with clang-22/C23
Date: Tue, 31 Mar 2026 23:12:29 -0700
Message-ID: <20260401061229.2588515-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 06:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234327

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...bindresvport-build-with-clang-22-C23.patch | 32 +++++++++++++++++++
 .../libtirpc/libtirpc_1.3.7.bb                |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch
new file mode 100644
index 0000000000..4e5844e18e
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch
@@ -0,0 +1,32 @@
+From 0ae4371ee63e25a48777a83c0601c85c5747cbac Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 31 Mar 2026 23:07:09 -0700
+Subject: [PATCH] libtirpc: fix bindresvport build with clang-22/C23
+
+bindresvport() is defined using old K&R-style syntax, which breaks when
+building libtirpc with clang-22 in gnu23 mode.
+
+Convert it to a prototype-style definition. This is a no-op change
+intended only to restore compatibility with modern C compilers.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/20260401060943.2578248-1-khem.raj@oss.qualcomm.com/T/#u]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/bindresvport.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/src/bindresvport.c b/src/bindresvport.c
+index 7b2056d..eea6589 100644
+--- a/src/bindresvport.c
++++ b/src/bindresvport.c
+@@ -57,9 +57,7 @@ extern pthread_mutex_t port_lock;
+  * Bind a socket to a privileged IP port
+  */
+ int
+-bindresvport(sd, sin)
+-        int sd;
+-        struct sockaddr_in *sin;
++bindresvport(int sd, struct sockaddr_in *sin)
+ {
+         return bindresvport_sa(sd, (struct sockaddr *)sin);
+ }
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
index edc75a8366..cef541e3d0 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 PROVIDES = "virtual/librpc"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
+           file://0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch \
           "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"

