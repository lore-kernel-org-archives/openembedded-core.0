Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04CD07568E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 03:23:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5C3NNhj007474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 20:23:23 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 11 Jun 2015 20:23:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 20:23:21 -0700
Message-ID: <2fbbbb9e2098904f488bc585288cb7ca1b88ff2e.1434079315.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434079315.git.liezhi.yang@windriver.com>
References: <cover.1434079315.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] insane.bbclass: check invalid ac_cv value
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
X-List-Received-Date: Fri, 12 Jun 2015 03:23:22 -0000
Content-Type: text/plain

Add QA check invalid-ac-cv to check the invalid cached configure vars
(ac_cv_xxx).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |   19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index dc891d5..70b9b66 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -30,7 +30,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
             pn-overrides infodir build-deps file-rdeps \
-            unknown-configure-option symlink-to-sysroot multilib \
+            unknown-configure-option symlink-to-sysroot multilib invalid-ac-cv \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -1139,6 +1139,23 @@ Missing inherit gettext?""" % (gt, config))
                 package_qa_handle_error("unknown-configure-option", error_msg, d)
         except subprocess.CalledProcessError:
             pass
+
+        # Check invalid cached configure vars (ac_cv_xxx).
+        # The ac_cv_xxx maybe in CACHED_CONFIGUREVARS, CONFIGUREOPTS and
+        # EXTRA_OECONF.
+        tocheck = "%s %s %s" % (d.getVar('CACHED_CONFIGUREVARS', True) or "", \
+                    d.getVar('CONFIGUREOPTS', True) or "", \
+                    d.getVar('EXTRA_OECONF', True) or "" )
+        for var in tocheck.split():
+            if var.startswith('ac_cv_'):
+                varname = var.split('=')[0]
+                cfgscript=d.expand("${S}/configure")
+                if os.path.exists(cfgscript):
+                    statement = "grep -q -F %s  %s > /dev/null" % (varname, cfgscript)
+                    if subprocess.call(statement, shell=True) != 0:
+                        pn = d.getVar('PN', True)
+                        error_msg = "%s: Invalid cached configure var: %s" % (pn, varname)
+                        package_qa_handle_error("invalid-ac-cv", error_msg, d)
 }
 # The Staging Func, to check all staging
 #addtask qa_staging after do_populate_sysroot before do_build
-- 
1.7.9.5


