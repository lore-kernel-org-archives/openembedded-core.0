Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4276C5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:58:25 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.957.1787205500698363432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WMtws4SX;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2695; q=dns/txt;
  s=iport01; t=1787205500; x=1788415100;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D9COgYoiTeUNr/b40mrInSmfnQ1FpLgL62OgJzTbDTw=;
  b=WMtws4SXp7p/1/ZFf/9xGbj3tIwyDlX+DRH25tj3iCnlZl1mser0rp8d
   Oh1UetTGlQqan850uYJmGkCXy8H1hr4nnfgQ8Y90l3SxJBOcYDpBle4MM
   gmqwjdVqrv8CjRcb0qO7M3TAv9YeRPldMSXswhsP+RM0H9TtNWK9qSZ3t
   48O1tCaXlS8DBt18aIxXheOSYtcAK/QspKowfgT6LgL4s9TTmSL+G3x1s
   j39thwsDJf2PW863bbbMAHUPbM3x1feVYzOUcpZicPSgvYeW7BpAzRS38
   xKRrUayOaWkKIy7zdEZMENIl1Uhjkw/EdwFs1iCDCWtScB/M2xYtgMKIx
   Q==;
X-CSE-ConnectionGUID: LiS4ZW23Tzq4zLET5xqbIQ==
X-CSE-MsgGUID: XT4tLAryR02aSuVXmE+GfQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgDZloZq/4wQJK1aglmCV3ReQ0mWSp4egX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9GjW0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEqCwEYAS0sAwECWiMhgwIBgnQDEcFhGjeBeTOBAYMoAT8CQ?=
 =?us-ascii?q?1DbMAELFAEFgTOFP4giXRgBhHwnGxuBcoR+gQWBXAEBgi2FeASCIoEMgVoeg?=
 =?us-ascii?q?Q+Ca41YSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQ3I?=
 =?us-ascii?q?xk2fIEJXoErKmEBEheBCYIKAoJwggYCAUlFDgkXCxgNSBEsNxQZBD5uB45RI?=
 =?us-ascii?q?IJLgQ4BBwwXASBfgT4NkxqSPqEPCiiDdowhlToaM6psC5h9iRyEbpZQhGmBa?=
 =?us-ascii?q?DyBRwsHcBU7gmcJShkPjjiDa4F/gxTHJicyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:u8t8fq8P+0FLL0sZTK3+DrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2QaCjqPP/2DYzfxKdBwaYi0/R4Gv8fTmIVrSVM5pS5EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbeSxxZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjtFs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kSPLZEyNktWl1c7
 KAKDB0xMwCajcOPlefTpulE3qzPLeHiOIcZ/3UlxjbDALN+GtbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cO3WjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oi3YYGFJo3QHK25mG6om
 j7a203jEytCbtWk1AS191/vqeH2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:BSr2m6oHQpuzMbylbDQlzlIaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AkRpc8mmzVHP624eRXIpnuKQY/kDXOVnc9yviHBX?=
 =?us-ascii?q?jNXRwFK+xZGPN6LpusvM7zg=3D=3D?=
X-Talos-MUID: 9a23:7qxspQmwxY6fpHGRNGAKdnpSCJt0x420GXpVy5w9pve0MAEzFDmk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="829384921"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:58:19 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id A6651180001ED;
	Thu, 20 Aug 2026 05:58:19 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 40C9CCCA79B; Wed, 19 Aug 2026 22:58:19 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH] libssh2: Fix CVE-2026-58051
Date: Wed, 19 Aug 2026 22:57:49 -0700
Message-Id: <20260820055749.1378475-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 05:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243806

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream fix for CVE-2026-58051 using the
commit in [1].
The CVE advisory [2] describes an uninitialized
publickey-list entry cleanup issue affecting libssh2
through 1.11.1.

[1] https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c6ea30b24a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58051

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libssh2/libssh2/CVE-2026-58051.patch      | 34 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
new file mode 100644
index 0000000000..68f71efe68
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
@@ -0,0 +1,34 @@
+From 8cb6cf1244e8d62175bf5df32a400f00ddadb40d Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <vszakats@users.noreply.github.com>
+Date: Mon, 29 Jun 2026 19:12:21 +0200
+Subject: [PATCH] publickey: fix potential arbitrary free in
+ `libssh2_publickey_list_fetch()` (#2127)
+
+Due to uninitialized list entry.
+
+Reported-and-patch-by: Behzod Abdullayev
+Reported-by: Sharique Raza
+
+Follow-up to e15f5d97a04cc676ce117dd324fef85b046207a9
+
+CVE: CVE-2026-58051
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c6ea30b24a]
+
+(cherry picked from commit a9758da45a52bc8c630ec9493804d0c6ea30b24a)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/publickey.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..87bc894f 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -972,6 +972,7 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey, unsigned long *num_keys,
+                     goto err_exit;
+                 }
+                 list = newlist;
++                memset(&list[keys], 0, sizeof(list[keys]));
+             }
+             if(pkey->version == 1) {
+                 unsigned long comment_len;
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 32e1ad6c16..0c939cd4d2 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2025-15661-1.patch \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \
+           file://CVE-2026-58051.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"
-- 
2.35.6


