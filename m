Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F053DC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 15:11:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.7466.1655219474136673477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UD662GjF;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id h19so8481929wrc.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2M59DV9KSK0oz9TPBtZO/rVVlzv0gmoU1XlQPGxMdXs=;
        b=UD662GjFc5WihSgmvmBa8eh8rP0belY0ZlOItPUxGquTUh7L1rsRN2io2wFd08mojo
         +Io9uZG9G9BCnEO0lEncBqzMd3psE0/BmWvsbfdLnhWGXa/mxYXDxz6kiB0vqi1eqxVr
         0DjY5B4LMkuRhkn1TrH5G/KTbZPimtZLY5kXz3izTcSqSeq3BYNqc8GmFyB4sBpx7aj3
         vzS1QJ7HO5PmDiI8cyB5tvGi5ZodMeknPuHSzZWcpbrhMHgZw1xGX0SJONhnjr8dQPOD
         P2s9Wwxn9DhqgT4Vh+Ic82uKwmT0576r0xoLGWNaYFI25l4nDsOl3sxsl4V0qqyWnI2m
         72Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2M59DV9KSK0oz9TPBtZO/rVVlzv0gmoU1XlQPGxMdXs=;
        b=wlHR3CCaoaqb/mORGykMfh9GGvnU5zZ85M02W6Xyju3gKkMPCerOgpwMKGqci74kDy
         NUI7X9QAImHMyg0nPku4wqPWUiWN2Dgg3bJhGB5drI8LV2fzWp5+WEHmOtrfcmZiOhX/
         9JVHhftF48i5m5Jn20RSGdxKHDQ9PStH9iYB0ux9gO6wJsAyoyX9rQFQxZB3eA3wn8oz
         /2AraFtFnE6chC/F+7XdF0IiMgoneaGa5+UC7eIHF1qRBufCX80AseNGPTV8npdIuBVj
         1iYserzJvDERKZcqtVxhh50Z+Dmu9SWqwxAaGJ+hoWUD7p68ai31iJ8yTmmkpz3Is2qr
         y9iQ==
X-Gm-Message-State: AJIora/4NN/QenYgzAt/vybQljGFZWxgo/VuQeGzVE+INc/bhP2cKy95
	nlpdjLj0JgNyVe6mVZyB3q/lxXcupg==
X-Google-Smtp-Source: 
 AGRyM1vGHBBrTMhbV/YkuHdK8ikZePLXKCR6hYqXUrzgOpz+H9dKBXFfHSdzSzdMeOa0Qew6ETSC+g==
X-Received: by 2002:a05:6000:144a:b0:218:5f66:294e with SMTP id
 v10-20020a056000144a00b002185f66294emr5455629wrx.446.1655219472749;
        Tue, 14 Jun 2022 08:11:12 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 h62-20020a1c2141000000b0039c151298b7sm18114522wmh.10.2022.06.14.08.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 08:11:12 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v5 3/7] insane.bbclass: Make do_qa_staging check shebangs
Date: Tue, 14 Jun 2022 17:11:01 +0200
Message-Id: <20220614151105.1890454-3-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614151105.1890454-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614151105.1890454-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 15:11:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166897

As reported in the bug report [1], there was no check for shebang
sizes on native scripts and now this is fixed.

The path scope of the qa_staging was increased from just checking
libdir to all the relevant SYSROOT_DIRS.

It is possible to skip this check through INSANE_SKIP.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/classes/insane.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9ca84bace9..b2951a48fe 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -630,6 +630,11 @@ def qa_check_staged(path,d):
         bb.note("Recipe %s skipping qa checking: pkgconfig" % d.getVar('PN'))
         skip_pkgconfig = True
 
+    skip_shebang_size = False
+    if 'shebang-size' in skip:
+        bb.note("Recipe %s skipping qa checkking: shebang-size" % d.getVar('PN'))
+        skip_shebang_size = True
+
     # find all .la and .pc files
     # read the content
     # and check for stuff that looks wrong
@@ -651,6 +656,13 @@ def qa_check_staged(path,d):
                         error_msg = "%s failed sanity test (tmpdir) in path %s" % (file,root)
                         oe.qa.handle_error("pkgconfig", error_msg, d)
 
+            if not skip_shebang_size:
+                errors = {}
+                package_qa_check_shebang_size(path, "", d, None, errors)
+                for e in errors:
+                    oe.qa.handle_error(e, errors[e], d)
+
+
 # Run all package-wide warnfuncs and errorfuncs
 def package_qa_package(warnfuncs, errorfuncs, package, d):
     warnings = {}
@@ -1139,7 +1151,9 @@ addtask do_package_qa_setscene
 
 python do_qa_staging() {
     bb.note("QA checking staging")
-    qa_check_staged(d.expand('${SYSROOT_DESTDIR}${libdir}'), d)
+    sysroot_destdir = d.expand('${SYSROOT_DESTDIR}')
+    for sysroot_dir in d.expand('${SYSROOT_DIRS}').split():
+        qa_check_staged(sysroot_destdir + sysroot_dir, d)
     oe.qa.exit_with_message_if_errors("QA staging was broken by the package built above", d)
 }
 
-- 
2.25.1


