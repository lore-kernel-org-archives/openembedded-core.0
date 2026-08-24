Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BD5C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 17:07:26 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2556.1787591238301296386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 10:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iyGSk/wv;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1954; q=dns/txt;
  s=iport01; t=1787591238; x=1788800838;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fua1B0xC9gQNKfNApfxaL1UxbwcliAINVf0pyUDFV+A=;
  b=iyGSk/wv9bVJOWqfKl3cidQuNthmaWzd3dlNW//yTKg7UIMD58yRwCpN
   81EEBPK1UO/LIJoQHnGRECfDvx4DuC88api13tDTojAD1u5kI8s0vJ69P
   NZ7h3MGXjB8Ba0U0QsBarH0JCR6NjY08/obBSqTjC84dBl84PpBycQQ8b
   qTdZnQD0zFSbLLZMlzrrYrosZf071AAOHCV3rBHRUic0Qe/Z8Cw+L8g1A
   tG3KVNVDr+CqrfP3HL5n3kerfOtkE4Pdxm7sYT+zNpzSHL6sHQhTVsD4B
   oBo7y4mrwhwtzcD/FmBiOUe1sC5gJP2M1ueY1Tn9lPOF4cClbD9lQH64W
   Q==;
X-CSE-ConnectionGUID: VnG9SZ2xSPG1/5Pet/Bn1Q==
X-CSE-MsgGUID: nOqARnfRQOCssyizdUar/A==
X-IPAS-Result: =?us-ascii?q?A0BDAgD3eYxq/44QJK1RCYJZgleBUkNJlV5sA54bgX4PA?=
 =?us-ascii?q?QEBD1EEAQGFBQKNbAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZchlsCAQMyAUYQIDErKxmDAoJ1A75AgiyBAYR92zABCxQBBYEzhT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6EF3mFeASCIoEMgX1LKIhEiCFIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCB?=
 =?us-ascii?q?QIBSUMOB0ciCxgNSBEsNxQZBD5uB45dH4FZc1g2AYIYk1Boj1yCIaEPCiiDd?=
 =?us-ascii?q?qFcGjOqbC6YWqRahGmBaDyBWXAVO4JnUxkPji4V0BknMj8HAgcPApNxAQE?=
IronPort-Data: A9a23:b/Cgu69y0wOGpO0iO9CEDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mMaDW3XOqyONzCgKNAga4Xio0JTuZ/Xx9NlQAtsrn1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjhIs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kIO6JJwdQtEVp22
 qVfdQgAclepgbuPlefTpulE3qzPLeHiOIcZ/3UlxjbDALN+HNbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cOXWjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZC9aYWMJ4LUHZg9ckCwo
 EXf1l7/DCsjE/eE0iuE4H6Rj/WItHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBWy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rNq994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:GIV/Q6g79MbhKvbgnerJEF/qgXBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: 9a23:0hPPNWEXZzYjEy+9qmJZ8mFFIfJ/Ykbl4y6Xfne1FSFDTuSsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A+w4ytw2YjxSi4725abEiNvzwqDUj5YO3IXoLn68?=
 =?us-ascii?q?/nOKfLj1xKTughS7wa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,241,1779148800"; 
   d="scan'208";a="817156605"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 17:07:12 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 95AA518000221;
	Mon, 24 Aug 2026 17:07:12 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 33DB8CC12A6; Mon, 24 Aug 2026 10:07:12 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH v2] u-boot: share CVE_PRODUCT with u-boot-tools
Date: Mon, 24 Aug 2026 10:07:12 -0700
Message-Id: <20260824170712.64140-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260824110158.26007-1-devanshp@cisco.com>
References: <20260824110158.26007-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 17:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244143

From: Devansh Patel <devanshp@cisco.com>

u-boot-tools builds host utilities from the same source as u-boot, but it
does not inherit the existing CVE_PRODUCT assignment and falls back to its
unrecognized recipe-name identity.  Move the mapping to u-boot-common.inc
so both recipes inherit it.

Use "u-boot:u-boot" for the CNA/CVE List V5 affected-data identity and
"denx:u-boot" for the NVD dictionary CPE and configuration identity.  The
CNA records are also covered by NVD today, but retaining both authoritative
identities permits direct matching independently of NVD enrichment.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 2 ++
 meta/recipes-bsp/u-boot/u-boot.inc        | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index d82d42cbce..86c4fed2bc 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -10,6 +10,8 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
 PE = "1"
 
+CVE_PRODUCT = "u-boot:u-boot denx:u-boot"
+
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
 SRCREV = "ece349ade2973e220f524ce59e59711cc919263f"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 2197039dbc..b9f61a185c 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -21,8 +21,6 @@ PACKAGECONFIG ??= "openssl"
 # a host build dependency.
 PACKAGECONFIG[openssl] = ",,openssl-native"
 
-CVE_PRODUCT = "denx:u-boot"
-
 # Allow setting an additional version string that will be picked up by the
 # u-boot build system and appended to the u-boot version.  If the .scmversion
 # file already exists it will not be overwritten.
-- 
2.35.6


