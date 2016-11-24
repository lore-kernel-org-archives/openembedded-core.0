Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 06A6871B80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 23:44:31 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id t79so75505236wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 15:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=e1675o/kvqlfH0ohJE1KeNQpFgsS+prXXre6363X7FM=;
	b=wkNeFkypduGQosLNEcMMYMwlaz8n4Q3RHVOvcmrzQwKr9PQ1LBiFI4GKTeCrMNsO6F
	GCp5XUzlMrFQaqVw1vGa2TiHj4LWjGss3jKwEGLSOcfBrnnljnfK23LFlV0sHb1QAMzY
	eWULW1YRUoL43l6aNIJJopoEracpvzDNqEoIvVgy/aQnjzBQd2uFlezlk5lAvNfDj61N
	DJfapOeCoyZMhVi5ROCO/kcBC1M17VDdS1mGx6Dq8Np+V6VfYgnPuxHjl5Z3K0zYYHua
	u6QHvDbeJavKo9tVqWVN26M4KbkHszimq4Tn3MD32lE2mNXBrNUYGpwHFOEprcGqBovq
	JOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=e1675o/kvqlfH0ohJE1KeNQpFgsS+prXXre6363X7FM=;
	b=FQlnNZb7hwQy6FnXveVNqqlk0DrfQEUFC9a5AAz+eFH5+muUCgR1I/xyFVEp1J8gar
	r08lJ6TCQdBbNRkfGljk4fg8bDLwZqXM5SHjK6l0bz8ZtP+QNxy2cDgx4KqUpE7ucNEL
	UFMPmFLdtoFA9c2Rz45cUNF84SI/NFtJIvDPXzGQ6dwkYn0PN5mUOP0Hc2y+GpviaLzH
	6R2dl13b77qKmrkxIFVRs4L1GL1+BXVLI2eDlRMcQIEG1kgSAVNl/vJmkmRaj5ho6LuB
	3xrpPx2GW3SCtClKxcElMMC/ZtGmG6oYo1kd0/szF+GAD9umCR+bZDTL3PLQiOnjT+wU
	fsqQ==
X-Gm-Message-State: AKaTC00T7KIfhSBDBLgc0qCyjTtXSvCCp/BtlcDsZRRsD3kI1FtXEFjHGHEYFN+PR0ONOmZd
X-Received: by 10.28.229.213 with SMTP id c204mr4520225wmh.72.1480031073058;
	Thu, 24 Nov 2016 15:44:33 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	yg1sm44209118wjb.12.2016.11.24.15.44.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 15:44:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 23:44:25 +0000
Message-Id: <1480031065-19435-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1480031065-19435-1-git-send-email-ross.burton@intel.com>
References: <1480031065-19435-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] insane: rewrite the expanded-d test as a QAPKGTEST
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
X-List-Received-Date: Thu, 24 Nov 2016 23:44:33 -0000

Instead of being executed for every file in every package, this is now just
called for each package.  It is also now correctly called for packages which
don't have any content but do have postinst scripts.

[ YOCTO #10711 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 407ccee..5ddb87b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1002,30 +1002,24 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
     check_valid_deps('RREPLACES')
     check_valid_deps('RCONFLICTS')
 
-QAPATHTEST[expanded-d] = "package_qa_check_expanded_d"
-def package_qa_check_expanded_d(path,name,d,elf,messages):
+QAPKGTEST[expanded-d] = "package_qa_check_expanded_d"
+def package_qa_check_expanded_d(package, d, messages):
     """
     Check for the expanded D (${D}) value in pkg_* and FILES
     variables, warn the user to use it correctly.
     """
-
     sane = True
-    expanded_d = d.getVar('D',True)
-
-    # Get packages for current recipe and iterate
-    packages = d.getVar('PACKAGES', True).split(" ")
-    for pak in packages:
-    # Go through all variables and check if expanded D is found, warn the user accordingly
-        for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
-            bbvar = d.getVar(var + "_" + pak, True)
-            if bbvar:
-                if expanded_d in bbvar:
-                    if var == 'FILES':
-                        package_qa_add_message(messages, "expanded-d", "FILES in %s recipe should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference" % pak)
-                        sane = False
-                    else:
-                        package_qa_add_message(messages, "expanded-d", "%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, pak))
-                        sane = False
+    expanded_d = d.getVar('D', True)
+
+    for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
+        bbvar = d.getVar(var + "_" + package, True) or ""
+        if expanded_d in bbvar:
+            if var == 'FILES':
+                package_qa_add_message(messages, "expanded-d", "FILES in %s recipe should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference" % package)
+                sane = False
+            else:
+                package_qa_add_message(messages, "expanded-d", "%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, package))
+                sane = False
     return sane
 
 def package_qa_check_encoding(keys, encode, d):
-- 
2.8.1


