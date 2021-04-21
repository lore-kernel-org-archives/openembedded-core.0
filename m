Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8497.1618985195073168650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 23:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 6HYT3EU8Q/xiE8j8Myb7o3erC7z33VciUxMOfjv/G3N5rmxMBOZwOxMo8nP++UC+cU3TVIrYwI
 iSeUat7AUE3w==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="195671514"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="195671514"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:39 -0700
IronPort-SDR: z/DaxXtbYbyDKrrPEPbqv5rUqgIJzUQ0WGWSJcXFWaZTsrKwpkecc4cW0UFiBmoHg2/annDxlo
 aaegk3mNjI9Q==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="385684433"
Received: from slow4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.70.252])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:37 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 5/8] insane: clean up some more warning messages
Date: Wed, 21 Apr 2021 14:06:17 +0800
Message-Id: <80395724a6450f7aabbb6ac06e4647244eac5e64.1618984878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618984878.git.anuj.mittal@intel.com>
References: <cover.1618984878.git.anuj.mittal@intel.com>
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
index c6dff9659c..44dbed875b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -175,7 +175,7 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
             if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
                 # The dynamic linker searches both these places anyway.  There is no point in
                 # looking there again.
-                package_qa_add_message(messages, "useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
+                package_qa_add_message(messages, "useless-rpaths", "%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d, name), rpath))
 
 QAPATHTEST[dev-so] = "package_qa_check_dev"
 def package_qa_check_dev(path, name, d, elf, messages):
@@ -184,8 +184,8 @@ def package_qa_check_dev(path, name, d, elf, messages):
     """
 
     if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-ptest") and not name.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(path):
-        package_qa_add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package contains symlink .so: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package %s contains symlink .so '%s'" % \
+                 (name, package_qa_clean_path(path, d, name)))
 
 QAPATHTEST[dev-elf] = "package_qa_check_dev_elf"
 def package_qa_check_dev_elf(path, name, d, elf, messages):
@@ -195,8 +195,8 @@ def package_qa_check_dev_elf(path, name, d, elf, messages):
     install link-time .so files that are linker scripts.
     """
     if name.endswith("-dev") and path.endswith(".so") and not os.path.islink(path) and elf:
-        package_qa_add_message(messages, "dev-elf", "-dev package contains non-symlink .so: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "dev-elf", "-dev package %s contains non-symlink .so '%s'" % \
+                 (name, package_qa_clean_path(path, d, name)))
 
 QAPATHTEST[staticdev] = "package_qa_check_staticdev"
 def package_qa_check_staticdev(path, name, d, elf, messages):
@@ -209,7 +209,7 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
 
     if not name.endswith("-pic") and not name.endswith("-staticdev") and not name.endswith("-ptest") and path.endswith(".a") and not path.endswith("_nonshared.a") and not '/usr/lib/debug-static/' in path and not '/.debug-static/' in path:
         package_qa_add_message(messages, "staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+                 (name, package_qa_clean_path(path,d, name)))
 
 QAPATHTEST[mime] = "package_qa_check_mime"
 def package_qa_check_mime(path, name, d, elf, messages):
-- 
2.30.2

