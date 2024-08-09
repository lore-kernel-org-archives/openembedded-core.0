Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795DEC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 06:02:13 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.web10.78216.1723183323640950676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 23:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=geVtqfzV;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=896; q=dns/txt; s=iport;
  t=1723183323; x=1724392923;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nvvyUgV7qMNuLRDyCOFexsyByhHaoqS7ZdiVp7UuIMk=;
  b=geVtqfzV3bshSqvBb2XZYjqY1GN6gQMjNW/Btf9SS/i4DNKkBzTKi1nA
   Y/vl2KrqaynKh5evY9EusJ7cV5kROcVT6Clmye+SAtQJapdOnGvW9owjn
   ZFzTjIkbdN64qw2mbBDBqAZrrwMBnplNSvqM+E9uV5JVS1ONlopRJDA3U
   A=;
X-CSE-ConnectionGUID: e4r/0zu+R9yn017At9TWdA==
X-CSE-MsgGUID: Chwd+vq1SVWPj7TNJQiOAQ==
X-IronPort-AV: E=Sophos;i="6.09,275,1716249600"; 
   d="scan'208";a="231449663"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 06:02:03 +0000
Received: from sjc-ads-10099.cisco.com (sjc-ads-10099.cisco.com [10.30.210.103])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 479622bf005489
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 9 Aug 2024 06:02:02 GMT
Received: by sjc-ads-10099.cisco.com (Postfix, from userid 1847788)
	id 0BF17CC1282; Thu,  8 Aug 2024 23:02:02 -0700 (PDT)
From: Het Patel <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Het Patel <hetpat@cisco.com>
Subject: [master] [PATCH v2] zlib: Add CVE_PRODUCT to exclude false positives
Date: Thu,  8 Aug 2024 22:57:00 -0700
Message-Id: <20240809055700.3231161-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.30.210.103, sjc-ads-10099.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 06:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203150

To avoid false positives (such as CVE-2023-6992, cloudflare:zlib), add a
CVE_PRODUCT to identify the vendors that have been used.

Removing the present existing CVE_STATUS for CVE-2023-6992.

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/zlib/zlib_1.3.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index e6a81ef789..486431dfff 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -47,4 +47,6 @@ do_install_ptest() {
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2023-45853] = "not-applicable-config: we don't build minizip"
-CVE_STATUS[CVE-2023-6992] = "cpe-incorrect: this CVE is for cloudflare zlib"
+
+# Adding 'CVE_PRODUCT' to avoid false detection of CVEs
+CVE_PRODUCT = "zlib:zlib gnu:zlib"

