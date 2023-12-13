Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDD7C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 04:02:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.27999.1702440148536724064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 20:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=P45tCwKL;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d345b187bbso9344365ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 20:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702440147; x=1703044947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqOO5SE8UppgpHoK264uUeD6s/fPClRn424aTYe3+eA=;
        b=P45tCwKLkce+FFvf80qFqmXpakNYpPXei2NZOgihh4Tvc8nd5iFnVr1JGJSS5w+0Ih
         crpLCVmr7msNGHxAZpM1ZRIysud86Ug/zng2OqN/Qjhky0pEepLSoRkHpImBfXcHE1Kr
         igj2hQ1DvDLpCIyEbHe+ptfqIUEpOO70TVJa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702440147; x=1703044947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqOO5SE8UppgpHoK264uUeD6s/fPClRn424aTYe3+eA=;
        b=ksVGc+uNJ+KHK2sDGRs7FvegC+U13G9Kn/fOP8cpZ4Lv6EsQ+57diXxK8VERNU515s
         RLAe2NQd00paZ8wXtnYpDzA1ipI4L48Ju7pOzfi8T6tvsA1y1R3zyfbv3shVvd7f+Pfi
         /hASVSKgMsYPSMnV/iP31AaS3GkecWWUae3bEovs5xSBtwtPSGJu4Ae3pcF0S2iZ81nJ
         AGTLVlZSNBa5KUPH7VrjIVYQQlK+1yNeGeA1EhaSpui+pUCt0Yi66A4CM9QrcRJ+1UK2
         7HPw5B6Bcom8PfsP9JTV8HYGMqX1Sp8oIhU77CQKWMmZFmnIVXh6xpbtq49mgrdXtsN4
         m6CQ==
X-Gm-Message-State: AOJu0Yzi3s1Il/ADPrc1iASeg80WldowojgeqSf4cw8jAGXgzy3O9pPs
	0cObBtMouoCeOEMwuINVWUgYDSKPJnJjC/ibHbE=
X-Google-Smtp-Source: AGHT+IEXi3RtmyHNhymw9rvqbQ4X4+KRd75wTYzHNZA94O5WoeNztSTGWS6Tkb25QiyAP/t2C1pFYQ==
X-Received: by 2002:a17:902:7fc8:b0:1d3:488e:a4c3 with SMTP id t8-20020a1709027fc800b001d3488ea4c3mr898892plb.96.1702440147092;
        Tue, 12 Dec 2023 20:02:27 -0800 (PST)
Received: from MVIN00020.mvista.com ([223.230.81.28])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902e9cd00b001d33369bd86sm2489690plk.194.2023.12.12.20.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 20:02:26 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] ghostscript: Backport fix for CVE-2023-46751
Date: Wed, 13 Dec 2023 09:30:12 +0530
Message-Id: <20231213040012.151047-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 04:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192266

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=5d2da96e81c7455338302c71a291088a8396245a]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../ghostscript/CVE-2023-46751.patch          | 41 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46751.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46751.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46751.patch
new file mode 100644
index 0000000000..6fe5590892
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46751.patch
@@ -0,0 +1,41 @@
+From 5d2da96e81c7455338302c71a291088a8396245a Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 16 Oct 2023 16:49:40 +0100
+Subject: [PATCH] Bug 707264: Fix tiffsep(1) requirement for seekable output
+ files
+
+In the device initialization redesign, tiffsep and tiffsep1 lost the requirement
+for the output files to be seekable.
+
+Fixing that highlighted a problem with the error handling in
+gdev_prn_open_printer_seekable() where closing the erroring file would leave a
+dangling pointer, and lead to a crash.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=5d2da96e81c7455338302c71a291088a8396245a]
+CVE: CVE-2023-46751
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ base/gdevprn.c     | 1 +
+ devices/gdevtsep.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+--- a/base/gdevprn.c
++++ b/base/gdevprn.c
+@@ -1251,6 +1251,7 @@ gdev_prn_open_printer_seekable(gx_device
+               && !IS_LIBCTX_STDERR(pdev->memory, gp_get_file(ppdev->file))) {
+ 
+                 code = gx_device_close_output_file(pdev, ppdev->fname, ppdev->file);
++                ppdev->file = NULL;
+                 if (code < 0)
+                     return code;
+             }
+--- a/devices/gdevtsep.c
++++ b/devices/gdevtsep.c
+@@ -738,6 +738,7 @@ tiffsep_initialize_device_procs(gx_devic
+ {
+     gdev_prn_initialize_device_procs(dev);
+ 
++    set_dev_proc(dev, output_page, gdev_prn_output_page_seekable);
+     set_dev_proc(dev, open_device, tiffsep_prn_open);
+     set_dev_proc(dev, close_device, tiffsep_prn_close);
+     set_dev_proc(dev, map_color_rgb, tiffsep_decode_color);
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 7f4050755c..e0d1e4618f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -42,6 +42,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2023-36664-0002.patch \
                 file://CVE-2023-38559.patch \
                 file://CVE-2023-43115.patch \
+                file://CVE-2023-46751.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


