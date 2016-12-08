Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4107771C4C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:32:05 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id a197so236266688wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 13:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=U31xnD1VrCH7SgznkBXaOSP4GhkFS9LU/gUfocZlhlQ=;
	b=SkaYNfmTDT35wecctYfp9hKQBpC2rqlrOoQsjmK4h5bvJ/n449y8BC28j4zW6PRhIB
	8yEQ8jirhBfc2VTTiur2m1/RmRA/vB13R8J6cm3DYFT05K5WbiCPeAMZ6u9kxKPUaft+
	aQLLqAzFdA7TkTY6QNtwa9OdltCuqkwWBtQOzEudEyHNDFLoocVNTY8sRIkzxadnklVe
	m4cdbUhu0VL1f+wdKBi/3+/wMjN6t3x5JezNeJUndjwpdnELdoChAG3vFhXXDuEfsCm/
	JP2RdagVhEoanx6PjkG6Ex0WoQVkrd5N9Ar33HYpw9OmlNtbfofCheOXewfnQbZHb1Km
	qumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=U31xnD1VrCH7SgznkBXaOSP4GhkFS9LU/gUfocZlhlQ=;
	b=emdlHeU6rcq892l18WWWUeQIOzu5z+zj51W2g6VleGNq/xnVMA3Rew/h53Fi4+fFtA
	PJcURbwrD9CNljFGpt2PZoSCJWOXrM2M6ybo4x7fB3HHqSM6/iyND3s95Ichzze/8WpI
	kGmb1z8gCmqRIq6b8Uhj2QE9nxLVE02IgtrlR68ychAM8alhxBVZeWrUm6bsKXBnpag1
	dn8MIAHDnB1m+gQR1BEMYJYcLuHLSPNZMxh/3i1HlNMj3fBsfh/s1pOoXOG1UY7UtHDo
	KQ2i/HxoZaM2nKPSlf7se77HeQkblniQ9u+xYqAGhJRQgAYhpq1H2HRTJoK2BTYb+29U
	ffgQ==
X-Gm-Message-State: AKaTC01Nr839J1TncTgmr512w3NHzNPJNxvtKasyMQu2Z9WwJYS19HcIIlWcGYGKL/3L3h7y
X-Received: by 10.28.104.213 with SMTP id d204mr3807493wmc.101.1481232726727; 
	Thu, 08 Dec 2016 13:32:06 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q7sm38985791wjh.9.2016.12.08.13.32.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Dec 2016 13:32:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 21:32:03 +0000
Message-Id: <1481232723-12285-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] archiver: don't change directory when generating tarball
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
X-List-Received-Date: Thu, 08 Dec 2016 21:32:08 -0000

There's no need to chdir() as tarfile.add() can be told what name to use in the
archive.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/archiver.bbclass | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 9239983..3543ca9 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -125,7 +125,7 @@ python () {
 # (e.g. git repositories) is "unpacked" and then put into a tarball.
 python do_ar_original() {
 
-    import shutil, tarfile, tempfile
+    import shutil, tempfile
 
     if d.getVarFlag('ARCHIVER_MODE', 'src', True) != "original":
         return
@@ -261,13 +261,9 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
         filename = '%s.tar.gz' % d.getVar('PF', True)
     tarname = os.path.join(ar_outdir, filename)
 
-    srcdir = srcdir.rstrip('/')
-    dirname = os.path.dirname(srcdir)
-    basename = os.path.basename(srcdir)
-    os.chdir(dirname)
     bb.note('Creating %s' % tarname)
     tar = tarfile.open(tarname, 'w:gz')
-    tar.add(basename)
+    tar.add(srcdir, arcname=os.path.basename(srcdir))
     tar.close()
 
 # creating .diff.gz between source.orig and source
-- 
2.8.1


