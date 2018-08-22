Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 201AD7929B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 12:49:39 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id q8-v6so2057285wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 05:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=remUsvpSP6Q5ad69rhJpmvRLiNZYKiybcedKZv6hvQ0=;
	b=gmLwUPJzZZUxNslMinpuiG8nkUIMf/Fo+ksnwQjbMvmG2tKRDYyAMM0YG90KZLEq4c
	2RqiP36Zax5KlCchQ5vJGfYxKeq8C4lePaH1aagHOabKNQy8GWKvPU5bQiUJeybUX5U7
	MSoEM+EghMeTTfutBhNICXkm3ptzrrl7saPSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=remUsvpSP6Q5ad69rhJpmvRLiNZYKiybcedKZv6hvQ0=;
	b=l3s9ekXYRxSIDBG+aVsbsT8XsWVOxUPMu5JzSELTF8Lf4Jrw/XWNkHE4V52U0fNyOM
	8Lms81vr5ElTAHPj0sHiUk1G9ejjX+d7uR4IhneK0606fdS2HFe4ph9FzG4GmQGCAb+w
	a8dc2rOlMLqFx/p8zHDdee5nKoGnkl3M2o6Do1MRDfEl2I0sXqkpoe9guCoheIHPTLEz
	pNVF/u71keBqEpDaZEktslMMz+RxlGD2omIz71Ux8I0O3Hcl4nal+C31G5etEYvAXahQ
	BdV1XQd0qdCDD38KMnfUdg2WlYvv1QUaTPz+WRq3q/cll1hL6NfreJdqz+yGIbm6JiUl
	q8ow==
X-Gm-Message-State: APzg51Df/4TtPHR/J8VAV5QwOVx8pjYx4ki2hOo7+2d7rZ2OQwrPNBCS
	aK0Bpt7iCT/ROGgHubl/0xEAjt5Ktek=
X-Google-Smtp-Source: ANB0VdbjBkyyB/OgBZ9ocyk/wT6vZvr0aZcKPwLNa9UP54K/OaErby0MPH+pSsDPMqV0vwS41zjOSA==
X-Received: by 2002:a1c:ea53:: with SMTP id
	i80-v6mr2445108wmh.113.1534942180595; 
	Wed, 22 Aug 2018 05:49:40 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u40-v6sm2179369wrc.43.2018.08.22.05.49.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Aug 2018 05:49:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 13:49:38 +0100
Message-Id: <20180822124938.3937-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oeqa/runtime/ldd: Clean up test
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
X-List-Received-Date: Wed, 22 Aug 2018 12:49:40 -0000

* Merge the two tests together as having them separate is pointless
* Test that ldd runs correctly
* Add in a dependency on the "ldd" package being installed instead of
  the sdk tools feature

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ldd.py | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ldd.py b/meta/lib/oeqa/runtime/cases/ldd.py
index c6d92fd5af8..5bde1845d9c 100644
--- a/meta/lib/oeqa/runtime/cases/ldd.py
+++ b/meta/lib/oeqa/runtime/cases/ldd.py
@@ -2,24 +2,23 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class LddTest(OERuntimeTestCase):
 
     @OETestID(962)
-    @skipIfNotFeature('tools-sdk',
-                      'Test requires tools-sdk to be in IMAGE_FEATURES')
+    @OEHasPackage(["ldd"])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    def test_ldd_exists(self):
+    def test_ldd(self):
         status, output = self.target.run('which ldd')
         msg = 'ldd does not exist in PATH: which ldd: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
-    @OETestID(239)
-    @OETestDepends(['ldd.LddTest.test_ldd_exists'])
-    def test_ldd_rtldlist_check(self):
         cmd = ('for i in $(which ldd | xargs cat | grep "^RTLDLIST"| '
               'cut -d\'=\' -f2|tr -d \'"\'); '
               'do test -f $i && echo $i && break; done')
         status, output = self.target.run(cmd)
-        msg = "ldd path not correct or RTLDLIST files don't exist."
-        self.assertEqual(status, 0, msg=msg)
+        self.assertEqual(status, 0, msg="ldd path not correct or RTLDLIST files don't exist.")
+
+        status, output = self.target.run("ldd /bin/true")
+        self.assertEqual(status, 0, msg="ldd failed to execute: %s" % output)
-- 
2.17.1


