Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QtKSn-0002er-Dn
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:17:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2011 07:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="38250581"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2011 07:13:14 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 22:13:12 +0800
Message-Id: <a8e7884f83665fc04ff07f8584a1d01635bd2ffb.1313503778.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
Subject: [PATCH 02/10] tcf-agent: add openssl into DEPENDS
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
X-List-Received-Date: Tue, 16 Aug 2011 14:17:53 -0000

[YOCTO #1330]

If tcf-agent's do_compile happens before openssl does populate_root, we'll
get such a compilation failure:
framework/channel_tcp.c:34:27: fatal error: openssl/ssl.h: No such file or directory

Thanks Kumar Gala for reporting this!

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
Cc: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
index 3f97f69..37591c2 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://../epl-v10.html;md5=7aa4215a330a0a4f6a1cbf8da1a0879f
 
 SRCREV = "1855"
 PV = "0.0+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "svn://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk;module=agent;proto=http \
            http://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk/epl-v10.html;name=epl \
@@ -19,7 +19,7 @@ SRC_URI = "svn://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk;module=ag
 SRC_URI[epl.md5sum] = "7aa4215a330a0a4f6a1cbf8da1a0879f"
 SRC_URI[epl.sha256sum] = "4fd64aeed340d62a64a8da4b371efe0f6d0d745f4d2dbefacba86c646d36bc72"
 
-DEPENDS = "util-linux"
+DEPENDS = "util-linux openssl"
 RDEPENDS_${PN} = "bash"
 
 S = "${WORKDIR}/agent"
-- 
1.7.6



