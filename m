Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33A7CD98CF
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:50:12 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16558.1781085006813116994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MgmDWafu;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781085007; x=1812621007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1yjlR6h6cbqJdLAiUn8Pw+cTbsCrLHoCr+3DNhSx8OM=;
  b=MgmDWafutOIC4TEjz9/WxVxoRbf9aDJpOEMve3ZfI9pYtLio8sZqG+6L
   9Qi6nK8RyzVXiXrs6lj+UHoe5OsdBRpfqFG9qXqQMbbQXWUZ7fPELt5Gi
   u7DEz3lxlggeeRYRJYYLjy6YodTzJi5adig+V9Z3LdaP4KVCZX6uPZfE+
   b0oijjp+P/IvhIvzb0dpCJm1Kb3FLWhd2oBAIR9015IBNYeru35Kap3yX
   XSayIp9KATU3bwSkrJ9MNv8qYZ1KojPrq3DbsiCrbgqZ+oX0nr5CaOFOE
   DX5gsx6v9sM667f11M+VSQJ1PFqz2Wz0u4HiyuYygLo/nLVt0E3U6wovB
   g==;
X-CSE-ConnectionGUID: k6B4YSKoSKewny9dyAQYBw==
X-CSE-MsgGUID: 9J4HQygESlSU/3cHToOPfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="231035415"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="231035415"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:50:05 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 530FA1000343
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:05 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id F007C18ABD17
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0F191140027A;
	Wed, 10 Jun 2026 09:50:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/16] gpgme: upgrade 2.0.1 -> 2.1.0
Date: Wed, 10 Jun 2026 17:49:26 +0800
Message-ID: <20260610094932.2264-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238336

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * New flags "is_de_vs" and "beta_compliance" for encryption results.
 * New decryption flag GPGME_DECRYPT_SESSION_HASH and new field
   session_hash in gpgme_decrypt_result_t.  For details see the gpg
   option --show-session-key.
 * Setting of attributes for CMS signatures is now supported via
   gpgme_sig_notation_add.
 * New context flag "export-filter".
 * Extend the internal gpgsm_assuan_simple_command to consume all
   received lines.  This fixes a possible lockup introduced by the
   fix for T7759.
 * Fix passphrase cancel handling.
 * Fix a regression wrt the auto-key-locate option.
 * Handle the case when pinentry is invoked multiple times.
 * Don't cap ISO dates beyond year 2037 on Windows.
 * Treat empty DISPLAY envvar as unset.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/gpgme/{gpgme_2.0.1.bb => gpgme_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gpgme/{gpgme_2.0.1.bb => gpgme_2.1.0.bb} (96%)

diff --git a/meta/recipes-support/gpgme/gpgme_2.0.1.bb b/meta/recipes-support/gpgme/gpgme_2.1.0.bb
similarity index 96%
rename from meta/recipes-support/gpgme/gpgme_2.0.1.bb
rename to meta/recipes-support/gpgme/gpgme_2.1.0.bb
index ae20f785e6..269070b10b 100644
--- a/meta/recipes-support/gpgme/gpgme_2.0.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.1.0.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "821ab0695c842eab51752a81980c92b0410c7eadd04103f791d5d2a526784966"
+SRC_URI[sha256sum] = "841c5ea53fc26259f4fbf0e8bde982dea1b8a1ca0cb77e681c82b050566bf92b"
 
 DEPENDS = "libgpg-error-native libgpg-error libassuan"
 
-- 
2.43.0


