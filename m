Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B42C79CB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 02:37:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9J2bGcd014826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 19:37:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 18 Oct 2018 19:37:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Oct 2018 10:43:14 +0800
Message-ID: <4fd2aa1ed5e52001ea32cdd2294302942e3b33f5.1539853014.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1539853014.git.Qi.Chen@windriver.com>
References: <cover.1539853014.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] python: backport patch to fix CVE-2018-1000802
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
X-List-Received-Date: Fri, 19 Oct 2018 02:37:15 -0000
Content-Type: text/plain

Backport a patch to fix the following CVE.

CVE: CVE-2018-1000802

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...34540-Convert-shutil._call_external_zip-t.patch | 69 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.15.bb      |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch

diff --git a/meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch b/meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch
new file mode 100644
index 0000000..e6fe5f2
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch
@@ -0,0 +1,69 @@
+From c7e692c61dc091d07dee573f5f424b6b427ff056 Mon Sep 17 00:00:00 2001
+From: Benjamin Peterson <benjamin@python.org>
+Date: Wed, 29 Aug 2018 21:59:21 -0700
+Subject: [PATCH] closes bpo-34540: Convert shutil._call_external_zip to use
+ subprocess rather than distutils.spawn. (GH-8985)
+
+Upstream-Status: Backport
+
+Fix CVE-2018-1000802
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Lib/shutil.py                                            | 16 ++++++++++------
+ .../Security/2018-08-28-22-11-54.bpo-34540.gfQ0TM.rst    |  3 +++
+ 2 files changed, 13 insertions(+), 6 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2018-08-28-22-11-54.bpo-34540.gfQ0TM.rst
+
+diff --git a/Lib/shutil.py b/Lib/shutil.py
+index 3462f7c..0ab1a06 100644
+--- a/Lib/shutil.py
++++ b/Lib/shutil.py
+@@ -413,17 +413,21 @@ def _make_tarball(base_name, base_dir, compress="gzip", verbose=0, dry_run=0,
+ 
+     return archive_name
+ 
+-def _call_external_zip(base_dir, zip_filename, verbose=False, dry_run=False):
++def _call_external_zip(base_dir, zip_filename, verbose, dry_run, logger):
+     # XXX see if we want to keep an external call here
+     if verbose:
+         zipoptions = "-r"
+     else:
+         zipoptions = "-rq"
+-    from distutils.errors import DistutilsExecError
+-    from distutils.spawn import spawn
++    cmd = ["zip", zipoptions, zip_filename, base_dir]
++    if logger is not None:
++        logger.info(' '.join(cmd))
++    if dry_run:
++        return
++    import subprocess
+     try:
+-        spawn(["zip", zipoptions, zip_filename, base_dir], dry_run=dry_run)
+-    except DistutilsExecError:
++        subprocess.check_call(cmd)
++    except subprocess.CalledProcessError:
+         # XXX really should distinguish between "couldn't find
+         # external 'zip' command" and "zip failed".
+         raise ExecError, \
+@@ -458,7 +462,7 @@ def _make_zipfile(base_name, base_dir, verbose=0, dry_run=0, logger=None):
+         zipfile = None
+ 
+     if zipfile is None:
+-        _call_external_zip(base_dir, zip_filename, verbose, dry_run)
++        _call_external_zip(base_dir, zip_filename, verbose, dry_run, logger)
+     else:
+         if logger is not None:
+             logger.info("creating '%s' and adding '%s' to it",
+diff --git a/Misc/NEWS.d/next/Security/2018-08-28-22-11-54.bpo-34540.gfQ0TM.rst b/Misc/NEWS.d/next/Security/2018-08-28-22-11-54.bpo-34540.gfQ0TM.rst
+new file mode 100644
+index 0000000..4f68696
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2018-08-28-22-11-54.bpo-34540.gfQ0TM.rst
+@@ -0,0 +1,3 @@
++When ``shutil.make_archive`` falls back to the external ``zip`` problem, it
++uses :mod:`subprocess` to invoke it rather than :mod:`distutils.spawn`. This
++closes a possible shell injection vector.
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index b402ad6..e8c9475 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -31,6 +31,7 @@ SRC_URI += "\
   file://pass-missing-libraries-to-Extension-for-mul.patch \
   file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
   file://float-endian.patch \
+  file://0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.9.1


