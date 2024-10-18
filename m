Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBC3D2F7ED
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 08:32:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17853.1729240319757642813
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 01:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00212bf8b4=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I4sXJn025804
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 08:31:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3esk11x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 08:31:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKsSJDb/2kpjlvKQUTDlrNBfk/2tsmwrtkCZbn8gJprtc41t8jBSa208+XTx/R01MB6m8pD6Bot/sFlVRXGujX03bVAkWw3SVMiVSXFFvwet3NbqkzqBMqN/+OdKCcyNP1kH5iebC38A/HMfqvIGxKVMm7MKOI7pyGCk6+XO2qVXVaw/N5eyFwro6K3iLRNTbB+IuPQtI/qzzciFRgR7FOYX4Ry/jY7nVyy4H7h5A7sqMFqT2PX+qSH3IPUPi6e3P0FFuZgJCItkjGGleIl9AVoqBRNFAsBqQmF8QwnHSmw9fSZOw2RQWut2ZH6XPATVvOGl2wHvypBqqMnnimH4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2tfOXzUxl7/b1TIUtLXWI8oNoVkaJCuAhxdUZ+rl8I=;
 b=gTkNQLU7Q467aoB4XJxvdaFfiOOFITMDrWftI0vlQZCvoWYqNe6uAmhR9AEGfUr3VHGw0lBfnAmhOMbKDoFiSWFZpjRYoHupO7kC3LJVKCqqZeJBIuMd2ZL5JrYXxfSvzLThbZ37AUzwX/fjyBXmxoucmlLpseEinnGCXKi+26ztUzNAn1Xzr8+MlZag2n/iOcsGtYeq25yU6ai8IvxPPjs03C1WOhFk1bT0wOavVOgpbQ1pbMPZWJX+zFC58WD4MIdP7WzUHQZKomNafbzEYg3jrBfIa4HKMopytZfKBmARQbbRvOLLYKPy5oZkm+pLCmSt1JkXlBY56r29/L1yFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS0PR11MB7622.namprd11.prod.outlook.com (2603:10b6:8:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 08:31:51 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 08:31:51 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] oeqa/selftest/cases/buildoptions.py: ensure libgfortran's package_qa is run
Date: Fri, 18 Oct 2024 01:31:35 -0700
Message-Id: <20241018083135.3643966-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241018083135.3643966-1-Qi.Chen@windriver.com>
References: <20241018083135.3643966-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:74::19) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS0PR11MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e12b53-4542-4968-5340-08dcef4f4f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rvZE6SVn0JFjW9ANyV6ylgNttEBFIv/mSIFfFMHGyKEmwEd3GzNhsdZafdQH?=
 =?us-ascii?Q?EnTuPCByaVsOCmz1HWJ1j+M9rzraPNiJTQUAUL1BhJmlQjUnhr4wV1hyIZxI?=
 =?us-ascii?Q?DeVBJvEN6jLrG5NxZAIJv+jNcLwBJ3Um9mDHjw0TM5qa2/PYBBb2DI9wYnvn?=
 =?us-ascii?Q?DrjFe8x1wLQPBHXQ05TH7MZtwB8CfVPAec9YJNgswdO2XYQHXnW0wxVomn5k?=
 =?us-ascii?Q?+nyb6y73QSjQhhdCE49BBNuFzJ41kVhqJbNqNtTKdvddrclrDQt67NmpyKjx?=
 =?us-ascii?Q?5LTbdrUOeCj8T/kMUT6kELbGw2NqerG032JxISoCBPbwJAdge9xlDL+C84GJ?=
 =?us-ascii?Q?YWlsiVKTW8CCbqY2551ME4sCjqvq7Z7col911EUvmLOD2H+tUVgGw6Ho765t?=
 =?us-ascii?Q?8NUm91Pq9GVlfhpAbc1YOvlPXlLo3O/MQP1ap0huqyr5rBdwQtTOuXvRSWYr?=
 =?us-ascii?Q?zZeOzeogRmM1bLiOuTvsxbNEnbV0+YHgglVaC1W0PzwpF2Ls4WxObIIlmrki?=
 =?us-ascii?Q?dqui4YDKBTRfEd00Vzh3i3hcO9gt4/gViB5Tz8P829G6uVopLlHQnW1pGY6J?=
 =?us-ascii?Q?tusrlW4LGeMvUNaL6XjmyQPJVAABiKaUYEsGdCdaBTjKf0helUtncZcfG6wQ?=
 =?us-ascii?Q?Tcw0zoh3pzv+nzNyf9+gmEUGRDniXvUbeES0FLNuftMsfPSKdkzH24e0fh7Y?=
 =?us-ascii?Q?EG4a+4FvO0EBcw6L9BU+sOOd5KeVHuHjXsXN029afoAwrACqdkCePxB/ih14?=
 =?us-ascii?Q?Ldu+4Gn1jQw9jObkE48rI6Pbn3TRUBx4Q9u7yL/YfraaY9RZrxRLqtTvztd3?=
 =?us-ascii?Q?aOOME8N0iqHnM0hIqogK+2GFef1yZXZB0+mXQfzwelWFA9vGQPf8VnkCmxHd?=
 =?us-ascii?Q?GB0ZNWUIG3Vot+0Suik6ZX+fc/bRuTr7dD83rptKer4zymKXh314HADCyR8C?=
 =?us-ascii?Q?xpwDv8fY24A2FsOp08tOs4JCahgtLfPPkkUzOtOHtxwiVazMPmwT9IfLZYrr?=
 =?us-ascii?Q?87ebpuSjrLC7t+LtvZi+rxSDeiQh0xtLhejHYIKqxl3SuqKSSOGKClaHxhOg?=
 =?us-ascii?Q?XV8ertyQtGcdZdBsg9k03KSoK3U9aUHN+JKmv6J3g+nZPDUlYH1zcH0Rqp0t?=
 =?us-ascii?Q?D6v2YjR4D8VEfFupKh/D+abFwl4yjUSPkMTv2XR+OxsRPpQbAScYKjb3lari?=
 =?us-ascii?Q?y85rBbq+oWhN+q/fmY9Uvg4xZ2MWar5BGYygRhvSa+ju//CdQujWlKeb+8fq?=
 =?us-ascii?Q?onA766cFHZVdrS/Lr3kqdSCWeSGuHus5ZIE3NuJZZTpQ/8qEZ0Im3BOt7Qgv?=
 =?us-ascii?Q?eh0SwcCDxlStbB+MkJPOyWSzk4LpBVmDlyVz6x2lSNhHsuQt42n2U/8qYcGY?=
 =?us-ascii?Q?QiYQ5XE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dFwNHoBqWWmFC7yCVmMeHAynC6H/UJFWjPMMz7yEJuBSYfyoAtn/bGB+JOyj?=
 =?us-ascii?Q?rjFfJy5brPg6IJeUjn9/0PNW5VSWLRTORqOd9fZ2XpgxfvtcJQtG4ce1wECT?=
 =?us-ascii?Q?x8niUt3THpm3oNeAPT+J8rEKCNADy73rbDn1vC4ClcCVbnGDtHKMIioTWH4+?=
 =?us-ascii?Q?o1A97tsii+Q6zD2TcQZYh5CwGOXz7V+T7Jqcx6E5D4Yuo1kxqDfxltZW0+rZ?=
 =?us-ascii?Q?Hrk9LuDvit4TPhxP4Pb+4Ew2zslnvl22e8MCFeZinGZt5qFCsm2QLP/WuqhD?=
 =?us-ascii?Q?V8GTHjOkFesxGaXoqlptuqiXh37EqocFcpR4vatsvLOsu0t0zyo4i5FtV2HY?=
 =?us-ascii?Q?drpsQgO+mZk1XrUSz420Ni2Mll4QpFFCvODq5GuPpuBTu59Z2N4h6NQnV+Rh?=
 =?us-ascii?Q?iPd8V06pQIYpRAuTdTp0ijpXURdzQ2xam0SJpgIWzXNsBSSpcgR4DgpwyU45?=
 =?us-ascii?Q?24ByfiSs5HSGEUfmIyuIn0mYLhsHaP8yQfuuhjiYU81QBtC3bp3uS+OUxGql?=
 =?us-ascii?Q?hoQBg/VqkvB9svI4IAB3R1oaoo+/DHgkfXWN4//eu5mNfR6CHuiVJ8+kNuHn?=
 =?us-ascii?Q?RDFVXMvyLmsRNaNiOv/xhbp3jSF7D/XXzfdsZHyJZ3EuToIhGsL9zaNEELms?=
 =?us-ascii?Q?kTHtoHul/KAK40RY62FUkoGZe2hQLBczYZAXGYxTVLr0qvRmSexT40u2Sqjn?=
 =?us-ascii?Q?lpq+PT+3MshCzDeQ+X1O6BfqYJYXo1S2RF0GVtxZk2qb9ntDlruGjsCxNOyC?=
 =?us-ascii?Q?tL1iax9oWDAfuBsjmAUEwrO7nXZfaqCx4uz7vNRmg2Pzd8+0kiTdhkw/zn85?=
 =?us-ascii?Q?zhb2QfKYBObj6yufdM66W6EbWbkrQfT9el96TQJo8ItlODnw5wnlYAihHZsZ?=
 =?us-ascii?Q?MC3PyvQtt4kejIZm5o2siYSvhFizmNX49oN2rEZsxXNfDVnw2F5+dC0qEXI9?=
 =?us-ascii?Q?2cbsmybvYYX58hLYXctUFLWHFeFL+bh6KNgnwZqzhMitvo93HQ/RfptMOetR?=
 =?us-ascii?Q?GgoVkmv2a6VW4rr+OIthRdUFIdHgrgrlYUZgT63p4YDb/l5qQakH9xlQ7lyd?=
 =?us-ascii?Q?QjMHuLdhNPbnrkR3RXEq3WqWhKz7HiPn3nap/trJBhPh3A18mU86sj6c/2GQ?=
 =?us-ascii?Q?8GJf7RZ/xXUJkZnizRPnQ30EahWNqhe66Jj30Vc3dCjssay6SZGNFzkIwPb6?=
 =?us-ascii?Q?7iLEsvWrbVVXoYSj21XgIk9Z3Qz8bHRx4dV7xcDDCrbDr0LQm4UbW7pu5Fc5?=
 =?us-ascii?Q?LDP2cbMZmXKJSuBw2+vjRE/e7hv2Emm7ugl7mZW2mB4DXMz+28I8ucMkskfG?=
 =?us-ascii?Q?3NpULR99+52axO5w9tj/K6Iy7mysrCA/YWH17KVtNl9VAtNqcCTdXBDo+mMf?=
 =?us-ascii?Q?4v+YxCIm4Kfv9Rv5qU8CpKFoHrHM2IiNvIavFIXIt4Yo15aoy7S/jtjg/c0w?=
 =?us-ascii?Q?O6vWlKhD1eJ1MtSzP+/qgXmzKpOKM6O/U4YpadvufgaRHt3ZnQTiuPazOlBa?=
 =?us-ascii?Q?5kZUZBIhXp7f+4/CxkQjX7VLGS/ckvucA/fQf0CDmDvX0eFwt9dRdAL3lMzS?=
 =?us-ascii?Q?cqTdQqjrz+QxIJ6DhwZvLuNiKBid2S2u9drZxXBs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e12b53-4542-4968-5340-08dcef4f4f11
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 08:31:51.2975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWyGZ9ITqbb9r5W98LkKt19edekGVntAhj4AHX0d3YtEExguZxtmJQ4UMneJvLbiF80eKlzB2EPnGZJEnU9rmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
X-Proofpoint-GUID: -D6vQhYSQ9Zx4zurxpytu64u_Yb0qQDk
X-Proofpoint-ORIG-GUID: -D6vQhYSQ9Zx4zurxpytu64u_Yb0qQDk
X-Authority-Analysis: v=2.4 cv=cPWysUeN c=1 sm=1 tr=0 ts=67121cfe cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=tqf-FOaxGV95MRV-92AA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_04,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 mlxlogscore=626
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410180054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 08:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206041

From: Chen Qi <Qi.Chen@windriver.com>

fortran-helloworld DEPENDS on libgfortran, so merely 'bitbake fortran-helloworld'
does not ensure that libgfortran's package_qa is run. This actually covers
the buildpath issue in libgfortran. This patch ensures that libgfortran's package_qa
is run to avoid any future regression.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 423c31e189..4e82c34de9 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -203,7 +203,7 @@ class ToolchainOptions(OESelftestTestCase):
 
         features = 'FORTRAN:forcevariable = ",fortran"\n'
         self.write_config(features)
-        bitbake('fortran-helloworld')
+        bitbake('libgfortran fortran-helloworld')
 
 @OETestTag("yocto-mirrors")
 class SourceMirroring(OESelftestTestCase):
-- 
2.25.1


