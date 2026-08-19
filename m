Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277B6C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:18:47 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4802.1787138326844342117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=K2P2K1rJ;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3595; q=dns/txt;
  s=iport01; t=1787138326; x=1788347926;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/Z0NzMj2p+N96WN0tT/ame9ER5oPdcP3iWivKY+Qm74=;
  b=K2P2K1rJt/PeabUPa3QQVFDjV+dyp8Rn30jzcHBthAGhLHuBm1UTXdB0
   BQepJdBpMh+0ElpWv+as8MHWQnVNMJU2iaXobecnEKE/092SgGJvaSXl4
   WE15QTmgEzDU1dTYnQd6HqHEr//rMyxH8tA9xZrRSEuSf2YUhPhZpzjEf
   VLYXKx4pK4sZcbYXetBsu3aokf9tJ7zbdKXickDeQ7pyAimt+pzumhntP
   ItXM7FkLeEADb59B49QSSMhNpBCwPR9LQREpuqJuWtcRPiSxi1PybzGrb
   N8L7D5gRJ6yUkR0cTZWZrlVg1Rzjzhp8NIFrHi5hj1JKN9mDL2M+VI6iq
   w==;
X-CSE-ConnectionGUID: +UPZCnDzS8eeI9B9rpYuAQ==
X-CSE-MsgGUID: cMgYBfgMQZGWPVKy6bJKKg==
X-IPAS-Result: =?us-ascii?q?A0BCAgA0kIVq/5L/Ja1aglmCV3RfQkmUKYIhnh6Bfg8BA?=
 =?us-ascii?q?QEPRA0EAQGScgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDYZaATgBcgMBAlojGQiDAgGCOgM3AxHDHRo3giyBAYR92zABCxQBgTiFP?=
 =?us-ascii?q?4giXYUVJxsbgXKBFYNpgh9CBYgiBIIigQyBWh6CY45kSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQ3Ixk2eoEJXoErKmISF4EJggoCg?=
 =?us-ascii?q?nOCBgIBSUURCgsLGA1IESw3FBkEPm4HjkkggkAGAQF6EwErIoFyNKVXoRIKK?=
 =?us-ascii?q?IN2jCGVOhozhVulES6YWo4KllCEaYFoPIFZcBWDIglKGQ+SI4UTxw48NQsyA?=
 =?us-ascii?q?gcCBw4DC5NmAQE?=
IronPort-Data: A9a23:s81qPKAVEamjABVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDl20WMOz
 TMeCmyPa/yDN2WmLt4ga4qx8h8BsceDztNhOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/8imYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEgMhWPmowEZ8jqut6IDBkp
 OYAGS0kV0XW7w626OrTpuhEnM8vKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYxBPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEriOWyaYCIJLRmQ+1eu0mpj
 GzJ2l3LLS4iCv+OlzCn0VGj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:T0qceK5q08hdbc51ywPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: 9a23:H0q6Jm+1k5SGSGsrDJOVvw0pIvIOdFHP9yfdLm7pIzdzUIyIYGbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AA8RvWQzqzYhzuvIoxS9aQS2YKQ6aqK+LB3Enn5o?=
 =?us-ascii?q?jgvurChROGCbDhhaUYYByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="520571256"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:18:46 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 9AEAC18000203
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 11:18:45 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id C66FCCC037D; Wed, 19 Aug 2026 16:48:43 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] qemu: guard RESOLVE_CACHED strace flag
Date: Wed, 19 Aug 2026 16:48:28 +0530
Message-Id: <20260819111828.4061079-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 11:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243726

From: Himanshu Jadon <hjadon@cisco.com>

qemu-native build can fail on build hosts which have an older
linux/openat2.h header. The header is new enough to enable
HAVE_OPENAT2_H, but it does not have RESOLVE_CACHED because that flag
was added later in kernel 5.12.

In that case linux-user/strace.c tries to use RESOLVE_CACHED and build
fails with:

    error: 'RESOLVE_CACHED' undeclared here

This is mainly seen with qemu-native because it is built for the host
and can pick the host kernel UAPI header. The buildtools header may have
RESOLVE_CACHED, but native build still has to be safe with older host
headers also.

Add the upstream QEMU fix which checks RESOLVE_CACHED before using it.
This does not change anything on newer hosts. On older hosts QEMU just
does not print this one strace flag because the local header does not
know about it.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...-if-RESOLVE_CACHED-flag-is-defined-b.patch | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 60a5c62fe9..cc8f2ecdfa 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,6 +41,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2026-0665.patch \
            file://CVE-2025-14876_p1.patch \
            file://CVE-2025-14876_p2.patch \
+           file://0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch b/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch
new file mode 100644
index 0000000000..fc86d68e7d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch
@@ -0,0 +1,38 @@
+From 09e077b87eed754cc0aac0f54d193d49f978c93f Mon Sep 17 00:00:00 2001
+From: Frank Chang <frank.chang@sifive.com>
+Date: Thu, 12 Feb 2026 17:54:49 +0800
+Subject: [PATCH] linux-user: Check if RESOLVE_CACHED flag is defined before
+ using it
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7ac4bded6af90a15a9562515743a789236b062d1]
+
+openat2.h was introduced in Linux kernel 5.6. However, RESOLVE_CACHED
+flag was only added in kernel 5.12 and later. Therefore, we need to check
+if RESOLVE_CACHED flag is defined before using it.
+
+Signed-off-by: Frank Chang <frank.chang@sifive.com>
+Reviewed-by: Helge Deller <deller@gmx.de>
+Signed-off-by: Helge Deller <deller@gmx.de>
+(cherry picked from commit 7ac4bded6af90a15a9562515743a789236b062d1)
+Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
+---
+ linux-user/strace.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/linux-user/strace.c b/linux-user/strace.c
+index 758c5d32b6..a903b414fd 100644
+--- a/linux-user/strace.c
++++ b/linux-user/strace.c
+@@ -1125,7 +1125,9 @@ UNUSED static const struct flags openat2_resolve_flags[] = {
+     FLAG_GENERIC(RESOLVE_NO_SYMLINKS),
+     FLAG_GENERIC(RESOLVE_BENEATH),
+     FLAG_GENERIC(RESOLVE_IN_ROOT),
++#ifdef RESOLVE_CACHED
+     FLAG_GENERIC(RESOLVE_CACHED),
++#endif
+ #endif
+     FLAG_END,
+ };
+-- 
+2.35.6
+
-- 
2.35.6


