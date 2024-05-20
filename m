Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC9BC25B7A
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 01:22:02 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.50475.1716168118045478092
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 May 2024 18:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MkJ4qxMI;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f2ecea41deso50308375ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 18:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716168117; x=1716772917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c5H9w/hDYhb7CPpiher7e/iOiyg56o+/vohqznDOuJI=;
        b=MkJ4qxMI02d2sCzCiXCcWBoCx3sg7g7LxgocT/ueyVyeOGFtpqoDCycj51/KW1ImzO
         Ek9okfbRlHNpD/oQPEx27gLkLG8hPQcRV6HAzBaEVjPyVSmx5jL/la0jD0VFqBMSHJLc
         mr3YpFg55nyPyR7d3SwZeQfqMB6Whswz5NY53/D0ep5GlTsbpR8YDlCwGyGltS7hfbpk
         ywWUkhjEO5HrFlt1Dqr2YGYALWLupNm/Ave/hFtuu+C2Yp0VOf+/xQFlfCsa6xUIndW5
         CidLFcE/jRzO6lsWdPIaxowhACD1IbK4E5vQUp6xYQOXl1vRehIC+EfX80BfPDRJyIt0
         Eo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716168117; x=1716772917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5H9w/hDYhb7CPpiher7e/iOiyg56o+/vohqznDOuJI=;
        b=J51H5vfiUPPaoqVgILe8cJwJwQ23/CyQjrmWWidj6LB4rKV4P7Jb7/FQ27wuLAnCoB
         XQK7vW/JWa1nOu4zVRZUkkomqzM5TH6W6PF/Cjx3fKunO+5Xjq8+26NU068FHiZrFzcs
         2EeINVGuQ37rG6eVfsZMmj7f83A0owEwwk6weAS82ZP6Ua3VUZcneuijJEduhDtw6GoM
         1rna7qkIOtrDwurtnVlftQw6+rj1GyrgiI2oGgXe5BXYnBSygAuC4H56FiKaSKZ73Tvz
         19kadYnueD7W5X0qXOwtwRmOaaHKnaZCUFoC/ayWv5EXsGdUIzc4HocmwGEDHs5IOiIM
         W4Bw==
X-Gm-Message-State: AOJu0Yxs7cl7nvaf+1uWx7AVMiizGlHIxl9sFA1DlbOJL5TVjeKHacpa
	2A5yDkJ2C5msh7qgl0ZHS9P08N/XjEZq5e/Fk2btLQsXOtgXki5gJMGIDO80Upg=
X-Google-Smtp-Source: AGHT+IHPJFL8XD/I7GZ9CqPsnpbUEx96DbAD6bRw6pHliaxJwTcbcfVyT0/jTwjgXjK2AnTmWAKYjw==
X-Received: by 2002:a05:6a00:92a0:b0:6f0:c828:8e0b with SMTP id d2e1a72fcca58-6f4e0297e33mr38889814b3a.7.1716168117074;
        Sun, 19 May 2024 18:21:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f67b526b44sm7493370b3a.149.2024.05.19.18.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 18:21:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] oeqa: Use gnu make as testcase for autotooled recipe
Date: Sun, 19 May 2024 18:21:54 -0700
Message-ID: <20240520012154.1644115-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 01:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199553

librdfa codebase is 10+ year old and is starting to show cracks
with gcc-14 e.g. it fails to compile

 ../../../../../../workspace/sources/librdfa/c/rdfa.c:345:36: error: passing argument 2 of 'rdfa_next_mapping' from incompatible pointer type [-Wincompatible-pointer-types]
|          rdfa_next_mapping(umap++, &umap_key, &umap_value);
|                                    ^~~~~~~~~
|                                    |
|                                    const char **

Replace with gnu make project which is also autotools based but the
codebase is maitained well with minimum dependendencies

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use gnu make instead of alisp

 meta/lib/oeqa/manual/crops.json       | 16 ++++++----------
 meta/lib/oeqa/sdkext/cases/devtool.py |  5 ++---
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/manual/crops.json b/meta/lib/oeqa/manual/crops.json
index 5cfa6538432..3d361849598 100644
--- a/meta/lib/oeqa/manual/crops.json
+++ b/meta/lib/oeqa/manual/crops.json
@@ -188,20 +188,16 @@
                     "expected_results": "this should output the directory of the devtool script and it should be within the sdk workdir you are working in.   \n\n"
                 },
                 "5": {
-                    "action": "devtool sdk-install -s libxml2  \n\n",
-                    "expected_results": "this should install libxml2   \n\n"
+                    "action": "devtool add crops-test-make https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz  \n\n",
+                    "expected_results": "This should automatically create the recipe crops-test-make_4.4.1.bb under /recipes/crops-test-make/   \n\n"
                 },
                 "6": {
-                    "action": "devtool add librdfa  https://github.com/rdfa/librdfa  \n\n",
-                    "expected_results": "This should automatically create the recipe librdfa.bb under /recipes/librdfa/librdfa.bb   \n\n"
-                },
-                "7": {
-                    "action": "devtool build librdfa  \n\n",
+                    "action": "devtool build crops-test-make  \n\n",
                     "expected_results": "This should compile   \n\n"
                 },
-                "8": {
-                    "action": "devtool reset librdfa  ",
-                    "expected_results": "This cleans sysroot of the librdfa recipe, but it leaves the source tree intact. meaning it does not erase."
+                "7": {
+                    "action": "devtool reset crops-test-make  ",
+                    "expected_results": "This cleans sysroot of the crops-test-make recipe, but it leaves the source tree intact. meaning it does not erase."
                 }
             },
             "summary": "sdkext_extend_autotools_recipe_creation"
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index 5ffb732556b..dccf1250444 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -69,9 +69,8 @@ class DevtoolTest(OESDKExtTestCase):
         self._test_devtool_build(self.myapp_cmake_dst)
 
     def test_extend_autotools_recipe_creation(self):
-        req = 'https://github.com/rdfa/librdfa'
-        recipe = "librdfa"
-        self._run('devtool sdk-install libxml2')
+        req = 'https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz'
+        recipe = "devtool-test-make"
         self._run('devtool add %s %s' % (recipe, req) )
         try:
             self._run('devtool build %s' % recipe)
-- 
2.45.1


