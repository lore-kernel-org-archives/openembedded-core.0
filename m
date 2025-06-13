Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9110C71148
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 15:58:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.651.1749830288930032917
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 08:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hTC0qjfF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so17845435e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749830287; x=1750435087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=en7DIljVEZR5bs3htRn2ATbsA3cp2Vu4DZmi4fW6A4g=;
        b=hTC0qjfFXfWAr6grda/VwtThMe3glvb4wx8sZ+b1oDECSFS2BbjmFeH/RxMyZ4Up4U
         /q32/TxZ7buNTPUhBU3MpI+aQJmoFquj+I+DMdYIpJhZvm2jfAb3WqMGLlxEr+B8rMi2
         xjlBBnCtmW0XtweaiKHYVS+AOHPprozWiv6Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830287; x=1750435087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=en7DIljVEZR5bs3htRn2ATbsA3cp2Vu4DZmi4fW6A4g=;
        b=c+aaXZvfBqv+JhGfDixJai9WpIdLV/DAU98sunJhu63Jp1KPSMsj2VrWnMMbGPQYkj
         7Z+dio2676ha2HApzRA84t9acNffx1+JfXCVPoKZds+CeyXMKGdCAJpof4/xxD0kWXDr
         JD/Z2H5oh1aIAP4DS7gjjdnLBrz3xdne9XXAJh/G4yd9T6RSt8k8hvN+IGTaUQPBFM3L
         vlfcvnO5NFN2GB9SO/9ClBEjn3vZwTjz7rw7mO9BNKGXO/iGno5f4TJE2+RzG6h2UHsb
         T6P1y7gbvRuMQzGLM/FQc+HVGdCdp4iokEtbxDqK+JR2rSxiam0rRptSDbzWvONUzk2Z
         kwHg==
X-Gm-Message-State: AOJu0Yw5Hg6GyWGLbereGjac2FD1JUWOXjMUGcjc73p76SXTp8E8k3nQ
	ZxvrqtQlbY/sHmNzTkqTWEa0b47qITLFNwR0VbrdQGrWj8ad/OnpzhWI0SJemn/MyUq2XpxvPKn
	gZMyebBE=
X-Gm-Gg: ASbGncvfAv+LGMCXn7rVeqUTWL25PGLUjpXO0loVbwtIdYfGKWeXmDm1nLL0GovHeNz
	+WmhqQdxqy22UgIAwkhN7bkOTuD6he3s85yrd6zxfzbEYsPXVG7aad1Omi2tc16Ajk8e/u6/Aaz
	RbJz2SpVQXJQ0NIU6HayRQPyfOhTiHLI0Y5dKzqwQ+ftgVNiEJsPppp1LYvRik8eRIE4ohpGFZL
	jmqAm1k2NRVDP0iZ8b9E0u+naEf2zVm+QeVsH5Ot5/UeE3+G0LHEq//AGxn8gRQE7sXjkb8i0OS
	RWo3cX7FhPdMNKZHYM6jlS/sjbLJkD2DejjtaKEeh8445HTlymDeOHV4GhI0nFw8qvUYXnqCmOu
	SMWbnXOTyu8fPqCc=
X-Google-Smtp-Source: AGHT+IHPv6QqlB0uZoWAOdfDUtmHYkgi+r/dgyaabM1QJ3Kgaxf4TyBnbfITl1DQuOLuPOod16M5Bg==
X-Received: by 2002:a05:600c:a42:b0:453:608:a18b with SMTP id 5b1f17b1804b1-4533ca54d23mr1445535e9.9.1749830286599;
        Fri, 13 Jun 2025 08:58:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3ba4:44fa:9d9b:3977])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24420csm55250765e9.20.2025.06.13.08.58.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:58:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe: Move vardepexclude entries alongside functions
Date: Fri, 13 Jun 2025 16:58:02 +0100
Message-ID: <20250613155802.1599801-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 15:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218616

Now we have decorators that can do this, move the variable dependencies
exclusions alongside the code that needs them for maintainability.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf     | 8 --------
 meta/lib/oe/package.py     | 3 +++
 meta/lib/oe/packagedata.py | 3 +++
 meta/lib/oe/path.py        | 3 +++
 meta/lib/oe/sstatesig.py   | 2 ++
 meta/lib/oe/utils.py       | 5 ++++-
 6 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f085a0f7475..54d6bebc39f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -986,11 +986,3 @@ MULTILIB_VARIANTS ??= ""
 # support unihashes.
 BB_UNIHASH ?= "${BB_TASKHASH}"
 
-oe.sstatesig.find_sstate_manifest[vardepsexclude] = "BBEXTENDCURR BBEXTENDVARIANT OVERRIDES PACKAGE_EXTRA_ARCHS"
-oe.utils.get_multilib_datastore[vardepsexclude] = "DEFAULTTUNE_MULTILIB_ORIGINAL OVERRIDES"
-oe.path.format_display[vardepsexclude] = "TOPDIR"
-oe.utils.get_bb_number_threads[vardepsexclude] = "BB_NUMBER_THREADS"
-oe.package.save_debugsources_info[vardepsexclude] = "BB_NUMBER_THREADS"
-oe.package.read_debugsources_info[vardepsexclude] = "BB_NUMBER_THREADS"
-oe.packagedata.emit_pkgdata[vardepsexclude] = "BB_NUMBER_THREADS"
-oe.packagedata.read_subpkgdata_extended[vardepsexclude] = "BB_NUMBER_THREADS"
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 60392cbcedb..ce69151e5d3 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -16,6 +16,7 @@ import mmap
 import subprocess
 import shutil
 
+import bb.parse
 import oe.cachedpath
 
 def runstrip(file, elftype, strip, extra_strip_sections=''):
@@ -1049,6 +1050,7 @@ def copydebugsources(debugsrcdir, sources, d):
             if os.path.exists(p) and not os.listdir(p):
                 os.rmdir(p)
 
+@bb.parse.vardepsexclude("BB_NUMBER_THREADS")
 def save_debugsources_info(debugsrcdir, sources_raw, d):
     import json
     import bb.compress.zstd
@@ -1081,6 +1083,7 @@ def save_debugsources_info(debugsrcdir, sources_raw, d):
         with bb.compress.zstd.open(debugsources_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
             json.dump(sources_dict, f, sort_keys=True)
 
+@bb.parse.vardepsexclude("BB_NUMBER_THREADS")
 def read_debugsources_info(d):
     import json
     import bb.compress.zstd
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 2d1d6ddeb75..b6a10a930a5 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -7,6 +7,7 @@
 import codecs
 import os
 import json
+import bb.parse
 import bb.compress.zstd
 import oe.path
 
@@ -64,6 +65,7 @@ def read_subpkgdata_dict(pkg, d):
         ret[newvar] = subd[var]
     return ret
 
+@bb.parse.vardepsexclude("BB_NUMBER_THREADS")
 def read_subpkgdata_extended(pkg, d):
     import json
     import bb.compress.zstd
@@ -182,6 +184,7 @@ def runtime_mapping_rename(varname, pkg, d):
 
     #bb.note("%s after: %s" % (varname, d.getVar(varname)))
 
+@bb.parse.vardepsexclude("BB_NUMBER_THREADS")
 def emit_pkgdata(pkgfiles, d):
     def process_postinst_on_target(pkg, mlprefix):
         pkgval = d.getVar('PKG:%s' % pkg)
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 5d21cdcbdff..a1efe97d881 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -10,6 +10,8 @@ import shutil
 import subprocess
 import os.path
 
+import bb.parse
+
 def join(*paths):
     """Like os.path.join but doesn't treat absolute RHS specially"""
     return os.path.normpath("/".join(paths))
@@ -77,6 +79,7 @@ def replace_absolute_symlinks(basedir, d):
             os.remove(path)
             os.symlink(base, path)
 
+@bb.parse.vardepsexclude("TOPDIR")
 def format_display(path, metadata):
     """ Prepare a path for display to the user. """
     rel = relative(metadata.getVar("TOPDIR"), path)
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 826549948e2..ef687f5d417 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -3,6 +3,7 @@
 #
 # SPDX-License-Identifier: GPL-2.0-only
 #
+import bb.parse
 import bb.siggen
 import bb.runqueue
 import oe
@@ -493,6 +494,7 @@ def sstate_get_manifest_filename(task, d):
         d2.setVar("SSTATE_MANMACH", extrainf)
     return (d2.expand("${SSTATE_MANFILEPREFIX}.%s" % task), d2)
 
+@bb.parse.vardepsexclude("BBEXTENDCURR", "BBEXTENDVARIANT", "OVERRIDES", "PACKAGE_EXTRA_ARCHS")
 def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
     d2 = d
     variant = ''
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index d272dd2b8da..a11db5f3cd9 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -9,6 +9,8 @@ import multiprocessing
 import traceback
 import errno
 
+import bb.parse
+
 def read_file(filename):
     try:
         f = open( filename, "r" )
@@ -265,6 +267,7 @@ def execute_pre_post_process(d, cmds):
         bb.note("Executing %s ..." % cmd)
         bb.build.exec_func(cmd, d)
 
+@bb.parse.vardepsexclude("BB_NUMBER_THREADS")
 def get_bb_number_threads(d):
     return int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
 
@@ -467,7 +470,7 @@ def host_gcc_version(d, taskcontextonly=False):
     version = match.group(1)
     return "-%s" % version if version in ("4.8", "4.9") else ""
 
-
+@bb.parse.vardepsexclude("DEFAULTTUNE_MULTILIB_ORIGINAL", "OVERRIDES")
 def get_multilib_datastore(variant, d):
     localdata = bb.data.createCopy(d)
     if variant:

