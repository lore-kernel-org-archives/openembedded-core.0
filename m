Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8103FCD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 17:48:56 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3350.1778694527867808713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 10:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bLVk1uUP;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2020; q=dns/txt;
  s=iport01; t=1778694527; x=1779904127;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mRkBXOU7MuV7ESFs3iJb493YTW3SsPIJI1IQ5LvoqU8=;
  b=bLVk1uUPZJ159ePq4EWlbX2Q/9eHmeP8xxWNRX6JCXwvXF32H05DcUZI
   jkinVv/Cgdzwy40ofY3i5IN5n5uA8EVnLvxhSORE/877Ad43cM7mzOy4T
   mnEWkavCMvpCoS5mO6Xb9zyPFTkB+XbPS/928UAhaFIiAjinHm1OPDtHu
   /FcxFevBGLRJblXLVOQwnT55oj9KeyCDJ0EXiMxip2vzx2z4K8H90rYvP
   sG0I6eV9wtp/gwKwrQ8RCrLJcS7yqHQQEKhF5iK/36vpe83oJ8uZs3L2G
   X4lWc4KMd4uN4oeZRZjOzteinqRW2P9trarQ/LJ+JemG5V+oMjwWyfv6/
   A==;
X-CSE-ConnectionGUID: Fl3k5fxbRj6BVZxdL684rg==
X-CSE-MsgGUID: 0Zl6mX1bSeaPK+Y1MxMDCA==
X-IPAS-Result: =?us-ascii?q?A0BDAgDCuARq/4v/Ja1aglmCV3JfQkmEV49TgiGeHYF/D?=
 =?us-ascii?q?wEBAQ9EDQQBAZI6AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhwQPARgBXQUCJgItOwmDAgGCcwIBEbJ7eoEygQGDKAGBVNsoAQsUA?=
 =?us-ascii?q?YEKLoU/gxoBhQJzAYR7JxsbgXKEBwdvgQWBXAKCLYMOgmkEgzCBe40NSIECH?=
 =?us-ascii?q?AMpMCwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XM1gbBwWBS4IFcmqBAoRfeCMsA?=
 =?us-ascii?q?06BLjIDCxgNSBEsNxQbBD0BbgeKTB0PgysTASsaBoFdLxGTX5IEgTWfWQoog?=
 =?us-ascii?q?3SMHpU6GjOFW6UQC4gukE2LNoJTlWhohGiBaDxGgRNwFYMiCUoZD444J4NEy?=
 =?us-ascii?q?DQkNQIJMgEBBwIHAQsBAwuBaJF9AQE?=
IronPort-Data: A9a23:KqX6X6IKhFfKfVnUFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS0DQHy
 mFJWGGOOKzeZDb1Ld0kaNi1oEwG7ZfQxt9mGwsd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9hmcvajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1ACBo1YIMI8Nx1X0twx
 +wUDG5dMgqM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBV7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Wojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZj+O9YYuOKozbLSlTth6qo
 jzDzz3zORwTDP/c+GOg4leArcaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1zfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:91kx8KgHKLgmOIFooLSXdxgSfnBQXuwji2hC6mlwRA09TyX+rb
 HKoB17726XtN9/Yh8dcLy7VZVoIkmslqKdg7NxAV7KZmCP0wGVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: 9a23:0/jiUG1l1ckBnXMN4v8/Y7xfNMR+cSDT3H3qIRGSN1R5RJnLGQOK9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AKbJvUw2yPGuB6kv8qMTsoACdoDUju5aqVkU9yJ8?=
 =?us-ascii?q?9tsC8Fm9BYhKNqRica9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,233,1770595200"; 
   d="scan'208";a="738993889"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 May 2026 17:48:46 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id B0C24180007DC
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 17:48:46 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 56C24CF99DB; Wed, 13 May 2026 10:48:46 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] lz4: Remove a reference to the rejected CVE-2025-62813
Date: Wed, 13 May 2026 10:48:14 -0700
Message-ID: <20260513174820.595698-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 17:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237000

From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>

The CVE-2025-62813 is rejected so do not reference it anymore.
So keep the patch but without referencing the CVE identifier.

The CVE database indicates the following reason:
  This candidate was withdrawn by its CNA. Further investigation
  showed that it was not a security issue.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c840a69b62a5fdffb3679a44d68dd5630b2916c)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-support/lz4/files/CVE-2025-62813.patch b/meta/recipes-support/lz4/files/fix-null-error-handling.patch
similarity index 99%
rename from meta/recipes-support/lz4/files/CVE-2025-62813.patch
rename to meta/recipes-support/lz4/files/fix-null-error-handling.patch
index bbd0f74541..1401936034 100644
--- a/meta/recipes-support/lz4/files/CVE-2025-62813.patch
+++ b/meta/recipes-support/lz4/files/fix-null-error-handling.patch
@@ -8,7 +8,6 @@ Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
 Upstream-Status: Backport [Upstream commit https://github.com/lz4/lz4/commit/f64efec011c058bd70348576438abac222fe6c82]
-CVE: CVE-2025-62813
 
 Signed-off-by: David Nyström <david.nystrom@est.tech>
 ---
diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-support/lz4/lz4_1.9.4.bb
index 8c96f9bab4..a8ce3cec09 100644
--- a/meta/recipes-support/lz4/lz4_1.9.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.4.bb
@@ -14,8 +14,8 @@ SRCREV = "5ff839680134437dbf4678f3d0c7b371d84f4964"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
            file://run-ptest \
-           file://CVE-2025-62813.patch \
-           "
+           file://fix-null-error-handling.patch \
+"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-- 
2.35.6


