Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id F288876710
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 15:52:56 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p63so30666317wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 07:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Hs1BXSqnxSjBQBYtWn8JxvW+q0jH9eIGxcoI67tKKxM=;
	b=PxqD0wUs1ccuZZHb+uy3VEX9DKjxl+exrF8t18ZmQrTMp13ZTJgKFt/J0nwaXupFch
	IBPanZ1eel1eJrk1OYPtQj6/hvvfpQ3PT9BWCn0gIIYPbAv8yOLIRVFpJNHi0cruvagx
	SnFS9BeuQ2mm8Usfk9o1oysGEIDypBiezjlR/H9V5LX40BBNxsJtRaRx1+T0PLUZ6auc
	Cz7vsFzOMBXufyJ1DL6+zZtsX29aupIf91auABgMxIMDzeQbTLZ/c5Kk7E1V/IyNgYUW
	Kqe/polt4j2zUf8LR93nJTk29jrkivfB0xs7jpO3pf0I+WYm4Sjc8LQyPj+Syz32Yxh0
	cGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Hs1BXSqnxSjBQBYtWn8JxvW+q0jH9eIGxcoI67tKKxM=;
	b=AaawTMonCHBAneTz8MwDD7OOfTviuV305rpaqNOvdoIJv+RMWlqYD6EX7cDsmdgKHD
	V9h3vP9GfSmeWmCnti71AdHfrSicfJMcNT3wpqxPZ+CZNSWzQlbUH6ek4ny45huGN031
	rziYjElIBcWLFEKAsZaRlDDH0lOZTqgk0vMtP1aRrkDGfoP/PhKFei8nTLYtehG/LdtO
	bmro7upjumCnOCLNbmdTzQetsHGzf+STvIGM8rQJXw+1z0rqUyg9PqS34Lk0LlBrg856
	Rx9utgMSmo26CbfT/LJsNfZlLqrCCw1RrLtJUo+kvOGGxOoSijwxWHkG3bcCcAlDFXI9
	FdSA==
X-Gm-Message-State: AG10YOQpCoP6JJV4LeADyjOqCLEKUhPkgQclJv4PyShTv8ehNbPgQTbeD1pAeppAdVn25+bM
X-Received: by 10.194.176.74 with SMTP id cg10mr4512755wjc.169.1453996376028; 
	Thu, 28 Jan 2016 07:52:56 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e14sm3441330wmi.21.2016.01.28.07.52.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jan 2016 07:52:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jan 2016 15:52:47 +0000
Message-Id: <1453996367-14011-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] oeqa/runtime/rpm: be more verbose if test_rpm_query_nonroot fails
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
X-List-Received-Date: Thu, 28 Jan 2016 15:52:57 -0000

If some parts of this test fail put the failing output in the logs to help
debugging.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/rpm.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index 32aae24..624c515 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -52,11 +52,11 @@ class RpmInstallRemoveTest(oeRuntimeTest):
     @skipUnlessPassed('test_ssh')
     def test_rpm_query_nonroot(self):
         (status, output) = self.target.run('useradd test1')
-        self.assertTrue(status == 0, msg="Failed to create new user")
+        self.assertTrue(status == 0, msg="Failed to create new user: " + output)
         (status, output) = self.target.run('sudo -u test1 id')
         self.assertTrue('(test1)' in output, msg="Failed to execute as new user")
         (status, output) = self.target.run('sudo -u test1 rpm -qa')
-        self.assertEqual(status, 0, msg="status: %s. Cannot run rpm -qa" % status)
+        self.assertEqual(status, 0, msg="status: %s. Cannot run rpm -qa: %s" % (status, output))
 
     @testcase(195)
     @skipUnlessPassed('test_rpm_install')
-- 
2.6.4


