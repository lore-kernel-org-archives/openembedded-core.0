Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D492BC83F18
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 19:32:39 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.4413.1693164751796320340
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 12:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=edKbBJAn;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99bcf2de59cso330249666b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 12:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164750; x=1693769550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oh/oWmI5NxCsZhxz9NsVtSOvMlWbflWmbtdhRAaNyO8=;
        b=edKbBJAn1uj7iUn056vQLTsBOSeQD8GHgmHhTygeHbYCJgC4LfjWEkLN0A2tG0/VNL
         lpNUQpS8BMCe1XzKmPMi+toantwhp6BQa6p1bUAv9bs2VadPHP520NUJ6Q3tZ1sE4DHf
         QgtLnVxSs2gGga5+4crx7mEbhtepgqDdNeRMqZbSX0G6ShOsxtdJVqMyPmC3FLHl2eLN
         QDGjN5/tkifk2b2IDv4srbBWFVeLi/M9nqOfQdDkkEjamqewacdYZIDJ10oZGTMPoV+s
         X2FLA0KdDiNUnbXnyJOGG1+Vty00fM4wWV7/dxa1oVRaNhe1+KUWnS2dnGtqCy5iF4xR
         yYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164750; x=1693769550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oh/oWmI5NxCsZhxz9NsVtSOvMlWbflWmbtdhRAaNyO8=;
        b=UmLN81Sp235IlYamqj80wjyzq37lhZEyVO8jFVZ9N3aGNewUG8kiQjJOQVVskXSFe8
         YhwSSIlM9gXekmhqaOxWPsg7L0hROKncRFo9qdfb0iNwtbjwQtUG7eSM6063NvRWMGh4
         A/3nCnvDpWC2iOR8zqoZpZY5TwHmKkTxu6MlGaoa5WyGvbGFJ4lzr2siieMzEYWHWJd+
         HiZ2P9Wmiokz6hfk6lkFVLJN/Thddy/qxVWj+8qRsyuwd+knhghUicvktda6wBD7fRrz
         QUFYdf2cXhBrwsIlAr6B0f4M26i17WrTRL+ICWthtSAYS7/nlpdb/7jG52UrFCRfD3A1
         nesw==
X-Gm-Message-State: AOJu0Yy+Dedo5XCSckfLEkKyGJpfSh4rl2tBgE7W80C33M/Csb7xoQF5
	7SMdqh8JzzQ6uOdaV6E8A85sXqaOV3w=
X-Google-Smtp-Source: AGHT+IGtFadjD7tXldU0N0LMy+9zdRZjqLPHOavMRbQHtVtu8REZiN84lhFrHuy4ig5kowbjsavs+g==
X-Received: by 2002:a17:906:92:b0:9a5:a068:5548 with SMTP id 18-20020a170906009200b009a5a0685548mr1731442ejc.75.1693164750010;
        Sun, 27 Aug 2023 12:32:30 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id lv12-20020a170906bc8c00b009a19701e7b5sm3740261ejb.96.2023.08.27.12.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:32:29 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 09/13] refactor: make strip_execs callable without d
Date: Sun, 27 Aug 2023 21:29:51 +0200
Message-ID: <20230827193200.4083340-10-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
References: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 19:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186789

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


