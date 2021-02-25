Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.88])
 by mx.groups.io with SMTP id smtpd.web08.9895.1614252359452554353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 03:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aAwBjxgy;
 spf=pass (domain: windriver.com, ip: 40.107.223.88, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tfr2Us5XtFLcM7ka8nYjq1+F7LAPpHdOwCNij6xc/FnoYwLbe/U8W0Kw1g/yexrYOlmu8AlGuOSrFKy4ob/YSIzFBROsTaFzCO819tmYkDQ+o7OFDC70epUN2r/MiH8ufYkZAqxwuGHGIa3F3beM36O1ii+FRKv7BLtl4GXtMk0/6XGBc1N5o8CyW2qzPKrELCxbGv2RIt1wwfIv1WmC4UmaGcdenryLRAHIFI/TPWqBMDx28ffmR08G+/2K/I/ekmVIBAuI7+Con9N4+TPSQt412KibjJ3UxfRpHbRkq4HIuzx6elzNFQz+SkLFn1qRDlTxD6Cwq5vRybd5MDAkAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qj84Ca+r6vYBnfqR/YnwnoqBD0TayK16CcLX9p3jHqY=;
 b=T01lXCoJ0JiSSjgkpuqCVIR6/aBHNdqnv6sLwzYHf0+xa/gyUsvZ2No6L2HJ26y34H3CkoDloUwKypEQLfnIQnrUWjs7sCGVY+QafrXgygXDLmdvaid2t1jk4aJ9EAAG7xwDPQugIssYtP6bkCkGKssXaMxrL7dhMwKqxDfW48DJT2Lcd2WAGDxTLYMeCDPAfdF0jCCOOjw5w65FZ0P/gN7hgAnD7eoebIUVfheXmBmmjshXnI0dC1p4ET0nndtMqWb/DkFfkwKdO3uMioS4pydHzTDBvzT9vttyZ7tdkPoYxENAj608EaWiE/NiwYk/sTznur8OQqMhUXg43/2PfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qj84Ca+r6vYBnfqR/YnwnoqBD0TayK16CcLX9p3jHqY=;
 b=aAwBjxgyH+v72pkMVwgFQiuJTuGMfPBKlMi7PzMtnQQzbiVcvA8TM3TSvRtIMlkdOYKSw569PYGV9PTRUy10R4YWYpaDqKJUiVcn//X005K6BK6s0GsrMqgGHzqDed2KDwQW9U+WbUVblHKcurey/GYEsMg7rEU27Af90kaZ3aw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3736.namprd11.prod.outlook.com (2603:10b6:a03:f6::10)
 by BYAPR11MB3143.namprd11.prod.outlook.com (2603:10b6:a03:92::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Thu, 25 Feb
 2021 11:25:54 +0000
Received: from BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9]) by BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9%7]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 11:25:53 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] socat: Exit when the file associated with an FD is destroyed
Date: Thu, 25 Feb 2021 03:25:45 -0800
Message-Id: <cover.1614252295.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: MW4PR04CA0302.namprd04.prod.outlook.com
 (2603:10b6:303:82::7) To BYAPR11MB3736.namprd11.prod.outlook.com
 (2603:10b6:a03:f6::10)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by MW4PR04CA0302.namprd04.prod.outlook.com (2603:10b6:303:82::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Thu, 25 Feb 2021 11:25:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77edfbc2-071d-43aa-2491-08d8d9801c8c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3143:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3143CABC7F7CBFA0BBB9382FFF9E9@BYAPR11MB3143.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vm4ZSeQEBR7Ye+nGYjR9+rP+MzCMYerkcobI0v+NUKpaE0kyO11IToHjJD8KtD0sdFi9KPNLpMWmFzUfqq+dq631dzpn2zWZqIkjpvdpU/p4M4z3ovf0RcoZ8IJ4o5NKwq+LBLdSGxqeV511R+4y5DO5uHkCqmRZlgmlUr/eA8HIAWZQDROfw4zTIeVMheHxJtoqzkM8/7ydmTBEraoUpWFqAeb2JFBp+Vwoi4Ca00upzn25DZB9vkV85DBIRv3l3NKAhlKxsjiU5WoV1nnN9F+RiDKg10QDhD60FB7l5sHelQbCovmhSy3AtuX/DBFpTcPT4G4P2XCkGuB+iaQbOd78gU4PQaIuGqIbfY2v9HqL2KyBTRESF2k59PG6sr4bMlOp+9+ityuB4ETXBnREWSHa0+yaY3ATX6Yv6swOAhM0o6SbIJ5pFp1NjNQWvqiIjs8lSEYw2AgV9r8v62qyI31f3YGN8zX6JWmI3pG0YjoxAd8WCi13PExRkzzznb9/TmaNAiSQyq7tgzeQ8M2hGyR/A7wvMo0xHUC7mFwUr75fNvFCyId58Y1ePYCZM2QWcXZXKwWaXP1l4CIJvXCOSg5mOV0ilwThNpY4RRD3brs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(136003)(346002)(376002)(366004)(6512007)(2906002)(6486002)(52116002)(26005)(16526019)(6506007)(5660300002)(66476007)(6916009)(316002)(66556008)(186003)(86362001)(6666004)(4744005)(956004)(66946007)(966005)(8676002)(8936002)(478600001)(36756003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?MDVejvh+EUpFd78QGObXKXmNY34TO0UaGCzQpEazSmmIyeHPD/L2iHeF37MB?=
 =?us-ascii?Q?T5BYjSlC8TxlWdcnB+ntiPo2lvAdOGQAxTBB2mxinOamzjFHECwVEHqGVgyB?=
 =?us-ascii?Q?enXjWoSxrAbAtV1mrJo+2bqjmvbPKE/Qhcbk4WobUpbe3b30NS5gsD96/rYM?=
 =?us-ascii?Q?hy9IjjT5QU6D/rTIAn01/N7kTKgqlWANIQJ76hVYS7SYTg4NqevLwfhoxbS+?=
 =?us-ascii?Q?/BhwdZ5wZcsPPP+ar72eCF66k09UbBWAPrGF9xQmfEM59Z3nj0kXzpTMEkQW?=
 =?us-ascii?Q?sw7k3QaQ0nwrOHJ7kKF+BUUWCm4aS5CDAHR3aNCEQ6bR/CYbkIpF+/E3Cxtv?=
 =?us-ascii?Q?GKuDc1Mq09cvkFREMTxG155Rpvdf+nB+bqhKFxJJ+sdazAD27vqj21NbN38/?=
 =?us-ascii?Q?u41KSXPNlaQ5EmdFKGlDJt4vtMoD8eRwsCsohVPd4oS6dOu8F2P6gd+WwyDf?=
 =?us-ascii?Q?5vW6BanHDZ43SRHxxnFOND2gY4uZpCgV0vGSF9kgCL3B6hWZlyUKwGcJSxcC?=
 =?us-ascii?Q?YYPxgDXjFkCJ4yAcfKK/gwcDxq8F0xkItHrSOWOXya3njWOHCDrq24rGe/Cg?=
 =?us-ascii?Q?gtZzsDBkynR73oYc9QlQVMN8mRY0u7kmYY+KHIIiO3cooPfV5Gp+Wm062sIH?=
 =?us-ascii?Q?Mi/7asi9JT5C2l5C0NKR/bqAhNQ5Lcfg+dFy3zhIiOmoTJsp8ZOV69cdO4PK?=
 =?us-ascii?Q?ubOPcUzLR8xYbeHD6CpGBES55aqJmi/vFwohA934D3oi+xFR29KqI9TTIf0Y?=
 =?us-ascii?Q?nwFJ50IWf5qNHumnVkv5HVtgnwu0h/FntAIWimgrXFqarxhsMT8/qGkyJbZd?=
 =?us-ascii?Q?qJ6muI4aMmYIvj7doOFWBLBt/OHE67RWUT71HIZdtNB6DQYJkvl1r1MhSslQ?=
 =?us-ascii?Q?Y/SIGnpFezGuGlT50/vrEjClU1JLbp54WwwBNkHFp74IRuVsLx3LwZxJS8Q/?=
 =?us-ascii?Q?HcaJ+VcgAuv5PfV/aa58T64OqbqqbE01lGdScTd6Srti7Qz35DS5koLf4YWE?=
 =?us-ascii?Q?Mc7WbM6GsT8H9m9yCz4f0qO6WYmuybsyX9qSupVvHMxzEKB4DV58Y8ERbazX?=
 =?us-ascii?Q?G9Suh3+8Eawwzpq/8nUuRx05Anpxl7xV+kax2i10sAk/dlAcv90uVv/Xvs1X?=
 =?us-ascii?Q?ATXkntVgTZa0BDIoIDCssh0Cmb13D9kmsL+p/cVVHogv0VginqgL+J0aRud1?=
 =?us-ascii?Q?qb17sUGE0YUXzrRAzXwLtVs5JZQOAMgRxvG2Nq4YOD6de8a4GTdjy8MKysiR?=
 =?us-ascii?Q?/k6Zba/3wgFZWxfigX79tO8aJcGaasDd70otULEblBYPTBx5KPra/iaJTXQ6?=
 =?us-ascii?Q?hVNOm1pOiRKDlv3sitMjL/w1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77edfbc2-071d-43aa-2491-08d8d9801c8c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 11:25:53.2901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBoP2glje0FQESAGZ+DM7WxEzgZ81rsh8qtowZy6jHH4calAqNwNXxIB66Lo8SCyV1HUS+nkilEJc7ntUOXmZ5k0tlVlxh+Q+Rh8WUF47kQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3143
Content-Type: text/plain

The following changes since commit 93ad1ab49be03dd082a98f80464cfee9d98a3a33:

  diffoscope: Ensure rpm is configured correctly (2021-02-24 12:42:45 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/socat
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/socat

Robert Yang (1):
  socat: Exit when the file associated with an FD is destroyed

 ...le-associated-with-an-FD-is-destroye.patch | 62 +++++++++++++++++++
 .../socat/socat_1.7.4.1.bb                    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/files/Exit-when-the-file-associated-with-an-FD-is-destroye.patch

-- 
2.17.1

