Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A16C25B79
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 10:49:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16469.1716029353064838786
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 03:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=58680a6e36=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44IAYlQZ018525
	for <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 03:49:12 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y6rbk82aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 03:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSbMi8jm8grbYV4OHdMqd1n3Y6cnoSrLQek1guZ3kBxDLLY1FFs4zLYKU9MTyXH4alktQo7lSufNZXyxXo5hQBuNw8XdVIV176DE530c/VJlQF+VK5dJyCVf/MWd4XosEj+Y5cYMXI/zfhuAAvWmrvQU7N3oZNrHQwOUCx+CPFExhyh0I5WEJQ5CpaEEpguTCRZJlcieCvh35bRgbBf4Hgzmoy08VG/S01fvrSO+J7x6kfmUDdedMdZMbXAfWQIILOhpgXfmgXhk9Vgk+7qkgOoWL/NOzKxhnYE6Zxjqs4Tl+ig4tjjbXtEULkqo6FC0i9bhJg+SO5wSzFBaCyQtCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAS5VhWCbYZXwe0FzM2zi6aHfpguiTeDjFTImFM3mFM=;
 b=bryQuejhbTIZZkJPVgabHaGDnTSxEEEr8BrhfyAWr+IrYCZDCkRBBD406V2QM6M/h5k2gp/Yg29mszv3PC36/KqtsXMYzeXlONhldM0j8NGfRey4Xl+/De4rs4DTlNCSmQ8SGWwQqrIaIDCrbCq3L78Yy8m5F9q6dpH3pO7xDyDc/dE8DQOM76/BCJsEoiO9AqhRACBWX01Yqb6pJYqLdblHzNy+AbAz1T5+diqcTMOnC3BAZfzkjdb8Gu5YxgJO899wKhKbP3TnA6mLZqFF2wBkF5MaYeRfpBU1UYziKpZV2/yLQM7tIRGq4zdp/pZgBnUxxA1Lgc9hGLK+ces+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by PH7PR11MB6746.namprd11.prod.outlook.com (2603:10b6:510:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sat, 18 May
 2024 10:49:10 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48%5]) with mapi id 15.20.7587.028; Sat, 18 May 2024
 10:49:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libcap-ng-python: upgrade 0.8.4 -> 0.8.5
Date: Sat, 18 May 2024 18:48:54 +0800
Message-Id: <20240518104854.2524611-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240518104854.2524611-1-yi.zhao@windriver.com>
References: <20240518104854.2524611-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYXPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:403:a::15) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7489:EE_|PH7PR11MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd6ade5-d5d8-47f8-06fc-08dc77282646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|52116005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?J58bhaYSEg7eTcG70ziBOrpnc+8u0OZOdFVb2eyAa9xE8C/9Byf/sXsladc5?=
 =?us-ascii?Q?DEI38FnNAEVDw+qGnjQ8QOLb/b7plpbsSntS9U1bDTzF4ML4dl9YQ98A2d64?=
 =?us-ascii?Q?sVMU8bpfRNjrtzEfd2ECoAKkQebQ/0n+vl5RcWuwg9RxsQledET0fF764psm?=
 =?us-ascii?Q?/koWfbvq8Mw0quqx3GpiMjOdAWPlJU820fQxQ2DK+JjfJuXuVEo2BLkEziGL?=
 =?us-ascii?Q?cIDeu2fWE/pNNEbDncHt8ZIORrZMblqkA52MF3CuF0577UchmIUlSH+HTb8W?=
 =?us-ascii?Q?fMyBXIvxnViDtRBE7gslY4bGr6vszQfyWPa4DJ/zWNR3VxR6XxKidDfeTFL+?=
 =?us-ascii?Q?xVFdzYg3iKH2knxbhB6RpyRXIfIcHI+oJjLVaFrn2PP4x32W5DXmGhBUifsd?=
 =?us-ascii?Q?UjmjblwbJyvENB45MeP3FsLvpPHRuB9IPH1WeONZpwJpy6CLA26HiZtTL5+T?=
 =?us-ascii?Q?2FGtCSEfMC5oBzE5SqgYUlSRwhKy6PPsblO5aqm6hPXKcVBvotVaKQX/xf40?=
 =?us-ascii?Q?Mra94GULUAYlMubCWh25hQSbO9AXLhfSVoKyMCvO7oOXFJz+QSWkcITaLX7L?=
 =?us-ascii?Q?DTXyqrvcdJiHss1jAoN18dno3a/QDK0OnRQtwSy6dtf2DLNZ+7j70yBiJvAZ?=
 =?us-ascii?Q?oXBad7NYFVR8hHrjagAn8WW/JEStbutfxzo7eY0qrCedvQp11HyGOd2/IWwU?=
 =?us-ascii?Q?G4q4OLBlU4MP5wUSAqncJVcGGl5ccpE4UU0mxAYwADhI1LWFhHH3vMFiQg+S?=
 =?us-ascii?Q?aIf7Qs2VR+rZV2izK3qUa3JOLDo7pbKxedSih/lMl6SMZAe9vGE895G+DmZ2?=
 =?us-ascii?Q?zRSLBIK7xe5M5jztLxo/a/0oTZrnStWCOtSgO2JtX3t4LOqIhYN0JXEboxIk?=
 =?us-ascii?Q?rjya0oXXpvfWOBr3niJb3Nu63jIYv7Dj56ZbxFtTtZqGvOjiuTfnd7baYzlg?=
 =?us-ascii?Q?MakCEz4pyMQmEIeuhlpDISB3ztnQSiskjoRzaT+HR0iFbCxrlDAyWm1tREp0?=
 =?us-ascii?Q?utWCxggaF/BXYwbB95ou/XUzSnIevX+kBDgkAZBh6w/+1R57Z5lUnbtqb9ag?=
 =?us-ascii?Q?MObQ6CML8WvFm37a9P6Jmw0J1CMsJUFe+cjaQjKhWBZdGiHdNQjHQj00qEer?=
 =?us-ascii?Q?GsEVd5bd0G4KnaX2absJco/TRWCbs8+PMskhuKMFb0wM7KX4O0FNOxVzuDHM?=
 =?us-ascii?Q?K200+zaIBtob5Zw96YoCc7DIlaYcG/n1C/ZoNf+ezBhnJnIz5sm7Jgc3/oKI?=
 =?us-ascii?Q?nwjxBEkw2edzGsUNlyprmPGyAwzXiaiW2CHahwYLKg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7489.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0leggCxkGY7Uc3Cz4o/Ummp/PhpZoa57v7E6SeZR6fbYhl8W73ljZuk4GhL9?=
 =?us-ascii?Q?clwHyTk/qMmXn41ZGPJBxpjfsdHhdKVfniUFJCnB0sAk2mDCq/VNWqgF9hYi?=
 =?us-ascii?Q?0VbVDkvaNi33A+BpdGOqhUgEnV58hV13gYiX1vrcPKLi7uN7rQ1VG7WOK/rB?=
 =?us-ascii?Q?GyPlcbc6qjP4Jl/Xf88llM9w1Q1+l07B3XHSiR5UuqQJ5v3hDpJO+uW0/hs7?=
 =?us-ascii?Q?pP/U41wTgFNJPz2L44XHnUC5E9AmZzxDd/0O9UlHbLNa+/XmU0x774+coCUW?=
 =?us-ascii?Q?SgSzHu3uXr5OergraW261qU5jfI40JWJHP03TCQ3l8MncZ6uo3QK/6zQm5k0?=
 =?us-ascii?Q?FMNSFMaV8TaGT7AGr0e166HPURri0wI1QYkbKWqalVUP7T/J9h7g3TxQeDAm?=
 =?us-ascii?Q?RttyOOrhd/Y8knDLdr4eCk4EBIRUTbM2ValbSwkCq1GA0vOAgkgWOOimNkSk?=
 =?us-ascii?Q?w77Bz2M/l0rvx+MN4X4Gcda665PeS1B86hfjn1oC9rWgQKQqncA/z2NPnTh2?=
 =?us-ascii?Q?eFwXjPlNGQms8LB0myNU3DkzEDDX3srrwBn0uXouNhpCYU6Svhz14LeAIxg6?=
 =?us-ascii?Q?BmA999M5ILvnRkyr1jISkGZE05aV2KILKAtbA0P8ycVX2CGkFjJ2fzpkZUo7?=
 =?us-ascii?Q?pM1hVNEIPLa/9T8jqVK7Ro/i7d7K1DZjUeJymzJUlPBnwpkalVTyU2rt31UT?=
 =?us-ascii?Q?TpuUS6TLizSVlEWzRmehBnQAO2WvIwmHbz9rIleHP2FK74YbNN3zaR9svGpI?=
 =?us-ascii?Q?DIOdtPi2QsbjvniJHRyxL3esGsmwztITgyhHd576yWVrHT0OcKlmU5uusHuk?=
 =?us-ascii?Q?o/lpxkY6C1VfT4osA7GNcv55BPkV2t10JsSo23jfZZxNDZwnB/OdbwEjWQWv?=
 =?us-ascii?Q?7iVgxOYxKxfAMd6UsQBRaz1eGkTVwJ05ldf0lVQ7vA5vqbnOX0dNsrwqLRQI?=
 =?us-ascii?Q?y2eV4atYu5l2LvCHNt9+2hV9PfsVbo20eGChKtiU728KrFtP+tKabZgzVefB?=
 =?us-ascii?Q?ZzGWDnTJH0n5xEgD9ht6rrAFmGSlWVoEXVSfhF8+KkKE1fE0FSAHU0i/SOqk?=
 =?us-ascii?Q?XnHJwg2dMhOmdrSK6RxnmIK5wGv4nN95JP3y3d7B5q7xmXsfQYNKcPj32tcE?=
 =?us-ascii?Q?sBgeJxo/WQOT+oyYbxoDFzvxslQzYuEl7OYcToHFmevWIDoW+LuIMmZpHDFl?=
 =?us-ascii?Q?dPuOZp2A/XM1alZrA8GIElLUOEDjBIeu9rpgGxtSo/9nBtUIxWNRQc4/HPMV?=
 =?us-ascii?Q?4Vf1BCnV5ZA4sknPHv2jiMPURyFKRe17acSFpFTxjThRF5I6bsrlDNip4Xk9?=
 =?us-ascii?Q?rSfeajul6nbapowjtBRzPxUVzhS60tg2Jb3v6eXORontsb4t/yh77rR79iGM?=
 =?us-ascii?Q?OpNCFlimg+X1b5Ch4jsllCKyVV+caSvFbhoTHYKe/wjJOjtkTn6UjjquafQb?=
 =?us-ascii?Q?myUDC6hExw2xZ6xcV82jzCnJeRTC++rnqV48qf8gcA46/YywnfR/Msh2y9ON?=
 =?us-ascii?Q?z7UuLH2qyDFBGDT+G0Pz07d7xqWN+B7UMQe6SnJfwi+MlNExUVUJEpJ3B/25?=
 =?us-ascii?Q?DAb7B+Pyk9ehJZ7JmI5dj35GnXUaSCGFmB/3WrR0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd6ade5-d5d8-47f8-06fc-08dc77282646
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2024 10:49:10.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h352kt/IVFTs6J4oiMN5YMCl4xF9duGcz2JuIgw3t6ciUiDZsMUgG8mC98E9L+BIkH5gYD+RI/As5bvv15ZQ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6746
X-Proofpoint-GUID: BTgpSzUWbGBOp-BRgU2aaDQC-lFRHsJb
X-Proofpoint-ORIG-GUID: BTgpSzUWbGBOp-BRgU2aaDQC-lFRHsJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-18_05,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405180080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 10:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199536

Changelog:
https://people.redhat.com/sgrubb/libcap-ng/ChangeLog

 - Remove python global exception handler since it's deprecated
 - Make the utilities link against just built libraries
 - Remove unused macro in cap-ng.h

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{libcap-ng-python_0.8.4.bb => libcap-ng-python_0.8.5.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.8.4.bb => libcap-ng-python_0.8.5.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
-- 
2.25.1


