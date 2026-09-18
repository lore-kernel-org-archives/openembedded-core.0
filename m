Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA7CC982DC
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 10:33:17 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7940.1789727595887270047
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 03:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=U9Ndac7J;
 spf=pass (domain: est.tech, ip: 40.107.162.0, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqDpVlPbQk5UQh39fmKujq9YLrFE+AN2ReuzqKw7371SyzlTRnEM7mo/eC2PPSo3lrL91DIeHgAZdIZVs2A3f3GVOo0g6a0XVj9iIrutvKrJtFLPHKgDXLTrWQ4c7EpV7SHHQLLXZfq1w5GlkVpLnrcqItqBG/uFpK52oE20y4eSY9xQk6+wAfQjGpTW2Q9xOaBAR5eTj/y3DfC+0X/AJ7IMz9FROz6Pd3F7V1EJBnrhmTQndOvpGRzQ8qa9uTRSTZVF0Wb1PdJBd5DXqiX6vx8spFESDNveudnqyoc0QXUl4G4+tAv1LMKKoCynrRS/TT7P9DvPoTDbl9QElZnxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEhO3NDDVD52/Ivq12/QCUgJi2v7NWHyqgInsYxEWQk=;
 b=Wp/C4b+S8KiSa8zYPe2bGmcRWDSrLKeiBKCi3OPPU8KT8uNBkp8CAgzckwtHSNc2pC4nIaU9Ya4puEmPzaTbzV2rgg5XpnfZZL/OAQ4nbSnOwIkRVTCVpLQIt9OxiVDzbrhxipZBO0zj853+DS/DoCPs5cJiIm/BEzSLLkJ9Wzr97sExdsjrT3bPOIQ1deHaQ4g+5RajHjYPtYBdtPQW5aSnA3eyCVZ7LJ9CuJv3DIRTYHzSAUvTJqYoAVU9xmH0qD86dE9XrZs/7KgUbdGTk8D/HTSjdXuZVqk27VUkfkYNnNrDRjWKxLDvrSrrrRUkO+m1M1G5iiGYfSbf2h9LUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEhO3NDDVD52/Ivq12/QCUgJi2v7NWHyqgInsYxEWQk=;
 b=U9Ndac7JJnz/tuFtfulpi0SOf08n9IzbM53Sg5czHsTuSesvjoe8YurU1b4e8TLVfuQQxeqYnPFESLLA9VwstB/vgs873ulecST6fsjvoQuJ2IPqTVKdAbGVRhRIUwoCh9lZySfYJNioFI5Ksjmz4YcALwtrDhGaTVWk4r1Cmg/emARY+lgeaVFT/NyPVTYUi6RLR4XREGGXQRVJyVo5dstCdD4UKhvWTM8c8zEjeaptBPlfLqHiS9pmKl+Cn7ajONc2rKdYiLzdJS6+tygN5rQWPkstYp2MOdmpbZJG7PjHNU/EgFBkBDOtKALrQGbRgN8FRXNQQXD/mQ86ZhJQQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AS1P189MB1838.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 10:33:11 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 10:33:11 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][wrynose][PATCH] core-image-ptest: raise ptest timeout for openssl
Date: Fri, 18 Sep 2026 12:33:08 +0200
Message-ID: <20260918103308.20832-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0331.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::12) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AS1P189MB1838:EE_
X-MS-Office365-Filtering-Correlation-Id: ded26708-9555-442b-94b0-08df15703d39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	OkVZWBq+hEEq2MCaRR9TSjUUjXBZ9YRY986T+wI6xUl4Yn3WM/eogVArhn3oJJ5ReRJX/3qPS3OWDFXOV8t95ihH0EzZKIAcz932BdCIM0vnB7xWHl6xWlxOoB9GQbcqXx68D9GqaKCkx87CgibcwhdYBjs5jgLBv7pc6HppcLRcR+aV3oSZen7KDzMIMvj51eX+JOyBpOlOtttmwiqIXj5xCRE2t6+5jGfVOYb7azOyR52HFDgEJJ+In/8VPlvT/3dQLzyHx5a8fBZk3skh0dU+keocI8EdiAwvIryufgA1bCTuLOSZf7WYTOr7RyNmxg2l+JQe4jhPSJlVU1Y2Ku5v438H1R5leDmQHS+iqc+fHCT2ij4WAnkF5PgUGOAuD8w4ea3GSlREWjKstMfcoORt5ku04hnPe18ItSsmBXyhqJz2JyopsA39CkE2IfrmiChjcuFdRA+vCgQr4UXWZk2K1l3aChXtNAqhkrrQBQi6usHXVSH4YyK/bIIYf+ATPquw+rvSRTFT4Y9goID5n8ao8jF1BDEZ6dtvVWpYPFmNG7+KUlzAvw+iVA+s+nuVcjjBVI8nunp2VvD6chtioA+8YiVIQJ/CTSMzTNfMjho=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5bKbAoYiMwSRS+80/Wg/cCqUMAZhAgKklpNElAWLHcPgNzesMrQw4xlEkcb8?=
 =?us-ascii?Q?8o+5wEAXZQLukEelo0hWivLSHSB6JLK8AJAxvOtr/BWYP6QVBPwtip/btdlI?=
 =?us-ascii?Q?xf0vlEoJDeh7UwKluQ9FKr+I6Cj8PLqVAchXt360mBcfEmcHg5mMURozTxm9?=
 =?us-ascii?Q?FOJekfCOp4rNlxUngR2IS+zTWeHa4HmEOFEVskjue9piVZUA2OWnZ4YKz6yA?=
 =?us-ascii?Q?BldhwpgD8TbSp/xEkpyFAVxxSNm198yKoX6vFa9elpMXCSMq3yG+hj0EzbuS?=
 =?us-ascii?Q?txk7nnzAX5PSatsC54g/tq4EID6n5gPmzTqBGBDSdpHz/+G4SeKsuSa7lwjF?=
 =?us-ascii?Q?+SoXDNtnpmei8HUuCUZM/vGLISB1/ZnggEKUQOHUjBveNnkkYqL0tK8X4FYb?=
 =?us-ascii?Q?A7EKNkxzl5FLwffwRJcNktiNKLKtHvq+RhJlJnSxFPdBbGo29F1oA6XYjYBz?=
 =?us-ascii?Q?AhbiMy/WyMUqkJ7Ao6IK7hP6xnEV8zhhBFbmI1sSra3tL4+FdMRQyEkm+57T?=
 =?us-ascii?Q?9+KqzjAZqkqucfoAeqkSo2/IEEXgIxRHGpWvYxVWTlm1nz8o/nyg/ORb4ZM4?=
 =?us-ascii?Q?zJ2O9kpDyjtu1Uskw8+ZAq4AbihV4KFOxEgVRKiyFRrnkJr3dRhYgVZQvu8L?=
 =?us-ascii?Q?tssOPzD47EHuKeY6aAb5Z9t5nXlCb4s+NRFKDV/WhNhmfPlFqPFclAUILIob?=
 =?us-ascii?Q?EQ7K10K1j9V4EGU6T4GdnJMysXTVxD1eCBKzDewQ9XW/YiYZNkzhjeKTxA4S?=
 =?us-ascii?Q?tk6QB5xUiAq/eKH7OOKksqRoYfQXEFx9wehWJ7NLggFXy+wrxmVOCdrvmSoI?=
 =?us-ascii?Q?v99JEuNGixRFOgOvSyv9/HbbAXTL7UMEPBKZ2bB413hb5/K7EVnLgNnrwIBQ?=
 =?us-ascii?Q?tLICw3D35xz5PHXSwqvBzDEije9DXEsM97QkgNmOTKQN8v19Zdl4kz1YKFqZ?=
 =?us-ascii?Q?GZGv8Vj0RyMda7LUODoD08egxkHRm9r90xlsv4eRPwvHLW4C8pdnG+ee3E4f?=
 =?us-ascii?Q?R4kvAS6TfBksR9w+dHAXxACqlNMiDOePzpjgim55+vRYTd0B18A/9A90AUWR?=
 =?us-ascii?Q?IDgLVsBjGwZZT9VdvFhwx14AfN/qyx4RCb3LrS8wBxTf15JdIpjZrnN6L0+y?=
 =?us-ascii?Q?RmuiMt2vXKrQL702th9iBPdWe0z/krjkB5S5ZKicKVn80V4478I0bYCmn66Y?=
 =?us-ascii?Q?5zn8CxzLakyz6nIqU6wfd3JqfNp2In504vo5X0F2kpeCYc6O+PPO+S3wTN5y?=
 =?us-ascii?Q?iSRvjsI4p3vDIe3IQ+1zO6zmEe/fn5twBaK16DL3VwCeiLWB5YdkZbQiKqSv?=
 =?us-ascii?Q?1Z87n9Lc7Dh/wo7yuztUyor1mBn//bz8IeeKFz7Gl0K5Y5C5KN65wcEORrfy?=
 =?us-ascii?Q?eWVjUpbomOdufziRCqXz3P+xMZ2/A+hWZjAYS2xCYoUiij9WJyPpvSTEd9jw?=
 =?us-ascii?Q?xR3yMiuYJSQ4WLCRJay7Jtf1V7AEBbT6AMjq3JZpqg0qkg22DQNBq+DJ9PaD?=
 =?us-ascii?Q?MrDnCkNkZnxRVEYNP6HBC3kRPLSTruvjK9ydoNof6OLsfxq8rP8S0AI8J2gV?=
 =?us-ascii?Q?xNWKPpfPeXr2vB3uyTALxCicN6g9aFj55b7gZbFTNRuQSFe0dsYJUfEkPHgj?=
 =?us-ascii?Q?ofQ2O3kpqACY4R8O3l7PAnydQT/X8ONyneEvkfLJo01BTD+GIDwvevyapqe+?=
 =?us-ascii?Q?MS/oguY9b8zMx95zhJK5NDlkVz73BYiXa/0jPsIxap/MRj0+ULYSu+b/EoBS?=
 =?us-ascii?Q?CnHoMPPFYA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ded26708-9555-442b-94b0-08df15703d39
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:33:11.8095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5GMAWDmbscSQI8Wgsij6VBs/yKRS6Mql1lhaCW9Cc8M+wz+JCo12ltse+LJdz5XdvH8sZFLY+x5H/vmSBPVWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1838
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 10:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246210

The openssl ptest suite passes but its total runtime can exceed the
default 450s ptest-runner timeout on loaded autobuilder workers
(observed DURATION 566s on qemux86-64-musl), so ptest-runner kills the
run with "Timeout!" and it is reported as a failure even though no
individual test failed.

[YOCTO #16430]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-core/images/core-image-ptest.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-co=
re/images/core-image-ptest.bb
index c08561296f..97a5e8c93e 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -10,6 +10,10 @@ HOMEPAGE =3D "https://www.yoctoproject.org/"
=20
 PTESTS =3D "${PTESTS_SLOW} ${PTESTS_FAST}"
 PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-cffi =3D "600"
+PTEST_RUNNER_TIMEOUT:virtclass-mcextend-openssl =3D "700"
=20
 IMAGE_INSTALL:append =3D " ${MCNAME}-ptest openssh"
=20
--=20
2.43.0


