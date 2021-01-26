Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.73])
 by mx.groups.io with SMTP id smtpd.web09.220.1611700680740232999
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 14:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=l+YxIJ86;
 spf=pass (domain: windriver.com, ip: 40.107.243.73, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fxw6TwmecLbWqsSFilkuPTYlLXYb9zLJ/rkUDKriJ9r17lc3Blm7c9kRXWfatOvPEDMieqTh+pLKpuuf9kcmAs9l4RrpA27SUBIQmHawodnaMYbedaWNVq4FhdTb8tG1l2GhK6hSoo24YCm93mFqU0qOnlnIrJuOkZVpV3K8zpcimTDGYmWU5Fbpp6/sxFPCx3p8r/xWXz0xftuvo1mF3gjWt7Z65nCEcLwHKqUmXqlcNq4jzMs0/wly93EONo+Yn1yISk3zpHSQZ1jcEO+Uy2+T+EW2O4/St3SFQkltnuM3AiVqDqURsPjUPHK82mIsun1ZGSzUofZgr88Pyvc1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji1u1H/pzol7FDm+n/GhLKI6T9XsdkfEh4j4/tVvE0E=;
 b=hfrXxj51EpDiS1IcwiXkXCJTl+4RJ0dUgWF7N8xTMn3m26Htidj2hA2Z4VKOVi+ixrXE6dozHCaoz4DI2PX9bookWtq03mQnRTMyNjnHUEPZ6rpDeyTDBE9HB7iO/4dEtKayjjZW6bx7Tpc/t6ID4qmykIoMjXmAqBLqVOI640aAh5Lxm6OOSSU3E3FhDTz21axLrcSgMuAFvzOZqcDmHMKmbTNeyOaJk9Gzcjr12ziEJP86p6prQN0K1EHGQLMDyXItUr6MdK4XPG0izYq4s2B/xtgY59gB3xEjuljQsexzFzkqwacmg9zswA5CqGN1vvYAtlWOZOAkbx80a2fzHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji1u1H/pzol7FDm+n/GhLKI6T9XsdkfEh4j4/tVvE0E=;
 b=l+YxIJ86GPPDhn3qCllzDUQRLWLb4VU5ocNBvAYj7dMo+HFjPi1j7xGSrTRsBzayp7txqJVwoJvQY1WIjw1MEYaGXMRC62xhRWisVedSuSlnqqHwASPocgqWUInLCIhL/GjYo/hxnZ2zaFe+AL11V5yyiD72qwfcJl+QE4a7QpU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2989.namprd11.prod.outlook.com (2603:10b6:805:da::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Tue, 26 Jan
 2021 22:37:59 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%9]) with mapi id 15.20.3763.014; Tue, 26 Jan 2021
 22:37:59 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH v2] strace: increase ptest timeout duration 120->240s
Date: Tue, 26 Jan 2021 17:37:22 -0500
Message-ID: <20210126223722.25052-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::26) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Tue, 26 Jan 2021 22:37:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b21733b-fa86-480c-8116-08d8c24b0847
X-MS-TrafficTypeDiagnostic: SN6PR11MB2989:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB29891E815195DD4C476ABCDB80BC9@SN6PR11MB2989.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IXPK9vL+XYLt2GkS0SptIM1ASoXpRSqMm3lNO6Xu8cNCopoynoa+hMIcNI/zZo2fts2iEcNJySSEi1IiipFWpfvkkjnAMaNtitVto1CR+K1PDHlakT5Uw7ehDIoLW3LL7zjl8C+FupJ7yjWDYkPBg8rGnnQikFsXVuIFehXY/CMwY75OHBZ17AN0WSbtFz/ZgIf+o+F6JsVH8gf3HD1rT0xXfMyf/J+JDQ1uxB9QEQw5huh2BQ4aOAZy+u6yLgy0U2iVWLcihXeW6lOuvbcpmP1Iet2flEDT0ZjaEnHgpn+eNEX3sQFvWz1LIdJ+beVvLR+7csuHuppLYRIpFBouz4ZB8gvPTh/I1IsCqubRDog25vI/2XCEVeZHLM1TV3FiLT48KCXxQUmip4NqNYWphg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39850400004)(396003)(376002)(956004)(6486002)(186003)(478600001)(6506007)(1076003)(316002)(8676002)(86362001)(8936002)(66476007)(66946007)(52116002)(6512007)(2616005)(36756003)(66556008)(5660300002)(2906002)(6666004)(26005)(6916009)(16526019)(83380400001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?KtRwtzdtqMN3Cjrng9cn4rjFAHniFuTjYkugHUEcmRt1jpO5Y5BF8SAsk6zO?=
 =?us-ascii?Q?xvengJOJQo6xzPGTHoNUG9FHtbe2HVAeJ+tZcTsz23d2Gu5824LMch+tF4jT?=
 =?us-ascii?Q?yfVxWNm/CP2JuSy54MtJ8hD0UzK6rQQUYO7n0wT8HrsID86irKoHlXRVfKOH?=
 =?us-ascii?Q?bD0RpXFohICk4FUe97I3FiqJjtsK2/ZS/09PwVfm0lWv1/l3kQEMLbCcrZce?=
 =?us-ascii?Q?mScJTctECSEEfA9lH49MUyZ5uys3wskL4sMgcqcRIUSr5sTUHxqirKJ6opc5?=
 =?us-ascii?Q?tMD6+iZneYY3NC262291u89d2K8caUOfaoODqh9G+JcDjHbFHgeGkXx03I8r?=
 =?us-ascii?Q?qkqr4rH1TUMTOzOtaUjTno+YolYQdNwSI8KAkyDi1tLOMKzM1xpzGIPLWf4c?=
 =?us-ascii?Q?N1mBYcNZI0wgTCnU0unfCCFgz0q1baSqgtMTmLgadbNpP4Aqra/VzPvQ+OZH?=
 =?us-ascii?Q?cY/lXpjhFMq9lk84GaAg1rzb1iQ9/Z92GB7CJpV7qxIhXWHR1HM9JJBE8iah?=
 =?us-ascii?Q?qvtMJG7Bmikvw35HRx8LIpLlgSmgemYZyJ9RWm+sS29wr6DJpxHb1KH2oSe7?=
 =?us-ascii?Q?CwjVA80sULfNdn2WGyo6ZXlpXiuRZIWgXnMK+jgMbhSQ2hCj4u26uqPVafTY?=
 =?us-ascii?Q?alMkdAc53M2vQlEinBy8A5buR69MnThUQhxBYGnjE2kkONp8gJrOPob35Orj?=
 =?us-ascii?Q?lc7pJ7v7mippS0lFekQa3TB0FSoRXIi7XHcWtsTxQLhaCVDukAeqkfK+RvCw?=
 =?us-ascii?Q?RNd3np5gc2sGtLG40wPQMDrTRUeQkfcmg7/7frHe85sUk6eC5nF8lYXGEPBZ?=
 =?us-ascii?Q?CFawDt/exjQ5GHo8lxIuddb+qaPrRoqiNScgG10LG9sL6d+/dLC/a8cB+XAu?=
 =?us-ascii?Q?wAzxFpFu0zGwTzjKFApWDpPsaMeweCkupxFnfJd3POSOqLwM3XT26tmAgO58?=
 =?us-ascii?Q?VeonMmEdsX+9jBzFaogrlHKZZVmYxw9PBMG005rkwQhuFQZaZTIzBiCkQrfm?=
 =?us-ascii?Q?zzuD0XwbqEVcnuVg02/EOWYWeEQNNzkq6R3ZUX6SOwvBsoN4STDKcMXhvmsj?=
 =?us-ascii?Q?EXeAzNYQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b21733b-fa86-480c-8116-08d8c24b0847
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 22:37:59.2215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAnQAFq4ZsStl/0zm0CwIedre1tGqdRFPlukBEYFlzeRuaKCKVv7eL7WO/+uay93nkxbWlCr+N5sbeRyd4kZvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2989
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

solve qual_fault-syscall.test and qual_fault.test
failing due to timeout.

Bug 14165

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 meta/recipes-devtools/strace/strace/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-d=
evtools/strace/strace/run-ptest
index 4660207220..3a51fb0be9 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -1,5 +1,5 @@
 #!/bin/sh
-export TIMEOUT_DURATION=3D120
+export TIMEOUT_DURATION=3D240
 chown nobody tests
 chown nobody tests/*
 chown nobody ../ptest
--=20
2.29.2

