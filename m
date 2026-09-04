Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C3FC79F85
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:42:36 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12810.1788525747901926096
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Qfpm+dNA;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4644; q=dns/txt;
  s=iport01; t=1788525747; x=1789735347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9wvlPz/KbW/kH+SbIeEW3cOvgPfl4gxQKyrkolMiQtk=;
  b=Qfpm+dNAEQO75dZLXa0bhuJhzqbDblW8iQ9pWuBUik4PxOGLWRu5KKrZ
   Jiax2cA/MGy6FLVknqw1scozal1zWo+Xl3QPZeGSPegelzHKqQPbxLCXD
   8MTP1YJDz3lfbJg+JJU1oERgkYT1O1PLWgeP3gP47soRrr1rK0WFUDz6/
   1mp/Dwo7sHKGthJLIQxDFrHRgUtH08Xm4vOM0Ta+JKh2iMng/ffRYAuF/
   nKbcFd4Yh78FykGRZa7zHS2D7QyK6wtLZ7QOvz9M+0tvHndVvQQnNtQOp
   uZGKOILj0rs4Q0LlCykzul3DdoXXB4YZce+ruL4P91zQqJv0tWi7QfSz0
   Q==;
X-CSE-ConnectionGUID: LMJWq0A8TumgyPag3KZAZw==
X-CSE-MsgGUID: jUuvhQfCQbGaDSVhl3UZrg==
X-IPAS-Result: =?us-ascii?q?A0AnAABYvJpq/4oQJK1QCh0BAQEBCQESAQUFAYF8CAELA?=
 =?us-ascii?q?YJWdGBDSQOMb4lYA54bFIFqDwEBAQ9EDQQBAYQ/RgKOAgImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDZAdAgEDMgE0EhAdAzErHQ4Zg?=
 =?us-ascii?q?wIBgnQDEQbDEoIsgQGDaAJD3AEBCxQBBYEzAYU+iCJ2hHwnGxuBcoEVgnpvg?=
 =?us-ascii?q?QWBXAEBgTMThl8EgiKBDIQmj0FIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQcbBgWBHYEngz8jGTZ6gQlegSspYAESF4EJgggCglSCAwIBSUMOB0dTC?=
 =?us-ascii?q?SdBBAsYDUgRLDcVGQQ+bgeOXx+CAU9ZNQErBRuBXQYpk3yReqEPCiiDdowil?=
 =?us-ascii?q?ToaM4QEpmmZCIJZizGVZxlQhGmBaDyBRwsHcBWDIgkKQBkPji4LCxyDRIF/g?=
 =?us-ascii?q?xTHJicyAgEIAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:yySLRaBry54YIRVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApDMghTUFz
 mZJWGuGOv/fNmT8L413aN6wpE0FvsWHm4VrOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA79h2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE59BMM1huFN0k5+N4EFlH+
 qc7Ghk/cUXW7w626OrTpuhEj8AnKozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxAMmoHgBfoO3WjPn8XFJI3n+6yrnL+aDZf7lmSoMLb5kCDl1EugeK1boK9ltqiR/hIgEahq
 En/9UvwLiokNNjE9Aif/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNuhoaHt4VGOog5UTVk+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ269V5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:C2sM5qznnEhPHCus/XSSKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3AdPLNgGnQe9mdGA4qyFE1jRsus9nXOVn47kjJe2b?=
 =?us-ascii?q?oNXtsR6ytQFDL25FNodU7zg=3D=3D?=
X-Talos-MUID: 9a23:hXr6twuOl104AAf3Ps2nhgx/KsdR7Y+XAm8Eva44u83fCB5qNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,262,1779148800"; 
   d="scan'208";a="835792060"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 12:42:09 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 99AC1180008E7;
	Fri,  4 Sep 2026 12:42:09 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 38F6ECCD9B2; Fri,  4 Sep 2026 05:42:09 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH 4/4] u-boot, u-boot-tools: Correct CVE-2026-46728 attribution for FIT fix
Date: Fri,  4 Sep 2026 05:41:57 -0700
Message-Id: <20260904124157.1723755-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260904124157.1723755-1-hthakar@cisco.com>
References: <20260904124157.1723755-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 12:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245101

From: Hetvi Thakar <hthakar@cisco.com>

CVE-2026-33243 is assigned to barebox, but NVD currently also maps it
to denx:u-boot. That U-Boot mapping is incorrect because the U-Boot-side
FIT hashed-nodes verification issue is tracked separately as
CVE-2026-46728. A correction request has been sent to NVD to remove the
incorrect denx:u-boot mapping. The existing patch backports U-Boot commit
2092322b31cc8b1f8c9e2e238d1043ae0637b241 [3], which is the U-Boot fix
referenced by CVE-2026-46728 [2].

Rename the patch and update its CVE tag so the filename and metadata
identify the affected U-Boot vendor correctly.

Apply the same patch to u-boot-tools because that recipe builds
fit_check_sign, which uses the affected FIT signature-verification path.
The bootloader recipe already carried the backport, but u-boot-tools did
not.

[1] https://github.com/barebox/barebox/security/advisories/GHSA-3fvj-q26p-j6h4
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-46728
[3] https://github.com/u-boot/u-boot/commit/2092322b31cc8b1f8c9e2e238d1043ae0637b241

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../{CVE-2026-33243.patch => CVE-2026-46728.patch}    | 11 ++++++++---
 meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb       |  4 ++++
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb             |  4 +++-
 3 files changed, 15 insertions(+), 4 deletions(-)
 rename meta/recipes-bsp/u-boot/files/{CVE-2026-33243.patch => CVE-2026-46728.patch} (98%)

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch b/meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch
similarity index 98%
rename from meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch
rename to meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch
index c7086e183fb..4e582d529ea 100644
--- a/meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch
+++ b/meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch
@@ -28,11 +28,16 @@ Closes: https://lore.kernel.org/u-boot/20260302220937.3682128-1-trini@konsulko.c
 Reported-by: Apple Security Engineering and Architecture (SEAR)
 Tested-by: Tom Rini <trini@konsulko.com>
 
-[YB: Removed a skippable condition in fit_config_get_hash_list.
-	This flag is not available in this version]
-CVE: CVE-2026-33243
+CVE: CVE-2026-46728
 Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/2092322b31cc8b1f8c9e2e238d1043ae0637b241]
+
+Backport Changes:
+Dropped the FIT_COMPAT_PROP condition because this macro is not
+available in U-Boot v2026.01.
+
+(cherry picked from commit 2092322b31cc8b1f8c9e2e238d1043ae0637b241)
 Signed-off-by: Yanis Binard <yanis.binard@smile.fr>
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
 ---
  boot/image-fit-sig.c        | 226 +++++++++++++++++++++++++++++-------
  doc/usage/fit/signature.rst |  19 ++-
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
index 5e2ed063868..77e086815c1 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
@@ -1,6 +1,10 @@
 require u-boot-common.inc
 require u-boot-tools.inc
 
+SRC_URI += "file://CVE-2026-46728.patch"
+
+CVE_STATUS[CVE-2026-33243] = "cpe-incorrect: NVD currently maps this CVE to denx:u-boot, but that mapping is incorrect for U-Boot; the U-Boot-side FIT issue is tracked separately as CVE-2026-46728 and is fixed by the included U-Boot backport."
+
 CVE_STATUS[CVE-2026-29007] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
 CVE_STATUS[CVE-2026-29008] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
 CVE_STATUS[CVE-2026-29009] = "not-applicable-config: tools-only_defconfig disables networking; net/nfs.c is not compiled into u-boot-tools."
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
index 6d9bc126a16..9610d9e8fe0 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
@@ -3,7 +3,9 @@ require u-boot.inc
 
 DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
 
-SRC_URI += "file://CVE-2026-33243.patch"
+SRC_URI += "file://CVE-2026-46728.patch"
+
+CVE_STATUS[CVE-2026-33243] = "cpe-incorrect: NVD currently maps this CVE to denx:u-boot, but that mapping is incorrect for U-Boot; the U-Boot-side FIT issue is tracked separately as CVE-2026-46728 and is fixed by the included U-Boot backport."
 
 # workarounds for aarch64 kvm qemu boot regressions
 SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
-- 
2.35.6


