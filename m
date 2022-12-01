Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29A8C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 16:18:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.48392.1669911533047947072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 08:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=le0AWb3M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93341eace2=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1Dgi47032651
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Dec 2022 16:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0VU9rVh3B4MumcqgJSClBxDsOeHZyW8e9PBsVGyYp6w=;
 b=le0AWb3M9md5nIqPkSUADM3cyWonsvABUrOLVohQCwCV/OvRwQjpKoCtt9o7oRnYSJsX
 iZ/E89BZc7OElgvjtxR0f/EngtHHUNO3VH44bCsYFmJbU94kiwkY3TekhN4IA7289c2F
 QL2D2ALWh0Z4lQyyC1Cp2NyUQy46sp+ZahBQPUHte48/U5EXTZ8XIzPOOtXjBhtQZV3o
 VLyD5CZ3ZID9e4RAjHR23NB2elYo67C1yS1SkP416TNoPJNM6eoWjOfII3rvGqaxgep9
 RICWnp2OOABGZbaSLV01drV7uFOBSpW+9+OKSxj+KyhJbMtap3rGrfAZCFXM6+3ftxyL 3A== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m39sbvhd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 16:18:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOYfHsYHFEvaLFpz/B4hq3Q57R7orcVUN7tvu0qeVxD5ZvYi7kKUCtdgmp9fULeDrPua5xH8Nxe9b8Wmjxg9qZ8reMYB2Aku5SvBcnyRI4s/ImUYiOlIs3OrT6iZnMl+J/uh1vtn41tvmY/MoIxQRgylxxs+enmOGHr+LKIUx3/aUbz42oaQJQjONM9ijawRw3cDGfvIK0uW/bXzxnRKYW5h6vUJML95hl4mSSJUG1j9jexLbLKgTcNDGRMXvGKpk0AgPH6YzK22QyWl13i3GV/RLSbDlXV3+mjZJwwpDZVNeLVgaC3MipVHH+WFEB7sJcitCtlyMLfQq/d/McUfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VU9rVh3B4MumcqgJSClBxDsOeHZyW8e9PBsVGyYp6w=;
 b=GMCllMg1aKzDPMyMSS8KwtUcY29IWQYivUbQy48xcN+eZ343L7qvoPG/bw1oMkkvGL/bWytnGGV2Le51rigA0+YNdIA7Tdu5V6UKlhh9zFWuG36M1b8KON9UElyD1Y9brnc/kTE7SOAE+Zhm/XZ6p5hqLyfcXknVo0EXls22ajqUEkwXnlkMgMtiMQVBLlgp+N8LmKXUk704yJ8TYkpLkyqCJw4rFjNn6lbHYmOGb6QeqxxuF+6ICYI1WuIQdL60E1iDW0ihXbW1OpQAYCCgyYxe4z36AK45e0bRInLvXKmVH5kIx1Nft5ATxXvc8kmtEX3gZ1oxV/FrSfAMXizvoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 16:18:49 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 16:18:49 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [master][PATCH] vim: upgrade 9.0.0820 -> 9.0.0947
Date: Thu,  1 Dec 2022 11:18:35 -0500
Message-Id: <20221201161835.3496509-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::25) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|DS0PR11MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bfb2b83-8fc3-46b3-d7bb-08dad3b7b98f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vQ8PvLQIar41J0jD+CASIELLM2tNW7YmvRRwOtSMH0I65xlfwCZex5cAdwBppEE5PDgrDsV0TX6u7UIzKxhw2SmKjbmrdTJbALebNC09EwYZOEv68TFKyAnALq0x2GyiwyivtRhu+VJacgzWjPk+qCXogODM5yap2LghGA9P8b1jw3jO2LH17Iq19sA3MJSLSpjSI80VylChmbUn0PgrifkW1qVOxXalsUT5nOa7v/6NfqOirT7+bOt1Te3ueWzCOl3/7T+s7JyKoGdT/Atw/jjI/1Dc3wQ7zwCfq7QP3TiwBx4f744nHSYOqtjeCOfI9txz2McIbXDBphGO0CPrBLEqEq7NJzivdmKdtwU8W7MZ5Izm3GMlhKIY8uSOwH3bRcDLd67m9IMI1fXFeSk/MyWTidRTl8Z34Dn7QpDqsXNFFAKHg3oOSpTF1fwJjZ5k2QlifjUJ2HfLNWHk941V2893SZV0CSkkZVrmSnJK8zj2nZap5OwDASy2/FsUH5QyCE7F7mi/hPqGDwiuofb5TYciHiX4nwwxXPRMxe1RKrlZsaKbZFVpAaQDNj6BVrKde64PkLag+I5rj4ZE78l/GlY2LYfC9V7+X4AnexPpoCjwTAZLmI40VDTD2BPgKPn5oRSKL3/jnngvLXJs32xU302qD/z2ffOQ3TtEqPLs3Vgx09oyLRnd4yd/1w0fEOKmj+9rn5GxWbJI1AMMLeLACANvqxAufqWsvkBZrmHjP22r1XfcYosuJRBC661TytVen/opAPidkhgKskR8hvFafA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(39850400004)(346002)(376002)(451199015)(6916009)(316002)(38100700002)(66476007)(38350700002)(66556008)(8676002)(66946007)(4326008)(52116002)(41300700001)(107886003)(1076003)(2616005)(966005)(6512007)(8936002)(26005)(186003)(4744005)(5660300002)(36756003)(6506007)(478600001)(6486002)(44832011)(2906002)(86362001)(6666004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aiGYIEbsfzj8isRISQ2OmeyK4K8edt1dWEQot6qdzUV3xd1nttmqhfqh4vqU?=
 =?us-ascii?Q?dS32B7O4mTb18OSaRU9h71IYhKN/SgTk84vBs4kWTcpXVpxVUe3H18bKuvQ6?=
 =?us-ascii?Q?9L6FGp+mC6piVtXGZGj2dqLLhHSRHMZuyJIOJN+i/2fuohlmOdvJdbRMl3pB?=
 =?us-ascii?Q?Sz6Mq+3J722abuUVTYHjb2fOnKmW2bRWgABsuJ1DPyKQxRVceEYTYMUM2osx?=
 =?us-ascii?Q?6oA1PbiouyyTtBLW1xXOPAcwhB4AAjXlJRG+v81CzrZVZfqSSD0l3/7X4G9y?=
 =?us-ascii?Q?AoYKHSHdR9n+I8/IT/k+nxPMgS0HjmW4bzehcjJWRaL+lrmZxpvfgoHw+LBO?=
 =?us-ascii?Q?HOXelWvYRwNJVCJ4ki34WZ967KikJc4NKfT3IaUJbd/W+y67SpGC79C4xL7J?=
 =?us-ascii?Q?NQoPo1UDz/zrLtp/JoV6Hpo9UFG5udnazkETBjQnSJyVfXRkP5QP0/EE4K76?=
 =?us-ascii?Q?kr75QdXw5nKDnXjT8vG7A4CzUUn5v6iVHFlbQLpCD4y6YA5l96rECk1HM8ME?=
 =?us-ascii?Q?GVrpfhm6HwBGktgchD/nNjO/LJQ5BKdsjrPyMA0iH+58+OKHChkVZZPFEi2O?=
 =?us-ascii?Q?t2S9OK9QJznbdCv90YqYeBQSwgwPdfLX0hDhfXmM19KHid2l/O3cSPBNy8L9?=
 =?us-ascii?Q?cOTEe5yA6bxc4lvGZWIXAXSU/dQnOAEQ/MPMuIFhtqCyM5Yh+G78g9FGz0yB?=
 =?us-ascii?Q?gB+DczddHPDJuS5a6p3QXSMun8k0GcFkqPClI/QjKbH+OgyGvH5K4qT1c7kR?=
 =?us-ascii?Q?sBq2BEyYJ/TTqsRbuByahexMP7V+bOzdPUFZWBeyJb4Q6u9EVz8D//gE4nxX?=
 =?us-ascii?Q?ZbNxDBcNVoBhYDGujsU/SWBI7UOTNaTYE3sl07veG2J3W6uSz5ZrNbJRsfEX?=
 =?us-ascii?Q?6aTDblwsQa1b22R8si72JKCClsSZEEhAJF1SSYsW3piALqK/9+FCa0wcIXhD?=
 =?us-ascii?Q?U3rnU4yriwJLqF/il0YbBbdsrgR9NNqZPnny4iMf/gKNsHjFtalBng+20o52?=
 =?us-ascii?Q?9e0HGaNE228PALL/b6Q9Ca1Pz1XZ9f0L2KSCgOHHp068/jTTZ//Kf/CEL+4c?=
 =?us-ascii?Q?AqAlDSilAFZFMUYnZW46pPPHz2fH4suie2xZIEykSlHwZZfDWl5WYfy/e++Q?=
 =?us-ascii?Q?8/jAdwx4WhGFeO2j+trgG3tSSJ6ec/2k+TeBPCqFrFD+nu+XeNhH9K8WdKX8?=
 =?us-ascii?Q?RHL0ZEjKNogopy+H6YWmnDePHI+T7sr4iPICZOL2Uk154qLICcJPaaS2vttY?=
 =?us-ascii?Q?SfyS1uPqUJbdGsEPH1PV19/Fpq4z8Enc/+8lGeuw3RnNuMzJF3tMSOmirzKt?=
 =?us-ascii?Q?BvYxs2IT9N1DNxKMMhXaORL9yMz5tVu3nS3ea658xzUHEDElqAESQumEvG3s?=
 =?us-ascii?Q?mSpwOD5xpgM3te98TxNAvHTXKijgpM9AgI1zi0klpW1SYCXWmXHOB3y2H6S+?=
 =?us-ascii?Q?co9AtrKynCeD6zwQm1i330E2B4Zuq3/HF/FS0cpTmW3J+NJ7Jpja1XWW/jAS?=
 =?us-ascii?Q?tu9bcZ32dLh4cxaLSUTpNKyo+ecNYLFFbyHNle32UnzMEu7GrUIjkForOAHx?=
 =?us-ascii?Q?7R0T6wB3HpkIgS9IhMdaJLgRCwQ0iW4tpdZwZySzm/S0G7Yb4Mde0SEY20Jy?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfb2b83-8fc3-46b3-d7bb-08dad3b7b98f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 16:18:49.2200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CaoOjy4bcc1A7ZpJLQ6KOZorS1TsNFL2Tu9sbwjuOlRcYbTtJ4gi6GybqZijuWNbpWGv1LeUR27LiYn29ErSwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557
X-Proofpoint-GUID: otRLUNQrGSXrW79dPrXxGBnTUoDP_CFl
X-Proofpoint-ORIG-GUID: otRLUNQrGSXrW79dPrXxGBnTUoDP_CFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_11,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=460 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212010120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 16:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174198

Includes fixes for CVE-2022-4141
https://nvd.nist.gov/vuln/detail/CVE-2022-4141

For a short list of important changes, see:
https://www.arp242.net/vimlog/

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 298a111853..d86841efaa 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0820"
-SRCREV = "03d6e6f42b0deeb02d52c8a48c14abe431370c1c"
+PV .= ".0947"
+SRCREV = "cc762a48d42b579fb7bdec2c614636b830342dd5"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.33.0


