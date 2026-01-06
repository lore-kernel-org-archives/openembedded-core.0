Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1EFCE9D75
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 16:03:41 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93189.1767715420485025929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 08:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=RoSduqcY;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=TteC6A2X;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id DE5391D00112;
	Tue,  6 Jan 2026 11:03:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 06 Jan 2026 11:03:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767715419;
	 x=1767801819; bh=/3YZR6lXs15qUjszWDFVJCSz51BWbf8w804zRGrHTyM=; b=
	RoSduqcY9MRKxS+nPwX1Hiu5BbTaqOvrYpxGsNhwWjkyEQ3hfzSAXaRkbBsAdRnp
	UsGEyZijQbRzwx2AWjIgcyB35kN61wxRAX5TiHEzndnBs6TrrnzPNLIqEus/cARC
	TaEuCrE/Sw4r5BKy2OwjvV/nCPyXXUubFYk1dg0Bm1GBZztw1rv+pzETjUGipMA0
	T6hawOuEM+woxEr9Tkd+o/h6JApZ4+b3qw6AM44vymJu/dnZtm7ZqLvwMyGuZoyA
	iNkcI2IeNWb1MFxuCDuKXec3h/nlLO8fkxAFQdxlkL2bGuCY5w9C/hJ+lJI3noL3
	R7iVidG/xfYIiAT8uEYlKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767715419; x=
	1767801819; bh=/3YZR6lXs15qUjszWDFVJCSz51BWbf8w804zRGrHTyM=; b=T
	teC6A2XSS5cM6ay2JqUspK52kevltHoyG7NMlATGUyD7bDS3VIRr7mO0kKpowRiO
	wRAWQbdt7ih4NinHz8tJbcstnD/APUjsLjSdOhuqNw20WJ/5zU6KTn7/8Ly+4LKH
	o+zMSXY4zjh5ESlc/R+Ug28cBuxApCDW0fnj6AusUxcPVTrW9gCMr6pswwym0ewC
	OGwVi+c70vJJxVcC6JDStyJ7fHcSP5WWOao/OS9ATY/kCMpzg88zEOislC4kUYg6
	Xnb1kYSHFIg3xGUcoQtBdFlmptd+OvocNm/EMH+LkZO+3koW4CY46/7XOFqH5ZzA
	dCsJcNll0nEbrhs3PWLdg==
X-ME-Sender: <xms:WzJdabQu1XNZBBZIC3v7mfuao8vAGBKDYEmoH-aEeBUQjJaVhmLKCQ>
    <xme:WzJdaSw6PtiBPb8PXhH_y5UxPVJEzdmht7t3bZtWmWzQpu-dfuUfTUJqGwweZvLoa
    VDPGNeVqJKTnRVqZ1KpasIMXGwc27ihKzZ04VQKjlnwIJHkOHrxuQaL>
X-ME-Received: <xmr:WzJdaedCm_ecYYSsW9wfWCV-0h4yfHx1nFo5hefU7RH3QB_ujyf7FMrEpgxF5Ag2F493yvnjuBKofCjxZhQOmMrJAWR68BY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddtiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtph
    htthhopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:WzJdaWJPBRLKvvL0l5wHb3kmcIcc1ln-RsGZqUUqQCDaGOY94W7M-Q>
    <xmx:WzJdaXFWs4UtFzcnUR9D8gJXM0qcPTXZg-k9VgRB9fBxnMRzRH4rSQ>
    <xmx:WzJdaYo_yVjIDBqRwKpUdycUUw-s81veOh0rRSWZrjOF0TfS7TYFIA>
    <xmx:WzJdaYS8krddDcvB0CQOqM_4V8oEBdU3_Yu6AGD4R2HZ0cy5rMvTeA>
    <xmx:WzJdaT2r0rMVvZkQPT3rr-4adR50Bx3btOk8APMiNiwPqqcJ_DANVh-a>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jan 2026 11:03:38 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Tue, 06 Jan 2026 16:03:32 +0000
Subject: [PATCH 1/2] devtool: deploy: Run pseudo with correct PATH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-devtool-path-v1-1-23fd7a493fe8@pbarker.dev>
References: <20260106-devtool-path-v1-0-23fd7a493fe8@pbarker.dev>
In-Reply-To: <20260106-devtool-path-v1-0-23fd7a493fe8@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3343; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=KMG7Se9cEL7bQO1zlCz2nrXjpYo2Eb0f8htnzAgrTso=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTGGkWWyzRtOZUhkK59ZkN4Jvc89U277bfu3Gt0X85zl
 dvGQHGnjlIWBjEuBlkxRZbNPV/vP+115M0IuaUAM4eVCWQIAxenAEwkNY6RYVeUYiVDkeLsJXYr
 9kpaT50ltSZ2Sq3ZjTXL1lTp91a41TP8ryzucIvpXVzn9WbtsgXmzY+1Lt7fVlO9L6Fu2Z3k/UE
 3uQA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 16:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228906

When running FAKEROOTCMD (i.e. pseudo), we need to use the same PATH as
we would use if we were running inside bitbake instead of the host
environment's PATH. This ensures that we don't pick up any host
executables that may have problems with pseudo (such as the uutils
implementations of common system utilities used in Ubuntu 25.10).

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 scripts/lib/devtool/__init__.py | 3 ++-
 scripts/lib/devtool/deploy.py   | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 969d6dc13ab1..7c8de5540c1c 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -74,12 +74,13 @@ def exec_watch(cmd, **options):
 
     return buf, None
 
-def exec_fakeroot_no_d(fakerootcmd, fakerootenv, cmd, **kwargs):
+def exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, cmd, **kwargs):
     if not os.path.exists(fakerootcmd):
         logger.error('pseudo executable %s could not be found - have you run a build yet? pseudo-native should install this and if you have run any build then that should have been built')
         return 2
     # Set up the appropriate environment
     newenv = dict(os.environ)
+    newenv['PATH'] = path
     for varvalue in fakerootenv.split():
         if '=' in varvalue:
             splitval = varvalue.split('=', 1)
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index a98b33c5718a..2bf693d165a0 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -186,8 +186,8 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
         srcdir = recipe_outdir
         recipe_outdir = os.path.join(workdir, 'devtool-deploy-target-stripped')
         if os.path.isdir(recipe_outdir):
-            exec_fakeroot_no_d(fakerootcmd, fakerootenv, "rm -rf %s" % recipe_outdir, shell=True)
-        exec_fakeroot_no_d(fakerootcmd, fakerootenv, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
+            exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "rm -rf %s" % recipe_outdir, shell=True)
+        exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
         os.environ['PATH'] = ':'.join([os.environ['PATH'], path or ''])
         oe.package.strip_execs(args.recipename, recipe_outdir, strip_cmd, libdir, base_libdir, max_process)
 
@@ -266,7 +266,7 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
         shutil.rmtree(tmpdir)
 
     # Now run the script
-    ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
+    ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
     if ret != 0:
         raise DevtoolError('Deploy failed - rerun with -s to get a complete '
                         'error message')

-- 
2.43.0


