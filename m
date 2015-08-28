Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 64D9076DAC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 23:49:53 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so30710198wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 16:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6cffW+8Ki0/T1LG/lnE9wBu3bwKeYk6YJdD/efuMsMw=;
	b=k3scVUDzl7iyWeVLj5sBoGCddqjimNTP9KciRRs3cg5xs7TvU50WHcBMRM0HWDeI1d
	C46MkirbYuI/ANZJynA4lsxs8d3xMKZruTLaYelJWJEgdSkwELtOTBdOfWalFrRo3aSV
	3U7RGj0BLqK6H1zhWR9BLA1odeIufUJPVb/Nu3wFI4N7OfRK4QpRxCGp++rYD+5t4DDk
	PAvcOKW/RBAMBo0GLK9yB4WIer2uNmLzeYWib+hA+bmg1FegJ6ylDORBchI4QsBh5UpA
	qdvPPc95mDBGLRc7sDpDAHjnn5LKFkdT90Ncyus/0Wt8BwAdSeIoWncOueQkjiJOc28B
	ZbcA==
X-Gm-Message-State: ALoCoQmQIXkIuuZ9j1eqRl9C7SI4yjm0p9tna04VJoKj4mH/UTgn6cFy1j1XPsXk5QbvQnxXGorb
X-Received: by 10.194.192.166 with SMTP id hh6mr13364126wjc.127.1440805793150; 
	Fri, 28 Aug 2015 16:49:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 4sm10185674wjt.46.2015.08.28.16.49.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Aug 2015 16:49:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Aug 2015 00:43:17 +0100
Message-Id: <1440805397-3775-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440805397-3775-1-git-send-email-ross.burton@intel.com>
References: <1440805397-3775-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] oeqa/runtime/multilib: change test case to use glib-2.0-utils
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
X-List-Received-Date: Fri, 28 Aug 2015 23:49:55 -0000

Using connman-applet as a multilib test case seems quite heavy due to the
numerous dependencies it has, whereas the same test ("do binaries get swapped
correctly") can be done with a lower-level library containing binaries, for
example glib-2.0.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/multilib.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/multilib.py b/meta/lib/oeqa/runtime/multilib.py
index e1bcc42..59ae86d 100644
--- a/meta/lib/oeqa/runtime/multilib.py
+++ b/meta/lib/oeqa/runtime/multilib.py
@@ -39,10 +39,10 @@ class MultilibTest(oeRuntimeTest):
 
     @testcase('279')
     @skipUnlessPassed('test_check_multilib_libc')
-    def test_file_connman(self):
-        self.assertTrue(oeRuntimeTest.hasPackage('lib32-connman-gnome'), msg="This test assumes lib32-connman-gnome is installed")
+    def test_file_glib(self):
+        self.assertTrue(oeRuntimeTest.hasPackage('lib32-libglib-2.0-utils'), msg="This test assumes lib32-libglib-2.0-utils is installed")
 
-        (status, output) = self.target.run("readelf -h /usr/bin/connman-applet")
-        self.assertEqual(status, 0, "Failed to readelf /usr/bin/connman-applet")
+        (status, output) = self.target.run("readelf -h /usr/bin/glib-genmarshal")
+        self.assertEqual(status, 0, "Failed to readelf /usr/bin/glib-genmarshal")
         theclass = self.parse(output)
-        self.assertEqual(theclass, "ELF32", msg="connman-applet isn't ELF32 (is %s)" % theclass)
+        self.assertEqual(theclass, "ELF32", msg="glib-genmarshal isn't ELF32 (is %s)" % theclass)
-- 
2.1.4


