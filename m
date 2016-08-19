Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 98366760A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 15:35:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2016 08:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,544,1464678000"; d="scan'208";a="1017407716"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.178])
	by orsmga001.jf.intel.com with ESMTP; 19 Aug 2016 08:35:04 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 16:34:50 +0100
Message-Id: <6e71e3206845a8eda86168634053fd3d5334201b.1471620482.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1471620482.git.joshua.g.lock@intel.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1471620482.git.joshua.g.lock@intel.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
Subject: [PATCH 5/5] security_flags: ensure changes to SHARED_OBJECTS cause recompile
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
X-List-Received-Date: Fri, 19 Aug 2016 15:35:05 -0000

Add the SHARED_OBJECTS variable to SECURITY_LDFLAGS vardeps so that
changing SHARED_OBJECTS causes do_compile to re-run.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/conf/distro/include/security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 295c733..901c841 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -24,6 +24,7 @@ SECURITY_CFLAGS ?= "-fstack-protector-strong --param ssp-buffer-size=4 -pie -fpi
 SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong --param ssp-buffer-size=4 ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 
 SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now${pie_ld}"
+SECURITY_LDFLAGS[vardeps] += "SHARED_OBJECTS"
 SECURITY_X_LDFLAGS ?= "-Wl,-z,relro${pie_ld}"
 
 # powerpc does not get on with pie for reasons not looked into as yet
-- 
2.7.4


