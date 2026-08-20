Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E6DC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 10:16:37 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4159.1787220990999846932
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 03:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=YdjYLmyC;
 spf=pass (domain: est.tech, ip: 52.101.69.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHbeTVsPh8Z+JZeA8Xr2WZvG4jOPRwpmQB4b8mxz+1zDnxEvXw+bK2FGmbe+ari0jCRrRSx688OrxQStu6vOnUPsXwY2KVUhJgux0CijIi4f+jbD9JcBRDRFoHgTmu6r2U1FeGSmLApNLAVFh26mb7syDLyGK35AAu0t6k8371Rj3/r09w3DqjDzIO9cYJU2XDjhWdL2iuKVoI1lm1EyQ6KgjtcCDfwVarai3hpnWLK8WOsig+GNveXM0S92oADFMzFF5BOSaRbhXIm8/HxMMWLOwiv55Ncq0JTdwfrCRIkw61WSvY8rEHt5crE9LyXIbDvSsZX8QOx+BQaPN1IdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BhygpdbZf9g42tEphW/bLj/W1IhjOd+yUP9m0XqiPY=;
 b=Ig4XZPcC40khKRxw3MZ2wzJwlHZCdnE8Oa7Ir+vJNfIsiozg4Q41ba5O0MjqEf7pOBx/mXZkUFpsTrBMS4+/RolWm+SmJnlQOyYsQ/kWEZrgJDFrO/AWcDu2NkLN1cA6e/uQyNwTKcKBd2HGs5AF6k+xLjKuagjFoaXySXCbhtxRzgIxa0Mr1iHRkSEL6Klr7+kZtttMLjOGMG1PTI6rf8AtsX3uJTYKk6j39WFEYCrZKsBH0Bp+xomhvyWqZAKMYTL1Ff/kzZSwq++hdrAmoFbqJWr7YQf2JjX/VYDC6MEatY/5DLKN53ZUkb5L3lNuiSRB8gamMTrv7S+xvG+SKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BhygpdbZf9g42tEphW/bLj/W1IhjOd+yUP9m0XqiPY=;
 b=YdjYLmyCRAysvcIx+aG89DjMvQ/2KlAcBxgKRWxNgujgLqo/R/bNuV65+uBP742aIOfvQ2w6oXMZ8BGFhWyYgscW7hjgN4ZsK3/nkjNjNNF8ZmkANNeduhtLmQFqELMvWlNXHHtmfjXJGqPYNSVPyPhmoqDRnB98Ws+iJLriB0lgnhwGWkheRJuSqvHdFFujvkthkXPRw956A7sXF+PTuncZDnZAFBvsFEWrHhoC2WYSHgJogcD50ma2BTELxBbMO33j4gG5V+Ozr7RqrvT/2KoVeG19F+7p6xFY7jiloZGuMw48sTWEETffg+NlxOka+hiEIoajZhX6/A5SnGOzSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM8P189MB1251.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:244::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Thu, 20 Aug
 2026 10:16:26 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.000; Thu, 20 Aug 2026
 10:16:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] erofs-utils: upgrade 1.9.3 -> 1.9.4
Date: Thu, 20 Aug 2026 12:16:25 +0200
Message-ID: <20260820101625.7014-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0438.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM8P189MB1251:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a6e9b6-afe8-4830-c038-08defea4181c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|56012099006|3023799007|11063799006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	3V/4J7aEvodFtIjufDkGfi40T+EOckTLru0Hv5ehO7vAQ+zJhPmd/pzruZ3A6GkrQQ0Ba9MyR+Ky6iX281AWBszOZQM+D1NIZSfCdhRqvQDk9A+/ZvMFoIe4z7EpOBBGHSL/lQpVUPjI4pw/MMfD5t6ZUzgxZRsPuHyzSUvnawpMeTG3CaFrRyUe+4XRslDqQ+J07uX1xwNq7D2NwedpiJ4XZbwz+cmx2CAAmoPuWFq7Lnjw2hBKOSOjLiy7q7rwUoGTqR6J5NU4Ko3evOpnwqwwpuXEYaGTdUOV6GY8I1Xtj+Se7ckdW7g78m25tEuzHIBaZ5BI+Vf9YgBRveemXgxGV9pPRrVA+SY8iwEQfU6OoH/xU6zNPT5aeuIwB05rdQvCJgnnJkayaNj/Q2oTguxIEL3xoyA8ukiDg9l++p0dsImbN131sRxfmcomxwy9xuLSe9CW7nKLbdgeha052grYzWKhh6YaWZWPZkOTUjCOFWP6z/MjXNiD4KF32TPhpOlHechKtF1YNznOyIQXesIFMC0BqNyUqu2NB8t1b7Z4uv32z2/io/UMxbxmXL2jQfFan2nm1wKvGkN3b3JPfklsG1SR60SGS/Q6sTdGoJGEBV0TjU/uS8whkZu1v2L4jUx41aJ44e+dRFv8PnM11Jtejtl/NOEvDPEnwh1Nfa0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(3023799007)(11063799006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V5mTJBnHfRLWRbyW56jridKXJnnHDIg21S54Z47EsHJm/RJrLJ2w7aDM+pnx?=
 =?us-ascii?Q?bIvlVmHdKstjzXQfSIXBS/kxyhhM6lGOB9lrE3TDt9aslKm5YcgioUx0rICg?=
 =?us-ascii?Q?OKjIGxOVijD5tOnPZyklNKM1QGlZh1TnK9v6pLVgW96Cy89eq7AOtdcmlhyw?=
 =?us-ascii?Q?4XArWepRRCeBq622zyY331iCQtdnqwzbHHifNOn95HN5WW92BY4atwGUQMB5?=
 =?us-ascii?Q?5mqApUWENThJ5H2SjWB5xgTfsfEeJ+/+2uE1ULuiuC0uzhpLYveCdXjx8qeb?=
 =?us-ascii?Q?JDOSh6e2yKHmlnd1W6OWBF9EDGryTnpywBTooy2xfZ3AE5I9qn6NH7YXfamM?=
 =?us-ascii?Q?UOWzHqDcLus3MRqc+lHvR2mktML+Qsy7uYV3O4cTacTyerYXXf5/iG9X7rU5?=
 =?us-ascii?Q?/22edEQZ584vDIG+rA5kMWW7hCd/HKsZRdTTdLqnv1zWOWPjnoY1YyI4VqUb?=
 =?us-ascii?Q?jOXRX5RYopCDAJmi4GcUpy6rhlFqyGVEeCN8qYY2H1O0JNxY8D2MadJIpPzZ?=
 =?us-ascii?Q?yfXZQh7b37foo7OSb/bodjFBbEWHOFnS1lvS8Nnml4CwMnlZUeXHyXNyn2zE?=
 =?us-ascii?Q?8pud6TsF/ZCi1g8LlVkyQPASxTTlfTbSlLT35ZoLIy+sKzkAu0ojPd3Wkpo7?=
 =?us-ascii?Q?XdyLfjSV6hKUhkErpgiYPkX3S+8XwK6FLHQVwvPt7L0rWEvqjFcljPC/nkTT?=
 =?us-ascii?Q?MrvavFlM2dhbW1IhZtSG+IWoTY6hr7NeBr1IxDLTEifFY35XCMM8rbvueOYL?=
 =?us-ascii?Q?Idi9C7FnOZmdtvtWbGqCGe0ADkOBOEfzDDX9DM9VCKiFie7GhI37cjRyVN71?=
 =?us-ascii?Q?lPGb3woq+QZ5cnloFNLTQ5Kr+7egcgyLmyZoYxLKfvTkOBoSYb83mSwtIV3L?=
 =?us-ascii?Q?FrJK+rZiWjdreajxbIGhpycDgi5AABN2C0M1f7NXW2KVnqOd/95ZXmLq+E8a?=
 =?us-ascii?Q?Fnhngan0tWDdwzFbC41BwDj1PKtPZ2VKbtnNIIg+3bAzfBh8yPNo3xzWJaOH?=
 =?us-ascii?Q?U5Ft3+pnRTMCmzwW7XLg9gixqthcl7BUhB1YGqgz3UNUfWUyqtiWQASVocbe?=
 =?us-ascii?Q?RNGf17SoVSDGJtDkOrVeS7j1LdMqS12UGbDxdipV6d9SNTG9g9t++yXiKqql?=
 =?us-ascii?Q?/0h2rXM5tvktIiFC/MNVLJ17c7eZy9xlocHZCFfRwMsfnJ7S75z+N3H3jprD?=
 =?us-ascii?Q?ZL1rsANJzwIkoE1gTQW9r+/J6RiXiioab6maxKm3BgtZSV9dkQa9yBDx7nRK?=
 =?us-ascii?Q?r6JZQ1Bf9RbTwZyZO3urWvdyGpg//CTrKQ0YsslA7DgJsX+M3UpqJsKrtiBF?=
 =?us-ascii?Q?YPh0yG/ji0uGNhH3Ls3wKpHbZ0C1KRYvA+e+pJaSlRGv8wARDmIBeDO7wuQy?=
 =?us-ascii?Q?T/1zv06BL7Gefk5O6hD+1HCq/zgY2lcdnIPiI6p51h0D4fDdrIQe+3T9IjbN?=
 =?us-ascii?Q?LA285K67nQ3Opmp3PJtHMM37JcD6oLBHZ1EF34FrPpDawTwJkCfyd/mvvBlq?=
 =?us-ascii?Q?npvT5J33SvazOm/agVoqVKE5ZZvrr66ecd8JKSuySOgP1yWJ6rVraS08Z6W8?=
 =?us-ascii?Q?kCgkfh0GJjA4UoFFAO+ZrDeARw4OVxaZzT2ivEq4jlmRLjcm3iQrB2A1oFbB?=
 =?us-ascii?Q?VJtT5NlTn24P1K5fZ1Y1LuiQAgglrIsNAqzkrxTy17J2h+h9CY86lkInKw69?=
 =?us-ascii?Q?CA2a78fiuUxGwNUSq83K5MuvWtYzWqmRDOYuBEjEX6Nyelwh2ec5dHlHN0r+?=
 =?us-ascii?Q?adD/YhHmLPykcdZGn0tBkiu3ye8e0Qw=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a6e9b6-afe8-4830-c038-08defea4181c
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 10:16:26.7060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AABDj3hT69r7Fhyuzqm49hoCOUq3twiVTJgeu0ILpAI2s+XtwZHevogjP4WBUXmTotgOQECYngcMhZJClfaAXjhqy5BRNaROTTu3/IkpvMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1251
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 10:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243847

ChangeLog: https://github.com/erofs/erofs-utils/blob/v1.9.4/ChangeLog

Source: ChangeLog

erofs-utils 1.9.4

* A quick maintenance release includes the following fixes:

 - (fsck.erofs, dump.erofs) Fix image extraction when `-Efragments` is
                            enabled (Seula Lee);
 - (mkfs.erofs) Fix multi-threaded compression crashes on macOS
                (Isaiah DeRose-Wilson).

 -- Gao Xiang <xiang@kernel.org>  Wed, 19 Aug 2026 19:30:00 +0800

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../erofs-utils/{erofs-utils_1.9.3.bb =3D> erofs-utils_1.9.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.9.3.bb =3D> erofs-=
utils_1.9.4.bb} (93%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.3.bb b/meta/=
recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
similarity index 93%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.9.3.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
index 2b849f2a4e..45339656b5 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.3.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
@@ -4,7 +4,7 @@ SECTION =3D "base"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D63afa010baddc7d0905f9c31ac759f5=
1"
 HOMEPAGE =3D "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-=
utils.git/tree/README"
=20
-SRCREV =3D "7db78788b000999e2de88decd2ba90654f26171c"
+SRCREV =3D "f36cadb5c563995ab3aa8572a60ed6b721b9557d"
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-uti=
ls.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv${PV}"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>(\d+(\.\d+)+))"

