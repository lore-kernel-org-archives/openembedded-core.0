Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7669FC79F80
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:00:16 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9551.1788512409467513020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AsWBitar;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2549; q=dns/txt;
  s=iport01; t=1788512409; x=1789722009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WQ+zhD2gY3WpVH9AGJdkg9jpvMtHksufSlMBAkDW2UM=;
  b=AsWBitar8i7CJkE0QrW/nCA6spjKSPtFQ2/9vnq+7YSi/SKe8RZVMPo9
   qP35M/6PWMwwVdIbQFsBAP5cmWCDEGFiL5KPgSHaodIfi6Gx/zQGKyCJ2
   EuYX0kZXE6RKhBIxSa3YnGsjpmcBJM+KGOhpiolhLWAVpQSH003O3FB4I
   oLSyIvTLVOFCC9QGDBUO7m1uS8xvGUkPCmVQv/v4IqroAaPtE35b9qwYb
   obKjziqScCr8+sla1tjoAidZS9ZG3QrEMzpj3Nr39sf4z05ku0DtP+9FZ
   gGJUuDiF3c83OG8TOuzzIeQb5YXcNX053xMUlto9Tnb2uNBK2ui0Iiaft
   g==;
X-CSE-ConnectionGUID: HaEvECuTTP+7QCPLeWyxZw==
X-CSE-MsgGUID: CknB5uzOTGehlQ7zUWbWRQ==
X-IPAS-Result: =?us-ascii?q?A0AnAABwh5pq/5IQJK1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0YENJjHKJWAOeG4F+DwEBAQ9EDQQBAYUFAo4CAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NkBkBAgEDMgEYAS0QHAMBAi8rIwgZg?=
 =?us-ascii?q?wIBgnQDEQbCOIIsgQGDKAE/AgJAAVDbMQELFAEFgTMBhT6IIl0YAYR8Jxsbg?=
 =?us-ascii?q?XKEfoEFgVwCAYIshXgEgiKBDIFakg1IgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQcbBgWBHYEngz8jGTZ6gQlegSspYAESF4EJgggCglSCAwIBSUMOB?=
 =?us-ascii?q?0dTCSdBBAsYDUgRLDcVGQQ+bgeOXx+CSQdhLQEpAn+BPg2lWKEPCiiDdowil?=
 =?us-ascii?q?ToaM6ptmQiOCpVzXYRpgWg8gVlwFYMiCRY0GQ+OOYNrhkDFeScyAgkyAQEHA?=
 =?us-ascii?q?gcOAwuBaJF+AQE?=
IronPort-Data: A9a23:2JqAB6v/Z3VjuBzEQSYb8sHJxufnVABfMUV32f8akzHdYApBsoF/q
 tZmKTqFbP7ZZTP8et9/bNiy/UpU6pCGmN5hGgA/rXwyRioUgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/Pb80sz1BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw2u9aH0xl6
 MAkEHNSVzu7o++J0aKJVbw57igjBJGD0II3s3Vky3TdSP0hW52GG/SM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgl/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9KobbHpwIxR7Bz
 o7A10/6BDtHKc649RWI8naV2f3yoinEYrtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFm8HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn288Vte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:AYenza22MHGAHxer1SEO2wqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: 9a23:dxX7r27KxNClMQTQpNss1Ec5BO0Ob0Hh9DSPGmSALWtWWa2nVgrF
X-Talos-MUID: 9a23:+9Oz8QrTK+Uc7CM/+fUezxphMu01/raJNG8AkZE/5Nu5CiZPAQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,260,1779148800"; 
   d="scan'208";a="829315301"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 09:00:08 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 69DB51800014B;
	Fri,  4 Sep 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 09218CC124A; Fri,  4 Sep 2026 02:00:08 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 5/6] curl: Fix CVE-2026-9547
Date: Fri,  4 Sep 2026 02:00:06 -0700
Message-Id: <20260904090007.27374-5-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260904090007.27374-1-devanshp@cisco.com>
References: <20260904090007.27374-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245077

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1]. Backporting it also protects downstream
configurations that enable the libssh backend.

[1] https://github.com/curl/curl/commit/0b8dbbc63c98777e4584cb9fbd71df3464008ad1
[2] https://curl.se/docs/CVE-2026-9547.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-9547.patch             | 33 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-9547.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-9547.patch b/meta/recipes-support/curl/curl/CVE-2026-9547.patch
new file mode 100644
index 0000000000..992ed21e4c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-9547.patch
@@ -0,0 +1,33 @@
+From 3f73b2318b9e6358e33519fa49dc3e022aa28c41 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <MegaManSec@users.noreply.github.com>
+Date: Fri, 22 May 2026 09:48:15 +0200
+Subject: [PATCH] libssh: map SSH_KNOWN_HOSTS_OTHER to CURLKHMATCH_MISMATCH
+
+Host key type mismatch from libssh was incorrectly reported as missing,
+causing key callbacks to accept instead of reject.
+
+Reported by: Joshua Rogers (Aisle Research)
+Closes #21724
+
+CVE: CVE-2026-9547
+Upstream-Status: Backport [https://github.com/curl/curl/commit/0b8dbbc63c98777e4584cb9fbd71df3464008ad1]
+
+(cherry picked from commit 0b8dbbc63c98777e4584cb9fbd71df3464008ad1)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/vssh/libssh.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/vssh/libssh.c b/lib/vssh/libssh.c
+index 39067a1db6..00dae896bb 100644
+--- a/lib/vssh/libssh.c
++++ b/lib/vssh/libssh.c
+@@ -439,6 +439,8 @@ static int myssh_is_known(struct Curl_easy *data)
+       keymatch = CURLKHMATCH_OK;
+       break;
+     case SSH_KNOWN_HOSTS_OTHER:
++      keymatch = CURLKHMATCH_MISMATCH;
++      break;
+     case SSH_KNOWN_HOSTS_NOT_FOUND:
+     case SSH_KNOWN_HOSTS_UNKNOWN:
+     case SSH_KNOWN_HOSTS_ERROR:
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6a2c44365b..e9ba10cb97 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -46,6 +46,7 @@ SRC_URI = " \
     file://CVE-2026-8927-dependent.patch \
     file://CVE-2026-8927.patch \
     file://CVE-2026-8932.patch \
+    file://CVE-2026-9547.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


