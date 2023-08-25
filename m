Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93181C83F06
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 22:27:53 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.2563.1693002465036979080
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 15:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Uo80PU51;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso2129516e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 15:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693002463; x=1693607263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oh/oWmI5NxCsZhxz9NsVtSOvMlWbflWmbtdhRAaNyO8=;
        b=Uo80PU5125cmKvlyTrNL5u/KbmZ9ovhiACUrEPn6e0bcdhBWm3uNRAujNWVpYcaoHB
         HrjofO5VXNXCYeeFzk6P/YnLSGgll9Q5VtITJaq2q/ZWS+hGxvoZA+F9aYUXcFtkpU77
         tcG8RTiyONd2o85/8TZ4vI1FYkGI8eMK8AGtv4+2zfsihR2MDiSgZT1DJU90KSna5XkM
         VgmulbY4t1372NPNBI6c/6Ip6ES4/tdBe1ebUbpt7B52Lt84Zhw0IWSz55B/G6FQhwQZ
         VoJsFkgbZ+UJV/mZ2EvgYIqygwJQOeBmyWz3RcGZxPUKApEMXcprJY/9aSCm1Drnn47v
         +PcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693002463; x=1693607263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oh/oWmI5NxCsZhxz9NsVtSOvMlWbflWmbtdhRAaNyO8=;
        b=ErAX7xCiIWhxA/vriB/7lnlcw+0voBUTc+2m2NQl4ekbpnlxggPrmnxlNWljkAZoXP
         sTQT0ptEFfzawyHelDC1CBAo7u7C/Zpor3Slr24ItpyeVtywsM3xnAzGZJqx4L4FbwCs
         +igZc11hQfczKiWTmPd8/N7oIi8PoqQfL94TB/3TjIOTIOdD9du+7kHv5vIx3dLpTQMW
         Cw6CodsveKLPqW2svI9FtegRFTD6TSTAXlnaVKxQRO8r68u6JAC/pq5n2wVNmcaKQ69J
         Hn4DRmKs6w/h1HMi47TGpszSJaNzo/OrbkhwDKGSaby+EYV5MogsYKHLPSSn3eyvoAju
         MlNw==
X-Gm-Message-State: AOJu0YwAOnnRn9fEpJ0TU1DcXoH3jRhTMtX1yH883mx7aLal6XhDEFbW
	ZFxAnL/fxzdsZmYulmqc/r01VzD/n74=
X-Google-Smtp-Source: AGHT+IENLNGGmYWx24A0Cbt8uTDMY1up/CTcGdVUs22xUeZeEp1VQDtX9oyZBjIn6FwBbx+lz2vdTQ==
X-Received: by 2002:a05:6512:ad1:b0:4fb:52a3:e809 with SMTP id n17-20020a0565120ad100b004fb52a3e809mr14892374lfu.28.1693002462948;
        Fri, 25 Aug 2023 15:27:42 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7d058000000b0050488d1d376sm1449057edo.0.2023.08.25.15.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:27:42 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 09/13] refactor: make strip_execs callable without d
Date: Sat, 26 Aug 2023 00:25:49 +0200
Message-ID: <20230825222711.2735745-10-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
References: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 22:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186736

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


