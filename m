Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1B0C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 15:22:45 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.56255.1656429756957578923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 08:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 25SFMWdM016288
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 08:22:32 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Jun 2022 08:22:32 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 28 Jun 2022 08:22:31 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 28 Jun 2022 08:22:31 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] glibc-tests: not clear BBCLASSEXTEND
Date: Tue, 28 Jun 2022 23:22:28 +0800
Message-ID: <20220628152228.16791-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 15:22:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167348

From: Kai Kang <kai.kang@windriver.com>

It clears BBCLASSEXTEND in glibc-tests recipe to remove 'nativesdk'
which is set in glibc recipe. The side effect is that it removes
"${MULTILIBS}" at same time if multilib enabled. Then there will no
multilib version glibc-tests. So only remove 'nativesdk' from
BBCLASSEXTEND rather than clear it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/glibc/glibc-tests_2.35.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
index 414f8660de..028e83e865 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
@@ -18,7 +18,8 @@ python __anonymous() {
        d.setVar("PROVIDES", "${PN} ${PN}-ptest")
        d.setVar("RPROVIDES", "${PN} ${PN}-ptest")
 
-       d.setVar("BBCLASSEXTEND", "")
+       bbclassextend = d.getVar("BBCLASSEXTEND").replace("nativesdk", "").strip()
+       d.setVar("BBCLASSEXTEND", bbclassextend)
        d.setVar("RRECOMMENDS", "")
        d.setVar("SYSTEMD_SERVICE:nscd", "")
        d.setVar("SYSTEMD_PACKAGES", "")
@@ -95,7 +96,7 @@ python populate_packages:prepend () {
         d.setVar('DEBIAN_NAMES', '')
 }
 
-FILES:${PN} = "${PTEST_PATH}/* /usr/src/debug/glibc-tests/*"
+FILES:${PN} = "${PTEST_PATH}/* /usr/src/debug/${PN}/*"
 
 EXCLUDE_FROM_SHLIBS = "1"
 
-- 
2.17.1


