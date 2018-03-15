Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1F3605C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 03:41:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Mar 2018 20:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,308,1517904000"; d="scan'208";a="211700019"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.23])
	by fmsmga005.fm.intel.com with ESMTP; 14 Mar 2018 20:41:24 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 11:41:20 +0800
Message-Id: <1521085280-2987-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519965857-14794-2-git-send-email-anuj.mittal@intel.com>
References: <1519965857-14794-2-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH v2] perf: enable support for libaudit
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
X-List-Received-Date: Thu, 15 Mar 2018 03:41:24 -0000

perf needs audit-python to be able to show syscall names and for
'perf trace' to work.

Enable dependency on audit-python if present in PACKAGECONFIG. It's
disabled by default since audit as of now is in meta-selinux.

Fixes [YOCTO #3343]
Fixes [YOCTO #3358]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index d798492..872b5f0 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -22,6 +22,9 @@ PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
 PACKAGECONFIG[systemtap] = ",NO_SDT=1,systemtap"
 PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
 
+# libaudit support would need scripting to be enabled
+PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit"
+
 DEPENDS = " \
     virtual/${MLPREFIX}libc \
     ${MLPREFIX}elfutils \
@@ -216,7 +219,7 @@ PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 RDEPENDS_${PN} += "elfutils bash"
 RDEPENDS_${PN}-doc += "man"
 RDEPENDS_${PN}-archive =+ "bash"
-RDEPENDS_${PN}-python =+ "bash python python-modules"
+RDEPENDS_${PN}-python =+ "bash python python-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
 RDEPENDS_${PN}-tests =+ "python"
 
-- 
2.7.4


