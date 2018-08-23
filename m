Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5039D79510
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:56:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N7uqTv010191
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:56:52 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 00:56:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:07:26 +0800
Message-ID: <a0835110df531e0fadc6a769223556057c0e5c6c.1535011588.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535011588.git.liezhi.yang@windriver.com>
References: <cover.1535011588.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] kernel-yocto.bbclass: Clean up getstatusoutput usage
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
X-List-Received-Date: Thu, 23 Aug 2018 07:56:51 -0000
Content-Type: text/plain

Replace usage of oe.utils.getstatusoutput() with direct subprocess calls.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 077a1ab..8c5667d 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -322,6 +322,7 @@ addtask kernel_configme before do_configure after do_patch
 
 python do_kernel_configcheck() {
     import re, string, sys
+    import subprocess
 
     # if KMETA isn't set globally by a recipe using this routine, we need to
     # set the default to 'meta'. Otherwise, kconf_check is not passed a valid
@@ -333,10 +334,10 @@ python do_kernel_configcheck() {
     pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH'), "${S}/scripts/util/")
 
     cmd = d.expand("scc --configs -o ${S}/.kernel-meta")
-    ret, configs = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
+    configs = subprocess.getoutput("%s%s" % (pathprefix, cmd))
 
     cmd = d.expand("cd ${S}; kconf_check --report -o ${S}/%s/cfg/ ${B}/.config ${S} %s" % (kmeta,configs))
-    ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
+    result = subprocess.getoutput("%s%s" % (pathprefix, cmd))
 
     config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
     bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
-- 
2.7.4


