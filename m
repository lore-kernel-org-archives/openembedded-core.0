Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D36D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 07:00:08 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10633.1764313199798567337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 23:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TQWoDc6a;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764313199; x=1795849199;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CbMLmm78sZttcoR0rQyaguig4JnKGmc0IL8PUqnH/bU=;
  b=TQWoDc6av4/BU3qh2q+x7tPdoyukpyxEcojCxypwt5Ng6stb01gy9FNI
   J0JX6cuYsqXRixbcVDgbM/e1ai4yGOF/k1RIMwIs3pWKwmhKy2yMZLMb9
   dHbdCk/E70sxQJuku66bCCyk3xQMUPhlQT7tife35GfUfGa4Ia2q/80y4
   mHiR3i0c7WPa9KZvN1iLbnfVewqozr0oAMiG1defznYYN0kQnk5XULa9R
   tJpbcmM0fo1DjrSjh1C0SyjWrQA/k1tK23zyPLHofuuHnytLiCFUlVCFq
   D0d+H2cHbew9mbg5Sc1TsFSp9kYior+OfB5CdfSx3JbWxqvPA3WiCIzHu
   Q==;
X-CSE-ConnectionGUID: 8haBkW0vRu2oSPF2My1T1g==
X-CSE-MsgGUID: a2q/SfM3Q0qY76EIBYvwIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="208729193"
X-IronPort-AV: E=Sophos;i="6.20,232,1758553200"; 
   d="scan'208";a="208729193"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 15:59:57 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id CFF9D82071A
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:59:57 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 85D6D896E3D
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:59:57 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 518D12004FBA
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:59:55 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] gnutls: fix postinst script for ${PN}-fips for multilibs
Date: Fri, 28 Nov 2025 14:59:49 +0800
Message-ID: <20251128065949.7462-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 07:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226899

When enabling multilibs,the mkdir command will be failed which will cause subsequent command not being executed.
So append "-p" parameter.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
index 2ef71a1213..56a84f76f0 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -90,7 +90,7 @@ BBCLASSEXTEND = "native nativesdk"
 pkg_postinst_ontarget:${PN}-fips () {
     if test -x ${bindir}/fipshmac
     then
-        mkdir ${sysconfdir}/gnutls
+        mkdir -p ${sysconfdir}/gnutls
         touch ${sysconfdir}/gnutls/config
         ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* > ${libdir}/.libgnutls.so.30.hmac
         ${bindir}/fipshmac ${libdir}/libnettle.so.8.* > ${libdir}/.libnettle.so.8.hmac
-- 
2.43.0


