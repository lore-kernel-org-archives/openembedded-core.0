Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3450AC3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 09:23:14 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.9262.1747387388280555352
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 02:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JWcpaJUb;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747387387; x=1778923387;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NrK4LIExeRl5ivlH1Mwx83NcjyJluq5IRAQVUU0ugYs=;
  b=JWcpaJUbtmyqT0HbRwsxv477BPsMo8ceOWCuoMo/cXu9wqX92ZHzDf2f
   A/3FLmgLVRxCtawW/ue+6K2ye1mW1Q+3wXYenhtd8QLqIos4+h7VrjVZH
   3oSCRSL7Y/SWXhlYrbvHo7AzRruHFhV5uAQDTm+oFOgA/gaAVyUhq4JXZ
   g+RsmDDgTVjDAdgxc6wKWrS6XbUgB6QhQWE+LGyjQVSOzaPdr1BpCnRCC
   bNiS9hD2welM8e9kC9xD8roTyiEceEzCuE5A3ip8ifRjxIkjpgXimFj7g
   r4es+RyafKoNPfHZP2Zqa7tqwzeKCAZoR0DLEkuUwa5QaPonce1OzEWVq
   g==;
X-CSE-ConnectionGUID: sm57PdFMTbupMorNIZNtrw==
X-CSE-MsgGUID: aCqykDAHTTiYnwoiWTVDmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="188078366"
X-IronPort-AV: E=Sophos;i="6.15,293,1739804400"; 
   d="scan'208";a="188078366"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 18:23:05 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DEF89C68A2
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 18:23:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 99082D9730
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 18:23:02 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C17721A0078;
	Fri, 16 May 2025 17:23:01 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH v2] libunwind: fix multilib conflict
Date: Fri, 16 May 2025 17:22:38 +0800
Message-ID: <20250516092238.1182-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 09:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216727

fix issue that
| Error: Transaction test error:
|   file /usr/libexec/libunwind/check-namespace.sh conflicts between attempted installs of libunwind-1.8.1-r0.core2_64 and lib32-libunwind-1.8.1-r0.core2_32
|   file /usr/libexec/libunwind/test-runner conflicts between attempted installs of libunwind-1.8.1-r0.core2_64 and lib32-libunwind-1.8.1-r0.core2_32

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-support/libunwind/libunwind_1.8.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libunwind/libunwind_1.8.1.bb b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
index 68d7a98ee4..e8c5a3d474 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
 
 SRC_URI[sha256sum] = "ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006c33e6df79e6a6157"
 
-inherit autotools multilib_header github-releases
+inherit autotools multilib_header github-releases multilib_script
 
 COMPATIBLE_HOST:riscv32 = "null"
 
@@ -30,6 +30,9 @@ PACKAGECONFIG[latexdocs] = "--enable-documentation, --disable-documentation, lat
 
 EXTRA_OECONF = "--enable-static"
 
+MULTILIB_SCRIPTS = "${PN}:${libexecdir}/libunwind/check-namespace.sh \
+                    ${PN}:${libexecdir}/libunwind/test-runner"
+
 # http://errors.yoctoproject.org/Errors/Details/20487/
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.43.0


