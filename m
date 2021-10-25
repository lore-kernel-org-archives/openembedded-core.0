Return-Path: <dbjoyner@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F92C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 13:24:53 +0000 (UTC)
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218])
 by mx.groups.io with SMTP id smtpd.web11.31982.1635168291453779113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 06:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=Tsn8mRb0;
 spf=pass (domain: amazon.com, ip: 99.78.197.218,
 mailfrom: prvs=925fa30f5=dbjoyner@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1635168291; x=1666704291;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E9EoCd/TKC0X8PlpzL4RfUqMv7V/YSy93zOI160iIKU=;
  b=Tsn8mRb0Ep+H5gdOGtK/462vwSJK4Qw76zNEd129Wkg25MEP0wd9tym/
   3bOfYYK5/l8hGa4POdpMxCnfcKpajq3y3GYwnAA3iwEM8223XnQ+Kce2f
   fVmKEMluiXQ+ZR3q2f5KJw1EoVTesE13WVH5PDTN5b5maYFUZxf2im6zn
   w=;
X-IronPort-AV: E=Sophos;i="5.87,180,1631577600";
   d="scan'208";a="36689972"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-05e8af15.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 25 Oct 2021 13:24:41 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-pdx-2b-05e8af15.us-west-2.amazon.com (Postfix) with
 ESMTPS id A3ACAA2A2D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 13:24:41 +0000 (UTC)
Received: from EX13D03ANB003.ant.amazon.com (10.43.156.81) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.24; Mon, 25 Oct 2021 13:24:41 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D03ANB003.ant.amazon.com (10.43.156.81) with Microsoft SMTP Server (TLS)
 id 15.0.1497.24; Mon, 25 Oct 2021 13:24:39 +0000
Received: from dev-dsk-dbjoyner-2a-2a2a7571.us-west-2.amazon.com
 (172.19.60.178) by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP
 Server id 15.0.1497.24 via Frontend Transport; Mon, 25 Oct 2021 13:24:38
 +0000
From: David Joyner <dbjoyner@amazon.com>
To: <openembedded-core@lists.openembedded.org>
CC: David Joyner <dbjoyner@amazon.com>
Subject: [PATCH] rust: add support for big endian 64-bit PowerPC
Date: Mon, 25 Oct 2021 13:24:28 +0000
Message-ID: <20211025132428.9357-1-dbjoyner@amazon.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 13:24:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157337

Signed-off-by: David Joyner <dbjoyner@amazon.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 7f92602e16..ceeee97863 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -216,6 +216,14 @@ TARGET_POINTER_WIDTH[powerpc] = "32"
 TARGET_C_INT_WIDTH[powerpc] = "32"
 MAX_ATOMIC_WIDTH[powerpc] = "32"
 
+## powerpc64-unknown-linux-{gnu, musl}
+DATA_LAYOUT[powerpc64] = "E-m:e-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+LLVM_TARGET[powerpc64] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[powerpc64] = "big"
+TARGET_POINTER_WIDTH[powerpc64] = "64"
+TARGET_C_INT_WIDTH[powerpc64] = "64"
+MAX_ATOMIC_WIDTH[powerpc64] = "64"
+
 ## powerpc64le-unknown-linux-{gnu, musl}
 DATA_LAYOUT[powerpc64le] = "e-m:e-i64:64-n32:64-v256:256:256-v512:512:512"
 LLVM_TARGET[powerpc64le] = "${RUST_TARGET_SYS}"
-- 
2.32.0


