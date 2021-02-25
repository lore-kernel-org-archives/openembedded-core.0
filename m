Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web12.13557.1614269081612739196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 08:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=EbrUfvC3;
 spf=pass (domain: spinetix.com, ip: 40.107.22.45, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzEkO4HiEJqYIAvt76erLbPa3ixIRVC6zyfHJCmoSqJZyTQzK2UZTjElpGICwevJusR46CR2249NFvcsOTqpTP9GzhLC/il46WfhBfGjmkqVqLJTDIbERp7y+VVmVUsJJePjuf3neDxEa/gmB3MN1DgBCjCSbScEmck5GRtPpbhdsu/mUcwwyRj4+OQSHicZpconTZlAr2LtT96s+fwESk+VN5nWhL4DlpEkfQ0Gz90//fVCpUTv3zB3/ZnO7z2YJxjz4KJ8aXHAsLAI1JKhj2LPo1dawYP3zcryZHNlCa8X0rF8XDQgeHE+Y2TGfDJQiRpzngvZ7/8eyiUm0dWNfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wafF/PJXMO2zdTmKoSMOe/jYePeoI4bMfXUS5q8c90=;
 b=KI/kDytaJsNC6yOm76AKxyLwmNc03wNBQgjM3xdHaYwC26zyT2ADJ/+aiEcygsYms2SZoOK2stSwd1kcJxkGrbnZv4RAleRnlQoGsSyFnWHlHqt93Vcbk955CuAfuaSWpfjrSUgmphWYKRbQ74iA6Fl/BtmqDeijAFyZfAOhRYPTgaziNYGFv7Gn9qQvY5/wJY2GMwcbJFmY4B9hmkcnGOIXrx6ZPS8epFexk+dZLcp0G+R4HAH/yklqTFaOZANE8BxXYvlaIpf1STisdbh4wPEKG80sJeI7X4kg4FjzqoV07TfaX2apFkPffATjUCKdTWQWrDIhWiDh/g1m4JT18A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wafF/PJXMO2zdTmKoSMOe/jYePeoI4bMfXUS5q8c90=;
 b=EbrUfvC3CN55ILm5fw2EgxuC/R2R2YzxaUFzfnWOdsydYi2irM33wmjrYcHQgnI3o5ZEh4clLPOEn0SObCI/tccQEv99e8AIVhHQgjfw0HxvD3j0FW11XOiWSV9SGN5qEARZ/8ljao8E8+VXm+3T5GYORp6igBnWSnwFk+GPeXc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DBAPR01MB6791.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:186::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Thu, 25 Feb
 2021 16:04:38 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b%7]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 16:04:38 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [PATCH] sysklogd: do not open any network sockets by default
Date: Thu, 25 Feb 2021 17:03:56 +0100
Message-Id: <20210225160356.13696-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0052.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::21) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0052.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 16:04:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e98d0a7a-7847-4cd2-c5f1-08d8d9a70d4b
X-MS-TrafficTypeDiagnostic: DBAPR01MB6791:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBAPR01MB6791098D0DEE954078EB1C60889E9@DBAPR01MB6791.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BoUTb0M8WB7quLYc6MhCWEaUx7T5QXiqh35jxyd8gJTxNxCQQPbssadosF3Kp3MzKkNK8P2I0aT/thmZuk0YUurXM9xyWLjAKsNUIb2dhmvRsbMCd5WhAU+fQNMXL7+QFEMAaBDe41XLnar5UUXYCThlbF3DLXFgKdq8lx2i0Kushls3m20GbX86ht3Hi7YlOCpy9/u9bgfWjuMlAtqfj9vcc/gR7oRFqkCXTxNR/c0F9crkFtr3XfquerXyiWns8k9ycJj3sPqYtnqk1LM5h3uVkLehiaBHD5EcFkyvJ6IFL4v9ZaLZpKcaCJuQb42IJ1eJ9oruZOb54O5E/UxE2jqgmwi+JOtSSd0VIXaHr4R3yte4vcPA/bPQPD6pxymkQdm6Y2r78XlEHUGTOpXuCgVy9Yc3599doFAtERcxdzoXZGUum3QkALlWFpa4tPop44TMpGEBoB26DHw01LnI93ENPx8nXIeDPwAn9zD4r/tq6pnNBMBVvAhRjqq3t0nIgWzGYFNgfvrfELzklu+bsw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39840400004)(136003)(396003)(36756003)(478600001)(6512007)(6506007)(52116002)(1076003)(8936002)(6916009)(4326008)(316002)(4744005)(956004)(186003)(66476007)(6666004)(16526019)(5660300002)(66946007)(26005)(66556008)(107886003)(6486002)(86362001)(2906002)(2616005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?vs105n6PXGR84WfKU9oZ5Zu/eixS3kxE/n5N9VjqBxScsv32l3Eqy9RtwNcv?=
 =?us-ascii?Q?gzky/DoUHd40UTdlmME65kb+haf4BLdzpgcZMt0yh/p5uoP/z7bye9610fth?=
 =?us-ascii?Q?v5CsJEL45irZjjcdaYT292qcCUZ9z2dmNbEuiqilVv+l64R7ZjfMJsPrluKQ?=
 =?us-ascii?Q?iNRBJZaEQsWGDrc9Wt2ptROVF0PTagtD4B/WGvfseW/uylTQ/iNZsYFrzulC?=
 =?us-ascii?Q?GcMliZFwZYI5+623CiHcVt31EHV5qnpyT1AbSDKeNWsVrLMrgE2UZfBNewhg?=
 =?us-ascii?Q?bgYlicj4Hk2YiQKVSBPRAsdfSr/4tNQg1SLS3rNMqThfFH9n28XfysDUjlEl?=
 =?us-ascii?Q?QV5IQdIGlBtEgfDdIICMMqeqSaIIAJmY3OwWBmHiIlnfeqAf1XdaPHLtKHsA?=
 =?us-ascii?Q?2VSzUwO19fHkZ0JSeR+ULCoYQ+HOZdhdufFkwrhdCii4YLwtsnFe+kdpS0Fk?=
 =?us-ascii?Q?YpXJ+DjzqCBwxmXw22jHgCJSlVnZ6N1BZIp9tILwHTC+6vVqoPcIqrVknrVz?=
 =?us-ascii?Q?oZKs2JvNq6hRqVf8DuS6PgITYOfO1KxHMHl2hKvPIYg/+CzP9tNb2QV1knMO?=
 =?us-ascii?Q?h98MA7W6Pxtqx4Ps9i8eS1spSXGFOlXFV3UEiizhgH7K3J17Z2/KEbl8ITNO?=
 =?us-ascii?Q?CNaYfE09SEFuYz0u8MBxfjYtVTOajmK6h1MX6PPmePQQkSIGjgwx0+QbSD5P?=
 =?us-ascii?Q?+1DiZ7WYD+6HEuwDdZfJ+28I5i0kI05VD5OnQlXKtke12Btbj6MqXfRZGBtB?=
 =?us-ascii?Q?XfzjDpwlWiaOb3V/AzmFa8K3MIrg6WuK4m1qnOiH6iKXmJzNzfxEzu2XUrxt?=
 =?us-ascii?Q?h2JaEJIEHIyLeupFmZNzmi5CyuEJAUBK++CBNzORlR8OhGu4N8dtqOzZOglD?=
 =?us-ascii?Q?zGOsPAGU+GEEad+vGOZ5d0j4RqkUnycmg87wmxvKbQkErJXWAUXgD44oW1lV?=
 =?us-ascii?Q?pTqFoup2DELf86NSiBDo+YZwDN9XEJNaU0QtQagseeOIcZZbH1h7D2As9aK0?=
 =?us-ascii?Q?ZKyOGH7e/CEW6QJg0cFCD8pqNWXjxR6bOkGCHNFp/xzKEgPHI//AyEaU54sr?=
 =?us-ascii?Q?sBWvQw79hK2WIWpP+qxUGoxiZieFk7sqNHAYcssnnbkVet5M371UZiGDS/Ja?=
 =?us-ascii?Q?7baz0TQ5vB6yZyvm6V46vGEHP+TeGTYu/Lean2vF3dMlN6Dc9LPFeFHXRaYu?=
 =?us-ascii?Q?8tR4HcnOdoXkRxiKfPEbO2dnk7U+l1kswVDF9/+p7BhAs7uFqicLwJ2IGowh?=
 =?us-ascii?Q?r93oeiFoo/j6Wj3ua8zjfwIUKa5a4YL+Bkl1+b/2Ol0FtAg6ZjlqEkWKveh3?=
 =?us-ascii?Q?b70ZQ08vGt7inoZ8IvV7RmD3?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e98d0a7a-7847-4cd2-c5f1-08d8d9a70d4b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 16:04:38.3098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xy9KR1+GXbW3G5ErrwpHmMZt+ax7Tzs3PHu+77oWXjNxcE1E5634roe3u6as8h8SQXFcCRoEimV5S5IIvOgLjI/PObCgqAeLV4BPan8b6T4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6791
Content-Type: text/plain

The default in sysklogd 2.x is to open listening network sockets,
unlike sysklogd 1.5 where the default was the opposite.

This is contrary to a "secure by default" design, so set up the
init script to pass the -ss option to prevent syslogd from opening
any network sockets. It can be overridden in /etc/default/syslogd.

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 meta/recipes-extended/sysklogd/files/sysklogd | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/sysklogd/files/sysklogd b/meta/recipes-extended/sysklogd/files/sysklogd
index 2a356a637a..050772b59d 100755
--- a/meta/recipes-extended/sysklogd/files/sysklogd
+++ b/meta/recipes-extended/sysklogd/files/sysklogd
@@ -22,6 +22,9 @@ binpath_syslogd=/usr/sbin/syslogd
 
 test -x $binpath || exit 0
 
+# run secure by default
+SYSLOGD="-ss"
+
 test ! -r /etc/default/syslogd || . /etc/default/syslogd
 
 create_xconsole()
-- 
2.18.4

