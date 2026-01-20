Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC865CA5FB8
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13343.1768933882771973767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=beM7JpmO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5E5GZ2932458
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=uiVGU3ko8
	S3EUkSRxlP53ZphB4ke9Se11ZZ7tl7AToo=; b=beM7JpmOB5n5KgurT6XSBmsYC
	nJJ9zBl9YYxqLLv3MhT+1gTmM9GUoMFZDsOwHvGNGC/I9OgJWFlZGl0ffYP5q4ZZ
	29YVAU48epqmeqBWcbGGsoFqaWiYins4MOZse03Mmh/qeGnK69oZftLAbpl51rxw
	6jhDmpmdMgmeKsZBALPX3SaUZpiUEwA7mcZS1RE+s246H2zwDbXZRvIBodYn8vmt
	kUXpvWr1BeR5Ls3k657ypxJDEn7eQWDMhS0fOJ23ay7k9gZsG9i4LsHId6LOYq3T
	Em3PObkD+hFA+HXf8UezGZkbc1Z+mRT1KRfcoxErLVGTMxx7sKayFGDemzRUQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukgxm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 18:31:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ib0AGB351mHKnaAlvrgXYyJ0VS2IdwWMSShBQJddSREg71Qc8U6gJzmBf9Qbt/O80Zk5dTMlYLXAPGteOue6xnQPPW8ir6XGdxkYPgegQ06Cf7sik6/0HMsEEZUc01Mtt9ye6em0zrAZ+zvmJjJaoTbPtKUqD5EwRTM99KHmmX7z3QPA2QT5bT+gR8Se49RpbtBA2KVgoDhc+4m2KL/YElMHCN5zpfGv/5+fmlu1gEQUF1Xi53O0aGBgEhXfU+HBDgLWhGAqdClkoVju75IJMI2OCu/F3iDTIqZHCRg9Ee9EFKsgT5o7fXyd+vKszXzCZ0fpJMoEL8Nfy45kGktZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiVGU3ko8S3EUkSRxlP53ZphB4ke9Se11ZZ7tl7AToo=;
 b=fk6n4re6KCV4zY8NOolNDnR4nnVxVHBWGn3JlquFU5KNAxY1AW7GaqeWyYEdxVqXMwdb4cP0fEFBsU8fvN1OMN+Ie0yV4AY4AB/c3vCPXfFN0rJK5qyx+v5ptkSnx+rQK6fauAJRQeEU5c3Yf6lQowhAJwRFN5F4fXSI3iAy5M9mgjkj9A+LaEWFrac0HICbgYWXqubH5dMT1iBjp7ejIlOMl4w5AsuMJo/HhOw0dTbgnKvv1ZZOqMo8mK6WTyrl9yXrpxRypH0Izmz7NO4cyJ1UPlS3j12d6uWFMRpLQTY8xccY4bn9+DjIZGfMefzq3zGlp8ZXQYhlLd/y4W4TJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 18:31:16 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:16 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 00/16] Enable rust support for linux kernel
Date: Tue, 20 Jan 2026 10:29:31 -0800
Message-ID: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ2PR11MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eab7004-76af-4d5e-8d25-08de585218be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ergbd2jLfpJmNi2mknHNM1AY/rXwkxku7b/Py30/r+jN98LjtZKcv4kp/85A?=
 =?us-ascii?Q?F7WjDz1+oA6aoESHj2aj9gXNYemFrsuHdBM2vSlq48EIcgvdlkySOqydjpC6?=
 =?us-ascii?Q?uEXaQ/i7vfL3KTYvPdqb5QL0uMZ/fC7ljycVWjqu1SqXbEHAiNY5ruaU4vCn?=
 =?us-ascii?Q?xZH5iuN+hhgDaDTyd6lybou7MZTppn3//E6hasFaLTjUIGuVVMJICs0Zw+Q+?=
 =?us-ascii?Q?PhIeb/6Zp3zrgOMPZWCe7PJXJENWXMong/+OcAB/B6XLJ/xcE3NqFjXO3BVV?=
 =?us-ascii?Q?jR5tpRGnDVI240sTv480KUEzWPgDHx597BKCIHfyi9O7c2NCrhLJ18ktQAIz?=
 =?us-ascii?Q?VQq8HbOy1c05EPMb4n6d9DcrPU2DgmjmgqMbBX6GXl0412PazeyC5UbNBOab?=
 =?us-ascii?Q?jFQvloDFzbSm6ftU9m5F412mdQZoJFHTX9i9cDJN4KUn0oWNZv2jdMdObz2r?=
 =?us-ascii?Q?MO/0F8n+bIxvfcI2yCxqWG0fxZamw6j6q6l434S3imREZauSTwVIUqrCdVlt?=
 =?us-ascii?Q?hqZhmB4fzMMKPwJalNHWKOCau5hU8sFGKWWlmL9oM5fnHDtvM1l6YBGzqOay?=
 =?us-ascii?Q?mLkljtu49J2jiIfdslmhBABNskoa6RNi2k7WjuJXCDHcXo3bVi6KisVOlA8u?=
 =?us-ascii?Q?gGCJ+uADkYAkQSsb0hP/skEQlpkTpxeWTbGXWWGJx0wzpAw0jEdmV3jTAry/?=
 =?us-ascii?Q?zScAn1MsL69ZPt2Sh0iU0HU8ZXzEuJB+NPUz6s4YlK1qk4JzfzKrGuOcG+FH?=
 =?us-ascii?Q?hJQpkWBYyWeFpqBddu9JsQC77xRDDUN65fSMlH+Zz2lB6y+SgCRUmv8qk3IF?=
 =?us-ascii?Q?VYEtYqrXnkFiiXIr6h1MKRGuLSHJLtf9LSYyHJt47AODFE4QtzzZ/mRF99R8?=
 =?us-ascii?Q?L6A9XJJQxptGP97PJd28LBwA9El7IgBd4jgGeDsCCSCZVFxuawOxVyBHwXi+?=
 =?us-ascii?Q?2I2RBeg9tjdtI8C5sS6OvgvKoIMmatrjs/RRGrfQd96KUJ7Bs4HPEecqRguK?=
 =?us-ascii?Q?UV0c+Lc274XRPhIKnjL3Xz2tIY5YG4xx/1gLYRfLxWbyIzML6zbwgs9ySVzu?=
 =?us-ascii?Q?RdEaLdC1YdMMUSivRhwTnqiHOmI+Jfj4O7bt2bQ0XQD56AzrvDNi0dNaac4e?=
 =?us-ascii?Q?l1UBru5tan/E/vAB0DYd1PDYV35iwL72SjqSL+HgTuOBheBIu6/TIN3NFV2a?=
 =?us-ascii?Q?VBP2LDNPH73UW55C5zp6SsQnNnEWN8pEiXo1iDp5iTwi4e0/ko9SmL87hwh9?=
 =?us-ascii?Q?f0HLhmtpWHvonwL8bYzVaSWnVol30rrOxssprXPYxPT2u1FB1HuJvCJYv+T+?=
 =?us-ascii?Q?iy3XoWOiFUsxGsSZmnoU+HWsA9FihaKUmd9kZzwFZg/nIHtmHyD63WATS7Bj?=
 =?us-ascii?Q?yjjaQR3JTTiYY0RwIaYYlDjCFFBOQ3L3fllRQzYiw2jrcolqRgSiLuQ4oR7L?=
 =?us-ascii?Q?nA3951nv5qeKj247ZVyDv7Dp/W7RC3f9HdHVUm15OPF48xliTfPw3jD8bVZs?=
 =?us-ascii?Q?/w30LrjY+Dx7b7NYXcS+8cXwh6AHqo9vRMul443Wew/4Eg2xuwYlQTmT/SnW?=
 =?us-ascii?Q?cEkNj+UIQR+DHBn0y3PYIy3zwZRUI2peP6ctRQ5U803LPymEdP8i07Ha0K3g?=
 =?us-ascii?Q?JoLMlec6fsCACPifzIXl8DOES5dD0R4zFu1qrcSrJqy6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SfnufUfkQgTrlKe6opD9gbTTIlsL6RyY/1yXqIY4koWfxch1g2wW+UBePQrf?=
 =?us-ascii?Q?PZvWevOWthJMygDoFJVn2NcT5Cxt04OTPi/ZJYG8btlAmDOqfrFcnBklukje?=
 =?us-ascii?Q?cakRJLTP8JNqj8mWqmSE32L2N+0j7hh+BKXVSt8/mMxd+IUw/V1zJAi2ladU?=
 =?us-ascii?Q?SjqLpf3zOKVZ4IxpDepPiS4gIQKdOBT+qc+FvefsiuUPd6wFKEBUl6uK+VQ6?=
 =?us-ascii?Q?LogUc4ajMRrJ0NiJaxnISUzAdHihTcuXaxn8JhxKYFK5JbjvMaq9Ibz4RPbb?=
 =?us-ascii?Q?AKrP9yJelrWbh9dPBCOu0JCXebeVoXw7qgHe7gLfAw+jH9Blm1/RwoG1KTuP?=
 =?us-ascii?Q?3yg83VVXQNYBfGeUaYSwRQrJxOJaiV2f5RhnNwV6OR5v99SL7lCY5mpP8RqE?=
 =?us-ascii?Q?9W5bni9Ju8Cxh861cpSoJZM0jE8qaPKELT/MEQe+0v6jN+QCNlLWsD98QpMU?=
 =?us-ascii?Q?M/zx5CEtZwxMtfAfRKnik7xuaOocNnm6lLJUdKfCh5UE+zF5uzWTmOvvNtPK?=
 =?us-ascii?Q?+6tyAxo5BFBrZDJIEHuOI5B4apQOXhMEHVO5HbjlyBNYPvqByyiYaoBGmkam?=
 =?us-ascii?Q?Rb0rb4rbTstTcLC7PGgdSJL2L2hUToXJJlbQMO08mYfI5/E8PTu+WnG4sp1o?=
 =?us-ascii?Q?+IPCIkALfiXyzZfX3vla47q/SBUb8y9d3ASpRrvEA2RWBGiCW0c5hKqpe3IH?=
 =?us-ascii?Q?rOKTu/LY3YJbNMgUBFaENPWDpvIVFG2BZHqgX959Mb32LcnIEHPFJg021Btk?=
 =?us-ascii?Q?kked3+JlPreo5uDC+o2ndvRT6sK2DKRJj4eTicFFS1zdNN5d8lu5hkJnr9hq?=
 =?us-ascii?Q?dIi6WwivzS5OlIm8drA0jxeoh26M0JDqjjGvWXixFdD86iTObaAid04UeddG?=
 =?us-ascii?Q?lnAtshFJ8nk3Hu+yxKFKUJQ//noAnc4ie8jPynJVkKzyfp+8iDCg7ovbMcvr?=
 =?us-ascii?Q?IEyD9XP4nsnvaI/9/B8wJidzjp4KLWsFvJjil/ceqw+yhASD9GfxPhHTpmbC?=
 =?us-ascii?Q?mWrW61lzBJmDvkbOyoPx7x/0utQ6XcNMFbxVe1mSgtfNCh0TzIQe0kjzj6/p?=
 =?us-ascii?Q?dKLZr4iNHThIVmPOEehGCtobUwM5rxJVHpOIvmmmFr5BDvMuL7kzEdRJIdOp?=
 =?us-ascii?Q?M/DrXmDwZsp3s6l0XI3ceVrDDKREJxl8oL7PIqdZ61bAIIniAQa1qgi5Yv+o?=
 =?us-ascii?Q?4JS4BzWFBZsLF8RIQYgfmDWSbeiDFN4DjFnhfLXCNmi2mmW1QsmXBMeGGX7/?=
 =?us-ascii?Q?41z+mul7PXaBWbpGEpIDbJEzsnY6R5fjI1uYpOcf2bu78m/g0cdMHgcz6ePz?=
 =?us-ascii?Q?YVgbddWgT0TRYSKXFr6pfqYaYE3N9t8nLieVuIIaY/IUGMw4oD1QjRpjMLRu?=
 =?us-ascii?Q?uoOwIbOsb09j5WY8aldwIeJCfVTiVtYIxCNyQxLmWUbAI8UDcdv2X1m7azFW?=
 =?us-ascii?Q?XY9xOhXofU0F2OoCDp7/Lx3I6PSa4FyyWRD6iWBi8G6WhvSbnY0zEkslJbAd?=
 =?us-ascii?Q?90XWOUDlxB48cbbgtoSiyNx/HI4aLyJ6XgzFBtRJlBTFHAeyT5zPIUegJRbV?=
 =?us-ascii?Q?atXxAVblfKHhodLMSvxO37icZcqvwJ8aFTrEOiAkTQ2odoSM3sF43NPwbZvT?=
 =?us-ascii?Q?rNKqRlKbptaoA+aQPV1j5C2KakiLDUkY+EGZqrAb9ff8M+HoURgTROZhiVKP?=
 =?us-ascii?Q?5hqhkIfzDrmrHEQGvIGnMBs2Wxx3pUxaQUsOLwwO4sTm5tLnLOSBNJNCLFVH?=
 =?us-ascii?Q?eyPz5eLLcVnjRZ0rjLiKakM+vS51FlQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eab7004-76af-4d5e-8d25-08de585218be
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:16.0250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMhgfLanPaJln49ZjkKkBnz1pnG18xXQ54tL7WT56MTcMLDHnusEmM/84dVeMGK1Q/bWgp3g2zpmLjMvhUN3ZjewQ0vU18EEvGqOlfyMAoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fc9f8 cx=c_pps
 a=a15oepxCFtbapkdjUscCyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=M42_cgP-e8bZsySOwvEA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: nt3BvZMjIUJVZmmpBf-SIPZAjqdW4NjI
X-Proofpoint-ORIG-GUID: 8ooJSLXwHNovUytm2JmWcu4X_AGj_jSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfXwsPg3id8mg2g
 V7w65htg+bE3rfK6xpKPE2X+XCRR86yBkGRbAeh/nBA92VKUSRqo+oeKYjky4OCQT7FVJfvapKC
 TSuU8yJ2UEhUWmdN1HgQB7LVH4k4QKl2n+oo7K8TY85o2xMf7wWqFKvlHwXTEGlxmCtCRoXo33j
 fhT44IEDhRNfG+7AOGk9EI8FgnkbUMFsNOHod5ZR9XuQvC76Wah1rvdbRlUk1bzRIS+qH6dHtOu
 RbzQ3U1gZ25kXkxmSnBz6Ijr1/eOsXV73tk7Co6Jn7McObizRKGFq0Ll38ADmkI5VnkjpBVecmE
 M70oGKUbtE/NXfFuKKYptHVcmGZwuIYADih18FC1HcfvMGMrQ2eTYIv/vilmYFUVYkR7CcP7qaJ
 fKSPmoUXWcO3CjMXttGKamqGQkxq8vK71pVtbmJvLwewwpXYw646ESHHk+SHSFodaDtczlbXSrB
 9zxJFConSPLxt5Ey4gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229767

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v4:
- Resolved patchtest failures.

v3:
- Removed the DISTRO_FEATURES dependency for installing Rust library sources in the Rust recipe,
- Extended support for on target rust kernel module developmet by installing Rust library sources and
  introduced packaging of the Rust standard library sources in a dedicated ${PN}-src-lib package.
- Integrated Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091)
  that uses the Rust bootstrap tool to install Rust library sources for rust-native.
- Dropped the patch that added rust-kernel to native/nativesdk feature filters in bitbake.conf.
- Updated flags in the make-mod-scripts recipe to fix build failures when building Rust out-of-tree
  module recipes.
- Dropped the bindgen-cli patch extending BBCLASSEXTEND to include nativesdk, as it has been merged
  into oe-core.

v2:
- Combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
- Updated commit message and added in code comments for patch "[PATCH 09/15] kernel-devsrc: copying
  rust-kernel source to $kerneldir/build"

[0] https://lists.openembedded.org/g/openembedded-core/message/228559
[1] https://lists.openembedded.org/g/openembedded-core/message/228560

v1:
The previous series was RFC v4, "Enable Rust support for Linux kernel"
(https://lists.openembedded.org/g/openembedded-core/message/226623).

In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module support"
(https://lists.openembedded.org/g/openembedded-core/message/227281), which builds on top of RFC v4.

The current patch series is a unified version that combines both efforts.
Compared to the earlier series, the main changes are:

-Kernel configuration fragments have been moved to yocto-kernel-cache.
-The kernel fragments have been removed from SRC_URI and from the files directory previously stored under
 recipes-kernel/linux/files.
-Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for Linux Rust sample" by appending
 KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc' instead of adding this
 directly in the linux-yocto recipe.


This patch series introduces Rust support into the linux-yocto kernel recipe
and related build infrastructure in the Yocto Project. The goal is to enable
building the Linux kernel with Rust components and provide support for building
kernel module which is written in rust and also provide support to build
rust kernel modules in sdk.

And this series adds test for Linux Rust sample and also added support for out-of-tree kernel
module written in Rust as well as associated test.

Summary of patches:

- Patch 01: Add required dependencies ('clang-native', 'rust-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 02: Using the Rust bootstrap tool to install Rust library sources for rust-native
- Patch 03: Install the Rust standard library source ('library/') into target and sdk
- Patch 04: Updated `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 05: Add kernel configuration support for Rust (via 'kernel-rust.scc'), enabling the Rust build options in kernel config.
- Patch 06: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 07: split `HOSTCC` flag to align with to linux-yocto and fix build issue with make-mod-scripts recipe.
- Patch 08: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 09: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 10: Added oe-selftest case for the Linux Rust sample.
- patch 11: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
- patch 12: Export artifacts needed for out-of-tree Rust compilation
- patch 13: Prepare out-of-tree rust module compilation
- patch 14: Added rust-out-of-tree-module recipe in meta-skeleton layer
- Patch 15: Fixed buildpaths errors for rust-out-of-tree-module recipe by appending --remap-path-prefix to RUST_DEBUG_REMAP
- patch 16: Added rust-out-of-tree selftest

Patches have been build-tested successfully on:
- qemuarm64
- qemux86-64

Benchmark test-result for x86-64:
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+

The increased in time & fs is due to kernel rust dependencies in
linux-yocto.

Alistair Francis (1):
  rust: Install the Rust source

Harish Sadineni (8):
  linux-yocto: conditionally add clang/rust/bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for target & sdk
  kernel-yocto: enable Rust kernel support via 'make rustavailable'.
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto: Fix for buildpaths errors when rust is enabled for
    kernel
  make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
  kernel-devsrc: copying rust-kernel source to $kerneldir/build
  make-mod-scripts: fix for buildpath issues with rust-out-of-tree
    compilation

Yoann Congal (7):
  kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
  selftest/cases/runtime_test: Add test for Linux Rust sample
  kernel.bbclass: Copy include/config/auto.conf in
    STAGING_KERNEL_BUILDDIR
  kernel.bbclass: Export artifacts needed for out-of-tree Rust
    compilation
  module.bbclass: Prepare out-of-tree rust module compilation
  meta-skeleton: Add rust-out-of-tree-module recipe
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb            | 18 ++++++
 meta/classes-recipe/kernel-yocto.bbclass      | 22 +++++++
 meta/classes-recipe/kernel.bbclass            | 19 ++++++
 meta/classes-recipe/module.bbclass            |  8 +++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 35 +++++++++++
 ...-host-documentation-is-built-before-.patch | 60 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 meta/recipes-devtools/rust/rust_1.92.0.bb     | 15 ++++-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  9 +++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 +
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  1 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb  | 10 +++-
 13 files changed, 199 insertions(+), 2 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
 create mode 100644 meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch

-- 
2.49.0


