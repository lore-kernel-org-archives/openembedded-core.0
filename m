Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF6FC3DA40
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:56 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.8998.1720096072526667185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iPm9lJL1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fb1c918860so10914085ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096072; x=1720700872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hhh8fA0O628Av/QvEUjkrV+EAw7w9MWz5Ux0g9fThA=;
        b=iPm9lJL1+uBABEOKW2JyBh8E59WAQbfZ0SpX8U0G0SzoVtgH4o1/FSTzvcupWeUghz
         KuOFTWNjM49ILJBZvC1OTpkuHbvvFMcNHequhRefuD5VFHRuhIK2K+f0Y4txYmvLPWBN
         ZL76eLCPBf8ib/t9T6FY8OCd5+fSxBI32byqV7o79Lx+D/AxmS142lsgKQQZsH9o2eTI
         62Fas02okYlnwG5kqblsOGdKLlmRZbR9r/yHdtZthEmaAlLTEUqjUcWK2zyXLttIzPPd
         vyZTXoHLHR2XMmLUNJixbMBT2pwi0ZaDxUU+XWj12F+waQ9UTD528KQ1B+LTiz0gHCiu
         D7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096072; x=1720700872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hhh8fA0O628Av/QvEUjkrV+EAw7w9MWz5Ux0g9fThA=;
        b=P/RrHyTDMhz+ecxajbpsid5/hnj4mc6a/b6xuPWnkMGeQx4RbR2U8pSxXpDYo56iy3
         dTtbFVrtQ2p49yLKCex/eZsrA0FFBwS8J44bjT3Bzkfof9FBjdlp0K+yZpqU/utecgOO
         Kwe8zBxJ4xLTJfDwmv9FFKUhRyVlckSUEzdbcoVT1bVydN8iA8KLkjzryGwZU8iU1rec
         IStOEx47Mjky/ngCtgbnBFj70XKDFj509qRlJI8u54fJucPXtDNVId/S9jj6hZne6KgC
         IPGVsQFG7xZXxkbKDUCU0vuRpGa+4Wwy8B30UdmiWAB8gIFB0GFCuOIZzd7eVHgP55D2
         uKSQ==
X-Gm-Message-State: AOJu0YzuBuCb19DtNoOJWNTj79ceJUif6/rDVSCCiq+TF5zLxfOuqMto
	MZir/2iqBTx40mN5F+1gaCS7+QezsOm4KFDBCpotqDzzyJbBnJmmMT0d0ju4DIruW4V8G9r8AU9
	A
X-Google-Smtp-Source: AGHT+IHWTUcwe7k2RNrKiEWtY/f9uKbB+HmK59LrRmbuO2rR05Ki7apLvN7c4a+zBFXtipGEBy416Q==
X-Received: by 2002:a17:902:da87:b0:1f9:f6a7:9330 with SMTP id d9443c01a7336-1fb3702ed58mr20157375ad.9.1720096071754;
        Thu, 04 Jul 2024 05:27:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/21] oeqa/selftest/recipetool: Fix for usrmerge in DISTRO_FEATURES
Date: Thu,  4 Jul 2024 05:27:09 -0700
Message-Id: <01ccccb949bd82e89dae4679ff5b30ada6672d9a.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201559

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If usrmerge is in DISTRO_FEATURES, assumptions in one of the tests would
fail. Improve the test so it works in both cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 68a27d307a7042e242c49cf3d069469f40e09902)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index aebea42502..126906df50 100644
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
2.34.1


