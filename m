Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5DDC3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 14:30:11 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.14025.1672929002119648847
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 06:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pg4Kq9i/;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso1431162wmb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 06:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bV5f6uq7PQkXhR01i63CwcMz4DM8BgD5buQa1gKjTGA=;
        b=pg4Kq9i/cAo9uhYu/RfV2CtlVYGFZb2+6Ygdbpq290GlIRy4gqTtEA8bX405+72mpN
         RuawAN2EWPB9ANiuMTO9MHfBwkVOSe1nScec0PdqDfYMYM5Y1iFFO1ENRhK7ZBpra/WL
         juax1w63s4WiiPtVV7CG+fGnGN5xF4fGSvcNDhMim0tf84W/WhNvQTyenEJEeTST0FeP
         Qzxm0BxY3XDLtIwKa30AwV3LtSmaZCbS8fyV0ccOlYQaHpqtIJmo4j9moOTeyinWgjlx
         lLpooE8bpibB3DQNpfQ/6lQuiP3acaWPho5fT2vgEoaYAaTTFsw7MxiXOoqbJLivuqlp
         5T8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bV5f6uq7PQkXhR01i63CwcMz4DM8BgD5buQa1gKjTGA=;
        b=C/2GCSytr3cCezz+FicnbcYbm+OCsgUQDNoSTl+4vG0iigLUYGk1Vlo0s25hvsbKP0
         US9euqw2Ger98eq8h6pZPSsDMOWwpLbzI/qqSqALDyAXGc8OfGGTrqsCIZ6den64cYrh
         dCmuopYytlULG419lr1y6faaP6lJPMk0uA1oO7LIFq9jKCyrtzBWF8hYAbkgThqycHMD
         ckEp5/X5/nR5Nd+8pDPVdi/VSQPcEmQuGWCtkGDL0jgS9/aZ4VFyh1cdnuclT4yATnq6
         +ikHc9AEuZiaNdXeiaoJCaQcQsLSYctBjrx6xiSxlqFtpq9JPJVEo2gsg6v94NNroi0d
         2PSA==
X-Gm-Message-State: AFqh2kp0LTzRiOiNcbH3HX1nMTSB17V2iM38MfsZRVLGspCVn/2TCo59
	ck5H8p8PgoI12fmuVhgS71zmK1iaXxw=
X-Google-Smtp-Source: AMrXdXuEHmnMXFAG2uUZ7/1WlUBI9EAP2bba+JQpWQUWu3zcFGNlYbArWZ539e22OgowrveuDlZA4g==
X-Received: by 2002:a05:600c:1503:b0:3d0:8722:a145 with SMTP id b3-20020a05600c150300b003d08722a145mr35396147wmg.40.1672929000358;
        Thu, 05 Jan 2023 06:30:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id hg9-20020a05600c538900b003cfa622a18asm2595595wmb.3.2023.01.05.06.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 06:29:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] qemu: fix recent reproducibility issues
Date: Thu,  5 Jan 2023 15:29:55 +0100
Message-Id: <20230105142955.3837782-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 14:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175533

Not only break when not in a loop is undefined, different
shells do different things when they see it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...ix-check-tcg-not-executing-any-tests.patch | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-configure-Fix-check-tcg-not-executing-any-tests.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b58719affd..80f6edd2b9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,6 +29,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
            file://0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
+           file://0001-configure-Fix-check-tcg-not-executing-any-tests.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-configure-Fix-check-tcg-not-executing-any-tests.patch b/meta/recipes-devtools/qemu/qemu/0001-configure-Fix-check-tcg-not-executing-any-tests.patch
new file mode 100644
index 0000000000..66ae4deae1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-configure-Fix-check-tcg-not-executing-any-tests.patch
@@ -0,0 +1,56 @@
+From f295491361ed7fbe729ef6f029d83f68b8e2bee3 Mon Sep 17 00:00:00 2001
+From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
+Date: Wed, 21 Dec 2022 09:04:06 +0000
+Subject: [PATCH] configure: Fix check-tcg not executing any tests
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+After configuring with --target-list=hexagon-linux-user
+running `make check-tcg` just prints the following:
+
+```
+make: Nothing to be done for 'check-tcg'
+```
+
+In the probe_target_compiler function, the 'break'
+command is used incorrectly. There are no lexically
+enclosing loops associated with that break command which
+is an unspecfied behaviour in the POSIX standard.
+
+The dash shell implementation aborts the currently executing
+loop, in this case, causing the rest of the logic for the loop
+in line 2490 to be skipped, which means no Makefiles are
+generated for the tcg target tests.
+
+Fixes: c3b570b5a9a24d25 (configure: don't enable
+cross compilers unless in target_list)
+
+Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Link: https://patchew.org/QEMU/20221207082309.9966-1-quic._5Fmthiyaga@quicinc.com/
+Message-Id: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
+Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
+Message-Id: <20221221090411.1995037-2-alex.bennee@linaro.org>
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/73acb87be536d23e42db73a306104d8fd316ff20]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index 0c1db72b8..6b4589273 100755
+--- a/configure
++++ b/configure
+@@ -1881,9 +1881,7 @@ probe_target_compiler() {
+   # We shall skip configuring the target compiler if the user didn't
+   # bother enabling an appropriate guest. This avoids building
+   # extraneous firmware images and tests.
+-  if test "${target_list#*$1}" != "$1"; then
+-      break;
+-  else
++  if test "${target_list#*$1}" = "$1"; then
+       return 1
+   fi
+ 
-- 
2.30.2


