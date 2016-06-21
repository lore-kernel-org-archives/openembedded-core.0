Return-Path: <ross.burton@intel.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0ED70018
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:39:37 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id ak10so12453962lbc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=5ee6aWAo1Bx9xtNTWE25hJskUKhsqaqmQwIVUuDoxa8=;
	b=0ZtI0QoGL/+OijAuc4w0FSQHN/snCFvMDdBScYnzAGh+UNugmcsbyAy55jHfYAvY1Z
	wSUIZ5MLC11s105Q1H1gVq8nvxe5GJrQ5aALvX99UWSNqxJxvHZz1IaMysd0kpoXTXY2
	/KGEaTBz9omN5/LyTMcfirDbOVWW3XFL5TOtZQWaRaoIHEKYEouanQX+IRPBf4iTCSXw
	RKZHSqRQfKX/MN/u96PUntZ3WOBQoiXSwvW5OjK6phvNjmmDQ7sDS3/+zNQilZD+Ra5i
	MZtcYJJtMZoMTkpShYjL45BRMkO62RzNpbuEHTIoN5+/RSXUMbD6TithmQpmJ+hFeP8s
	15Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5ee6aWAo1Bx9xtNTWE25hJskUKhsqaqmQwIVUuDoxa8=;
	b=TCQLV+OKdval75w5HASTdRKrhIHy2GuDn8OuEPipJFRSnvNFVLVbWe3BgatqPf+UWJ
	KILrErl0mm+oH+H2rL0LtDd+Nu65K+/yCQ6LhZ034Mux+4MdXVWXbSgluwarQBRtLWPp
	eVH5xHnUVqGgsI+MHHcBOPJ2N+z7BrMFbg5E+jhIQBI19qnx3Rr6X3U2V4+WaOngs3Oy
	ApVj8QyoZfoGmI8C5x49vbi7EWwkWDHrV+5BT2LcziLxH5kilmhLpdnxq6eDfjKmKh/b
	80d5P4m/f/X18n4iaBdjuUY3ngqXGvOenDHLEK1IEZXRJ4UMLKnKo1nOehZvq0ZDe4UH
	QxFw==
X-Gm-Message-State: ALyK8tL5lPtVgZrzmqV//yGAbxIeEK91BSiYDK9CNP5hi3Q1tRxzprmQfYCeEIaXmNubBQxh
X-Received: by 10.194.117.35 with SMTP id kb3mr21096870wjb.136.1466519976599; 
	Tue, 21 Jun 2016 07:39:36 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i74sm3272374wmg.21.2016.06.21.07.39.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jun 2016 07:39:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2016 15:39:29 +0100
Message-Id: <1466519971-5127-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/3] oeqa/sdk: add Galculator to the SDK test
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
X-List-Received-Date: Tue, 21 Jun 2016 14:39:38 -0000

This is a GTK+3 application, so we don't need to ship GTK+ 2 in Sato just for
the SDK test suite.

[ YOCTO #9780 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/buildgalculator.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/buildgalculator.py

diff --git a/meta/lib/oeqa/sdk/buildgalculator.py b/meta/lib/oeqa/sdk/buildgalculator.py
new file mode 100644
index 0000000..f797cac
--- /dev/null
+++ b/meta/lib/oeqa/sdk/buildgalculator.py
@@ -0,0 +1,23 @@
+from oeqa.oetest import oeSDKTest, skipModule
+from oeqa.utils.decorators import *
+from oeqa.utils.targetbuild import SDKBuildProject
+
+def setUpModule():
+    if not (oeSDKTest.hasPackage("gtk+3") or oeSDKTest.hasPackage("libgtk-3.0")):
+        skipModule("Image doesn't have gtk+3 in manifest")
+
+class GalculatorTest(oeSDKTest):
+
+    def test_galculator(self):
+        project = SDKBuildProject(oeSDKTest.tc.sdktestdir + "/galculator/",
+                                  oeSDKTest.tc.sdkenv, oeSDKTest.tc.d,
+                                  "http://galculator.mnim.org/downloads/galculator-2.1.4.tar.bz2")
+        project.download_archive()
+
+        self.assertEqual(project.run_configure(), 0,
+                        msg="Running configure failed")
+
+        self.assertEqual(project.run_make(), 0,
+                        msg="Running make failed")
+
+        project.clean()
-- 
2.8.1


