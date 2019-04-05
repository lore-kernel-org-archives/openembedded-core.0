Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 06B437D68F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 23:46:06 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id h4so9806106wre.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 16:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=apCqyNmXu2eB6viTWFSpgiSsYSjZcJlb/hfiVMF40Do=;
	b=KwYv//yubTPOb4A/WK334L8x1Mt/ObMJeafJ0jcOUByN8w10ZGLp7kMba9ELWdVQkA
	4/s0wfV9AP4O3eNvXH0/pPgEDbIonndIYanCWHXXMZqd5mCxYuL0LilKh4IirR5GtvTt
	J0covl0nnvPNDdXNSSoliQgVMMPkf+mcBpxJGGYb7r5KGNMg5qxms1HtBYTBD9ZJTvMC
	ubq62x0iN1hBpZGigPeqoVOhwI/Ohcmzx/LHUdWed52fb5G4+4Va5eebyAdFJEj0z4a7
	K8ehfpPmKLIWn9FN/aREPIC+FBJDjvjuvwBKBk2fYwqossRAXRlxCZdgZaRG//5hoL88
	n0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=apCqyNmXu2eB6viTWFSpgiSsYSjZcJlb/hfiVMF40Do=;
	b=E4XRoBgU4bgwTRXABJYsWWUdwpBa9rBxkhkKuUjh//nDsa/mVLCyeBR7JKW23tR26S
	wxhRJa4uuy9ZK/ExlbcCaQsh2RUoh8czG2TTEoeom93DpTlh0aW5OUDzReljQV+KrLtR
	EV0kZ5Y1ECXWJpeCbwO06sU3fQQ9ufTlmdBhTF99Axtg1CUmiKmZEY8i8Bvj+gRfeBF6
	BVkGqeuTt7U8mmXsxHHCLdyV9Nf19iQxfNZ+RQUkAgRkXUwqqebPJpH3ZUED0r+4z+8a
	Zx6oblND4M0ioP/hKJLlIniuO1UIf8uqPNCPMXCW6+MZFu2dV4R0+GxmUP6ucig5eDkk
	utDA==
X-Gm-Message-State: APjAAAWIS5wh0RWClzl09ucLF+bK/f6h1X36fG2HZoxAvxuUvzeMhEey
	ZnAVzPumdcWQyDiUwZ78PHMmIaRo
X-Google-Smtp-Source: APXvYqy5rTMwLZ/avcvuOSbX8kvJ4Cj7bNSsI19x0eCcWGMo3bnRUKey11uH37mQRJ6gATX1ShYYIQ==
X-Received: by 2002:a05:6000:1152:: with SMTP id
	d18mr9844542wrx.32.1554507967371; 
	Fri, 05 Apr 2019 16:46:07 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F05D9171AC3D57FD073A679.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:1ac3:d57f:d073:a679])
	by smtp.gmail.com with ESMTPSA id y17sm3045249wma.8.2019.04.05.16.46.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Apr 2019 16:46:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Apr 2019 01:45:56 +0200
Message-Id: <20190405234556.1854-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] Rework patch fuzz handling
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
X-List-Received-Date: Fri, 05 Apr 2019 23:46:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently there are three issues which can be enhanced:

1. Fuzz warnings cannot be configured as errors for hardening. It happened
   often to me that these warnings were overseen and detected after commits
   were already out.
2. The output is too verbose - particularly when more than one file is
   affected. Meanwhile all users should know why patch fuzz check is performed.
   So move links with background information to insane.bbclass.
3. Reduce copy & paste effort slightly by printing PN (nit: <recipe> was not
   a correct suggestion e.g for native extended recipe - see example below)

To achieve patch.py drops patch-fuzz info encapsulated by a header- and footer-
string into log.do_patch. With this insane.bbclass can drop warnings/errors
depending on 'patch-fuzz' in ERROR_QA or WARN_QA. Default remains unchanged:
Spit out warnings only.

A message for two fuzzed patches and 'pact-fuzz' in ERROR_QA now looks like:

| ERROR: autoconf-native-2.69-r11 do_patch: Fuzz detected:
|
| Applying patch autoreconf-exclude.patch
| patching file bin/autoreconf.in
| Hunk #1 succeeded at 73 with fuzz 1 (offset -3 lines).
| Hunk #2 succeeded at 143 (offset 6 lines).
| Hunk #3 succeeded at 167 (offset 6 lines).
| Hunk #4 succeeded at 177 (offset 6 lines).
| Hunk #5 succeeded at 281 (offset 15 lines).
| Hunk #6 succeeded at 399 (offset 15 lines).
| Hunk #7 succeeded at 571 (offset 20 lines).
| Hunk #8 succeeded at 612 (offset 20 lines).
| Hunk #9 succeeded at 636 (offset 20 lines).
| Hunk #10 succeeded at 656 (offset 20 lines).
| Hunk #11 succeeded at 683 (offset 20 lines).
|
| Applying patch autoreconf-gnuconfigize.patch
| patching file bin/autoreconf.in
| Hunk #1 succeeded at 55 with fuzz 1 (offset -3 lines).
| Hunk #3 succeeded at 663 (offset 18 lines).
|
| The context lines in the patches can be updated with devtool:
|
|     devtool modify autoconf-native
|     devtool finish --force-patch-refresh autoconf-native <layer_path>
|
| Don't forget to review changes done by devtool!
|
| ERROR: autoconf-native-2.69-r11 do_patch: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/insane.bbclass | 53 ++++++++++++++++++++++++++++++++++++-
 meta/lib/oe/patch.py        | 19 +++----------
 2 files changed, 56 insertions(+), 16 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c8d18c07f55..7b0efc21892 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -27,7 +27,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             installed-vs-shipped compile-host-path install-host-path \
             pn-overrides infodir build-deps \
             unknown-configure-option symlink-to-sysroot multilib \
-            invalid-packageconfig host-user-contaminated uppercase-pn \
+            invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -1033,6 +1033,54 @@ python do_qa_staging() {
         bb.fatal("QA staging was broken by the package built above")
 }
 
+python do_qa_patch() {
+    import subprocess
+
+    ###########################################################################
+    # Check patch.log for fuzz warnings
+    #
+    # Further information on why we check for patch fuzz warnings:
+    # http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
+    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
+    ###########################################################################
+
+    logdir = d.getVar('T')
+    patchlog = os.path.join(logdir,"log.do_patch")
+
+    if os.path.exists(patchlog):
+        fuzzheader = '--- Patch fuzz start ---'
+        fuzzfooter = '--- Patch fuzz end ---'
+        statement = "grep -e '%s' %s > /dev/null" % (fuzzheader, patchlog)
+        if subprocess.call(statement, shell=True) == 0:
+            msg = "Fuzz detected:\n\n"
+            fuzzmsg = ""
+            inFuzzInfo = False
+            f = open(patchlog, "r")
+            for line in f:
+                if fuzzheader in line:
+                    inFuzzInfo = True
+                    fuzzmsg = ""
+                elif fuzzfooter in line:
+                    fuzzmsg = fuzzmsg.replace('\n\n', '\n')
+                    msg += fuzzmsg
+                    msg += "\n"
+                    inFuzzInfo = False
+                elif inFuzzInfo and not 'Now at patch' in line:
+                    fuzzmsg += line
+            f.close()
+            msg += "The context lines in the patches can be updated with devtool:\n"
+            msg += "\n"
+            msg += "    devtool modify %s\n" % d.getVar('PN')
+            msg += "    devtool finish --force-patch-refresh %s <layer_path>\n\n" % d.getVar('PN')
+            msg += "Don't forget to review changes done by devtool!\n"
+            if 'patch-fuzz' in d.getVar('ERROR_QA'):
+                bb.error(msg)
+            elif 'patch-fuzz' in d.getVar('WARN_QA'):
+                bb.warn(msg)
+            msg = "Patch log indicates that patches do not apply cleanly."
+            package_qa_handle_error("patch-fuzz", msg, d)
+}
+
 python do_qa_configure() {
     import subprocess
 
@@ -1141,6 +1189,9 @@ python do_qa_unpack() {
 #addtask qa_staging after do_populate_sysroot before do_build
 do_populate_sysroot[postfuncs] += "do_qa_staging "
 
+# Check for patch fuzz
+do_patch[postfuncs] += "do_qa_patch "
+
 # Check broken config.log files, for packages requiring Gettext which
 # don't have it in DEPENDS.
 #addtask qa_configure after do_configure before do_compile
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 7dd31d9d463..f43cf047c06 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -38,21 +38,10 @@ def runcmd(args, dir = None):
         if exitstatus != 0:
             raise CmdError(cmd, exitstatus >> 8, output)
         if " fuzz " in output:
-            bb.warn("""
-Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
-The context lines in the patches can be updated with devtool:
-
-    devtool modify <recipe>
-    devtool finish --force-patch-refresh <recipe> <layer_path>
-
-Then the updated patches and the source tree (in devtool's workspace)
-should be reviewed to make sure the patches apply in the correct place
-and don't introduce duplicate lines (which can, and does happen
-when some of the context is ignored). Further information:
-http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
-https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
-Details:
-{}""".format(output))
+            # Drop patch fuzz info with header and footer to log file so
+            # insane.bbclass can handle to throw error/warning
+            bb.note("--- Patch fuzz start ---\n%s\n--- Patch fuzz end ---" % format(output))
+
         return output
 
     finally:
-- 
2.20.1


