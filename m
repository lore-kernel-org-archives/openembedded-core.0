Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5112C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:48:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.39164.1698997678006338438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138502673"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138502673"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:47:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B1CC6D7AE6
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:47:53 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DDFB5D5D15
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:47:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id CDAC98868F;
	Fri,  3 Nov 2023 16:47:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-ruamel-yaml: upgrade 0.17.35 -> 0.18.4
Date: Fri,  3 Nov 2023 15:43:13 +0800
Message-Id: <1698997393-31213-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10--6.800600-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrZ7Rw1p6uSHCAI7Mvq/sL52zg
	X6V0HRbeOuzeNmOGKnPmkMFgQQhR9lajduGHvJlhMB2m5K0KuIme+9guUIa8kdsch25zeC3VntU
	3Lv5Rb/3A2G3OXMO97ENziVKCujClEuYl3YX/IW4/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bu/QsxUpdsNFeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPDUYvqDkAKyJ7slH
	ml2gSs5Zq38bpG7UGSC32ALutPBt0xGYWoxf5pr
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190133

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- YAML() instance has a 'doc_infos' attribute which is a cumulative list of DocInfo
  instances (one for 'load()', one per document for 'load_all()'). DocInfo instances
  contain version information (requested, directive) and tag directive information
- fix issue that the YAML instance tags attribute was not reset between documents,
  resulting in mixing of tag directives of multiple documents. Now only provides tag
  directive information on latest document after loading. This means tags for dumping
  must be set **again** after a document is loaded with the same instance. (because
  of this tags will be removed in a favour of a different mechanism in the future)
- fix issue with multiple document intermixing YAML 1.2 and YAML 1.1, the VersionedResolver
  now resets
- fix issue with disappearing comment when next token was Tag (still can't have both
  a comment before a tag and after a tag, before node)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-ruamel-yaml_0.17.35.bb => python3-ruamel-yaml_0.18.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.35.bb => python3-ruamel-yaml_0.18.4.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.4.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.4.bb
index 1760fec7ee..7be966184e 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.4.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "801046a9caacb1b43acc118969b49b96b65e8847f29029563b29ac61d02db61b"
+SRC_URI[sha256sum] = "a2778930d2573358f7c43f26e4bd5715015dccebf53c9943ed611200c1e2adcd"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.34.1


