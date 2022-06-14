Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84068CCA47E
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 13:17:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.5890.1655212621498481580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KwsFzFux;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: ptsneves@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso4782283wmc.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2M59DV9KSK0oz9TPBtZO/rVVlzv0gmoU1XlQPGxMdXs=;
        b=KwsFzFuxWYU5UcoFzmjGr/QHFuLoS1Pw49FvND3PbCogzUnw/5flxjC0TMQ2hatWRO
         73HhgQfOtL/vvSgnE5DLOu43aCEE0lGzlqPrQi6ID8SCcBwlBLLi92MaIcgTZ2xQaXzw
         i3WYrVgMc7DJAKtS0EnQSbLuswvsuvt2BovnUacp8MpLvkw6dTk65f/XO9AeL1vkoxy5
         Rs8GxgWQReuAe6F3C0RG+DJ/HJ4eS64lrd1BaeemPazqzjr0oQtikcbRC6Ur3VhRYCQj
         PNVgYdzAbVobMUXkHvtByjTGS1dl9ndhl5UUlhB1mwItbacp5VvyP+0NJkztpDjLOrsk
         r/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2M59DV9KSK0oz9TPBtZO/rVVlzv0gmoU1XlQPGxMdXs=;
        b=CGXbFlpJzYrKU3o5vnuoYlYLFz4BSQzbzfsBlUhue2GBrREb+7Fmv6JrTF44d3eW9k
         9200IoNOFMdd4D0kW9QRJzvfMnNNtD9Qdqhb0gtdWYCW9OcMkP/rFh4QhK++KteoF63m
         qH+SXjovs0M2ITR2CvwLpYgD7VAKOnUr0FAH3xmAEbpbVnpXormcraGxnM/vhdDzHA29
         CkJwqbEV8WMyMctMM5Bqv6XrYZSYxm4DtnXhHdR02uHoGbzc+0UTuKSnyrPM9t0CRSMs
         XVFaIdLMjLJ01YlJEQjRSOINMJTxjwQVf7TmysRjKRA/oxYdva/ceDfigjrWwlbhhsHm
         FLNw==
X-Gm-Message-State: AOAM5337M7AfXcZeic5qiKoD9O1OMko72AIBSeBk0IqNI0rd4BTjvNjB
	rA8LcftqAvYiOMmXdcK5JgxVfYn6Pw==
X-Google-Smtp-Source: 
 ABdhPJynStg+AzP0Qez1ynsXzEjaQ/VjGSx/ZEHwwNqfTzKgPhXi/rDWmWd9c70JIVj20BIbrZaB6w==
X-Received: by 2002:a7b:c38b:0:b0:39c:6964:34a2 with SMTP id
 s11-20020a7bc38b000000b0039c696434a2mr4036673wmj.165.1655212619998;
        Tue, 14 Jun 2022 06:16:59 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a5d6f0f000000b002183cf9cd69sm12161092wrb.15.2022.06.14.06.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 06:16:59 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v4 3/7] insane.bbclass: Make do_qa_staging check shebangs
Date: Tue, 14 Jun 2022 15:16:48 +0200
Message-Id: <20220614131652.566471-3-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614131652.566471-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614131652.566471-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 13:17:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166884

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


