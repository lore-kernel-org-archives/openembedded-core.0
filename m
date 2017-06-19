Return-Path: <tobias.hagelborn@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3ADC8780F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 13:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E925D183ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id LU9LEMgguXbg
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:50 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 26B1E180E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:50 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 136B51E07B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:50 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07B321E079
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:50 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:49 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id F003C1146
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:49 +0200 (CEST)
Received: from lnxtobiasha.se.axis.com (10.0.5.60) by XBOX02.axis.com
	(10.0.5.16) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 19 Jun 2017 15:19:49 +0200
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Jun 2017 15:19:15 +0200
Message-ID: <1497878357-27381-2-git-send-email-tobiasha@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1497878357-27381-1-git-send-email-tobiasha@axis.com>
References: <1497878357-27381-1-git-send-email-tobiasha@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: [PATCH v2 2/4] staging.bbclass: Make use of oe.package.strip_execs
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
X-List-Received-Date: Mon, 19 Jun 2017 13:19:52 -0000
Content-Type: text/plain

Make use of the library function oe.package.strip_execs for stripping
sysroot executables. oe.packge.strip_execs is based on code previously
residing in sysroot_strip.

Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
---
 meta/classes/staging.bbclass | 108 ++++++-------------------------------------
 1 file changed, 13 insertions(+), 95 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 9c26794..fe82294 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -68,101 +68,19 @@ sysroot_stage_all() {
 }
 
 python sysroot_strip () {
-    import stat, errno
-
-    dvar = d.getVar('SYSROOT_DESTDIR')
-    pn = d.getVar('PN')
-
-    os.chdir(dvar)
-
-    # Return type (bits):
-    # 0 - not elf
-    # 1 - ELF
-    # 2 - stripped
-    # 4 - executable
-    # 8 - shared library
-    # 16 - kernel module
-    def isELF(path):
-        type = 0
-        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
-
-        if ret:
-            bb.error("split_and_strip_files: 'file %s' failed" % path)
-            return type
-
-        # Not stripped
-        if "ELF" in result:
-            type |= 1
-            if "not stripped" not in result:
-                type |= 2
-            if "executable" in result:
-                type |= 4
-            if "shared" in result:
-                type |= 8
-        return type
-
-
-    elffiles = {}
-    inodes = {}
-    libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
-    baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir"))
-    if (d.getVar('INHIBIT_SYSROOT_STRIP') != '1'):
-        #
-        # First lets figure out all of the files we may have to process
-        #
-        for root, dirs, files in os.walk(dvar):
-            for f in files:
-                file = os.path.join(root, f)
-
-                try:
-                    ltarget = oe.path.realpath(file, dvar, False)
-                    s = os.lstat(ltarget)
-                except OSError as e:
-                    (err, strerror) = e.args
-                    if err != errno.ENOENT:
-                        raise
-                    # Skip broken symlinks
-                    continue
-                if not s:
-                    continue
-                # Check its an excutable
-                if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
-                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and ".so" in f):
-                    # If it's a symlink, and points to an ELF file, we capture the readlink target
-                    if os.path.islink(file):
-                        continue
-
-                    # It's a file (or hardlink), not a link
-                    # ...but is it ELF, and is it already stripped?
-                    elf_file = isELF(file)
-                    if elf_file & 1:
-                        if elf_file & 2:
-                            if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split():
-                                bb.note("Skipping file %s from %s for already-stripped QA test" % (file[len(dvar):], pn))
-                            else:
-                                bb.warn("File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn))
-                            continue
-
-                        if s.st_ino in inodes:
-                            os.unlink(file)
-                            os.link(inodes[s.st_ino], file)
-                        else:
-                            inodes[s.st_ino] = file
-                            # break hardlink
-                            bb.utils.copyfile(file, file)
-                            elffiles[file] = elf_file
-
-        #
-        # Now strip them (in parallel)
-        #
-        strip = d.getVar("STRIP")
-        sfiles = []
-        for file in elffiles:
-            elf_file = int(elffiles[file])
-            #bb.note("Strip %s" % file)
-            sfiles.append((file, elf_file, strip))
-
-        oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
+    inhibit_sysroot = d.getVar('INHIBIT_SYSROOT_STRIP', True)
+    if inhibit_sysroot and oe.types.boolean(inhibit_sysroot):
+        return 0
+
+    dstdir = d.getVar('SYSROOT_DESTDIR', True)
+    pn = d.getVar('PN', True)
+    libdir = os.path.abspath(dstdir + os.sep + d.getVar("libdir", True))
+    base_libdir = os.path.abspath(dstdir + os.sep + d.getVar("base_libdir", True))
+    qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn, True) or "").split()
+    strip_cmd = d.getVar("STRIP", True)
+
+    oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir,
+                           qa_already_stripped=qa_already_stripped)
 }
 
 do_populate_sysroot[dirs] = "${SYSROOT_DESTDIR}"
-- 
2.1.4


