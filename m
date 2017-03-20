Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id A53CB7795B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:54:41 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t189so69681561wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hKcJ0/5+EE8rs6NmWT0aafmt7KB0+BCQVNrf6MHIAm4=;
	b=Y4ygr0o49zcGKnJ+5lQH5CG1/VIQUBFHmR1EoxM3MZKFYCsLimmCRGW2dOoAie2zF6
	3oA65+3G83kiJNxVXwwOB0xuhMiSgsu4fP5SbDNgdbz+JvkXlSzDfkPVMkRxemjsJL+7
	G6Pjmao4s4ZnnFE98h3yycKQwIkLOJgD0sjKhaNFSmPky7ut2eEczDxJDxoOhknL0vzV
	UGpZPkdixZZWtbJRylG34T6Eiy/kfPz8SC7RA6t4uRPcGsyiyBbJfvpyihFWJtt1HTLc
	cCE6I9mLB0mXVceKn4q2kfnAK0kuI4nlAtBl/hqkrVmF7CX/5K2A7l1vJAxUlnriFyIn
	1DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hKcJ0/5+EE8rs6NmWT0aafmt7KB0+BCQVNrf6MHIAm4=;
	b=R+SCxDF8zu5FIkpAq3jCMpxrdud9jvyjQqk4BnzArhPizICMJjOBeWIUQQnOJjJyFy
	gdbLD6mtYKidJmV8j8yMTgMeV7pjdGmoHNeUVWNACPFV5WbGjIkg/aq4R8ZTrh1ecz6m
	SRBDLI/fcSrewjQ+6u0nZVrSbGkVpce3EZRFfXziClKTI3ufnD1oK5jONxZwbvrJdDkx
	ShD8Qpk32BnwR5AHObDW/ZyfOFuIBNc3FmlqQCxdYRHOYGLlBW2mGM+cQb8hiYbwZ52d
	jqTHTudKlX4BH1n0jwyUomhQr1rQwBic8XNRIRYOTU0430h6lhBNnGPoIWSF98AaHe7O
	9kjw==
X-Gm-Message-State: AFeK/H0UXkHGLi4OXnnHCufigHVTWqsg5ZTE6JV2xUCevVU5e8FMUsxH76Dibqfgj4kg4gUy
X-Received: by 10.28.61.198 with SMTP id k189mr11609502wma.71.1490028882044;
	Mon, 20 Mar 2017 09:54:42 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o15sm14141971wmd.10.2017.03.20.09.54.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 09:54:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 16:54:37 +0000
Message-Id: <1490028878-24324-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] insane: remove broken unsafe-references-in-binaries test
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
X-List-Received-Date: Mon, 20 Mar 2017 16:54:42 -0000

This test aims to detect binaries in /bin which link to libraries in /usr/lib,
for the case where the user has /usr on a separate filesystem to /.

However it doesn't scan both image/ and the sysroot, so if a binary in /bin
links to a library in /usr/lib that was built by the same recipe then it will
error out.

This test isn't enabled by default, and because of this serious bug I suspect
nobody else is enabling it either.  As /usr being on a separate partition to /
is a very rare configuration these days I think we should delete the test: if
someone cares sufficiently they should write a test that actually works.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 42 ------------------------------------------
 1 file changed, 42 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 6a34bd5..7a86997 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -408,48 +408,6 @@ def package_qa_check_perm(path,name,d, elf, messages):
     """
     return
 
-QAPATHTEST[unsafe-references-in-binaries] = "package_qa_check_unsafe_references_in_binaries"
-def package_qa_check_unsafe_references_in_binaries(path, name, d, elf, messages):
-    """
-    Ensure binaries in base_[bindir|sbindir|libdir] do not link to files under exec_prefix
-    """
-    if unsafe_references_skippable(path, name, d):
-        return
-
-    if elf:
-        import subprocess as sub
-        pn = d.getVar('PN')
-
-        exec_prefix = d.getVar('exec_prefix')
-        sysroot_path = d.getVar('STAGING_DIR_TARGET')
-        sysroot_path_usr = sysroot_path + exec_prefix
-
-        try:
-            ldd_output = bb.process.Popen(["prelink-rtld", "--root", sysroot_path, path], stdout=sub.PIPE).stdout.read().decode("utf-8")
-        except bb.process.CmdError:
-            error_msg = pn + ": prelink-rtld aborted when processing %s" % path
-            package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
-            return False
-
-        if sysroot_path_usr in ldd_output:
-            ldd_output = ldd_output.replace(sysroot_path, "")
-
-            pkgdest = d.getVar('PKGDEST')
-            packages = d.getVar('PACKAGES')
-
-            for package in packages.split():
-                short_path = path.replace('%s/%s' % (pkgdest, package), "", 1)
-                if (short_path != path):
-                    break
-
-            base_err = pn + ": %s, installed in the base_prefix, requires a shared library under exec_prefix (%s)" % (short_path, exec_prefix)
-            for line in ldd_output.split('\n'):
-                if exec_prefix in line:
-                    error_msg = "%s: %s" % (base_err, line.strip())
-                    package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
-
-            return False
-
 QAPATHTEST[unsafe-references-in-scripts] = "package_qa_check_unsafe_references_in_scripts"
 def package_qa_check_unsafe_references_in_scripts(path, name, d, elf, messages):
     """
-- 
2.8.1


