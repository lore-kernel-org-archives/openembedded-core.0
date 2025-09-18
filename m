Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3382BCAC5B2
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:21 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.311.1758229694888563036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=QiJ/sYKS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20250918210812fadd977925000207ff-2djerd@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250918210812fadd977925000207ff
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NthMQ6FLd1D7slJbDwQcT2ulwgwAWH3GhMW8ZwuLVcw=;
 b=QiJ/sYKSCbvU4e5otJ3U711UhsmN50lZk4Sy1BAO5GmNxeGnN5u3oqpZj6md5HHceYrvnI
 tF3eftpzUoNpt6ZFp2EiatsG4rpSSbfjNY2nsHNC2rDSLbShKDoHIu0SBPGFUEu2yvyoUhpU
 GoTcDR/QHu0imvwbLX6Vx4uC1pYa+6BBPBGnOy6a9x1gTuxgdYOiX4nRdlrsLT+bB/isnc3N
 T9CUnltpjI8Cv035PfEif/Y3JUBnoCk680kPaNXb0KD/5ycPSiO1lxmySaNqQPdmtAtzKum7
 5X3m8O5DtIGp4RxjeO9pbCr0hJxm/OnKujW/fStmuaFVH8yWx3OWi/3g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 17/19] oe-selftest: devtool: add test for gdb pretty-printing
Date: Thu, 18 Sep 2025 23:07:19 +0200
Message-ID: <20250918210754.477049-18-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-1-adrian.freihofer@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223677

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This extends the existing devtool IDE SDK tests to verify that gdb
pretty-printing is working correctly.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5f861fd3ecf..2c9660ef3a2 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2728,6 +2728,12 @@ class DevtoolIdeSdkTests(DevtoolBase):
         gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %s\")'" % magic_string
         gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %saaa\")'" % magic_string
         gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:14,14'"
+
+        # check if resolving std::vector works with python scripts
+        gdb_batch_cmd += " -ex 'list cpp-example.cpp:55,55'"
+        gdb_batch_cmd += " -ex 'break cpp-example.cpp:55'"
+        gdb_batch_cmd += " -ex 'continue'"
+        gdb_batch_cmd += " -ex 'print numbers'"
         gdb_batch_cmd += " -ex 'continue'"
         return gdb_batch_cmd
 
@@ -2737,6 +2743,11 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn("$2 = -3", gdb_output)  # test.string.compare longer
         self.assertIn(
             'inline static const std::string test_string = "cpp-example-lib %s";' % magic_string, gdb_output)
+
+        # check if resolving std::vector works with python scripts
+        self.assertRegex(gdb_output, r"55\s+std::vector<int> numbers = \{1, 2, 3\};")
+        self.assertIn("$3 = std::vector of length 3, capacity 3 = {1, 2, 3}", gdb_output)
+
         self.assertIn("exited normally", gdb_output)
 
     def _gdb_cross_debugging_multi(self, qemu, recipe_name, example_exe, magic_string):
-- 
2.51.0


