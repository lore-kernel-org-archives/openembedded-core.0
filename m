Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4DECD5BC9
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 02:07:14 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2360.1779934029258225282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 19:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fMiKAEZp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779934029; x=1811470029;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5RPVOIZLSWOIq4KJdPoroFQBBLaMqdn+x2ZeUMugW/c=;
  b=fMiKAEZpnMQ6rjZvii/keAIl4T0/9YwFlBWd+pIO0IRW7oD3uBQS1N8b
   5THFRRseAiCyWTdxVYwu5u4AqZJsDhPoo4Fby+45s+bn9AyP/MUL7bVoY
   DDux807X5L0nVGJt7JbgRGK90GPz85Bc1VzbGsTPC3XdD1/HyrNrhUVxW
   sMfMMe2H4PCi0XQHoSsISliujbiWQiavbuAg0s0oZ3H0hunWTOMlo71PY
   BTa2okvqB2BEsVTOLOW+XCwxe0eQF76xv5251w74WluGLV7gYtXq81YSU
   L+yyEjcL0c+Ids+3fk6dMnGoZeqgCnzFXFvefxCnUBZOllVKNIqu9BnuE
   w==;
X-CSE-ConnectionGUID: jWVCJULxSMSz4yv/9xC9Sg==
X-CSE-MsgGUID: AyMMJX/1T2OET96UT8X9cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="242041212"
X-IronPort-AV: E=Sophos;i="6.24,172,1774278000"; 
   d="scan'208";a="242041212"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 11:07:07 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 61D14C0035D
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 02:07:07 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 1C729C000BA
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 02:07:07 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 74B014045C8
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 02:07:05 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Date: Thu, 28 May 2026 10:06:58 +0800
Message-ID: <20260528020658.789-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 02:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237679

When vim-tiny was used in image, it lacks defaults.vim file which will cause following error
root@qemux86-64:~# vi
E1187: Failed to source defaults.vim
Press ENTER or type command to continue

So add vim-common as RDEPENDS to provide defaults.vim file to fix this issue.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-support/vim/vim-tiny_9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim-tiny_9.2.bb b/meta/recipes-support/vim/vim-tiny_9.2.bb
index e4c26d23f6..b6ddded381 100644
--- a/meta/recipes-support/vim/vim-tiny_9.2.bb
+++ b/meta/recipes-support/vim/vim-tiny_9.2.bb
@@ -8,5 +8,7 @@ do_install() {
     install -D -m 0755 ${S}/src/vim ${D}/${bindir}/vim.tiny
 }
 
+RDEPENDS:${PN} += "vim-common"
+
 ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
-- 
2.43.0


