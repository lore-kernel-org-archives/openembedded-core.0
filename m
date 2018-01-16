Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id AA21D78411
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 13:37:58 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z48so15198253wrz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 05:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ySeF/mPlLaDx3XyP2r6znE9prfavJeMkycN28o7KNW8=;
	b=QtNErh4RmO839mjtc5Edd1rhhZeT6DI3iRPU/wS4XBsoDHFw1SCeUvKfLZiPDjHx+X
	e8qu4j1dOQN3gL+SCniNuVYzguVGdT85m0/Q2XGJXvChj+1kvKpH0mbC+y5CTzZyg+Cq
	WyWggqZ8sDSz/76OjHwQ7eSnSs5DDmfGmU9mYMEevV2ahVjfoQL7EzLFN3USrMEPlPjd
	qfQ0bxEoelIa+SHT09ws/PGkmhpyce8EfQjp+alNaikYoj0fsoBxv95vOWQOgPZSachn
	Qzcqy0tEsxdAB0QAcjucjL5j9JGegWcTUBexlxsY9t+pegIKSZMyU1kaDsv6Vy92OWFC
	ROyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ySeF/mPlLaDx3XyP2r6znE9prfavJeMkycN28o7KNW8=;
	b=Sb/RRUsxjWIDu1DJ0boqBDx7vAQ5xeK6hHjn8zySxyJtk1A/e5ANfWzS5kbcntCSAT
	kwKB++nvoSj8HaFd3S6Fyfkda3BNDex0ohQBNv3axOor3f4NfqytCufAxolEMEmJWwSh
	fMUudXe6phmbT1f6FjJ69Og4AHZIXDofBcJJEFJRzn300e+tGtccMhdS/xzraUbMIO8Y
	IQ2QdI+VZRlqeTc1prj2+nPLAKhbnYkILZtXRHBKmJHxAbxhEhSC15A33RFCSeWBQsc6
	GmaOIRpIfWFRljs8VMgW1LcbL6GP5BsmfI0oE3owNa9JOssWlu5lgwlV0ZlDMgTvGaCS
	782A==
X-Gm-Message-State: AKGB3mJ2FI+Wty77gdqc+Zl4/gnnuqAVUb4OzO+nmFDCCjGWmHOe8eHn
	Dh0fOmi6vWCqHHLMEO+zBX1LZ4Iy
X-Google-Smtp-Source: ACJfBouCWem80BaH2yEd8Mbs1cj+DtCZ1a95cRvpVkEQrmSHz2dsLebQhSedVdd103l0KzTXNVwacA==
X-Received: by 10.223.161.65 with SMTP id r1mr32327958wrr.235.1516109878933;
	Tue, 16 Jan 2018 05:37:58 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id f48sm462153wra.72.2018.01.16.05.37.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jan 2018 05:37:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jan 2018 13:37:53 +0000
Message-Id: <20180116133754.29471-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] classes/debian: fix library path handling
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
X-List-Received-Date: Tue, 16 Jan 2018 13:37:59 -0000

The existing code is looking for libraries in all paths which end in ${libdir}.
This caused false-positives for recipes such as lz4 which had files called
/usr/lib/lz4/ptest/usr/lib/liblz4.so, and resulted in lz4-ptest being
incorrectly renamed to liblz4.

Solve this by explicitly looking for ${libdir} etc under the packages-split
directory.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/debian.bbclass | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 5cdbf360dcb..edc6da1ba3a 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -25,12 +25,10 @@ python () {
 }
 
 python debian_package_name_hook () {
-    import glob, copy, stat, errno, re
+    import glob, copy, stat, errno, re, pathlib
 
-    pkgdest = d.getVar('PKGDEST')
+    pkgdest = d.getVar("PKGDEST")
     packages = d.getVar('PACKAGES')
-    bin_re = re.compile(".*/s?" + os.path.basename(d.getVar("bindir")) + "$")
-    lib_re = re.compile(".*/" + os.path.basename(d.getVar("libdir")) + "$")
     so_re = re.compile("lib.*\.so")
 
     def socrunch(s):
@@ -60,17 +58,25 @@ python debian_package_name_hook () {
                 d.appendVar('RPROVIDES_' + pkg, " " + pkg + " (=" + d.getVar("PKGV") + ")")
 
     def auto_libname(packages, orig_pkg):
+        p = lambda var: pathlib.PurePath(d.getVar(var))
+        libdirs = (p("base_libdir"), p("libdir"))
+        bindirs = (p("base_bindir"), p("base_sbindir"), p("bindir"), p("sbindir"))
+
         sonames = []
         has_bins = 0
         has_libs = 0
-        for file in pkgfiles[orig_pkg]:
-            root = os.path.dirname(file)
-            if bin_re.match(root):
+        for f in pkgfiles[orig_pkg]:
+            # This is .../packages-split/orig_pkg/
+            pkgpath = pathlib.PurePath(pkgdest, orig_pkg)
+            # Strip pkgpath off the full path to a file in the package, re-root
+            # so it is absolute, and then get the parent directory of the file.
+            path = pathlib.PurePath("/") / (pathlib.PurePath(f).relative_to(pkgpath).parent)
+            if path in bindirs:
                 has_bins = 1
-            if lib_re.match(root):
+            if path in libdirs:
                 has_libs = 1
-                if so_re.match(os.path.basename(file)):
-                    cmd = (d.getVar('TARGET_PREFIX') or "") + "objdump -p " + file + " 2>/dev/null"
+                if so_re.match(os.path.basename(f)):
+                    cmd = (d.getVar('TARGET_PREFIX') or "") + "objdump -p " + f + " 2>/dev/null"
                     fd = os.popen(cmd)
                     lines = fd.readlines()
                     fd.close()
-- 
2.11.0


