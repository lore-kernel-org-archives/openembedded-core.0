Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9F62265D00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 00:12:53 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id r144so51344wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 16:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=UDdMzXCdc7vnls488XI+wLMdheT/5Y4LJGH16M7LZX0=;
	b=zH+9nRuzbIC5Su4tsqLGCbN+lyne4OrX/00n02PSoxPkQRm5JiQDcPf4ZFnskFqEL7
	ipL0RXKrat2Q0IZzprxQK5Sfnr9v/lwrtWPfGZ2TCT8vylRmXLWsVTZsxSVVer/bgmB4
	oqtQ1dVNfwAzIVXqBHil5jOHvzJLStz8wRLDNc2cs/nWBnWfco0AKMD3/fvsFTcw9mpW
	VJAY6CIQHJ76eU1Z+4kXLW2m3heIQ3L4/3aYZ3yB7l1Vr88t8VgRD/ksU7zFucBUAtdC
	Nk2LkRUZM9msKTAN861FS7e8mSYoZn+9E/iNrmeVBItDs05vlNa70z2DfIMVwEfE7tjx
	uM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UDdMzXCdc7vnls488XI+wLMdheT/5Y4LJGH16M7LZX0=;
	b=qF4jTepxiCFjen5I4Kd768b8LvPYK19X1FHnWppif8oM18wFh1cj+/IiVOw/n18Gsm
	x1yHyNy/GjfxeBkDQnPvvTTriEXBIWWOrW4Kb+XeBl793S5L0ACOD8RJmEHuiegbN8sJ
	DMV7jzNLoqHV5/ZhunAKUBSH85tT8Ef5AU3I9KnQV3HmpipfU09rGPioNh3qQosBk9eL
	nCwqGIFn7ePAqKfh97+Px/sZZ1Cq0D+3otiRg6zG+XmmfTmR+k3KzbfElfpWkzO7I9Up
	AQb1fHemgV+9iLb5BtFRIJCWyKziJTj5YrbIfwmljYN+zeCYvpJpgV+Umek9hjfpft/U
	9GfQ==
X-Gm-Message-State: AIkVDXL/EZsI43/4hMEqsDniKe46LQGZnAHIvjj4/hbUu4B1VTQHTzJPQd+ITHzqNWcmof+C
X-Received: by 10.28.211.205 with SMTP id k196mr13339167wmg.124.1484698372883; 
	Tue, 17 Jan 2017 16:12:52 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id o143sm329837wmd.3.2017.01.17.16.12.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Jan 2017 16:12:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2017 00:12:50 +0000
Message-Id: <1484698370-16673-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] oeqa/selftest/devtool: rewrite modify testcase
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
X-List-Received-Date: Wed, 18 Jan 2017 00:12:53 -0000

The modify testcase had to be updated as it started failing when mdadm was
upgraded due to hardcoding version numbers in the test.  I then noticed how
inefficient the test was and mostly rewrote it.

Start by changing the minor modification to change "Linux Software RAID" (the
subtitle of the man page) to "antique pin sardine" (a nonsense phrase that is
unlikely to appear upstream), and neaten the logic.

Start by not removing sstate at the beginning of the test. To ensure builds
happen we can use -f and -C, and iterating the sstate cache is time consuming.

Don't bitbake mdadm repeatedly until it stabilizes, we can start with bitbake -C
unpack to ensure that a full build is done from scratch.

os.path.join has the interesting quirk that join(/foo, /bar) results in /bar, so
use oe.path.join instead of working around that manually.

Don't repeatedly call get_bb_var(), each call results in a call to bitbake.

These changes reduce the runtime of the test from over 600 seconds to around 160
seconds on my machine.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 73 +++++++++++++++------------------------
 1 file changed, 27 insertions(+), 46 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 94b6b39..887c1e6 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -416,9 +416,8 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1164)
     def test_devtool_modify(self):
-        # Clean up anything in the workdir/sysroot/sstate cache
-        bitbake('mdadm -c cleansstate')
-        # Try modifying a recipe
+        import oe.path
+
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
@@ -429,66 +428,48 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
         matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'mdadm_*.bbappend'))
         self.assertTrue(matches, 'bbappend not created %s' % result.output)
+
         # Test devtool status
         result = runCmd('devtool status')
         self.assertIn('mdadm', result.output)
         self.assertIn(tempdir, result.output)
-        # Check git repo
         self._check_src_repo(tempdir)
-        # Try building
-        def list_stamps(globsuffix='*'):
-            stampprefix = get_bb_var('STAMP', 'mdadm')
-            self.assertTrue(stampprefix, 'Unable to get STAMP value for recipe mdadm')
-            return glob.glob(stampprefix + globsuffix)
-
-        numstamps = len(list_stamps('.do_compile.*'))
-        self.assertEqual(numstamps, 0, 'do_compile stamps before first build')
-        for x in range(10):
-            bitbake('mdadm')
-            nowstamps = len(list_stamps('.do_compile.*'))
-            if nowstamps == numstamps:
-                break
-            numstamps = nowstamps
-        else:
-            self.fail('build did not stabilize in 10 iterations')
 
-        # Try making (minor) modifications to the source
-        modfile = os.path.join(tempdir, 'mdadm.8.in')
-        result = runCmd("sed -i 's!^\.TH.*!.TH MDADM 8 \"\" v9.999-custom!' %s" % modfile)
+        bitbake('mdadm -C unpack')
 
-        def check_TH_line(checkfile, expected, message):
+        def check_line(checkfile, expected, message, present=True):
+            # Check for $expected, on a line on its own, in checkfile.
             with open(checkfile, 'r') as f:
-                for line in f:
-                    if line.startswith('.TH'):
-                        self.assertEqual(line.rstrip(), expected, message)
+                if present:
+                    self.assertIn(expected + '\n', f, message)
+                else:
+                    self.assertNotIn(expected + '\n', f, message)
 
-        check_TH_line(modfile, '.TH MDADM 8 "" v9.999-custom', 'man .in file not modified (sed failed)')
-        bitbake('mdadm -c package')
+        modfile = os.path.join(tempdir, 'mdadm.8.in')
         pkgd = get_bb_var('PKGD', 'mdadm')
         self.assertTrue(pkgd, 'Could not query PKGD variable')
         mandir = get_bb_var('mandir', 'mdadm')
         self.assertTrue(mandir, 'Could not query mandir variable')
-        if mandir[0] == '/':
-            mandir = mandir[1:]
-        manfile = os.path.join(pkgd, mandir, 'man8', 'mdadm.8')
-        check_TH_line(manfile, '.TH MDADM 8 "" v9.999-custom', 'man file not modified. man searched file path: %s' % manfile)
-        # Test reverting the change
-        result = runCmd("git -C %s checkout -- %s" % (tempdir, modfile))
-        check_TH_line(modfile, '.TH MDADM 8 "" v3.4', 'man .in file not restored (git failed)')
+        manfile = oe.path.join(pkgd, mandir, 'man8', 'mdadm.8')
+
+        check_line(modfile, 'Linux Software RAID', 'Could not find initial string')
+        check_line(modfile, 'antique pin sardine', 'Unexpectedly found replacement string', present=False)
+
+        result = runCmd("sed -i 's!^Linux Software RAID$!antique pin sardine!' %s" % modfile)
+        check_line(modfile, 'antique pin sardine', 'mdadm.8.in file not modified (sed failed)')
+
         bitbake('mdadm -c package')
-        pkgd = get_bb_var('PKGD', 'mdadm')
-        self.assertTrue(pkgd, 'Could not query PKGD variable')
-        mandir = get_bb_var('mandir', 'mdadm')
-        self.assertTrue(mandir, 'Could not query mandir variable')
-        if mandir[0] == '/':
-            mandir = mandir[1:]
-        manfile = os.path.join(pkgd, mandir, 'man8', 'mdadm.8')
-        check_TH_line(manfile, '.TH MDADM 8 "" v3.4', 'man file not updated. man searched file path: %s' % manfile)
-        # Test devtool reset
+        check_line(manfile, 'antique pin sardine', 'man file not modified. man searched file path: %s' % manfile)
+
+        result = runCmd('git -C %s checkout -- %s' % (tempdir, modfile))
+        check_line(modfile, 'Linux Software RAID', 'man .in file not restored (git failed)')
+
+        bitbake('mdadm -c package')
+        check_line(manfile, 'Linux Software RAID', 'man file not updated. man searched file path: %s' % manfile)
+
         result = runCmd('devtool reset mdadm')
         result = runCmd('devtool status')
         self.assertNotIn('mdadm', result.output)
-        self.assertFalse(list_stamps(), 'Stamp files exist for recipe mdadm that should have been cleaned')
 
     def test_devtool_buildclean(self):
         def assertFile(path, *paths):
-- 
2.8.1


