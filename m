Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630ECC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 12:12:30 +0000 (UTC)
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com [52.119.213.152])
 by mx.groups.io with SMTP id smtpd.web11.15031.1704802344498087764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 04:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=MbB9lQUZ;
 spf=pass (domain: amazon.de, ip: 52.119.213.152, mailfrom: prvs=73170cd5c=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1704802345; x=1736338345;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iEnPgSkVf1nlwH0a0zxc0eNgaCN1NNOHKNX6B6WzP1o=;
  b=MbB9lQUZbKOVqoJGx+I4+CJP1HlZEFoqCfpYvy3JLKHOXAx2U/E9WrhN
   eawcZ78MkX/OneBySQJLkQ7YDqln1VNky0Zn419v+dtDliFGVik82Sn/d
   +ttXae6hxgxMBtCBmSJ+rGvK7KUEVK4K6CQMpTGRvUctaJCs8Cexrc2Mg
   4=;
X-IronPort-AV: E=Sophos;i="6.04,182,1695686400"; 
   d="scan'208";a="630131094"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-7dc0ecf1.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 12:12:23 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
	by email-inbound-relay-iad-1e-m6i4x-7dc0ecf1.us-east-1.amazon.com (Postfix) with ESMTPS id A0C4D8062B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Jan 2024 12:12:22 +0000 (UTC)
Received: from EX19MTAEUA001.ant.amazon.com [10.0.17.79:51669]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.3.99:2525] with esmtp (Farcaster)
 id 1bca0af9-de65-4818-9f0e-d7f91492b645; Tue, 9 Jan 2024 12:12:21 +0000 (UTC)
X-Farcaster-Flow-ID: 1bca0af9-de65-4818-9f0e-d7f91492b645
Received: from EX19D016EUC001.ant.amazon.com (10.252.51.169) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 12:12:21 +0000
Received: from u182adcbddbfb55.ant.amazon.com (10.1.212.9) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 12:12:19 +0000
From: <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [PATCH] abseil-cpp: readd use of -std=c++14
Date: Tue, 9 Jan 2024 13:12:08 +0100
Message-ID: <20240109121208.170594-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.1.212.9]
X-ClientProxiedBy: EX19D041UWB001.ant.amazon.com (10.13.139.132) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 12:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193454

From: Thomas Roos <throos@amazon.de>

Protobuf is compiled with -std=c++14, so abseil-cpp must be as well.
Details can be found here: protocolbuffers/protobuf#10768

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index ee62d4b59..1a713e1c5 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -26,6 +26,7 @@ ASNEEDED:class-nativesdk = ""
 inherit cmake
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
+                 -DCMAKE_CXX_STANDARD=14 \
                  -DBUILD_TESTING=OFF    \
                  -DABSL_ENABLE_INSTALL=ON \
                 "
-- 
2.34.1




Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013094





