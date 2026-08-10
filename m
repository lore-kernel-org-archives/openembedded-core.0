Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11234C5B56A
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 13:58:00 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30509.1786370273042023722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 06:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=rhVDt7P8;
 spf=pass (domain: est.tech, ip: 52.101.69.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpIY+k5Q0wffKnUZ5NqsIa7pCQRCLbfZI4zNvvuZVaP2fSiCR466XzdunxIH8MLDchvlUUY2uIuvdE2WMlwgnPy1rbVJmN64h1Y39b06CJVKnocAV36YgFEw+emAHqSj+z+wUeNppEBTT+JvEiWlTmqr6omK5DYteh6JmcrdMgoK8iJV2JOOIEoNPXHLOrjmMOyUAoHlgfGEDzILKP8o/YBriEbnufHrm5aoFse9eYPbjbN399EY5dmDa9ALzKwTqxj+QMqcpFONnYehtfFN+OKhvm3E34u3m8OzQXLymAsTe41x9h63paPiLTxmUPraPLdfnOzo3JrVRuhLRA1oGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbZviXa9DJa0KZcQpHeKOdT6eO4B8u14usJHCKZHpB0=;
 b=YdHvYZhT7cK3VbscZrGhC6kqI9wa7nmXJd/0bJLFGliYGhGY7hPvCgwKVhW4Cz1HiSfBQIvQz5o1/lp4XV0jmsJPKBwy9jgAqaDMvB5KTxRdVkPJ9TOtZn2Zr1O8N6+27w0/dwwvGrGdoTzCcTL6DZxo7DQpMT6DHUHOPhr3Hly9va5FWtOfpNre5/65Z4H8UnyvSM2wO6SR46AMbmBOi93nyRFJTunNS1NTOLXwOj9byHocZkEhj11Ej9H8Lw7eBBst/rCTed8Ni6tRP9TD6V8DbYC0g6LaADS4cf0uo+Tatj4nMvfvtNlVRAbAMQ5Jcrr97hRh3Fvh1x7ihTqINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbZviXa9DJa0KZcQpHeKOdT6eO4B8u14usJHCKZHpB0=;
 b=rhVDt7P8Pm+5zrAyQwPx2vgjUv3OpLoslJ6OfyJuWawwbav+Kku+bTNuMz01JUVc/01eEU4N8NL/eq1QLzmld4PbsouNyzE5eg0EetsJNB2j8c2yhiFe29z7r71XlLiLR3TxtLbZhRWyKB02m4F1g9bjT82R4hS77OSablMQlzTDU6QlyXQGNcN5pMClKP1xLQ9bIy4ZBMi4xJ/P4L5SbW3cFnV2aOpXWQ2pbvmcUpyu3iajPn5CzCvlzw1J0tqVL57vHd7l0BPfxMaQjy/jyg7bniGGmf17pc9jImfQ44NvGdtbsZ4UrxfUjQNxlp/7JOEqHM0wqA3kv2iN2a9hVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2363.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Mon, 10 Aug
 2026 13:57:51 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Mon, 10 Aug 2026
 13:57:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 1/2] python3-mako: upgrade 1.3.12 -> 1.4.1
Date: Mon, 10 Aug 2026 15:57:38 +0200
Message-ID: <124a631be753536fbb8a2d30ed75067de1bf6a34.1786370158.git.jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1786370158.git.jaipaul.cheernam@est.tech>
References: <cover.1786370158.git.jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2363:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf28e1e-26b1-4e8f-569c-08def6e75e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	t9tCXUTmAJFxlYWQ0uHx9JX8Y71OcEuf2Y5tuDTLGhJq08P3dSk/gIp1kZ5mLfpjesjgosDeHvXEbdoSs85KwakuSw+XFcyYsfwW2LsSq0fJpbLBfY6GDFIbEXHFkQDcTbKiUv/qogH8Rwas1qflZBrNSnGUkESDlqKwoK7z7N4atzF0Dsg7qKvOnrNamDKlAlx76OtnZjKF3zq36b+jXJ5Fi04n2lgSjtxcUn5FXVKOkx8zwreLiDSxac8XRBW5SZgJDluOJaUYCeHBR+X00RAe2COGCs+PCECV/kA2l1hjJZzeSCuNReOxADONuM5LffimBApUW9tPTk/AIGYLeXnHarUQcJrRUxAngfS4KD4sDVAxrUdh1g3ljGV/JsYVAl/25MjbIlY/ougZoDE1DUh3WC+KQkdemZc52iqkKOygDrAPLwqVt7zd0A7Ab401BgXs/ZKBhJdr+I2lgDi0RGui3Gfvh5efCQl3uXBWBPkeThPHKM4Qeypddg2C6kgf5umw5VHI9dNnmmTtQdwmJ8GefX3NKElT4glwjDeU7HY6zCr/GZ7NlygaqG36xX9B1QtgEIvNK/po60MF902Se1as7uBoQM9MhoehXxKAMOo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lRaUIZmqdZwXdaVnrmyIhF/BW4q66e+YYXWoqbpyhRyOLrBQ/s+IVJpJPAw7?=
 =?us-ascii?Q?prHBm0HRTWKBGwm1ZVYwraf5Skt1TZdIaO3tBQXu8k+TyReoJU9l3Pe2yjXS?=
 =?us-ascii?Q?FmaL/PZk9JzySpDix8LczGi0Yx9OCUcETQS6XzNMKiPXxeCZLD9zBkqwdD7Q?=
 =?us-ascii?Q?WC2qrLc7WlZH/dJbWQq0xdNVnB3iT5LT7WsweSjlfVAv5bghHzd0/uHX/H0H?=
 =?us-ascii?Q?rcgBLa2KT64aUjf6z617LuS0a5upuS+p4OJuiLCbQqTO/Qnk5gvadLGCvfq/?=
 =?us-ascii?Q?47dqok1PeahqjMgpBP+x2Z41k5VXdgDZosbc1CgkkdYQLq698BMXA1B3fd+f?=
 =?us-ascii?Q?YpAyaktdOel7XQrFeQDWNyXu/dJD8co9O95cZmDKKcariN7aJdWgzFRtOPZ5?=
 =?us-ascii?Q?NCQQcsHHchXtRAa9b5FBriE5TBqccSP01fhR4W5IvGdQIhDCQ6R2YqtTJ6lW?=
 =?us-ascii?Q?Uxrhht+Pq7E3xUhu/zYf0em30KCKkLuRa35y5Lmo8Trle+hMAqtjcO+7gzDO?=
 =?us-ascii?Q?D5eVKGrb3bd6R1bn1hCEq4oqT/qtABeG+ZfZk+sMvIftua1tCOUKt3eNe+DK?=
 =?us-ascii?Q?rISPuJ65PMOKbTfKXJa/1yn/RXXanffy6zwM9YD5KjLNosGrxawrE/VB5a43?=
 =?us-ascii?Q?0pSrW5laoZ+ZMwlMVjZI37slyuMOOPJ8adKRvPdBwkZ/9BixeQHWJLHvOEwM?=
 =?us-ascii?Q?XrILgg2OnECHH+Q5WSdOog8lkryNtTBwXLdPdE4pFYAZLzN+6lVsOU3nszrx?=
 =?us-ascii?Q?YW4immUvtIm4S3LSw262IktQbc/5ZxWjJzJkiUPvmQlVB1+KWikVXVV9qHK3?=
 =?us-ascii?Q?bT4uA36X5jHaEcuYCfXnTjPh6vPbPSsi0Aid+MlkRetoLlEkN/zH4pPjQPau?=
 =?us-ascii?Q?Iv700mDZwUW6YpdMft9WMdw1UX7CdsAliubqTW7N1TiDPxsqPqlKJ3/CyeYq?=
 =?us-ascii?Q?LQ6gZi1SzFHPCk4IjzKgovU8vlzgOdUo7JEGL3hL7KAAtNmJ9yH7sTbW7JWR?=
 =?us-ascii?Q?0SR6OEda+QRjcBBZDNdeSEGq2ho2qtZIkEelexFVwMkvaS63s2T2Iu3IDG+7?=
 =?us-ascii?Q?p3tTpzxLKNeG+hQrZ2q6m1x/xJ6YlPHofm/ZJOVZLmywnjgoK+0YUquiPWTN?=
 =?us-ascii?Q?cJlYhper4lIAaFSn7POFzlGbf/+oW2AOEnILo3jBcuZuw2kGlymAkeyv5ZI2?=
 =?us-ascii?Q?z0djz6+9BntPNmnsaqkRkjeVp3kirRm6UGP9wkWt/eMRiKepATWxr3ppB8wA?=
 =?us-ascii?Q?2KSbZbqI/F7U4ufyyGA0/BekfZWsmvBKOVfn5sf9D1W6OMRf4/AJF3RM+rvN?=
 =?us-ascii?Q?PYW2WjG6J+9L+MQdeEwFmOv2RNe35AGuhAp85g8xLvrZfv24ZBDPIeL9g52X?=
 =?us-ascii?Q?tm0wSaX+jkXDf61nB9JgnhWh8PgIYveD3svZY8idn3dSt2aSDk/zNwGpXP3S?=
 =?us-ascii?Q?xYPgdtWgeKqXrdpIw04SeZg5PLGS4kpspZkDBwEHPmIHTjTFUEcsL3s1DBA7?=
 =?us-ascii?Q?/e/Vudh17NjDvBErGuEfZ01SBzbggiO1bK9HwFMZGm7PWgQFkt6qX6+ARVIV?=
 =?us-ascii?Q?uOisXXF/oxNAOTrPu22Yab8v4f6y+e4aY9CFF4Xu13a/6bcjbsJ+0nGC4fmZ?=
 =?us-ascii?Q?4PmvlfKv8u7oKMOZxgZZ6phM3cV632HZDXrlNWivmHQHZASOkGNPu7r08ymk?=
 =?us-ascii?Q?YYSmObNzRMQ7R3qF5434X0/zwIvUNWUGpZcvLXiK1AM+HPdZwUxMo7icdJOO?=
 =?us-ascii?Q?sCccAtePXI1OVCLV+K3Rb/MGiaJi7BY=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf28e1e-26b1-4e8f-569c-08def6e75e5e
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 13:57:51.5700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syY0hTTYolrrTgQqGBS04dNkXCKTaBPLDSPNjKvZdCfWSrEb05dNiWGqrcLX/F5AYtfUTf7Zow5E1qJ4+msWNTZZUkwohg8/opMIQMeKPgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2363
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 13:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243133

ChangeLog: https://docs.makotemplates.org/en/latest/changelog.html#change-1=
.4.2

Compare log: https://github.com/sqlalchemy/mako/compare/rel_1_3_12...rel_1_=
4_1

License-Update: Copyright years updated.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/{python3-mako_1.3.12.bb =3D> python3-mako_1.4.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.12.bb =3D> python3-m=
ako_1.4.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.12.bb b/meta/rec=
ipes-devtools/python/python3-mako_1.4.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-mako_1.3.12.bb
rename to meta/recipes-devtools/python/python3-mako_1.4.1.bb
index b2c1a8dad8..a13540839a 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.12.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.4.1.bb
@@ -2,13 +2,13 @@ SUMMARY =3D "Templating library for Python"
 HOMEPAGE =3D "http://www.makotemplates.org/"
 SECTION =3D "devel/python"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D73026b50800163bd3c75cfdc121d9eb=
5"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc79ceff89df0a72f29bb0e1b6f0e36e=
d"
=20
 PYPI_PACKAGE =3D "mako"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
-SRC_URI[sha256sum] =3D "9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942=
088b7fd7af550a"
+SRC_URI[sha256sum] =3D "d7904710b662996425a21627710c4777c45053146942cf8a7a=
ebf757c92b8c27"
=20
 RDEPENDS:${PN} =3D "python3-html \
                   python3-markupsafe \

