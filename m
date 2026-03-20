Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C6A1098782
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 13:47:11 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13091.1774014426011795063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 06:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BMmI3nIG;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439fe4985efso520949f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 06:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774014424; x=1774619224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zmQ3rWWXU35u7ijbG1hKdZmtmWtxankXOtxcg75kyeQ=;
        b=BMmI3nIGNjieVnbuMB1ZZSEohVZJpRke76p8Ta78Rj35vf+gBhgstXS81W4vg6l7Vy
         38yMFgAqL7HRP8t4ffsw1YLmRSzDLw94FDHTmhMGgxi4cCbqhmbvLaGbh5RPO9ZR8ptE
         tdy2u6btRb9Zttd2Q20Xy1lnfMgmHI4I/zDk2Mdc0r/e+x3Jzgle8OaZUjHdVlD1xRfI
         N6O5QI2QKSVlDorkAOs4toYfm68OrojmitqbHHXkvipBK/p2lrP+UVY8VK9iYw3sVgwj
         z+VvFhExLj0zfgulA3xt8Sly4v4AAQQXsmg6StNW3IRo2mZ1Pz6wmE6QGivxDaPyyxpR
         mNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774014424; x=1774619224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmQ3rWWXU35u7ijbG1hKdZmtmWtxankXOtxcg75kyeQ=;
        b=sfIRGc/VfnRyCA5Dsw9d558xYKuExSQvPL72B4alrsFNKAy9ZEyuOdLYBPkZXHc0mv
         Py/cszCKIqykXPItNmNZBkb8diH33trNA0rJxkyr0WoKC2/SndnbLnUf5sMNxY2CG4FN
         59LmEpRJjamVuJ73WrOgWP4rLH7L6h7tj/TLS54dW0zeQ+LOZszAJFrov2S1pXhrgM87
         1bSylX9oQXT/z42GcqAT67fwoQukzcZ7cxsMqpmgY71rwGnmTY3+kwrimV64lAeKV8HD
         p/VQuumYEnF7tUc5nhl5P+iACo3CWSzcHoPykDufEPkWDMiR6TKg7a+MpEEVwVGmi33X
         gNHA==
X-Gm-Message-State: AOJu0YzP/QYajTgWQyHjUjEYN4MZ/Q3SUv7218HNhwPwzbhcBdnN7Hzn
	86jneM7ffuIT7KQd+GkFr0i0RlyyzcQCbu9WcwBo0+HuMqDHbBl5qa6qQAU5Kg==
X-Gm-Gg: ATEYQzzZL+aKoWfQ+mU4iG56ak8OvYyKGg1vXS6bd4Dzi372A8GXVl4pk2FGu4krZcq
	FEz0DbrZAJGuEKOXv7Kq4B3jSgnVwj+aR5KKKQ0YFTtlXPIDCM/xJCIfQzxn4nqWN+Y51fQ7C/3
	Imy4AGFoMarsuE+Ica0ANoFZ8E7W0gVQQdWqG9kmyxwRUEGAjk/g5riZPFWge4Lc9FTCcG9L3AM
	qOjfo9hJEUC5q2wHDyUazVosXEXf2lx4sD9gmgm9v4mGsPx0xw11y/VdDbtXQN9hgParWJKPF4B
	h7iWSlCd8cX2Yf/Tz9pq1cMP57DC4X0e81susQgrEINQm/WqQc4Ec0ub0McKJqJUpHrLqGPqqRC
	VAjDNHTW2H0DNONkLt5YIaIkl1P+GJZaxaZajAy/eWe/+txGHkJmd80Ij/9yOgxjjqmNgPw0s+n
	cqn90TYXjzguRVVKxLcpD8PhyEm6JEwpTeXh+rlJ3xz8DjKWE6GdUvoDyuT/g=
X-Received: by 2002:a05:6000:144a:b0:439:be67:a038 with SMTP id ffacd0b85a97d-43b64270ca8mr5647602f8f.41.1774014423940;
        Fri, 20 Mar 2026 06:47:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64711f58sm6989181f8f.29.2026.03.20.06.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 06:47:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/minidebuginfo: extract files from tar archive using tarfile module
Date: Fri, 20 Mar 2026 14:46:58 +0100
Message-ID: <20260320134658.3037500-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 13:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233609

From: Alexander Kanavin <alex@linutronix.de>

Python 3.14 added security checks around archive extraction, and by
default will refuse to handle symlinks with absolute paths. It's possible
to handle this using 'filter' argument, but it is not always available
in older Python versions on various host distributions we need to support,
so let's extract only the needed files directly using tarfile module.

busybox is itself a symlink to busybox.nosuid, so both are extracted.

[YOCTO #16195]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/minidebuginfo.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
index a8923460f9..5f37522c32 100644
--- a/meta/lib/oeqa/selftest/cases/minidebuginfo.py
+++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
@@ -6,7 +6,7 @@
 import os
 import subprocess
 import tempfile
-import shutil
+import tarfile
 
 from oeqa.core.decorator import OETestTag
 from oeqa.selftest.case import OESelftestTestCase
@@ -33,7 +33,10 @@ IMAGE_FSTYPES = "tar.bz2"
         # ".gnu_debugdata" which stores minidebuginfo.
         with tempfile.TemporaryDirectory(prefix = "unpackfs-") as unpackedfs:
             filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "{}.tar.bz2".format(bb_vars['IMAGE_LINK_NAME']))
-            shutil.unpack_archive(filename, unpackedfs)
+            with tarfile.open(filename) as tar:
+                tar.extract("./bin/busybox", path=unpackedfs)
+                tar.extract("./bin/busybox.nosuid", path=unpackedfs)
+                tar.extract("./lib/libc.so.6", path=unpackedfs)
 
             r = runCmd([bb_vars['READELF'], "-W", "-S", os.path.join(unpackedfs, "bin", "busybox")],
                     native_sysroot = native_sysroot, target_sys = target_sys)
-- 
2.47.3


