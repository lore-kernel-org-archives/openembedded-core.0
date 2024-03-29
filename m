Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A72CD1283
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 14:55:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.415.1711724132441785441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 07:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bXQdVf4K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48184ae47e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42TBCF82004839
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 07:55:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=wkHRfKrPcwoGokT32Yoq6qmkld4qEEjMfV1UJDZlyp0=; b=
	bXQdVf4KAy1x1DclsRXhe2rttgHyLBI7V8NGUcx2GZtGUVm18RqMy9lC7Xo4+FBA
	pLOEysinBurmZEMGiKvJA916ZYWQrjLpL5A0j/lcgTOHBkEceEBYXKoaNiEeFJ+i
	9NR7yN0KbDzls1vEjGoO+OobjkCnBsX5MJrgOuD5RK0MW6t4XKQyq4+SfjkMk6RD
	22XVhDO4cYFpeKGLVHhWCkC1Z79R/MCi4dwCWJeD7Dfx3FSaQqK1sHR3SFKOPRB9
	HAA94PRMm/9xq2gtNWlwNwLCYCERxDS3uo6Gqh+biwhs0EMJKhXKpzml9qq9JyMs
	ZGPaY1XwCE4NUZkoQS2Tng==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1xkgyxj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 07:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WR3SZH8Jz463f4TP0dgAC9e+eGjg2KbI4tHp9AFuIWaqxEfIfv6pRqTOModf7nGIRWlPTneJvxb3cM3/9gK05OU3KkBEBuhnTPlnGTxwmeXHH5Jy0whwwI/w/OXu5vxhcdeQ/QgXRzpOxAYqPEOc59j0d61Jj/9+qrZTEhdChIep3yqk2sUcH3ntlwKQ7wNVadU4xo+EYXLZOD+yMyEJAW0xDQIUTIXvZp1XI/9O5BGmFQZ6wgE2p0AqjYxlP4rxFNLzBV6ev/uKtm3nnjfqtP8tGX3VXgAVVNRMLok71PPpyfHyQyzckMyl9dtkgWk7Lf4YMqBM7bfF8E0GB6KgDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkHRfKrPcwoGokT32Yoq6qmkld4qEEjMfV1UJDZlyp0=;
 b=VSF4wDDVGBKd77UVyaZFqK62GAu1C8LYnbDsXdEHFqMCK0rfCOp+XJj685SsxmMqFBmoyYy2d2TQroyYalKo1CU1lpE5YC00xnUeB4c3Id9TqWQrlA59gxBY5EEEapFJlUh1WChOTNtvjPPcu1lU/4iw2a7+pOO0Oxy9b6dkPK8+3x/9d5BYEE9x6KMaIS4y/QJzf1rHfbFDB4TCVtnYxrT5s88UTB7EmjckTIKOszdbh9CDg+xCtkCiEMPv7vxgjnZ1lzp6JaMs3NQsaTzerg+pcMNHunS5/egX9kvCAn4hLn+aU6dllPXOIvc8aiK/Weul/904nBJThGvYE7uUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL3PR11MB6385.namprd11.prod.outlook.com (2603:10b6:208:3b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 14:55:29 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7409.039; Fri, 29 Mar 2024
 14:55:29 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 2/3] autoconf: Add missing perl modules to RDEPENDS
Date: Fri, 29 Mar 2024 07:55:06 -0700
Message-ID: <20240329145507.415122-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329145507.415122-1-Harish.Sadineni@windriver.com>
References: <20240329145507.415122-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::25) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL3PR11MB6385:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KmKyXeZ7PcR8lb9lJPHCk04HmnJBXWbS3+spm9PotQ9juAiphICuZHD7JfJpGQw/9ES/zoKxltrTShwJX2zg3JYEQwxsM28lYg/kQFUYMaXdgc935fXWh2exl0H8PBl/U//RcUcs78h0xpyMujt4uQMTyp0sU40ImbPKmb5FVnqwkCiSt6d78konvz/c1bOfbNwSzpP5Wvvi8SPU4eowZgzr7QVloZ75bqx40kydFUXlqv+xYW6RObL7FP+S4scmtfPdUsV0VxakaBegHS0pSqVo7L0QGF6dUphfe43bQvOQyVDCnIb3E937isZfrHvDx3cnUchH/tL5+WCaUu4AChS7x2vBapvtz8Y3aAZmLmfPVyPgbgG2l755psTGN+0ze/99Y4OGQaxvQN1TPD4CzXmc6G4/BvvFO4Q34aPaAua9ABvZPUGwchC7mG46/+TbKkQ30MoqBb5Kb9ArlFl9oedh2cwtyffpdX7/UjUn82mnaj5sYj1krZA7nzMzZVlzbUKtjWjXU+AnTzbW9auYPyrXEPe/cbz6xbN0CCqMw1htSCUtrGfGapspfIiakCQ67+7VM2TIazFS4CJoE30LTWc70nAEKsXXpkg5u0r+KHDPFXvAy36HIRRRXvqn7N2Qg8V3T+m/6+KCQb1tWa47CQjg7Sq07SKhx0NE//gth+YQCSkN/9k30M+KG0ITzxMxeAqQmzocEcJA5hXb5M/9woMwRb87apKKq/ysLv72m5s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zAg26BgzEhUpRBayIr/RwMQhKcpBfPer1lNIsWLYlnVl5cYNdiPsfOJ/5LSu?=
 =?us-ascii?Q?pdVYm/8cqur6vE0+Qvi3GqMO2R9lrn5LY499Ig9nKqI7Xr2nO9QyzfCnlBAU?=
 =?us-ascii?Q?jqlbQlt5T6hjYFkjEe/3cYYhuVDpUcB627rEZssn2jpiAWaCAewWrc6EySjZ?=
 =?us-ascii?Q?bRWEZo3dG3QR/z+ILVmoOF2zenUIcIeyOxtZ1aifgyjU+Yv2EplBw0uKZfFO?=
 =?us-ascii?Q?9Kld35zf3AZvW1W3j3qjgKBvxOlDKDZzBNa+wuR2ppjp4e78eAVAnqt8na0N?=
 =?us-ascii?Q?QmbWswm78xeChicUOVRXjdt+UKlEYBLzhG9FjOtDDFqTN7/xOQXsCsz91y1X?=
 =?us-ascii?Q?+6adDcTr14/+DDtsszBBwsPvKuxowyDHSYU2qBTQZC0OJ6Gmmr1VufXEU6Cs?=
 =?us-ascii?Q?vqr5QnqJs1I5YnnfcTiTXOBPZdQLbsAUkAlPgCffnB2iZYL4US+SieewJcVQ?=
 =?us-ascii?Q?0mfiEOP5lZSKaz6KLWEBFbmS7VjS1oSOb3frmaNVOAAUE4M+rBhJGX5kR5VZ?=
 =?us-ascii?Q?+if5glNPtUItXmpRkSNvCei0KyLUuFzM1k4EWxuJ70biJQEk9mhuCVi6rUUp?=
 =?us-ascii?Q?FAfTt0954Qn01qWd6olbGXiDXjhdVuunUsm0q/gCyo/NHvEKdFMLe6UFDGdN?=
 =?us-ascii?Q?5+W/uGt4ycjKNZgobog+5qAeus4dpeB6psz7Msp0SIRPwufv3QEKsvELhDvZ?=
 =?us-ascii?Q?WbZz9UcXijK4wLE+KPG+VBKk6LazwzYOeLpg8PG7ybRk40IeSWI8g+sbgn/Q?=
 =?us-ascii?Q?VEAzfalOysz3xVk7hAxgez4IV29jgWE3e7E/+eiGZF9qt2tnm3SyIeB6uSt1?=
 =?us-ascii?Q?sMXrOuhQSGAotxU9vG+UMyqcxkG3nFxf7L3WSHN9XBfgp/5CjpQA4YJF/eAE?=
 =?us-ascii?Q?CSVUkCACh0rVPHBE5kP0AZ7StuUOUrB/Yb4zW/oywT0zG7SsbZlQKyit+m5G?=
 =?us-ascii?Q?HwVUmxMXEvVgjUVcxpx4eZB5rJ/6kyi4fkRrihmjv8Re4g+VmEIb7ARiWi68?=
 =?us-ascii?Q?SP1u9Vl8p5/MjWM9A+XAhdbAc/S0gvm0FiwZP0jUGzYX5w9H/GAnB1YOVrxG?=
 =?us-ascii?Q?Lj/Hn6GFZGp9CpysaSSUvWsnjlDoVxq/9LKEwP5JZf+e4KQ80wAos0Z7/fEn?=
 =?us-ascii?Q?exwg6w9ShHdvkEP1o85icAWgDpbRTEN1P5HuPb3ZsKEaTizujSkQO/MieaxO?=
 =?us-ascii?Q?CLwh/2EoOLXsyr7csfhBI85srilSy4lfS//j6GBni4VYPvf21roSqHtpzwhv?=
 =?us-ascii?Q?3oTdb4M+TxUzGMY3LyxfKXIAkuWNjTcqdr6Nhzx48yOXs7qZoS5TC2RkJmi/?=
 =?us-ascii?Q?tzmwGSKaLviKQ11GoLSO4UZW0c3JVxlliiVc7Um84nHgc/0O16xG02EiDMWB?=
 =?us-ascii?Q?J13OSBgnij4sQD8mcWV9FblM2CqtjhHTh6eYlgFPQDgRpmMaSjwreaQJInYj?=
 =?us-ascii?Q?32xgfxS1e2FXLWRghNHDND2HkToaccg1lCFwrMzAb5UJm6CxOcq5CNLyPblu?=
 =?us-ascii?Q?fUNUUuBYLjcYnA6J8hd8ndgwEZKjjTI6PQlDnHizOdoygimtBHqerMH5KJJR?=
 =?us-ascii?Q?yCsTTiYbq++ICgDOxoBnT8ZkrfCZZyTVeuZMt0yFT/KA05NIb7RkXQ0ORxz6?=
 =?us-ascii?Q?1A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4751255b-2082-45a0-6fab-08dc50004679
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 14:55:29.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGz0ieJxi3dmoeWsouz/9IoCjU8PAu2MTyvkP3yig6CxBzokAL0nGjFoiFryhfw5glbCxzSwhaj0RP1WHYHH3xuE6LbrETkIpazWqGz0n0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6385
X-Proofpoint-ORIG-GUID: qvDPprgfnTAX6NyCHu7nisqOeyJsQ7kQ
X-Proofpoint-GUID: qvDPprgfnTAX6NyCHu7nisqOeyJsQ7kQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=893 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 14:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197633

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, missing perl modules causes 'x86_64-wrlinuxsdk-linux-gp-display-html --help' to abort with below errors..
 - Can't locate bignum.pm in @INC (you may need to install the feature module).
 - Can't locate Math/BigInt.pm in @INC (you may need to install the Math::BigInt module)

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/autoconf/autoconf_2.72e.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72e.bb b/meta/recipes-devtools/autoconf/autoconf_2.72e.bb
index db374373cf..2a459b7cb6 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72e.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72e.bb
@@ -52,6 +52,9 @@ RDEPENDS:${PN} = "m4 gnu-config \
 		  perl-module-thread-queue \
 		  perl-module-threads \
 		  perl-module-feature \
+                  perl-module-bignum \
+                  perl-module-bigint \
+                  perl-module-math-bigint \
 		 "
 RDEPENDS:${PN}:class-native = "m4-native gnu-config-native hostperl-runtime-native"
 
-- 
2.43.0


