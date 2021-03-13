Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web12.2787.1615661532471722992
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mB5RxDfp;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id x135so25921148oia.9
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jL3+/zkiLG8XnVvYwWWz5fYs4Q/KrEAJK9Y/z3Jb1sc=;
        b=mB5RxDfpx9MKkOYAbbvnJe6QRjVZ7pZ6wzM33hbgct8iZXKv0m1kURDKzIJ4TMzOll
         Ybdy7kiKyXglAlM9fmhPz6mucLYBZK9hqJRIv2NuGIacwAwgM9wOVsKBm/2SXZuv49EJ
         qomrTP/HMbZe2i2OipkC3dJVfaOWMvuH0Ir4DP/CmuS4kmrI1BVB83BY/13L/DF4YYf+
         rquNxuQTSCMeKgYxT2IH6ycZC4OO27ydNn19dEZgbIDRccw+1wIMiQcoxPbugEwExLQk
         APteF8OR1gG4fIUmaKr1gVImqT2KbAPsmoTGSAFXuZhMR64uzuWZUFpzUyahj2LhMp2W
         yciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jL3+/zkiLG8XnVvYwWWz5fYs4Q/KrEAJK9Y/z3Jb1sc=;
        b=MIo35WWUEVUw4gwqSOjQzX9hlCxzsGlndl5ZwhvQJZpGDzWEvH4n4wyd2+zAauaC/x
         nBabKZc2nSFMCZaJpkL/C/GugWG+dDeDXa2/Bm6kZimdmo2xl40FJEuzJiS86hfA+lhj
         l06zunx7s5usRayJLagC30XXdoOYQq/gqt+n48s2EWsJLKzrJ0EqM1uy197Hz7xLFeox
         VS/9YTuMSlbpxUjGo7c8tm4CTFI41OeQaM4I4zBqDeFKb8drud9ynbJ5ySTXKOIIbRz8
         RtZmgW1Vq5J/0Yqh/G+l+IVtLna7lQF9awbY7aSI4mxsE7CtgvwxJdn9c+zBaAOoGZiq
         F8og==
X-Gm-Message-State: AOAM5331HZcsS6us2DW7f4dEf3zTvsgdMA5fJFDNnxHEGzXUDgxTvkjq
	QAaImTCEbMfFjbQSH0joD8cZDgtUUyMEWnzP
X-Google-Smtp-Source: ABdhPJzGJrdjcYuR05Ezrrfz3D3VgqOQsxPp4Hu6d0HaARVMhLgft0IoSLTrO661JcKAtP+qnBb0aw==
X-Received: by 2002:aca:3286:: with SMTP id y128mr13072855oiy.145.1615661531392;
        Sat, 13 Mar 2021 10:52:11 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.52.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:11 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/38] oeqa/pam: Need shadow installed for the tests
Date: Sat, 13 Mar 2021 08:49:17 -1000
Message-Id: <0ac2dee8756573a793af56582565f221ff6b93c5.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Distros may not use shadow for login manager
secondly login --help returns 1 only with shadow provided login
utility, with busybox it returns normal 0, the testcase clearly
assumes shadow being part of image, therefore add needed
checks to ensure the pre-requisites are met

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0820aeba74869bf6e85b200f39bc610a43ab9a7a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/pam.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/pam.py b/meta/lib/oeqa/runtime/cases/pam.py
index 271a1943e3..a482ded945 100644
--- a/meta/lib/oeqa/runtime/cases/pam.py
+++ b/meta/lib/oeqa/runtime/cases/pam.py
@@ -8,11 +8,14 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class PamBasicTest(OERuntimeTestCase):
 
     @skipIfNotFeature('pam', 'Test requires pam to be in DISTRO_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['shadow'])
+    @OEHasPackage(['shadow-base'])
     def test_pam(self):
         status, output = self.target.run('login --help')
         msg = ('login command does not work as expected. '
-- 
2.25.1

