Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D0FC7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 09:37:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8769.1685698664035146688
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 02:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MCUuG+Ge;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=551703f53a=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3527KBrB025071
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Jun 2023 02:37:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=U+vMrT/YXDVlrpctHFc6xDRcn4AYVTDIvDsHbg1x7Dw=;
 b=MCUuG+GeVPpT8sKrtZcgcn4AhvuFb6QaDSyyjn9DHQB4sriZOtwCnBwyKcrTSoHKygmt
 8xZlH2nAUjWWimh9fbY9p4vTg3hrrByC31EI4+po3YOu5mGHz/csJ/326sSE4uZP8MTX
 BPFp1O5vqKARPLVFJT+mE5OMnSxr4viwj9WjorvvzQWAnw6OyYsV+bPDB/MQ1IQrhsyI
 s6iMXIVxAvOzdeV/QTl0/powL5wFNotWoCsCjY1IaQ+2RboH+stLfbYUBlcfL9SuaQrd
 LtIxVTivk8csiQs+9CBvuCvne0Rqt7C8lSjTR0Kb58SN+aBDECOtlQchAR08Zp0A9h4B Dw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjdhup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:37:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYQT8uPEcpTjI4s8neybAXXY88OVxe+7FC58y7FQkyLY8xTFJZUW1l3z4i58OC3m6UsG82WZbO2qP6mPx6OPeWM19CZNFPiDngtL97OxRtB9r+uq8zLGvLCY53MTuYhIxjo/N/CKqG+KyuEon+2Oohf4CLzihvcblgQlgEey3RbaXF0enGSOKWA5dKYtKEhlTRFKmV5WmRtumxtB8OTJGgcAZn36fQNN2IDNkg7B6v66k/aIgFzuRnJNTXT7JSJPLctljtt7fP0famUQZw/zblRhFinbCUe1HpCmM1EKVwzXdlD4CtCqOCyX3eZFLTLwCppeMKnQEVJIbHEhMYlNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+vMrT/YXDVlrpctHFc6xDRcn4AYVTDIvDsHbg1x7Dw=;
 b=Tew7ihLE6+l+2kS7gcDazz7XK/btAOISM0BVl1k0r4PDYxE/YPYIpPSh2YL2C769VQNEF+H1tMi0k52ci2BmPXVlm57aiKJzA8DUEsVZUuFVQZy9SfZiNkjvUE/j9TD35midnCB3KAc6q5FrthA/JVCoiReyHWEFoK6MkjovJlBOyixug185oF5mQvw2oxdsHGduRGBSWAd7DPbIXMxvjE0KfH0+TBTroveBOYqBmzQYWaK1HKs+A9W6onXxT4tiTWH1q8eKchqJGQ6mprZTOo10f6VKK9oy826/6RBxtSg6RzWy4kY4LYM2gcrJ2+LpNBqKThZfX5ToUmyAvq+j4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 09:37:40 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::dbf:2d56:8263:b889]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::dbf:2d56:8263:b889%4]) with mapi id 15.20.6455.024; Fri, 2 Jun 2023
 09:37:40 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][PATCH v2 2/2] go: Use -no-pie to build target cgo
Date: Fri,  2 Jun 2023 05:37:10 -0400
Message-Id: <20230602093710.1026508-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230602093710.1026508-1-sakib.sajal@windriver.com>
References: <20230602093710.1026508-1-sakib.sajal@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013E07.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:8) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf7cd97-4737-402c-688f-08db634d016d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a9UX/Ok2qdaOsGLFVveYinIpACNNPaWFjdPl4nG+FEmVomI+zlgkFz+gJ9pHXjyObHy9hTQlAjvCZHwo8Iq093eNwt6hDJdp0HuYnvpm83+AfJaSftJb0Oq9pgVwAVzsvuLuzef259uy4lT/JNhkHg6JmaHymIoxHtYjyNErtWyEwS5AGR6hPk6VRauCPJQ9hUnPkUpSinfpsAZ9YtLz9Jk2npvsTBHnHiT7hCDcWQNhLHiwJQbAvHX1llqP4DfmdIrwPi7qhJmZUBrU1DlIVP2/IhRLmBhFjwLNmWgCpS5d9YsT3cA7AXaLutI/TUgW5ravXGvgtffDbur5FW7JYFiGPXFziUz/NwA9V1zhogPXqzTepAMC1YI1LJNVV6UtLXRHPbYqb/j3PV4eGC2Au5qSdrFrZ7teJ5aDqMqPtV52YIBicsr9XVCxLyKs61IdfvRiaSrnpNJ/50kt2lLpnKQ+yOu0FDnyyBlpuJPkT/A0wzDdFdR9fA9DrhqQrHle14wABZ5vVCIJ11J0YPRh4PJmygBxjU8foK5JahJeaEphQsTSHnQLOr5NDCg+96mu2sNipw+N7Ug9K6yThED5MunVcQDMt8itme6OGWbtMZ2dIuHH1EKorNyZgD37oppU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(451199021)(44832011)(66476007)(66946007)(66556008)(6916009)(316002)(41300700001)(8676002)(2906002)(4744005)(8936002)(5660300002)(6666004)(6486002)(52116002)(478600001)(26005)(6506007)(1076003)(186003)(83380400001)(6512007)(36756003)(2616005)(86362001)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VK3YagwK/hU6z6Y2FZ7pyg45wibA1X6fSnlsLym1RRluo/WvnPEFd/K5YYpJ?=
 =?us-ascii?Q?ZcKuuZOvW+lOpQMg6dO7gUfIaoowGNORIxoI5f9HI9ydcyKmqLUsIBjpbwLd?=
 =?us-ascii?Q?EvHk7Tb+mL83SAH8q1S9FUcXPj/idylSeHR4dTe2veY0/MYm/YwXjkEk1qoy?=
 =?us-ascii?Q?UNW6vuoDxyE8DLiKV2TuVR7VD5Ox/kW16d4k9tUhIflR0utoELngZUpL6uOR?=
 =?us-ascii?Q?v0MKSdyR6HB6FtWI2U4c7WkYkm3DbKjm8QZDAYlAGEg5Gmc0kfLjQ3LrTGMc?=
 =?us-ascii?Q?50yzfl0II2snCmT90EDDwNH8NffNHU+gFgm2L5oEQreECMWSZbfE85JFCN26?=
 =?us-ascii?Q?+is+YxHnpunyzT4xbgZL4hsKtNvoVv8RJXaaItR/Grj6xAIJHyvLFbJUn87k?=
 =?us-ascii?Q?SyuVkmYsJBMP/ruVDd0EwMh+uvbyZfrtX01iMWKcyuCOIx/mDVEUGHf2wy4e?=
 =?us-ascii?Q?eqk4DqTn2Z71q5Uo9AfE/24EadwIQcXAru/MfmzSwsw+s/toLU/79CqilLZ3?=
 =?us-ascii?Q?S1lyItC5gsmk4j/mc0wm7OnryxJprIqIpQleXJ/ScLGeUe1OaSN+2+6Ar9UH?=
 =?us-ascii?Q?/oiHDCgbx16xIYkP/jFYFPvd/+PEfzRwxNDSqTOh/5Oz1EtapbnzuM4ZmHW1?=
 =?us-ascii?Q?Zc5gqgtZ7ZbPWxD1LqBQ9SlU8efkqg2SSmkyDjg+puzHSa0NhFFrmsp4BoBa?=
 =?us-ascii?Q?yZykDlolZ6odqgEbkI5ugdjHz2GXAFD8aGWVoSmAyUrrz3YYK80XNSArUKSg?=
 =?us-ascii?Q?QUWp+1TUdOAiBlg3p1hLCWYXrJdCcn87umBNfAIKpeLusdC9FGJztorpRH2o?=
 =?us-ascii?Q?vE6zYAg9APdwTnkBT4+QRlSvoxMTYefT4LUCbGip5uWxBOEN9Izid72MZgze?=
 =?us-ascii?Q?teoSvm5wsBz0lGjMaIG67dF1AJOUSPotiqo1Yc4+7lOUKcUkOFLE0b9kEovU?=
 =?us-ascii?Q?nLBoJpaZ1owhv+fl1LMyahTLLH92qjum6q65U8tkU6avBKcFjDbHBT9pjlom?=
 =?us-ascii?Q?bzPXHfIhScikqUWk1aLBC/DujIEPM+ldiadnCJAOCnne2cUz1vPuRMZKEwyz?=
 =?us-ascii?Q?3YkNQelIgyDvEECvfuC9+YII5FdbdH9+NHv6NLZ/SzAhtOW+J6GL0uVqH+Bq?=
 =?us-ascii?Q?G735ZsLXQQsFaT6IO7r4U4FUOYU3/O6q6V7UkerxD3Iq4Ppzck4IyK9zwz5N?=
 =?us-ascii?Q?/sHHr80PZqWBew6us+BewXZndcwhYV/9leqaVhKOT2Y+6pSOMkjZWZ/dOMGD?=
 =?us-ascii?Q?s67qc+cg7mf4eS/a/ODqgPgWe3EcI4asKgjcSYJB8nPxePxQQ5fy90laPDq4?=
 =?us-ascii?Q?ACLzl/9N+EzearkjVj5f3vMhnupBuCesz3mcntLwYS6NL1PMnF/wPMNyV9RD?=
 =?us-ascii?Q?P9AkmnPfzV5AipZLjWSuW2NkHWPOtYxp+fbe4RE/ICZC4Cv9ebKI/sAfcA2y?=
 =?us-ascii?Q?LHhBFUZHGj+wxguYJjrGFZNMmltapC5nsNoCG4WXCmqF+XujWQpGrC3ZXiE/?=
 =?us-ascii?Q?Oi7ydOiWy+RHlEFD/CASLnghbvaZuKEfUEVt/bDrURh3wTVePcmIy/1Sd6gi?=
 =?us-ascii?Q?v+LoNV8hbInrT5Qa12s8EUa3rUm5UfUkO9tUdCkkOw6xBtlpj67SsnNiUVnB?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf7cd97-4737-402c-688f-08db634d016d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:37:39.2318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hcsd/1lSpGoSdSk7+h2kRqxgx7we08CWm+p+LVRacqRtU5nWM6B4J30D5Vs2eMu6HGQfC6LkzUPf4m3PHbRzHUuJetVZx8mMd73Ckpz3s0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
X-Proofpoint-GUID: BxYDsSjLevIOg_FjzjUdZeFboqJd2o23
X-Proofpoint-ORIG-GUID: BxYDsSjLevIOg_FjzjUdZeFboqJd2o23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_06,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=545
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 09:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182296

From: Khem Raj <raj.khem@gmail.com>

Fixes
go: ELF binary /usr/lib/go/pkg/tool/linux_arm64/pprof has relocations in .text
go: ELF binary /usr/lib/go/bin/go has relocations in .text [textrel]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a27d39aebd5966ffffb57c20518381cb06ba8373)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/go_1.20.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go_1.20.4.bb b/meta/recipes-devtools/go/go_1.20.4.bb
index 587ee55944..46f5fbc6be 100644
--- a/meta/recipes-devtools/go/go_1.20.4.bb
+++ b/meta/recipes-devtools/go/go_1.20.4.bb
@@ -3,7 +3,7 @@ require go-target.inc
 
 inherit linuxloader
 
-CGO_LDFLAGS:append:mips = " -no-pie"
+CGO_LDFLAGS:append = " -no-pie"
 
 export GO_LDSO = "${@get_linuxloader(d)}"
 export CC_FOR_TARGET = "gcc"
-- 
2.40.0


