Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id BDDF87785D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 10:19:43 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id z15so39481154lfd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=MNKcpLtUdkpSusFblVfckYCLstlaP6N2q5XjnvAfRXQ=;
	b=A5OZMARmoXhnqXTxT+dgO+kfx55KJkehfCNNdKLXqXhyPF3zaa+DZSgEM/urb79I+t
	JSDFGRlIgY+avM6ocB7/RZgWxnc1AnEBWoDiycR89ogEHMdhjpedb+qjhroGAAZ66azd
	1VW79896yhkseE05bdzVvlouhYz7lZjieC1n2gfmevMzD/HeJaww8ZiMI1Op7x3I4sc0
	T5hVm/G01se7BEI5COqy7txczn0KeM8AlblZABtkGfcaWYg1gGM87fAVGJb0aE/nBVec
	dCQ9vl+mGEt5EzMBhfK1fXLFRAHjM4ZPfR+bG+0Hyf24IR3fAgPfLfRXLyCWZTpGKSGG
	9dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MNKcpLtUdkpSusFblVfckYCLstlaP6N2q5XjnvAfRXQ=;
	b=CiyZwuHn3SWSCatWRhGfD7sBfSrroUwM7xepuPnN4XUU6vnnt7iPmYhYc39yFV5aIY
	cyte9t+XoUuuBpe2zY4eLpI1wLs//F/UDV6ALbKJriyeQ5eeDursBFabAAGRwIHHVMYK
	bcLlqS3lLCRboXwBoRZ5M//EbGr5DMax5ZgEfVsutKHfWnWdEoqNSy+iKD0DnFaV21E5
	tehfmXD0Ugs1GXMfR2b02T6idcReY6AG77yu2mrpPELo+hynjPfUP+pA5eUOOaDCY93b
	JyvVp77JxXaU4qq80G0iR1BjtH36RJqbwyxPEA2el0CM4dd0mjhhqOZA5rYWehJlm2fe
	skuw==
X-Gm-Message-State: AMke39n8N7Z1RsLLBCnSCXt9vg92+g+MwoZD4+/lhHEPP3cZoFTzwIkUNAypWBIImBR4fw==
X-Received: by 10.25.16.70 with SMTP id f67mr8155922lfi.136.1489400384249;
	Mon, 13 Mar 2017 03:19:44 -0700 (PDT)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	h140sm3530190lfg.39.2017.03.13.03.19.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 03:19:43 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 11:19:23 +0100
Message-Id: <1b0cfc24faa5ed847db7b1c795e400645289c629.1489390933.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH] wic: selftest: account for occasional newline in debugfs file names
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
X-List-Received-Date: Mon, 13 Mar 2017 10:19:44 -0000

Debugfs output may contain a newline in file names in 'ls -p' output. Make sure
that output is correctly split into lines by matching '/\n' and newlines are
removed from file names.

Fixes the following error appearing in AB tests:

   Traceback (most recent call last):
     File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/wic.py", line 388, in test_exclude_path
       files = [line.split('/')[5] for line in res.output.split('\n')]
     File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/wic.py", line 388, in <listcomp>
       files = [line.split('/')[5] for line in res.output.split('\n')]
   IndexError: list index out of range

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index dcb88bacad13a2da4c725abf1c986b39ea70f0fc..825312e5a55639129d88246e7335174484260fc1 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -381,11 +381,28 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                 self.assertEqual(0, runCmd("dd if=%s of=%s skip=%d count=%d" %
                                            (wicimg, part_file, start, length)).status)
 
+            def extract_files(debugfs_output):
+                # extract file names from the output of debugfs -R 'ls -p',
+                # which looks like this:
+                #
+                # /2/040755/0/0/.//\n
+                # /2/040755/0/0/..//\n
+                # /11/040700/0/0/lost+found^M//\n
+                # /12/040755/1002/1002/run//\n
+                # /13/040755/1002/1002/sys//\n
+                # /14/040755/1002/1002/bin//\n
+                # /80/040755/1002/1002/var//\n
+                # /92/040755/1002/1002/tmp//\n
+                #
+                # NOTE the occasional ^M in file names
+                return [line.split('/')[5].strip() for line in \
+                        debugfs_output.strip().split('/\n')]
+
             # Test partition 1, should contain the normal root directories, except
             # /usr.
             res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part1"))
             self.assertEqual(0, res.status)
-            files = [line.split('/')[5] for line in res.output.split('\n')]
+            files = extract_files(res.output)
             self.assertIn("etc", files)
             self.assertNotIn("usr", files)
 
@@ -393,7 +410,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             # directories.
             res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part2"))
             self.assertEqual(0, res.status)
-            files = [line.split('/')[5] for line in res.output.split('\n')]
+            files = extract_files(res.output)
             self.assertNotIn("etc", files)
             self.assertNotIn("usr", files)
             self.assertIn("share", files)
@@ -402,14 +419,14 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             # directory, but not the files inside it.
             res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part3"))
             self.assertEqual(0, res.status)
-            files = [line.split('/')[5] for line in res.output.split('\n')]
+            files = extract_files(res.output)
             self.assertNotIn("etc", files)
             self.assertNotIn("usr", files)
             self.assertIn("share", files)
             self.assertIn("bin", files)
             res = runCmd("debugfs -R 'ls -p bin' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part3"))
             self.assertEqual(0, res.status)
-            files = [line.split('/')[5] for line in res.output.split('\n')]
+            files = extract_files(res.output)
             self.assertIn(".", files)
             self.assertIn("..", files)
             self.assertEqual(2, len(files))
-- 
2.5.5


