Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A12C54792
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.501.1708544446409600877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=he8olkf5;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4126f486429so16341785e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544444; x=1709149244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2KvcjsvtTy/ULDFY9UAC3JY0LBu4c6+FFcTvMn+E7I=;
        b=he8olkf5OYh5DX0GTReNbrZVHscZEUmJ7cFVQw8dxHgVo2mgjlpwDNkGWP0wKjtRoN
         1CFjmWBYMKU7Nfvf94u7kmtxw+vXYY6/4ksa0Yee2Es607p/pKtXcpN9E9NuTamU4DQ9
         ohWzd7WbchClS31hBE2OQEHy+FDpR0D4FcLrDbvQsyMvSKCM9T9GGEs8qZJXTIHEhD+Q
         /X/zbWqP3Bkat6igmlYJJ9S1MX3nPpZOqar0g2/7nE1/pc5/lY/R4Q4T8fJbjeIVHk15
         B5vdo1+xCaItJxkVnx13QYYPzGVoYgVKz+huNK3N5KGBw3U/x9XuQ8pfWB5B0DXNhYnD
         TEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544444; x=1709149244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2KvcjsvtTy/ULDFY9UAC3JY0LBu4c6+FFcTvMn+E7I=;
        b=aoliLAbngU5rmZBUuWVmXDm4EHX4R1rwkRzWD4asWyxyOrfxQPSGkB5r3H9kcoaWru
         O3ID4QxmRmsifyK0FkcBRGxxYrQ1U92QoGqKsHLV0SyhsscLDrUan4bYxD0CLI0ItyvN
         zGekAfDOXwulTrmHXSRCANG93QP68e+Mksf0AZVA18H+nqthWXfRh1jMAIRF0dqjbbTO
         24qIBuXCFA2U3wx96tyNZ/6kYfOfohFSyrTgCYHjrhtcbyrR8E/e6xlE+p95m73jbHql
         5aQ5sR8iQ9VntTO2o9vwYL3I7CohwKTF0ZrgKF1af9OjuXXo4SHmJhkwcXnWIKJK0ApN
         2Ymg==
X-Gm-Message-State: AOJu0YyPT5zJN4i4NQ1iNhSJZASkHSj8piI7dKkQLbD1kbIuXsNyefaY
	zJdM7U0RTtIuoWazSox6DW2eRVxLEOZryO8l/zyyufce0G5YaOszNFTrG1JS
X-Google-Smtp-Source: AGHT+IFWjs5fnIKwHfw3OTJTVNGU/TLDCXNnS9ezdP74+0Ed6IuUkztWAoS0FOopzBRMOJk17jEGtQ==
X-Received: by 2002:adf:f0ce:0:b0:33d:22f4:179b with SMTP id x14-20020adff0ce000000b0033d22f4179bmr9470940wro.21.1708544444628;
        Wed, 21 Feb 2024 11:40:44 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:44 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 05/13] oeqa: replace deprecated assertEquals
Date: Wed, 21 Feb 2024 20:36:57 +0100
Message-ID: <20240221194036.1804463-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
References: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195989

From: Adrian Freihofer <adrian.freihofer@gmail.com>

assertEquals is deprecated since Python 2.7:
https://docs.python.org/2/library/unittest.html#deprecated-aliases
It throws errors at least on Python 3.12. Replace it by assertEqual.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from master: 68286d0b70cf09a0d2950b48945c9192fb8c8769

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
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
2.43.1


