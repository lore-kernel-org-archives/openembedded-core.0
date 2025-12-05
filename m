Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B0DD2F7CE
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 09:56:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2227.1764928566344911721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 01:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rjhWnjmT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4434e0dd29=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B55SkNT844717
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Dec 2025 09:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=6PQ4A/cpo
	eIWRiz5p3561RLYziuNd66qNcjbpkwtd+g=; b=rjhWnjmTBOhx0LhwWTmBQXMPj
	QhOLwk7n8BHNtgNFW92lLhy+ULa7OMYG+ZkDbS3wWOopeZXyYePDeYRqff+LGyMK
	eCFPP3/nT2cCzupkNkr384dQ9emGEgXzvZkpY6CUH5S+MiuxNxtc8e3SNwfUI6L6
	T6xZpMi0HCyoSnbbA8Ijp3CRMfhtl1Q/PQGrYFpJtjHgCio44lCl8dNRNzIGb3TN
	reriFh8HPr0HxWZeR2VAPHx/tp/cQrATz3JAKFJjzYDV1JHL7/rTWCSFsYggP/5b
	kYVbdFH2dJ7mCd0kb7WEU2AyslZ2PKjBwiBmBBHx4k42gw1LxOfbA9OxHViNQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012050.outbound.protection.outlook.com [40.93.195.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4audrgrup4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 09:56:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWEkXXnzDnEIWwVvYRD11Fw6iRPzGtnW/vQ4YduzfdVGGZ/5y8TEAaZIvGDokt887rdH4GzyttzInkGLhbotD8gVbKbZtXq3ymge4f3DgN2wzxGEpyTWrazRfSgzu7hKvEJO5SThRsbVo8IWJqAVSySCzDInWQRbMCIL8TuuPaoPIxL5lgcif5Dl/HBl+zb4omgwkS6GyPRU+xz20exeSTN4dgWouTDaXRGMKnlLfeD4QtwswWSLX9CzDjMtEPlDEr7BjfcwpboBKbdz9HYqpyjxF7EniLkUFFmXMIlxmyGDSpDtBgEARVMdmCsB+1spgnG3fpSNaSk29npLjCju5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PQ4A/cpoeIWRiz5p3561RLYziuNd66qNcjbpkwtd+g=;
 b=JYYe7qp6eCnUIg9e1aozEkyJzhb3ZbWlq98r1YwuvKNR6Krg0mizz8fmyaYAGbHXMyT4jVtGgutPiwB3+zEZ2S8Ti2s4XHTwxOrzzLaQ9vZWOH9k1gK7+fDNlQYG56f37j4nsFDhuODqs9d9459OOUGq17Phsa3Nvd/ooaW/TbqsqpYJ6UlwlGEyL2806uih06popnYs5fihwYoWehVgPNBhc45F2Qzh+JkwBXb/KcAdQP2RbuEXjHnxFbiFuKtPmW21Uu/gjrug0aOBrF90zz/1aHws9CMZ/oloiTr6i46wZwXtqiqwt1yeyCGhFbC6yG36ejDTUcu6G8PdoZIk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 09:56:03 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 09:56:02 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] llvm/clang: Upgrade to 21.1.7 release
Date: Fri,  5 Dec 2025 01:55:41 -0800
Message-ID: <20251205095541.1670220-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ca1740-cbf0-4e86-9df8-08de33e48006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nuOgwqMlfBz+sWQI0keD1dS/kgMaXmVX52T6bGaEEpVeyquiWtx5NGzjUioz?=
 =?us-ascii?Q?eU5VDGqub2dmC0yQ970/P+fY++DlnF3Id9YGVmKpAh7RaKrcY5yOEyU/Ms5X?=
 =?us-ascii?Q?gP6wANSfLVq+pk75xtjNPtCvrL9urofRAqevDmD2b5xoam8KCLwP+N3Iy7H+?=
 =?us-ascii?Q?dMBsQV6i3sUJOzL5BxJTIwakGb5Eb8D9GM5UN7a/YWNnuMhMbVXPYB1YaG65?=
 =?us-ascii?Q?YfvFYnXrqODqxYznm3nAZZGieoZWjGvcWvDdFwl5ESYgOqQiVwI6SL8hc9OW?=
 =?us-ascii?Q?gAlr3iXZDbbgVZUHneiFFPaFQfhwGQfeyLCtuK30WkI1/3qiNap4JxYtgzjw?=
 =?us-ascii?Q?KIV1ahLUXyUP/JV9O2C1QMKjf9TVQtNwTRBcQzPHKeVttM+tIDNwyriyCjHr?=
 =?us-ascii?Q?e+3qbGM5v3m6yPyVL0Cf8DtfIup2S7zqZjk+CYRRnMVkc3InlwHfyOlwKN3g?=
 =?us-ascii?Q?ECdCYisAlgvZ2AwydaiNEpBqNwYtzEamoGd2EnMB6E289RZzAXgmDtxzKqgX?=
 =?us-ascii?Q?OlIpdOzoOaeFyJWtl7G+sH/c8cjTk1JaD4Xws0GjT6E5LQTYRmMzJmiAlPIh?=
 =?us-ascii?Q?D4CagYNfOH71+BY3oAG5gPrjNZAGF+x4sbugVsQlzMhZGEAiE/7Rokh8g/gF?=
 =?us-ascii?Q?a4i+MEQPxn6CBtTedZSjpYkTc4n03Ldbo1N0rxktg92+zX5lQq4wUAKe2qju?=
 =?us-ascii?Q?fqaZps4KmL11wUlnl4xB+OBQZfCQVr2h7GKp0J57Ap80mRSibs5Id/7ZhLtW?=
 =?us-ascii?Q?u1wHZ3wKEouIolnjc1FdgJPCa1Cp5GxH39HtROrPl6toHzQppNBXuYhLSlkx?=
 =?us-ascii?Q?kBBWoyzu9DxIUyxG584AACi5Wq5lJVDzl4oX863+LCaBCoqf8wcYj+93bL5d?=
 =?us-ascii?Q?iYnhlrw9WqliC/UAi7sS/+U0FrtYrLDFmFbL+wefbTyoiVhrrhXwqGMZZsJh?=
 =?us-ascii?Q?JQDjJVqAIpqZXhnXnW5qXJ77oH5ZssNKiq/5ICSlWLRw5yN5CGQvVcY44f8N?=
 =?us-ascii?Q?HiRb/8b2z5jZz/eAYL5QEdxzmbfIkzXt7af4oeGjF1x3l4nxD863GRYflCtz?=
 =?us-ascii?Q?CUT9lVQ4VEUf0DPsqQjtySwdi48nXR3YBN90KJkC4C06hYRLLvmDxoDYxpzP?=
 =?us-ascii?Q?Di5WQKJKRQpMJ/fFVYMaDPHaDxQR8paSiy3d0Uiz3gHlBGYZUNmXrf5AbFXb?=
 =?us-ascii?Q?SYod65aViiPbhPeIco4SWwVMigCIeonbmwTpTLPWNJrjUiPsBvUPCu4Q+0Qv?=
 =?us-ascii?Q?KTcmUUclMrqPyW78CD1JHPlBpdlgee8r6qxhALplaIpey/OWmV6yEPJ7JKws?=
 =?us-ascii?Q?7c1UO9Bttb5JrjIWA/nLFfieFdWGfrcKfr77Ckax6B/eizdq7jy3dUpQB/fV?=
 =?us-ascii?Q?6rJz7dJdPpYhieAt3m9OquIa03b9OfUOt48Uk20DVwJfZggNgZvPJ2FHvUZ4?=
 =?us-ascii?Q?csMtPuJeC9SnyuFagIhEPmwOqhX5h5D6hIO8g5dRpwTWf9mz/E9Gy+DMrfq1?=
 =?us-ascii?Q?r8aBxOjpGMqfwOeKmiU2uIW7NKYS4pmT7kMJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eJ60/Nk5wFW49X4TctpqCUoshCrsZtQonEvBWvJUy6CvWVXqsUlgYvyk7I7k?=
 =?us-ascii?Q?ZnB6gQ5ax6viDNVdWn5mnZFoj1lCuvqquY9kwgx9PpBa0Zu0DgdvYTT0xIYo?=
 =?us-ascii?Q?rDwNjl7/cJNwRJTZ2ZEhjX3PGv5DoxL/LIq6fNN84kOIG0LABm8KyzDSSYpk?=
 =?us-ascii?Q?MlidYAEYW2nhAHfvOmeqKy83B4YTkkDgwB7zDZVdrjLhaX6ZpyvGGqbaxliu?=
 =?us-ascii?Q?VIfNUW1mloM3BcZex+fa8Ow22+A7L1wq2tEZ+5XXstmdRyzO1h1yviPvWFAf?=
 =?us-ascii?Q?EYnNQ2t43ZbRpWRAWo+xVLHjosEej1dFUx0Y+kQIkc1k0mpgdB0CjMaBnHaW?=
 =?us-ascii?Q?qVzJ2Dk0lITPX4Q9dbRaThflBtgv0WlTfK3+DWSKjs6DiUE7g8xD7GZkca3p?=
 =?us-ascii?Q?vTKQa8qYHRFHmEmbUxFifKBbXu72FstdODDj6A8lm+Td35ZMQqG7gnMSWuYa?=
 =?us-ascii?Q?6hGsN97mMLkmISAfA3oM3oTilvPfAnIVI4/b60WFuT5B904S1xvqf0EfaRN5?=
 =?us-ascii?Q?aC6K6zLY1foViaUcFwq45TBCNlM9cTnFyJVoVVYQFVHLBHEpPpdMQUDgQrJq?=
 =?us-ascii?Q?tPlGbu1LftpZsMLOXLRuqxsNG9uOZWcaLElsDxYB8w52STd3bf1BXbwXWv0Z?=
 =?us-ascii?Q?gtoPhhHi7ARw5aafDYZCGyuFRAR+1MiNSkAijI5iSSkZB+bqCM1zS9vtI2SD?=
 =?us-ascii?Q?MutW+LlMrDeH6Jdn7qsnjYscRtwAk96HzX92TZ5fYrA7Y8DufUzof+1WkpoI?=
 =?us-ascii?Q?Kbtbly/hQnQdCQzkulaSVCpEVwlCnfuJlq6sItBGIo/AhNPa+Hdc6SfTb6H1?=
 =?us-ascii?Q?lzGqxzCW3F6tO4j/s1KyJkW45rJrOCBSr0677SZpmyp4TBx3g/RiBRxH2nm9?=
 =?us-ascii?Q?k+smM6iO7VZHBj9cMeDhZ8+/JBOnD7h3N1LlC0G2cr/jk1ktiymz8xptjs5S?=
 =?us-ascii?Q?e/0UeHlrwqSQHTBtTSnwi+KrCWn95kSIfLW5cApy8p9uvX4iXT2CyTUelXR+?=
 =?us-ascii?Q?wL9R2XvdniCWqY/N8UGiHhJ4CVEwBbm6BdypV1g/WY5tI39gcjLK6AmfSN/d?=
 =?us-ascii?Q?BcEiOCRrZIOtHKonmuCpniUJKWB1v654CpiVOlGC62mE55o52lTcTBKB0fWZ?=
 =?us-ascii?Q?GTRtn7nnPTbauY39bXvZEVEuTtcPGgib2zOjlQcqlkYm6NBnbaAxeYvFCJYc?=
 =?us-ascii?Q?YsVM9X56oeHFP9O9xGOgVedbxKju9iK/sobJROzw02mZahbHGlIWfB5o40iS?=
 =?us-ascii?Q?r4pfYl/Uf7PWMPu//Y4/01gyzo1HZ3W6X7lBqnzd0WJ65DEhCczS92RrYH/I?=
 =?us-ascii?Q?OWlpb9kJ0NvR4KwDkiA9jiEModYTBaZlmDZnaC336fzSSBnwtSw6VD19Cp/N?=
 =?us-ascii?Q?iky2yxCvAT0yuEtGAyqjHC42NdGESsGHX8CGq+UykxMoLNlrSf6O9nIeet3u?=
 =?us-ascii?Q?dgDUKjgrhXLnc1/ilb7uIxAWHyuuMFTVdMzZnV0q3aUT5NQ9UaRrf4+QxmIN?=
 =?us-ascii?Q?G4GKuX2d0HHbp0oKiNyv7ng8llp27dVzHZ5aylfgl87M7dGbLsfwnJosdk0O?=
 =?us-ascii?Q?ZAEV9FVt3qzjb7ERzCs0pcL0hst++KfrUZyWrU/B52IPORh7DQLUlHVtTy3J?=
 =?us-ascii?Q?OOX7vMFD8L+ZBJn1fNj/1Rc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ca1740-cbf0-4e86-9df8-08de33e48006
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:56:02.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWG3JBuHIZL6VKwga/2bSsfZq1ZTz+AbUC4mc7D7HqzGkvt16jhq1BYJ33jh+CUmhwqc0rkIUjFGYl2TaogcSwgrfQSEy14G/dASMOUUctZMK43K8rIr1AlNAmq2+0ir
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
X-Authority-Analysis: v=2.4 cv=C+vkCAP+ c=1 sm=1 tr=0 ts=6932ac35 cx=c_pps
 a=SMA1khf41ao6nOkIv5XeTA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=RgtBZrPRgYLVPnKGxDwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jVQYBGfUhFWEgjqV5ZuWXiRjlOWZ-Vxs
X-Proofpoint-ORIG-GUID: jVQYBGfUhFWEgjqV5ZuWXiRjlOWZ-Vxs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3MiBTYWx0ZWRfX6voPdxZlZeL8
 0rBX7TKl6o6Nxx9FmwbPCQ970FweTZAx9z9/+91iG5tBz0/Ce67NgcgIuFdpXsk6FxRXEj6dxiy
 BGPTez/LAedKVx7Q344SoDXmQLWjNCM83T6lzznoS/4/9oflhStRUohud0c9aA1Z8UBjyvOt4Hf
 Y7IMGwNRGJ2uKRE7nwznaQ6VRy1nMdA/YxWOXYnZ4YyJHJ6FKzUTutXzKP/C39LAIxbON0lUKxz
 sfKWQSClZHjhQYVX2KFwhVdrH8WMCaHtgSrkyk3+BYfcpNpKr9dSgiXGZ0Tkr6m1eE4wDI2ZgLh
 xitzcb59vYqzR0yXUXf15HFcMl39+Cquv6DfURE1EvwHmdWFHDBbfBEY3kibAUr7JbMpTRBaWKR
 afnb7G3FXy2FnNKppg4b94aJYkCYKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 09:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227347

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Brings following bugfixes on top of 21.1.6

292dc2b86f66 (HEAD, tag: llvmorg-21.1.7) [LLD][COFF] Align EC code ranges to page boundaries (#168222)
9ed1927442a4 [server-llvm-21][MC] Fixing vector overflow
922c9914e14b [clangd] Clangd running with `--experimental-modules-support` crashes when the compilation database is unavailable (#153802)
33e1a55a8bc7 Bump version to 21.1.7

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b5031b55af..3cccc88618 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-21.1.6 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-21.1.7 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 4051ce6085..ae0caa6f01 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "6"
+PATCH_VER = "7"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 4ea22fe5fa..e852f03c1e 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "ae67086eb04bed7ca11ab880349b5f1ab6f50e1b88cda376eaf8a845b935762b"
+SRC_URI[sha256sum] = "e5b65fd79c95c343bb584127114cb2d252306c1ada1e057899b6aacdd445899e"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


