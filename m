Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 14DDF71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 23:49:47 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so30709249wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 16:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=M7Z4SPN1iuu1kr61IIeftYVEOI9jjICxM8T5v3snWa8=;
	b=Z6lv9DRe7kg8B6el3EdY7tY69Uhj3SaHJynm2JkxhiJ+kgolHXh0NvsZBmWNI8K60z
	r5WFZgldAuKJAu+1Nv6/6beIj4KXRcFB38o1VPE7OLkwDO+Ev+qPV/XW6eLo38fSf5nk
	xCpNv00EeJE2/SWprtX/lJyaY45imI09Cc1CXEs5kRvRE0yDnYc9zNE81Brw/HbDTuwS
	Botn+/8oYdavz5wb0XgMmPHrw6syNv/bjFWckMJYX4QsuCDQ0s5PJ7T56hs5VW9+prhq
	Pd30TumZ1EvCkNScYMzcvM9wwoiTntOmhRQ7G4W+/0X8S5Yxko5WMN5QzgoEr12xpM6r
	z6WA==
X-Gm-Message-State: ALoCoQloEOGjiHJGzmac1Vr3KS1Vu05+mEGdoxlBmyTfz7J0nfiHHfJznvDbIuiXdmNxufJWoZXT
X-Received: by 10.180.84.40 with SMTP id v8mr7272494wiy.77.1440805787222;
	Fri, 28 Aug 2015 16:49:47 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	pn6sm10210520wjb.36.2015.08.28.16.49.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Aug 2015 16:49:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Aug 2015 00:43:13 +0100
Message-Id: <1440805393-3708-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runtime/multilib: fix and improve multilib test
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
X-List-Received-Date: Fri, 28 Aug 2015 23:49:48 -0000

Replace the previous shell magic with a Python function to parse the readelf
output, and fix the package names to include the lib32- prefix.

[ YOCTO #8219 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/multilib.py | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/multilib.py b/meta/lib/oeqa/runtime/multilib.py
index ab0a6cc..1c1729b 100644
--- a/meta/lib/oeqa/runtime/multilib.py
+++ b/meta/lib/oeqa/runtime/multilib.py
@@ -10,9 +10,22 @@ def setUpModule():
 
 class MultilibTest(oeRuntimeTest):
 
+    def parse(self, s):
+        """
+        Parse the output of readelf -h and return the binary class, or fail.
+        """
+        l = [l.split()[1] for l in s.split('\n') if "Class:" in l]
+        if l:
+            return l[0]
+        else:
+            self.fail("Cannot parse readelf output\n" + s)
+
     @testcase('279')
     @skipUnlessPassed('test_ssh')
     def test_file_connman(self):
-        self.assertTrue(oeRuntimeTest.hasPackage('connman-gnome'), msg="This test assumes connman-gnome is installed")
-        (status, output) = self.target.run("readelf -h /usr/bin/connman-applet | sed -n '3p' | awk '{print $2}'")
-        self.assertEqual(output, "ELF32", msg="connman-applet isn't an ELF32 binary. readelf says: %s" % self.target.run("readelf -h /usr/bin/connman-applet")[1])
+        self.assertTrue(oeRuntimeTest.hasPackage('lib32-connman-gnome'), msg="This test assumes lib32-connman-gnome is installed")
+
+        (status, output) = self.target.run("readelf -h /usr/bin/connman-applet")
+        self.assertEqual(status, 0, "Failed to readelf /usr/bin/connman-applet")
+        theclass = self.parse(output)
+        self.assertEqual(theclass, "ELF32", msg="connman-applet isn't ELF32 (is %s)" % theclass)
-- 
2.1.4


