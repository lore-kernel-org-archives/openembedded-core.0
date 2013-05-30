Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 780E16A499
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:10 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id p60so267129wes.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=pOkvPN/4pwuCdw8+XYpjro7HpRAwBSSvtUk3BS8YKhA=;
	b=dJtwBXYKRJnxl0fYQAHbGwo4mznxm7LgZvGk0tW/J04UyVCYxzhfOb4DmvhqNrebyT
	LLpcomzSzFQT6bAfdScIpZUPZWnOHPiZM5eZn1kyV6wUAa2coh2rXIeiN883up2kXiEc
	QtJyCeIAHFV5rzilIeSOoeAQoRa1fIYjtqivZZolau8Q8qXognxWb0rQsruscIKHhEcr
	t7UwnOrcth25J2XFE86lcAmGjr3vBo+htiohZZVpsDPwugEcrIVxuvK4aNIi4lcZJ7xn
	Vf83pr+gSTdf8kd4dyXTykyfUKpumdE65NI2NmcEXptD37BqMkRKJ3iQpWTbTpAasNOs
	CXEQ==
X-Received: by 10.180.198.80 with SMTP id ja16mr18473859wic.53.1369922171182; 
	Thu, 30 May 2013 06:56:11 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:36 +0100
Message-Id: <b8f8c1f700eaed393036b32768524ce09ab9e475.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn56lxqfJYhyS51PRj3JMd2Ge5x4Y/abK8xvEznEw8bJ6NVNzLshlX1SO7cyvF2Ojtr3XiF
Subject: [PATCH 02/14] test_utils: import functions directly for conciseness
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
X-List-Received-Date: Thu, 30 May 2013 13:56:11 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/tests/test_utils.py |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/tests/test_utils.py b/meta/lib/oe/tests/test_utils.py
index 779247a..8bb36f2 100644
--- a/meta/lib/oe/tests/test_utils.py
+++ b/meta/lib/oe/tests/test_utils.py
@@ -1,5 +1,5 @@
 import unittest
-import oe.utils
+from oe.utils import packages_filter_out_system
 
 class TestPackagesFilterOutSystem(unittest.TestCase):
     def test_filter(self):
@@ -15,17 +15,17 @@ class TestPackagesFilterOutSystem(unittest.TestCase):
         d.setVar("PN", "foo")
 
         d.setVar("PACKAGES", "foo foo-doc foo-dev")
-        pkgs = oe.utils.packages_filter_out_system(d)
+        pkgs = packages_filter_out_system(d)
         self.assertEqual(pkgs, [])
 
         d.setVar("PACKAGES", "foo foo-doc foo-data foo-dev")
-        pkgs = oe.utils.packages_filter_out_system(d)
+        pkgs = packages_filter_out_system(d)
         self.assertEqual(pkgs, ["foo-data"])
 
         d.setVar("PACKAGES", "foo foo-locale-en-gb")
-        pkgs = oe.utils.packages_filter_out_system(d)
+        pkgs = packages_filter_out_system(d)
         self.assertEqual(pkgs, [])
 
         d.setVar("PACKAGES", "foo foo-data foo-locale-en-gb")
-        pkgs = oe.utils.packages_filter_out_system(d)
+        pkgs = packages_filter_out_system(d)
         self.assertEqual(pkgs, ["foo-data"])
-- 
1.7.10.4


