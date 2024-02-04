Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CD2C48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 05:12:56 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.33223.1707023573096869556
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 21:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U7XDW/BM;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29658f0c034so866926a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 21:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707023572; x=1707628372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iy1HtLYUbPC4id6J5wyxRfm3tjMBwV6SVMI5Xz6kHQc=;
        b=U7XDW/BMh5ire8h3jF7t+wioOEtMXi3/9cfXGnjyYIYaR9KOaWNpdDd8A+JyDWiJmU
         2xOHMQVKVT/OxanNjo/KRHV6XvbOcBwqZGrZHs3MqFACwyoDGc7HAIl8a0p/SABjC3AK
         PFmdmBJVLwlL1zpQCPMNWUCmbiC7A+pGdkLVKnbZqNDNcT8OOw7Y/YY/B2oRDlMxP2L0
         A+Mcs+dUNJiV1d/fovHN+7qxDbfNdWpDl2P2UQFa56X47z7Eb0ndUK8tdJaHHj15u0bs
         QH06kZ5metfvXQtod9ssTn2Y1eFqq2TNgElmG1WxkmSllTLMS8Bi8ubtFMTzbW93XsEx
         aUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707023572; x=1707628372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iy1HtLYUbPC4id6J5wyxRfm3tjMBwV6SVMI5Xz6kHQc=;
        b=lhwLC0bri67gkvnFB7y0IPhr5G3P6soR8n5QrUvGHSF7PST8P/q0F7ja1RXQZq4cKj
         K1vG2eGQBpvRhX571sfe+QZhNfko3v2F4CsvBI/I4ZNCK+cK39qHSqRpiDnR1+M+nSwZ
         LGa2KCMSfxsGLZ8Ygq09ZFJXVRSCyuijXq/0LC/svRuT+p/Q95JgNUpfKVyCaSj/JKbI
         Xo4s8KhgceeYPxDBEpQEyuFapRwr1g5pksuhmDg2QPHO9wev51nmRUzgDYaUn5eaJeGX
         pW2D5CZO/rVaGEgHHg9Kr7mbTidh571RxDPjjMv+rX9Rr+KkdAhfgm9xpNDwol2M38RP
         l8xw==
X-Gm-Message-State: AOJu0YyLckvvDPbTZyYFzJCEMGUYeD8EukHTW8mYg0YuYB9G10AtcDUn
	2t3IIKNE5vhlUeilTG295JrkWqgIzNnb06Ju56iW1qPY6i7oCpaSTE6n0SUEk3M=
X-Google-Smtp-Source: AGHT+IE7/6UgfhOVxc2f8NZJ4VUjG5R9GCxgP65jMIQcVlXofQOq/XXAIL3wygeoYlFQDkMuxZjiHg==
X-Received: by 2002:a17:902:f683:b0:1d9:9e4f:c0ba with SMTP id l3-20020a170902f68300b001d99e4fc0bamr1507239plg.22.1707023572063;
        Sat, 03 Feb 2024 21:12:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU6REmcnZ/OI/WsazQaEib5hhtMRvYwU1xaOz7AzOUpRijd2szDA5gg8LM/h6VqkDGSj+TbLZ08HEaN6HJ4Hxd+KPLb
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d977])
        by smtp.gmail.com with ESMTPSA id jj14-20020a170903048e00b001d958a17e07sm3994406plb.294.2024.02.03.21.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 21:12:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] sdk/assimp.py: Fix build on 32bit arches with 64bit time_t
Date: Sat,  3 Feb 2024 21:12:49 -0800
Message-ID: <20240204051249.903402-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 05:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194871

This testcase does not work properly with 32bit systems as it houses an
older version of zlib which needs to be patched to work with 32bit
systems with 64bit time_t e.g. mips o32.

Apply a needed patch via sed logic to fix this issue.

Enable bundled zlib in build, which means we do not require zlib to be
available in SDK and it can be built for more variety of images.

Upgrade the testcase to use 5.3.1 release of assimp and add cmake option to
enable bundled zlib explicitly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/assimp.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index e4c5c730037..e986838aea7 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -22,24 +22,24 @@ class BuildAssimp(OESDKTestCase):
         if not (self.tc.hasHostPackage("nativesdk-cmake") or
                 self.tc.hasHostPackage("cmake-native")):
             raise unittest.SkipTest("Needs cmake")
-        if not (self.tc.hasTargetPackage("zlib", multilib=True) or \
-                self.tc.hasTargetPackage("libz1", multilib=True)):
-            raise unittest.SkipTest("Assimp test needs zlib in the SDK")
 
     def test_assimp(self):
         with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
-            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/assimp/assimp/archive/v4.1.0.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/assimp/assimp/archive/v5.3.1.tar.gz")
 
             dirs = {}
-            dirs["source"] = os.path.join(testdir, "assimp-4.1.0")
+            dirs["source"] = os.path.join(testdir, "assimp-5.3.1")
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
             self.assertTrue(os.path.isdir(dirs["source"]))
+            # Apply the zlib patch https://github.com/madler/zlib/commit/a566e156b3fa07b566ddbf6801b517a9dba04fa3
+            # this sed wont be needed once assimp moves its zlib copy to v1.3.1+
+            self._run("sed -i '/#  ifdef _FILE_OFFSET_BITS/I,+2 d' {source}/contrib/zlib/gzguts.h".format(**dirs))
             os.makedirs(dirs["build"])
 
-            self._run("cd {build} && cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON {source}".format(**dirs))
+            self._run("cd {build} && cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DASSIMP_BUILD_ZLIB=ON {source}".format(**dirs))
             self._run("cmake --build {build} -- -j".format(**dirs))
             self._run("cmake --build {build} --target install -- DESTDIR={install}".format(**dirs))
-            self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libassimp.so.4.1.0"))
+            self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libassimp.so.5.3.0"))
-- 
2.43.0


