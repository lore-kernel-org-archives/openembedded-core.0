Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A8DC5DF7A
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 13:03:29 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29723.1786971798729159557
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 06:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NDUKObFr;
 spf=pass (domain: est.tech, ip: 40.107.159.70, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNBU2PfhA882gRAbDRXKv8BEPsxvae6fZ/CJGcA8SrcZW68YyeVWxMJwFnN7APDcmA2MDXrkznU1M6DTJ3HrU73EdRDn6x5DNr1bKKkRQFUVyxViLhSAstuZwrmtOO4Hcam26dFoE58MrLDjaMYwQ7QtlgIkpk1jjRnnq5iWh+G/k802T5K0beqPxtKGbDvGO9bXYxTrMKgvJjGW/DZYoH17fQR4FBo9wyz7rwafQwg0qsEmoIBfpQU0C5aGJvXrIhKgrlwXY6plrj/sjDDuof/USZHNcbny/wO2cmR/IsG3RY3pHeLYSCNjQj+nRBm7vB4OiAaNgXlIGiMwQxrOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRu9yoPeUfpnxCT32DJT38tNp2O7VIXDvbOHWpjXHw4=;
 b=CAttXBl0WYD8WasAzzho8VpjT6XAySJFUjUSpdl7U9mt7R91pJoIHffEO/ijEt9PR4zpdGvTIMpXznr/R2pXjc0gg4q+YcygAcYv5at8YKfmTkBIcr8k8gp12SMRVT9e2EuGqymwqIBmPNxwulEliL+CUiEWtBMHBq9w3QmgaS/4fBfJOPUOGFm7lXtn9Yx2nCElgA4hQ2Xnmkl57EB4BWmCcVfid7Ieq7kp9akwbIH7+PJ4LG5h9mvO98OAbko2zO3vc4JqBw6kweiLuIZ2169IgVaBD9/2wzM7CuR+v0C9gmVK8/bHs8Bgwd16pJc+SmNl3JG3sftvmJ0qPHrhiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRu9yoPeUfpnxCT32DJT38tNp2O7VIXDvbOHWpjXHw4=;
 b=NDUKObFrhsRWgz0bCpwsBOkSuzI+XvrY+zrPXgG1rM++cZZVvd3fO7GZr9udmuFMp7muHqbkkKYPzSo0z3GQqoFXOeR1rMosvzPu7yO6pwE56GWOPvJfBQKwea6nelQEx++eTvrxNWyOvW5mpMvCjLZfmnYfZMw15J6eFzxuYXQdcZMEC7m8DYiEmOMfqSCRZtvUPnL3II9lBH4uJNXZUULMlmsbm0KD5htT01qNl2HKwfRe2B3Z8bAtJEsZCAn2DIkXMGIS/yighm0ABripnAT2zOgWCMlfDhdPiSY1jIiT94dYRxdPsRGo5gnFjaFNI6ywIXF0B40PPpos3rET9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB0972.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 13:03:13 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 13:03:13 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2 1/2] boost-build-native: upgrade 1.91.0 -> 1.92.0
Date: Mon, 17 Aug 2026 15:02:59 +0200
Message-ID: <20260817130300.47761-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260817130300.47761-1-jaipaul.cheernam@est.tech>
References: <20260816162611.41933-1-jaipaul.cheernam@est.tech>
 <20260817130300.47761-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0159.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::16) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB0972:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c16846b-d57b-4fc1-e65c-08defc5fe54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|3023799007|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	mZBqbZc2YONhRPOXqGzStctkrN2Y6XEB3tkNDC7/aqDuxH6ysj5ulCqjuO4btF9kURc1WAEYuxKtdWCJ6l5EyMNSbodeJlxqssnEnepWese0XbuhoA8jgtvoQhUWXrZ2oUQcAnOhWZjFgCWJBZnKLBcV2ntNgVX1/ALzlJZxdJF0M+ZdvZMqP5N/ZHjTllg9n9iu0MIMhv2k8CmLVxrDQduq6dw4df/uOWfGShFHFvc1mqp2I0cY3GvokEEPp5j69pDt32mMPJhVeyITsQHQKNatkSJKMv6eVAiuMmbJ3jmm+aHAOjNuUC6eSQNjbX1OIriZaOlyqHbBXORR81gsPQRagu/bXmq4yMkPJ9F/VmLXJeadIjGFkFZl59FXyW0jjufFcU7PUy/1QA1qflSe8x24Y+0mhB9Yp/CNZQdU//rgJ+ANIK9jDbS7VcHh3lPR9HBM7yS2i+bib2rVfPPH6FLl9+rAuwpJ0Y5Iq2UzHwsYyFx0xrXJ4zSc1sW9I4phNTaqzv+EIa6I1ZqUcHuGoeXgscY0W37DcFJMP1L2BUzzJEboFqRJ6YXp6G7aDYJDMQX3BO09Vne/MZ2sFBVx62V9dh2Qd/F+fYfheZBWqFuDJkAbwJO5H5DREwiHIwmiPd0lv4vH0RRiBR81L4DwnQa5bF7XD3KZxory3gv0r3w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vU/pR7R5gyUqOmKIaAXQ0zTfkZlveXU0L6l3zoNkNsvyi7ygXsLIEuWrW+12?=
 =?us-ascii?Q?ITjUpitVSRGN7U+g9vqHOoS73cm8YSB4RvbszqYOQa7AjCN0U5zbU+Tzu26s?=
 =?us-ascii?Q?9fsxQ9z8lO/xsJAGQzpFvYz26tOi3aszDflUwSC74tiNnRj6tEjv6EbsaqDb?=
 =?us-ascii?Q?FyYJ9ylZrq18jCl2VwfjvU2G2qGMb9Wm3Z9TufvM/H0iIpw9VMG5wSmCdWyA?=
 =?us-ascii?Q?QAOOBsKywwQRivlby1VCC9+1LtHDWEvoSFxb1Y09ZxDOmt1DNZWjUZSVOpjW?=
 =?us-ascii?Q?u3N40dNShcadOka2vBuQ/Jy/ASJzdgTzgJhy/OOWkmafBNG5ETSKc6umTB5x?=
 =?us-ascii?Q?iUPmfSw1taOGnQeFTO2AvY/9yS4gTBkwsM7o2+1KZs9XK41flMldnV4LyI0A?=
 =?us-ascii?Q?Rdwx5jLgIk0+Yy4V20i8kS4RIvDGN21RKqYw2PZIaBZZ0U0iTst8cztYxXXp?=
 =?us-ascii?Q?aCTASz9URfZqVcHECB+zgiKbh8ekgLa2JrLxsm+9GqBVRzsdZXHfQ1eSkBjB?=
 =?us-ascii?Q?0sUJE1AatprFYxOQQrkGEmakAjVlNDRDCCXd5tTM25HqHAcDrwtoCDtF6KJa?=
 =?us-ascii?Q?x1mNqd6OCj1K0YLGYPqhP2InznO3ELDYMj9JNFvHI315htuO2vpCxBbf/26c?=
 =?us-ascii?Q?YGJF9I8ydkFdZQ8YryY/OQ+W6AzU0RKtnL1Ar6kRDFzWdSn6d32QaijP8D9T?=
 =?us-ascii?Q?33R2GEZMHaApys0G8DVedN4Kp7ZibfeJBoUIdfokgDUFJ5Rd+sHBUDT60HXv?=
 =?us-ascii?Q?Kee6uQdMRWnELK1HG3A7RjVurEU5Qr3pj84Vglwb2RwvV7T42vHBohQKXHKO?=
 =?us-ascii?Q?3EsEZ0a47jd2iOR4n0DrciYk/XZ0eim5tTJVBVdbrbpI1Csan65qNJ3xDxEa?=
 =?us-ascii?Q?4mwxwedulDFeH3XTuGWDwg1Bpw4BQekIaGYa/IvtUn/dLrv6aT/cZvnGGYgu?=
 =?us-ascii?Q?AkZ/FPHs1gOpn1Ic5jtwILJJw3OlXERJw+kA60gJmNDLnFGS/ynB73PFZ65q?=
 =?us-ascii?Q?Jk2ObrMpYBzAOvvzsmBjLbOX5G0/TQqJweInZ6m2o7QsgAM3qYgzdU52gnw/?=
 =?us-ascii?Q?SAa1JWn7vwdTXYAmsKkZWDMONGg2BtYYD3VTrFVCE25Uacbbtf+Ns0ajjj0A?=
 =?us-ascii?Q?6irH+7Z2V0rVLOQoKYTkU+bxtnF0May/seUybD2+XrqIgF+9WnTdGv9Z4AOT?=
 =?us-ascii?Q?O8pQmaE8sp4vfaoTBWJbECcMyxdtPJfvZ9Rf+7rJb3L8LK68rW9xbyjDnbfR?=
 =?us-ascii?Q?oTllOQptcAUxUz0nd0hn1bToyOAn6lRltuaBFyX22bN94ulchrbsiVs5no+3?=
 =?us-ascii?Q?LkHVNYyQmpcVsigX15FLlYO3/C3xFs1Qi6oqghZqLGNQ0IghYqNK0XSRbNgP?=
 =?us-ascii?Q?RcADKhoFgmTMLpaXGxgu8nFqsEQgC02spBMXt3ywotJrlrZP1ja5ke4QF0RC?=
 =?us-ascii?Q?knuWUoZhEt0fBHkY3Xf1o8C95AtJI42jS2gPRXxULCeoLG11mxfBaFV0Ici9?=
 =?us-ascii?Q?MZ3mRADZ/fwdnCt+AnCzFlK0LRjnqg0wTFAZfoAWgWffXKsFGgy4muosjJWT?=
 =?us-ascii?Q?fuNxzmfRlIzGfXkWKrOwQAYbdcR0SOBROF4oeIFVLEQMR6NML/4tjGvnIc7n?=
 =?us-ascii?Q?Qa3uSd51LzoUkBnPw1uZnxzORecXTHOWZBx6wyEhjAmgowMmBbZG/7LuW5fA?=
 =?us-ascii?Q?aXYkuM5vLojW5hScNfEJYKxPzUv70icWx88mLr6Fzd96adLCpS/cHAS2EYVX?=
 =?us-ascii?Q?mGFt8Hlgy2/1j5MFFKB5l7KUZLaMeFU=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c16846b-d57b-4fc1-e65c-08defc5fe54b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 13:03:13.3135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1y5eZ0LXSge+0pu+7FSET5zRmX9T93EAxB71fhY3yz5LDMWOhFUssdy8KGz32I+eGz7VXWc9yr/yDv64XmIT0UfhllIhbG0er/w3b159zSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 13:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243620

CompareLog: https://github.com/boostorg/build/compare/boost-1.91.0...boost-=
1.92.0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...oost-build-native_1.91.0.bb =3D> boost-build-native_1.92.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-build-native_1.91.0.bb =3D> boost=
-build-native_1.92.0.bb} (92%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.91.0.bb b/meta=
/recipes-support/boost/boost-build-native_1.92.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.91.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.92.0.bb
index c276cf436d..008bdacf5e 100644
--- a/meta/recipes-support/boost/boost-build-native_1.91.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.92.0.bb
@@ -7,7 +7,7 @@ LICENSE =3D "BSL-1.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaecb14d942c71d31bef2=
0d78c"
=20
 SRC_URI =3D "git://github.com/boostorg/build;protocol=3Dhttps;branch=3Dmas=
ter;tag=3Dboost-${PV}"
-SRCREV =3D "85252c9d6a3817daca23ddae94ce16c7be4d2c12"
+SRCREV =3D "05b6b638b54e1f013fb8b281f5020e337be31363"
 PE =3D "1"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "boost-(?P<pver>(\d+(\.\d+)+))"

