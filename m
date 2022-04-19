Return-Path: <simone.weiss@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B2EC47080
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.61])
 by mx.groups.io with SMTP id smtpd.web09.3197.1650369030782165389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 04:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elektrobit.onmicrosoft.com
 header.s=selector2-elektrobit-onmicrosoft-com header.b=tYxA6u+9;
 spf=pass (domain: elektrobit.com, ip: 40.107.244.61,
 mailfrom: simone.weiss@elektrobit.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxDSO0SsdaL5hBpnsy1Nsq5ivpeca3gg7Ogdyp/x9s8=;
 b=tYxA6u+9/PJG+YBv9dV+5ofTF5Tpiv/nyGQu2cEx9onHTOL9ubhwzlJM3qsZaqq+h/sD7recIWZoHTQ2ZMb+dCDlGE/deMHqwJLP8fZgGMXn1PCppmdQJRYq3wLxUK/P363JgLWvK545/SPdkTOc+7xeq0bn3jDNFr60hK/bgpw=
Received: from DS7PR03CA0235.namprd03.prod.outlook.com (2603:10b6:5:3ba::30)
 by DM5PR08MB3609.namprd08.prod.outlook.com (2603:10b6:4:6c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 11:50:27 +0000
Received: from DM6NAM12FT046.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::b9) by DS7PR03CA0235.outlook.office365.com
 (2603:10b6:5:3ba::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Tue, 19 Apr 2022 11:50:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=none action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 DM6NAM12FT046.mail.protection.outlook.com (10.13.178.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.7 via Frontend Transport; Tue, 19 Apr 2022 11:50:27 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 04:50:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMeerqW92ktn4ULYwxHRV6sIgF7c+iLwEa03zCZfxZmYps+vF+GQUr/j0Y9gE7QRcXHzk/rolo7UvfBwDk0w35+g9kl+FVoPTYDDM+0PCObBt7+TVFG1417nBbxOwJ/TaeJ/SEQmiKp3jmeZO1DSF4FsCD9eqIsRhwosgqp5ajuGa7x9U0Hp1rDlEWqAaWi/qdP/Xk93k9dZM22r0WvdcE88vzmcRfoV05IRpFofZrjJVbQw4gqz6QGWkCJrY5kJYLwnuItHyJUNYB5vIor6lIFsTS7iGZD1ETNwHEaog7PxgnqBw8mVPbDasU4Jgrdsxz3wqCjhHcEJHOZWVEGDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxDSO0SsdaL5hBpnsy1Nsq5ivpeca3gg7Ogdyp/x9s8=;
 b=UT2hRYrkV7Faktd/4gfcV2kwy+A5R3wnwwOdqLMJ75Y8Muahfc4wLSwuAfkEgIYxNiVWgETC1TP7B7Xur4NKfG6MsQLGgU/NLTW+etdUNB3632zCimHJIoCjXA9kqL9Ag6Y47U+tq9H2ek7+8cnm+fhPwuHvsQ8giANZOc21Cyev4X8N20V+KOiQ5LGCyO524JXWXSOOsujFXbzCjNs4gkbMEiYEAXdrISTBQMEV8oNF5bljzk7dn8akWLR/4C0VQy3azfWPsfKckigQyO4DHCWfiGr/KndyxNJjugcynUmJnC+vbh6MrC5tWU8QLbpQ9Otck7wg5EZZ8bgSrhFuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 213.95.148.172) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=none action=none
 header.from=elektrobit.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxDSO0SsdaL5hBpnsy1Nsq5ivpeca3gg7Ogdyp/x9s8=;
 b=tYxA6u+9/PJG+YBv9dV+5ofTF5Tpiv/nyGQu2cEx9onHTOL9ubhwzlJM3qsZaqq+h/sD7recIWZoHTQ2ZMb+dCDlGE/deMHqwJLP8fZgGMXn1PCppmdQJRYq3wLxUK/P363JgLWvK545/SPdkTOc+7xeq0bn3jDNFr60hK/bgpw=
Received: from DM5PR07CA0090.namprd07.prod.outlook.com (2603:10b6:4:ae::19) by
 BL0PR08MB4627.namprd08.prod.outlook.com (2603:10b6:208:5c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.25; Tue, 19 Apr 2022 11:50:24 +0000
Received: from DM6NAM12FT068.eop-nam12.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::34) by DM5PR07CA0090.outlook.office365.com
 (2603:10b6:4:ae::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Tue, 19 Apr 2022 11:50:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 213.95.148.172) smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 213.95.148.172 as permitted sender)
Received: from denue6es010.ebgroup.elektrobit.com (213.95.148.172) by
 DM6NAM12FT068.mail.protection.outlook.com (10.13.179.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.7 via Frontend Transport; Tue, 19 Apr 2022 11:50:23 +0000
Received: from denue6es011.ebgroup.elektrobit.com (10.243.160.101) by
 denue6es010.ebgroup.elektrobit.com (10.243.160.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 19 Apr 2022 13:50:21 +0200
Received: from del01461.ebgroup.elektrobit.com (10.243.54.72) by
 denue6es011.ebgroup.elektrobit.com (10.243.160.101) with Microsoft SMTP
 Server id 15.1.2308.20 via Frontend Transport; Tue, 19 Apr 2022 13:50:21
 +0200
From: Simone Weiss <simone.weiss@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
CC: Simone Weiss <simone.weiss@elektrobit.com>
Subject: [PATCH v2] libgpg-error: Add ptest
Date: Tue, 19 Apr 2022 13:50:15 +0200
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: 
 <e56e9b09-e7c4-4654-8f85-f8f27e78ee5d@denue6es010.ebgroup.elektrobit.com>
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: e98d5d76-3835-4164-3672-08da21facc1b
X-MS-TrafficTypeDiagnostic: 
	BL0PR08MB4627:EE_|DM6NAM12FT046:EE_|DM5PR08MB3609:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR08MB3609A5138B327B238AEAEB40E2F29@DM5PR08MB3609.namprd08.prod.outlook.com>
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1tbVZBzVGs16sbVYS5MiHfRpZimhEi9mPrcM6AEfu3hDgvibE6hkUxSg9QhlrOfYExn5Z73aYieYP4IHPPGF5sX7ecNrmKxdPoWuIe3tXehJW4OzUpkXOuN2Q4TY5FRGw5W3pIQLa7QD+dIVdyAG3S7z5XPx+nSn2qXghKYguPkMH4oABQV2FwACBYzPvoIUEMfNEElCIlu4irQfNS/SflxWJRSJT8o2q0D0DAdr9UXzGxlBOYyhc+HfitoM4SzOIs14dt+FAVaEw8iYKd6c0jjtmJ0wYQvRKmkiey8go9PpqrNSJ/YgbF/KCLhFEOLJBVZhsr/u2miZbHIXOx0ks0E9EqFegPdlh0g4nNRSyWHtVk1kFwBzEVcX6HboCOb8y1c3qZ7G6uF5ARoBGsOmiIDaH69TUWcuXzzuK2I4OjdW0CRjvhMOTfVl5hGWEUJ67UqffYCqSQ1H0PMrwOnbDmW1h7AuAMPGqH4VgMeK0NftmbXqrLJ7jhh6MpWIzK8VB+voQBzDdvhOUjMiYJkenfxR3eb+AQGIadmSSESU7qaBhciId81rYDDQNbI7LeP7DuJaXVgsCVCrL3yoRjockQvP+GwYFK8d7G3rvZT/ffehEjuwtMrnXSFKvLIYN02h7FiUxzVKvOYzwXQtykzbYopv0TLPLmkchwZ3HP6WMNo8IbbWZmW/FvVFBnD4QxcukKBkNqw8PvbIGO+zTvFPDLO+DBbO5veV+ordLPPJx++1vo+4rJvvilGQMlc+/pI8D6hTy7+9yK/NFZnF/mC9kw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es010.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(86362001)(508600001)(6666004)(83380400001)(31686004)(5660300002)(2906002)(26005)(4326008)(6916009)(107886003)(81166007)(47076005)(44832011)(426003)(336012)(8936002)(356005)(316002)(40460700003)(186003)(36860700001)(70586007)(8676002)(70206006)(31696002)(82310400005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR08MB4627
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DM6NAM12FT046.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0873a261-1a1f-4398-5b2e-08da21fac9fe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	99d79Aq/Bv9uglzCHWRVUS8dmM+q9t1ItJGcy19uv2eE9HYVnwqWuU/nLdONrVTeOesshr704BppnUIc4bjnwLj/xM3XC+TbNmRhzWe4YGnbi4kVVGbqMg2iTLRrAriNIC8ypQfbxPvt+azKsH+nf9WJGpYLT9TXOqhMPFeWaU7o7J6E4w16V19j1NhZ+Md9lfWduXjWuorr0MYIyZ6XEVBCpSk7Ukb4C0GvaWqekrY/ghnGfmHXwXZw1GLnN0MJziqMUHm3OcGytR/aEFZUtzxOTzOWyr9zjJCi0nN9ogUknBzswJs/+6ymMC68kDoRQTRJ1ZUOwYmoJlEKi/74ozZUI9eZg5DogJP5/rHQeKSINKcRVF+D1strAYRpN7LRUvEGpkumsEfvfAKMLRz3LL9FqMmi6HIIHsLEbb1RIJky2ddfT85IjmvtqIpF8oFaXj/uNNw7bm4zIXRGxe7dC+5K1zX+yvUhN8gwDn71+dpxFZV8Cdm1gVCXJsez4ao/PzH1LML/Frd771ys+R0Mn83QU+gktpwlQH1ad9WcC/pqvLswdkqd7h5V7920EwvQtRLlWteLkmz84b+8hT/YaDXTl9Sxco2/BRkyjhwMBSEB2nCvUTci2+sP47eKUngft4FFagM/aCDiPlfqAwv1qWO6bf1LYBF6c/3FFmiEdvif+wyOwliU5ahZ+GBI5pmIZTKIopbsBbnTjXALnkM0i73Qh6rXoJ6U74wlOMghrLeilKdR8uVcyClmqzEq4aK/ei9UB2EcExyXdH+drn9DQKxlquSN00TvGVABNt+9Fho=
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(186003)(6666004)(508600001)(6916009)(83380400001)(8676002)(44832011)(47076005)(31686004)(426003)(70586007)(70206006)(336012)(4326008)(36860700001)(82310400005)(40460700003)(316002)(86362001)(31696002)(8936002)(26005)(107886003)(2906002)(5660300002)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 11:50:27.2785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e98d5d76-3835-4164-3672-08da21facc1b
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM12FT046.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB3609
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164625

Add a ptest for libgpg-error to core-image-ptest-all. Avoid refreshing the
Makefile in qemu as this would fail and is not needed. All tests passed on
a trial run.

Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
---
 meta/conf/distro/include/ptest-packagelists.inc    |  1 +
 .../libgpg-error/libgpg-error/run-ptest            |  3 +++
 .../libgpg-error/libgpg-error_1.44.bb              | 14 +++++++++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index b51cce4d9e..54a290871e 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -25,6 +25,7 @@ PTESTS_FAST = "\
     json-glib-ptest \
     libconvert-asn1-perl-ptest \
     liberror-perl-ptest \
+    libgpg-error-ptest\
     libnl-ptest \
     libmodule-build-perl-ptest \
     libpcre-ptest \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/run-ptest b/meta/recipes-support/libgpg-error/libgpg-error/run-ptest
new file mode 100644
index 0000000000..2d23159eb0
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -o Makefile runtest-TESTS
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
index 41adad0ede..174350f6f5 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
@@ -17,13 +17,16 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://0001-Do-not-fail-when-testing-config-scripts.patch \
+           file://run-ptest \
            "
 
 SRC_URI[sha256sum] = "8e3d2da7a8b9a104dd8e9212ebe8e0daf86aa838cc1314ba6bc4de8f2d8a1ff9"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script
+inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script ptest
+
+RDEPENDS_${PN}-ptest:append = " make"
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/gpgrt-config"
 
@@ -35,6 +38,15 @@ do_install:append() {
 	oe_multilib_header gpg-error.h gpgrt.h
 }
 
+do_compile_ptest() {
+    oe_runmake -C tests buildtest-TESTS
+}
+
+do_install_ptest() {
+    install ${B}/tests/t-*[!\.o] ${D}${PTEST_PATH}
+    install ${B}/tests/Makefile ${D}${PTEST_PATH}
+}
+
 FILES:${PN}-dev += "${bindir}/gpg-error"
 FILES:${PN}-doc += "${datadir}/libgpg-error/errorref.txt"
 
-- 
2.17.1


