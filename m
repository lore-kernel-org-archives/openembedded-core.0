Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2E9874F49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 08:43:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4V8hbdP017800
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 01:43:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 May 2018 01:43:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2018 16:45:28 +0800
Message-ID: <7874302a34c726c1980006cfeb0850a755a99f12.1527755435.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1527755434.git.Qi.Chen@windriver.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/14] testimage-auto.bbclass: execute the same codes as testimage task
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
X-List-Received-Date: Thu, 31 May 2018 08:43:36 -0000
Content-Type: text/plain

testimage-auto is expected to run testimage task's codes automatically.
But in fact, it's currently missing some codes, including testimage_sanity
and create_rpm_index.

This leads to the problem of unexpected runtime failure of test_dnf_makecache.
The error message is as below.

  RESULTS - dnf.DnfRepoTest.test_dnf_makecache - Testcase 1744: ERROR

This error is caused by the fact that create_rpm_index is not executed
before running the tests.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/testimage-auto.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/testimage-auto.bbclass b/meta/classes/testimage-auto.bbclass
index e0a22b7..7da516a 100644
--- a/meta/classes/testimage-auto.bbclass
+++ b/meta/classes/testimage-auto.bbclass
@@ -16,6 +16,12 @@
 inherit testimage
 
 python do_testimage_auto() {
+    testimage_sanity(d)
+
+    if (d.getVar('IMAGE_PKGTYPE') == 'rpm'
+       and ('dnf' in d.getVar('TEST_SUITES') or 'auto' in d.getVar('TEST_SUITES'))):
+        create_rpm_index(d)
+
     testimage_main(d)
 }
 addtask testimage_auto before do_build after do_image_complete
-- 
1.9.1


