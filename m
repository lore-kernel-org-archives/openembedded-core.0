Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9EB6FA69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 18:08:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Mar 2014 11:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,704,1389772800"; d="scan'208";a="504049139"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.240])
	by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2014 11:02:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Mar 2014 18:02:39 +0000
Message-Id: <f999386e60257b66eb79f2e7be6efdddcef28499.1395424859.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395424859.git.paul.eggleton@linux.intel.com>
References: <cover.1395424859.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395424859.git.paul.eggleton@linux.intel.com>
References: <cover.1395424859.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 2/2] classes/image: ignore modules.dep changing during multilib image construction
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
X-List-Received-Date: Fri, 21 Mar 2014 18:08:23 -0000

Since we now run depmod when building images (as the postinst that does
this is now on kernel-base instead of kernel-image) it is possible to
have this file different between the two halves of the multilib image,
and the code that checks for such differences detects this and fails.
Whitelist this file to avoid the failure.

Related to fix for [YOCTO #5392].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3436624..9fe2786 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -269,7 +269,7 @@ insert_feed_uris () {
 	done
 }
 
-MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|"
+MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.dep|"
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
 
-- 
1.8.5.3


