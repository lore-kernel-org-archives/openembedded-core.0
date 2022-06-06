Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10816C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 15:58:25 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.6.1654531095898287330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WK8l/xly;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: ptsneves@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id y15so10833376ljc.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FI+Ba/Nd5qll1yZ+zqW2gvsDrb1buXJ9ijvgeYUH6WM=;
        b=WK8l/xlyW/CTJMMhrytej7rya/NCgXSQmzgiqbABQTMQFx4IOKvq1HQlKmlLcaRgb+
         50tORS1umlWc+QVPSU4quL66KAaq1Qa9pPdldqxTjEstn82dL5cbuOVuHhb8epUG4X8p
         rEuY7fc+2gS11QXsiYJas+M2Q4Q1/mAgUEnMntt/o1/W13+xuUYOWpYTEn0SfXIOxas8
         QCipQzlGMJDbtjW17tZE4wpSBvcaXpHz+/2JqUuPwMaOvsLQ1SeBFSJKI5zX6ptbyFWa
         RL4N3FkvLqbqqoJPk20xEstco/Dqszq/Oq7a710oZCmkVWFS+btPpzbS54+M1kJ/0xvm
         y+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FI+Ba/Nd5qll1yZ+zqW2gvsDrb1buXJ9ijvgeYUH6WM=;
        b=srNXwMVjrxSx4cGEaNOF+NRLefud0gR3JVOMoLEa2fPs0tIYc881HZXTGk5h0AxAbj
         I4RcSwLsuuseirq5vI6zLVebKKOp93w0LbIFsD4pYgB1QzkuwX4XUdC0eu2vPKZE9nqk
         ROK7N2V/mRpQQvfuXkqa6K1UrI9bbFgOVSiB2zvcGrqk5HKdlTNfmEO0yYXrfuYNdCwH
         C3tbjj9mLsk85dDrkzzQQ4lSEnl4Y3CUtkpuwugbR+8XcCluxnmLGa3nlE0OcuHyZlgU
         UldYXjzi2brzo+ld4Dd0VBh0eJYEdTCwWnziWyWdJoulCiI2qzpQlbEttmeH2OJKuJYV
         kzuA==
X-Gm-Message-State: AOAM532dHYCN93IT0R6up3fT8uEPfZghmcBVCeAi6ZvqE504k+FKLZ/z
	FV5NleTefMvbRxuc6ivqvZ1H+zvhQA==
X-Google-Smtp-Source: 
 ABdhPJwZcuyvf/+szPUzcDwkuY2pkkMnf8C3DVaifmAVFdN2E39YXRRN+Ug8qZ/XHv3rgU++FmeAeQ==
X-Received: by 2002:a2e:9682:0:b0:255:7b9f:6e8a with SMTP id
 q2-20020a2e9682000000b002557b9f6e8amr10402524lji.19.1654531093964;
        Mon, 06 Jun 2022 08:58:13 -0700 (PDT)
Received: from pneves-XPS-15-9550.sigma.local
 (85-128-83-172.static.ip.netia.com.pl. [85.128.83.172])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a056512110a00b004791c4858e0sm1595074lfg.114.2022.06.06.08.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:58:13 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH 1/3] insane.bbclass: Make do_qa_staging check shebangs
Date: Mon,  6 Jun 2022 17:58:05 +0200
Message-Id: <20220606155807.1414519-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 15:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166651

As reported in the bug report [1], there was no check for shebang sizes
on native scripts and now this is fixed.

The path scope of qa_staging needed to be increased from just
checking libdir to all the relevant SYSROOT_DIRS.

It is possible to skip this check through INSANE_SKIP.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053
---
 meta/classes/insane.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9ca84bace9..dd0cf2a769 100644
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
+        qa_check_staged(os.path.join(sysroot_destdir, sysroot_dir), d)
     oe.qa.exit_with_message_if_errors("QA staging was broken by the package built above", d)
 }
 
-- 
2.25.1


