Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5A5E82CB1
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 16:50:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.22712.1695833433572945626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 09:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=GAt0/KKk;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40572aeb673so86504145e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695833431; x=1696438231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rBAspsK1uvs1e4mD9FtcmZgsyRGvCkLmHq5Id4tj3IM=;
        b=GAt0/KKkZuSg3bOYtgb2H7gfjWZwc0FLJAq/PasdSexAs2nNs37vL6Ap0gIm7e7jxi
         CxS4XdQ0RAoMCNNlJ+V7d1XvnJx9E9a7Pv5PeGsCqGJA2yk9h8sTqX6W6Sdbud6fnJiu
         attIIk+4LaOb06ECOM8TOGZgk/CKt4EA6iO36WrGM+Ft9HS/y0zkArD7/bCt+XdNYY26
         6JOC1GrrZWLuNxY2cK/Plih4/k7s54egy1GLlpG5YOo9K8mPBfRas0f3wTKTGcauXxfW
         tSYe1MzHr0AlgYcXdUgPrsQ5ARvt4n5dlVqWU+idF1FHrFCOw6Qle2sM9VAL06Z4X38u
         0sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695833431; x=1696438231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBAspsK1uvs1e4mD9FtcmZgsyRGvCkLmHq5Id4tj3IM=;
        b=kGb77nNeqYrv20YUxSLidU8UeOUud8resbJmK0N8LsVNrrgU870O8dbk7iqbKwWCkQ
         W8X6F37e47LNwNum+z95D+uM0cLtzLa3Hfv415hfTYm5lwAWD8AuLB95Wkx+Xh4yXFiO
         K0JURrAqCVhlhgzeq2L/DDUhfzz2K+rLH4NQNo9mBBKGWBltuwnjconDa4IDFXfjBsOo
         yK4xZ62KjPkadpHkho1KMgzLLYrxtKRpXksG3hY7BpNDv958w9nOIjC+elguiSQEDFh5
         IhOTEiZoQZb1hMfsVRH2lQ+TinmeolxdkJLdWll2xn6Mdk3ocP955I6L1CqNq8BR8R+K
         VQ5g==
X-Gm-Message-State: AOJu0YxmapHYb0He5IuTKV/LZK2gfiZXlis8P6yhmcMquUz8KcPrrT38
	dVL+PqYKkV2FntLF9wb9AB/l4SztpMzO/RRFHO4=
X-Google-Smtp-Source: AGHT+IHIl4uRjcAcUKQGlMbMzM0+iyAQQkpab21ux2+iC4fYUkixxWKvmeaJmY9W/k9qxuxtfZsRmA==
X-Received: by 2002:a7b:c3d1:0:b0:405:1baf:cedf with SMTP id t17-20020a7bc3d1000000b004051bafcedfmr2554519wmj.24.1695833431509;
        Wed, 27 Sep 2023 09:50:31 -0700 (PDT)
Received: from localhost.localdomain ([81.185.164.65])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c040c00b0040586360a36sm9805514wmb.17.2023.09.27.09.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:50:31 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH] devtool: modify: correctly handle multiple sources in SRC_URI
Date: Wed, 27 Sep 2023 18:50:24 +0200
Message-ID: <20230927165024.2342635-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 16:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188335

[YOCTO #15162]

When recipes such as bzip2 have several sources in SRC_URI, all the
sources are correctly extracted into devtool temporary workdir, but
currently, we only get back the primary source and all files declared
using "files://", then the devtool temporary workdir is deleted

Fix this by moving all remaining files from devtool temporary workdir
into actual WORKDIR (except "source-date-epoch", "recipe-sysroot",
and "recipe-sysroot-native") before deleting it

Here is the stack trace from devtool modify/build bzip2:

NOTE: bzip2: compiling from external source tree <...>/build/workspace/sources/bzip2
ERROR: bzip2-1.0.8-r0 do_install_ptest_base: ExecutionError('<...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368', 1, None, None)
ERROR: Logfile of failure stored in: <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/log.do_install_ptest_base.3368
Log data follows:
| DEBUG: Executing shell function do_install_ptest_base
| NOTE: make -j 16 DESTDIR=<...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest install-ptest
| sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
|            ../../../../../../workspace/sources/bzip2/Makefile.am      > <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/Makefile
| cp ../../../../../../workspace/sources/bzip2/sample1.ref      <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
| cp ../../../../../../workspace/sources/bzip2/sample2.ref      <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
| cp ../../../../../../workspace/sources/bzip2/sample3.ref      <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
| cp ../../../../../../workspace/sources/bzip2/sample1.bz2      <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
| cp ../../../../../../workspace/sources/bzip2/sample2.bz2      <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
| cp ../../../../../../workspace/sources/bzip2/sample3.bz2      <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
| ln -s /usr/bin/bzip2          <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/bzip2
| cp: cannot stat '<...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/git/commons-compress': No such file or directory
| WARNING: <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368:189 exit 1 from 'cp -r <...>/build/tmp/work/core2-64-poky-linux/bzip2/
1.0.8/git/commons-compress <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/bzip2-tests/commons-compress'
| WARNING: Backtrace (BB generated script):
|       #1: do_install_ptest, <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 189
|       #2: do_install_ptest_base, <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 158
|       #3: main, <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 226
ERROR: Task (<...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base) failed with exit code '1'
NOTE: Tasks Summary: Attempted 776 tasks of which 765 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  <...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/devtool/standard.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d53fb810071..6c8ad7a6c8c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -684,6 +684,14 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             shutil.move(srcsubdir, srctree)
             symlink_oelocal_files_srctree(d,srctree)
 
+            # In case SRC_URI contains multiple sources
+            # they are extracted into the devtool temporary workdir
+            # We need to move them into WORKDIR, otherwise they will be lost
+            for path in os.listdir(os.path.join(tempdir, 'workdir')):
+                if not path in ["source-date-epoch", "recipe-sysroot", "recipe-sysroot-native"]:
+                    workdir = d.getVar('WORKDIR')
+                    shutil.move(os.path.join(tempdir, 'workdir', path), workdir)
+
         if is_kernel_yocto:
             logger.info('Copying kernel config to srctree')
             shutil.copy2(os.path.join(tempdir, '.config'), srctree)
-- 
2.41.0


