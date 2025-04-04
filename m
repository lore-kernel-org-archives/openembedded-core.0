Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E17FC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 08:44:02 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.6452.1743756233821168221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 01:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CtdaLI9v;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54996d30bfbso1645048e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 01:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743756231; x=1744361031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/bAze4KzuGyPpkPmWHsbVZA5dVOgVzMHnPqkEovqt7k=;
        b=CtdaLI9vqlT67BSN8OPzOgtNH46DSO8ON8UTemkvfN2+cOaPkGOuJQxQ5BTnZoYsrr
         HBmeMNctHSucZistmUgk7ULTJgITk7gSyLpmFterMJQ45syYlaPHSgHdCFleOxnQhdGU
         4pG9O1gcj7g/q7sdM6X82vOY1xTMG6q50NrV26FWne4xAvJiz9/n6x9yrcP2pVjXsxKq
         BZR7glRoMwSgMQB7uqv+4qke6Tx5wN2hUzBUT6XBc3PA2u9E3d9g/FCkAWCzwaFP9jmI
         RhsrT7nOI3DT9pBbT+765y0EKOURp43RxaoKVlbz/SPkyWmgPi2vpeRwe8gYI6a3vM7H
         oTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743756231; x=1744361031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/bAze4KzuGyPpkPmWHsbVZA5dVOgVzMHnPqkEovqt7k=;
        b=s8j5X/Q2mUU/6jvi+KoRUtUL0L/H7N5vaeC72ITMmWHim5SX46FJ4Q2ZQxB6166ESy
         KhzVZsi2RHbHX6AJ1NJNjA5pIeUQD9R8ejuHnMAFO5d58dARGC3pZtXXu6M94wgtU7tf
         XNYYbrscZ0sD3lU4SrW+ty7iQhHOPBP7fsaxXicJBiJqWNcZyezulBay6TyyZjaTEulc
         ylrEsUdefs8nXfz8TeRIy8xVtTP3151m4uzHjEL2LrkCS/IGYyrxvhMOO1C/DoqVPaLU
         W2KQT/t8eXd6hM/2pCZ/fDUaylu8+B2wlMihgpkIOrsAhPnXJddjZKlM+ssC3NIPFjHA
         t/xQ==
X-Gm-Message-State: AOJu0YzywzmYTGKG4DcUOkKxYsbPQxzkIHGNYM+mH+nBe/ujKuU3CjQc
	7J5TEztRLrYnIkleTGxFZSbu3Zo8pt/Pd0ltrf1uitsR6cHWBXyD+sw1U1wm
X-Gm-Gg: ASbGncvtU3+Zpg0y82jb3XoQUVVf8SJMLlq1xuLg/H2/3oN6AKvyyz9DDXm4EYRV2yW
	dbnBzBoyHQ2V8dHa828qlBf/fP7kCBbDxVxpEKEY0K3K8lXvO8X2VTcpjjEk/vbsTgSXu10DiAp
	ayV0IGEobA/6gVxRwgmIVCsdMIy37C22IVPurOuSMyJlpbbdD2dfO6zx9PEwKTe1qPTbR6cK/bg
	wnZ81h1XV5/uuQkj+jluhcKMinFUhNapA/5Xk3siEfZMWwiJXuy4kl6W9fVKgD3kV0czHOtH9OB
	KgbIFqnaJ3fL8sx9O5+kTtK9TXtacsUmPvdGya4UYrI4VN/9r2dfWg==
X-Google-Smtp-Source: AGHT+IFSoEUvVLbIbLwL00N2eU0h04XJ22s8dzHa3Alr+RBRyhEJ2k1AoIhyhae6vTZfr5R++9ZHeA==
X-Received: by 2002:a05:6512:238f:b0:545:5bd:bf42 with SMTP id 2adb3069b0e04-54c227f59dcmr741760e87.36.1743756231083;
        Fri, 04 Apr 2025 01:43:51 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab98csm367592e87.43.2025.04.04.01.43.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:43:50 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libjpeg-turbo: don't use chrpath on mingw32 builds
Date: Fri,  4 Apr 2025 08:43:24 +0000
Message-ID: <20250404084324.3024896-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 08:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214337

chrpath doesn't work on mingw32 binaries:

| `/build/tmp/work/x86_64-nativesdk-mingw32-w64-mingw32/nativesdk-libjpeg-turbo/3.0.1/image//usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-w64-mingw32/usr/bin/cjpeg.exe' probably isn't an ELF file.
| elf_open: Exec format error

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
index 4ff4cec721..a91adf5f72 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
@@ -55,9 +55,11 @@ FILES:jpeg-tools = "${bindir}/*"
 DESCRIPTION:libturbojpeg = "A SIMD-accelerated JPEG codec which provides only TurboJPEG APIs"
 FILES:libturbojpeg = "${libdir}/libturbojpeg.so.*"
 
+CHRPATHS = "${D}/${bindir}/* ${D}${libdir}/*${SOLIBS}"
+CHRPATHS:mingw32 = ""
 do_install:append() {
     # The binaries have RUNPATH=$libdir, which is redundant
-    chrpath -d ${D}/${bindir}/* ${D}${libdir}/*${SOLIBS}
+    chrpath -d ${CHRPATHS}
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


