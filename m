Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123E6F8809F
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:54 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7590.1776322125760237495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iZ6QbxHY;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d43e09de5so4530134f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322124; x=1776926924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFm7VjounM+gu7O7oiKUuw+UTStgcv5QPDvogYmbpV4=;
        b=iZ6QbxHYibb2aIbIbcOV6yhsNg6JI7Fihd6aT4TUnkN3tESaV5Apyxrus8JQTd270U
         OB4A05GmeUzIOnb/MGGe24pveu8/o3B4D6hxrhfQE7cg5KVCfOOGG/iAnIfV56DPR5AO
         2Qp8DkRnyMeKSgUpCQ5L9hqWHBvysNNvVVRq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322124; x=1776926924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CFm7VjounM+gu7O7oiKUuw+UTStgcv5QPDvogYmbpV4=;
        b=dL1WzSZAW/MArZoYfki8l3q8x59oF1G+M1/zOHdpfMu/M2Ar/LnRLxb5K7LNxNBh5L
         pFmHKsS/AxwYkVvwhKl0SsUUseBk3s9oMtFnFpdw7p8vK5kqpbh19puWulOkx4qf5muk
         CihyWr7YRVUpcpWUOqt0iGIkLyFwA50uvlr+EFqrwIx5bXCWIjUErXqPS3LT0JdvpouW
         /qZGK31+yTmdZghDHkeE+GjH73Y8fPZJayG+mpddjOS81SM3OZBrP6aMbmikvbiOK5W4
         F3DDLqeSQBv6edk9XzyaDCl1QPvvl6UjqwRCm3p+0SN72iuGyM5E1ZDXIJQhhKOW9w0x
         15tg==
X-Gm-Message-State: AOJu0YyQUNchlPAq+IuPxjSOMgiw9AB+8/MpUo7P+//jSf93fCRibhaf
	OyCwVdHrCTYWdKHjDyk8l+F1oT7omKlDwu4itoqgHhl3bvsaSIat8lxvcD5oqh3VEvYc55aZDab
	oGbEFFwhuqA==
X-Gm-Gg: AeBDiet9zx9zCpUyfVG/PFIWArkMb7rAkVn4HDmgHa4sdIDno9tvZ639tSqe2ipkMiG
	IKYU7J9PoN3fBQf5hq0g+g7sWyAt28sr+y0mcVc+lLTHVzBTuuhOPvYLNTTLsJqej05R/2DquGx
	vN659o21AlllW5YLBfxtnerkM3n+6zEhKvExHnCTkYsn4Pc/2LXip2ypM2R89w6UVL0B44sdH5l
	aXoLvPAz74zGZZ8lx6nognflVhF5x+Pt1w70uM9QS5k5axynXWpTQTR2+6ERxMMQlTkKxTLwGv/
	lvjwGcICRenwC+8CTKRkdvlS4n1gkNZiEP+dVK5TlCc2kA9LxBnDJB4rueObqzpQYd2kaE8NsdM
	UrLeJW1NdYlkDwx27kMm798WP0UYPkBAvuMF9t26a1DJi4SiDlb1n+HdZeQF5fxA2usj1R7S4vw
	YrljI0OC1IJ2G6LFltqWgh+pqA6HqUxesKz14+dNY9tpQppeZuH9XO74YPaEw4Pr9QgMURVrTiK
	OnPJzeDIZKINhSCLo8XPqEJIXQwPBowbbruWA==
X-Received: by 2002:a05:6000:1acb:b0:43d:7a97:78c6 with SMTP id ffacd0b85a97d-43d7a977a20mr22227431f8f.35.1776322123794;
        Wed, 15 Apr 2026 23:48:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 38/47] selftest/minidebuginfo: extract files from tar archive using tarfile module
Date: Thu, 16 Apr 2026 08:47:39 +0200
Message-ID: <99d513c47f2feeffe442ac9344a13350f65a1cc8.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235380

From: Alexander Kanavin <alex@linutronix.de>

Python 3.14 added security checks around archive extraction, and by
default will refuse to handle symlinks with absolute paths. It's possible
to handle this using 'filter' argument, but it is not always available
in older Python versions on various host distributions we need to support,
so let's extract only the needed files directly using tarfile module.

busybox is itself a symlink to busybox.nosuid, so both are extracted.

[YOCTO #16195]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d52d00a3bb4a1ba93e88f1d24d8bb99d6aa321eb)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/minidebuginfo.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
index a8923460f90..5f37522c325 100644
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

