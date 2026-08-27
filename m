Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1104CC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:20:27 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31071.1787815220287371768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 00:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SqmQaiXy;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1705890a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815220; x=1788420020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEDRoIDWb3cEDh0UNd26VwT1/0H7djv2qn3xuiU2KKo=;
        b=SqmQaiXy3bAFWmU5nqrYiwV0qZGx1k/Z4xL3q4JeDekmt/R5N0KQcS1BLVpoDFP2pv
         96ne+wnXml5DXYxsXYDOxWvbM4A51uDYE4A8yNSoKG5KS0AV6tbWiKXht8pvLgCF0TAR
         PdR3HOJQfsegdDD9hBbQnNXPzBbzrOIkwHg36PiT13KIrguJs46b5GhT5nYhRulX4l+M
         Vh1N6v3pLrqnVS+usF1C1+aLXY+VDaXmhkyYH9pav47/pL5gXzYGXfrN5B+IfkWtnMK7
         83OMllwM6KTQAuPODG/cWk7ry/6f46w7N0OaUXIQXvm6gtTU8qE0H/6xQOZo1F7q9Vb7
         743Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815220; x=1788420020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEDRoIDWb3cEDh0UNd26VwT1/0H7djv2qn3xuiU2KKo=;
        b=NNsQSO7ca52UH5NptfLU/+XO8vmZYSrV00V6W47vxwyJotMjPWD/BQ/MRXXPV89vGp
         A2e6ycQMjf+q98MyKzcUSLV61uNR0qRTrVtnhZl+BzLd+KkZiZ9+R2qeiorh0RnKgORt
         OvI7vbbQeBmALfgTZ0Yu+UGbXwU2G4prgdEUL3hslSBQsAa+uOp2DgvOC15GJKbjOzrw
         ceKYVWqFur3Pz4jMAQJuHoyY69ibit9FxvuEWgPHSam+coolcInQjXS4at7KDacCzi+f
         noSaKRikzrqPbAYMEOtmE3cz9qk0GbQSAezSv0K9UO/noAmVBci2WeWkXlxQd8OecDv+
         jP2Q==
X-Gm-Message-State: AFuF++nkKGyc+y8cID9cyPTIp4jsSiflHgDrT++WDpFIqD2Xh2tyygZZ
	XbqJKJUUihn6YOyklzNAu5pPvfGpwbWU6JEYT36Fh7Belbcp8UsWZQXiIPb1bA==
X-Gm-Gg: AR+sD11Q88bfFICBucL8LvtZn4ezuQXJ6ibEG2dGteLEneFlPPmPIjhSQzzj15yJ69K
	KOUY6siSqHKDutLtfKghjuRNMcRdbDGTBGV+XlbAwRF8T0xWT4K3gs7JWttu6n002phHD+vuX43
	BTOB1iPs1DmZTbABNdMnidp1DQyIn1o4b9Gdrcqk66HetOejhs9fZcQ9H1QL44ATKaKqnfW8mDc
	ipKmugZi3y4oKWedHCegpFh3xTrhqQHkLVgP5k4h79YQA2Vt1D3i1GdIF+WIUcXKAXgytuSsclG
	8NSf+NggyFOM1NXA4UYAO/jV+QbSQOeBl9TBwiUU2kpo37/VB8gvfF23LzvsTW78Lm+pNyfTfps
	z8wY1nOOSayfrMOIZUqIWIG5CU0E1m1EszdQt2JovkFdygBDqNIHtdCMfRxno5Hxw1YOFWHnCcu
	z8EcMry+b/I1N0zeZzBWPYvrVVD/vnqzFAes3BIaNDX4gcLt0F0WiVYut93P77uDdoVQKNden6a
	gqQWKj66ThGsD+9TuOFeISTiW5dRHBxZJ9ayh86cIxXe+nOrib9HZpEUbC0NHySAiKiWNeGX4gV
	wQPJKF/gqjw1KOMT3fM=
X-Received: by 2002:a17:90b:1dce:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-3966d13d13cmr27273942a91.3.1787815219021;
        Thu, 27 Aug 2026 00:20:19 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm22860700eec.8.2026.08.27.00.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:20:18 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH 1/3] python3-click: upgrade 8.4.2 -> 8.5.0
Date: Thu, 27 Aug 2026 12:50:08 +0530
Message-ID: <20260827072010.394532-1-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 07:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244461

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

https://github.com/pallets/click/releases/tag/8.5.0
https://pypi.org/project/click/8.5.0/

- Drop merged pytest-fix.patch.
https://github.com/pallets/click/commit/30749b45c50f4811a3487fc9d11da2b7afc6007f

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
---
 .../python/python3-click/pytest-fix.patch     | 36 -------------------
 ...-click_8.4.2.bb => python3-click_8.5.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-click/pytest-fix.patch
 rename meta/recipes-devtools/python/{python3-click_8.4.2.bb => python3-click_8.5.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-click/pytest-fix.patch b/meta/recipes-devtools/python/python3-click/pytest-fix.patch
deleted file mode 100644
index abfa07120a..0000000000
--- a/meta/recipes-devtools/python/python3-click/pytest-fix.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1cdbe9829973a30037075d613b5a1d5a42e260d5 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Mon, 15 Jun 2026 11:37:28 +0100
-Subject: [PATCH] Fix an error with newer versions of pytest (9.1.0) by
- converting the generator into a tuple:
-
-E   pytest.PytestRemovedIn10Warning: Passing a non-Collection iterable to parametrize is deprecated.
-E   Test: tests/test_basic.py::test_boolean_conversion, argvalues type: chain
-E   Please convert to a list or tuple.
-E   See https://docs.pytest.org/en/stable/deprecations.html#parametrize-iterators
-ERROR: tests/test_basic.py:tests/test_basic.py
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://github.com/pallets/click/pull/3597]
----
- tests/test_basic.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/test_basic.py b/tests/test_basic.py
-index 34d22e7..8076dd8 100644
---- a/tests/test_basic.py
-+++ b/tests/test_basic.py
-@@ -258,10 +258,10 @@ def test_boolean_flag(runner, default, args, expect):
- 
- @pytest.mark.parametrize(
-     ("value", "expect"),
--    chain(
-+    tuple(chain(
-         ((x, "True") for x in ("1", "true", "t", "yes", "y", "on")),
-         ((x, "False") for x in ("0", "false", "f", "no", "n", "off")),
--    ),
-+    )),
- )
- def test_boolean_conversion(runner, value, expect):
-     @click.command()
diff --git a/meta/recipes-devtools/python/python3-click_8.4.2.bb b/meta/recipes-devtools/python/python3-click_8.5.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-click_8.4.2.bb
rename to meta/recipes-devtools/python/python3-click_8.5.0.bb
index 0578a0421e..8884467692 100644
--- a/meta/recipes-devtools/python/python3-click_8.4.2.bb
+++ b/meta/recipes-devtools/python/python3-click_8.5.0.bb
@@ -8,8 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI += "file://pytest-fix.patch"
-SRC_URI[sha256sum] = "9a6cea6e60b17ebe0a44c5cc636d94f09bd66142c1cd7d8b4cd731c4917a15f6"
+SRC_URI[sha256sum] = "ba0d2089de75ea0310e2dde03160e6ca10009947fb95a182f9b54021bb272e34"
 
 inherit pypi python_flit_core ptest-python-pytest
 

