Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05CBC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:34 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.55019.1718625933653716942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rz54yKpS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-705bf368037so3787376b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625933; x=1719230733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C278fLgHV1CHc+PWU9ZS/7UN4ozQsoAykw1vpm6IobI=;
        b=rz54yKpSRJ26HY3vCgh1SwX/0QZTgS26zFQhqF82HIOzexwHIOatUWY8uNVrM1ZJ0Q
         s1ehUsh9rx8qs2ZuvBhvJFh+ehFOlSUKaL9Zxzx3r9P6NykmK6hJxUm+DJZ6YGdUdrLz
         kLLDWL5uOYbv7iDO0a89eBX5xv0ggBeEvmTrPbCnZi8ASmBBJHAatBtum0VXe/PfR5L/
         Nfw0bni+rjWgekD+cAHO0QfcIpOjen9GcgSlKeG2atIYAa9hI+6ykd8W5BAJpz8butJl
         2GwAmb8JYV7FiPnLMmn+cGGdNhUoPr3aotVAgWAZpcXRcIENLJ8FTZ5ARWpWXUzH3JOW
         FWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625933; x=1719230733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C278fLgHV1CHc+PWU9ZS/7UN4ozQsoAykw1vpm6IobI=;
        b=muXhkpERi5FAOtuJaJC6Ukn6lbSFuImE4ZAlZEi80TpLzI+wfhDZqNriRm9jN572QU
         RiXUv7drA16YDsZxkvkiKisq/W86ZPhs+8dJySPGVkYW/SKodvYtG8wTp/oKweODOWi4
         mIsFZsZYN3k9EUWdDQc1tf270tCGCO9fpm/bXS+lvoyM75ImyKPTwNHBZ6EwSqlF1iFm
         hfYsaiz281L9DEP60ksxUu8UiWY4uUqe7Fd8dftIYTGAgn+S35uWeRgrrhDqWrxbyFmf
         PPri42ZtsIarIYP+crkcWeLC+kUWSwFVx1IHlfAhASIcgRGqDnY4fG2sKYRql3dZJeES
         z4Fg==
X-Gm-Message-State: AOJu0YwtulIikOtdU30YBq3f+ZK4Gx8ddWHXVgtdG5fWGSPsCNC2bA7p
	OEh+mfVuud1ZdSovoEWiTNfOC0l0oJVlGsqMMfkfcbyLoW6IUP8Hr8AjMNjPg+yL7KmdXRbXMhk
	Jtoc=
X-Google-Smtp-Source: AGHT+IGCfpkPgukAb1ueSO2T8nVA8lYUa1O1nQRrifHCVy7yhfbfusQ469/ibnF1jAosA2MaaUL8YA==
X-Received: by 2002:a05:6a20:258c:b0:1b8:2211:b7e6 with SMTP id adf61e73a8af0-1bae802a38amr12351113637.49.1718625932944;
        Mon, 17 Jun 2024 05:05:32 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/22] oeqa/sdk/assimp: Upgrade and fix for gcc 14
Date: Mon, 17 Jun 2024 05:04:41 -0700
Message-Id: <c0c58c9acbcbed26f95864dc5e40b5995252ce4a.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200814

From: Richard Purdie <richard.purdie@linuxfoundation.org>

To enable this test to work with gcc 14, pass the option to make
warnings non-fatal. Also upgrade to version 5.4.1 from 5.3.1.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c3df6287ae26dc9d7f11eb7e26fdbcaefe4dfead)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/cases/assimp.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index e986838aea..d990b1e97d 100644
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
2.34.1


