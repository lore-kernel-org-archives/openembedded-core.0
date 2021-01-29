Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.44])
 by mx.groups.io with SMTP id smtpd.web09.6976.1611909254069194320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UmVr6CZx;
 spf=pass (domain: windriver.com, ip: 40.107.94.44, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVD+R2JXpdsQPDuffV+IET5psfWfpcFZYXU9agIwDTjkrt4Ozo5idYX82d9V8xbaFk+BfPs+Yh3fz5jLcMSQfIWMioTlhAdLUAcYnvJ2CTTND+LtaOWMbc+Fq68DogTdPHMX0yW+sBzrn4Vm1QA/DbOJxe1kSMkmP3U0MfO7lC6E4U0eHegdmH0Bk4tc2/w7/qEb+VBBnngHqpu0IAs1Rs2xuN81Kt7QXshMALSNzHSCS+APLxlGeelwbJRQvHkCJoXmmSWcXzKZeG9BS7PCSW+ZCN/CJXpH4+snGmF7bFON7OMgu6R0Bh6l9h0OLu5rg8RUeqezJOlYBjznDDcvRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYBv6cKdJTMeTx80zjmkE6mCFCZK1hF5AWzvSSjNhak=;
 b=lnRhzn32CA3/8Iwi8ZshFbvOQQM8u+aRYFqWa8+hHcTVyJxbXgAa7y4mJAgxvtRfwODK2ajaG9ORbyoDE+jHDmk1OeXMzyDo9TZTJI0+7CqXJJnDthqr3QHfKemU4azc4YOJehILms6+zJuwmfbo2t6ceZtNO0FDfh62mTzQ68CgNHlttzhmODs5SsDuLm9RuEExfa0U3GDV2L8FuABIr0Fjc+pvRCHMuSQa08bRnc9g7AliaKcHhYOatJS3HjBDP9C0LB9qjl5zttlVv8PazQVFheWaTzBt4dP2t8gjZWWxY/vJFnZGpUMsGxrkg6lh/uVZTeJNYIGoHEESKqLFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYBv6cKdJTMeTx80zjmkE6mCFCZK1hF5AWzvSSjNhak=;
 b=UmVr6CZxrMm+Tfl75makUrw5AidEd3xOv2WQvItYHPWHSQOs9TqW16SLYX7fsnURp69yTvaXM9/OrvwG7BpGSiqulhMXZqzAzXL7tbhXcytNoixLg0gOQmQmOl+YYSX2RBqG9mDxzAQbt8cRdJRm+lmbL+MRlii0IW+BBpygyf0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3474.namprd11.prod.outlook.com (2603:10b6:208:67::17)
 by MN2PR11MB4205.namprd11.prod.outlook.com (2603:10b6:208:192::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 08:34:13 +0000
Received: from BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c]) by BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c%6]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 08:34:13 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/3] libc-package: add locale stash related dirs to PSEUDO_CONSIDER_PATHS
Date: Fri, 29 Jan 2021 16:33:52 +0800
Message-Id: <20210129083352.13305-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210129083352.13305-1-Qi.Chen@windriver.com>
References: <20210129083352.13305-1-Qi.Chen@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:203:b0::20) To BL0PR11MB3474.namprd11.prod.outlook.com
 (2603:10b6:208:67::17)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR03CA0104.apcprd03.prod.outlook.com (2603:1096:203:b0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 08:34:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55145bcf-4b36-47e5-cf93-08d8c430a7eb
X-MS-TrafficTypeDiagnostic: MN2PR11MB4205:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB42051DE00AB79E4127ACBFA9EDB99@MN2PR11MB4205.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e+Xy0KIfU/KmUtK61ceMzGTHeh2GcfK3YHSp0Ap+52kG36nFjdViCbr7AyQ3MCC9Tu8EGK1R6SpEN5XgbS8NEKAsXuM3onu43oLYw8yiImjcHNAgDaDE5dXNcMT04Af15hTwuM1CxUIFpzSmyw+HKq3jbvRNmTlckB/GZg/3NxXVsy/s90XspZ1l/A90JQgVdjRZJj76ed9jOr61k6kK/eZ8gOZgL7vUn+GPqk17uUFjFj5H2R7qeaStOSMJ96ohNxPk/KMQ7+UFokazP93gbKN+zLe93g9H/NvwlUVX21BMH8UtGSfC6XiYnpqlOPDAxJcQivflDDaXRwsdS4+2LVU2FmShM2BXtt8cULub6KKDJc7OhJGxM4w2lBEoAsng+dIdwMfXPkDaBwAeDbwLoyfTd2KF660+rD67o99iweTNEqm+DuYzaMvXNsBoAUs5kP74d5nsLmXASMjh9hPUDKrAOvE/sOrc3Boc3uyKzD7AyfI7kbBa1j4Hc6BhgXreJYusALmHCp/JV3j9m4HHrQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3474.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39850400004)(346002)(366004)(86362001)(2906002)(52116002)(316002)(6666004)(36756003)(16526019)(8936002)(2616005)(956004)(83380400001)(6512007)(1076003)(6486002)(6916009)(6506007)(478600001)(66476007)(66556008)(66946007)(26005)(186003)(4744005)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?pam0Az/bJnFL65epnemUkwJG69peReGB1IakhBfWtOHxvinaZRwrDdwCU+oT?=
 =?us-ascii?Q?ablzFnxhCsehjKhCml5nNm8IxJzss0N5BQx02t7o1u5LOYWsavRMTdRbaN4U?=
 =?us-ascii?Q?cWSpE4gWNY13gHTm1qWVn1T5UfkIG+TBDipsOxqgM5CPiANskJ1Mh0TV7vt5?=
 =?us-ascii?Q?DzO4jOFpao321D5T5NB46VPn70xFS6y4jEw6lKCykPiZJXCBPEbebam3GaBE?=
 =?us-ascii?Q?fqEt3UiF+uvmmsM5JpwVXiNXyxavg1+60GykJG7nYlBUsSQX9ejRTNEaOXP3?=
 =?us-ascii?Q?nKTXpgDi9kqcN5XawexG7svUlCO7kN+XtoWVE9b1mMx1C/HZv8KLTv5MHbS0?=
 =?us-ascii?Q?FU8cIk+xIber/Ifuv5sYQI/ZDiE6DSLvdv3o8ZAv7Y2GlBtZCIkjYv20FIQ2?=
 =?us-ascii?Q?l2Jff38zttpe/s0kW4Ov3HThXAwSQdr2P2yQwacqIgkGQaM4M8aCZfYDu1vb?=
 =?us-ascii?Q?RcGwQhIIuypTQSvH1cgrPwvI5d00GkLxNOdZ/PiqyG8qB5Aa1cjRmh0bRRih?=
 =?us-ascii?Q?gZn0IeEJYxwW1CeiHmoSC/WmIbb2IelOElPdswT3hqzejhoXuPo4esxIxQfq?=
 =?us-ascii?Q?3j2yTHDItdvYCdLV9x42e3/viszP8Hx8hhrOcZC69OwiMmrUuubhc9IM8cif?=
 =?us-ascii?Q?JgFLGLg9HdSIgMsVnEvaW5b5bHGZbpMHj/kDbni5FiCiloMW+E69zmwadmXB?=
 =?us-ascii?Q?dlMQjZK+i6z2D8fzTnsal9ivvXLrTGzXfL/B733wrs6i27E8RUtWYI7+Pxv/?=
 =?us-ascii?Q?K4tXxaLdB6fO6hYzgu2ve6s6fbbBcLyhqntZRrrvyWz0t/V2yFnWp6vycDx/?=
 =?us-ascii?Q?OoJ40umV5D/QhBRJ98dHApD4Nbdnqz3Q5VdkUS/P6jxGhQ1NiY3GDUN22lrW?=
 =?us-ascii?Q?vwykEWR2PArzCXXoksynKYC0koHiCxL8dmFmyshovVqABIw5nDT3o9v+LPEh?=
 =?us-ascii?Q?qbeo1gEZ/TlDJiA5irfz0/bRo0PzSDtXX7kzDKqg9ZvIjPQXOTd5vcJ6n9jr?=
 =?us-ascii?Q?Z5R7stK9KRX5tMN0w3HBl7jih5eQOQ1ZMG/UfZbasv5/eHKUqQJ5B8y5Pq9Y?=
 =?us-ascii?Q?8tX+tKgW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55145bcf-4b36-47e5-cf93-08d8c430a7eb
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 08:34:13.1016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/rEeflmvp6OQtXEDAO0xDAYk3I1dcnskBtvUwXkDIU8WU+MpJbfUlBtuxnicapQWlS5ABwxz4Gz24gVx5M/JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4205
Content-Type: text/plain

The locale stash related directories need to be considered, otherwise,
there will be QA warning for glibc-locale about host contamination.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/libc-package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index de3b4250c7..d947cb6a7c 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -54,6 +54,7 @@ localedef --delete-from-archive --inputfile=${datadir}/locales/%s --charmap=%s %
 }
 
 LOCALETREESRC ?= "${PKGD}"
+PSEUDO_CONSIDER_PATHS .= ",${WORKDIR}/locale-tree,${WORKDIR}/stashed-locale,${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
 
 do_prep_locale_tree() {
 	treedir=${WORKDIR}/locale-tree
-- 
2.17.1

