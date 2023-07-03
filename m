Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E56EB64D9
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 03:30:49 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19946.1688355033507838924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 20:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=E7HtB/3D;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688355040; x=1719891040;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SSGvVfYWkCctDSzWZpgdkUmqYiukFn30HHjPsAeY03Y=;
  b=E7HtB/3Dt4gq7fGDvtKfUlLCfvRLLHS2leG+Pd+68uZUlBs02GZ7CsWf
   6MKmtHFNfOlGdPe/JmUiv6K5loRs73UP7M4Tl3N6H6RC4vaWJIzHY3Ogp
   BDTYCqOQBtzQRUAvtRV0Y87fkYMIQxolmmGRqs40EQi+q3H9TMz0u1ak5
   f9c6BkFBRaRtnckw82OCg2Ru6kn6REO3r3EG6FyrEimu8psNYIkCidrkW
   AzDnhob4Y0G82IxQOtk7H86W5pEwQhLCTxJVIf+2Walj4s8n+hyavKS1u
   G0QTVQ+YZ655dgihX7OAdj7GaZzgHN6OMj1eMDM0F5uUgiaH9uzQ2oyAq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="426461624"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="426461624"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 20:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="1048908188"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="1048908188"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.151.68])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 20:30:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] bluez5: upgrade 5.66 -> 5.68
Date: Mon,  3 Jul 2023 11:30:25 +0800
Message-ID: <20230703033025.30865-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703033025.30865-1-anuj.mittal@intel.com>
References: <20230703033025.30865-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 03:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183791

Include a patch submitted upstream to fix cross-compilation issues.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/fix-check-ell-path.patch    | 39 +++++++++++++++++++
 .../bluez5/{bluez5_5.66.bb => bluez5_5.68.bb} |  2 +-
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/fix-check-ell-path.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.66.bb => bluez5_5.68.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index e10158a6e5..d2ee2b4f12 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -55,6 +55,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0004-src-shared-util.c-include-linux-limits.h.patch \
+           file://fix-check-ell-path.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/fix-check-ell-path.patch b/meta/recipes-connectivity/bluez5/bluez5/fix-check-ell-path.patch
new file mode 100644
index 0000000000..7afa63962d
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/fix-check-ell-path.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=168818474411163&w=2]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+From linux-bluetooth  Sat Jul 01 04:12:52 2023
+From: Rudi Heitbaum <rudi () heitbaum ! com>
+Date: Sat, 01 Jul 2023 04:12:52 +0000
+To: linux-bluetooth
+Subject: [PATCH] configure: Fix check ell path for cross compiling
+Message-Id: <20230701041252.139338-1-rudi () heitbaum ! com>
+X-MARC-Message: https://marc.info/?l=linux-bluetooth&m=168818474411163
+
+Use of AC_CHECK_FILE prevents cross compilation.
+Instead use test to support cross compiling.
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+---
+ configure.ac | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index eff297960..bc7edfcd3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -298,9 +298,10 @@ if (test "${enable_external_ell}" = "yes"); then
+ 	AC_SUBST(ELL_LIBS)
+ fi
+ if (test "${enable_external_ell}" != "yes"); then
+-	AC_CHECK_FILE(${srcdir}/ell/ell.h, dummy=yes,
+-			AC_CHECK_FILE(${srcdir}/../ell/ell/ell.h, dummy=yes,
+-				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)))
++	if (test ! -f ${srcdir}/ell/ell.h) &&
++			(test ! -f ${srcdir}/../ell/ell/ell.h); then
++				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)
++	fi
+ fi
+ AM_CONDITIONAL(EXTERNAL_ELL, test "${enable_external_ell}" = "yes" ||
+ 				(test "${enable_btpclient}" != "yes" &&
+-- 
+2.34.1
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.66.bb b/meta/recipes-connectivity/bluez5/bluez5_5.68.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.66.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.68.bb
index 2208b730b0..921f739fb8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.66.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.68.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "39fea64b590c9492984a0c27a89fc203e1cdc74866086efb8f4698677ab2b574"
+SRC_URI[sha256sum] = "fc505e6445cb579a55cacee6821fe70d633921522043d322b696de0a175ff933"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_IGNORE += "CVE-2020-12352 CVE-2020-24490"
-- 
2.41.0


