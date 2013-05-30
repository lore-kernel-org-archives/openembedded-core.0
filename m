Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id AF9A3608F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:08 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so274495wgg.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=RPHUOv3AeXhFuxdrBXVjy8hd02Rez+s4+PPH7B368mQ=;
	b=WlVHxfM+7SHkOJbgaO0ra2vXU6woFO5izcSDsnfXhnQynjoi78TWmf9lcEAonkTGhT
	9dM4TXrPrSnA0Vhjj6eOXM0rXM5bLmJF8E16LLb7kdFx6xEA2pG2BVw/BK0KdW7V63wt
	FSq9tr570kxl0sXlCrdhTIl4UuJh/O8NvNhiXeO7iRtRTqPJkmlii3voM8tOurdhdKvx
	cCSBLV29Sw3mIUjdl2KPF/tRjLUz5fuXLCEq75MexKBPmYFYVyayhHHt8XULFPtMZ2VH
	7wuPJbHE9Mx/sY5xBmjAneM7aKgSblYItACuTEJ8TfdcPeUFoxYetL7KYhahwaIwIuvf
	dg7A==
X-Received: by 10.180.81.169 with SMTP id b9mr19020232wiy.12.1369922169397;
	Thu, 30 May 2013 06:56:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:35 +0100
Message-Id: <aa47e6da8b03865802907d81efe8cdb62c180815.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkgZGPr+ovQz6xjrbpQ7CqaOIJo7CGcW88FvrrgqMVXlo84oWdtQvl4KcvsgxdUDjaKsh7n
Subject: [PATCH 01/14] test-utils: handle import bb failing and skip the test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2013 13:56:09 -0000

Instead of reporting an error when bb cannot be imported, skip the test
instead. This makes it a lot easier to iterate a test suite when we don't care
about this particular test.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/tests/test_utils.py |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/tests/test_utils.py b/meta/lib/oe/tests/test_utils.py
index 466c47e..779247a 100644
--- a/meta/lib/oe/tests/test_utils.py
+++ b/meta/lib/oe/tests/test_utils.py
@@ -1,11 +1,15 @@
 import unittest
-import bb, oe.utils
+import oe.utils
 
 class TestPackagesFilterOutSystem(unittest.TestCase):
     def test_filter(self):
         """
         Test that oe.utils.packages_filter_out_system works.
         """
+        try:
+            import bb
+        except ImportError:
+            self.skipTest("Cannot import bb")
 
         d = bb.data_smart.DataSmart()
         d.setVar("PN", "foo")
-- 
1.7.10.4


