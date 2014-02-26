Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D95066EFCB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 13:51:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2014 05:51:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,548,1389772800"; d="scan'208";a="490107720"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.179])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2014 05:51:39 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2014 15:51:32 +0200
Message-Id: <1393422692-28184-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1393422692-28184-1-git-send-email-sgw@linux.intel.com>
References: <1393422692-28184-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/3] systemd: sed installed file instead of original
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
X-List-Received-Date: Wed, 26 Feb 2014 13:51:39 -0000

When we change the ROOT_HOME the sed regex does not match if we are running
the do_install() a second time, so copy the units files first to a pre_sed,
so that the next time, we can copy the the original so that the sed regex
is matched correctly in the original

[YOCTO #5765]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/systemd/systemd_208.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index 219607f..1bcedaa 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -89,6 +89,11 @@ EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
 do_configure_prepend() {
 	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
 	export KMOD="${base_bindir}/kmod"
+	if [ -d ${S}/units.pre_sed ] ; then
+		cp -r ${S}/units.pre_sed ${S}/units
+	else
+		cp -r ${S}/units ${S}/units.pre_sed
+	fi
 	sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
 }
 
-- 
1.8.3.1


