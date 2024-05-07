Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3D3C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 21:25:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.1179.1715117152229792837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 14:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EZrtW5d2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41ba0bb5837so25769045e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 14:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715117150; x=1715721950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ATavVcHKSgntGBSpsnwi8UwdmU32p1IQCX69fnkUWHE=;
        b=EZrtW5d21QEZCV49vJFUAXpQiy115TwQNviy+HbrUjzwj5A3dfOnFB4cenj4ZkTfC6
         ooLY0WNGUZXAj/z5IdZUD5uMklefegGyzmQcDdJ4zzrUdDyFBfKFKK7z+29V2lYkz7Si
         +lxoq2p1WZt/ItAVvy7BEh6N4Res6ch6lXpt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715117150; x=1715721950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATavVcHKSgntGBSpsnwi8UwdmU32p1IQCX69fnkUWHE=;
        b=pZKClHcaN0W8IQ+SLPnc0KHKpvOFDP0Iw2iEJC1+J4nqpQmJbn7n34e6lltHEaTmsr
         KDqfgylXcPlZf1jtT/Zn/3FpDqkvmZzLJji4DyXUpB/DMJ4zguwdSWVu9qtIj/mZc1hs
         dLvhc4c8Q2tLnOcqbDEb0+sj3x0rtrVwcRBZ+arD6c29jE2GJtZPtWy8lFCyjp5r9feo
         R1HBkvPb8hpZCTpoi3n5b9M7OjJmCiiAnLHHpOrf6hpJmp9PgN8EMbKKX54NEMexjd1O
         7t3wGKtEMQTKihsT26hgL9d1xZa7Svkrhg9vsZOw5bKTiWe6e7FaeOxpdDyNCXuEke4x
         BLWw==
X-Gm-Message-State: AOJu0Yxcb3k7MQVIaW8Zb0K4lmabRH9Y3CVNKxyV7JqybYIbzKpgPOPP
	rmpsq4MgpEHlzHmFqgA8gYPyB46gXFQVXLwgJHhTgmAoqY/PZ77XpzSU3MtM+JwYLko+XlHzzfF
	dqKk=
X-Google-Smtp-Source: AGHT+IFdBywaib5ptUPoZlKD3pKS0Ji7lmR1Sfc/sqG4S65NYeKIjYp2q2++cjFF7evS1t17MZSd8Q==
X-Received: by 2002:a05:600c:3d11:b0:41b:a4bd:af26 with SMTP id 5b1f17b1804b1-41f71309f2amr7607315e9.13.1715117150112;
        Tue, 07 May 2024 14:25:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5b88:fab8:c8fc:9dd2])
        by smtp.gmail.com with ESMTPSA id p20-20020a05600c469400b0041bc41287cesm20812887wmo.16.2024.05.07.14.25.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 14:25:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/recipetool: Fix for usrmerge in DISTRO_FEATURES
Date: Tue,  7 May 2024 22:25:48 +0100
Message-Id: <20240507212548.3788002-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 21:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199108

If usrmerge is in DISTRO_FEATURES, assumptions in one of the tests would
fail. Improve the test so it works in both cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index aebea42502b..126906df502 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -120,9 +120,15 @@ class RecipetoolAppendTests(RecipetoolBase):
         self._try_recipetool_appendfile_fail('/dev/console', self.testfile, ['ERROR: /dev/console cannot be handled by this tool'])
 
     def test_recipetool_appendfile_alternatives(self):
+        lspath = '/bin/ls'
+        dirname = "base_bindir"
+        if "usrmerge" in get_bb_var('DISTRO_FEATURES'):
+            lspath = '/usr/bin/ls'
+            dirname = "bindir"
+
         # Now try with a file we know should be an alternative
         # (this is very much a fake example, but one we know is reliably an alternative)
-        self._try_recipetool_appendfile_fail('/bin/ls', self.testfile, ['ERROR: File /bin/ls is an alternative possibly provided by the following recipes:', 'coreutils', 'busybox'])
+        self._try_recipetool_appendfile_fail(lspath, self.testfile, ['ERROR: File %s is an alternative possibly provided by the following recipes:' % lspath, 'coreutils', 'busybox'])
         # Need a test file - should be executable
         testfile2 = os.path.join(self.corebase, 'oe-init-build-env')
         testfile2name = os.path.basename(testfile2)
@@ -131,12 +137,12 @@ class RecipetoolAppendTests(RecipetoolBase):
                          'SRC_URI += "file://%s"\n' % testfile2name,
                          '\n',
                          'do_install:append() {\n',
-                         '    install -d ${D}${base_bindir}\n',
-                         '    install -m 0755 ${WORKDIR}/%s ${D}${base_bindir}/ls\n' % testfile2name,
+                         '    install -d ${D}${%s}\n' % dirname,
+                         '    install -m 0755 ${WORKDIR}/%s ${D}${%s}/ls\n' % (testfile2name, dirname),
                          '}\n']
-        self._try_recipetool_appendfile('coreutils', '/bin/ls', testfile2, '-r coreutils', expectedlines, [testfile2name])
+        self._try_recipetool_appendfile('coreutils', lspath, testfile2, '-r coreutils', expectedlines, [testfile2name])
         # Now try bbappending the same file again, contents should not change
-        bbappendfile, _ = self._try_recipetool_appendfile('coreutils', '/bin/ls', self.testfile, '-r coreutils', expectedlines, [testfile2name])
+        bbappendfile, _ = self._try_recipetool_appendfile('coreutils', lspath, self.testfile, '-r coreutils', expectedlines, [testfile2name])
         # But file should have
         copiedfile = os.path.join(os.path.dirname(bbappendfile), 'coreutils', testfile2name)
         result = runCmd('diff -q %s %s' % (testfile2, copiedfile), ignore_status=True)
-- 
2.40.1


