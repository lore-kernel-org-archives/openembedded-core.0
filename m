Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0D30677367
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:42:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 05:42:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="42543621"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2017 05:42:45 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 15:42:24 +0200
Message-Id: <1486734151-28331-17-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 16/23] util-linux, shadow: Make 'nologin' alternative command
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
X-List-Received-Date: Fri, 10 Feb 2017 13:42:46 -0000

Both shadow and util-linux packages provides 'nologin' binary in ${base_sbindir}
and ${sbindir} respectively, this leads to conflict when 'usrmerge' feature is
enabled, where ${sbindir} == ${base_sbindir}. Hance, handle this to alternative
system to resolve the conflict.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 5 +++--
 meta/recipes-extended/shadow/shadow.inc     | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 691b4e6..bd59b5a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -187,14 +187,14 @@ do_install () {
 # reset and nologin causes a conflict with ncurses-native and shadow-native
 do_install_append_class-native () {
 	rm -f ${D}${base_bindir}/reset
-	rm -f ${D}${base_sbindir}/nologin
+	rm -f ${D}${sbindir}/nologin
 }
 
 ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
 ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall"
-ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject"
+ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
@@ -204,6 +204,7 @@ ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
+ALTERNATIVE_LINK_NAME[nologin] = "${sbindir}/nologin"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 reset.1 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3"
 
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 4c4db00..91b6f46 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -170,10 +170,11 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "200"
 
-ALTERNATIVE_${PN} = "passwd chfn chsh chpasswd vipw vigr"
+ALTERNATIVE_${PN} = "passwd chfn chsh chpasswd vipw vigr nologin"
 ALTERNATIVE_LINK_NAME[chpasswd] = "${sbindir}/chpasswd"
 ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
+ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
 ALTERNATIVE_${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
-- 
2.7.4


