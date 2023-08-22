Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1520DEE49B4
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 19:23:56 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.5313.1692732226878226821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 12:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fdRW2+a8;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso643619366b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692732225; x=1693337025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oh/oWmI5NxCsZhxz9NsVtSOvMlWbflWmbtdhRAaNyO8=;
        b=fdRW2+a8L2mR9ha4P0/2Htzs5nTP9HSDybCf0WTRdKJGw0fUSdpnsYgRLtbaob9wJQ
         hJBefwO0XNH2tDAqIb+QpqH0FKVtefqXr7+dPfcLnU0yItxojbq2LenyKUlBc98ZIeY8
         wL3Y4cXCspn5tJgcU4weRAr0SeK21MbaxSSP2hr1iDQQUvQ1yDNHga04VV1TCrCF2tjc
         nsYTuahu9/lOnO48OpHw+hIsLO16VCuKTY5aN9aVTMWBOIytwWI1p/aMhp4bTn1LSb21
         O+t/d7Txw6JtO/U/Z1xCA/+KY168yRAex11LDclge933sdKExsG/jDjjFLoufHDVNJsU
         04lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732225; x=1693337025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oh/oWmI5NxCsZhxz9NsVtSOvMlWbflWmbtdhRAaNyO8=;
        b=D9BZYacN0nF+mD9RGoQIG0VXH4YelALXkWqDtAFs2DrJcO2m+xm5bkR0+wgGwuzvuz
         5r6jUUOsvJHINYDl2SvfNmijyXOwQK4kNX7ohHm88F8spOcOO1lzwqT7UaN2WI1YSiPB
         NsurR5PSG1yQh047OyQ44oUR8FLqdC1XS7n3g7u7uAQ/LIVG0ecriowcV7pVfja8xBNK
         Wlet0n3ME4NaIdzAWMSI0Xdxz+7LjRk0W3PSsfkiYzty10Z+XTY2JYN4DJPuhfw30ndd
         PQpg7f0zABuSJ1WbrJbVcb5IQL9muh2A1lq0yol0h0YPlIe/p2dydnAjHJOQliGDUCEL
         Yo4w==
X-Gm-Message-State: AOJu0YzCZaeiI+6rrz79v10TpZK3gu2dLFzoW0l+DrwN/ixBcgm3H74b
	9QFhDXycNXf7VGcapCrf/Mxqc80dw/U=
X-Google-Smtp-Source: AGHT+IH7au5mz2l5oYLyYqxMx683FEH2YE7ccUQWHjzvfvzgtH1uRXupd4u6gmAV0q+W0OUTVVa2GQ==
X-Received: by 2002:a17:906:3003:b0:99d:f2dc:97e3 with SMTP id 3-20020a170906300300b0099df2dc97e3mr8815766ejz.20.1692732225124;
        Tue, 22 Aug 2023 12:23:45 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709063b1800b0098f99048053sm8744041ejf.148.2023.08.22.12.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:23:44 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 09/13] refactor: make strip_execs callable without d
Date: Tue, 22 Aug 2023 21:20:15 +0200
Message-ID: <20230822192300.3235896-10-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
References: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 19:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186532

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


