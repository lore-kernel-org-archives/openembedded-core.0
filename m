Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E04E71BEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:16 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c123so1750115pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6JXh4RMz/E5/zuGU01Hlb06CZkWfwUD1xPa7beJsfcI=;
	b=FKz3hPxlMFexHLV5iLjtxj7boCUMr3eprZlfvNqqFLbukt30O6/qXVQez6FdsI609m
	L4yA3AZQdtPX+cKGP+Ls1MwFW0Pg6lDShQSCFGNphYLBQjxodL16BYJ1qtzfsvMysFEr
	DHfLupvRhGbzRah/YEbmqUXOtTgeZxe8E37SKMrF9imko72Nz2jyBNfOeMdH9LC3qxoE
	f/XCAEjncvLvaLy7kljw4HRUgAvEVmfyCMMfnqMZmfw7DRV5D0ePJWqTd2F68beYnf4W
	Bdj8kiNIKt5luL87eOxRfz/GuqzTwf3dbltWglZEi5t3x9XCh275MVRYQPQGrTam5DyP
	G+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6JXh4RMz/E5/zuGU01Hlb06CZkWfwUD1xPa7beJsfcI=;
	b=oTuZigzJjl4c5QzT3qden7+rFLCDLDb3cl9Y3Z7TkwErce+xbbP2lOZT2yoyiikn8D
	J/ZM5RS6zkji8i5leHg5FiUQ30177pnmwM8n9g6im3sW9ZDh8Tfb1/Y0k/nYKlHbpLvy
	y/0zwVclwC9SYq67HH2flhGzOI5xIH22rlbZM3HGYOEJrOIrOoadiH8lLlQx6+8Snv5B
	bQB9nqzlpyOq9ymgRDHE8JEAd0gcSmCXNXxQefbZ3663xvpiWojISUOSBjkHJlR6zseq
	dtSSZwrbxF0f5m9NDHgnuvMjtkD5fN1pERXmDHnlOts8uf9wjbxU2RyIfyxpJwoINWL8
	GLRg==
X-Gm-Message-State: AA+aEWZeG1gniGuoS9hOxfAEWT5N4bkBXs3qJy3Bdc6wk3Wlhynya6Zd
	wkwasZ6PWOPStxR7hbyU7Tu008Xl
X-Google-Smtp-Source: AFSGD/UI26vMyvEm8KHUtqtYQ0q5Zk/gVuHNwO0WcRnfcbRYY1IbXEPLqQyxPDTXpnHjN4CuvMb1iA==
X-Received: by 2002:a63:7f4f:: with SMTP id p15mr420963pgn.296.1544737157133; 
	Thu, 13 Dec 2018 13:39:17 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:22 -0800
Message-Id: <f1f54d4874aa95f9bd49620c3417d48a544b152b.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 14/45] oeqa/selftest/buildoptions: Ensure diskmon tests run consistently
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:16 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Heartbeat events default to once a second and we need to ensure we have
enough time in the task to see them.

Add a nostamp delay task 5s long so we can have a consistently timed
task which doesn't need cleanup or have unneeded dependencies. This
ensures we should deterministically see the disk moinitor events
regardless of the state of the build. This is done in a way which
doesn't corrupt build state or need cleanup and is efficient.

(From OE-Core rev: ecc49ee8986929e2429d948000a0ca588fe63959)

(From OE-Core rev: d5ce38168238181423c9dcd1d258253e3515d0a5)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/recipes-test/delay/delay.bb    | 12 ++++++++++++
 meta/lib/oeqa/selftest/cases/buildoptions.py |  6 +++---
 2 files changed, 15 insertions(+), 3 deletions(-)
 create mode 100644 meta-selftest/recipes-test/delay/delay.bb

diff --git a/meta-selftest/recipes-test/delay/delay.bb b/meta-selftest/recipes-test/delay/delay.bb
new file mode 100644
index 0000000..f92d3d9
--- /dev/null
+++ b/meta-selftest/recipes-test/delay/delay.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Recipe with a fixed delay task"
+DESCRIPTION = "Contains a delay task to be used to for testing."
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+do_delay() {
+	sleep 5
+}
+do_delay[nostamp] = "1"
+addtask delay
\ No newline at end of file
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index c406e95..24597ac 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -59,15 +59,15 @@ class DiskMonTest(OESelftestTestCase):
     @OETestID(277)
     def test_stoptask_behavior(self):
         self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
-        res = bitbake("m4", ignore_status = True)
+        res = bitbake("delay -c delay", ignore_status = True)
         self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"')
-        res = bitbake("m4", ignore_status = True)
+        res = bitbake("delay -c delay", ignore_status = True)
         self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output, "Tasks should have been aborted immediatelly. Disk monitor is set to ABORT: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"')
-        res = bitbake("m4")
+        res = bitbake("delay -c delay")
         self.assertTrue('WARNING: The free space' in res.output, msg = "A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
 
 class SanityOptionsTest(OESelftestTestCase):
-- 
2.7.4


