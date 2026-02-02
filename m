Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88C6E7DF0F
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 17:08:19 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57911.1770052099198406118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 09:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SpTithBW;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c70ce93afaso506329085a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 09:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770052097; x=1770656897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDDcFoW/iOAkw8Eno3lnW6gIAUGENGQde1UKHPO6AIs=;
        b=SpTithBWF0W+XV/Ni5dKZdx0Xjpp6q5OHMURIAawnpP39JN8hIthfAQfSzrNZEVHnR
         PwHABWCMzqSXb9T5b4TqH/tJdnpy6xuxJ9RcJsHN56uAfF7HmUu7WW4XXBIKRan+t0xh
         WdBm/lJgQ57Fn++375B8JFwRkF3t5mWxNJHEUm7aL1Yh6yxiXUdMxCk7raDIjIwad3Jh
         yuldfH7mXFIPxk55J2MtUug/AYmDaNp7VwljT3KifL6odtzar1z5iWc6vM4SMxxJSG3L
         EhpvNJmjiYOLWn1GUKtdHt1TGj9ojcQA7WfVudkGJGdudIBg1MTxk65Hrq3l9rVVNAt/
         oKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770052097; x=1770656897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fDDcFoW/iOAkw8Eno3lnW6gIAUGENGQde1UKHPO6AIs=;
        b=qUovQ//F9v0Y0b8E3IMhMdUpo0pXraUn/Ysj9r83k4rTizhXKTiKABxGzz+FSaM3Zi
         eT2opMFmujA5PMn6ujPCjpjAKaR/T3jPVawGOnKRZCNHWLkQbYFlce4ImuUfsnxRjCq9
         2hw82pUD9yJPUvLmOgwVNOFUrJ68xIaubsGTOEP1956M/WOs0/o1su5pOKB7S3BkOCAW
         QjUszR/CPkMTI2RV7baITmquKrIeZJN84eJqfaud76bIlfBYqMPqCCugExZOf9xBPtqe
         OYqcArcfFYp8eHH3Rh8TWIKKSVVWhsrvrGhBhVqqtfsPDwh/yXJzr4ew7NeohRrsHFpy
         1BMQ==
X-Gm-Message-State: AOJu0YxEbEG8f32rmod9UofaGLgMvR8IeeXdYBMcMBnD/v0ZEWTnzriK
	9CqjFMkDbuarFKI/MEydLoarRJr124pW0sxDAunYQpKOWaWLZop5IbT4iLLR0FBw
X-Gm-Gg: AZuq6aJLW4lcp0eSKY96tk+ffBme3xAmEw2u3STegaJQEZNMQexPxFPOPu8p/kH5S/z
	AogjXuT5TC5mtGfqi+yf5U5W6GHGrYQtTAxlVseP4FDLw7f0+J13sgi/NgkrcvoEDmLBVDkcy8I
	BSArxIoo4ZClVZPL9SRRGqk+KILFbFeOGDecFFtP0d7Nf9dzjxLSXEUtDuu5o46dTer7flkX5Vr
	VIaa+yo8WMbHmETWmeJkbgVVd+kBCdztDasKc35ooXB9P8wOuC+rLef+aKto42WsrwR5m2ryyZL
	xFqe0GPEsFrt/ZvReqe+e8A7H/OdFJr7hMDeD8A8x7HFqxA/w4xwMEDe0xx3nmZsPrrBAkOevIZ
	/RbJaN4hQRCwvrw9aA/7ZtVQW7ilzuAWullBpHJkBa+EV9FaOJ1ZM3CoPpJuURzABczxd9rRaB3
	zIxbInapKlTtETega+aT2JRKJcVqG3NFXZRAv6n3tmRQEr4WBt5n5C3Q==
X-Received: by 2002:a05:620a:4151:b0:8c6:de6f:898e with SMTP id af79cd13be357-8c9eb1fbfe9mr1301533085a.9.1770052097310;
        Mon, 02 Feb 2026 09:08:17 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca02f07efasm502815585a.51.2026.02.02.09.08.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:08:16 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH v2 9/9] oe-selftest -r wic.Wic2 (runqemu) -> PASS (mostly)
Date: Mon,  2 Feb 2026 12:08:00 -0500
Message-ID: <20260202170800.4172778-10-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202170800.4172778-1-twoerner@gmail.com>
References: <20260202170800.4172778-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 17:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230388

Changes for the wic.Wic2 runqemu oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

NOTES:
- wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64 was skipped
- wic.Wic2.test_expand_mbr_image failed

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b35dbd9fb348..11182e05de72 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1131,6 +1131,7 @@ run_wic_cmd() {
                  'MACHINE_FEATURES:append = " efi"\n'
         self.append_config(config)
         image_recipe_append = """
+DEPENDS:append = " wic-native"
 do_image_wic[postfuncs] += "run_wic_cmd"
 run_wic_cmd() {
     echo "test" >> ${WORKDIR}/test.wic-cp
@@ -1147,7 +1148,7 @@ run_wic_cmd() {
         bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], "wic-image-minimal")
         image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], bb_vars['IMAGE_LINK_NAME'])
         # check if file is there
-        result = runCmd("wic ls %s:1/ -n %s" % (image_path+".wic", sysroot))
+        result = runCmd("wic ls %s:1/ -n %s --vars %s" % (image_path+".wic", sysroot, self.envfile))
         self.assertIn("test.wic-cp", result.output)
         self.remove_config(config)
 
@@ -1816,12 +1817,12 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                 new_image_path = sparse.name
 
             sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
-            cmd = "wic write -n %s --expand 1:0 %s %s" % (sysroot, image_path, new_image_path)
+            cmd = "wic write -n %s --expand 1:0 %s %s --vars %s" % (sysroot, image_path, new_image_path, self.envfile)
             runCmd(cmd)
 
             # check if partitions are expanded
-            orig = runCmd("wic ls %s -n %s" % (image_path, sysroot))
-            exp = runCmd("wic ls %s -n %s" % (new_image_path, sysroot))
+            orig = runCmd("wic ls %s -n %s --vars %s" % (image_path, sysroot, self.envfile))
+            exp = runCmd("wic ls %s -n %s --vars %s" % (new_image_path, sysroot, self.envfile))
             orig_sizes = [int(line.split()[3]) for line in orig.output.split('\n')[1:]]
             exp_sizes = [int(line.split()[3]) for line in exp.output.split('\n')[1:]]
             self.assertEqual(orig_sizes[0], exp_sizes[0]) # first partition is not resized
-- 
2.51.0


