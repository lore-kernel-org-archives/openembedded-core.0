Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20053C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 09:52:28 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15584.1786614738290698540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 02:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HLeg8hZe;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1538; q=dns/txt;
  s=iport01; t=1786614738; x=1787824338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b0Z7DWa9PdpbCf1Afvu27DyvluVnxgcPT1JWEx4brxk=;
  b=HLeg8hZeYzlNyWVoA3Ruc1JlYCD1xJ4X1JFgYEIrqKjb5yGzGrTNxxFc
   OagHJYThCfF8CMo/uTiUw41fi1sfnw0d5OR9LCGgkja69ZpOP5Z9pOw+v
   qZNWri3qoHoLirh83fbeSSRWTMQiNXfU+YUXi9Bz3vbJawK11u4Jj6T+f
   kFcpCV5CHFhHppJJC+ApqU0xT3t436DxeCyDg6Kj6gDKDbB3/5GB8pobn
   DfgOzCUiVMiPyUvKWuUFq+7B2JrfpCdWw5MpH4FEykTLXJJOTYuVnJcCS
   mItExa+yDBjd0qU2e+/GAYmUJ+VreMOb3l/aMQGef28CO2scYdyPZWryd
   Q==;
X-CSE-ConnectionGUID: xZuwzbQ5SMaFm7m9nsxtCw==
X-CSE-MsgGUID: HxQ5U05NT6i6JrNH1RCJoA==
X-IPAS-Result: =?us-ascii?q?A0BIAgAgk31q/5MQJK1aHgE8DA4LgVmCV3RfQkkDlkcDn?=
 =?us-ascii?q?hsUgWoPAQEBDz0UBAEBgXEBgxMCjWgCJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWwIBAzIBGAEtECAxKysZgwIBgnQCARG/UoIsg?=
 =?us-ascii?q?QGDKAExBYEe2y8BCxQBBYEzhT+IIXaEfCcbG4FyhH6BBYMkZ4V4BIIigQyBe?=
 =?us-ascii?q?JEjSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQ2Ixk2e?=
 =?us-ascii?q?oEJXoErKmUBEheBCYIVAoJzgShhAgFJBwsYDUgRLDcUGQQ+bgeOGyCCRoECD?=
 =?us-ascii?q?CyCLByTW5F/oQ8KKIN2jCGVOhozhASmaJkIglmLMZZQhGmBaDyBWXAVgyIJS?=
 =?us-ascii?q?hkPjjiIfscmJDUCDC8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:0/ZsFaui4K94egngp5Ai8QcSEufnVDlfMUV32f8akzHdYApBsoF/q
 tZmKWiCOPmDMDOhLd8iO4u0o0kBvJDRzYNkHgZp/CFjRXsVgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/La80s21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw6tRqHnNEz
 KEjDTkja0+G1uSt0K6QVbw57igjBJGD0II3s3Vky3TdSP0hW52GGv2M7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgh/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9KoTUGJwOzx3Az
 o7A10TpO0wnbIG59WSErFC2oM+WpwjZX6tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJ4Auoz7gfLwa3S7A+dLnMBTzpMLtI83PLaXhQj0
 luP2tesDjt1vfjMETSW96yfqnW5Pi19wXI+WBLohDAtu7HLyLzfRDqVJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:ptyI0KiKfQ/dYKkXLyDoYZiPWXBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: =?us-ascii?q?9a23=3ARaE8cmsl/mzHkVupZIy9u2re6Is1QGDC3n3pfnS?=
 =?us-ascii?q?dAEhsF7jET0SA5Ih7xp8=3D?=
X-Talos-MUID: 9a23:jLDm7AnXKlJQKcvQrmqHdnpCJP413vzzLnxTkMskoe+kbBZbGTC02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,221,1779148800"; 
   d="scan'208";a="806513930"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Aug 2026 09:52:17 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 477CB1800014D;
	Thu, 13 Aug 2026 09:52:17 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id DA8BCCCA79B; Thu, 13 Aug 2026 02:52:16 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	xe-linux-external@cisco.com
Subject: [OE-core][PATCH v2] apt: mark CVE-2011-3374 as fixed-version
Date: Thu, 13 Aug 2026 02:52:16 -0700
Message-Id: <20260813095216.3146832-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <DJO5LWEY6LIE.1FJOPKM3IY664@smile.fr>
References: <DJO5LWEY6LIE.1FJOPKM3IY664@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 09:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243341

From: Devansh Patel <devanshp@cisco.com>

CVE-2011-3374 affects the legacy apt-key net-update command [1].

Upstream removed apt-key in apt 2.9.19 [2]. OE-Core uses apt 3.0.3,
so the vulnerable code is no longer present and cannot be restored by
configuration.

Mark the CVE as fixed-version.

[1] https://security-tracker.debian.org/tracker/CVE-2011-3374
[2] https://salsa.debian.org/apt-team/apt/-/commit/a00fbbdb2

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
Changes in v2:
- Use fixed-version instead of not-applicable-config because apt-key was
  removed in apt 2.9.19.
- Shorten the CVE_STATUS explanation and add supporting references.

 meta/recipes-devtools/apt/apt_3.0.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index 08b6bac2e4..7c72f489a3 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -34,6 +34,9 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
 
+# apt-key, including the vulnerable net-update path, was removed in 2.9.19.
+CVE_STATUS[CVE-2011-3374] = "fixed-version: apt-key was removed in 2.9.19"
+
 inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without
-- 
2.35.6

