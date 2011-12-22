Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Rdn8v-0005AL-U8
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 19:13:26 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-145-187.ottawa.windriver.com [128.224.145.187])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBMI6DQQ013678;
	Thu, 22 Dec 2011 10:06:16 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 22 Dec 2011 13:06:00 -0500
Message-Id: <906567682d06d8de1915b78ddf6128cd7bda6adc.1324576164.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1324576164.git.bruce.ashfield@windriver.com>
References: <cover.1324576164.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1324576164.git.bruce.ashfield@windriver.com>
References: <cover.1324576164.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 4/4] linux-yocto: use PATH to locate kconf_check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2011 18:13:26 -0000

The changes made to prefer in-tree kernel tools forced the location
of kconf_check prematurely. For maximum flexibility, locating it
on the PATH is ideal, since the transition to in-tree tools will be
completely transparent.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 79f82e3..f78caaf 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -124,8 +124,8 @@ python do_kernel_configcheck() {
 
     bb.plain("NOTE: validating kernel configuration")
 
-    pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
-    cmd = bb.data.expand("cd ${B}/..; ${S}/scripts/util/kconf_check -config- ${B} ${S} ${B} ${KBRANCH}",d )
+    pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH', True), "${S}/scripts/util/")
+    cmd = bb.data.expand("cd ${B}/..; kconf_check -config- ${B} ${S} ${B} ${KBRANCH}",d )
     ret, result = commands.getstatusoutput("%s%s" % (pathprefix, cmd))
 
     bb.plain( "%s" % result )
-- 
1.7.4.1



