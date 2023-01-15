Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9DAC677F1
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:21:27 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.134755.1673760083141984213
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vMG8FF5x;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760081; i=@fujitsu.com;
	bh=iTqaLFMVdSIeGSHqAJ9IR+e6SyR33PkOkNccxqxKW1Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vMG8FF5xgxjIrlNhNjVbafiXNW8l2Ghm7MEfwc5Tuim9Ilse7vCsOf0Kmc/F3nCf6
	 swAVWtdQgdupwzJUkY1r1M2F4FBDgONYnLgH6N/LWLKT2jo6iCy5Sf+RsTUwVcFMLN
	 X/VooWTb8GPvE/+TohFO7etu8dCdvjR8fOsoseo3GG5tdbUAVFp2vPf2v5EHBUkKbg
	 1OJM8xayU6fsL2KXoBVc4szUHP57B/upOsWv7/ghA4e+5qMfigmXLrYLDOtqmzhoTd
	 URArD+LuYDfZd+fQwVC/FRxdiCawY/leMLOEts4RKAa+wlRUzl5cHJVUEDXyiBVBOJ
	 ENKN0+6m3UMLA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8ORpBvQezj
  ZYHuTpsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtF48zljwVyeikV32BoYL3N1MXJxCAk8YJR4
  +eIlG4RzhUli+e8ZrBDOXkaJtmcH2LsYOTnYBKQkbtz/D1TFwSEioCdx9Z8oSJhZQEXixe8ed
  pCwsIC1xNFeJZAwi4CqRN+nR0wgYV4BR4neS8EgYQkBBYkpD98zg9icAk4SC3tmgA0XAio59v
  ITG4jNKyAocXLmExaI6RISB1+8YIboVZSYfbmZBcKulGj98AvKVpO4em4T8wRGwVlI2mchaV/
  AyLSK0bQ4tagstUjXUi+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMGhTitVVdzCeW/ZH7xCjJAeTkihv5LdDyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  Dc0Hk4WEixKTU+tSMvMAUYQTFqCg0dJhFe7AyjNW1yQmFucmQ6ROsWoKCXOm9wNlBAASWSU5s
  G1waL2EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXgOQ8TyZeSVw018BLWYCWhxSfxBkcUk
  iQkqqgWl1tn7aCsHSraaT2L1tPy9sXHMtpDni/Ntf4tzno8pUrTOOP315S5lJx6+mZmWW4peU
  C7arC20cD8VuLY2e/exvxNHyxydn3tQo5hcs3dN7cvG/czdPlXRfCvWXUjqlX+uwLP9A4Z2lb
  UfyZ8RGPJP1t565v/JTzLNHHy2aN/hduLKuoafPIYH5tDTPGvWLGWZ3Fv/oCb0hevfh8V1cPD
  ukptydPF3XRupMy/3P3FN+hk/mPpi2S3G75o/XwafmPO7e1uHcYPZUY3fOunPu6mHPTFatOHe
  ata3/q42D+o6UbdkPNK/eEVIr86pKWzFPIi21bNPd2hu7rjHu4DaLTS5+2NTrsPp4b8GnuQ+j
  aqYqsRRnJBpqMRcVJwIAQBaEl1UDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1673760080!245827!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1787 invoked from network); 15 Jan 2023 05:21:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:21:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 614991AF
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:20 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 55AB61AC
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:20 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:21:18 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] man-db: upgrade 2.11.1 -> 2.11.2
Date: Sun, 15 Jan 2023 13:20:54 +0800
Message-ID: <1673760055-2483-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760055-2483-1-git-send-email-wangmy@fujitsu.com>
References: <1673760055-2483-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175865

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Fixes:
------
 * Fix compile and test failures when 'troff' is not 'groff'.
 * Fix segfault in typical uses of 'man' when 'nroff' is not installed.
 * Fix crash in 'mandb' when processing stray cats.

Improvements:
-------------
 * Check for stray cats even if no manual pages in a given manpath were
   changed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../man-db/{man-db_2.11.1.bb => man-db_2.11.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-db/{man-db_2.11.1.bb => man-db_2.11.2.bb} (96%)

diff --git a/meta/recipes-extended/man-db/man-db_2.11.1.bb b/meta/recipes-extended/man-db/man-db_2.11.2.bb
similarity index 96%
rename from meta/recipes-extended/man-db/man-db_2.11.1.bb
rename to meta/recipes-extended/man-db/man-db_2.11.2.bb
index 2d539c4a5b..ca0cb1a0e1 100644
--- a/meta/recipes-extended/man-db/man-db_2.11.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.11.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://0001-man-Move-local-variable-declaration-to-function-scop.patch \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[sha256sum] = "2eabaa5251349847de9c9e43c634d986cbcc6f87642d1d9cb8608ec18487b6cc"
+SRC_URI[sha256sum] = "cffa1ee4e974be78646c46508e6dd2f37e7c589aaab2938cc1064f058fef9f8d"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS:${PN} += "base-passwd"
-- 
2.25.1


