Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E25D777071
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 15:35:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2016 08:35:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,544,1464678000"; d="scan'208";a="1017407597"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.178])
	by orsmga001.jf.intel.com with ESMTP; 19 Aug 2016 08:35:00 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 16:34:47 +0100
Message-Id: <d7af57b9c8284eaa96fa6c0a560c0047b03fb911.1471620482.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1471620482.git.joshua.g.lock@intel.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1471620482.git.joshua.g.lock@intel.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
Subject: [PATCH 2/5] security_flags: pass ssp-buffer-size param to stack protector
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
X-List-Received-Date: Fri, 19 Aug 2016 15:35:01 -0000

This tells the compiler to use a canary to protect any function which
declares a character array of 4 or more bytes on its stack, rather
than the default of 8 or more bytes.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/conf/distro/include/security_flags.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 77fade6..691cea1 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -12,8 +12,8 @@ lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE
 # Error on use of format strings that represent possible security problems
 SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
 
-SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
-SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
+SECURITY_CFLAGS ?= "-fstack-protector-strong --param ssp-buffer-size=4 -pie -fpie ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
+SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong --param ssp-buffer-size=4 ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 
 SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
 SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
-- 
2.7.4


