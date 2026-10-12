Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085C4CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:47 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12999.1791811237221481756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=WaZEIxfU;
 spf=pass (domain: est.tech, ip: 52.101.84.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6wiw3x7xECH+NssJjx2uaVKEx0sQ4CVWVsjAC+aV51JEjDZt0IWQhWkcfsn0uDaeHoy5KLn5x/UDKNJYWIkhaqQfl/MsTODmi1m4Jewq0XJP7khqVp2v05j0eZpDhyg/ubzGH71hTWGJTkkZE+uQfShQSl7wCEBKSJWt6fG2P0qKSGLi9gKIN1mMfDGIheOmrQbfXuC1206Ow1qv4do4dGJGI7UAsLRhFi82305FZfTJHs/4qhwIyouGjbYBzekucRHNN6NBDePP7/HPlq8VIHcW/6zdT2huSWzrE/i3FEXkGXCjmTsD9O5N+sVtWh/cbhqaAZB6DbK6zUEfy78Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5fXjZtpHzaLQAQFB981zIfNTOwYACXBBNTfu0CEQyw=;
 b=W3pfYJOqOrYUvBcQ5czmW3/OIYRGY50A2prbYeQ1Yuli8tQquOxtS8JFWgIBItwiy8/Hc5WDIGHey2xtSeYspJQpFNd23i6uNAijSIekeKg3S4hQku/4O+VLHY2xiP9T0YoewPl7xs8OXzSgNLBMShf6pOdJI0t6xR3FipQvLFlOBYQWOVhqbh+zXpX3b8BKAlyuDbZECjdciDTfDlaTU7Q4MCQYD7Dw59OaeV5KjqdWZBfMyGxhW5NSJaVzfhrtziHUyUhfcq2frhRSD2Uafzuko4vgXR+zBXONLCD27h/804F5Ll4hCi9Uqk9BZY2FEwOjPeSbfsji6YtYflg0nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5fXjZtpHzaLQAQFB981zIfNTOwYACXBBNTfu0CEQyw=;
 b=WaZEIxfUL/1JFGWy/VnfYVZ35V4eeb//pUwt3iZrBN/nWGUlINAvW/n38iJLp+VSY/E+QbPJcfbvb3NCpBKwWj1mIuCH1zYU+y6u0hC2x99aJtIdsF5g6bFpVMC2Ph0GaRRQ6j4u0NqKIvx4VXIekSaQ1DXsziIKmJkcrMjVeIDh9/fSBy/2Z5xWf4F4YL92VUEPKgvBb75Yx+JT03yrISMwwv1+nMiNCNXjL4keXhO6XSdLMpFfQ9/iqlG6i03L2xpA5cpLWUjIBNEfcvDHSMc6jMl3gxL5w6081h5EoJY2mQeQw00zdWxqL7N9hvxqw07v2dDR+FuNcdgfgTQBxA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PR3P189MB0937.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:45::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 13:20:34 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/18] python3-beartype: Upgrade 0.23.0 -> 0.23.1
Date: Mon, 12 Oct 2026 15:20:05 +0200
Message-ID: <20261012132005.23909-19-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0045.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PR3P189MB0937:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f2e7dc-b7e8-4ac7-a367-08df286398f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	7/mewN9xBF7jA+l710Iof3BQl3tB0me644YRDVEd2ZL3NpIEUSUc7HGGqo7zZDfCtb/iA/lJLVaF6AK6uWAPoHEkt0ULMlVfcg8MaEbpCAgwDu75K0K31PVNhvVSCnwRekT05237AN9+d67VmQ6cEs01dm6ads3VWUcIa8jTB7WnkJXcO1FCxGuIOz7E+h2YmY2DAFUo2SEIvuOoRGeWZ2/jHW2kKQv2EUWuETXA9N6mJh7no13jpG6ykYjBHF7w90cU1Ea4814ZqDipRpAz3sf/Q8hzK6wcugKVal+HeT/4wKKxNMWw1+eEqeXCK400wuiG1F+mO5LMAQSEoo6TJhBss4WQ9Upeq4b9wSwYxE9umiZ5nkP/E9qYN9FBjV7Y4tOnx4qmUdsnshlcwJnKjCnGdtenyGhaRc53nV296uAikraISlZl27M7V+tLy9Jgzq+virIKgYMY4KUixUYiYv03ou12xYkkViu8AxAjE1mY6tqH8V0LkpCst3AYqvqPnEUmyzXf+3Nv1dIekI2vfia2kIdPd9u0YKmo06l6CZfX71PrEn9SmMT0Bis7PqFkJsW0LmE9ViXV0CLdzIakTT+kPK3VWRKzgNIQSXrvW/0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RVFL3wKkifEwYEP5/7w9Kaqt9w1KtJgcBEK0PlykeKC58da6LsJzdeAnqx/A?=
 =?us-ascii?Q?PeaY5ljXdishpFGnDbs8rd/8LCFOBuS1MlibnNlEbd6SY2O/Q1z1L9KT3TAG?=
 =?us-ascii?Q?m74yG47xyyOhqqcpNwU+7jpwct8Dg/sY5yN4ZugAQq0Wr+TwdHgx+l2i9viO?=
 =?us-ascii?Q?d67Zpy7mHN1YljZ7/UEcggxcrxEcsQjKG48byRdAq6ES2fenvtc38KUgqqnl?=
 =?us-ascii?Q?MqLSlxECl5Zk00sUoTrxp/CUgrTHUyySRlJrMFNczf23kWO17jZVf5qoz1aK?=
 =?us-ascii?Q?oLEDnsmGVUYOq5W5x8Hbg8rPq0Kh4lLi0mL3Sg86/gfakRBle35slCcMbrZA?=
 =?us-ascii?Q?qo4ILc9MjdHBzq4N5tWnkc7wqk0PDOw2u/mt7qibG6Qw/59c/kgoQu7CyLBi?=
 =?us-ascii?Q?MO/NL24mlyYIVSUV1hWmv8mEvF3C457KsMc6+N+r6Q9Osj1aVOZVrqPysPCs?=
 =?us-ascii?Q?Mug18UAW3FFY1MElu7euBa7TqDePh/E1YhtODkLGbawtpY9+7QsawV76/9Vy?=
 =?us-ascii?Q?bwR65fm2Emyb2A9ZaKJg6RpZAVBhCF9J8318uNONyv/aXpuwqQK55DUkZFAa?=
 =?us-ascii?Q?YqRwkjPBBB6LYrGglYPBN5Dtx8iF6oty10l0G4jaP4pm4slB7b6avXa7qthP?=
 =?us-ascii?Q?Mbhlea3fV5DSMyJlWz83P6ye9cVxsYwrvQv5UdLGGC248913BcghDpLDdh2+?=
 =?us-ascii?Q?FKEdEi7FeT4LxqdE3dXRKWyTmmN7l4HYvtRJKROuKOw4VcAVt/O9iuRJ3H+n?=
 =?us-ascii?Q?RzubVrB50LJhHhq5Fy0Ibn8YALwQ+v1dL//UNcpAQLZlNiTsXmdyTwSIvrlY?=
 =?us-ascii?Q?p7LBza/1GRgo9GmtjK0jsVwRSUQbxw6xh3Xp6cm+Xfn6KpwPnV98aFcNcW8f?=
 =?us-ascii?Q?sqYKuvPB5CbmWCSOjew7+ABKq7BTGCZamlse9KkO7RpQiP2qinttCvUCnyl+?=
 =?us-ascii?Q?HBVRpzxDrci95wqwlums4iTJeXRFlk8/QsOVMP/3V2EM5WgyVvAul66GnO4K?=
 =?us-ascii?Q?8GfSXl2izLqLaF1iZPa+NFxxflCkesk+DWQhWt8rOhqMoouMp9w4IBr1Q2lh?=
 =?us-ascii?Q?UfxxNxLezE66Vp3QrJ32QvBEQ0Yn3snsICPSZgl8Qs//1nJE3DBl+BGu1qXC?=
 =?us-ascii?Q?LjX/zGQ8N3wrYGAcmAgBnU45w3UTpgnlqYXHbCpeFI/06wO0cQo2yZA+ZIVU?=
 =?us-ascii?Q?C/+cEJQuZZ5uvp3EaN7gzh+gGzDR2cDXNo8Pt33kHHknPPtFTkQ14ltIaBQN?=
 =?us-ascii?Q?H6S1EZJI41pmK1/Q06Cfb1vRVOfWuqf4YIf6aODXr3h77QVx0uVi14JmH8na?=
 =?us-ascii?Q?YN2vmRz+CIlnTwSgZPJiWAoNliY0AszZrnuzTWQlf1GIKDF/h+CTQDBVlQ+n?=
 =?us-ascii?Q?hN05aQm4Wx1R1tP3s3W2Kn2ygW6UYwG+xSV5warF3yJwr2bkh8QBStEqtIII?=
 =?us-ascii?Q?T8VYrMUpv/Mlm1zu9lsTnacNPXskTOn8n12Jr3NB8jL3u+YOUyPwzsIiDm7C?=
 =?us-ascii?Q?deelvlPD73j73Tp1YGHfns3xjCPMz4MRan7NHsdUMNj4gcwz14iz8HhFvVor?=
 =?us-ascii?Q?O9q7D/mHrjyCNy2WBYyVhknKWeWMxg8X/TDYcGoaEUjNq3yOMlSjtGgKdbzq?=
 =?us-ascii?Q?MfaWAaptJp4xhghJNqI2v57KSNv/f9dBSngxFLrbki59Qmdn1qzKnFODi/zm?=
 =?us-ascii?Q?E+Y4Rf+BrWCburELvbkJ/iIWBPruE5IuHT4MZq+I8KJGJaS6QqzKtsAfY8fF?=
 =?us-ascii?Q?gkLb3WzKig=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f2e7dc-b7e8-4ac7-a367-08df286398f0
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:34.3725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuSB43uXQnHrZ/8s8GsyamslZDsmBU4RXDV4RmLcqsEc28DSKqNJugZxBES5htPgVm+aDIbuWsMKh5JVlijrgOvQqWPapae4fPLvJYiV72E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0937
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247662

ReleaseNotes: https://github.com/beartype/beartype/releases/tag/v0.23.1

License-Update: copyright years updated.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{python3-beartype_0.23.0.bb =3D> python3-beartype_0.23.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.23.0.bb =3D> pytho=
n3-beartype_0.23.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.23.0.bb b/meta=
/recipes-devtools/python/python3-beartype_0.23.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-beartype_0.23.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.23.1.bb
index fc2b40d6b8..8cd5431e8f 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.23.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.23.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://beartype.readthedocs.io"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2597b30908b2171ba6cb2080fd5be4c=
5"
=20
-SRC_URI[sha256sum] =3D "9d915ce043a2262ee3eb110d1c1c528179f06eb4145e375a75=
0f72ddbdf40fa3"
+SRC_URI[sha256sum] =3D "8b805f246b32931c74f2b321ea0939fe5bb2ff43c12a3eff19=
cc4c854b832e1d"
=20
 inherit pypi python_hatchling
=20

