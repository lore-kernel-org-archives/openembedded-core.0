Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EFCC44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:50:17 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9598.1784130608705433157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 08:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=qoEt682I;
 spf=pass (domain: axis.com, ip: 40.107.159.41, mailfrom: peter.kjellerstedt@axis.com)
Received: from PA4PR02MB6543.eurprd02.prod.outlook.com (2603:10a6:102:fe::18)
 by VI6PPF5D7849F97.eurprd02.prod.outlook.com (2603:10a6:808:1::30d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 07:56:39 +0000
Received: from AM9PR02MB6497.eurprd02.prod.outlook.com (2603:10a6:20b:2c1::21)
 by PA4PR02MB6543.eurprd02.prod.outlook.com (2603:10a6:102:fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 20:50:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSAudKyYb8fxinilxEwej+3mJ2Bgr4tlU6kRyZ4FNWWOVEYw5yvDSPwZN3k8WRKjBJhN9P8EW4mk+SUMRRzB0Chgntav7dfzzGL0dRi5Epr9pYTdALNpYnWrx+f20obYfi6LNf4QOtD4tfwpdjT2pyC7d8gfxqUWbYs1GyIUYpG+fyLe3Z97Emk1qTZg3NqfBavDWpKURzlMJoZdy1d4Ke1glpqiwEG+SIS0CjK41UT4N1YFZYBR0hUywd4CHaYY06dUkGhDmjash2UkCgV4H8WK5UcV6lYpAow/hc5fbRuxzGpgXNwARFMM5PWWfcBaAOA8D3cNKawTMwwGMr/1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyO+ldTBzpx/kIzhLP0ii6zpkrVOsI1zYVVixCllgGk=;
 b=p6eHbWW+Lc9P4XIglPJMZzwhnxsiJFLP1M7RdMVpCHSYwiA8805lGkaScFhIxPadLeD9UzK2dLaTwz2RLOSFA96MaFwv0YAbAcFaqEt+jUdkmDoPZ2Yl2vUN0cOqn/vuR0TtDg2Yioift1dm6jUrhyKz2Egs3GdkLovJUwHvvfLq6rdoPC9K7esbMq3EmyR8uBMbDoK/t4hM0Vz3so7UGo8khT/vYGPW5Y7hcOpv1hAZxSplGbET2070gGZBI5+2jZ2MsC6+B0vWW2XZ60DcASebmkMHXj0ZtN1r48tOgOzw1JQewJK2LzHOmfe15auU3nXWJmywIOBC78Edt+0yQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyO+ldTBzpx/kIzhLP0ii6zpkrVOsI1zYVVixCllgGk=;
 b=qoEt682ITCJLwjyrCv5t/TBZCc7LytTzFsTq+JQ8xPK9TTiIv+GfpYHIiP8+3YoDz6Vr/OZIindbRw6mK9ghBCfO6P/UXpLp6zcncwPKhD2PC3j0fI9gnEMBSpTPNzS3ABa4nytOBiNqtF9i2FQEFo9txrU/PJ6v2pkFVPbDv8w=
Received: from DUZPR01CA0168.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::24) by AM9PR02MB6497.eurprd02.prod.outlook.com
 (2603:10a6:20b:2c1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 16:39:35 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::12) by DUZPR01CA0168.outlook.office365.com
 (2603:10a6:10:4b3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 16:39:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 16:39:34 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 14 Jul
 2026 18:39:34 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 14 Jul
 2026 18:39:34 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 14 Jul 2026 18:39:34 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 360A626EB
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 18:39:34 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 3629C12910F; Tue, 14 Jul 2026 18:39:34 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] curl: Add support for libssh
Date: Tue, 14 Jul 2026 18:39:25 +0200
Message-ID: <20260714163925.3545382-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: 
	DB3PEPF0000885A:EE_|AM9PR02MB6497:EE_|PA4PR02MB6543:EE_|VI6PPF5D7849F97:EE_
X-MS-Office365-Filtering-Correlation-Id: 502b3f03-9ce0-4ff6-bc8a-08dee1c67cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: A0w7yZcZOmxe1jZwvZttZD5AvnetJA+/LW0ST/+7g+wNqC2Q+ora9DeE5uNnFn8X3+Vh2ICQeWjfltTbZ/gXBQj7Z9BtVcyL5DskY3KC63CDmTl1im+bQ9mDdYkKTn4cecs8Duzhz1Q+WbEYwo8EHULGc9aXSpm0KMD8MlXAoHv6KMqcAX/erqcDFM0GSGTPMhcjDk07j0ckV2J1Watfa9Et5+CxjpDxbWl911xTE/feQc6JUvdfuULQq5O7fonrwZiNe3GB82SGGcN3mmeVUSFsADH6Mkf01+xIqWtIDjAb2+Pqhh3MMvzgk5inAfKpA+XIN6S3C5NdpuK7SeEpfhr3KNUHoAeNdWsib7B7v70YCEY001SQy8yTA88lqY84hF9qL8wHyUjPNC1YkIig2zzSeyxcMv49XG5OgERT6l0tmpYGFeWilm8qBRBFO2XuzGdeebBZudUjdKtEwbmI2qoyyjqYjiJYdfCFJoneimmNihSWfeYHlEgvjf24izPbRNdOaARO1x7hdoVXbqvLLfrwTBquDWxP+awMPwW4Y3Ff8VYQDjNNJQ5NWFYKLgrseP36dThr95hgjd6r/oj9+2eE1scL1tZc5srK7a3dIBOQflGHqxoiSvpr9/GRY7KPG/XT9YQPGpIDnf4d+XdVyWGwJCkjr83WU+Vzioy687utDvpUSGQrzneHgPQZA7TeN+TNpzL9tnxX/UiwKFRw7g==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YIsDvfK9LUJTdef834mXV+XlcbLi6566OBPU2IKfy3HF7UDStjNooIr4rVzZIlU6AeH3hxvEXrOckJQG01+YjC/K0EB2ByxDOD7eiec04TC4PxzmXZ8b7gYuvtkyhWRY57FvKSsYrB9zzGkqeWZ85GL65+lUaTe0+FlMCiT417tImXvUpIGoyGuQiSmderuIwlTRwksy8IHQgRNQONvBN2bKJ+vp5O8ZET/3lHfxpcPYjYm8IDIfnCoo5DkOQTocex5C3tZhGGoMSgJq4h+qi9esByrPsDeHMRq7tZkqyD32qaVcoMOUs8RWUKPzKw78khnR1oh2q3lBskME51fcGMOHd9To1ePL4JYz56Ilmrw846EMZpTzrhCjq+z0kv3qGW76EAYsCleSL8Nqx4QrA8tlkhx8WtuVVO2HxM+6XLMtHNti8SMR7uKGlIKnIfPn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 16:39:34.7300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 502b3f03-9ce0-4ff6-bc8a-08dee1c67cdc
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6497
X-OriginatorOrg: axis.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240982

libssh provides other configuration options than libssh2. It is provided
by meta-oe.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/curl/curl_8.21.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.21.0.bb b/meta/recipes-suppor=
t/curl/curl_8.21.0.bb
index 56224f8063..d245e7fe60 100644
--- a/meta/recipes-support/curl/curl_8.21.0.bb
+++ b/meta/recipes-support/curl/curl_8.21.0.bb
@@ -55,6 +55,7 @@ PACKAGECONFIG[ldap] =3D "--enable-ldap,--disable-ldap,ope=
nldap"
 PACKAGECONFIG[ldaps] =3D "--enable-ldaps,--disable-ldaps,openldap"
 PACKAGECONFIG[libgsasl] =3D "--with-libgsasl,--without-libgsasl,libgsasl"
 PACKAGECONFIG[libidn] =3D "--with-libidn2,--without-libidn2,libidn2"
+PACKAGECONFIG[libssh] =3D "--with-libssh,--without-libssh,libssh"
 PACKAGECONFIG[libssh2] =3D "--with-libssh2,--without-libssh2,libssh2"
 PACKAGECONFIG[mbedtls] =3D "--with-mbedtls,--without-mbedtls,mbedtls"
 PACKAGECONFIG[mqtt] =3D "--enable-mqtt,--disable-mqtt,"

