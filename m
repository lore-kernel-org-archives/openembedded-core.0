Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6839ECCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 06:09:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.25786.1761545372551407733
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Oct 2025 23:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rI0hcisc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23958346cd=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R4ZNmd1337097
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 06:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=BeTmPO5Eo3lTh1frAh7/
	7SeMJfZ5iG7iHEvot2BrH0g=; b=rI0hcisck5eTu5X6wQNFR29WImMPVrhQ83fu
	OlWo5Zun9FH6Bm2cHENvc/491qq8TCoNpboO8mYBDWvpCeSuV27FRbe0CP13hRK3
	OYCOcGvX+Q/xMSqU1dAEe8Sq8/TnFAdedyqGXJ3+yjHoZKmGpvOKT98fma8u56Sc
	fKs0z8sNqYvPynocawqqKAgzsdUJBE4g2fYD9FMfkxH/OGEpiY2f+MkdJRVT4TN0
	F2ATOqcP2efAlxEtrBD/IfDZUwP+LqYWiR5Q1W1vjKb/x+tPA8bUIjeZxJ6b0ZnY
	hCNjYujZP6yuv0gDK6+EFRWBjcQ5qJ3b/9mBcnN90ujf1uMaAA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0nh5sew8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 06:09:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DiSgipjNlRi5E5ixdL2bezyTBLPq7MtnGDjJFRGt6k8vD24QUXdWYgossQ0mqeUr8p35VSy+mneoy2p3ep8KzYli/poSkGA9GpP5RD1JKjbHPeNGdvWemDOJMSt8qNFHMXT5x6ZUTmO1b2dikALXGLgQxOlk3G/GlyWwRc3kcmXcI1a41cysk8Wce8zN/yJOqQWg7WAISm5E+EPEYoQZpw+cA8OLos5U4MMjKtiQYnT59eAUkMwiizkGGCGmkj0UYjFp5tXNGqoTjSRl6sTMCE2xRKEkNIk9W98iXuBHDfflGkEg6763YCCkreNceRh/l5lBNdKC+FZC+hNdSXKDSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeTmPO5Eo3lTh1frAh7/7SeMJfZ5iG7iHEvot2BrH0g=;
 b=YLUueP7a2COM0rFBkHXBJFCaDXALIzPgb0VxxIjkZF+EDN2JZj4MhSycg8lkbkKl+u4axyYTT7VBMSg5XeNVREG7X9T9910jW0MYyYXAd4FmbTwtDn50MiWioCKVfKBOKNIt0+5JCpEV+ylKBUoyYOfa30qP8eK6cXxcIqSku4kamlrP7tRDGsL/zgGZpPkG3pJkfUnFp9jKqov3E7wZb7jJl6opNHZr6aiTNY9U1Zt1dvp7NOknzGXDIX+5ydP3tXzXmRQgkekYBInuSA7lrQbGBftQLgRCLQdXuOe1uy/L0k9O5LFaogZdGAbs1eN0Fi3KtG7jD9XtAT7Q9RoBqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 06:09:29 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 06:09:29 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH 1/2] avahi: fix CVE-2024-52616
Date: Mon, 27 Oct 2025 14:09:14 +0800
Message-ID: <20251027060915.930984-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:405:2::27) To PH7PR11MB8570.namprd11.prod.outlook.com
 (2603:10b6:510:2ff::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH7PR11MB5820:EE_
X-MS-Office365-Filtering-Correlation-Id: e1878701-f7f8-4c21-c63d-08de151f6279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2qkluuUEOG1OJOP4vjSfMMrCoobVO67T/dEkHbLQrNQVQnz+BmC2EsR8Fhsp?=
 =?us-ascii?Q?ppzsUtki5Q3jQE6dAdM1EHF5ESs+IiUdGf90RfEkunosH0kuVB2n9tfBCyUb?=
 =?us-ascii?Q?OxV/wwgNSXohOBMbfFs/hfJz6oRDsxk/PuCa4Db4gxMLjy6vE7LveEADCyvb?=
 =?us-ascii?Q?PC2BSEclktVtehjY6RWlnZyDbFLWhI0o60JcVe2blRgtKtAy33VnI6E5Q9gS?=
 =?us-ascii?Q?gBDMtYzQvsyp3ZASrfzJ9rwTLzmmlDz8OlKRLpXsC+JdQdqlRHgBeKbd5hKJ?=
 =?us-ascii?Q?h4+diQLpKg1Yen/k6g5Jhub5v4TyRtuX3MJPANYqSWT4JALL4vhR/SXK2+Ny?=
 =?us-ascii?Q?M9nG9uVwfYK+t1LltpHJlkvQkfOPHSEs0iJGv+/vovCxi1asro0nOvNWnwax?=
 =?us-ascii?Q?0BDZhyh3o+5V29mvyl2s7MSqrw7CMcZY4sq2JnSX6U3I1W/DCLx8KggfCbBZ?=
 =?us-ascii?Q?Aw8sxF1jGSGtDlAxqSlMPI06+L2mC8QLw7EUUJ3DmswR2bAmcQ/ochRpK+Nk?=
 =?us-ascii?Q?KoMHt88tq+g6KXqxp8E8gQMk4YvwC13/pIhM+e8mfKVHxDDNJghgvSkBYCPf?=
 =?us-ascii?Q?JIcL9PCuTjJGkzhsjo2H0iVLuCNdjDOLaj65rRKoqyDz6z5N2IWcKgWrgO61?=
 =?us-ascii?Q?JJqK7zzfhJy1xIbIdqaEUXHYPZt/Hzj126LmpCW4ZvV8Mf9LMNF8f7+FHrVN?=
 =?us-ascii?Q?6YrnbFB6H8PcHkCUygO8uWjoOre1sYXV6Ra1yXxFOtE7/Gat8MZW8py0N84k?=
 =?us-ascii?Q?Vc7figG/6BYhXlYj14inOPF7jU/LjuKOboTU8pSckkvP7kEC3sI+On6ToYrD?=
 =?us-ascii?Q?CD94vpp0ynMKbs/9+owoFbBEe7b0VX8sj2RPXKQ4yF5Q6iaNai8/bhSOU+hD?=
 =?us-ascii?Q?n6rLN+RQru/YqzyRYmYjamn/j5VMV1F+34gbMA/XkgCcpqZPeA7Jv4TvU60A?=
 =?us-ascii?Q?1XKNKf9GOQihrQIIkv35+FyL+lbxDCf8UJOPtxLfCXRrk6NEFDDbMn9EQs7P?=
 =?us-ascii?Q?PBC30SBZOGRoEFMsAg3+PPFizp/7l1AymUsltCIVweTiPSxuazW2Chg2i+ZH?=
 =?us-ascii?Q?MyOpTtrfntNjW1eC9ZLanYlmGn7GWhJpvyilQpZ3b0luMYF7Sfx1+csKMFMt?=
 =?us-ascii?Q?/9h71oof510oy+imwdnCoB+FJzF4ZFT4ph4qCMftown3wiKz3a+a/q5Ab9kW?=
 =?us-ascii?Q?PAbIcC0k7Pt5JhrOLva+QYRK2oIOSSh/Qkz2vteG2X2Y3epJmN/jInj9npkT?=
 =?us-ascii?Q?c/YjfDtWYjOzMwjwSJEkXbamR8s0X//USQEd5ikWo0Y2B5wWHuy46+Bzlh0t?=
 =?us-ascii?Q?OS+KnwaLZaNycKcXd5BQblh0V3/Z9lgPAPCW5bDI4d+JpmK8HBBMRV1GKKb3?=
 =?us-ascii?Q?XPD9BfDvw1dz4Ra6ww1FW59cvGi0M0rrGv5EzdqYHuHkg1pjg51YnHDMQk0d?=
 =?us-ascii?Q?4rRjDqE3i5+nIt/mp1zfFebW+9g1E7ctcNuZkhITuHF8Zk/UF8kq8Qx9hOnq?=
 =?us-ascii?Q?6n+daeRq6yh/dR/jLA9q5fYNj63BJRcZWlNNWsAK8qFS2tmhGdyTIP8h1A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XD6xY8ATs0yXggEa26Kie63L3f2A1UFHZqNaR1rHgkUYtiGNNo2GTqX21NRd?=
 =?us-ascii?Q?IKSg2qFtM0XcsyQ0bw6z1p7KCobNxryt6CvgYWNX4tdY9GLIpPMtp1XC2kJ0?=
 =?us-ascii?Q?61Ya9tGB7OAbPHNszMA8CPWQKAM4P5z0qP6Gh/wxX7JtFXyddq9N2rlpNGV+?=
 =?us-ascii?Q?sorUW2AIDC7UWkCr6uEItPkJ3YcRxRxEcaZqfxVLMR89CAdQ1OPghopCd+e0?=
 =?us-ascii?Q?FmGx3NnFPKehaIDy7VF30y9r5ZGaSv0gtnlrWyBARbcpVAFZ82V/1JLUKseX?=
 =?us-ascii?Q?v4CuZ8svNPnm+oqIPSTNxi8mzC1sNdPNAFND1V8GjYuTXjlqtQxhksI5OKAR?=
 =?us-ascii?Q?eIKB5p18uuEYSHdaPtQc+kq0WStZ0qef2ym3UxPfCT7y6c9QedM9BtekmUWY?=
 =?us-ascii?Q?42hXrWqJ8NWTMAdsWb66l5P5AW8CyuOUN6AiW/7z5y7jaZJyNFZyvC7Xl35H?=
 =?us-ascii?Q?GgDm2u76WYuXk77oQ6O7/R92n260KmEOAXlp+UaIKe6KUdqi+3g5qdsnuQVJ?=
 =?us-ascii?Q?6Q1RIagwF9ghdYka+Ck+bOH+WTvvlaVU7uwMPZ4ukRNAYU83vGiWKAjJ9hN5?=
 =?us-ascii?Q?y/4rizCNHIDCWWubiYuADwxyPeQN4TwEm5pDfQeE8SobpVu5s2JyPCrIc7F+?=
 =?us-ascii?Q?r9Px6FOpXbKWe1sXLXVN0B/yVfyCORwg7sQCc1r/jZUv+q1CQ8l3HmmUts/C?=
 =?us-ascii?Q?CBm60EZOTneCrh1YVR4qSShcD1tGNJMeTEHmAFkQApHbbUnUq0IKrnkPZsMS?=
 =?us-ascii?Q?6m0WwynlmBfgHw1f4er+A42C0AR6BFndtn+NQExpu0UQJUtTeUuiPYZybxHu?=
 =?us-ascii?Q?k54Z1iYn1ntLXd7WVcwPniO2EhkQFsp/wBfA9gUX8jOMiMaDZ6ns1fv/ie5I?=
 =?us-ascii?Q?42NENnEtH+U+0FNcDh/fpI1JvbkvbFvCTfNux5boDjLLOKW2rJsDRbhq5qkE?=
 =?us-ascii?Q?jSfeKq3Y4ZTKerPeq3gn7FwWTqqS0EXC+3RGm8oDvSURNia9+RsW5jegpidZ?=
 =?us-ascii?Q?RjwqXQMXVWrW//tImVLEhZ9Ztvdwsymz8WMLL925/c0skc8RPhUEAQtaxYcj?=
 =?us-ascii?Q?pUpSEgfv8N+HldK6213LxeNd2+sNnjleBtzWIGF79unzfgQzS/mB47iYP/lj?=
 =?us-ascii?Q?+o2V6WNDCebc1Z7YyH5rYnD7EH4vcN6Ti0j/ujKbt479cYmzhcN91Tp1wPQH?=
 =?us-ascii?Q?dzTOD3xW9grOfQOrRtIeyF0HWjf8creQPWlOP6WRmil2TsdLWIoW16MPhKhu?=
 =?us-ascii?Q?rD9RAJD5y06vluSHORDSqoN0GgXyZcXHLWG7PSX7aJXoA1wBDcu1Q4RL/dpK?=
 =?us-ascii?Q?7i9b1q1MQoHY2XCbcXrVq5I73fas2pRu5sixboznz0pHMGyb3m4T4dlTUMsE?=
 =?us-ascii?Q?gfVoBmvwRbUrXFWAc6fffpfrc9hFEp0SaBkYqGgMeHMh33gRjq2VPf2MxjAH?=
 =?us-ascii?Q?0/bmAIvDKpVxIcDFIp8D5yWtSQa9lDjqujccBxJp0hAvexJdVSMioKnGKzJg?=
 =?us-ascii?Q?QR+IaUo6knLlUEKCiIbD4xFceKDmnMLsGmzN9smgAPSgBTdV5RzB1XIDzVJ1?=
 =?us-ascii?Q?dHj8WcThSdNvLAIVv5hi4A909dX3qDX8x1WW198alT4RSuXFU1LkTIAfR8BB?=
 =?us-ascii?Q?CA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1878701-f7f8-4c21-c63d-08de151f6279
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8570.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 06:09:28.9142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCqYaFVOwfKAdkJpqf/NzfdBlmVs/qmIHNhIg29VrPJ4DEWNNSz4E6MfsOc4ine/LZZi/1Ux3yZ71hf9Iy2dpbDSGxP0OUoQ+HGXwkpBgDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5820
X-Proofpoint-GUID: CgRo-PFpUsgrUHqNoDx2ZYlwuZ57njwH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA1NSBTYWx0ZWRfX3eR/V9PeGeT/
 vFd1QOc0wyk9vTzRkAVbrSDPHmv+8PERH2iTM2h8KEyzmbCNyMdAMjA6m9eDSLLOSWhfLZKWecP
 +tdKJ+JWmucw12L8E3j2VTQuetnmnPKYV44IOCfSM7BqMZFTiaS9I+qPsTv9l2XHuWxfjNk7Myt
 KawPAYkzx9TCKRxSrbvnI3c3pvBfv2eI2OlWmJQv9sKTI32qaVYE/8Q4KoGp9PBDuHGebyo5XlS
 Z2Co0LYFK+GLJ87Xtfi3vXqMMpXX6lpIQVxPtwMlKWQ2zuhw7R8eEjej6VhVFUGVDu3hbUTDVML
 ZBZJHPEoDj1DdQHIqMrElXPxfwMGwD6Fr5jtoS7j+6ScS5l+J3quDsWiTsR/nIAnLbuGU8Y6/Y9
 i0aaYzkrbyln9bKmSt8hOdNvulkhiw==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=68ff0c9b cx=c_pps
 a=miuBlqXM8bFb40OTON37XA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8
 a=20KFwNOVAAAA:8 a=z2BOVTbumQ4ULxXF9BsA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-ORIG-GUID: CgRo-PFpUsgrUHqNoDx2ZYlwuZ57njwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 06:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225321

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-52616:
A flaw was found in the Avahi-daemon, where it initializes DNS transaction IDs
randomly only once at startup, incrementing them sequentially after that. This
predictable behavior facilitates DNS spoofing attacks, allowing attackers to
guess transaction IDs.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-52616]
[https://github.com/avahi/avahi/security/advisories/GHSA-r9j3-vjjh-p8vm]

Upstream patches:
[https://github.com/avahi/avahi/commit/f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(Cherry pick from commit 28de3f131b17dc4165df927060ee51f0de3ada90)
Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2024-52616.patch          | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 220160a7e1..734a73541f 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -35,6 +35,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38471-2.patch \
            file://CVE-2023-38472.patch \
            file://CVE-2023-38473.patch \
+           file://CVE-2024-52616.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch b/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
new file mode 100644
index 0000000000..a156f98728
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
@@ -0,0 +1,104 @@
+From f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20Men=C5=A1=C3=ADk?= <pemensik@redhat.com>
+Date: Mon, 11 Nov 2024 00:56:09 +0100
+Subject: [PATCH] Properly randomize query id of DNS packets
+
+CVE: CVE-2024-52616
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ avahi-core/wide-area.c | 36 ++++++++++++++++++++++++++++--------
+ configure.ac           |  3 ++-
+ 2 files changed, 30 insertions(+), 9 deletions(-)
+
+diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
+index 971f5e714..00a15056e 100644
+--- a/avahi-core/wide-area.c
++++ b/avahi-core/wide-area.c
+@@ -40,6 +40,13 @@
+ #include "addr-util.h"
+ #include "rr-util.h"
+ 
++#ifdef HAVE_SYS_RANDOM_H
++#include <sys/random.h>
++#endif
++#ifndef HAVE_GETRANDOM
++#  define getrandom(d, len, flags) (-1)
++#endif
++
+ #define CACHE_ENTRIES_MAX 500
+ 
+ typedef struct AvahiWideAreaCacheEntry AvahiWideAreaCacheEntry;
+@@ -84,8 +91,6 @@ struct AvahiWideAreaLookupEngine {
+     int fd_ipv4, fd_ipv6;
+     AvahiWatch *watch_ipv4, *watch_ipv6;
+ 
+-    uint16_t next_id;
+-
+     /* Cache */
+     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
+     AvahiHashmap *cache_by_key;
+@@ -201,6 +206,26 @@ static void sender_timeout_callback(AvahiTimeEvent *e, void *userdata) {
+     avahi_time_event_update(e, avahi_elapse_time(&tv, 1000, 0));
+ }
+ 
++static uint16_t get_random_uint16(void) {
++    uint16_t next_id;
++
++    if (getrandom(&next_id, sizeof(next_id), 0) == -1)
++        next_id = (uint16_t) rand();
++    return next_id;
++}
++
++static uint16_t avahi_wide_area_next_id(AvahiWideAreaLookupEngine *e) {
++    uint16_t next_id;
++
++    next_id = get_random_uint16();
++    while (find_lookup(e, next_id)) {
++        /* This ID is already used, get new. */
++        next_id = get_random_uint16();
++    }
++    return next_id;
++}
++
++
+ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     AvahiWideAreaLookupEngine *e,
+     AvahiKey *key,
+@@ -227,11 +252,7 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     /* If more than 65K wide area quries are issued simultaneously,
+      * this will break. This should be limited by some higher level */
+ 
+-    for (;; e->next_id++)
+-        if (!find_lookup(e, e->next_id))
+-            break; /* This ID is not yet used. */
+-
+-    l->id = e->next_id++;
++    l->id = avahi_wide_area_next_id(e);
+ 
+     /* We keep the packet around in case we need to repeat our query */
+     l->packet = avahi_dns_packet_new(0);
+@@ -604,7 +625,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_new(AvahiServer *s) {
+         e->watch_ipv6 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
+ 
+     e->n_dns_servers = e->current_dns_server = 0;
+-    e->next_id = (uint16_t) rand();
+ 
+     /* Initialize cache */
+     AVAHI_LLIST_HEAD_INIT(AvahiWideAreaCacheEntry, e->cache);
+diff --git a/configure.ac b/configure.ac
+index a3211b80e..31bce3d76 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -367,7 +367,8 @@ AC_FUNC_SELECT_ARGTYPES
+ # whether libc's malloc does too. (Same for realloc.)
+ #AC_FUNC_MALLOC
+ #AC_FUNC_REALLOC
+-AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket strchr strcspn strdup strerror strrchr strspn strstr uname setresuid setreuid setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy gethostbyname seteuid setegid setproctitle getprogname])
++AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket strchr strcspn strdup strerror strrchr strspn strstr uname setresuid setreuid setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy gethostbyname seteuid setegid setproctitle getprogname getrandom])
++AC_CHECK_HEADERS([sys/random.h])
+ 
+ AC_FUNC_CHOWN
+ AC_FUNC_STAT
+
-- 
2.50.0


