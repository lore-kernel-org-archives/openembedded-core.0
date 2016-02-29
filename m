Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 25E656FF73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1TFapqT014871 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:36:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id E0NxGA2aULr1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:36:51 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1TFam8l014867
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:36:50 GMT
Message-ID: <1456760208.11498.178.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Feb 2016 15:36:48 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/buildoptions: Improve unsafe references tests
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
X-List-Received-Date: Mon, 29 Feb 2016 15:36:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Fixing one of the recipes not to contain unsafe references to paths
results in this QA test failing. Improve the test so that we test
the recipe works, then if we intentionally break the recipe, the
issue is detected.

Also split out the binaries test from the scripts test. The binaries
issue may also get 'fixed' in future and need the same fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index e2d12c3..6f322c5 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -102,12 +102,38 @@ class SanityOptionsTest(oeSelfTest):
         self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
 
     @testcase(278)
-    def test_sanity_userspace_dependency(self):
-        self.write_config('WARN_QA_append = " unsafe-references-in-binaries unsafe-references-in-scripts"')
-        bitbake("-ccleansstate gzip nfs-utils")
-        res = bitbake("gzip nfs-utils")
+    def test_sanity_unsafe_script_references(self):
+        self.write_config('WARN_QA_append = " unsafe-references-in-scripts"')
+
+        bitbake("-ccleansstate gzip")
+        res = bitbake("gzip")
+        line = self.getline(res, "QA Issue: gzip")
+        self.assertFalse(line, "WARNING: QA Issue: gzip message is present in bitbake's output and shouldn't be: %s" % res.output)
+
+        self.append_config("""
+do_install_append_pn-gzip () {
+	echo "\n${bindir}/test" >> ${D}${bindir}/zcat
+}
+""")
+        res = bitbake("gzip")
         line = self.getline(res, "QA Issue: gzip")
         self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
+
+    def test_sanity_unsafe_binary_references(self):
+        self.write_config('WARN_QA_append = " unsafe-references-in-binaries"')
+
+        bitbake("-ccleansstate nfs-utils")
+        #res = bitbake("nfs-utils")
+        # FIXME when nfs-utils passes this test
+        #line = self.getline(res, "QA Issue: nfs-utils")
+        #self.assertFalse(line, "WARNING: QA Issue: nfs-utils message is present in bitbake's output and shouldn't be: %s" % res.output)
+
+#        self.append_config("""
+#do_install_append_pn-nfs-utils () {
+#	echo "\n${bindir}/test" >> ${D}${base_sbindir}/osd_login
+#}
+#""")
+        res = bitbake("nfs-utils")
         line = self.getline(res, "QA Issue: nfs-utils")
         self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: nfs-utils message is not present in bitbake's output: %s" % res.output)
 



