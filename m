Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC3BC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:20 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.1998.1709071037963623360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T6tpg6Ov;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e55731af5cso552584b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071037; x=1709675837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oIouzdcbsfVSPbxD+bzcJLEN+NUMk4RDzRztv/eX04=;
        b=T6tpg6Ovtywnr83Gr3nOAglR28QS6V0l/9PQ6uyJGc8T1OkaWmFjRlTy68UMOsfS7O
         gFoKA/tUvNP8sFuF+e176DUlVovOWHAfn8F9BEPuC3BVcGWSfXtLA83bp1fp3O5QVHn/
         ialDJMe9hScXR024LMMn8yMENoWpfrn5SUfYp64mcHUdyAP6Q/LJKXfAZUnjIXvZY8sH
         4SQLbuw04JuSkSU6/LxK4wb8weIFoiFHNOerIC8tUJtHNafMND5SP8oThN5QRxueIorE
         i6SKrvXZQu15IV0NRoSNAIWoEkCTSDk+XSGxhr48YGeS8pSCcfMMFsl5NXy4v+Od3pfc
         nMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071037; x=1709675837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oIouzdcbsfVSPbxD+bzcJLEN+NUMk4RDzRztv/eX04=;
        b=LZ4G8X37SdJR7BhBvn++YSRdzQfcccH/K47dW+Y9S9nZJs+BrsQ5zrrcLk/3kurMX0
         zFlkswZ+SBBFzmFxPsOy4FUsWM6Jt6WueFWWs7WA89tKO4Kp1+mqXSkKVgfdUoMRmTQy
         PEWmvz/6K/auZoiJ213czvHMa/HH1lz5H63Qj9KU4XGr5LuLRWHKN6Oiu1fgis80Mpta
         nGMLpGG1MduMvnRJZYco+qksioE+TDi1kZkrFh7Xlvsoab2HP27spV78b/9KnL8xy4wp
         YP8jnx9LzCIts3wJqmjPVuFzq86jfjMVf2p6pILQ1zz9QyCf25rC582CJrIzXPE0GGo/
         3IBQ==
X-Gm-Message-State: AOJu0Yzdc/LxBjAz//w9adJ80kRRp+pRD1vkFKg/eCcfwQeMlwVtPsR/
	uQcQpvbZjC1Tv8QYyeNefIRqvhObSQmfUD6fH9RvprwEbhvIZ48ADcCcrpy2ZNw0aaylKWt0Tzz
	qYc4=
X-Google-Smtp-Source: AGHT+IF+tFSS4ATPASgLtSNr1HVVt0AqPHo+3JwbqFOhpsfTPSERS1PVET3Ys7r8NBWHakREbTZUyg==
X-Received: by 2002:a62:ce0d:0:b0:6e1:29ee:aae8 with SMTP id y13-20020a62ce0d000000b006e129eeaae8mr10449499pfg.25.1709071037241;
        Tue, 27 Feb 2024 13:57:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/16] oeqa: replace deprecated assertEquals
Date: Tue, 27 Feb 2024 11:56:52 -1000
Message-Id: <a20325690a057aa7f71e5a176bfbdc03baac405c.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196304

From: Adrian Freihofer <adrian.freihofer@gmail.com>

assertEquals is deprecated since Python 2.7:
https://docs.python.org/2/library/unittest.html#deprecated-aliases
It throws errors at least on Python 3.12. Replace it by assertEqual.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from master: 68286d0b70cf09a0d2950b48945c9192fb8c8769

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/buildtools-cases/sanity.py | 2 +-
 meta/lib/oeqa/selftest/cases/devtool.py      | 2 +-
 meta/lib/oeqa/selftest/cases/liboe.py        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/sdk/buildtools-cases/sanity.py b/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
index 64baaa8f84..68b19f4d47 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
@@ -19,4 +19,4 @@ class SanityTests(OESDKTestCase):
             # Canonicalise the location of this command
             tool_path = os.path.realpath(self._run("command -v %s" % command).strip())
             # Assert that the tool was found inside the SDK root
-            self.assertEquals(os.path.commonprefix((sdk_base, tool_path)), sdk_base)
+            self.assertEqual(os.path.commonprefix((sdk_base, tool_path)), sdk_base)
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index aea2ad6561..dc0fc35062 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -919,7 +919,7 @@ class DevtoolModifyTests(DevtoolBase):
             runCmd('git -C %s checkout %s' % (tempdir, branch))
             with open(source, "rt") as f:
                 content = f.read()
-            self.assertEquals(content, expected)
+            self.assertEqual(content, expected)
         check('devtool', 'This is a test for something\n')
         check('devtool-no-overrides', 'This is a test for something\n')
         check('devtool-override-qemuarm', 'This is a test for qemuarm\n')
diff --git a/meta/lib/oeqa/selftest/cases/liboe.py b/meta/lib/oeqa/selftest/cases/liboe.py
index afe8f8809f..da88ff480e 100644
--- a/meta/lib/oeqa/selftest/cases/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -97,6 +97,6 @@ class LibOE(OESelftestTestCase):
 
         dstcnt = len(os.listdir(dst))
         srccnt = len(os.listdir(src))
-        self.assertEquals(dstcnt, len(testfiles), "Number of files in dst (%s) differs from number of files in src(%s)." % (dstcnt, srccnt))
+        self.assertEqual(dstcnt, len(testfiles), "Number of files in dst (%s) differs from number of files in src(%s)." % (dstcnt, srccnt))
 
         oe.path.remove(testloc)
-- 
2.34.1


