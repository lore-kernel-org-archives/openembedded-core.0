Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9714DD41D78
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.82720.1731403501519628021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o9mHX4b4;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403502; x=1762939502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pz2ihFpmnOYlIN+Xhu8V6//ggaGEm4HHoZTFvfNgVU8=;
  b=o9mHX4b4L/3hIrAm7eY7BdUb8K4Q2moo3fKtDaWfd7JPB8ApvpwD9Eb+
   i+DIyojzDOorZGuEcpqEPpLykWEJRAXsvaCrNpJACFSXl86ke009dQ8Ti
   sVfNHBHqjaYlXit0RdxNDYu5GZVm44/C4/NcT3lzPs+jABk7JgnoE8Sfn
   MNASFOI5VFbd6g5eYULPTRLzGmIs2/b0dwjU3FvnY/qhwUX14k4VJmZFk
   bKvxqxBu8WtnZbiOamGfw0bgqOsK0wr489c78BP+5KnVuLuo8SniA9t3I
   FF0HbelXehXvs8ljKmpsydmtSPFm9qHSeAbp29QgGFRoBo0MccNZKqQh/
   w==;
X-CSE-ConnectionGUID: asGA9HjrR7CkAqDLD0zA9g==
X-CSE-MsgGUID: DIaLA5yiSumM1fihh3YXvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="158940827"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="158940827"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:01 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D778E3E0F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E28D628CD9
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 76F7E20071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 261291A000A;
	Tue, 12 Nov 2024 17:24:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/47] dropbear: upgrade 2024.85 -> 2024.86
Date: Tue, 12 Nov 2024 17:24:00 +0800
Message-Id: <1731403483-21399-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10-3.272800-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNQAIXlMppp3X78v
	toCbCoUHl2GUABdhPswGtIuUivPQKVT1VBdjdy8jHPYwOJi6PLkpA2ExuipmWoAjsy+r+wvnu8T
	Yp83NicYp5/0TmYzWjfOKKL0FYS/BOa6H92+M9FSC+Y2uxPjocjFVRYZezcLzzO+iia5ccNRniD
	c3ZPXtxOArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslFIuBIWrdOeMz91mDYZLM5cRCU
	reF5ES5LITqredeag2sJ2NEVUY76x8TzIzimOwPbh2NZp6L5YQvM/mydp5vVCq2rl3dzGQ1Akry
	ZkOIkPpqY4GFW3JKPctXu/Zj+7u1v8LwqCFYclfNnpTAp6BgDazXHR2thGxnWHSorbHmedbl4Dl
	XCuWzq0dTwbcsxIwLjiDf2NCMWE1TyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206991

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Fix failure on concurrent channel open/close.
- Print remote host after "Login attempt for nonexistent user" log entry to
  assist fail2ban.
- Dropbear now exits with exit status 0 on SIGINT/SIGTERM. This is a more
  graceful behaviour for "systemctl stop dropbear".
- New IDENT_VERSION_PART config allows customising some of the SSH version
  string.
- Fix building SK_KEYS with just one of ECDSA or ED25519
- Fix dbclient "-m help" and "-c help" without a hostname.
- Remove fprintf/gettimeofday from sigchld handler when running with
  verbose trace enabled.
- Improved configure help output
- Compile fix for GNU Hurd
- Support running test_aslr without venv
- Compilation fixes for older compilers, and better build tests
- Update some test infrastructure versions of python packages,
  github actions, and github runner OSes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dropbear/{dropbear_2024.85.bb => dropbear_2024.86.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dropbear/{dropbear_2024.85.bb => dropbear_2024.86.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear_2024.85.bb b/meta/recipes-core/dropbear/dropbear_2024.86.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2024.85.bb
rename to meta/recipes-core/dropbear/dropbear_2024.86.bb
index 54001414d0..e3f4d17896 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.85.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.86.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
            "
 
-SRC_URI[sha256sum] = "86b036c433a69d89ce51ebae335d65c47738ccf90d13e5eb0fea832e556da502"
+SRC_URI[sha256sum] = "e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
-- 
2.34.1


