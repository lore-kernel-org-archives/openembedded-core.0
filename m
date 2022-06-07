Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A24CCA47E
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 15:11:52 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.13577.1654614704539464193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 08:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cf0d17Eg;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id a29so306196lfk.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2M59DV9KSK0oz9TPBtZO/rVVlzv0gmoU1XlQPGxMdXs=;
        b=cf0d17EgL1JkJghn1n7mmEw/t1AYx+bGYbCH/ADYHBVuqFy+W12lKn2VOj5DBmhppu
         BaBHtQwq9nZzKJDxeGjG4NC3QDMVNzznO13jow3Mx+h+FD+0MjN4u0URYJOpHS+Ck3dQ
         b9wgqMSJlDofT7M1TylX7k93pnpzhzW+k34mRss4xjIXgducif2xS4+0x0mQVvlJUY0+
         kSsS++S6K2HwXZypA20SPx8H6jDhzGjjHukSFe5//3Ng67q5PLULHc7QrHx/QOyeyXm6
         Mp48xYf2Vz5HMYYzZOOVRBCJ2/+BnYftOBzrutNhkP/t7RmmPo+okAtaNa6DAJAH3xYI
         e02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2M59DV9KSK0oz9TPBtZO/rVVlzv0gmoU1XlQPGxMdXs=;
        b=j3HkSPw4Jve/Pa0/yKy96tvOA68Kc0rukVdVSNI0HwLVKOuclwdKayfNL9vRjETgdI
         o9Tkhg4z5PO8uAQxLqmyFQte1iKHmPUm5WaqW72RovktvwMNhc86Hevwph8KAklCAM5Y
         Q3+0THUKNFDSY+ra53pGs4f/9wIvNB3DbWhKGHSMiHlKhf5pPd1F54hHWpJv7lKQnC3p
         JOShgXX6iqJRDPXcI6ZVq4SuxMOudAvvNPQK2rDyHzEjvWQ16HRuYk5S9Kp6mGs+WS93
         7J07ht9drDCYzCfGorLdHUo5hKbdBSpuD2Fsq26cWsrDCkP5czc1LJB1nH+Y1dAxX4S6
         wTBw==
X-Gm-Message-State: AOAM531JiRRduxCsdRpo3cj7OMStG54IcO9GBhKZ8sJZ2t8MjcRZoi8Z
	gqpYdiMtbBw1BIOvS8MQXWSOO2RicA==
X-Google-Smtp-Source: 
 ABdhPJysECJVhehIYU9Eqz3DWznWs/RMBA/Xb6zcMdZ1Oy81e1FmJh8FYsc+OdgnIcjSZXQt/565pQ==
X-Received: by 2002:a05:6512:2627:b0:479:ef3:140b with SMTP id
 bt39-20020a056512262700b004790ef3140bmr17448530lfb.293.1654614702880;
        Tue, 07 Jun 2022 08:11:42 -0700 (PDT)
Received: from pneves-XPS-15-9550.sigma.local
 (85-128-83-172.static.ip.netia.com.pl. [85.128.83.172])
        by smtp.gmail.com with ESMTPSA id
 i8-20020a05651c120800b002556e0248dbsm2831089lja.124.2022.06.07.08.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 08:11:42 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v2 3/5] insane.bbclass: Make do_qa_staging check shebangs
Date: Tue,  7 Jun 2022 17:11:21 +0200
Message-Id: <20220607151123.3588947-3-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607151123.3588947-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220607151123.3588947-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 15:11:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166672

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


