Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4F84D65C9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 16:36:57 +0000 (UTC)
Received: by wgqq4 with SMTP id q4so14595764wgq.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 09:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=e2KIHkkwv/hQh3LMkoFyD8EFf5V/BdfwJVjZyilIA+4=;
	b=Q5NzqyswNJYLftyAvcLz0mq802QWiLrUs1Cp/3m9lW/slvq2Ot+nfJQba5kd7sOQfQ
	iPxxkNdmS24/rd+/KNkObH8jNq0P0lfRRoIMK+3vctQ3So5uvivKGaqzbAhEf2LpWb9z
	VmdMlEmxc9+cGTdh5OBcss7UzbSW95Py0l06JqfVh/1z/HBy3+A/QR1mxOFF8hpEEqYM
	C3RKNpyM1+1jlx5bG2kpoLH4cA3H5CG393OBYodt0MEt6DEFOj6qecAiKiXrz+O0nlPv
	wAYbSEEbEN/RP++t2vobApyqtwdSi459yeKxT+zz0a/nyIdeHYaattvG1shM72DKZmgL
	sy8A==
X-Gm-Message-State: ALoCoQlbEJM+Hd7or5JGp1MXp6KB+nqIow3+aPY4J/f4RUE24BRnM9nF3g52NqIs1Eb5nh7NBP2S
X-Received: by 10.194.118.167 with SMTP id kn7mr60980544wjb.113.1435077417794; 
	Tue, 23 Jun 2015 09:36:57 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	ef10sm36546875wjd.49.2015.06.23.09.36.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Jun 2015 09:36:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 17:31:52 +0100
Message-Id: <1435077112-17116-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe-selftest: timestamp the test runs
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
X-List-Received-Date: Tue, 23 Jun 2015 16:37:02 -0000

The selftest can take a couple of hours to run, so add a custom result class to
timestamp the output to make it easy to spot any slow tests.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/oe-selftest | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index a04e9fc..fd58a66 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -176,7 +176,7 @@ def main():
         suite = unittest.TestSuite()
         loader = unittest.TestLoader()
         loader.sortTestMethodsUsing = None
-        runner = unittest.TextTestRunner(verbosity=2)
+        runner = unittest.TextTestRunner(verbosity=2, resultclass=StampedResult)
         # we need to do this here, otherwise just loading the tests
         # will take 2 minutes (bitbake -e calls)
         oeSelfTest.testlayer_path = get_test_layer()
@@ -196,6 +196,17 @@ def main():
         else:
             return 1
 
+class StampedResult(unittest.TextTestResult):
+    """
+    Custom TestResult that prints the time when a test starts.  As oe-selftest
+    can take a long time (ie a few hours) to run, timestamps help us understand
+    what tests are taking a long time to execute.
+    """
+    def startTest(self, test):
+        import time
+        self.stream.write(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()) + " - ")
+        super(StampedResult, self).startTest(test)
+
 if __name__ == "__main__":
     try:
         ret = main()
-- 
2.1.4


