Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3A034716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 10:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAoc3t028910 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:50:38 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YJNXqOSjiEoV
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:50:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAoQVv028884
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:50:37 +0100
Message-ID: <1430218226.13022.163.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 11:50:26 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] testimage: Improve sdk handling of TEST_SUITES
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
X-List-Received-Date: Tue, 28 Apr 2015 10:50:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently TEST_SUITES is used for both target image and sdk versions which
can be confusing. This introduces TEST_SUITES_SDK for the sdk version of
the code so that the different test sets can be specified independently.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 1557675..4074ff7 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -68,6 +68,8 @@ do_testsdk[lockfiles] += "${TESTIMAGELOCK}"
 
 def get_tests_list(d, type="runtime"):
     testsuites = d.getVar("TEST_SUITES", True).split()
+    if type == "sdk":
+        testsuites = (d.getVar("TEST_SUITES_SDK", True) or "auto").split()
     bbpath = d.getVar("BBPATH", True).split(':')
 
     # This relies on lib/ under each directory in BBPATH being added to sys.path
@@ -261,7 +263,7 @@ def testsdk_main(d):
     # they won't be skipped even if they aren't suitable.
     # testslist is what we'll actually pass to the unittest loader
     testslist = get_tests_list(d, "sdk")
-    testsrequired = [t for t in d.getVar("TEST_SUITES", True).split() if t != "auto"]
+    testsrequired = [t for t in (d.getVar("TEST_SUITES_SDK", True) or "auto").split() if t != "auto"]
 
     sdktestdir = d.expand("${WORKDIR}/testimage-sdk/")
     bb.utils.remove(sdktestdir, True)



