Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A34CA745FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 03:19:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R3J12N010055
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 20:19:01 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 26 Jul 2018 20:19:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2018 11:29:14 +0800
Message-ID: <7797881de00cfa76404ed3c107b286f65f66af00.1532662132.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1532662132.git.liezhi.yang@windriver.com>
References: <cover.1532662132.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] testsdk.bbclass: check python module testools and subunit
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
X-List-Received-Date: Fri, 27 Jul 2018 03:19:00 -0000
Content-Type: text/plain

The testools or subunit is not part of python's standard library, so check them
before use.

Fixed when they are not installed on host:
$ bitbake core-image-minimal -ctestsdk
Exception: ImportError: No module named 'testtools'

Now it can run with a warning:
WARNING: core-image-minimal-1.0-r0 do_testsdk: Failed to import testools or subunit, the testcases will run serially

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/testsdk.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 5df17bf..4f86998 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -43,6 +43,12 @@ def testsdk_main(d):
         d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"))
 
     processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or d.getVar("BB_NUMBER_THREADS")
+    if processes:
+        try:
+            import testools, subunit
+        except ImportError:
+            bb.warn("Failed to import testools or subunit, the testcases will run serially")
+            processes = None
 
     sdk_dir = d.expand("${WORKDIR}/testimage-sdk/")
     bb.utils.remove(sdk_dir, True)
-- 
2.7.4


