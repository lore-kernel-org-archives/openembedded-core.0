Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6518D2CE17
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:18:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12532.1765361909615582055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:18:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TNfjh3rZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4439ea1cec=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6A2Ac128616
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=+05lUAE2p1cn7izaxHAqXAaYM9XUHWy8phNjK7YxfHc=; b=
	TNfjh3rZ8X9nk7hhfYGHMmN/Kq3EdC3f1t05pgw8VAJ6Od7kWcZuRXczjGtftLcD
	cnhLz7f3jtX5ZQQ/rNgDprQ+1klRvHDk8HAMqbB2VJPlWjefAeSwo52axLig1gxl
	wqpjnWDBcazU5MvhQN79uo9QmObPAHX6NvVJtQNX4awamjWKx1TfkO95gkMxDiTv
	CdKfh9FWHnETXdM5dEq7xYLmA6QZu7x+Y+GODo07qE8boeGi7kf2cbzQq0Kh8K+W
	DxytIuaI+mWXi2qxxFde46Eu//fAIMZ4KrnVOJTOufyxDW2ak+TgHKbkc1U4wUXQ
	m6L72Ylat60aGBbfiKLQHg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07hrd2b-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:18:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyNaSlhUSbE5lgJI5p/+LgcDIXHcy1fYQPO1IbZkRQpzw/QsFBdiBjHAApWNykJhz5RCCLGJnwbE70Kpo4rwr2k8+qRFScO76BGU2RYZrdAvGaHSUMCMoh3XIDAUS8Or1Sw51WR1AWxaEpbP4fUnDN+Mq4hVdc2M0RWeGJPODYt+/aDt+6VqzVCE7K+xZAOUmpMLv6o1zFS8IqePv9rO+SASnHp0WcF4Vkv0Kso7uSS+6IwSxugtmaAdf1sCLxbdU8hd5i/jC6z5qATraw0lVvw+nt9Ieyda6r0gIZXAUkAKz8NM252ggELXTL3gpqVVLEkJslrZyC2Mlu7a+wgW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+05lUAE2p1cn7izaxHAqXAaYM9XUHWy8phNjK7YxfHc=;
 b=P0BVtHXmwhrz/aPZJ8PbL21hdPdyKgwjigwib576oIRMm1OiwF3c+Z+fShgnx+zOqgggUl/HB5RM9bM4Dz3sJtO/LxB9/Bn/lb8rTkt54lGaakiM01PXR+RcsIM8R8sSYycW3V7VNtIZeF4OVvSccIaq7iCcxfwPQNkJpbumCJpNURboAIu6mAk1u7oHr/sIMNocxZ/Is7G1LZKygKTRLe7B7CqJxxukDHr90QP+TJa3/yD8szc47pobiNkkjSA1vF0jUwM2G8OTCQTTCph8KTSfyI5+vwVIgNxcPBT5yeYGweYp4QmOWLBNXh+E6oXLQVFGFynsGbYN09GuqQiCTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 10:18:25 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 10:18:24 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 4/5] rust: remove passing tests from excluded and ignored list.
Date: Wed, 10 Dec 2025 02:18:02 -0800
Message-ID: <20251210101803.1120711-4-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
References: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 015653b9-bebb-4e72-5153-08de37d5741b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?o5rcXvjjUcHN8QS0GLynorBckbvCvGCp5jfRYNuR9fTZ3DZvLbM+gkYJhAza?=
 =?us-ascii?Q?UBwKbuyvVw6WcQvSqncjNqI3MVOAFyMJ0u96gaSwSVvTZcCZEsCCn5yF13JT?=
 =?us-ascii?Q?huV7MFOHCuf/vR6l8/6ceQbO4KbPDLxRDdspz14YXHCLp0lefBj+iotq4xtB?=
 =?us-ascii?Q?9afx3u3ai89H+h51u+wb2M7KXi3Ph3Acn7flsu8CR4B7ttlV+mfGNVC7fxCr?=
 =?us-ascii?Q?2nB1VWt449Wj+FNSxax6QqylCasLRAVPbPDzJzjBSVuUlOXA2FLjpi1EQ/qm?=
 =?us-ascii?Q?++lKfC3D5oAx34a9DkVLI0pzgtPNSo7n0p57rihqmT2kJE+1MTA0WftWOh1p?=
 =?us-ascii?Q?B+xHaEZyC78Manx1dMs8oGcIoyWRbHQpGVwM0Zy6H93RtaQAHDDqULyufUjN?=
 =?us-ascii?Q?guwKt+p65MvGq6Wnas60u/afUGY1wfHfInQYs+bhWt1z/OyotJGnU8piSxrT?=
 =?us-ascii?Q?wcxvc7hfGfqU32uVFkBacfRvEgS3ZKL0PcGPGt8G9kZ1NgoLJSS9VTJI6aG8?=
 =?us-ascii?Q?w/oSum5KtnUXAAHMFd7R2z6jYqhddCmpFg0FQWCZFi8L/TWbYi4+jYuvcmt7?=
 =?us-ascii?Q?Lh3/8mtFgptbmmtsuCzdN1woRujGrTushp/ThAm7eC2ywMukAqfkpNxxSr6M?=
 =?us-ascii?Q?3zCen1B+Ve6o32zOf3V8ot7hUfM81Z3KvOjQ+742/tMzUR2Nhg8nmuXIbSX2?=
 =?us-ascii?Q?fbJLAGyIS6RaIVFciyioNaxx1yDYP1BbGdsXa14wygG/oULJm9p5NbfVJAI7?=
 =?us-ascii?Q?yzC8hWM+efAedtxQHAeIdFtEk3U46cUmJTCiMg9uE7fQIsDz5FlcLUnWNnWA?=
 =?us-ascii?Q?mRvnS6EIuWPy3YZjAHAxXkWZP1oYsYYdpSAP8e5BZrFJHwAx/BJdyeYLhiDR?=
 =?us-ascii?Q?qj8+kMYu25g4tzrrdy6RY97U6XKWMsuFHz3K3TK1oo2coBXz8mDPpFAY4gWq?=
 =?us-ascii?Q?twWizicl0UnjFZNF9/CH6xWGdM+F3dky92mbu9as8C11GFgP7UIevmnKbOr+?=
 =?us-ascii?Q?53Y2uzu2V8bAjxTKjMQz1Zp6FwFanOOaW2lwLXUK2THVVu2mababAt/nO9y/?=
 =?us-ascii?Q?hz8NENQ9zaPy9JniTWidwtncfOtT4lXi+VsKjGi0frJvKK/l7tlipd3szUGD?=
 =?us-ascii?Q?mYLHgYtiHZjzoMNyUSYe+OHH0PRmL98hjGjNdvRcUy2P+rMPC/JeU+VaojM3?=
 =?us-ascii?Q?MQi/qXJt0X+DPdq/hfFxCmEIeqhrHAyrfkjHUS4qpmQeBjFY9sA7IMsWF+yV?=
 =?us-ascii?Q?Os5KXKPthQBVAO41j9hmL2Ot0bGpAma0/HbLdaUoymSWi9P7AKCrWWj+Z/UV?=
 =?us-ascii?Q?CMjWhbTJdqnzJOaJyr1UzN01c2UcA1GUmU+KOvWtDE/oP1b6HXZCz2FUoOgJ?=
 =?us-ascii?Q?41DmIk8FxJjQ47/L6e7IaBUPXzqhPaVEJdq5n3PgBqcAdLfFxdypAdLFm5o5?=
 =?us-ascii?Q?nnLMF7hS5hHYY7kNJLjn2hKCRD8c8yG6DrcW5PgVjy1pIZHbunMNtPB2ZXeF?=
 =?us-ascii?Q?6q7c6RxIdSjdqHD0DCe4S8N2USHEZnuTyNRF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3FBRzcgO1OL3zBdm/m9KOVtlBiYdk2D+PBVKo9dRiRROBllSUuvSXEukgY68?=
 =?us-ascii?Q?J8wg9IsRPrgas34ju9jAc29HFY9C6sPvyIIdMCZy/dvBXLrV1Oy/Z2n8hi8e?=
 =?us-ascii?Q?og9KWo47Cim7hD5RZNO/EOMrgH8g4pJ6kSSf+QtZYIBfc+KB47rHhqFUwRy5?=
 =?us-ascii?Q?vB6enw4rOkUtWoanIRn4kVzLjVz83itydQIi/ECdDmwrY67/C8yz/NC7NwsE?=
 =?us-ascii?Q?T6dIk7fTDFVK5X/w9vIWRGrnrYZhauw3cqcrPe+Kb5MGPUyknAgc1WOoZcGF?=
 =?us-ascii?Q?iJEY+7z3LpHOrpLz3ZyCeSjR9WMEUTR966khH1px8RoaYlT+hKat+WlQxh0x?=
 =?us-ascii?Q?G1FIA77+eBNA319AmgUrv/MBCRL+yksryOAHSsovNEPSHvfJcy8wQ8gcbhBC?=
 =?us-ascii?Q?kPBXMB3gYf8mcgF5MxWOSEjksayBniTADUIonGgxCoaKIwUznKKAVhHAVWWg?=
 =?us-ascii?Q?Y61jidqYFVNxqQq8zqeIlQaNOy9Q/VcaQ+ZoM40KRJwA9LQkgcEdtEofxdx1?=
 =?us-ascii?Q?zXnQ0qICNXeTwyJnUBBPRuJ+GYsNYDJrAuTEwWf04S8J23pHI+yEy279PTly?=
 =?us-ascii?Q?EUxIO7zvmJRATTUA1vQqZWKERN2/fbXQr3JIgiaVj9meO4+QRVJsQOpAnGf0?=
 =?us-ascii?Q?ZqKxIDEaKqzD/H0L04QiVvZA9SEqswJWEgHHkVxsUIDagcXwP9T4HLDSqgla?=
 =?us-ascii?Q?F/0WIZwYD7N30/6ds/exU1KMKHUvs85jOal2zZHkYLCaeSkVmm1GnHTCxoUN?=
 =?us-ascii?Q?VOgplTcS0Ls9BbG6PvnM8j/XxXNK3wgBXuWjLpQ9A1iVz177zgUezdutrdq6?=
 =?us-ascii?Q?5vhLU6poaHpgx+vWH/srdPynJQ4NMnjUPAqa0GLMYrJtsPcpCL1pUqb/KZAl?=
 =?us-ascii?Q?65lN28oeUPIhLJiQl8lgKFciYuFi4WLEyV1E2Vhhm13I5068ilSG5HzScik8?=
 =?us-ascii?Q?Ua/D98cA1mDgWg8nEjUYFDDg/QiI9rucj5Xr76UeUct4s695zZtPy1CbyARH?=
 =?us-ascii?Q?eXznZpMSAPwWZcVauZPOmMz2luB334jBV53HuZInkejlBVTd1UyDWZCDWybH?=
 =?us-ascii?Q?NE/Nzw83kraRpo6uBVqfAQXaEw8diBMta7whMuSf2mV2ueL2yP2c1pZpmm6+?=
 =?us-ascii?Q?+1oMMJAxIT+GWm19v226BVRuDI6TsjzCjczuPro39bXZM5DhFpHNCgyq9l7R?=
 =?us-ascii?Q?Q1QlXBrcto2QHxLHQDL5R4tnumzhKr8johcHSfY0qhwjvjtUZ+qhPuHOKXfp?=
 =?us-ascii?Q?Z1Y1N6kKOULmrzxqek8gQ9HNZ7whxAWFiRMqjJt/WapgT9xf6kD8ArtZns0b?=
 =?us-ascii?Q?LuHG4I6UlrtcDZw3gNynWQgcMPWc/r5u+VCQ8SrghMRNqWjMfT0mPPmcnCyC?=
 =?us-ascii?Q?DJ7Ri5Z5vVzXbanc5+helHe+uPj0WTSFdVIhnzUzElFBl8FZ0TBXKR66oxHR?=
 =?us-ascii?Q?mcCosxYknWmq7jehYFkSqASaoLYfSzcMm+92F+dMxoRHjVg7K9T8NvSxK9vA?=
 =?us-ascii?Q?mXld0ayqQQYm3NPB4Lc/VKBNLqTp0U3AUlpdHkgchge8BAJHm4sKH4VsWv5S?=
 =?us-ascii?Q?nmJQzNJJeK6VuPySWC3d49f0K4Yuu7mZ+EHoupZa8ElHyfnnaXTw69XhdDwH?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 015653b9-bebb-4e72-5153-08de37d5741b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:18:24.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEAbJBFBsi4QjQ9kbLc8qM+3ElJDeHYdLEtyfcdjv0uFtCvvHjoPv1jry137FVFvcibCd7aMaJ2oEvN1z1ItAU50K/hXs8o4/LsQ9ygTzpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NSBTYWx0ZWRfXwqOioi6Mi/GF
 zv8Ts8T1Gs+4JhcRavf8WdiXNRJGuYP8d3K19Lzh3HhBsMoFd1OuEYIqD5pJXxM45hArOo3qZ+7
 SK8Rsp0vYzvJiK/Wm5VsvgPeURWBNOR/yuzhw6qc+0jRTPO9quWtgBeEvKQvCRpH+RlWKvJkVF8
 F60RdaFKY/f2xBsJm/43/ja9Nt58PIUEwFeDSdLHEMXl8SVJtN6Hy4PlaT0AV2k4W+pZNlWiMm8
 bOyxSgXFtS/ILxgNRyiqpR6m4e1coUElR2LUU02XDMaQLR51icMOxw7CRMZn+OGhhk5hceWVM0A
 C/YgBIrdLujBsiKlwjOtU4bzdiezWuUatTCuyRm67yJBP605GaV5rsYIPigTW892Lt9GHvE5WhE
 XTJS86pnnxQGCn0GZxMNVowvjPz1Gg==
X-Proofpoint-ORIG-GUID: v9Er9-2Tcgw57XI3osVFY53J4EY1gCs8
X-Proofpoint-GUID: v9Er9-2Tcgw57XI3osVFY53J4EY1gCs8
X-Authority-Analysis: v=2.4 cv=dbyNHHXe c=1 sm=1 tr=0 ts=693948f4 cx=c_pps
 a=0dUMnQhOFwHl/g2jU5Tm3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=aBlMQnakSdQ6o4E7Hb8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227464

From: Yash Shinde <Yash.Shinde@windriver.com>

Remove the ignore tags for passing riscv64 tests and
drop obsolete "tests/codegen-llvm/issues/issue-122805.rs"
from exclude test list.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          |   1 -
 .../rust/files/rust-oe-selftest.patch         | 100 ------------------
 2 files changed, 101 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index ebc9204420..3a41391101 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -80,7 +80,6 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/tools/tidy',
                             'tests/assembly-llvm/asm/aarch64-outline-atomics.rs',
                             'tests/assembly-llvm/c-variadic-arm.rs',
-                            'tests/codegen-llvm/issues/issue-122805.rs',
                             'tests/codegen-llvm/thread-local.rs',
                             'tests/mir-opt/',
                             'tests/run-make',
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 7d26d75820..b39b326455 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -202,106 +202,6 @@ index a05f274136..0e69b4cb98 100644
  fn sparse_inserts() {
      let cache: VecCache<u32, u8, u32> = VecCache::default();
      let end = if cfg!(target_pointer_width = "64") && cfg!(target_os = "linux") {
-diff --git a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
-index 828328df843..30753c56c76 100644
---- a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
-+++ b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
-@@ -8,6 +8,7 @@
- //@ compile-flags: -C lto -g -Cdwarf-version=5
- //@ assembly-output: emit-asm
- //@ no-prefer-dynamic
-+//@ ignore-riscv64
- 
- extern crate dwarf_mixed_versions_lto_aux;
- 
-diff --git a/tests/codegen-llvm/const-vector.rs b/tests/codegen-llvm/const-vector.rs
-index f4307492341..617e31140e9 100644
---- a/tests/codegen-llvm/const-vector.rs
-+++ b/tests/codegen-llvm/const-vector.rs
-@@ -3,6 +3,7 @@
- //@ [OPT0_S390X] only-s390x
- //@ [OPT0] compile-flags: -C no-prepopulate-passes -Copt-level=0
- //@ [OPT0_S390X] compile-flags: -C no-prepopulate-passes -Copt-level=0 -C target-cpu=z13
-+//@ ignore-riscv64
- 
- // This test checks that constants of SIMD type are passed as immediate vectors.
- // We ensure that both vector representations (struct with fields and struct wrapping array) work.
-diff --git a/tests/codegen-llvm/enum/enum-aggregate.rs b/tests/codegen-llvm/enum/enum-aggregate.rs
-index 0161e5f3fa1..773a06fabb4 100644
---- a/tests/codegen-llvm/enum/enum-aggregate.rs
-+++ b/tests/codegen-llvm/enum/enum-aggregate.rs
-@@ -1,6 +1,7 @@
- //@ compile-flags: -Copt-level=0 -Cno-prepopulate-passes
- //@ min-llvm-version: 19
- //@ only-64bit
-+//@ ignore-riscv64
- 
- #![crate_type = "lib"]
- 
-diff --git a/tests/codegen-llvm/enum/enum-match.rs b/tests/codegen-llvm/enum/enum-match.rs
-index 57db44ec74e..1e2507f7c90 100644
---- a/tests/codegen-llvm/enum/enum-match.rs
-+++ b/tests/codegen-llvm/enum/enum-match.rs
-@@ -1,5 +1,6 @@
- //@ compile-flags: -Copt-level=1
- //@ only-64bit
-+//@ ignore-riscv64
- 
- #![crate_type = "lib"]
- #![feature(core_intrinsics)]
-diff --git a/tests/codegen-llvm/enum/enum-transparent-extract.rs b/tests/codegen-llvm/enum/enum-transparent-extract.rs
-index c5efb8d472b..e79b8916fc1 100644
---- a/tests/codegen-llvm/enum/enum-transparent-extract.rs
-+++ b/tests/codegen-llvm/enum/enum-transparent-extract.rs
-@@ -1,5 +1,6 @@
- //@ compile-flags: -Copt-level=0
- //@ only-64bit
-+//@ ignore-riscv64
- 
- #![crate_type = "lib"]
- 
-diff --git a/tests/codegen-llvm/repeat-operand-zero-len.rs b/tests/codegen-llvm/repeat-operand-zero-len.rs
-index b4cec42a07c..d450fead9a4 100644
---- a/tests/codegen-llvm/repeat-operand-zero-len.rs
-+++ b/tests/codegen-llvm/repeat-operand-zero-len.rs
-@@ -1,4 +1,5 @@
- //@ compile-flags: -Copt-level=1 -Cno-prepopulate-passes
-+//@ ignore-riscv64
- 
- // This test is here to hit the `Rvalue::Repeat` case in `codegen_rvalue_operand`.
- // It only applies when the resulting array is a ZST, so the test is written in
-diff --git a/tests/codegen-llvm/simd/extract-insert-dyn.rs b/tests/codegen-llvm/simd/extract-insert-dyn.rs
-index 729f0145314..2b1d1beb86a 100644
---- a/tests/codegen-llvm/simd/extract-insert-dyn.rs
-+++ b/tests/codegen-llvm/simd/extract-insert-dyn.rs
-@@ -1,4 +1,5 @@
- //@compile-flags: -C opt-level=3 -C no-prepopulate-passes
-+//@ ignore-riscv64
- 
- #![feature(
-     core_intrinsics,
-diff --git a/tests/codegen-llvm/transmute-scalar.rs b/tests/codegen-llvm/transmute-scalar.rs
-index ce1b0558b2e..e8fda2cd566 100644
---- a/tests/codegen-llvm/transmute-scalar.rs
-+++ b/tests/codegen-llvm/transmute-scalar.rs
-@@ -1,6 +1,7 @@
- //@ add-core-stubs
- //@ compile-flags: -C opt-level=0 -C no-prepopulate-passes --target=x86_64-unknown-linux-gnu
- //@ needs-llvm-components: x86
-+//@ ignore-riscv64
- 
- #![crate_type = "lib"]
- #![feature(no_core, repr_simd)]
-diff --git a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
-index face1577c3f..09e0846bad0 100644
---- a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
-+++ b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
-@@ -1,4 +1,5 @@
- //@ compile-flags: -Copt-level=3
-+//@ ignore-riscv64
- 
- // See https://github.com/rust-lang/rust/issues/135802
- 
 diff --git a/tests/ui/abi/rust-cold-works-with-rustic-args.rs b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
 index 551485469d3..575db924968 100644
 --- a/tests/ui/abi/rust-cold-works-with-rustic-args.rs
-- 
2.49.0


