Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BC6C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 06:52:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.116])
 by mx.groups.io with SMTP id smtpd.web10.2204.1648191164471043625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 23:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=xWd2rQaq;
 spf=pass (domain: arri.de, ip: 40.107.6.116, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9zryG86aDXPstAo+7z9/5C74ZQ9XOnhVUjdY66bpfHFFrSp5MwUFWMMvohbrZ7/sNzbqug8/Eo2FVCw6UsQJiENepyQ07rn7SoCl28AXEdi/xW57WL5Yh6mIiTLUEGO4BA9O/0+x8wxOvofHXJJpnWpX5GIjDMuhGqOMXl7yCKRE5OJ+Wn88yZqzP+ppyTNlEjwsCbVjg82NxiTpH86PPWHuNhuY2GJ5RSVCdv8999lC+IoF8DtyPkytVtD0rK42qr5boSbuqEq7u0lpSlsUEEV5RzRtdVo0zn4eUGN5Pj6m3iLtoi8AxBNz9BhYS4VXRuniE/xx7pYoqq1DdSaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJEeBY5Xf8cEOwUmq+roW6QJqyPYcUwLNmJsqC77Ln0=;
 b=OVDBAKm+0mOm/NrsBAPLPyl7Am6KJXuuH0286Lslr7y1qug7wwqHE6wXIFWZulAsAoJT8Kz/XlQuTeVQiiYE8UUFca0FeBqDUpkIV2OmZZ2dbSsjfZLVZ45qKWYi+wrZk3QPTek4qUwyNSRYneNDOFNb2euTQ+8Hd+7nEu0aBgaAYoqDc0s7kuF1O5Ub9RvS+5T/cKkaCDYxFD3dX2oM7XGC9s20K8aAmVFay8lSmvbPf9mvc4jpaa+3dDDqQWY0pEQoZbu6zUCarP+Fgu2FiKZEKOEVrpWFZXVBsJb4v9qoWQNEIAu8OBujWH3AMl1u0BMNHrc/OpA6FhPU7Zliyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJEeBY5Xf8cEOwUmq+roW6QJqyPYcUwLNmJsqC77Ln0=;
 b=xWd2rQaqISvA3LrTz3QhWLCAo1beAwmU3C4OzJFQvqkpUBXgyuo6Oz16vmV5jCIJ/Tsg0VDn4JOpzJsH9v6cmCiwF3l/47CNZDgPn+/o1ZZqs6XlXTdfpEUruz+E9ljbqsfCzlSh8dzAmE2oqt5NEX9lrGz3zL8IxGF2A4GiUgU=
Received: from AM6PR08CA0013.eurprd08.prod.outlook.com (2603:10a6:20b:b2::25)
 by AM6PR07MB4006.eurprd07.prod.outlook.com (2603:10a6:209:32::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.7; Fri, 25 Mar
 2022 06:52:41 +0000
Received: from VE1EUR02FT028.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::2a) by AM6PR08CA0013.outlook.office365.com
 (2603:10a6:20b:b2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16 via Frontend
 Transport; Fri, 25 Mar 2022 06:52:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT028.mail.protection.outlook.com (10.152.12.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Fri, 25 Mar 2022 06:52:40 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 25 Mar
 2022 07:52:40 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH 1/4] rust-common: override RUST_LIBC for crosssdk
Date: Fri, 25 Mar 2022 07:52:23 +0100
Message-ID: <20220325065226.14833-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e6866b5-19d2-4858-5b3e-08da0e2c0e3a
X-MS-TrafficTypeDiagnostic: AM6PR07MB4006:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR07MB4006D85F6E78168075F28767BF1A9@AM6PR07MB4006.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qnVciPb84RtfcfLyET0IHSJqSSzrDP5KG6pYg+E2EEeDvML02EbHGCn9PtMxprgqkQ6Dod1gQ1SnHOk1zWsUkid8Iy5FT+kFzNQR4pZBA/OiApXVkpZJZhGZB0QMJSDDt/jFupiq6UbUzPJnmNkBQvLxojofuAuTM5c/hot8g3zj+v+sc2fDh41UhsYEIUhLZWcpOwLcP3aBODo/eO97EEYF54AddDju1FtJLLVf9VWyeAn0uCDqh0lLMWl6z4AZ9wPeMKVOxgdsFMlxya/MTUc832m1HxRZR3kFBeVzCTaFz236oowbsp8oda5es/8SMbdxf3gsgboAf3v5vP6VJJVnKjlRGtNdxhMzMy7A6T4pDOJI/8PFyuyBqBUfu5HjuQb5fZD5yQ9A8IEQd+MPXOnOUFS0/meJuskL/kklWLFDjY0UqYvD0emaR9w5eqQ5Gs7YqlJA6vVD0BmZJR6w9yLpj4v16FDSRB1SwoxNJ29wMQcl/4Jpg7LkxzZNeIopInPzoyftJjoA3IYJDFk98Hf7g3TXezdhisbUy0gxOJ8svZwPXYsfo6icteKI4b6jjvS7dgGPIqdZm8Umu/vyxR4+hOrb67kSafrNOLNu8s9Z8H/W8CPKvTl6P9ZKy2f/TI4H97NW9Er+PWYx6aw/puRcMAej/GVWh0P06eID5xexVk6MD3JQg6WyDoYam5bi2V7jxxY5yv8yP68hz6NTDg==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6916009)(107886003)(8936002)(86362001)(316002)(356005)(5660300002)(16526019)(82310400004)(70206006)(508600001)(47076005)(2906002)(70586007)(426003)(2616005)(336012)(36756003)(40460700003)(186003)(6666004)(26005)(36860700001)(81166007)(4326008)(8676002)(4744005)(1076003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 06:52:40.5776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4e6866b5-19d2-4858-5b3e-08da0e2c0e3a
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT028.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB4006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 06:52:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163628

For nativesdk/crosssdk, always glibc is used. Fixes build of
rust-crosssdk if TCLIBC is set to musl.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/classes/rust-common.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bb=
class
index 65ad677499cb..02a538258af6 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -16,6 +16,7 @@ RUST_PANIC_STRATEGY ?=3D "unwind"
 # Native builds are not effected by TCLIBC. Without this, rust-native
 # thinks it's "target" (i.e. x86_64-linux) is a musl target.
 RUST_LIBC =3D "${TCLIBC}"
+RUST_LIBC:class-crosssdk =3D "glibc"
 RUST_LIBC:class-native =3D "glibc"
=20
 def determine_libc(d, thing):
--=20
2.34.1


