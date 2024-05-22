Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E99C25B7C
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:15:19 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.5660.1716369316183619180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nBC8XKkj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369317; x=1747905317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JFSkN5qV1W/18dZGYukMkyqXrAzansz+RpqzEtZ+lyg=;
  b=nBC8XKkjqfLiJD7n/c1olMEW40g+F6CPlBRZgFEZgD/NF5bm817jCzp1
   8QV7VRqrJclZqtIxpJ+2mMg0FYnJzbDZ2COP5G3mLXey+JULpddELgfII
   G8m3Xy0vMOwt14NPKrHyrqkOiLs2TF8V376VArmTatPgfp0JRfYlgxtQ+
   83BZDMuW88t8C9B5BHBd2KrhDUotAclMVYSAjAkVbHkeNFM3KwbhfcZ7S
   cAd52cOA5N0b8lwhApy8c5bRfore6sPOTuQUJKVcruqrAvlcK4pup+JXf
   MnSalj+hvF6qctgqOP1HTw3QG2QmRFbgcLoPJ+NxECEIwdbM/TTOhvnCJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="161119177"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="161119177"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:14 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 092C1D800A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A714BDCA2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C250821D01D
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6EF7F1A000B;
	Wed, 22 May 2024 17:15:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/42] dmidecode: upgrade 3.5 -> 3.6
Date: Wed, 22 May 2024 17:14:14 +0800
Message-Id: <1716369289-22526-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-0.556200-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrGBULflUTtXR3de2OoBqgwqoH
	YSP2RcO05dRKIQyvabb4Orn4AH8dYqT4BhrRHlF4KsurITpSv+NZ+CK+BxQ9k9cUntbeUinj9A/
	sZzrdRIUVs8VjfLJUux9K6LGpAwss7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5AE59
	pk4kcc5bF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKly4nlz7wBuwnLSrj+m/9lGsF7MR
	1cKiFsaZD+2TaAfB5dYU1Wcz6b8u7qX2un75HB8E/H1272tOpWkSaRliqF0avSKNqx0K9Xt/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199702

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Use -DALIGNMENT_WORKAROUND on arm.
- Read SMBIOS entry point via kenv on DragonFly BSD.
- Support for SMBIOS 3.6.0. This includes new memory device types, new
  processor upgrades, and Loongarch support.
- Support for SMBIOS 3.7.0. This includes new port types, new processor
  upgrades, new slot characteristics and new fields for memory modules.
- Add bash completion.
- Decode HPE OEM records 197, 239 and 245.
- Implement options --list-strings and --list-types.
- Update HPE OEM records 203, 212, 216, 221, 233, 236, 237, 238 and 242.
- Update Redfish support.
- Bug fixes:
  Fix option --from-dump for user root
  Fix enabled slot characteristics not being printed
- Minor improvements:
  Print slot width on its own line
  Use standard strings for slot width

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dmidecode/{dmidecode_3.5.bb => dmidecode_3.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dmidecode/{dmidecode_3.5.bb => dmidecode_3.6.bb} (89%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.5.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.6.bb
similarity index 89%
rename from meta/recipes-devtools/dmidecode/dmidecode_3.5.bb
rename to meta/recipes-devtools/dmidecode/dmidecode_3.6.bb
index 3e2bb6e30b..e5b4e27687 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.5.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.6.bb
@@ -18,4 +18,4 @@ do_install() {
         install
 }
 
-SRC_URI[sha256sum] = "79d76735ee8e25196e2a722964cf9683f5a09581503537884b256b01389cc073"
+SRC_URI[sha256sum] = "e40c65f3ec3dafe31ad8349a4ef1a97122d38f65004ed66575e1a8d575dd8bae"
-- 
2.34.1


