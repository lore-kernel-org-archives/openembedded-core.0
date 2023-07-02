Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CDDEB64D9
	for <webhook@archiver.kernel.org>; Sun,  2 Jul 2023 04:12:23 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.web11.510.1688271137851148237
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 21:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=YRGSBSCB;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1360; q=dns/txt; s=iport;
  t=1688271137; x=1689480737;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ixMLhAgDie0JDYhX3N/lM1ClZBGkri2m750omv4Mypo=;
  b=YRGSBSCBTv+eMaQv4WN8JrlGJSw4WRw0RR97RomMVxIJWOcRqx+rTmBW
   1PnTGlWg5Fgj4y2OSIOA5WFw7qo2pkZErm2aI1Xgs3RTGAOpbP0hw9n4g
   1iT1IKCidNKY61Bs5u/nDen7K2a2NB6LXJnAL/gqmiDDfnXUhTAmHKR8Z
   c=;
X-IronPort-AV: E=Sophos;i="6.01,175,1684800000"; 
   d="scan'208";a="81379095"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 02 Jul 2023 04:12:17 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 3624CGxN011325
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 2 Jul 2023 04:12:16 GMT
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1812315)
	id 2E488CC1251; Sat,  1 Jul 2023 21:12:16 -0700 (PDT)
From: schitrod@cisco.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Sanjay Chitroda <schitrod@cisco.com>
Subject: [OE-core][kirkstone][PATCH] libxcrypt: fix hard-coded ".so" extension
Date: Sat,  1 Jul 2023 21:11:53 -0700
Message-Id: <20230702041153.42812-1-schitrod@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 04:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183774

From: Etienne Cordonnier <ecordonnier@snap.com>

2 issues:
- the .so extension is hard-coded, and therefore the libxcryt package compiled with
  meta-darwin is empty, because the dylib files are not contained in FILES_${PN}
- nothing actually produces a file libcrypt-*.so (the symlink file is libcrypt.so, without dash), thus
  defining FILES:${PN} manually to contain libcrypt-*.so has no effect.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ed6bfa2428b4f1ba7f09d6e9e67c462ff355153)
Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 61b0381076..454a55d73d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -17,12 +17,6 @@ SRC_URI += "file://fix_cflags_handling.patch"
 
 PROVIDES = "virtual/crypt"
 
-FILES:${PN} = "${libdir}/libcrypt*.so.* \
-               ${libdir}/libcrypt-*.so \
-               ${libdir}/libowcrypt*.so.* \
-               ${libdir}/libowcrypt-*.so \
-"
-
 S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-- 
2.35.6


