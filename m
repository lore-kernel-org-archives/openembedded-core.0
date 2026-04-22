Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF23F9B5E9
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 08:55:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76478.1776847868087808101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 01:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=VShm5tb8;
 spf=pass (domain: est.tech, ip: 52.101.70.67, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EshU0CL1jGQYZwSCxQnCXJR3I8/Z+1m4LsCWuEf8kzbHlsaDqZ80f+QZ97tHzlztBGECbvnkTpV3Tt75X6nxSB+OdjZB+OGNbZi0PTjEQJiqYQPi7PfgfwpudYk34OzNYGUFl36BPftnuNgsgIiOz7evzkLvDouQrZtYG+i8xRJsYKkloXCqsc7QXXTCh5hivbvt7y7ukBps3DDn0F+PZKqX1VCn7AQMk5mRJGt4TZaN7I2ix6GPfECuQ+hQhvRCeKeXz1lPE3lsrXP5YMyyVe1G1giqTXzPIBFkRgn1QKEqi6qz6FazJj8DxUC2FLBtB52u8yK1ioXdnnieU9CCKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVQWmwF3mhHimQCEXSDq1G1KL6ZD6eMbGdBVmiP+GRc=;
 b=ag79QpT3YVkAPBrbOkIWYWmCijYhRp0V1McI1CVTu8aTKyBL0IEeT1cj/NDNIYVmpOlbIhUS8BzUCf9k9qt+cptSXHXoD2mvauWC2RW3nHF0NsY8aOx2G33UkY2Tkpj4kLHJsxLAKq+9GPxokt3bWKCt5wEB+IUPU+x1Ivyos3GkHRfCo7O+3xLBYgWiZS11pilkVv70GoVDkpEYNcueklyFlwVUOrt5sacmG5AV9TFk5Vkzk8HQNB3VXekn+fW1zkg5AxAgWn6OI0LLCGmfYkZyQ+vtVR+MXaAmbgSpNjiO5xSuFXcpIqao0swrd1EedJyG+kEa5KstOmFn/FIzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVQWmwF3mhHimQCEXSDq1G1KL6ZD6eMbGdBVmiP+GRc=;
 b=VShm5tb8KoD00Rztu9ILoUA7Op9tZJJG+F2r7eZ+8bIWSpuUZJHaLi4k4MAU8WzNx+TJVIa/0k2T5JegKgtNtVykj/ISGgTH1PbQFe88qZ1mK3wm11+k1f4FBZHym9LLZgsaZ80D/3pmg0JV+ZAfRY3ag4bdCq+9MgK8c9Fb98Vg+M+d6DDhPf/UuVolG/Zea+j06ifjgXAN5ywXyQDybjlRmI0qDHgFvJ4z5fFpk+gNUENcFqlf8gR0xmrLt35CqmmYIrIV+jnenQbA5bjJueldsjIeFPIPusW2Ermu1Esw9dh4Nz5IAAFGnJOD/GYJe8mn/dJvCoZsNC0h+C8csw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV2P189MB2432.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 08:50:58 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 08:50:57 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][master][PATCH] expat: mark CVE-2025-66382 as vulnerable-investigating
Date: Wed, 22 Apr 2026 10:50:50 +0200
Message-ID: <20260422085053.319292-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0551.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::19) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV2P189MB2432:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ec5b8e-7226-4a78-3a84-08dea04c4563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	lbPqgswJ3Z/ZnI8QCdTLHUr8/88PxuSdionbOL5eTp/jdVFTVXhgVJNa9OEcCw8UUPEIJ8J0vnjKgjbq76cwh9QbOFwPtcGX03p2bBuTDuDByE+5lzfi4sYSLbB/lY0ESi4dwWhMiW/qdbRY8jv6pNjkUJt03d7k1u5JQenbXh/KIk/zEmJXwdDG9cowqqXsn+UzLClJWOm8XfKHuLdHsCJeueq91qxAiHYECG2lPr+J67m21lBbMvzKstQ0o8GXVYcTAe+hJZLKPyby4thz1PQLnCDAHBOV+g+6DoGcd6NEKOu7Ky0UgLjh6tO1wVLHdPSK+OhXHQpEeuB2PqF0vLvKZx40tHdaRKi/yOPZgoG1j/eAyqbx3pm2Cgji3721n06Db8MqJpfLtQk0MvRBLUhI1p7khkmuo9gKUIwJ36sYZPTqIM7PAj1bFIgulBiEEnEyKKIn42EHbOF/wCvYSbRyIUqZBTkLQ+XRDSe+l4tKor/VG90kHjDdfjJXWYIEUSs6eyCuy0Bp/PBzPr5ITJ/OMS1I0Gg4CeoEY94v0JGiuwoyGRXbUfyA7iUMOcsHEG3e2ZhgS3UYP+gXaszcUXENPzw/EAvk3AsYTWjJGUH0bGs+C0DlwCupP7E80mbi921W9iTGpEu7VWhjQF5C8K976IJis3QX0qKL7+yHWrKMr1OX9CsNiczGoPTkMJ4avzfDC6aktABTdgtwSsa81fg+LPOYOM10lar9EEO4SX4CoIBybuxuibGsUmqJ16pR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uOd4pP+W3fYRigGNmUGOGLQZx/gB1w+6755ZHgjN2P/o8Jotoc7Oh7eX4NIB?=
 =?us-ascii?Q?DjxzGiNOo71XjTJsVodg6cfSETXX/Z2BncXY8TSh3LAjN1izIOqQXGb04hOI?=
 =?us-ascii?Q?ETKuF40PE+8ZRICTN//sqxTr9Ev5mVhddAJaHNrpxUmWhLe2nCJEwOCUO0KM?=
 =?us-ascii?Q?FheaMUFg9/R2DIV+iPhXxb5czjgb0RX10BBdhXZTZf784jUGR2eUFcDNDal3?=
 =?us-ascii?Q?qAuCjPY2Hk89enLRcTniPoUXpjTj6mlAc87DcFNf4hBnaXjl7W7dxHkwKvRc?=
 =?us-ascii?Q?JOgU8P4u7l7s0sLZZSJ7EPxlMZda5ztkb9ofBZMu9ZCYk/6tY2p0aPlEy5SU?=
 =?us-ascii?Q?b7CmMofDmV9lpRmtjIRKiySohgU7Y6rWQoeYEh/DSZKOdcObCIwlP7cu3Cpq?=
 =?us-ascii?Q?xGlJDLgFGJYBTOfqkxLxEX0P/ouyqBemOkl/j3huCb4jex1OeOOQUaCuYOPy?=
 =?us-ascii?Q?YlvYrZ5pAfGitwxLm1kLXYDv3p4Y050A8WMYVnp8yKvQ4S5SoSBBMurE4H4u?=
 =?us-ascii?Q?Kn3QAYmYJCHWkzYeTm/O8cl1+IAOnBXX1zIsws8WWyl9eoWkFUKAeh5hx/5i?=
 =?us-ascii?Q?cAXIm64nNgJZF6QZIfc51R9emjvEUaj9LAlhK0C2/2dLKuii8Kr0GU6CS1mR?=
 =?us-ascii?Q?ln+3ExOqEZ5W20BuzvSq0mdVP7RizkRkK8VES2UznzoA7pXRdCKyzX1Pwnb0?=
 =?us-ascii?Q?VBAsY6T8DSdEetj8RqVq8AWOSJq2B6kGdUvrNCjCjv0RMjCv9Sc1V0q1RDR5?=
 =?us-ascii?Q?PQjMzvwTBAEb+WdO2YzgMM7DYRx8bwtrn+ekCnLUPwJ/2zRhPWcni+W9z6no?=
 =?us-ascii?Q?yslHeIKURxejqufpoo6aOgWvLdC9rvjhLBJYy6F8wN6aU6XX0zcNvVlhbt1Z?=
 =?us-ascii?Q?XG+GtfEMuwdjDh/c0923E3jwAPYCw+q4tcLBm5tQQr9dbWkrZN1ad/q1KMZC?=
 =?us-ascii?Q?X+QG72fChBfnJQcIKZfqNdKsJvatLcBu2U/ZJafkZmYh5cMhvI044x4IEvCK?=
 =?us-ascii?Q?2rydhgcgHHhM2/xsypGzw8KhLt5kJcF/aO8O72WFQQ+Y8Ntb1UHv6eEWSdnY?=
 =?us-ascii?Q?FezD4qkhKLS8Y5PFPJU2Tjy1VS0DFX99YuZMGLCK3/RVfEKuAI0GXWxkD8Ds?=
 =?us-ascii?Q?qv7UuG5VgrbT6rqcQ7Yn+lymIgWbzo+cEjkkuJChjSnfe82r6lMdXqNKXLcS?=
 =?us-ascii?Q?zOxE0Qv4vibwRckwoTih2lfJ9i+6fFb7/6u7n8kHWcnAOJbe6NlXUJrTrX9X?=
 =?us-ascii?Q?OJfCP78L9U3lRQDWh9llS9FgqUjq3yihkqH1Dvv6ryaDSCkVrbn1v7k9D49b?=
 =?us-ascii?Q?ISdSPiNco1Dph/b+Gkh+FuSKjFlQ4SQOBO+8eX/JWIzhyG8S/unEa4rXRDOe?=
 =?us-ascii?Q?13uuoBB57v7pAWvlMErIxN3nfRBvqhs5MsiXog6k2cTWIIfXu8HSM33tMtIg?=
 =?us-ascii?Q?6MlsxyyeO67TJuat22BbMqWBpY7D1/RfVgM/oOLRrV+8CUo9FrHoL8pZD6mo?=
 =?us-ascii?Q?4DqQEiM+koyuEB7SA6/35iHpMni+AC5FWv9jYq6lspGK5S7XQThyjyfLP0o2?=
 =?us-ascii?Q?QGvd6beGpDJYqLZ7RQw2v4Vw9GN9h5bkfvgiVfyNy4FRKgXgC5QAjM6x6hvX?=
 =?us-ascii?Q?4ptoQrxNe0w5nlseiWfANOZtieeELnYHyBgEeladHThWcyr1v/G6m01+iE9b?=
 =?us-ascii?Q?BYHZ5BeR7wY/5YXLn8eChvT2C/T8SaCr3vOeH+R1JoPSRXQBlZtSsjThNrKc?=
 =?us-ascii?Q?OYhDmeN89iyvZywOCjFQAIJRJkR4CfE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ec5b8e-7226-4a78-3a84-08dea04c4563
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 08:50:57.6090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnqrgDtvQgkEamNulIbWHKsY53A8gNVwbWr5HWGVBcRFrUWp6iSvGfDMcCbbERetbFtdBRfggqgSQrVrDDLOIreoO6e7LFb6agXN8i9HXJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2432
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 08:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235699

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

No fix is available yet for CVE-2025-66382 [1].

CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix available =
yet"

[1] https://www.cve.org/CVERecord?id=3DCVE-2025-66382

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-core/expat/expat_2.7.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/exp=
at/expat_2.7.5.bb
index 4f2578292d..3656f55807 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -31,3 +31,4 @@ do_install_ptest:class-target() {
 BBCLASSEXTEND +=3D "native nativesdk"
=20
 CVE_PRODUCT =3D "expat libexpat"
+CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix available=
 yet"
--=20
2.34.1


