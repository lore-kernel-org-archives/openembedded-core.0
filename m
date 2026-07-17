Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5757EC44512
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 01:33:04 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4726.1784251979718728063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 18:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BRjTKseT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784251979; x=1815787979;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ttiqvg4k3zc+zbD2SA+A8SHajnQuNcFUscNMVL+yIBo=;
  b=BRjTKseTJOguf9AS72cB9AcQZojjbKKeu4ZjWuhjthV4jXSgKRLEWCiU
   juU+GqIDqVugKkwV80uZkRmHva/rj8FLqDztrNzC2h//UC+z0AlfB+cef
   IS0jlpB/5ArEuKD9jfI35vdtxta5lINCydcAYGRG++4MM0k5daHw7oazf
   IYuFSBqide0nnZbpwZQ8NfFK25dQ0wnQk7im414Fr7Hs116ZVNqQJBFMo
   VAVUoMHxKLN6zwr5CKMkh7n6dY6U981KgHqvO6A7CVSLFe1tWpjRTC+gF
   vncnGY85MSaD9B0rbEmsIauI94JgH5pcP28UgTWdV6WeBvv2s3VqC6OLC
   g==;
X-CSE-ConnectionGUID: qQkudhvbSZyTO6woqwIoBg==
X-CSE-MsgGUID: HHFui8JhT7mqKHvqVN5aXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="247172517"
X-IronPort-AV: E=Sophos;i="6.25,168,1779116400"; 
   d="scan'208";a="247172517"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 10:32:57 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B9D4926E1
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 01:32:57 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6C6C0C03408
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 01:32:57 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id B47BE18005F8
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 01:32:55 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] vim-tiny: bugfix for enabling vim for vim-tiny
Date: Fri, 17 Jul 2026 09:32:49 +0800
Message-ID: <20260717013249.660-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 01:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241111

When vim-tiny was individually installed, link of vim will point to /usr/bin/vim.tiny
which causes "lack of defaults.vim" error

root@qemux86-64:~# ls -alh /bin/vim
lrwxrwxrwx 1 root root 17 Apr  5  2011 /bin/vim -> /usr/bin/vim.tiny

root@qemux86-64:~# vim
E1187: Failed to source defaults.vim
root@qemux86-64:~# ls -alh /bin/vim

In this situation, the link of vim should not be created, so fix it.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-support/vim/vim-tiny_9.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/vim/vim-tiny_9.2.bb b/meta/recipes-support/vim/vim-tiny_9.2.bb
index 658f627d7d..1d66491433 100644
--- a/meta/recipes-support/vim/vim-tiny_9.2.bb
+++ b/meta/recipes-support/vim/vim-tiny_9.2.bb
@@ -10,5 +10,6 @@ do_install() {
     install -D -m 0755 ${S}/src/vim ${D}/${bindir}/vim.tiny
 }
 
+ALTERNATIVE:${PN} = "vi"
 ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
-- 
2.43.0


