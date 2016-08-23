Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1A36877054
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 16:10:04 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id o80so202447076wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=TFFrJmm6Er/ME5aetoWgihH91apYzb0bncf9W3sxByA=;
	b=VNvlo/kLewTAk/Vo6Y8mwZim5AjdiAdwuRIXornVcjToiNxXR8A7PXLYBfITX6m5rM
	CvK3HttJ5kbNIJaBlLG2Gh09KpAD9WjcsZQTAs5TUew+c2xIr4ZfKzSSo0v9i9bEYELt
	xzi5Gz8//uNtzGVGtOt1NBe9Y8dnSHeaUT+G8Nc+dSmVQoU+I4S6H6cvXM7wXQfmx6A5
	VZSommnvMMNy9g/mHXpxyIthlSFn4c8FL4IkrOEcldtW+UZB4iNAIfmaS8VFXKEPfiMP
	eH8sPbpcUnySu/yCDgWHDHz+LL9ybVgc1J4i8Z8GUQZg5eQemOwK1W455Hk4knBEKsfQ
	FXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TFFrJmm6Er/ME5aetoWgihH91apYzb0bncf9W3sxByA=;
	b=DrYpoUC4VBWEitm2GhQ3zQv/xGJajzewDo6sivPU/I6ydyZfZEKE8PAz1QsyUlSn3M
	DzPEXOtBLgXQNvJyeM0ZK+O1ERLqczbRcs76yw34OMT5IZeZQpqtIzH4Sh+a4jNqjL3N
	sFP3Bv8+jUXS9nlt8UE4hcThPPTFksRx4YqqvzXyMSW1Tjnf2cjlL9wC9nWZw+hpHxB/
	wvCqgM12YLULWpgev7PGC/3ghBjeFMgnK3OwbuCw2bJFQcSHNeJstZJaJjyWXZhoPG9e
	FocshcCbaFGc7kP8Rqcl1g72rN3hcRDwKBRl6vjuWOCL6pANeZ/1vzt2G6zJI+bsnSPH
	z1xA==
X-Gm-Message-State: AEkoouvr1ctoS7Qn7j/xG+ZZQ2FX6wp4g92aaLqvZDeRQpW4F7QqNvxtnNn16HufpiksKR3B
X-Received: by 10.28.196.136 with SMTP id u130mr19807806wmf.83.1471968604598; 
	Tue, 23 Aug 2016 09:10:04 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	207sm28269238wmb.7.2016.08.23.09.10.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 09:10:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 17:09:58 +0100
Message-Id: <1471968598-15585-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] oeqa/runtime/rpm: use su instead of sudo
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
X-List-Received-Date: Tue, 23 Aug 2016 16:10:05 -0000

This test works fine with su, which is more likely to be installed in images
than sudo.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/rpm.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index 624c515..4d03ecb 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -53,9 +53,9 @@ class RpmInstallRemoveTest(oeRuntimeTest):
     def test_rpm_query_nonroot(self):
         (status, output) = self.target.run('useradd test1')
         self.assertTrue(status == 0, msg="Failed to create new user: " + output)
-        (status, output) = self.target.run('sudo -u test1 id')
+        (status, output) = self.target.run('su -c id test1')
         self.assertTrue('(test1)' in output, msg="Failed to execute as new user")
-        (status, output) = self.target.run('sudo -u test1 rpm -qa')
+        (status, output) = self.target.run('su -c "rpm -qa" test1 ')
         self.assertEqual(status, 0, msg="status: %s. Cannot run rpm -qa: %s" % (status, output))
 
     @testcase(195)
@@ -98,4 +98,3 @@ class RpmInstallRemoveTest(oeRuntimeTest):
     @classmethod
     def tearDownClass(self):
         oeRuntimeTest.tc.target.run('rm -f /tmp/rpm-doc.rpm')
-
-- 
2.8.1


