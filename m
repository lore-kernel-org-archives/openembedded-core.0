Return-Path: <gyulkkajo@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7696E71951
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 04:54:14 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id j124so6428626pfc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Dec 2017 20:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=K6piQT0pcVtdXE3KgjCepEXYzx73UtSRNsmTkRtDUZs=;
	b=WF6mw7/bget85afkyZdzNf1FT87vaxaSt3D8Lw46siH9ygNMwZOrbv4FiJnbvl0PB4
	ajQ20TFKdMeOJjEd7H5e3+R858rtPbTslu4hao9PkGKgrTX53AIX/eXMNjhN8rYoe3c0
	pzSkfr/1C5N+w9HMTY9wD2WEyN/tlawIAfeWi+3UXXN/IKeH35eIBUFQwe/ts1o7UVfo
	p7Di7BOzD7FkHorHCq053qiCzEtbTVkLxOT1/4HnoPahY3Crv2r4K8VS0HVx7E+mlKvc
	v1y98wxnn+wf8RhREpgVAeDAVKVKfEEyBUtB2Rn0IIoJgg6xQs9QXDrSrPNSyzvuNVzR
	tWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K6piQT0pcVtdXE3KgjCepEXYzx73UtSRNsmTkRtDUZs=;
	b=TfvXdouMCDCFfA9HdUmOJ7qstfb5q/atey3wAxx9nTzSAoQO1oMj6X647NlBWsCG3/
	vlT3OizZRgRQleAAolzHGJAn/TsdH9KO4XBxvYjzAeHCt9pH6qdAg7mH6uR4+JoXMr7x
	dyx6ZYURwqxN85Cv8+t1NvDrXdsUilhl3cTS6bZ/Yy0cBP2uGViRtI6HHW//ZLJmtKrU
	Xto/kviMR+SusQSHEhHTXPRrChetAsq+cmfj/3MTeiODV8rSWh1mKeGC53F99ucbQ5qh
	8zlm+xBXPEU62RffvlaN/BPPydZtHwe23BfEbJCylkNkGHs6G6m3FqsQkgbsIBh01wbK
	+aBA==
X-Gm-Message-State: AJaThX4VSa36y8k9wWnyCELPEFeuR6DoKdjitiN5WZPQN0dWswQ6gmGC
	DimHItrSf5gRzs0PxYhzt3B9R/ax
X-Google-Smtp-Source: AGs4zMbHFznch5Fh9FtMo9AqMf/MKwbdJtJNf8FG7q4EC+KPlYDOIKOfr2haPsBpQnjKR7lxqTwrow==
X-Received: by 10.99.167.6 with SMTP id d6mr27669915pgf.100.1512708855128;
	Thu, 07 Dec 2017 20:54:15 -0800 (PST)
Received: from localhost.localdomain ([175.193.196.217])
	by smtp.gmail.com with ESMTPSA id
	t1sm11549904pgs.13.2017.12.07.20.54.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 20:54:13 -0800 (PST)
From: Changhee Han <gyulkkajo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 13:54:00 +0900
Message-Id: <1512708840-8351-1-git-send-email-gyulkkajo@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] package.py: Add STRIP_OPTS variable
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
X-List-Received-Date: Fri, 08 Dec 2017 04:54:14 -0000

STRIP_OPTS variable is added to put extra options for strip command during
do_package. This helps to discard symbols or sections selectively.

For example, it can be used like below:

STRIP_OPTS_pn-somepackage = "--strip-debug --keep-file-symbols"

It preserves a symbol table on a binary. This is useful especialy for
an embedded system which has limited resources because a size of *-dbg
package is too huge to be installed to the target. Instead of it,
preserving the symbol table is lightweight and enough to track where a
problem comes from.

Signed-off-by: Changhee Han <gyulkkajo@gmail.com>
---
 meta/classes/package.bbclass | 6 ++++--
 meta/classes/staging.bbclass | 3 ++-
 meta/conf/documentation.conf | 1 +
 meta/lib/oe/package.py       | 8 +++++---
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2053d46..1933e93 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1066,12 +1066,14 @@ python split_and_strip_files () {
     if (d.getVar('INHIBIT_PACKAGE_STRIP') != '1'):
         strip = d.getVar("STRIP")
         sfiles = []
+        opts = d.getVar("STRIP_OPTS") or ''
+
         for file in elffiles:
             elf_file = int(elffiles[file])
             #bb.note("Strip %s" % file)
-            sfiles.append((file, elf_file, strip))
+            sfiles.append((file, elf_file, strip, opts))
         for f in kernmods:
-            sfiles.append((f, 16, strip))
+            sfiles.append((f, 16, strip, opts))
 
         oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
 
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index c479bd9..51be462 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -78,8 +78,9 @@ python sysroot_strip () {
     base_libdir = os.path.abspath(dstdir + os.sep + d.getVar("base_libdir"))
     qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split()
     strip_cmd = d.getVar("STRIP")
+    strip_opts = d.getVar("STRIP_OPTS") or ''
 
-    oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir,
+    oe.package.strip_execs(pn, dstdir, strip_cmd, strip_opts, libdir, base_libdir,
                            qa_already_stripped=qa_already_stripped)
 }
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index a55e283..802bad4 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -392,6 +392,7 @@ SSTATE_MIRRORS[doc] = "Configures the OpenEmbedded build system to search other
 STAGING_KERNEL_DIR[doc] = "The directory with kernel headers that are required to build out-of-tree modules."
 STAMP[doc] = "Specifies the base path used to create recipe stamp files. The path to an actual stamp file is constructed by evaluating this string and then appending additional information."
 STAMPS_DIR[doc] = "Specifies the base directory in which the OpenEmbedded build system places stamps."
+STRIP_OPTS[doc] = "Additional options to add strip command during do_package."
 SUMMARY[doc] = "The short (80 characters or less) summary of the binary package for packaging systems such as opkg, rpm or dpkg. By default, SUMMARY is used to define the DESCRIPTION variable if DESCRIPTION is not set in the recipe."
 SVNDIR[doc] = "The directory where Subversion checkouts will be stored."
 SYSLINUX_DEFAULT_CONSOLE[doc] = "Specifies the kernel boot default console."
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1e5c3aa..84bd8ba 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -10,7 +10,7 @@ def runstrip(arg):
 
     import stat, subprocess
 
-    (file, elftype, strip) = arg
+    (file, elftype, strip, opts) = arg
 
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
@@ -31,6 +31,7 @@ def runstrip(arg):
     elif elftype & 8 or elftype & 4:
         stripcmd.extend(["--remove-section=.comment", "--remove-section=.note"])
 
+    stripcmd.extend(opts.split())
     stripcmd.append(file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
@@ -45,12 +46,13 @@ def runstrip(arg):
     return
 
 
-def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=False):
+def strip_execs(pn, dstdir, strip_cmd, strip_opts, libdir, base_libdir, qa_already_stripped=False):
     """
     Strip executable code (like executables, shared libraries) _in_place_
     - Based on sysroot_strip in staging.bbclass
     :param dstdir: directory in which to strip files
     :param strip_cmd: Strip command (usually ${STRIP})
+    :param strip_opts: Strip options
     :param libdir: ${libdir} - strip .so files in this directory
     :param base_libdir: ${base_libdir} - strip .so files in this directory
     :param qa_already_stripped: Set to True if already-stripped' in ${INSANE_SKIP}
@@ -148,7 +150,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     sfiles = []
     for file in elffiles:
         elf_file = int(elffiles[file])
-        sfiles.append((file, elf_file, strip_cmd))
+        sfiles.append((file, elf_file, strip_cmd, strip_opts))
 
     oe.utils.multiprocess_exec(sfiles, runstrip)
 
-- 
2.1.4


