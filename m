Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2533C3F2D4
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:20:57 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web12.22002.1655666449191216128
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S5dLbKgt;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id i18so492085lfu.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2M59DV9KSK0oz9TPBtZO/rVVlzv0gmoU1XlQPGxMdXs=;
        b=S5dLbKgtP7T9K0P8HXUngaEjn070F4+eL3/Ua+pgttnOHc9iDVZ/0kJCGXBHm9Y8A+
         g2pDy0xi+75A21peywdFZdPN7zEUTVQ5HbZplOKl1PL4O1qzJwDpSeUXcn6511Kl/AAj
         DpLqg7LD98xnIGj2Yf56O+90zgZqqUDn9x0+FDiA5fT9nluSnK6qvm3A689kRHbVKt1W
         +SgQLnTr6wM8sfrRUTrwMvbuI0ESanKWy07U0EvsJmhby4YfMrOoHRlhPhKm6wy1bjcd
         CJ1MZiD7UNORN5C9m1ZZe8QFglN9+ARf+5ZUnd7xmD9n9sjR5NXQ8xkLHx6CYC/+OfCs
         vzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2M59DV9KSK0oz9TPBtZO/rVVlzv0gmoU1XlQPGxMdXs=;
        b=eaSJZ/vFOIRqejqvXoKPL/MmJ9tZk7g9xcvUhW5Wt9PaHC4mucPIjTCFAPrQ3j6olI
         BsGjjx2Ps+MdCTRpT0zYr28hS0Bew5C4ME41q8mvyanxaum+V5nmVdMj79+FTzw+R8Jj
         9ASzY9YHPmAWjAW7j0h7jCeh3GNpDJwe+JwcNfB+aJpCgj849yaPWy0VkwRAHnf75KcJ
         Xat+jnugTY3qBp4Lp0qMvPwAuujQ4omFmBoYoAjRDGUsIWBl+6NimV/2NUp2LeWv4yfr
         6JSWQzQnIxuwlAa4lNJ/srT0MMxaBZ2J0FIU0Pi8F4JDNP9jvAwzJPU3jCAI47dHKgy9
         LB0Q==
X-Gm-Message-State: AJIora/D6Wx8DzhT3fz5Z2Khf/AwtzcVP0j7CHq7KMMpSkTxKhGgPU8O
	i7V9DcRwmEtj56subRiOS9Yc3xrhmA==
X-Google-Smtp-Source: 
 AGRyM1v3v6ocj13KA7MKS7MpW1/FGkI/53gvd/PUqEoK/jJrKRzvooLWc22pWEZchKaKbA5qIRMqsQ==
X-Received: by 2002:a05:6512:e9b:b0:479:3911:3359 with SMTP id
 bi27-20020a0565120e9b00b0047939113359mr11486097lfb.202.1655666447550;
        Sun, 19 Jun 2022 12:20:47 -0700 (PDT)
Received: from pneves-XPS-15-9550.home (83.11.57.73.ipv4.supernova.orange.pl.
 [83.11.57.73])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a2eb741000000b0025a59470621sm817020ljo.26.2022.06.19.12.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:20:47 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v6 3/7] insane.bbclass: Make do_qa_staging check shebangs
Date: Sun, 19 Jun 2022 21:20:37 +0200
Message-Id: <20220619192041.1113263-3-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220619192041.1113263-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220619192041.1113263-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:20:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167041

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


