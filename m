Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD743EEB58F
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 16:19:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.39126.1694362766328156304
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 09:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JLsikuI6;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31f71b25a99so3308103f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 09:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694362764; x=1694967564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c86nxg2BMAsLSg0HXWALOut08e2w5F1zYwmYIPR1IE=;
        b=JLsikuI6yiV6CXPGQPVvfzqRlEugbPoOTKzvFdhwziA1hppxeZI4uZ+u4cAV7AcfPy
         v7W7NjguFG9vz3pnvrH1Mw5Y7ulYAEfWxwltIupTbtuku5UnvuYD2FqvG+lS2raijksa
         wQuk893soPtXA6OV2YU+p2hWOvGtBnwq3FfgvgmHue0UQ380199ZbWluE8uAvbxStS2B
         qkMj8AKtk0jNCBXB4WvgkFLkPLO4Dahc9Bq4RKYbUOXcUdzGypgEl+h5ZwWco03+NmmJ
         lhKwNl28ns/94kL2VUjpefnQPbtbsMUdhIyzoTbesvvCthJLSycXEnu0J2apcPDqt2+V
         eW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694362764; x=1694967564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7c86nxg2BMAsLSg0HXWALOut08e2w5F1zYwmYIPR1IE=;
        b=lHNEG/n5gdV0LHIcT76+A7H2jRvlfVUI/cgzuqdUMJj8ETQlRels6z7jVWVJ/crKW3
         G5c6GCOI9Lp1nu5SckIeRJjInDGYscAm5WFJ6rCsZvaz2hrBzP8acdnhR5z5bqanHJZ9
         1vL9sEh+Tx7IRmPo64JuJgLI/7NBGqDBJvDDCSw61eUIlFYhcihAajZJNqcAWQD8wtBk
         Im9Dtk0ZBkzKDDtzjZDpDyPmFGXm/vygHWNXv/fWmfuu48iczD1ZvClXx5wZei9O9TFY
         pbpRILdrboW5uoK/ySvqZWbYCG3c7x7xyASkztwytBcFmaVH4cYYIV/7j1C51hoSyLE4
         0V3w==
X-Gm-Message-State: AOJu0YzRhVfbuTK0DVD0vA9790V4DNNHtFA1uZux7s9YcAMQe0Lz3DCe
	9AzJ9iwEu4i+5skKxtbJPnWHuLfvO4k=
X-Google-Smtp-Source: AGHT+IGA9HTc5Dntbc3j04rvdVDME/bbDzE+dxbWUp1HwNNM2Ll0KBKsy+hmkV/QBjisz/U2lF66fQ==
X-Received: by 2002:adf:cc86:0:b0:317:5722:a41b with SMTP id p6-20020adfcc86000000b003175722a41bmr5665656wrj.7.1694362764600;
        Sun, 10 Sep 2023 09:19:24 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d408c000000b003142ea7a661sm7605431wrp.21.2023.09.10.09.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 09:19:24 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v6 07/12] refactor: make strip_execs callable without d
Date: Sun, 10 Sep 2023 17:52:33 +0200
Message-ID: <20230910161850.4032227-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
References: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 16:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187465

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


