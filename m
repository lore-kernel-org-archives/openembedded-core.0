Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3D3778FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489512529; x=1521048529;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=Hu5F4i0Yfc9TGGFRYHNyYob8meqTCfUK+GQaoVYxS3c=;
	b=ViJK8AQcKuHIoOj2RZAoR6uWkHpA/XDVpvG15e/ZxVt1+dMARtKnBmGt
	o0jIQ0tgayf2jpbc3vorgcGx1+sZPA==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Mar 2017 10:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,165,1486454400"; d="scan'208";a="67345924"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 14 Mar 2017 10:28:48 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 19:27:49 +0200
Message-Id: <20170314172749.6643-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170314172749.6643-1-alexander.kanavin@linux.intel.com>
References: <20170314172749.6643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/3] selftest/signing.py: verify that images can be created from signed packages
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
X-List-Received-Date: Tue, 14 Mar 2017 17:28:48 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/selftest/signing.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 38b2fca8cf9..8a106aa80f6 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -34,8 +34,10 @@ class Signing(oeSelfTest):
         """
         Summary:     Test that packages can be signed in the package feed
         Expected:    Package should be signed with the correct key
+        Expected:    Images can be created from signed packages
         Product:     oe-core
         Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        Author:      Alexander Kanavin <alexander.kanavin@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
         import oe.packagedata
@@ -85,6 +87,12 @@ class Signing(oeSelfTest):
         self.assertIn('rsa sha1 (md5) pgp md5 OK', ret.output, 'Package signed incorrectly.')
         shutil.rmtree(rpmdb)
 
+        #Check that an image can be built from signed packages
+        self.add_command_to_tearDown('bitbake -c clean core-image-minimal')
+        bitbake('-c clean core-image-minimal')
+        bitbake('core-image-minimal')
+
+
     @testcase(1382)
     def test_signing_sstate_archive(self):
         """
-- 
2.11.0


