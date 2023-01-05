Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF1CC3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 14:03:11 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.13379.1672927389175236430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 06:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=BTRcCBTl;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672927389; x=1704463389;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Grl3oyqAJ0APlNo2HyRcpkR90fp/uts5UBxKUO6XNdg=;
  b=BTRcCBTl2yAaSiXURgcewyvAdJE3TicJabGM6BELphkVa4ivsUOV5DRn
   hsOKGy3ZzZPNf/m27CrS/x/4AyLRrBVDGycI1PSMZNAQOuAgpen0f2s72
   NK2WDh6K/0u5zIVlUWsIEXWbFtnfssq1R27lcI7k3vY1XuvxSbWSkUc2b
   E6XM9Af9y6TvsofmqGB2Fmn912bJqOH75cGXovFskxm9DQSfb3Xfe9Kjj
   r+Joy1m7bZ10Vj3qDGo3Opb8VFIu9xVeRHH/WoNU8rzGS3QlxkIxw4YB+
   Qwo1whyTKjeqszrM674u8/1fDumWPQGbQIlCBOZ5Eamt+rlOS7iuAejvq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="305711314"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="305711314"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 06:03:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="829562822"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="829562822"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga005.jf.intel.com with ESMTP; 05 Jan 2023 06:03:06 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] libksba: fix CVE-2022-47629
Date: Thu,  5 Jan 2023 22:03:00 +0800
Message-Id: <20230105140300.3879963-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 14:03:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175527

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../libksba/libksba/CVE-2022-47629.patch      | 69 +++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.3.5.bb |  4 +-
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libksba/libksba/CVE-2022-47629.patch

diff --git a/meta/recipes-support/libksba/libksba/CVE-2022-47629.patch b/meta/recipes-support/libksba/libksba/CVE-2022-47629.patch
new file mode 100644
index 0000000000..b09d0eb557
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba/CVE-2022-47629.patch
@@ -0,0 +1,69 @@
+From b17444b3c47e32c77a3ba5335ae30ccbadcba3cf Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Tue, 22 Nov 2022 16:36:46 +0100
+Subject: [PATCH] Fix an integer overflow in the CRL signature parser.
+
+* src/crl.c (parse_signature): N+N2 now checked for overflow.
+
+* src/ocsp.c (parse_response_extensions): Do not accept too large
+values.
+(parse_single_extensions): Ditto.
+--
+
+The second patch is an extra safegourd not related to the reported
+bug.
+
+GnuPG-bug-id: 6284
+Reported-by: Joseph Surin, elttam
+CVE: CVE-2022-47629
+https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=f61a5ea4e0f6a80fd4b28ef0174bee77793cf070
+Upstream-Status: Backport
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/crl.c  |  2 +-
+ src/ocsp.c | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/src/crl.c b/src/crl.c
+index 87a3fa3..9d3028e 100644
+--- a/src/crl.c
++++ b/src/crl.c
+@@ -1434,7 +1434,7 @@ parse_signature (ksba_crl_t crl)
+          && !ti.is_constructed) )
+     return gpg_error (GPG_ERR_INV_CRL_OBJ);
+   n2 = ti.nhdr + ti.length;
+-  if (n + n2 >= DIM(tmpbuf))
++  if (n + n2 >= DIM(tmpbuf) || (n + n2) < n)
+     return gpg_error (GPG_ERR_TOO_LARGE);
+   memcpy (tmpbuf+n, ti.buf, ti.nhdr);
+   err = read_buffer (crl->reader, tmpbuf+n+ti.nhdr, ti.length);
+diff --git a/src/ocsp.c b/src/ocsp.c
+index 4b26f8d..c41234e 100644
+--- a/src/ocsp.c
++++ b/src/ocsp.c
+@@ -912,6 +912,12 @@ parse_response_extensions (ksba_ocsp_t ocsp,
+           else
+             ocsp->good_nonce = 1;
+         }
++      if (ti.length > (1<<24))
++        {
++          /* Bail out on much too large objects.  */
++          err = gpg_error (GPG_ERR_BAD_BER);
++          goto leave;
++        }
+       ex = xtrymalloc (sizeof *ex + strlen (oid) + ti.length);
+       if (!ex)
+         {
+@@ -979,6 +985,12 @@ parse_single_extensions (struct ocsp_reqitem_s *ri,
+       err = parse_octet_string (&data, &datalen, &ti);
+       if (err)
+         goto leave;
++      if (ti.length > (1<<24))
++        {
++          /* Bail out on much too large objects.  */
++          err = gpg_error (GPG_ERR_BAD_BER);
++          goto leave;
++        }
+       ex = xtrymalloc (sizeof *ex + strlen (oid) + ti.length);
+       if (!ex)
+         {
diff --git a/meta/recipes-support/libksba/libksba_1.3.5.bb b/meta/recipes-support/libksba/libksba_1.3.5.bb
index 7f9ab4f5fc..841830efa8 100644
--- a/meta/recipes-support/libksba/libksba_1.3.5.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.5.bb
@@ -22,7 +22,9 @@ inherit autotools binconfig-disabled pkgconfig texinfo
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://ksba-add-pkgconfig-support.patch"
+           file://ksba-add-pkgconfig-support.patch \
+           file://CVE-2022-47629.patch \
+"
 
 SRC_URI[md5sum] = "8302a3e263a7c630aa7dea7d341f07a2"
 SRC_URI[sha256sum] = "41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340"
-- 
2.37.3


