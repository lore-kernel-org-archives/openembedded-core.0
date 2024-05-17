Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9FCC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 14:15:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.41162.1715955329985725629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 07:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X3f5Z6wn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4200ee78e56so1272225e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715955328; x=1716560128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1i2lhhwCkBOTWJHpEcdqP/MVAq5bxaqbn0OugM9TEPU=;
        b=X3f5Z6wn5wmfcnaNS3zC/OM3VKfV2U8SZnGYU18O7BK2Joofhgkv2gLsXpINPo7KQW
         +SDYMKb0w7a5JKzhmCLbW8zPmV6SbDU03E3TGtPE2+mP3p7SyXNkEEfYKXu/Dq4W6R+N
         QWxwpHgkDYQSOdVmO/WDstndrBUdPO23ChINI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715955328; x=1716560128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1i2lhhwCkBOTWJHpEcdqP/MVAq5bxaqbn0OugM9TEPU=;
        b=EChQRcO3AYy2sWiV+I2TXd1KyBjISb21aI+M67BIzLgDJgnxeVIBoaucvdsYu09p0g
         kK41aallXICUFlvINcCk0lpSUBStErhmiX7ympnNjJIXWYpJiwiSIya4LrQ1dhbxim0x
         eg7TJrjPvIXwtAKnZTjmDFBtN4bXIo6XKAeXWdpEFu+sZAAL4yPmKPPRM15AH7ML7TbV
         hNASsszZHQtjDisWWuD52smtZUjToOF9ao2Hj5gRRY0nvyQrD6I1kdT9Xfedx0Zx/LRx
         IJLOFQzl4CTZO4l46U1VwuV7qw6QKfdOPbNL1MYaULBbAmniTVdl7hm+5Ce4ll1R3pPf
         Ssrg==
X-Gm-Message-State: AOJu0YwxdjMyhUcPi5wDVmGzBdc9f25xyy9gFSdFJAZ/YG7iW2+TUZ2b
	iXEwO0j6AbIVN1Pc9kHYsA2niGaeL7UeQDCX+uD2Jd8H2JFS2ycBk2jaPFxf4WSn9qwMMvaURA3
	hkgE=
X-Google-Smtp-Source: AGHT+IHV9U762D/8NqhupZlFbVJclbrlXkm8GnRuqSrospuW6+uKyiXM+3GuQcmUMduITHfgNMQHrg==
X-Received: by 2002:a05:600c:138b:b0:419:f9ae:e50 with SMTP id 5b1f17b1804b1-41fead6ac32mr168548305e9.37.1715955327945;
        Fri, 17 May 2024 07:15:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ec9d:c0cc:86e8:686a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm345381235e9.18.2024.05.17.07.15.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:15:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/sdk/assimp: Upgrade and fix for gcc 14
Date: Fri, 17 May 2024 15:15:26 +0100
Message-Id: <20240517141526.860989-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 14:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199514

To enable this test to work with gcc 14, pass the option to make
warnings non-fatal. Also upgrade to version 5.4.1 from 5.3.1.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/cases/assimp.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index e986838aea7..d990b1e97de 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -25,10 +25,10 @@ class BuildAssimp(OESDKTestCase):
 
     def test_assimp(self):
         with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
-            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/assimp/assimp/archive/v5.3.1.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/assimp/assimp/archive/v5.4.1.tar.gz")
 
             dirs = {}
-            dirs["source"] = os.path.join(testdir, "assimp-5.3.1")
+            dirs["source"] = os.path.join(testdir, "assimp-5.4.1")
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
@@ -39,7 +39,7 @@ class BuildAssimp(OESDKTestCase):
             self._run("sed -i '/#  ifdef _FILE_OFFSET_BITS/I,+2 d' {source}/contrib/zlib/gzguts.h".format(**dirs))
             os.makedirs(dirs["build"])
 
-            self._run("cd {build} && cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DASSIMP_BUILD_ZLIB=ON {source}".format(**dirs))
+            self._run("cd {build} && cmake -DASSIMP_WARNINGS_AS_ERRORS=OFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DASSIMP_BUILD_ZLIB=ON {source}".format(**dirs))
             self._run("cmake --build {build} -- -j".format(**dirs))
             self._run("cmake --build {build} --target install -- DESTDIR={install}".format(**dirs))
-            self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libassimp.so.5.3.0"))
+            self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libassimp.so.5.4.1"))
-- 
2.40.1


