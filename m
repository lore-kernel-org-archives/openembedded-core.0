Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1109ACD11BF
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:54 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7945.1711413463690762646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IBs0PmZp;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413464; x=1742949464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=j6QDOugC0vx5EtrgE4pvofuZCpwIWLme2P1nb7NtLDk=;
  b=IBs0PmZpxFtHT/bMLnUkRsLE5ua3qs4rlVaQjGlqb2oixHTxjXJU6vjH
   ZuQ7Wu+ebQgvl1j4rePfvcT2yw9RXv3Bwtu/zlSb5AifDg8j+DBl090B1
   pGoduczMLkFXNHIgvFVDAAuUWPol83M0YusDJbuit3no7q+FXk9q9k4Xk
   BaY21TYsaaycswjCRX6ZTvd7HLyfcJWtd7BCjnvYYPHdCosz06exU5wie
   Iem9NFSrvxHfAXEKM+jHbeCUAFr3z50hbIelJRzqM3Gta19S/nvWEO6up
   bZAGQO617BiSnnNBpXCHa/8KpAxHROlIpQ8bECm0vxXO/YFJfZ2IQ1AAb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="140944152"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="140944152"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:43 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 797C6E0AAD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AF9C6D52FA
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4991820097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E7EDC1A006A;
	Tue, 26 Mar 2024 08:37:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 24/34] python3-pyelftools: upgrade 0.30 -> 0.31
Date: Tue, 26 Mar 2024 08:34:42 +0800
Message-Id: <1711413292-3025-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--5.714500-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/ozDhGeQC9EuaG
	g/Bit59tbfDR6ixZ9l1QsSI5kCiYdL2UuqkTtiljfOaYwP8dcX4xVUWGXs3C83tzXL7lPwD/O8p
	bc2iMnjuQ8jX9l2qhLWvtvwKw8+1BRnImuVhjWQoD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpienmD2BglYMt4HMSQIKmdGd0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtifGCYEa4Fxd/pZvEDWZrVwDTzg+mWCt8/TwhjMVPGXzWXc2MdiRvwg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197519

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-remove universal setting for wheels, since we don't support py2 now
-[RELOCATIONS] add enum for v850 relocations
-Fix buffer overrun in NT_GNU_PROPERTY_TYPE_0 parser
-Fix iter_notes to handle >4 byte segment alignment
-Support for XC16/PIC phantom bytes
-Support for the GNU note with the AARCH64 CPU features
-Fix for mixed version loclists, tests
-Update supported python versions for GitHub actions CI
-Initial s390x relocation support
-Add py.typed to elftools
-Fix ranges autotest take 2
-Support getting RELR relocations from dynamic section
-Dynamic array size can be a loclist/locexpr
-DW_OP_GNU_uninit
-Update CHANGES to mention Python 2 (lack of) support
-Remove redundant wheel dep from pyproject.toml
-False positive on LocationParser.attribute_has_location()
-Support for DW_OP_WASM_location
-Dwarfdump test on Windows
-More Apple, LLVM attributes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyelftools_0.30.bb => python3-pyelftools_0.31.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.30.bb => python3-pyelftools_0.31.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb b/meta/recipes-devtools/python/python3-pyelftools_0.31.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pyelftools_0.30.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.31.bb
index 837edb7165..551fed6876 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.31.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[sha256sum] = "2fc92b0d534f8b081f58c7c370967379123d8e00984deb53c209364efd575b40"
+SRC_URI[sha256sum] = "c774416b10310156879443b81187d182d8d9ee499660380e645918b50bc88f99"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.34.1


