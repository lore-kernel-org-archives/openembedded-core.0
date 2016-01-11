Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2421E60670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 16:13:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 11 Jan 2016 08:13:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,553,1444719600"; d="scan'208";a="631703131"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2016 08:13:21 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 18:13:17 +0200
Message-Id: <1452528799-11292-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1452528799-11292-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1452528799-11292-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/3] sign_rpm.bbclass: fix task dependencies
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
X-List-Received-Date: Mon, 11 Jan 2016 16:13:23 -0000

do_rootfs task needs to depend on signing-keys:do_export_public_keys.
The rpm signing public key needs to be present in order to prevent a
crash because it is imported into the rootfs rpmdb before rootfs
creation starts.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sign_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index bc916a7..7906b64 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -71,3 +71,4 @@ python sign_rpm () {
 }
 
 do_package_index[depends] += "signing-keys:do_export_public_keys"
+do_rootfs[depends] += "signing-keys:do_export_public_keys"
-- 
2.1.4


