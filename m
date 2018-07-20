Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFB86007A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 16:26:47 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f21-v6so10042972wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 09:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=eYfQV2SUGDSIlG9YXAP7bboYAc4Onl9AKD86Bslrwk4=;
	b=J1gk2PYS03rUI36/r+/HFysesEk6VK9cBthyNc3In4P5vFrAgwG/il3DARz4/ru2cC
	E0L0Y/kyqSpBm//jHZyX9wCUt0AK+eMV5SAW/OTbbkkWWEFodOBX88dUV1GfQhzoNNUF
	KkAGRpqGLis2B/l6e/PrVem1VwJC/zd1SxgBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eYfQV2SUGDSIlG9YXAP7bboYAc4Onl9AKD86Bslrwk4=;
	b=bD2x/lrKUV+AObnG6in+0um4pcnsGs7g8+UwzZH2AHmp6xfSTrGwUKDYNyLEyv88hr
	/2Vkxtd56l2gmpYNre1KvkBgEn6MwxkVTmmBPW41cCadgXwhjJ6WCO7BbIVrE0CFHAmv
	S5mD/TojwsnjinWWOIG0z0H8syW0zqkVb63K1DkJIUvt11GQRDFDgrDe7qkfLPFaIeiF
	NMVR/40h1hdyt3Fw/bVtWHQK+/Lfuvx4nBGZJuwI0msNv+5wFvQH1H9LpaLWaFtlRXvx
	1gSF4zrQ/aWa1UgKlQ8QsIe129e6f8cLeFw+aJ/m7RbM/K2PKyrv80V+CQ63Wd3+6JS/
	HKIw==
X-Gm-Message-State: AOUpUlEgJc1naeFUr23I1NmblTJNCzWEBS74IfEZ2lkYWD9OYrHOGq+H
	zOk7swaKnN/LWneUjzjqkVXR/ODxi4wC6A==
X-Google-Smtp-Source: AAOMgpcW7GOfrkp+/6eVg3mdG4Ke7uRtAhpxH1IZGKUWR6JsOaK7oq/DG3/AMnaAIt1pXBwD0bKhvA==
X-Received: by 2002:a1c:3743:: with SMTP id
	e64-v6mr1922378wma.63.1532104007724; 
	Fri, 20 Jul 2018 09:26:47 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f8-v6sm4257630wrj.9.2018.07.20.09.26.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 09:26:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 17:26:44 +0100
Message-Id: <20180720162645.5220-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] package/package_manager: multiprocess_exec -> multiprocess_launch
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
X-List-Received-Date: Fri, 20 Jul 2018 16:26:47 -0000

After this replacement, the parent exception handling works so we don't
need subprocess wrapping with bb.error in the underlying functions.

The underlying contexts also have better module handling so the imports
can be cleaned up.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass   |  4 ++--
 meta/lib/oe/package.py         | 13 +++----------
 meta/lib/oe/package_manager.py |  5 ++---
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 86a6090f1b0..fca51906be4 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1105,7 +1105,7 @@ python split_and_strip_files () {
         for f in kernmods:
             sfiles.append((f, 16, strip))
 
-        oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
+        oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
 
     #
     # End of strip
@@ -1541,7 +1541,7 @@ python package_do_filedeps() {
         for files in chunks(pkgfiles[pkg], 100):
             pkglist.append((pkg, files, rpmdeps, pkgdest))
 
-    processed = oe.utils.multiprocess_exec( pkglist, oe.package.filedeprunner)
+    processed = oe.utils.multiprocess_launch(oe.package.filedeprunner, pkglist, d)
 
     provides_files = {}
     requires_files = {}
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 4255143371c..fa3428ad618 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1,3 +1,4 @@
+import stat
 import mmap
 import subprocess
 
@@ -11,8 +12,6 @@ def runstrip(arg):
     # 8 - shared library
     # 16 - kernel module
 
-    import stat, subprocess
-
     (file, elftype, strip) = arg
 
     newmode = None
@@ -37,16 +36,11 @@ def runstrip(arg):
     stripcmd.append(file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
-    try:
-        output = subprocess.check_output(stripcmd, stderr=subprocess.STDOUT)
-    except subprocess.CalledProcessError as e:
-        bb.error("runstrip: '%s' strip command failed with %s (%s)" % (stripcmd, e.returncode, e.output))
+    output = subprocess.check_output(stripcmd, stderr=subprocess.STDOUT)
 
     if newmode:
         os.chmod(file, origmode)
 
-    return
-
 # Detect .ko module by searching for "vermagic=" string
 def is_kernel_module(path):
     with open(path) as f:
@@ -164,8 +158,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripp
         elf_file = int(elffiles[file])
         sfiles.append((file, elf_file, strip_cmd))
 
-    oe.utils.multiprocess_exec(sfiles, runstrip)
-
+    oe.utils.multiprocess_launch(runstrip, sfiles, d)
 
 
 def file_translate(file):
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 9aa5847c8a3..64c8a912160 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -3,7 +3,6 @@ import os
 import glob
 import subprocess
 import shutil
-import multiprocessing
 import re
 import collections
 import bb
@@ -177,7 +176,7 @@ class OpkgIndexer(Indexer):
             bb.note("There are no packages in %s!" % self.deploy_dir)
             return
 
-        oe.utils.multiprocess_exec(index_cmds, create_index)
+        oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
 
         if signer:
             feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
@@ -258,7 +257,7 @@ class DpkgIndexer(Indexer):
             bb.note("There are no packages in %s" % self.deploy_dir)
             return
 
-        oe.utils.multiprocess_exec(index_cmds, create_index)
+        oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             raise NotImplementedError('Package feed signing not implementd for dpkg')
 
-- 
2.17.1


