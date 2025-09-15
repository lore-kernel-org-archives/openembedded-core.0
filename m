Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813DCCAC598
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 10:28:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.29285.1757932102449565918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 03:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ErAt7l0b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13533b6b07=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F9jZu23702943
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 03:28:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=YIUkL0k0V
	2zFEBXYqvnSLbijmqorl2OpiunLqllwtLg=; b=ErAt7l0bKL8AS/0BBSkt7cq/o
	lAtOi4w95/QNQjXDSBCPVvBuU6Q0jWRgdpMUqRKzhmcpafmz5sLCqXt+x6lOZyr/
	S3jEcggTNj4kAd2cVXzIb5X/aZfS5UfsSOPuRYay3WbSQUn69+dCfurROvcWKv03
	dXSaxDkChO75xN/GBIuqVWf8n1FMW7+ieJ/fMOqBhfT/zTsu0OzdlgZqGMLN0ltv
	9EqdRDYBg+KaIgmMM3D0SO7nWyYwHNFXWcir7ul56MxyZS3r8kRiRxtn7Ae6q22G
	Eqqc8L5BLAddUIKd9HqlQxXYrgOgA0GUx9j++KwDo+MKDmSUyoBx/FeZgEORw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49584hhj6d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 03:28:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuGbqv/S+fjn/Y5sycdrVpi77IyVUr2aWDqbHnAATueWRjDnWvTUuCJpUafRuqi8U7lAVTBhAtMHTD+dgS2/ZrSzkEmPCRzCX+5sikHenvh4bqSoOZ7xJMvkfKf4uljf75hqsIF894sKPyrFlatMg0crjV9bMKfcLhQKEymKvbGWmBzw9H2MzBl00TDjko0Swg1q204SnUPX89mm/qFB50M6tlVTs1h9sxskfP/ZlMkPvTydSrOE/Dst1Z4VAl6tSOhlw2zruHI60gLdfSDCZhT29KZTBhZaJbZpw+vJ3+ogL/wxErwS1wvFAp+mfuDKbibasv3xse8QmbWyY0U/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIUkL0k0V2zFEBXYqvnSLbijmqorl2OpiunLqllwtLg=;
 b=w11Urm1dN3iBQXvdP5cNSP+NdXOf2TLqA0E4vIZqp40qKnbS7ZH9UEwa/SPPJpjwHyLjHd+F37WMH3b1fhsmJicr53VnXGxEHxHGIq9M1WaLIg1miu6a4FWFTtDSr1QgIYgCDWOhFZN2dPjrGFd4zjQarh2MlJIl2QOQPjUzM/ITGeakSLgqnHMA+LqMWEgqHhPVY0AqtWjhECAqqeE0VHR8EFjIfiMZCa2fe07z8tw1WUYUB4I7Wp6rw6PeVDjqQMoLFrxy0bfJRJBu37jffmAtuVYjTZP1X5VjCcwfoSDLjOFZCab9y7sOP91BJpgQ6uUWywJ1ccoBwQ3Q2zDfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 10:28:19 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 10:28:19 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 1/5] Revert "rust: remove redundant cargo config file"
Date: Mon, 15 Sep 2025 03:27:46 -0700
Message-ID: <20250915102750.3298492-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f7d25c-d6b5-41f3-ae9f-08ddf442967c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jCp1RWn2V3UgG2e2uLghze3s7Q9RYOzcPQQnsi1DIV01KgV8gbWq4fkZjS/I?=
 =?us-ascii?Q?Q28czbccKOsSaP2ZKNr3I7hSMop659raQzsz4asuw5mv83FM3BuaSKv9w+GQ?=
 =?us-ascii?Q?Ao4yIhNXf3trI9fT9DmH8llEhp9jN6YzLOjMl7kiFFNKBjGcmqQZ1fcxWnhA?=
 =?us-ascii?Q?mGW37pmVd2U04ZP4zA54YiHsI2aIHwKMfSbyopqLPwqJVU2GmvNNKZlTSGuE?=
 =?us-ascii?Q?SYfMRx/w06+0qqQ0A8BmT/mDEzCf2lj54jrb0Xy3RiEBSfbrLrNBoLRNuehi?=
 =?us-ascii?Q?SR/ZSkydzmzGzWSezHA2tn72s0E8bKpb2rwFp1yOjGCV3jVyvAO5ui2HvESs?=
 =?us-ascii?Q?0cQSB5Fzk2k8lP/Z5rQvu/9+4YfQV/lnYExzSAsT3nQwV21DrvH6OiRXRRTm?=
 =?us-ascii?Q?x1ZYwd+qBKe6T6vt9xSfBGSZBX22+C0MhZyZ+TJmtKM3SRLdiDixhQFpeadY?=
 =?us-ascii?Q?jGpd/Wf7ZRvGXAoQ9wXDRnRSSM/jV3F4SAt+4edFEkwRf6IcZKAA3kJB2J86?=
 =?us-ascii?Q?HfljCs/4dcoDQ7OYELzgZfot5rWsibh82ZGtZ+BDi+6MFgNeBucsQx8bwH0F?=
 =?us-ascii?Q?VLBLWDy0ACCJBm3bahGBVVabNiFNJdeCWx3KsvMLMm0Mi7bOFBlo6iAPe6FA?=
 =?us-ascii?Q?yX++t0mt+r7azVZS+F/W1k9nqmtsG438jg4V8HBYWACvz9rwUaHcNqmJ5EhP?=
 =?us-ascii?Q?SO/kwDvpmdiLseixjPyJCXqlA9pYmVPUSAdicWkUBHcKpfqRwLsV8O53i+B9?=
 =?us-ascii?Q?EMy+yPyRp4ES7hblXoUiL+AcHj2BVBo63i2qEmsq+9tP2SF4jWVWuaj84+Ci?=
 =?us-ascii?Q?8PffVu9N9lxBPnKYBWKiWjJgCdSmpIooZAV58VS+y/LU95/x87mfNYhIMN0j?=
 =?us-ascii?Q?LmaKUKf87bE6epA/8WVe0rOFT6KXDZ4uuIR5ryOGs+nTs6hNMY0vIZiX12pY?=
 =?us-ascii?Q?01M9Lt3Kdz9OIhyz6mQ4zDk1VraPDW9wIsnMCths41YxlXJq1GlOAi9yVRXh?=
 =?us-ascii?Q?ugMlFIyxQPA1lecO4U90v+v1zwXalZUm7UMufKCU+wJPqhYgjvqrtEY2YOKk?=
 =?us-ascii?Q?kSF+8bacpf5cAB5R2J9Gq6oF3bKaU+V0dC99L+5Kf1eXzyDJcuwIJEq9nmsq?=
 =?us-ascii?Q?6mXY7Hc3ShTES1MUSmsvPba2iIrsmDBR3pIAwADrNqCb59p0gHiYkJob5fXn?=
 =?us-ascii?Q?OD4Ci4VL66e4JDSqY98VtAl+p9964e+qWtkMwyKQ5BjOlixFHvnHxUeD+bT7?=
 =?us-ascii?Q?iKubkFA/Q2+blADiog2F2M0qvL/HNdchPi9t5KlU36TZZBF/uz66gQHJFtFl?=
 =?us-ascii?Q?4xoKU3y4y5Lyf/OBJ8fhJMZJ4yy5jZOFqYDGOOACccZHTOIJ9ew763ySnsF9?=
 =?us-ascii?Q?+BdC/yDB3BZqhn0T7TC5zTqiJKZp67/2Ri7qQEG6c+hVZUlm16jKqTqbG9SW?=
 =?us-ascii?Q?5olPVZkfXj5q7L0IKmFkPSZIuvrq7b6e62m+po21JURConD8BE9c3Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4fzj6A86vHdq0HjzgOYecyZYELREYz2LCHTgGGP8zlxg7oRDk3GKNU+q6NUF?=
 =?us-ascii?Q?+wVU1alFI1ZOnR6TmaW1Pj7J1akx1wAg0CmjTkAP4GBuxSb/eBsPbidu5xGG?=
 =?us-ascii?Q?p4QbNrXPwth7Kk1S6IynfSyRB1QI5MGTioC7H2ezqBfslxyeEJL07ZJ63oqR?=
 =?us-ascii?Q?Ic9gkQ7zBHaW/X+Lp7arIaqS2qH2GPbX+uY6nl68v/h5lIAPQm6JbytnvBCR?=
 =?us-ascii?Q?N4RuZXTII9EpSLn6EVEEPGkO/VVy+A/YXBgANC8iNnL05rZhpHgpg0AxOyx7?=
 =?us-ascii?Q?DUQ9kRSXcuwY1hQBqBqEeOyslabB+zJHL69km2ZyYxcDCw/zzNhHG1Cj4Mh9?=
 =?us-ascii?Q?5UoTSkRV5F65SSUMK52SA6W+2RIPgCq0GeNp1qNmDGsCgNYkjUbLrzJKUMGG?=
 =?us-ascii?Q?outpXdqCIDDRQbrwhLv0ZDKQyb4Lvyf7P7AXyWifQ3DH3yX+xOCJrRXZs1rS?=
 =?us-ascii?Q?gTzbuxxaSW7SX1vzFcDjRbxVWOgSDPmkCvvCuEmSAPEAH2QDvkh/H3wd4wWa?=
 =?us-ascii?Q?wf6phug0/G1ZSIwoTAn6IAeRNSyvEt39cps1CSDiRwPowRFkfjBwRn32UsPv?=
 =?us-ascii?Q?syt702v8VOUBP5PBiF2CE6z/3kU0EWSs+v2hSju3zPaZ3PWXesMMtEKGqcZE?=
 =?us-ascii?Q?6oakaVj2znAArzsNLmtQYyo9ml647wZixs0sxIiSrWOV0GI19fRipr1GUko/?=
 =?us-ascii?Q?/iWD0b1v98vYb3GTcGbzNgcg7Q1gT62FIj7ClH5wQ0xlKSBHO8MFTGPK9J32?=
 =?us-ascii?Q?NuoAJME6ujYqGIodSWHhET6O5LUfG4aXMrKBkEJAtYJDQllXrcUrtgg9JS6i?=
 =?us-ascii?Q?ZcH7GjF5sS2Pckn6smAEakytU25fBJz3b9xiuCOH+pHT9Clgqeh32q02z7ru?=
 =?us-ascii?Q?NMpA9w5whWesPqEeqW14bl32cXcLJg15x6tpEppHrk5whrKFBbHXtXKAi6NU?=
 =?us-ascii?Q?IPzIepE2LMYOfahUs/dKPH8Z/5DxD5RZh+1/1jGjTENUm2RWEWM+j01B4uuS?=
 =?us-ascii?Q?t0kuONpj6Lw7pivxNXKS9QWUj3e9cAUyAOaU9dYEjz9HDPVNQaH7sQgVGknk?=
 =?us-ascii?Q?xBLCddxq+e4OfHH2OSg4WuTt7HtHPYnOnLVXqxupf4dQo6dUmEeWPnTcuSJH?=
 =?us-ascii?Q?e4A5mxiixCD4cL9uqu3HwlhxRosoEq+1QnvX/DyAkZqfJI3PMG6WQUDa5/vT?=
 =?us-ascii?Q?hFj9RoT1+2865H6YqGY+WF89PQeRZZVlK+f5yPGO/wexPUpAE3TlAVfSPgNF?=
 =?us-ascii?Q?y/WlraBdbEpAnlMsx3titbf+K4nxRpMQWKujl7tT8WXSJRJ/VWKHp2LMO4CW?=
 =?us-ascii?Q?A+XLoE8bexjzpLm0uCSn9EgvD6q06a3nOWN8I78AWRVuI2NCSp52JMYu9Pqr?=
 =?us-ascii?Q?qz9OhlQ1V4QBQuANA3zzEhWTYWRa3ohpkdAW5aCa4eqJCdEmh7K9hQ/iH4Is?=
 =?us-ascii?Q?h+Bl9VCUr+qrqZmZQZhEZGkC7RDwB5EneFlKfbWZTlYVXlC7HaX+FRF5BOte?=
 =?us-ascii?Q?1JNbJVXEcu8xE0QUtMXO903rqo5dE8gpIxFZlbxULpv4FWD/kRiEgvTn+Lnc?=
 =?us-ascii?Q?8YtCTXuRlDY6owey1+SGTzc+E/PljhUNdlKUPlFs3EVzPgRIN1UOkJh8aRxC?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f7d25c-d6b5-41f3-ae9f-08ddf442967c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 10:28:19.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgV6r5GR4uKZwiGh0coppUbglpiJOSb+6rV9kNpQzBMzArTttq+dzaDIRawhnBBzZ3OszXl9wGUSkHvmwbOS3k9H7UWGeOq1Sy7FEXzxdhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-Authority-Analysis: v=2.4 cv=Pbj/hjhd c=1 sm=1 tr=0 ts=68c7ea46 cx=c_pps
 a=H8CAifLk0DAaaH9V+JapoA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=nZTMiEG4cM8ErhhU3NkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5NyBTYWx0ZWRfX95jCG6d/VSLo
 XGOlwBy5cWLqfgyH4kIpG/JZyITpLVJ6TjqF/ynsMKZCOO6bai1W7bLCxkJxHDo5zop4XRNM7xX
 Dr2lyP97EazbhwvXH8Dgg5A6gMXDEruonNM8HX9iRS0q6NmZIBzWybyuHnXBx8Njm/AOP5cRt6x
 XSc2LgOZBplBA7n9JozBm2W15WtAKcTR0dKckUhF/Uc7qzL3Jhwxw1NcnyKSNtYiOvGRpZmcpA7
 KdAd878zg7KwrCbXkqa1AlEYHwPCwtZfLmxEWlZEqJzBGKVZmOPNCglFcVgDcXNGp3qijUPWVj4
 CFZjFjQ9AusugB3mTuo/Zpaf2CNXwP2o02ZWRdcPW3gDik/9TLr7YJeb/T3Y94=
X-Proofpoint-GUID: Qqw3HEsl3G6wjuuExvyn-sqw8dhsc2iM
X-Proofpoint-ORIG-GUID: Qqw3HEsl3G6wjuuExvyn-sqw8dhsc2iM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 10:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223398

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The 'cargo build' is supposed to build binary for the target but it is
building for Host.
Reverting below commit to make 'cargo build' to built for target as
default in sdk
commit# 37fea972a6fafe360bfbb2d1ac472fa9e060c733.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index df8b78d326..fcfd178f34 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -64,6 +64,20 @@ do_install () {
 
     chown -R root.root ${D}
 
+    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
+	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
+	mkdir -p "\$CARGO_HOME"
+        # Init the default target once, it might be otherwise user modified.
+	if [ ! -f "\$CARGO_HOME/config" ]; then
+		touch "\$CARGO_HOME/config"
+		echo "[build]" >> "\$CARGO_HOME/config"
+		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
+		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
+		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
+		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
+    fi
+	EOF
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.49.0


