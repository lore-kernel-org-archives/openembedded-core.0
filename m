Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E12CCA47D
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 21:43:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.32716.1654897403672915518
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mxlO2jQ1;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id x17so184200wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2M59DV9KSK0oz9TPBtZO/rVVlzv0gmoU1XlQPGxMdXs=;
        b=mxlO2jQ1WTt3ddjaa2Chk5lir5NytcQXcighQt884TzIVqMozHkoxuuR/6w5RQ/Vi/
         Z5LHhbOnMlXDdOvIrTVvKB3X+7l+gwyLExU4TyQ7G4zdo1Si+TEANKb9twNBVI3kGwLf
         n4+pRBaUzvzZn4fUefcGYzQl61BC8sB0a5f1pXTF41SYpVfyCIzBn7G3qs23OQRrUGsu
         3XV5TXwiYsXddT1KZQmTWCYHJ7AACfmE641KHAN6P+XPO10LKpYnOHvwf4b70Tsi7Bt/
         EKLp5epln4B1OjRk8BKoRSBziAndiU4Yyuem0xngCiHNTg1Xz1EZZu55oeESq74bBmvs
         GhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2M59DV9KSK0oz9TPBtZO/rVVlzv0gmoU1XlQPGxMdXs=;
        b=2fI7KNoO9COHWOFijixIdUoiJPnHT0QtzDJ6V1mHTfzjl1C1pxxKVp5cMp9abpeakk
         xa2sKI8oJioMZK/ppuAB3W4dstDPTX7JYGP7v3anGG0YB0HQHZuoP0uuzayAboe5u7rq
         Ibppbe7/el3M1gUW8m3/VeTf+Os99+9YFSx2Ds6qdDPJFq+pKWOVkpYBxNd21B0z3M89
         RyiVYv3aZYjef43i4GOZFIS7cbs3upn8Q5Dw443YcP0kWgPEMiHdTfgLCejMD9ak8oLW
         s4rPRK4dun3kwmKuI9smrMPsOW2iM+DBSYsdvNjW/DNEBDNnMapQp/kSWMxQvebNVM+7
         l1aQ==
X-Gm-Message-State: AOAM531+z9r+y4MA9ox4YY/w5JrH3Cn30qYbB1vuiS0GZWFUg80eJsDx
	SBPO8knFeHuaFwahyOBWkTdbJkSH9w==
X-Google-Smtp-Source: 
 ABdhPJwdYAx836K/8rtJETAdjc8R3axaoCebt3oEdrA87ZHU5kVW9ab/Vy1xyu52yr+gZoL9qyWZ/g==
X-Received: by 2002:adf:e2cb:0:b0:20c:c1bb:9fcb with SMTP id
 d11-20020adfe2cb000000b0020cc1bb9fcbmr47367695wrj.35.1654897402038;
        Fri, 10 Jun 2022 14:43:22 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 e15-20020adfe7cf000000b0020feb9c44c2sm579309wrn.20.2022.06.10.14.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 14:43:21 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v3 3/7] insane.bbclass: Make do_qa_staging check shebangs
Date: Fri, 10 Jun 2022 23:43:10 +0200
Message-Id: <20220610214314.2754247-3-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610214314.2754247-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220610214314.2754247-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 21:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166815

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


