Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kFlyChvo0dSJNDm+qVHg2VayGVCzR4uPahwBAIXwW35IyAR9wXt+rRjntKRj0eXqrdUr5AscUm
 mlNYJG/Ns5wQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211643"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211643"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:00 -0700
IronPort-SDR: rzAk3sssnpKKR8iOutAsfo0byQwZNdWfdDKBminlN27ZlleKIGsEGzu8NP+haHBPnm+YAk8nY5
 55Qysq10ctnw==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295217"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:59 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 17/25] devtool: Fix do_kernel_configme task
Date: Mon, 22 Mar 2021 09:41:19 +0800
Message-Id: <b475ba8676c88286185aaafb3ff5217e475ec494.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>

The do_kernel_configme task is no longer part of SRCTREECOVEREDTASKS,
its been removed from the kernel-yocto.bbclass since b72dbb2e4, but
there wasnt a matching patch for devtool for those changes.

This patch enables us to invoke the do_kernel_configme task when
using a devtool workspace, it also prepends a check for an existing
.config file in the source directory and moves it if thats the case,
since when using devtool modify a .config is created and
do_kernel_configme complains about it, this is not the case when
using bitbake since the .config file would be on B instead.

Alowing do_kernel_configme to run also fixes the flow where testing a
new config fragment from devtool workspace isnt added properly
(config queue shows it as ///frg.cfg) and as a side effect it never
gets merged into the final config.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 08dcc0e68095dcf2a159546a48b29d40c9aabc0b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/standard.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7b62b7e7b8..f364a45283 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -953,12 +953,17 @@ def modify(args, config, basepath, workspace):
 
             if bb.data.inherits_class('kernel', rd):
                 f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
-                        'do_fetch do_unpack do_kernel_configme do_kernel_configcheck"\n')
+                        'do_fetch do_unpack do_kernel_configcheck"\n')
                 f.write('\ndo_patch[noexec] = "1"\n')
                 f.write('\ndo_configure_append() {\n'
                         '    cp ${B}/.config ${S}/.config.baseline\n'
                         '    ln -sfT ${B}/.config ${S}/.config.new\n'
                         '}\n')
+                f.write('\ndo_kernel_configme_prepend() {\n'
+                        '    if [ -e ${S}/.config ]; then\n'
+                        '        mv ${S}/.config ${S}/.config.old\n'
+                        '    fi\n'
+                        '}\n')
             if rd.getVarFlag('do_menuconfig','task'):
                 f.write('\ndo_configure_append() {\n'
                 '    if [ ! ${DEVTOOL_DISABLE_MENUCONFIG} ]; then\n'
-- 
2.30.2

