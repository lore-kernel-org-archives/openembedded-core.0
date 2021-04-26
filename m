Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: XNJ1ec0ro70+d27KF9vIyRIImCzpmWC6bURjgh0PTY1Qbv7hC7Sq8y2DeEHxI374LguHcF8Gr0
 M9AP5lBHxb0A==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818195"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818195"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:38 -0700
IronPort-SDR: 5XI1iuJ/WSoyAAhy9egYmMwdvWv1wPM1wfiowx9/QKCmBBZAe3+LeERoDno2L5kf81Mfwnx9Fe
 paEx13ApAKYg==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067415"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:37 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 32/64] insane: clean up some more warning messages
Date: Mon, 26 Apr 2021 08:53:03 +0800
Message-Id: <db27cb7aabb875d9a48b3b1e82f7cf4e44d15c8b.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2abe18682192e7b38b9af5a5043906f2f069648f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/insane.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index fa05fc055b..763d5f1da2 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -176,7 +176,7 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
             if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
                 # The dynamic linker searches both these places anyway.  There is no point in
                 # looking there again.
-                package_qa_add_message(messages, "useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
+                package_qa_add_message(messages, "useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d, name), rpath))
 
 QAPATHTEST[dev-so] = "package_qa_check_dev"
 def package_qa_check_dev(path, name, d, elf, messages):
@@ -185,8 +185,8 @@ def package_qa_check_dev(path, name, d, elf, messages):
     """
 
     if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-ptest") and not name.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(path):
-        package_qa_add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package contains symlink .so: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package %s contains symlink .so '%s'" % \
+                 (name, package_qa_clean_path(path, d, name)))
 
 QAPATHTEST[dev-elf] = "package_qa_check_dev_elf"
 def package_qa_check_dev_elf(path, name, d, elf, messages):
@@ -196,8 +196,8 @@ def package_qa_check_dev_elf(path, name, d, elf, messages):
     install link-time .so files that are linker scripts.
     """
     if name.endswith("-dev") and path.endswith(".so") and not os.path.islink(path) and elf:
-        package_qa_add_message(messages, "dev-elf", "-dev package contains non-symlink .so: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "dev-elf", "-dev package %s contains non-symlink .so '%s'" % \
+                 (name, package_qa_clean_path(path, d, name)))
 
 QAPATHTEST[staticdev] = "package_qa_check_staticdev"
 def package_qa_check_staticdev(path, name, d, elf, messages):
@@ -210,7 +210,7 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
 
     if not name.endswith("-pic") and not name.endswith("-staticdev") and not name.endswith("-ptest") and path.endswith(".a") and not path.endswith("_nonshared.a") and not '/usr/lib/debug-static/' in path and not '/.debug-static/' in path:
         package_qa_add_message(messages, "staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+                 (name, package_qa_clean_path(path,d, name)))
 
 QAPATHTEST[mime] = "package_qa_check_mime"
 def package_qa_check_mime(path, name, d, elf, messages):
-- 
2.30.2

