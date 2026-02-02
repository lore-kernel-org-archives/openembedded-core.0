Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2D9E7317E
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 13:54:48 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52592.1770040481197167069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 05:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b20rGj86;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8c6aaf3cd62so490557385a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 05:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770040480; x=1770645280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDDcFoW/iOAkw8Eno3lnW6gIAUGENGQde1UKHPO6AIs=;
        b=b20rGj863aw/6u0TXWpsJct8tSyssrtAhqGvhFm8IucROANniU++th5EYWnakSHzKV
         augRPEHhOsf5cWZ9kJbeZkaYDJOAxvQ18BokpB/43FmisvbYddcl3BoPTo6SlMFKGWbP
         11yOo6AWa38h+7+XXoAA6AKQXvCXCZZvVVd3+VzVNh8jqHA7AHssHkaYbsXLP1+NaazG
         rVA/yev8zyO5CR5XTZX/Kh/DWdlo4/WRW2hvIIldly7OmznJJPs255OWDundMWH7Mb0v
         8+ZCg6jYRrGKxJ7eyWfSBvyH0kMAZINcoQD4btqKl0h8ECaNHpFMlErm2d8BqcvVPR37
         FzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040480; x=1770645280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fDDcFoW/iOAkw8Eno3lnW6gIAUGENGQde1UKHPO6AIs=;
        b=mciJSoUduOdGj6oWi8pEYRTGBAb8A3GZC0JdMFskxoPQlva1yI1On3QG0TOkDJ6eD+
         GuAwxt66i7VdBPKTPOWUMoDbrGxEvCoejmkE/VBJVR0AwsHyGGaVU09CXYAZ4k1V9aZR
         0I0Mr2b1LCwtbPm4S6gv+Tfw8IWU+URFD4xffcjRGpJbjs9nLkf9aUnIii/gMnTNm7jk
         Swf9kCbFONB6sUYZI0MfNu8D1EcHo8kg5DHXmmmMzprOXWH5+kTlvljdt9DUUUcSUGaJ
         Vwc8j/wmA7N0E6PZSw7rlMjbhRdoGOaPb2s2siTNfiUBwyGUSRlwUKE6v7MGskDAwUKp
         7dFQ==
X-Gm-Message-State: AOJu0Yx5KIz9dPtSBJiR21aDbDps2Lsv1OmhWcyGpGDee1u7o5H3oVH0
	MkOFU5GFXp9T1FVch80D+axLCp3Ij/p+vZ9L/1lUvuH62XDUwJUuaIRm7IBEVb8W
X-Gm-Gg: AZuq6aKJchFIPOW4od3LNLjgoXx9ORsiPibDx8sYsFl71FVycOCPw0ZhV7/Cehiopwy
	HaIxteSMMfnGK03sMiEvAJziFDtapf4LWLRjSmHdhmOnzwOiAzfeb/9HalKIurM/amlOUMtd7IG
	j2TuGrST6NCCFu9ikNPKQ+07rSjqyaoWnD4UurgOwv0tPP1hM5Y8ZKqWGSsuOKF3UeH1uroiL0+
	Vut59MD++yacNXWVoXAGpk/O4IZR0H8SsuKCxTSMnwXGxRhyI/zrmBbARY/gKL+3eLsug57QhK/
	PHM2EdbvEJmdrdxaygd9amo3xt8zYd3uKwdUvIzXWIMvmiI0rreEcm3aY9AReo1Bf5+8ve0JbnH
	86+KFFaWxapfBKNGtVeBsVKEhuQdoRT0YFMu9gySVYEOGk1ma16kUa5esk/rtBbn4CE+tCDf9RR
	8f0xRHSE/pkjzBBcAGcodmvuCL+Zcs2d7qWXrk2tQyUlUU9P83sBWRc9Azut8+mK/o
X-Received: by 2002:a05:620a:20c5:b0:8c6:f76e:c6f1 with SMTP id af79cd13be357-8c9eb26430fmr1176494385a.26.1770040479528;
        Mon, 02 Feb 2026 05:54:39 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2845fsm1248654585a.31.2026.02.02.05.54.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:54:37 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH 9/9] oe-selftest -r wic.Wic2 (runqemu) -> PASS (mostly)
Date: Mon,  2 Feb 2026 08:54:14 -0500
Message-ID: <20260202135414.682558-9-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202135414.682558-1-twoerner@gmail.com>
References: <20260202135414.682558-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 13:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230361

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


