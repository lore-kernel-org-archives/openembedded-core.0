Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2162E72E1E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:46 +0000 (UTC)
Received: by pdbfp1 with SMTP id fp1so8545406pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=12kXOiU69dZ4BMQAuES4dqxiTuKr8MHl0D8PtQjiaGs=;
	b=Bi9MTEceEqpyUUGnPtKD4oOCifN/pSuRbpp/qMhnqKkYoTWPbTtEeU3SaCVpxxvKiQ
	Y0FLNXkHDomfNUI/zCuGXCF5T07OUlVsmE2B7BlBwf8DxfW+C/eG0+tzKetmPDeaQQO8
	oU0ftLPilSSjHSZnsybnPjTmuv6mZS5lW6uvrGNRAc5GeK2ItBvu1wa/L89UJ6tqzGCv
	5lvlBWydgxRDp7B0gp2oNSNv8Zw2+Dx8PZmBFUdgROuxHWLad2lK5QivXXCnB9FrNyOR
	ncGzqqg6tytD8U60s0zTz8I2J9gzOZGwxohuEQx/lF7/GwFpXVdqGrSn63fiBlH6yqR+
	XiHQ==
X-Received: by 10.70.46.201 with SMTP id x9mr6830224pdm.76.1423152348182;
	Thu, 05 Feb 2015 08:05:48 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:55 -0800
Message-Id: <46ea89dc5e3348180e991181df08d38733d55a61.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 47/61] python-smartpm: Fix attemptonly builds when file conflicts occur
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:47 -0000

From: Mark Hatle <mark.hatle@windriver.com>

[YOCTO #7299]

When file conflicts occur, the RPM transaction aborts.  Instead of
simply accepting the failure, we now identify, capture, and remove
the offending package(s) from the transaction and retry.

(From OE-Core rev: cd475aea5f5bc4b6a2dd3e576070a117ae079597)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python-smartpm/smart-attempt.patch      | 97 +++++++++++++++-------
 1 file changed, 66 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
index 45f7947..82d2e6c 100644
--- a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
+++ b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
@@ -9,40 +9,24 @@ failures (usually conflicts).
 
 This option only works for the install operation.
 
+If a complementary install fails, an actual error occurred, one that
+we can't ignore without losing the entire attempted transaction.  Keep
+this as an error so that we can catch these cases in the futre.
+
 Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-For complementary and 'attemptonly' package processing, we should
-make sure the warn rather than error reported.
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  smart.py                  |  5 +++-
  smart/commands/install.py |  5 ++++
  smart/transaction.py      | 65 +++++++++++++++++++++++++++++++++++------------
  3 files changed, 58 insertions(+), 17 deletions(-)
 
-diff --git a/smart.py b/smart.py
-index c5c7a02..7e7fd34 100755
---- a/smart.py
-+++ b/smart.py
-@@ -179,7 +179,10 @@ def main(argv):
-         if opts and opts.log_level == "debug":
-             import traceback
-             traceback.print_exc()
--        if iface.object:
-+        if iface.object and sysconf.has("attempt-install", soft=True):
-+            iface.warning(unicode(e))
-+            exitcode = 0
-+        elif iface.object:
-             iface.error(unicode(e))
-         else:
-             sys.stderr.write(_("error: %s\n") % e)
-diff --git a/smart/commands/install.py b/smart/commands/install.py
-index 590222c..6ef9682 100644
---- a/smart/commands/install.py
-+++ b/smart/commands/install.py
+Index: smart-1.4.1/smart/commands/install.py
+===================================================================
+--- smart-1.4.1.orig/smart/commands/install.py
++++ smart-1.4.1/smart/commands/install.py
 @@ -50,6 +50,8 @@ def option_parser():
      parser = OptionParser(usage=USAGE,
                            description=DESCRIPTION,
@@ -62,10 +46,10 @@ index 590222c..6ef9682 100644
      if opts.explain:
          sysconf.set("explain-changesets", True, soft=True)
  
-diff --git a/smart/transaction.py b/smart/transaction.py
-index 5730a42..e3e61c6 100644
---- a/smart/transaction.py
-+++ b/smart/transaction.py
+Index: smart-1.4.1/smart/transaction.py
+===================================================================
+--- smart-1.4.1.orig/smart/transaction.py
++++ smart-1.4.1/smart/transaction.py
 @@ -555,6 +555,8 @@ class Transaction(object):
          changeset.set(pkg, INSTALL)
          isinst = changeset.installed
@@ -183,6 +167,57 @@ index 5730a42..e3e61c6 100644
                  elif op is REMOVE:
                      self._remove(pkg, changeset, locked, pending)
                  elif op is UPGRADE:
--- 
-1.9.1
-
+Index: smart-1.4.1/smart/backends/rpm/pm.py
+===================================================================
+--- smart-1.4.1.orig/smart/backends/rpm/pm.py
++++ smart-1.4.1/smart/backends/rpm/pm.py
+@@ -243,15 +253,48 @@ class RPMPackageManager(PackageManager):
+         cb = RPMCallback(prog, upgradednames)
+         cb.grabOutput(True)
+         probs = None
++        retry = 0
+         try:
+             probs = ts.run(cb, None)
+         finally:
+             del getTS.ts
+             cb.grabOutput(False)
++            if probs and sysconf.has("attempt-install", soft=True):
++                def remove_conflict(pkgNEVR):
++                    for key in changeset.keys():
++                        if pkgNEVR == str(key):
++                            del changeset[key]
++                            del pkgpaths[key]
++                            iface.warning("Removing %s due to file %s conflicting with %s" % (pkgNEVR, fname, altNEVR))
++                            break
++
++                retry = 1
++                for prob in probs:
++                    if prob[1][0] == rpm.RPMPROB_NEW_FILE_CONFLICT:
++                        msg = prob[0].split()
++                        fname = msg[1]
++                        pkgNEVR = msg[7]
++                        altNEVR = msg[9]
++                        pkgNEVR = pkgNEVR.rsplit('.', 1)[0] + '@' + pkgNEVR.rsplit('.', 1)[1]
++                        altNEVR = altNEVR.rsplit('.', 1)[0] + '@' + altNEVR.rsplit('.', 1)[1]
++                        remove_conflict(pkgNEVR)
++                    elif prob[1][0] == rpm.RPMPROB_FILE_CONFLICT:
++                        msg = prob[0].split()
++                        fname = msg[1]
++                        pkgNEVR = msg[5]
++                        altNEVR = msg[11]
++                        pkgNEVR = pkgNEVR.rsplit('.', 1)[0] + '@' + pkgNEVR.rsplit('.', 1)[1]
++                        altNEVR = altNEVR.rsplit('.', 1)[0] + '@' + altNEVR.rsplit('.', 1)[1]
++                        remove_conflict(pkgNEVR)
++                    else:
++                        retry = 0
++
+             prog.setDone()
+-            if probs:
++            if probs and (not retry):
+                 raise Error, "\n".join([x[0] for x in probs])
+             prog.stop()
++            if retry and len(changeset):
++                self.commit(changeset, pkgpaths)
+ 
+ class RPMCallback:
+     def __init__(self, prog, upgradednames):
-- 
1.9.1


