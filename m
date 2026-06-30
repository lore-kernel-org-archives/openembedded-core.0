Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523E6C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:03:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20506.1782824629519947459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 06:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GLNzg36A;
 spf=pass (domain: est.tech, ip: 40.107.130.1, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDQYauVnZa+AB4KvAl/lIfAJLlPTyFpaqUG68/cZn0ULVToygXMTiNGeg/nb7Gi6aJuGzjpoDwXVgjaCn/d9ON84/0Bqx36SN5yaYaCZ+BYqS7tvSYU8oazw3tWymPzCvKlZ6QK8z9Htxs7uq3/vUL2odw+XkzmHM4kd/RT28ui4ssyf+JPtbsIGRthgksUDWYmxWbGrppVhaLQYfD52zZ+kdtLxSYTtDD++4hr8ZHGUgFFzCTRZqm/HiSK2pvb9kxAvu8f21YdtsDcsbDjqy0M34nss3yF4Qeh9EICrBY47Mh3hutMnAWYU0tdEUh4Bb+eEm09Rm6BdkupBmI9Fxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcZ/inU3/87J5eBcdjB0iBgsJ0YuaZSh9haFjtchX00=;
 b=k7ANbea2JgWVCjwJ9/v3O1TKBhCAAljVlpNyGCV8kzb7YrbPx1rSKqDHP+n0Sp1Mm1SWT87tYeixcPn2+orjU/ceZBXxhR8ZPLlbAhlrK6SbdC9p0xzLuXCs9YLJ8OHv7hrNYpt+PxUmj4mEENsTZj8K0P74pxB8oSaz+aHjQnxF8WFBCRzN4AMQApeMD/JUVW2ZGmy0O4xnjya9g78Q3D4/SwKmub90bcdBW4N0V6Kh5gmkYMAMXCCsfdy7e+nYd3rPkCHmdbPgDdudWJihxBeSSvb/w7egiwt6aPuqCn4Gp9J6ixOJAIGB67R56EmuIZeYGeom7lAY632Z4Qy8Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcZ/inU3/87J5eBcdjB0iBgsJ0YuaZSh9haFjtchX00=;
 b=GLNzg36AEa4z7Qns9mqfI4U8nph8flQR7QkjfiStATLGv+bbj3QFZIFS3R/GT5U7rbt6/PqvrlpbU7bY8gMR/Ne8KKhEABsbQn0zLRH+XeVcvU6igzqE8Xc1LGRQ3SjTfYIFXpxFzAd/DKwK/MJro947KOf6Cjv+qAh2x8Zjm+3kxqjzQ2aEgtTjNYkgOUuumtbA3z3n9So39zO7Uik7MLypZXdlV0/d6dyHGL2asNFUZv+w8e5BTR6IUuVbmuiB8IJuPTUfOMkQM2KQ7Sqwg71BMI59OLjIho6cPNoDpEsS0ibe0xeP0wpWl3OG+lgNjswKdYciS+QmnS6LW7UMYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PAWP189MB2777.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:46a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:03:44 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 13:03:43 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH 0/2]  gnupg update and fix outstanding CVE
Date: Tue, 30 Jun 2026 15:03:39 +0200
Message-ID: <20260630130341.71014-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0038.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::6) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|PAWP189MB2777:EE_
X-MS-Office365-Filtering-Correlation-Id: becfde4b-4ede-41c6-1264-08ded6a803b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	/+vCyI544P6wYrm5BDKohGO+IHez7jf8pRRUJpeOjrVlwsWYebRp/DppnY4NZHE1G8915q8FeGwPcZE2EPspbk7zASOlpH1oFfbnlCPjwbN07zvIukgZgN67uIemTd1fzeBnztyh5o7+PbDzMbGMK3ERcbWplJCO4kOFRCxAXwkKjkjaLzQ3S0RBIl7viKYw8BhY4kigfsAT8Th5LWGlQkchCmJjIJpwdzWYL4qq1EHJds7geBeXSSv3H672NdQFbPHyrAViHzxQuk6Rd8f54qzgCZQvc5EzDjo4ZtR8YOle5hzDZD/r9pACx2Nhbe//PX3ynN2SooqD9gP3Q/Uv4egQPo4IEdjsTa+48v3Nbwb8Qz28lG4QOIItKHNnI63Sx2fN9YpZMQYAC5WkoEKLe0ceoyWeZGST/6KTChu8jHDP5J48n8Y4+FH/BXJP+dqHpGKoH43Pi/5W0Fmjbse1SmsxlwkQX6oxPm/MFD026UV9SQyrbwU3mkWKnWNEvWNhpcrtQY+dRo00BkTTmRIXJkp22HLvmnf9phvM4F7Z6IXBs676uckoGqGvwWbSKtei7fGQPKsMMHW8tvRwizO4rKkvOq0mLk9Wj+V9aOGLMzFsdstXWffVLdj459kObnoK7l0t+1/UYxaGSc2ognLhdSxsOpnU7cEWY+9z2hjyDek=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K0KaR1H0rEZXRumhzTkqBePqEoxmoPphC7qdTw+NsDY2CBR5GL963EUd9scs?=
 =?us-ascii?Q?jKl/NBiibCd19seijE8G3lOJSrBTeBFqBBPzL0oIUFEgDU74Uh6kJakf8taY?=
 =?us-ascii?Q?q0n1w+BhnhZhzKc3GtfaOuJs8vkoI3eQYuE93gHzKJJoSxxGmC9LWM/MQRbI?=
 =?us-ascii?Q?yJYIAvOn1X0kn0O5yitN+wu5NnL+oXyk+/elOCvTtD7WKkPOkCZp58YTm74+?=
 =?us-ascii?Q?tQUyZHgOJW1oNSI1BZLbjbQSPm7qZ7QShSwNo9Tt1XIj2BFHi60gv9iZawSl?=
 =?us-ascii?Q?e/oYZt958FEwVMBzIkZupiCUmt5xJzAtpu7fNweEi9vkhXGrG11qVkF5th92?=
 =?us-ascii?Q?uCpCekSXabZx4brDk7EgWaQ9CXYjWuaDekfvdIu0Uc0wDU1yO0nT+UrxV5ec?=
 =?us-ascii?Q?f1dULS7i4TWY/dThHamtH3wvTMjlq5SX+Eca3RTid9jd7zg/qBmiHzY94eAm?=
 =?us-ascii?Q?rUnGWJldm4deA+/588nH6xYSmpV6KeNnlCQw6xr31rsv5voq3Oe6pNRj4CEZ?=
 =?us-ascii?Q?yUBwqQ3ouSEaEjGV/b6GI91wFl6NSwY1C5OpWTCK7N89c5hiBvc1a+5G2UG3?=
 =?us-ascii?Q?4LdkvN++RtOq4DCYco0dC6P6wbz6y8eLxi63nIuIjMAh+5WSk+9KjHqpsXw+?=
 =?us-ascii?Q?TBsrmpY/tkHlZinAU59IsGNbxch64LwdCP2a/CMaMlvmCes5dqt93yqsFpWh?=
 =?us-ascii?Q?xbIAWWZztLRAhZjM7Xz0gSK4Ra5cFl/B+zd8LZoAln4/XC7A5Wj0De3RA6Vz?=
 =?us-ascii?Q?1tWuYBA3ivqdrQymJc90MWTbWUe8+G6t44LA0n0eCW8XcDH+0fqDiopCEQQ5?=
 =?us-ascii?Q?ewZ7oFZFTLD5rP4KvVvMVi0FzWMwyX98Cdegci9laFuy2aoCMAHXxAUZjaUH?=
 =?us-ascii?Q?V6ja39y+Kid3LT1k8vAE31pEHbD5M1wL7HEKQMoYrWnwnWPiveNEt2K3qc09?=
 =?us-ascii?Q?UgB56mDVvUFAgHi2iH2IoitVo1MDhQl8X9z6K3yLXwkMQteaCTIS0Y4Tj2Jz?=
 =?us-ascii?Q?bssUQBDHSK4XIAsAtCOn2D0ha7YZzQPv+S8kR7Sr3rwZD130mgav3tJhPYA+?=
 =?us-ascii?Q?7Jjg24RQBHc94btygn5w6Q7FUI3QQsRSGvd9nZVweOCPxv4wLlY3awoaqNFP?=
 =?us-ascii?Q?albjplN7UeMaTtfmC2Z4VeAd9VdYnaPtSLMDqBGPBTsAAYfBlmsrg56LWCsb?=
 =?us-ascii?Q?Vm8E8aT76X9xxPOJ2tjWl2rtdn6tg+p42GEG761t04YeODWWnw9cQqiCR+Bb?=
 =?us-ascii?Q?rHPfjsyxOoEwmYo7bGqPQM2h3G35wRNInVqSq+wvS1+RMS4C/gY6QhvNwajX?=
 =?us-ascii?Q?UxqJ/vKclohizSnku1iJ6lCzClHeOU+0Vw8ztlVEwn0n646NRShKZWanPNRr?=
 =?us-ascii?Q?vEDDKvUF3EEGz5jTLogqmfoz2aryxUH9FYVyE9IJIOOkQgklAFO55ECK4bhQ?=
 =?us-ascii?Q?dbDMMqvnpQO3qJIRyPWeLX1k0F2qhF/jj8aXF//fqVzNURwNEuXIvGCns4GL?=
 =?us-ascii?Q?72xP2MjTxfVXIf6ih/XyWJWTOyaKJS8H1QpACEPDIvmhhejFhuk9LeCFQ8Mf?=
 =?us-ascii?Q?rEvkWgytiKlBWvQqIlHn8L4vR0JCDR7aT1DgTYJxqR5d+HQNpDHfU7/W8Izl?=
 =?us-ascii?Q?YSZrgDvR90jP0OCUlv3yYd6o1HL50xae0sQ9zLUGb/HBXpVlEX1jgSAULD1g?=
 =?us-ascii?Q?cHWHYphapSByqmpmRJffAWoes4pbZ/2CzQE49vTJrR12zkBnPUU5snV8a9pI?=
 =?us-ascii?Q?48m3U3wdsQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: becfde4b-4ede-41c6-1264-08ded6a803b3
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:03:43.9345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIsoGftKNLHrBliIa18yDueQDSbopJidFSYT0I7XIcHKWIpxeyLdwXT6hYy6S4eL2/N3qaIXRowej9IZtoOZSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2777
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 13:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239888

In order to squash multiple smaller bugs, bump from version 2.5.17->2.5.20,
however that does not resolve CVE-2026-57062, so it is backported from gnup=
g
master.

Roland Kovacs (2):
  gnupg: Upgrade 2.5.17 -> 2.5.20
  gnupg: fix CVE-2026-57062

 .../gnupg/gnupg/CVE-2026-57062.patch          | 43 +++++++++++++++++++
 .../{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb}      |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
 rename meta/recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb} (=
94%)

--=20
2.34.1


