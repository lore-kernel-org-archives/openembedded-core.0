Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F38DCCD195
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 04:31:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1360.1761107501995082356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 21:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dBHKW8Bj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2390c396b0=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59M4QbWP1698823
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 04:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=PGVtEtRqz
	HCzXLTgZLzg6LlzQl7DzWUPfRd8gpBUXOQ=; b=dBHKW8BjShdRW8CyuHyoTj/dp
	Y5DWyoU28n5NkgbqcZc5vNOtFu8nC1Wth3NAgIJKXgZhldUREGkJPNM7y64xQjuK
	AuR77/J/3yorOfPFc+fJEk2S1fiNucwREjGlwQHyLZW40ZUUvfPcJR6LljYsU7cl
	eaV1dCoaD0UovXPI31AmAqDiENMpLdBlVoAdtZaZwj/9PDy5fonn0fwXFN4DG2Vi
	OiU0XYcC1NZ20W0bbHfnndezBMPrAg6Qmj8hyzUXBDQg9EOiB6LmGIX3n0YkUDkh
	UZiUpy4P9aEAa3JmWzBQ525ZQHniRWkLcY+7J7+9NnULCEqzJ6UUSPcISGsJQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013005.outbound.protection.outlook.com [40.107.201.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v1v5c6f7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 04:31:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtpivNzxU9V8an7jVhbfmgS70lmMP/FZ9shUja2K+dyN9pBtwnB092/VR/egu+nFUTzJ6sMK+DJZFUVlGM1oR+4YR0RavaW07hIDllpC9ozWVebzp9Fnyob2bEMKr7t/Bg6OoGdostw8YQOpmu7terhRXRSinJviu5vYLnqfHcVfeTjlJchuAyTJ4DkfXLVFdMccSZbh52d2o7789k57ynHC2VpVhihMOogDvEYoOEqEqHg0TmhtoPvtfee9rEgpi6whLDK9DgLbwTTZXKAb3CcHh2RdvU3OZgw4aIO8WUutDAP3jvLEXpxm2MZuOlLLQ1UYhuzEmx+qPRfkugPlbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGVtEtRqzHCzXLTgZLzg6LlzQl7DzWUPfRd8gpBUXOQ=;
 b=a0QWznFSIS6eOzohjIwFBtSrgeY8sOyTsZ6SV+kYcoU3E2yPvKunkuCXfGM38QZas6lIX5nBfJzMZOLCHDYcZuVqw+ow7ExYVfP1PbA7d/pfWNyVU0EiPxN65bE6b5G0LEJOwxM6PMt2lHQ8DEVe5Gi6EgoAdWC12eY3j2bGdiBurFJgJoCaHB9cyU2aAdTtIPgVwq8K5+lY9EkL3KrlNe0NOw0PZ/ufAoguok7mT3whMKirmnqpazmkf2SXPXyX81RPOnTPB0RVGWRCop7qA8Sb4ffJ+xc1a4YcXNbjUPG8lkIp4sOVskSJxw0q+tX9Zp8eDI3RYAjFqlaL0iAvRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH7PR11MB7985.namprd11.prod.outlook.com (2603:10b6:510:240::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 04:31:38 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 04:31:38 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] llvm/clang: Upgrade to 21.1.4 release
Date: Tue, 21 Oct 2025 21:31:26 -0700
Message-ID: <20251022043126.989530-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH7PR11MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f710d23-ddb9-4a2b-fbd9-08de1123e3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pRqPz+uabl2V+cmUVCQJH+de219Wc5mG9aJWeVDdTFSEDLiJBXTUz0Taz3St?=
 =?us-ascii?Q?rlPIGi0nLkF/Ax+7ZjN5HIi9YPso45gN4eAnVjywiiyQRJ5dZuGaUqvHMee5?=
 =?us-ascii?Q?WO8AwvPbsYoIsGoMZoUHQeZ/sTyB9ecSVGEgaxfLmVJwDqy85HB0DqeuateB?=
 =?us-ascii?Q?Utwgeh3HQb9uNs/st9OmtTjMpMYQ48EIZTSK0uVPxZGdu17aCN5Fnh+HI9cd?=
 =?us-ascii?Q?F9quxw7l4IYyBicceu7XG9gyHpF/0OyE1LRvk2Kz6qJ3pJ8WinK1BmHJikF4?=
 =?us-ascii?Q?f+H7wUTqOuXEQwYfJOEXA99I0EhzwCtDoOhSJwMO5JZcPM8BTJxnG2Ye1iwY?=
 =?us-ascii?Q?UEJNiYBWdSznUljR0s9pEU6WIv+KFnYeMlfikE1Fh56f5Mo1vNAMgpeDUUIv?=
 =?us-ascii?Q?0q6wIEjjQ9n6wvQcAvPDtweRsiS0yhsr9QhUtvvZFI4cbvWa9SWrTU21x7yE?=
 =?us-ascii?Q?FTrKqezUwAV8xJtZQc+2d6TAQv8rlCp+aa54+re/RtFnOVcyvjBxJ6GViXok?=
 =?us-ascii?Q?V728mPmiS9ZArEw/vpDrR0nRPHZDyaa1Kw6v8wlE2cnjWgqMW1PVao7WTNgY?=
 =?us-ascii?Q?5DXHuGm+w4ltHCYqrHk/B3nXcZ8XCQJ3vM3ZYzxBYgdXAkyGWlPEheguZE6J?=
 =?us-ascii?Q?ZfFHU3p75F7TpcmhcBjhmNQ1Z46niJHVYG/sVxvqfoWnawrPQR7yWCTU4b2Q?=
 =?us-ascii?Q?oLUzfIgAS901fI5dVm38vh4SPE0SZRoSbP0ztcE4g3vf8+RVFI8TBtPE0Sbs?=
 =?us-ascii?Q?7aj5qMEFC45vUeZ4khHhqRikUID+UVZ1l4D+c1xPbdOC8J7ZJu8cnE7Nsw5W?=
 =?us-ascii?Q?5hl8QVgnC6Aei1zBmOyzU0yUd/0o+dI3EYy4K0n0wlWhTYj0aLQ43cqMgfCZ?=
 =?us-ascii?Q?9VciprMEGK55VkQSw35v0fsyprvl4X9w8afmp+IXHjynmYZ5j1I1z0ofvE1+?=
 =?us-ascii?Q?g5ysCQJkDxaMnfvoK0CmOIKQJPCUk7OoLsrJHjcx4rx/BwpKUm+kfbnfhi3C?=
 =?us-ascii?Q?iIdfOQDVo2mH+F2WsgpnlWoq9IuIN+qiCtPQb5BX659llL1n6MXbV9W/jS4v?=
 =?us-ascii?Q?k+3NTTHiNVmHdfO4jh1ydemTqaQ+3Dyi9Q+LUSVdIkNSl8bBhrKHHMxUeKks?=
 =?us-ascii?Q?FrTBquFmBmAJVTCOhDuU2Sy2Cpq1MbfG5MdZUJK4lMF5wkh6M+kPr34ced94?=
 =?us-ascii?Q?wqBpvIjPB8nt0TCfBdbvIlee/P3fVM1BSDWEtbGhVNKU3uQRzsgKm5gkgSfa?=
 =?us-ascii?Q?m5+z/iied2mCy5QoN7OYVYUHnyz/6M24d+G9lkYGAJbYTVYY6K/OwbdMoWID?=
 =?us-ascii?Q?b6rjpb6v/DZGbv1rONFvQo3wWDBwgSFjE8oviwVbVdLGASKl4t13AT4MiWlf?=
 =?us-ascii?Q?Cndj3lWTPSS6aPzOULPEAt/H5yl+MRx463N5g4w5Zu4qn+dzLILKFjXM9X26?=
 =?us-ascii?Q?wg3S7d+TSIWSvjoWwFjLlEx0/BAzWXYKAjS7tokp0GjUdDnzShvcJ5Q/0J0+?=
 =?us-ascii?Q?Lvzhd7eylub/JSSoJF0mi5/yEHkBKbcnXN6F?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u4J1sh7+tHJjzdOeBFYM1VT4egKIPlVivxjI+TVnswyt7tBF37dDtTBO9MNK?=
 =?us-ascii?Q?CYLWoEjsv9QCEPsxZEEOMMXSNjD3I8aWrwDfXiD0Hdm20F4paA5txRq4B9nu?=
 =?us-ascii?Q?/wwWfxVC4St5H19rdWSpK+RYPOSciWJESfmhX7hsE0+9PqA7ZjdhobNeQaKm?=
 =?us-ascii?Q?zlmH+XwlaTFnYp0MdRJ/P5arODaE8UFYqbari9msnB1gbqbu1+fZ1I7IcQbf?=
 =?us-ascii?Q?04p4D9TKeDKIQ+KBbVKRgM2/iQ4EFDEQWrRheL+47zD1kU2g1jEiQEfQ4uCk?=
 =?us-ascii?Q?TPqG5ir1uglM5FvgRD66wCRAF2khS0iIT48X2lXroUAQH1wal4w5z7KvMzWc?=
 =?us-ascii?Q?4k4i9g3xGDQbaLNZ3FJkxcrrxcFgu/7NQConOSbb67ey2RPR/KsR5fXzclY/?=
 =?us-ascii?Q?uyQ2PX3Ws6CkZwA9OsdLqhaieQ3yXkuhghQkvsWVpSgkHew1jJ/VFyvyCOsO?=
 =?us-ascii?Q?miRa5gWP4ru5AjbP6LAfaY7r9NH2AVv1eR+D3SKqUuEEEY70vWHKknV+TWc2?=
 =?us-ascii?Q?gUGuIHa+G8ZRu0dF42BT3o5w1L51ttajaoq+30rVnP6ma2wH2uo2WWRdsDAR?=
 =?us-ascii?Q?8kIYdmtYBOwXuN3hTs9WTxiAevKk/xVBS6toOK9gvq0ffmskzqYFljfBcrhg?=
 =?us-ascii?Q?k4016R3yhRuiugtpg5sXXxllrWsHOLylPi0kDY4UYB6z0C3Yg9vITgFeNiqN?=
 =?us-ascii?Q?gxx+II7kiJqpPf/O7mjVp9Iivlqy9fC0iOIFxEeYVhjvK7LyDRiZTKw3HTRd?=
 =?us-ascii?Q?SQ3BO5o1MFO8PxcT/De+8M6ApBD6yrk6FeqXvXwglO0CHpNVwU5z/lgjdeGg?=
 =?us-ascii?Q?yhbAiuDKQC48QsKQMZZB8ti1XpEefOmQ9qtE5jcxQyxFDBWIjNunVWSg06c8?=
 =?us-ascii?Q?s7+tItt2ggI+MW86k2IYwMqARIHQjcH8NZWdkIApuCMegPNej0hcz533JwsY?=
 =?us-ascii?Q?dZUDHg1Tg9GMRPhf9O8rAeMhWYJjhDSTQ/RhBNE895pEMZhdVei46f+HhTdm?=
 =?us-ascii?Q?SCKKeGa312KeH8VhpVtD3IwWXUZkJkcuSOjMvAfw8ki0Zl6KlEXyp36uN31w?=
 =?us-ascii?Q?R5jWcfc9FHUtOhmhzUGnxFeiPW2rkA47OsaSFjKOS4BScIdKiABat+XiQNjp?=
 =?us-ascii?Q?53iyKHpZHUl5Fph/+3XatEzkN6uivrpAZ2J6QvyghmjuupRl1JhymXfI2Do0?=
 =?us-ascii?Q?7sJ5ipKIhfhssxFZl9RY5pUW7+HbqkXVS2GEdtYrGa4JHcF5Cg+rP3yVlE+u?=
 =?us-ascii?Q?Yder9hkGvF9tqjQI4u34E9oEe14qU7mEDuBiYNPHcAH3Hou/alalahoePb3r?=
 =?us-ascii?Q?uyDazjSrTXqIqDBFy0yachZVg3TK4LAKRjeDKqTLSBQpsqjnfXBE8GFvHRwf?=
 =?us-ascii?Q?sZRLRVTdaMuaTEvxKEc5wZygVeg+jywag7+zhaluGpxbvi+hwiKE8H8sS95s?=
 =?us-ascii?Q?SswUGVjxaZyz+ciaLJ+XDvKP1JrY9Y7ndZiuUE4K1GouqdC4gfGppkGq4XEn?=
 =?us-ascii?Q?UoVUyy3Rb4Xauq4nHjKnBNlOmAlIEIcExwwNRpk6IiBFi/g7hQeUs1ijFfo6?=
 =?us-ascii?Q?n0kk1SZ47TY5T8zLVZ0Xw7yNvkBmZ9G/Chw3IkeuI/4yajBeO19mtp/71zIl?=
 =?us-ascii?Q?FK8bUN5Y1vIGWL0PEhBl7bE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f710d23-ddb9-4a2b-fbd9-08de1123e3f5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 04:31:38.1161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqty1axC4T2Tib8rl+9NxJYfWdwYE+H5GPYJDtzr4Rz5elEsTzK+Aq3M0VDucBRL8FYJFviWHpf17Cmgvd2vUDQQtgSDNbK2y3xRobRQEbZJ5BZqGRpSvYddvi9mWebH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7985
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDAzMyBTYWx0ZWRfXz9WtD3I277E7
 R+yZd/hSZtZZx6ByRGDxlP9qL6NxBEHWekhy625Mra7CfAAgN/qceFRwcvmRZMI5a0AfX/zVmwu
 3zEWcnbdZpPNqwts6Ezr06NwA3Sw2xsf/+vea1JEMAt7LX0Ff8WB5CHTxYHkHHSJcD+6QQjTirN
 cejvxyKw8xTWvVZZJQnTqKaklGu0//ktPC1GQzGnDyZxhsIJSE0J7x5e2Jq1/aKUPsgPkktFC5+
 vYlNKHRlSo4lAiGV1Yw4gjCOTMnUPLAelUF2e7ZG7e3ggRtbyvU3o03QvN3DV2AIFXjD2DAxCyW
 TEtSrx9EIZeLkI5MlUBlPqDB7JFTV2ERLniXXw9+NIhMcgpwQ4u0TILCmKDLIQ6sQcpq8hVkUJz
 RdmLZJlvi3cEI85Nr/woTqc7GC7bvg==
X-Proofpoint-GUID: GwNhl-PXu2gEIod9HRgVPbf2owWsSpIf
X-Proofpoint-ORIG-GUID: GwNhl-PXu2gEIod9HRgVPbf2owWsSpIf
X-Authority-Analysis: v=2.4 cv=ANdmIO46 c=1 sm=1 tr=0 ts=68f85e2c cx=c_pps
 a=RM5EPw/H4l4S9ahloXzS7w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=73rNOMczhYlk16fdxXgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510220033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 04:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225168

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Brings following bugfixes on top of 21.1.3

222fc11f2b8f Bump version to 21.1.4
480a90482e5b release/21.x: [clang-format] Fix a crash on BAS_BlockIndent (#164047)
3333dd88a493 Update clang/lib/Format/TokenAnnotator.cpp
54cdd973782e [clang-format] Annotate ::operator and Foo::operator correctly (#164048)
ceeb93096c79 [libclang/python] Return None instead of null cursors from Token.cursor (#163183)
7e153f5372ed [clang-format] Fix an assertion failure on comment-only config files (#163111)
faca424bc5f7 [clang-format] Correctly handle backward compatibility of C headers (#159908)
c5a3aa8934b0 [libc++] Properly implement array cookies in the ARM ABI (#160182)
0d819a9104b2 [libunwind] Fix aarch64 SEH unwinding with a debugger attached (#162867)
464d75ad5f26 [MachinePipeliner] Add test missed in #154940 (NFC) (#163350)
ffa6b0c365ec [MachinePipeliner] Limit the number of stores in BB (#154940)
570c4c944338 [clang] Fix catching pointers by reference on mingw targets (#162546)
c6af6be3cd1c [libc++][docs] Add missing entry for P3379R0 to `21.rst`
a2e93dce5f2b [Hexagon][llvm-objdump] Start a fresh packet at symbol boundaries. (#163466)
dfdee9a929aa [clang][modules] Derive mtime from PCM timestamps, not PCM files (#162965)
bd9bc536b4ac [LLD] [COFF] Fix aarch64 delayimport of sret arguments (#163096)
7b785dcb70f6 [LLD][COFF] Fix tailMergeARM64 delayload thunk 128 MB range limitation (#161844)
a847f1832857 [Hexagon] Support lowering of setuo & seto for vector types in Hexagon (#158740)
e14b5e82244e [clang-format] Fix a bug in wrapping { after else (#161048)
b54051ac74cb [clang-format] Correctly annotate RequiresExpressionLBrace (#155773)
c9fbd571b52c dfsan: Fix test with gcc 15.
68f118f265c9 Switch dtls_test.c from XFAIL to UNSUPPORTED on aarch64.
a86b1e397e90 compiler-rt: Make the tests pass on AArch64 and with page size != 4096.
c03b58bb091e [clangd] Fix code action kind for readability-identifier-naming fixes (#162808)
caef7619d5fd [clang-format] Fix a bug in OneLineFormatOffRegex (#162961)
5386abc82ab8 [libc++][ranges] Fix `ranges::join_view` segmented iterator trait (#158347)
18593ab316f6 workflows/release-binaries: Run tests on the same runner as the build (#162421)
13bee3a798b1 [Mips] Fix clang crashes when assembling invalid MIPS beql instructions with --arch=mips (#156413)
0d1b9249d189 [CI] Add dyung and c-rhodes to the Release Asset List (#162478)
c000f3226bdf [Mips] Fixed libunwind::Registers_mips_o32::jumpto to allow for load delay (#152942)
276050887539 [LLDB][ProcessWindows] Set exit status on instance rather than going through all targets (#159308)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 444c7f6521..c4142e2b72 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-21.1.3 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-21.1.4 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 7191d41efd..416258c5d3 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "3"
+PATCH_VER = "4"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 8a7ac57554..20adbf2610 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "9c9db50d8046f668156d83f6b594631b4ca79a0d96e4f19bed9dc019b022e58f"
+SRC_URI[sha256sum] = "a01ad7e5167780c945871d75c0413081d12067607a6de5cf71dc3e8d1a82112c"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


