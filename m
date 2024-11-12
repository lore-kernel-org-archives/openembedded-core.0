Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB98ED597B7
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 23:11:40 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.100479.1731453094939718187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 15:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=A5lRvV6F;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431688d5127so50032045e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 15:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1731453093; x=1732057893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJ7jgy7ISO+q3HRTlWHCwSo7wNlpWgbJw3HPptqX0yk=;
        b=A5lRvV6F69/oYMnVfa4W/whKu8hOEK161d2EV3e7NNCnMg7QZ/LJ3Ko5Sb1Lh8s5oB
         At5b9uP/sG4GkYiKbAT3/rfhN4w8FcLi0IlQ/5t8YfGukuBuQjSMDdpzA0mbAJuF+pNh
         UVPyGDtwXF1EnI1hS9ihY7ie29FVNTt4Ho9zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731453093; x=1732057893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJ7jgy7ISO+q3HRTlWHCwSo7wNlpWgbJw3HPptqX0yk=;
        b=F0vQf1zkVUIlVvq369fdEl16cAauqJlJjNXkUIDTvwT7rNZHVuYsqx2Rx+TDw7gpWJ
         APS6hKWy/4zLxbHMrHjly6LoTZ2D/ornAe8BT9xUO5eNUx4QzYbR1YBFsL8zW3JY2IpA
         y5+TvtNW6trDedbSzE79KHv0FqNEFCiaqAyVITeJHCv2QrTbFncijOBlMyKwTWubmEGa
         UrpBHIKSJJbIpCw2HgN/cUkDz1UQX+wVRv5YtUi38DGD//2xhhnFq+DXf36r+nKrpuWq
         lciEubj5ts5MIQLFyvaaHWISy929aUMOUyEMhWDlcQ2LnkGg4FDmeMt6umQNS10gfLDc
         VWDQ==
X-Gm-Message-State: AOJu0YwOaXLSWVjFwKdY9jUP3hv1i7iJ78b+HOiYbH1baAx2YI4mjIDO
	KqRhAZGtLEff+2ugDEGFanzMnkg7i8TQ5ebulNgc79iultUPdF7m1KOFl4lVLgtuoxET5BJUIC8
	P
X-Google-Smtp-Source: AGHT+IGi+8SymCa/Rn83ce9KdfEC/UurF2rJBMAjN47E41B0Tack4wsPb7opiL7cLeeOTvwK67sluA==
X-Received: by 2002:a05:600c:4746:b0:42f:80f4:ab31 with SMTP id 5b1f17b1804b1-432b750a43emr165620015e9.18.1731453092769;
        Tue, 12 Nov 2024 15:11:32 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54f70d8sm2546145e9.16.2024.11.12.15.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 15:11:32 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] oeqa/selftest: add a test for bitbake "-e" and "-getvar" difference
Date: Wed, 13 Nov 2024 00:11:26 +0100
Message-Id: <20241112231126.2036487-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 23:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207069

From: Yoann Congal <yoann.congal@smile.fr>

This is a non-regression test for [YOCTO #15638]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
NB: This test currently fails on master, it needs the fix that was just
sent to the bitbake ML:
[PATCH 1/2] tinfoil: add new "finalizeData" API
https://lists.openembedded.org/g/bitbake-devel/topic/patch_1_2_tinfoil_add_new/109545383
[PATCH 2/2] bitbake-getvar: use finalizeData tinfoil API to get identical result to "bitbake -e"
https://lists.openembedded.org/g/bitbake-devel/topic/patch_2_2_bitbake_getvar/109545384
---
 meta-selftest/classes/test_anon_func.bbclass |  3 +++
 meta/lib/oeqa/selftest/cases/bbtests.py      | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-selftest/classes/test_anon_func.bbclass

diff --git a/meta-selftest/classes/test_anon_func.bbclass b/meta-selftest/classes/test_anon_func.bbclass
new file mode 100644
index 0000000000..b1197dc7a4
--- /dev/null
+++ b/meta-selftest/classes/test_anon_func.bbclass
@@ -0,0 +1,3 @@
+python () {
+    d.setVar("TEST_SET_FROM_ANON_FUNC", "expected value")
+}
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 98e9f81661..1cec77b72c 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -375,3 +375,21 @@ require conf/distro/include/no-gplv3.inc
         self.assertGreater(result.status, 0, "Build should have failed if ${ is in the path")
         self.assertTrue(re.search("ERROR: Directory name /.* contains unexpanded bitbake variable. This may cause build failures and WORKDIR polution",
                                   result.output), msg = "mkdirhier with unexpanded variable should have failed: %s" % result.output)
+
+    def test_bb_env_bb_getvar_equality(self):
+        """ Test if "bitbake -e" output is identical to "bitbake-getvar" output for a variable set from an anonymous function
+        """
+        self.write_config('''INHERIT += "test_anon_func"
+TEST_SET_FROM_ANON_FUNC ?= ""''')
+
+        result_bb_e = runCmd('bitbake -e')
+        bb_e_var_match = re.search('^TEST_SET_FROM_ANON_FUNC="(?P<value>.*)"$', result_bb_e.output, re.MULTILINE)
+        self.assertTrue(bb_e_var_match, msg = "Can't find TEST_SET_FROM_ANON_FUNC value in \"bitbake -e\" output")
+        bb_e_var_value = bb_e_var_match.group("value")
+
+        result_bb_getvar = runCmd('bitbake-getvar TEST_SET_FROM_ANON_FUNC --value')
+        bb_getvar_var_value = result_bb_getvar.output.strip()
+        self.assertEqual(bb_e_var_value, bb_getvar_var_value,
+                         msg='''"bitbake -e" output differs from bitbake-getvar output for TEST_SET_FROM_ANON_FUNC (set from anonymous function)
+bitbake -e: "%s"
+bitbake-getvar: "%s"''' % (bb_e_var_value, bb_getvar_var_value))

