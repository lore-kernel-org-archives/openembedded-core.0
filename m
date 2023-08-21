Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EC2EE49AF
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:11:57 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.1061.1692634311452692323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 09:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HY5o3ajD;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-52683da3f5cso4290694a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692634309; x=1693239109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oh/oWmI5NxCsZhxz9NsVtSOvMlWbflWmbtdhRAaNyO8=;
        b=HY5o3ajDF65K5uQnzVh7Vio6C7Oe1CTiKH65ULmLqQ981VCt0IEqqFx4qnP1j/DDTU
         HJzMJCtNIJnxdfli6yoCSzh9XWMu85bOFM/2Sv8P+bmLf9Hc0EDTjk4DFxJRdorI/5jr
         cNJdVkS0KLdHk9bE8LqzZV3l3HJDMRtdxKfxDrOiQ7rmGC/KMn6Cx4qZAYYNNZojv5A4
         qmWdw5nWCZpIuq23XVflPnTXNMwc+muFQ3Jz3+122ef69RUSPqR3QP+IT3NHVVNsIe1x
         yngAxOL8CzgZpBPb9NplhEVk/716tiYcQqfJEk+SB9mRMokhD3mCCYusY47mWd5Vs3d0
         mpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634309; x=1693239109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oh/oWmI5NxCsZhxz9NsVtSOvMlWbflWmbtdhRAaNyO8=;
        b=PAs4a46Kx0arTrAZWJF1guT0shnM3aQeygFYRgsyON7qP8R1Q6Dj0zINSF2FWaX3zx
         ndO0sIQ9yByIRGMtgeu5FGy7mfQF3B4vMsUKqAgu/wPhFVYJ6My1sqZV1kCXyHCNnu6V
         PXB5BwlI1XYfFENDImUmOZi0zmu1Tchtnao7Xa/QR67qqecgP9wY52s1olb+Uqh4fEea
         B7l2V7xltQMxIPUZElAEdKgAqQg0nE/ATbTc1ZP+evcOXE9ugnO1WynVtG3Dk5J1ApH9
         VWHdqV8WrpVTXYmCsHQrpPYTVdf0MGC7Zs/pMU5RZuBAubE0M1WQNPEKHiU1GYP+quyA
         Po8w==
X-Gm-Message-State: AOJu0Yw/CPldyB3qgPfmRN7btWv+DL2G8Lds1RBdrUkVJRCk/6WgFYT1
	D89stt1ua7LL9pu5UJzvQl0YpNqG/L0=
X-Google-Smtp-Source: AGHT+IHuwuXspMMq/m4MW3QrlpVKXXR1rRP+dueurwy4HT0T/fiUm4VjOU46FT4dt5V4XxY/iU/puA==
X-Received: by 2002:aa7:c6c1:0:b0:525:7234:52bb with SMTP id b1-20020aa7c6c1000000b00525723452bbmr5137381eds.24.1692634309482;
        Mon, 21 Aug 2023 09:11:49 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id x21-20020aa7dad5000000b0052284228e3bsm6175579eds.8.2023.08.21.09.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:11:49 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 10/14] refactor: make strip_execs callable without d
Date: Mon, 21 Aug 2023 18:07:13 +0200
Message-ID: <20230821161120.171956-11-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821161120.171956-1-adrian.freihofer@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 16:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186473

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-global/staging.bbclass | 3 ++-
 meta/lib/oe/package.py              | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 3a300c32e7c..7f4075a5f6e 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -92,7 +92,8 @@ python sysroot_strip () {
     qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP:' + pn) or "").split()
     strip_cmd = d.getVar("STRIP")
 
-    oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d,
+    max_process = oe.utils.multiprocess_launch_max_process(d)
+    oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process,
                            qa_already_stripped=qa_already_stripped)
 }
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index ffca7559ba7..1dd20f85ebd 100644
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
@@ -164,7 +165,6 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripp
                 # ...but is it ELF, and is it already stripped?
                 checkelf.append(file)
                 inodecache[file] = s.st_ino
-    max_process = int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
     results = oe.utils.multiprocess_launch_mp(is_elf, checkelf, max_process)
     for (file, elf_file) in results:
                 #elf_file = is_elf(file)
-- 
2.41.0


