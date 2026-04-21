Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE3BF8922B
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:43 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20398.1776765402563688773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pc6Fsydl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765402; x=1808301402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hofOsbKOcUdzQXi6GncQLw1Iq++VjUFLqUKcALmZNZc=;
  b=pc6FsydlfXITtNuY40E5zOG+Qd1taKy8K9iQlcJuXjb6gjNt3D/DYtHy
   zeCePuhmx5/x8ZZUrhDWERgr0O6hfk8+UDuVex/8aFM+QXJWB2PDKwl2J
   gGjdNzc7Mol5NbaDLESFqZM7X7T6XYO0mZUwPTWTvEfesud8qvdXPtwaV
   EUpRd/bj/asXOwYfUpX3+Z8FbPDMDpLh+cgu1EXRR0SNuJiZIo8t4qT+Z
   aKWSuW+IjcN/oISebd+xIk2ES85foI4IuqlzAzBgiCpht/JJcc1Hoqhwx
   1clOxqLu/e7tEiSu1f/jskT4xS9rUKaTxCYFme2ijXup1C95hTnkO10/J
   A==;
X-CSE-ConnectionGUID: uHTWDKIfTm2cDKV7dn4zDQ==
X-CSE-MsgGUID: rKmiP7WJTxq7vUaRr1nWUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="225608217"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="225608217"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:41 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 01333820C07
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:41 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id AF8FE140037B
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5147214000E6;
	Tue, 21 Apr 2026 09:56:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/49] lzip: upgrade 1.25 -> 1.26
Date: Tue, 21 Apr 2026 17:55:28 +0800
Message-ID: <20260421095559.1856-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235626

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- '-dvv' and '-tvv' now print (de)compressed sizes instead of compression
  ratio. (Sizes are more informative than compression ratio).
- Large numbers in option arguments are now accepted with underscore
  separators (-s 123_456_789).
- Large numbers are now printed with underscore separators (123_456_789).
- '-h' now prints a short help screen containing only the command-line
  options. For full help, use '--help'.
- '--list' now can safely skip any trailing data added to a lzip file by the
  option '--append' of lziprecover.
- '--list' now prints '+t' after the number of members to indicate the
  presence of trailing data, and prints the size of the trailing data below
  the size of the last member.
- '-lvv' now prints a blank line between the list of members of each
  multimember file and the next file.
- Several improvements suggested by John Gilmore have been made to the manual.
- 'EXIT STATUS' now has its own section in the man page.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/lzip/{lzip_1.25.bb => lzip_1.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzip_1.25.bb => lzip_1.26.bb} (93%)

diff --git a/meta/recipes-extended/lzip/lzip_1.25.bb b/meta/recipes-extended/lzip/lzip_1.26.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzip_1.25.bb
rename to meta/recipes-extended/lzip/lzip_1.26.bb
index 590e35cb75..c087d2ee2e 100644
--- a/meta/recipes-extended/lzip/lzip_1.25.bb
+++ b/meta/recipes-extended/lzip/lzip_1.26.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[sha256sum] = "09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f"
+SRC_URI[sha256sum] = "641cf30961525cbe3b340cc883436c8854e9f5032f459f444de4782b621e6572"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.43.0


