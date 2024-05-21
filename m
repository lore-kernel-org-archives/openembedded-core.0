Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C76C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 10:36:43 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.16578.1716287797382835560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 03:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HyDU/Nub;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e72224c395so22812351fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 03:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716287795; x=1716892595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duO5aaCzEOlUbBkuhWyM0GWERFwzquWZv3pBc3s5Pws=;
        b=HyDU/NubpEmIoLX0IMYdNzOkYTfdjZl7QeSsT2qfdOHhAtk71RSjfGB685IU3s2MRx
         Xs3ZNYM1myibxAg6g050UaQPS1UsL6kQ7a/OeW3CG97dZai76n6Jl932oyF57yVhKHxL
         FSv+NqQ3Opg+TjzfKJtrn1NGHonBPpkTWeBJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716287795; x=1716892595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duO5aaCzEOlUbBkuhWyM0GWERFwzquWZv3pBc3s5Pws=;
        b=Jv0NDKhyQ9jgdeJ2Kc2AhBF22Ngpmcwq1MCYJ9u1RtikjEY7CKpy7Pd7juo4/kU2+l
         om53Rmr5/BIGsPisUUzZjp48BJplX791STpu6Xer5whx7yVe2Bkp0PgG4RQZG1nsQBYK
         zj95tFOkCvMB8wAgnPKlnvyGVLbF7Y9i1V7FRbkErVZhS6q6Mao3bE7Ec6SbLigCN2vK
         kQKNFlUZ0l0YdUikOaJqzsJ4PN2kFGbHw8Ikb7qIjDT8awCONsPhhVuSpYF2xSEr8uCz
         v+M5b7fJhnKBt3kBrmLhfumlisk5xOPwmmcl2qow16Iq6OphJ1XAgHW2iKCWIEvFvhG/
         HxkQ==
X-Gm-Message-State: AOJu0YzpUhqTtxfvqLkl4/eJEX/OM04Hh3gI1TVEVKy+lt+Ty3gSmbxR
	QwjrFKzrv6mOvr6sTZ0vwon8l9A4JKky3aZHr5TRLgEoTUsq2Y40mYoDj+J7DmxsTexfwqURhUT
	WfcQ=
X-Google-Smtp-Source: AGHT+IGOTrfHnPjF1OWjVjp83C+KnGvd3zOgAnJnKrpiw8S6Chggss65f1zDSq+X6j9EfQVp4JXiCA==
X-Received: by 2002:a2e:7306:0:b0:2d8:b2e:7bf3 with SMTP id 38308e7fff4ca-2e51f263691mr193910171fa.0.1716287794924;
        Tue, 21 May 2024 03:36:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1738:232d:aeeb:3bb7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88111033sm495465355e9.34.2024.05.21.03.36.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 03:36:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] oeqa/sdk/assimp: Upgrade and fix for gcc 14
Date: Tue, 21 May 2024 11:36:31 +0100
Message-Id: <20240521103631.1122991-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521103631.1122991-1-richard.purdie@linuxfoundation.org>
References: <20240521103631.1122991-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199615

To enable this test to work with gcc 14, pass the option to make
warnings non-fatal. Also upgrade to version 5.4.1 from 5.3.1.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/cases/cmake.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/cmake.py b/meta/lib/oeqa/sdk/cases/cmake.py
index 4886435ddf1..db7d826a38a 100644
--- a/meta/lib/oeqa/sdk/cases/cmake.py
+++ b/meta/lib/oeqa/sdk/cases/cmake.py
@@ -25,10 +25,10 @@ class CMakeTest(OESDKTestCase):
 
     def test_assimp(self):
         with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
-            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/assimp/assimp/archive/v5.3.1.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/assimp/assimp/archive/v5.4.1.tar.gz")
 
             dirs = {}
-            dirs["source"] = os.path.join(testdir, "assimp-5.3.1")
+            dirs["source"] = os.path.join(testdir, "assimp-5.4.1")
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
@@ -39,7 +39,7 @@ class CMakeTest(OESDKTestCase):
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


