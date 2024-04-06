Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79134CD1292
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 04:42:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5340.1712378518184436538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Apr 2024 21:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=h3YyEhc+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48263ef7ee=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4364fwxT028307;
	Fri, 5 Apr 2024 21:41:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=ANwjeHJzpEs9i6YqeP
	9hmfBdTEfFDQ41XD5jL1qQE9k=; b=h3YyEhc+E28XhZv2yhi9cqiyli8VRTvapz
	8yyg5SD+NPu0tkvzKkiJDQC18xZulAxUIlfu4B7f66Q4dK2vvRxH7qaDcFHYaS5V
	Ofu4Wle1CTt0WiegcySR75d6T+BMyU2Cdzdb52zxKp4j/vupM2i7zBxnZ8cdjI4Q
	zoQ1tE0pD02s5bodxNJWDzqUkMQPTQK4smzb8yPU5njIUZ3G8GlyppzhRarWVhQL
	dgs3g1vYnMhOJQ/IQr2HuheeCwrwdgSDukT9MNK9lOo1cHJ1n1lSbzNTDA6uWPvq
	bDwgC8PdL1cP/WxekQ22y4g3XeXep16nbI4TUrwVgV5i4tTTy6sw==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x9en9a9d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 21:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHDohLeoAYeHwIzyyycPz3iFABH7lR2kkrP+sqNge19S33o4vJeXKL/eQpGJsDWBx7T5DsjWTe4uP5G8aKagwFAbgpEPLHjbNshNPGHCYMd1CBwZhY/h/ZwPYlaq70I+cqQ8kPqucd7uDPH4pkh42DD69XZgkA0pzv8AecdEdbHbBvlbs4aKAolTZBKWQ5kXueL93RHtCq4O3HM2uXZPLxmo8J4mxw3y0c8C81bDnOHcyxFGiQwU+IPsKygiq1uyA30J3lNWzR3d5BGTbzKMtAR4v5ctU+PKVhDm5qokA3RpBmqfb5hQFGu+agYH4MiuCoG8ue0sqPA2BrqntcnqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANwjeHJzpEs9i6YqeP9hmfBdTEfFDQ41XD5jL1qQE9k=;
 b=mnevwr2EahO7q1lNbWE78L/lpjYruCbOd9Z7o34h7LDY9UhbSqqk21d653gcNW9XatVCvuoTpaBwOhsyuomXY6fbPhcOZSDK7Duopwkx8z5wT4Kob0niPmT66u5aYn4XtGLz3Egn9gUOF05Plf5fgPzjZr9WxGJfQesg0fFaiC7mmsd8J6RQ0+y+4TfeJk2ZsKzD3QwR3IHIJ5AILRdKALQRUzdNW9Ddkw+jHtRgo8shkGqT/HUjYMoESa+kFo8MBigD2ZeTRQuxRDUxyU1ZetqKxuYAO6Qq6osw5fRrmHf6gmDgMIi2bekNw7BKfILO0MFnCl9KuVGFro5mZ9a/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Sat, 6 Apr
 2024 04:41:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%5]) with mapi id 15.20.7452.019; Sat, 6 Apr 2024
 04:41:49 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 1/2] ovmf: set CVE_PRODUCT and CVE_VERSION
Date: Sat,  6 Apr 2024 12:41:28 +0800
Message-Id: <20240406044129.84784-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::18)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA0PR11MB7837:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hg1V4I611g9QrB2ZYtc/Z5rmvqeOFes3igqmnVMTyBUlOabpiiW4L88Pyh2nw+IxRJUj57Sqr7/qgxW390QdzjLskjDpiXlDWyxFdQrQ3Xyiw2VSp3ROe3iBdy7GLtDXMbwWSRwaUuYQIXRdZbQckIuHUPCII3sZOwhFD1W2ZJ0Jhsxlo89X37FRCXfzW20O3FRV78SePBIGowO0kej7NmsRmk6JieQJIb1w3k+QdMRF83tQTg9BYgOekfehWHIMpYPLaUP1c2B3Ie9ZmLznMGMlo5WIe+tJOKXJzmmAUB/sbvE4oq/7JbN1xcJMcFSY3UIeZLvxkvtAgSW8zESTc2eh61Fz4Y+4/XpAYPPE2tJLpBbdbTajY9x1eGe8K6cADaMLQAshUs//tf3VSIYIY85q8aSm93xRWHou1HYKEst1RTI/nYEZADlcPOmiAVEdcFknOHnXOEs6mI3W4SCo9Cmfomv/ZpOXIpLtVzcm8gkryVd4pBzAzOtIr6T6XJUHqjK7eUYheljmtkUxyFcKHbPFJ4jKCkalMsn3vp82uVnpbbqyxsoLud92jskAYBXmSDL7MVvVI2cE5LyG6R9caIjIWjLwkyDzJnVWgJa61hIP0PE4k2qBjsQzF6/yoQkJbYW513ErUqQgLkeXWfPQyMMszxklwyhSuzC7stHeIqoyGs9M3p9aYOAsycCeb/OH4gBriTFe8XrNxnvQ5sMPsQ0wD+6/l+j58m7CFdsFwF8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EvbscgBpBnqqM8GNzgt1MZtGU0wxAo4XM6S6nVp71g6WyMAif2MR7k/VqgYP?=
 =?us-ascii?Q?SCgKc4nrpUeaaGm01tH3wkSr52ytRj7aifcugPJ2JoNPB6b/eK5NIYLjHgah?=
 =?us-ascii?Q?wClsOWZOtaURjTfDdVLcQmIbIUOfYuwPuXAbTs1zIrMYXwT4bXMe1N+GP/CO?=
 =?us-ascii?Q?CozrMuPnXpnLQcu9D13/P8wb86Q+V9RKGoF63s7dCinlQDuO+4RUuEXMchAU?=
 =?us-ascii?Q?QkBH/dSb+bHNhhde6ISmjy8HGc+2kXuHmuK3dUU+cQKFxXzTmqCvkXL7WoKG?=
 =?us-ascii?Q?jffB8C9WnjuWZ1+Q2jK0Td3UoDZOcu8VDpW3se8/MxrpEXUCBEqnN+QLIXhJ?=
 =?us-ascii?Q?5eIQhCZOYF1NV5tzux0ILxvQR4TNReBxJiHkaz8X7jVL/vxM1cl747k53sY7?=
 =?us-ascii?Q?jMIkRP9X3MusevQ8nQu7CcO7QT21HNUXDzN6uX2XUnid2VkZVaW3kFAztTNC?=
 =?us-ascii?Q?/dYc2ZW8dCUlRUUT7aT1CRWwCPd9P1f5iWbOBRN3gUetQlx1mZwP0uK/HkU5?=
 =?us-ascii?Q?aFqNythMJ/xzdJInTnm9Ef88aWtuCJcnerzZjBxOWr19yoKJXtCfVc3Wgjqz?=
 =?us-ascii?Q?O1AuzW8opqtoUUOG9UClh2sHRgZSoo6J0348aIg9iSEgRXofZPobRcaNHWPJ?=
 =?us-ascii?Q?owkVIpZGirAgUsdaGNxmGcCSLlFnV2Hx5aTQIJUe5vIVwCDcA8FE7OzmS11E?=
 =?us-ascii?Q?VPkur7JFT2UPrVmXNilrAb6ZUvz7J1+fIIa7ybNQKvnw8Whzaz0WT312Yqg4?=
 =?us-ascii?Q?LUuj0XxC2N89HfigvsPLIPByh++C1F5+7XsqakSMga0z0EVQrJ1E1UT70q36?=
 =?us-ascii?Q?ZjHc8CiManoK1iy9THMpuSrV4+TYna4FQ1tDkhq7K9QQgVffNyAMUNWHyB/L?=
 =?us-ascii?Q?6tB71wm3rVhEKn4FHKECBJ2zinQ+swWx6wJ7h97xCco5Boc5Jle9yfq3+GQI?=
 =?us-ascii?Q?n+1fSAfpGkWZ2De1pFs5m9aepBKMa0vtoMjCyl86ErlNq6B7BM29o5MvCjGW?=
 =?us-ascii?Q?KjwLTHtHe7Sbbmx+JwQRbycRfnOARTOn0lAfWlgaCTmhvOcUkW3odJXYqA9F?=
 =?us-ascii?Q?xW+UNBSvF5cI5qE679O3cM4769EOxsxdn2yib1FGpM28dPukWdk9HLnGJQyY?=
 =?us-ascii?Q?0ePY7oaoRI5u0TsvHBCwiRprjSOmtO6fF21vzW7ov+DAzlnBo/YAikuLxMsu?=
 =?us-ascii?Q?2zYc+H/xpIMfWO9MpTPe8eozmk1SlQ1hwu3Wz68lueWvHSzP9e+2oCpRnfcX?=
 =?us-ascii?Q?h9HFFHSVRvry8GkiKzgTewooxlfsX6Eb4P1jKELGROz1zAWOoMCHbTsN1wsO?=
 =?us-ascii?Q?BMvjYExjJj6aD3RsFJFBC8weSM4FpZqDQBzyq76zt8bSDEDhzFPVhrrWZaMB?=
 =?us-ascii?Q?oIrbMYf70KRIsSyzLEegIIldkzCj506bj+9U7pFUqvLejM1EvsafpT880mwO?=
 =?us-ascii?Q?+0tyHQSTMt1MOR4ix39ILrSRGuyPR93060sX/zQm7l1Zi410R4N4yw2KxQSy?=
 =?us-ascii?Q?X1b1YQFRf8ovb1Ci0GS9oRZjFFsqAe1jp1Y15U1jxqZygx2ATUc1Dm9iLLbr?=
 =?us-ascii?Q?P1rBDWtnOk+EzIvAWg8Ciqd+wA85ekc4isOUPESj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03dba721-7bfa-4779-1367-08dc55f3df49
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2024 04:41:49.7394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOiQmbLVifEUSBqEfQ80vkiy6WQ6NKeOiyakfmehUv2PlIoLQXTYN74QhWYhdVW2MMhQY42OAsQ0Cs9uPUIMEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-Proofpoint-GUID: u5l7Njwd15WqDwmxpgJ1RgsEtG-zEfnM
X-Proofpoint-ORIG-GUID: u5l7Njwd15WqDwmxpgJ1RgsEtG-zEfnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-06_02,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 mlxlogscore=848 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404060033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 04:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197989

From: Chen Qi <Qi.Chen@windriver.com>

Set CVE_PRODUCT and CVE_VERSION for ovmf. NVD uses 'edk2' and the
version should be the date only. Here's an example:
https://nvd.nist.gov/vuln/detail/CVE-2023-45232

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 3dc031d3b6..5b1353b8e8 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -30,6 +30,9 @@ PV = "edk2-stable202308"
 SRCREV = "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
+CVE_PRODUCT = "edk2"
+CVE_VERSION = "${@d.getVar('PV').split('stable')[1]}"
+
 inherit deploy
 
 PARALLEL_MAKE = ""
-- 
2.34.1


