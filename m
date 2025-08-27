Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0A0CA0FFD
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:39 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.6613.1756330239018764852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lmJbzXsN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-32326e5f0bfso268608a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330238; x=1756935038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bOqdwV6ULmCr+kOWIsRNXHQkPa50Sh3cqoldN800fB8=;
        b=lmJbzXsNqp64n1jrqzSbbQpPngvcn/QOyD9OVR7gBVjv7+Btt0aI8eLAO3HOxU9Pnv
         wjFgeFHQ3vqSaz5VQSxmrFlWfHcAwqzln6QnzNdHNEfcaOLSZ7pfFb6nD3xoHbL3yPnj
         HZzAC6b8Ab/cACR1twQFe/wSMIc8SFVpE+BRKPXWPf22FZ821z1p4CCIldf2P0UsLj6c
         jB+Xtd9GRP5CCkhIvTDrtGCkUJHMLYDKk7sJJbk8GMCKk0rpCQlOgGOpydQxI3TbzuHH
         qIV6zTxYw2fhdOoQRDU/VIouePPd7FDdJRUP77P7GOZIM3jgjcQo1OMWcAS/XauKB1n7
         CRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330238; x=1756935038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOqdwV6ULmCr+kOWIsRNXHQkPa50Sh3cqoldN800fB8=;
        b=FbdiGIBB2qlYV1azsC7Z9AGel42NkaaacdCCzB7Fq0bvNlVzqAGXLO4dvFFdazCEC0
         S4fRJvW2LzepMbzgjK19uPtzcUmoa7rBsZpDq2SLwlk53bgCNzZJGDsULdwwAYp5jyId
         rorVnaCjnSvQdNwLuffOUyRouJlabykfXjOaDVRVhPokC2tfyzWVhN6cDoCyDIaxzARN
         TUPzg6jijG9JQvC1ENmN8ASefaCBSbuggtSUeS3wwZNwsUYJl+SChojejUZXpDLjxjBo
         iPp1pLUyY9eqaOv0X0gihC7JXVwtAEeLzUyG9zBCS5lQyBE4VDdgJkKAAvpGL5RPt+S1
         yIZA==
X-Gm-Message-State: AOJu0Yw3yw2cWEW1a0viTO4uoLrxBn3aeS0ROr6bSmX30y3fDOVT9JJ+
	5EpR1wrvMEQGHKXqNaAA76h4YV20lilKa/5BPhkhe2dl+ctH3ee/rrFCPrV8qRyikbnkOWrhs15
	uSSo0
X-Gm-Gg: ASbGncvwV4HGjvREiMZ2TPkqI1IRUgwo3VSifVNzK8EypgDfBZAPIGCnbcdc/ad/LkH
	xDdk+ct7hVrQWpTAA4XdLhekY/uCuHOif06Nw+5AEAO0+fl5LCZ0Bt/csPh31iBDeNVWKR7yANm
	wcC4QJh5xNn+xNujrHI1PE2cYwQYJzUIcAIRd0ghc3yuUkZkdW4yRGRPK+Y3Ng7LUvpyjwJxrj+
	btzsv46250VyTIOnBI8jtK8QuGFO2PSBWp7Z6X6CBj40XrehazydrfXIFPH5PevOuZfAPBfxtS3
	MxpROlg+FQphEKrdhBILDJTPvnXeOnuxhW90uj2+bfA8s2O1VeOfewB4IpU1L7MlW056fVgyKYG
	bovnM6yUuhqzBXw==
X-Google-Smtp-Source: AGHT+IGxiLYdQMGbmU5LWkhMy0f5jaOmWyjQwU987Zvn0QB469II0ePSNv+pAQpsWipJ2ACqq0RptA==
X-Received: by 2002:a17:90b:4fc2:b0:31f:6d6b:b453 with SMTP id 98e67ed59e1d1-32517c23e05mr25893812a91.30.1756330238248;
        Wed, 27 Aug 2025 14:30:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/33] elfutils: fix build with gcc-15
Date: Wed, 27 Aug 2025 14:29:33 -0700
Message-ID: <ece06774fd1c261c333f61779579614e0b40b927.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222534

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.191.bb                |  1 +
 .../files/0007-Fix-build-with-gcc-15.patch    | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0007-Fix-build-with-gcc-15.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index bab3d94d12..fcb91e41aa 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1365.patch \
            file://CVE-2025-1372.patch \
            file://CVE-2025-1371.patch \
+           file://0007-Fix-build-with-gcc-15.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0007-Fix-build-with-gcc-15.patch b/meta/recipes-devtools/elfutils/files/0007-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..8f5c7e4421
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0007-Fix-build-with-gcc-15.patch
@@ -0,0 +1,72 @@
+From 7508696d107ca01b65ce8273c881462a8658f90f Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Wed, 17 Jul 2024 23:03:34 +0100
+Subject: [PATCH] backends: allocate enough stace for null terminator
+
+`gcc-15` added a new warning in https://gcc.gnu.org/PR115185:
+
+    i386_regs.c:88:11: error: initializer-string for array of 'char' is too long [-Werror=unterminated-string-initialization]
+       88 |           "ax", "cx", "dx", "bx", "sp", "bp", "si", "di", "ip"
+          |           ^~~~
+
+`elfutils` does not need to store '\0'. We could either initialize the
+arrays with individual bytes or allocate extra byte for null.
+
+This change initializes the array bytewise.
+
+	* backends/i386_regs.c (i386_register_info): Initialize the
+	array bytewise to fix gcc-15 warning.
+	* backends/x86_64_regs.c (x86_64_register_info): Ditto.
+
+Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=7508696d107ca01b65ce8273c881462a8658f90f]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ backends/i386_regs.c   | 10 +++++++++-
+ backends/x86_64_regs.c |  9 ++++++++-
+ 2 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/backends/i386_regs.c b/backends/i386_regs.c
+index 7ec93bb9..ead55ef7 100644
+--- a/backends/i386_regs.c
++++ b/backends/i386_regs.c
+@@ -85,7 +85,15 @@ i386_register_info (Ebl *ebl __attribute__ ((unused)),
+     {
+       static const char baseregs[][2] =
+ 	{
+-	  "ax", "cx", "dx", "bx", "sp", "bp", "si", "di", "ip"
++	  {'a', 'x'},
++	  {'c', 'x'},
++	  {'d', 'x'},
++	  {'b', 'x'},
++	  {'s', 'p'},
++	  {'b', 'p'},
++	  {'s', 'i'},
++	  {'d', 'i'},
++	  {'i', 'p'},
+ 	};
+ 
+     case 4:
+diff --git a/backends/x86_64_regs.c b/backends/x86_64_regs.c
+index ef987daf..dab8f27f 100644
+--- a/backends/x86_64_regs.c
++++ b/backends/x86_64_regs.c
+@@ -82,7 +82,14 @@ x86_64_register_info (Ebl *ebl __attribute__ ((unused)),
+     {
+       static const char baseregs[][2] =
+ 	{
+-	  "ax", "dx", "cx", "bx", "si", "di", "bp", "sp"
++	  {'a', 'x'},
++	  {'d', 'x'},
++	  {'c', 'x'},
++	  {'b', 'x'},
++	  {'s', 'i'},
++	  {'d', 'i'},
++	  {'b', 'p'},
++	  {'s', 'p'},
+ 	};
+ 
+     case 6 ... 7:
+-- 
+2.43.7
+
-- 
2.43.0


