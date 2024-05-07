Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9422FC25B76
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 11:46:55 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.9480.1715082408509365177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 04:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=beyZ7+hb;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59c04839caso625467866b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715082407; x=1715687207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZuV6K7EP+DvEfVyw1ILZ0ycOKrtDUL+3lvt0f+lOGA=;
        b=beyZ7+hbShjtKVuq4MyQc0Dzya5sAtVOaLi+AJ1CFTXalsVJLukoPDCDfXe/YhfGvs
         FFRW6vVjOr+IhAamRbateGp5Z3GYwGxrDX5o7rx2TYpklyNRvLLD3m3ShlHVTPXl9xGk
         Y4TZXQmiqAqBiHsk0pv3zz4U3WOpufoxtulwgOQAqZwo2OJaN0M/iaT28Bfpmjf1LN8s
         WbF5X5xi7tbAiGPVo4gmv2fQwNKy32r+dhAg15j6OCfD0K4w1XPxEV9LPfO95mmWtGtC
         Rpvt/OsJBuNvO+zIJeiuUh2SQu5pJT2LrMjRvU7/59QGT6nv94AO1nV2iohPqKxgW6eM
         s/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082407; x=1715687207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZuV6K7EP+DvEfVyw1ILZ0ycOKrtDUL+3lvt0f+lOGA=;
        b=sTcwBo0Hv4b4JA2fMvAOSxCoQ9biSjxWIgNqutwW8FudRJ76ZnEfeSF3cpeHpWyhSY
         racurjG3FSA9Fg79IF9UQnlpNIomIP8Cfgo7dfGWAh0tWhpc1KdSaBsw5SCqIBKsuz+I
         U4KORMZ9PT3o9TLtuiDv1jjmoHAxxJJVq4EAFdExxT2xqGEdz3uA/Lmw1B5ewnCXnBsL
         17iIAn8k8VKLzNj9uA+EykXxQwhMAMUt8oExeGzn8RDfH6k+j7jqMrIQFyrc/Yw42DYJ
         m3IDD9So3GCgGQaWT1/zYWKwD/Y8DVoBQX/GX89zmXsqXJrkF3fVV/Ld6yaiahtjREzh
         079g==
X-Gm-Message-State: AOJu0YypA7zZIJAoJ5g60VIMvBKDZcUTOxhXtbJ4jRGN0lIOIACO3Fxm
	yRLMdW4uadIB7L63U1brblwCo95wylpDujpwG6Bb9721jjdUDOIuFW7QkA==
X-Google-Smtp-Source: AGHT+IGwHbhpeDdAEf5QGzmTvyLwjc2+MiPB758IivfDbwb723wdSbd11DbpDavGvU3CsjmgDp+BlQ==
X-Received: by 2002:a50:ab5e:0:b0:570:1de6:8a2d with SMTP id t30-20020a50ab5e000000b005701de68a2dmr8045902edc.10.1715082406863;
        Tue, 07 May 2024 04:46:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm5268215edb.10.2024.05.07.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 04:46:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 8/9] selftest/sstatetests: move exception list for cache objects to the parent class
Date: Tue,  7 May 2024 13:46:28 +0200
Message-Id: <20240507114629.2591882-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240507114629.2591882-1-alex.kanavin@gmail.com>
References: <20240507114629.2591882-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 11:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199091

From: Alexander Kanavin <alex@linutronix.de>

This is useful not just in cdn/local cache tests, but also in the build bundle test,
and so should be applied by default.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 26 ++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 8f843139ebc..94ad6e38b68 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -918,13 +918,24 @@ INHERIT += "base-do-configure-modified"
 expected_sametmp_output, expected_difftmp_output)
 
 class SStateCheckObjectPresence(SStateBase):
-    def check_bb_output(self, output, exceptions, check_cdn):
+    def check_bb_output(self, output, targets, exceptions, check_cdn):
         def is_exception(object, exceptions):
             for e in exceptions:
                 if re.search(e, object):
                     return True
             return False
 
+        # sstate is checked for existence of these, but they never get written out to begin with
+        exceptions += ["{}.*image_qa".format(t) for t in targets.split()]
+        exceptions += ["{}.*deploy_source_date_epoch".format(t) for t in targets.split()]
+        exceptions += ["{}.*image_complete".format(t) for t in targets.split()]
+        exceptions += ["linux-yocto.*shared_workdir"]
+        # these get influnced by IMAGE_FSTYPES tweaks in yocto-autobuilder-helper's config.json (on x86-64)
+        # additionally, they depend on noexec (thus, absent stamps) package, install, etc. image tasks,
+        # which makes tracing other changes difficult
+        exceptions += ["{}.*create_spdx".format(t) for t in targets.split()]
+        exceptions += ["{}.*create_runtime_spdx".format(t) for t in targets.split()]
+
         output_l = output.splitlines()
         for l in output_l:
             if l.startswith("Sstate summary"):
@@ -962,17 +973,6 @@ class SStateCheckObjectPresence(SStateBase):
 @OETestTag("yocto-mirrors")
 class SStateMirrors(SStateCheckObjectPresence):
     def run_test(self, machine, targets, exceptions, check_cdn = True, ignore_errors = False):
-        # sstate is checked for existence of these, but they never get written out to begin with
-        exceptions += ["{}.*image_qa".format(t) for t in targets.split()]
-        exceptions += ["{}.*deploy_source_date_epoch".format(t) for t in targets.split()]
-        exceptions += ["{}.*image_complete".format(t) for t in targets.split()]
-        exceptions += ["linux-yocto.*shared_workdir"]
-        # these get influnced by IMAGE_FSTYPES tweaks in yocto-autobuilder-helper's config.json (on x86-64)
-        # additionally, they depend on noexec (thus, absent stamps) package, install, etc. image tasks,
-        # which makes tracing other changes difficult
-        exceptions += ["{}.*create_spdx".format(t) for t in targets.split()]
-        exceptions += ["{}.*create_runtime_spdx".format(t) for t in targets.split()]
-
         if check_cdn:
             self.config_sstate(True)
             self.append_config("""
@@ -988,7 +988,7 @@ MACHINE = "{}"
         bitbake("-S none {}".format(targets))
         if ignore_errors:
             return
-        self.check_bb_output(result.output, exceptions, check_cdn)
+        self.check_bb_output(result.output, targets, exceptions, check_cdn)
 
     def test_cdn_mirror_qemux86_64(self):
         exceptions = []
-- 
2.39.2


