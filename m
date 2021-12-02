Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4D6C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 10:18:47 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.6655.1638440326533431583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 02:18:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NAuThC3T;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id b11so19869832pld.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 02:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Nnr2o831o818hfqbkPp0xvjNK7adPNCNZnf5I5M+Ftg=;
        b=NAuThC3TA2Sqy8GQOJu5Up1S7tLJKb2LNyZj9G7WO86Gor2j2NB+anxauMi3FNfAjh
         HTAVmtgstQEnaKbY2LXftPtsXIOkvzTBh59gbRIB+Ehxwc9R7zUVpoE3tVLBuvkTYZGO
         +d5BkwRnhk+DU1WgKvCFJYWJjkwZ+K4bVfmkDVTNbDU7T00ooVhZL4x61AE4xYzBjTRB
         q22rH1eyiASTHxudXWOD1eRJNrKNXYiy+lQwJ4vjnff+d3BH4V8GDkROdEd+vKIxKyUs
         y13ZlLPTtLGcgHj9v7RrWVxAUNXZ+veUUQJYEmNQKPEIWCD/v6SZAA+AYSubmzgsCv+C
         S75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Nnr2o831o818hfqbkPp0xvjNK7adPNCNZnf5I5M+Ftg=;
        b=1jQkeCkRllVq72JBpWXgQ4wgt1M4FOV/+t9uLiX0PDROC7o3mDDqmEipdMZGZBcnCv
         h3ud9PVFLVpMf1r8as8nLsgPkOuBF3J/Gy7F70TEoip/BXlblW32OZgiNHRng+Wf7kQc
         Xd4JxuZwsgzNZOsF+OCUKVLRAZe1hEyCNmhOYLUDPNZmkjWqL44iIrNbbBBNbVFIqq5O
         oZO7lFCc06khL2+PiRLGOUNXqYaAmZ4rZbo5ncfjKJ8QnJrrnDuSNqLGJ/kS+4nSFN/7
         N/UwoWZnjcwzQC/2DBnz0HuR3CXbDwSgvVyn386I1Nc3riMdYCGhhlQd46C8SzsuyYXN
         wLkA==
X-Gm-Message-State: AOAM533rN1o5bJR/ZP/UAQqRKnDMkbsQeo+JBh3JbyM4Y/GErFNNU22W
	IhGQ5l2pG3ysL3pb1jb+k/aXdgQZgPI=
X-Google-Smtp-Source: 
 ABdhPJyn/8HEU0xETprnf4krUUPib1vmCbKrrRshDDb9k+jjg/i6MWQB51hebgMWMZ1f4ub1IbQpYw==
X-Received: by 2002:a17:903:24d:b0:143:beb5:b6b1 with SMTP id
 j13-20020a170903024d00b00143beb5b6b1mr14455108plh.54.1638440325751;
        Thu, 02 Dec 2021 02:18:45 -0800 (PST)
Received: from localhost.localdomain ([103.81.94.54])
        by smtp.gmail.com with ESMTPSA id
 186sm2137258pgf.94.2021.12.02.02.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 02:18:45 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta][dunfell][PATCH 1/3] gmp: Fix for CVE-2021-43618
Date: Thu,  2 Dec 2021 15:48:02 +0530
Message-Id: <20211202101804.4697-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 10:18:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159079

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix CVE-2021-43618
Link: https://gmplib.org/repo/gmp-6.2/rev/561a9c25298e

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../gmp/gmp/CVE-2021-43618.patch              | 29 +++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.2.0.bb         |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/CVE-2021-43618.patch

diff --git a/meta/recipes-support/gmp/gmp/CVE-2021-43618.patch b/meta/recipes-support/gmp/gmp/CVE-2021-43618.patch
new file mode 100644
index 0000000000..0323a45c27
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/CVE-2021-43618.patch
@@ -0,0 +1,29 @@
+
+# HG changeset patch
+# User Marco Bodrato <bodrato@mail.dm.unipi.it>
+# Date 1634836009 -7200
+# Node ID 561a9c25298e17bb01896801ff353546c6923dbd
+# Parent  e1fd9db13b475209a864577237ea4b9105b3e96e
+mpz/inp_raw.c: Avoid bit size overflows
+
+CVE: CVE-2021-43618
+Upstream-Status: Backport [https://gmplib.org/repo/gmp-6.2/rev/561a9c25298e]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+diff -r e1fd9db13b47 -r 561a9c25298e mpz/inp_raw.c
+--- a/mpz/inp_raw.c	Tue Dec 22 23:49:51 2020 +0100
++++ b/mpz/inp_raw.c	Thu Oct 21 19:06:49 2021 +0200
+@@ -88,8 +88,11 @@
+ 
+   abs_csize = ABS (csize);
+ 
++  if (UNLIKELY (abs_csize > ~(mp_bitcnt_t) 0 / 8))
++    return 0; /* Bit size overflows */
++
+   /* round up to a multiple of limbs */
+-  abs_xsize = BITS_TO_LIMBS (abs_csize*8);
++  abs_xsize = BITS_TO_LIMBS ((mp_bitcnt_t) abs_csize * 8);
+ 
+   if (abs_xsize != 0)
+     {
+
diff --git a/meta/recipes-support/gmp/gmp_6.2.0.bb b/meta/recipes-support/gmp/gmp_6.2.0.bb
index a19c74fca8..bd88aa95ef 100644
--- a/meta/recipes-support/gmp/gmp_6.2.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.2.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
+           file://CVE-2021-43618.patch \
            "
 SRC_URI[md5sum] = "c24161e0dd44cae78cd5f67193492a21"
 SRC_URI[sha256sum] = "f51c99cb114deb21a60075ffb494c1a210eb9d7cb729ed042ddb7de9534451ea"
-- 
2.17.1


