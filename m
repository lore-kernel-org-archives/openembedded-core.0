Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A7ECA0FF3
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:59:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.27502.1693933179405316031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rGIB78wr;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-401da71b83cso26402965e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 09:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693933177; x=1694537977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c86nxg2BMAsLSg0HXWALOut08e2w5F1zYwmYIPR1IE=;
        b=rGIB78wrX0jh+Ldj+vbTnwKAwACrTsUb5yeOtAH83BIzBrmzZNA8vZSAvydVhAhpgJ
         8grBT4UdI6Z6aPpHOK3zITWnVbEHE8vtWQql53fy1XnSrLGa4/IIxrS5IrvHyGfzYa2e
         nFHGKMGzDhrNizmk3WO5egot2FKOs6wWJd1lvKgnRc+jyN5cUPsUjwXbPcSM06li0A2a
         tvYz1fwCPOP/OkYHa1s4DvQ+Kp/2splHPdBtwh0sqA5Gdh4I181+fAtxI/BXWjhAg0H0
         SHR38DlUeOcDwyWQKIFFvrePvveRgbrm1o7Xii5b/E9bSaKO6h/6PwacOKL9POY2sZhl
         hQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933177; x=1694537977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7c86nxg2BMAsLSg0HXWALOut08e2w5F1zYwmYIPR1IE=;
        b=XDu56fv15SA38C87LfW367mW9dSdNWQKepAG5DrIDBKfrGnuXr6GocaOjSnpqpiwkc
         YKng3xISSwBdoSst14mEWqGyN0uQvv597QrcG7QIEe7LVzYK3qBxt2NH4gFug7ho+Put
         /5Xmyg7UKDTtyUyv0o1OjsePvxc9EM/XcsiPhP7IMetuinv51z+NBIcOux7zyBSqnKw1
         Oy4PdUusUJPM9ahdpQz4l2+mVu93NIWmup0aNNIkOty30vDbwLiVdyGtZXHHzj93M35q
         c77bxsZ2Qkoa1ShrrU06Q4jGFbPS92a4SnV6/Iua3cedn2eisseR6bY+o2H2sGZS8Fbp
         yO3g==
X-Gm-Message-State: AOJu0YwTj+hSrM0l9+VNWap5T05yVK5JnygcXIWE+aId6KkGfJhxEAs4
	lJtlldgim06YWSs3jKwE+lBEaX2JnGw=
X-Google-Smtp-Source: AGHT+IEwwHxcX0jzPN0eFXigakBGQDbUDTrtPLSiyjbZs8IZ6cn1UY2dXpszO8GuhUpiFaxRaVMUug==
X-Received: by 2002:adf:e7cb:0:b0:319:8c35:37b with SMTP id e11-20020adfe7cb000000b003198c35037bmr328535wrn.7.1693933177632;
        Tue, 05 Sep 2023 09:59:37 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm18146269wrq.0.2023.09.05.09.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:59:37 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v5 09/14] refactor: make strip_execs callable without d
Date: Tue,  5 Sep 2023 18:51:18 +0200
Message-ID: <20230905165913.2560907-10-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
References: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187241

This allows to call strip_execs function from devtool without going
via tinfoil and a bitbake server process.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-global/staging.bbclass | 3 ++-
 meta/lib/oe/package.py              | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 3a300c32e7c..d229f401073 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -92,7 +92,8 @@ python sysroot_strip () {
     qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP:' + pn) or "").split()
     strip_cmd = d.getVar("STRIP")
 
-    oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d,
+    max_process = oe.utils.get_bb_number_threads(d)
+    oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process,
                            qa_already_stripped=qa_already_stripped)
 }
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 9d70925b9b7..1dd20f85ebd 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -114,7 +114,7 @@ def is_static_lib(path):
             return start == magic
     return False
 
-def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripped=False):
+def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process, qa_already_stripped=False):
     """
     Strip executable code (like executables, shared libraries) _in_place_
     - Based on sysroot_strip in staging.bbclass
@@ -122,6 +122,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripp
     :param strip_cmd: Strip command (usually ${STRIP})
     :param libdir: ${libdir} - strip .so files in this directory
     :param base_libdir: ${base_libdir} - strip .so files in this directory
+    :param max_process: number of stripping processes started in parallel
     :param qa_already_stripped: Set to True if already-stripped' in ${INSANE_SKIP}
     This is for proper logging and messages only.
     """
@@ -164,7 +165,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripp
                 # ...but is it ELF, and is it already stripped?
                 checkelf.append(file)
                 inodecache[file] = s.st_ino
-    results = oe.utils.multiprocess_launch(is_elf, checkelf, d)
+    results = oe.utils.multiprocess_launch_mp(is_elf, checkelf, max_process)
     for (file, elf_file) in results:
                 #elf_file = is_elf(file)
                 if elf_file & 1:
@@ -192,7 +193,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripp
         elf_file = int(elffiles[file])
         sfiles.append((file, elf_file, strip_cmd))
 
-    oe.utils.multiprocess_launch(runstrip, sfiles, d)
+    oe.utils.multiprocess_launch_mp(runstrip, sfiles, max_process)
 
 
 def file_translate(file):
-- 
2.41.0


