Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E210C6B181
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 17:47:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 04 Apr 2014 10:47:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,796,1389772800"; d="scan'208";a="507126366"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.87])
	by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2014 10:46:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 18:46:38 +0100
Message-Id: <0f06fb084f6b7175ae2cc90a76aa941fe1d28283.1396633542.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1396633542.git.paul.eggleton@linux.intel.com>
References: <cover.1396633542.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1396633542.git.paul.eggleton@linux.intel.com>
References: <cover.1396633542.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 3/4] classes/image: ignore modules.* changing during multilib image construction
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
X-List-Received-Date: Fri, 04 Apr 2014 17:47:22 -0000

Since we now run depmod when building images (as the postinst that does
this is now on kernel-base instead of kernel-image) it is possible to
have module file differences between the two halves of the multilib image,
and the code that checks for such differences detects this and fails.
Whitelist this file to avoid the failure.

Specifically, modules.alias, modules.dep and modules.symbol can differ
along with their .bin counterparts.

Related to fix for [YOCTO #5392].

(From OE-Core master rev: 0a315804bf991664c0948e3024b8e8b9e9085808)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0986858..aaaa224 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -410,7 +410,7 @@ log_check() {
 	done
 }
 
-MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|"
+MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|/lib/modules/[^/]*/modules.*|"
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
 
-- 
1.9.0


