Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571F8CD484E
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 20:52:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60937.1778532745203893589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 13:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=XaKsEwRk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9591d0920b=quan.sun@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK7bFH2098010
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:52:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=hicgrWlhHKDIQyALhhMM
	am4sEZGZp8dwCSfvPOPb6aY=; b=XaKsEwRkpOCHTBShYJ19vIjUrOZdRCoJ/KWU
	fkVoM05y7FWsu47tLR3wZwC5t/2++Bhe3xleKevqIEu3BXN24UqZr5iIeuF1Wwif
	wnDL5vO8iS7izxek0YR9V02q7Gt/93ZCkUrpw0rKZ2bz2vzPXgMxhkERVKNG/N1v
	SJC/D4CAtn/ouVgkUcyckQ8SYbDv8uI4PO+TWJPo7uPRBEQYbXFon/7dc7sfnSo8
	nfuahWnjvnC3zQ862MZiOJKRouT1Qp1dgiUPK4TqlbF1YMIYmLu+BaXi1tS/7H/G
	+cny7Nl8t4t76VCBJRkv6IgCeO/XipR6yuwslMC527WP63uprQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012009.outbound.protection.outlook.com [40.93.195.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nv901pe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNKdxo8cVsQTNbjLVvuNXFd6QPw1CtLs/K3vMynMFnJY8VF3TxIOcuo0L9yIBFASce1vQ78xtzk4FLIye+xSsqYRqBhNBMA7voS5bZ89nv9ekcvU+5Nbyf3BoeuZPKcN4RW6zUDLAFJ+DuYZbChAqP+h8JURvLdNyNYtzhNoV9kzMypSCzjO+erGuAIsldgkQZd0Tt1yuEYGfxK00csFhRb1qfEY0XLTemcvSjPiW5WIFOWnzLTB+e1wo8mwcvm0T+U3eYHrJr1uEfYW+gTEQBSx6PxNF9nsiygm4p7fVsZZlQwoKg6Ofh//CIvAiMjXZ6IOyEMA9hUmylvyVGWvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hicgrWlhHKDIQyALhhMMam4sEZGZp8dwCSfvPOPb6aY=;
 b=D0jJlzdcrF4He9Yy2efjLySwIo7679mdP0bgW9uBEVbISnygkAhVEH/fCgycauexlF24Te0DKJVbfxd63MLo/ZzCN+eVfMEW7sfK2vk0X0uvl0HuaRGdgX6XntilzuFgDqx8MsYVN2hFQG+QwAEI4JW8SeoJNkmp1pep70N9w/J0cLe0xQjf5c7IF1NKRfBu6ZPV5O6EHXgvTG3d2AwPUbwPQJN1jlosZSj8d7F0kWYxmSeRMXsyJK3mh89/tsPhQCWDo0xsv1YlITlyKHdTpQpajOgtibcbs9BjOSwnSRTOFGxj6HSw0HAL5VXtB6Dz6UrQy+ObOVIpqj2n19a+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by PH8PR11MB9699.namprd11.prod.outlook.com (2603:10b6:510:3a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 20:52:21 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%5]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 20:52:21 +0000
From: Quan.Sun@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemu: fix iotlb_to_section() for different AddressSpace
Date: Mon, 11 May 2026 13:52:02 -0700
Message-ID: <20260511205209.511914-1-Quan.Sun@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|PH8PR11MB9699:EE_
X-MS-Office365-Filtering-Correlation-Id: 318ea89f-d2e1-4598-3662-08deaf9f3273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|18002099003|38350700014|56012099003|12006099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	n51aJ0R1EDxjpdpZBYK9bZjzKG7wAkee3IOqdpAje6mFn2DhZ2EAY/SOH6KIoPGOGMJumKNiibrCkWFC0d4JgNBGTIBgJV5I9hLInX8OWOWYyfMgdvEqkoEGLdSKoAFby3DrM+I7MMs8nW/69J774Gg3NaiG/n95kObuBmrkhS1Xm0rNkLQYr/e0JIZE1XSkril+jbwKCuA+GcitiMsXwNh0AwpWKEbsQ9gQpJBlgrTgW9upG9DJ2gaJtP94X/Wsv4EuQXMIhQ8e1lNGVdNuKZLTsOnnxEFHHLnO++erVrJST+2yQ26ZFUEckrzw9h4fBbseHaIWL0mAj5VVpKx/keoIPGrWsIV+m94z+Vg2q0qDOGeqMqJ9mYhjsEHnrwcr0QboXei5i5ZxMII2b4g3wapnW2GpVUr9J7wcqa6kg2gPoFLxaWcqwDqvkyHsjszThwVG7rLMl/ovvaLQRCBirD0iv1a9N5K5vj2bo3QnzZNxsCC6gL3yrsW35Jl0Fm39rn09RDhNZd6dPBMTsRYWyep4pSlDCs/jhLrz+wFZWiU3kuJvhY0cazRxMUxWClvDvSe3FpevkTfZKXv+Y0LMXqMWK08FtmeBhniYtlqAcJNSoAv5LOQYmDIcW4Z3BzKVaHPLqK+kpxpP1GDM3qI4S2tM8gdooBvSL4L7zxGSpNX7UR9PNlVzYKqNZjax5Uujykvx0Qnd1vb3UBASHL+I5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(18002099003)(38350700014)(56012099003)(12006099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2ZGWktRVEExVFV4dHRLUDBjR0EyRTJZVi9kZExTQU5EWGxOeVAxK2ZJVUFp?=
 =?utf-8?B?NEI0aDJuUW92K1V1MkZVRmY5YVJGY1B0R2Z2ZWJtblBtbUFMclRkS295WUtX?=
 =?utf-8?B?L0cyajNwR3NjSVhXeHRwbDJ0TmY3UE5zVXdyamw1MkZya2dUbi9oL2JFd0tn?=
 =?utf-8?B?bUNvQUMwKzNXOHh0endvYTZoZGJ5UFZRVTRJMWxvMDFkemFaOHZHa0R5V2V2?=
 =?utf-8?B?Z0YrVjV3dDJrUzg2bitRMXl6Y2hFUVNIangzMWZvTUtUQnpER2gySHMvUUZG?=
 =?utf-8?B?NVZSYlo5ek9ab2Zyb3h3OG02bmdMdy9ZVk4xdnRvOGYwN1BldkI0aG84TWlP?=
 =?utf-8?B?TDBIcVphdHVJZjg1Y1FMbzlZUlJUUFZoczJUR0ZhZHFrdU1lSU5YMUt0NnRp?=
 =?utf-8?B?cXo0ejJiZEU1YzNrUmRTRHVGNDNtZU55dEpFV0p0SUxTVDBjRm9jYzRUSEta?=
 =?utf-8?B?U0NZRnRZa2V6NUZ5SERINGJuM0FlNlU0N25sT1U3a05RODY5MGc4Qk1FWTJT?=
 =?utf-8?B?amNDWk95N0FFTE1aSWZxV0NRajZPKzkvaVpSc2VoV3RIdzIzSmtrM0JhalR6?=
 =?utf-8?B?TXlHaFVFOFBSd2RkMWNPeW1BOXpYaGFEV2FOM3lIUUZWTlp2K1ovVkJCYVBE?=
 =?utf-8?B?WU5YNEQ5dXFUTS83OStxT0dGaHZObjF1T1NTNUVmdkhCandWUmpFa1VlMkl2?=
 =?utf-8?B?QzlBclBqS29oRHZTZUVhMzYxQXNvM0hSYVJtcGxOU2UzcU9SK21HMC96QUpy?=
 =?utf-8?B?QTZLdy9BS3dXRTJlZ3VGM3JkTmhpOHRiekpHM214d3FBM29rSDVsQUxwSWtT?=
 =?utf-8?B?L0h3S3RaUXYwT0pKVjJ5QiszWlNMQ1FGZCtoenQ3UngrNnZzakZPSXBOeDVq?=
 =?utf-8?B?V2tsSElXOUR6THlLblViMkdIakRKZUpGeUFPR25wQVAxaUdyTmc0ZVFaNElZ?=
 =?utf-8?B?dGhxT1BHV25mV2w5RWN6anQ3Z0IyNktrUngvandSN0NkdFhNZ3Y5c1pVQmtn?=
 =?utf-8?B?R29pMFV4YmdYZDdkTUlsZE9PclFhZkI4QzdrUFE0cExDYVFTUFArRi9EWUV0?=
 =?utf-8?B?OFhVb1c0SkRveC85ZXJiaURxZlhHRy9HTVBoRkszZ2FjSE9Ia2h5amQ5MkVM?=
 =?utf-8?B?R0JzcDJvWUxwVzlCSzM4azVOUUQwazFoQWIwdEhjNE1jWVNjS2t4dGJIVTA2?=
 =?utf-8?B?c055Z1FwSlZBQVcwQnZRY1lXVlNMeTdNaURHeHBjaTNlbWpwbjQ5RnBUYmJz?=
 =?utf-8?B?QXQweGdVTWlUcU43ZlAzUmdRMXdNUTE5cGgzSS9Fd0dpaGpZM28vTFkybzM2?=
 =?utf-8?B?ZmtqTkVvVzNDZ3FsWng0RnF6S3VLRTloc2M1cGxYUXlBUWNBQWNLbWRPcFhB?=
 =?utf-8?B?K0tZZGdLSXE0NkJ5MVlsemNSc3VoUDZDWE16bWtjRHh6WSs4blNlQWJnRUlu?=
 =?utf-8?B?SkpOODRmMERDRjNUeldOMmprZjhnUUlDTmN2MVZUVnZ5MVFWT2FHQjhVNGVO?=
 =?utf-8?B?eVI3NktvYWRDTWhvSWF0UjdwbG56dlBTVU9HZlQ2WG52NTlGMVYvckwwUktK?=
 =?utf-8?B?NGZqSEhmSUZkekNIZmtlREl4SHd1YW9nSG1wMVd5emVWRmZiMGw5VjE2YXc0?=
 =?utf-8?B?QXZ1QXBjQm5TeGlMYWNEczYwNzFubEEzVW1GZmJreGpNWmgvNzVMNERDRmJG?=
 =?utf-8?B?MEdKb2t6ZmFhL2E3cXNCNHFzZzdNK2R3S2tnZGJsSGlRcTQ4NHpvOFI4NU4r?=
 =?utf-8?B?WFMwdnhOaUpCOTd1aHZ6Nk5GL29meGw3M3NKT1lLd0NadU56dTFic29ma1Y3?=
 =?utf-8?B?Y2QwemQrbE9mak9PbGhnOWhEYkVwbjREdUlOYlgyNmROUHZ1WG12MnM4N01R?=
 =?utf-8?B?Q2JJVFIxVUVTMlZaY0VXWjdycWJmdWNjdlVZcytUT1F1WWI1OTA4bjEwenRm?=
 =?utf-8?B?SlBmTy90Tnp3TXNYcUJNRmtFU0dKMk1vQi9QeFVTTkFiMUJLdnhaTmV6d0l1?=
 =?utf-8?B?Z3o2TmhFcnlmUjJxWTJkR29BZXQwY20zV01EM1QrY0crdDhaLzQ1SlRsS2p3?=
 =?utf-8?B?S08rUEZXRFI5WWsxOVNBK2NSMnlDSXNpMHIxOWVtbmZKdzlORjdJSU5sbVBh?=
 =?utf-8?B?c2gwT1g0VFFac0hrb2lrTmRieHFsOGJPVnhsaW1jNDd2VXhKZ3VsU1R0L0RZ?=
 =?utf-8?B?cmJlWklVQVE3N1phZG44S2NQUlM3b0xMZXh2OE9SWnd4VmN5QjRvYjJxWndo?=
 =?utf-8?B?dThUbVBHYjFxcHRLVXlVS3pvR2FKckJrRkpSdjJubWl0Y3lxOVM0NCtrWUZH?=
 =?utf-8?B?SmZ4RVFhNXZNT1R4QU44RFk5NVhqWmpZckVVaUhpY0JzaDBMTmZwZz09?=
X-Exchange-RoutingPolicyChecked: 
	ABGSu/89pkS5/Orhi/+FKFVw0vnPvrTwlOStLMDzjIFnZRNeQiN5+2fErrkfz9cc9LX4zobDX/pYx9zP5S6pw+6Bmj5vTeuOUzPjvJ7OMtXd2IOcXomZx8ZT8BgqQNr2KNFWSGmMd1xJ5gsfoek3eToSU+Lx6je6GvtC3IolHXvj62T6dhfVBqYxgNsNpFCFQ4wluahhLkulgbDe+/ITX+BtQVxSkcPTNw0WyMQZrHsI9Q9H2JASvEMECzv4PP+loj1HbdKxZtyqrFrM1isCYMBYcGHJVwp0HU/3HZgsO9/vctkTaMNqUz6jTKxsq6d9sAhMFYpGoT6j9Hi0g5L5jA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318ea89f-d2e1-4598-3662-08deaf9f3273
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 20:52:21.6195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXV5yexAlz/AfnnXRKieUX71MlQeSC8GqpOmQlWwCmnUxtT/AX7OTKPfIWbdO6maShx/tA9jNw8uCCDN/Ne1rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9699
X-Proofpoint-ORIG-GUID: P1Acn8vpSzE9o6fM9zBqJZ8ctd42hyM7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIyMSBTYWx0ZWRfX4w5qWDJ0rmud
 Pe2XqlSoTdliGTNK1pZhK90RFWsuabh2yIplPrywm/CEsZeyQnxovRLbrwhA28NuKwCqvqFVVPg
 WcTBjrUl+qN8TIgRT6n9qbSavBsFO7sA9cBJekpP6PXoqpkN6anlLRzaD5uYOqbZed8KTaVL71m
 92rKMxCZA7uvhLkZC8nbFqkrnpaQcFrJ2tgrGl7/zTS5D3jWOdyY9ldg75amYjsYwEZt3aUqMlT
 Pxs4/0sJmGHf77W6gUYVblUt2x43uARgJKzmWRPzyT7sULUnM0TRWiKm3EtqR7Yk/MFXZP7VbYm
 NBzckntjrdFQ7SR7OJ9fmJm8xmPrnl1tj9GBP0Ga+luD3cXEbnTuv9XPwLwYCnW/xb3gG6KSeKS
 333hDPT/nJNspj8Yb9EBkD/9Hqxx2uUz7FbXecVh4sAFcSC4JV+mNOzRd/lxnfiVJaf8b63HwcM
 AopN2fzIwu7OctQSNVw==
X-Authority-Analysis: v=2.4 cv=OaWoyBTY c=1 sm=1 tr=0 ts=6a024188 cx=c_pps
 a=BFxEMT9/7ApEM+sm6hv7VQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=iGHA9ds3AAAA:8 a=ID6ng7r3AAAA:8 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8
 a=pFyQfRViAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Kx-MaSyPPxUFOBmZgMUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=AkheI1RvQwOzcTXhi5f4:22 a=FdTzh2GWekK77mhwV6Dw:22 a=oJz5jJLG1JtSoe7EL652:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: P1Acn8vpSzE9o6fM9zBqJZ8ctd42hyM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110221
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64BK7bFH2098010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 20:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236838

From: Quan Sun <Quan.Sun@windriver.com>

Backport upstream commit 854cd16e318e ("accel/tcg: Fix iotlb_to_section()
for different AddressSpace") to qemu 10.2.0.

The bug causes incorrect memory load/store when CPU access goes through
an IOMMUMemoryRegion that returns a different target AddressSpace, and th=
e
fix replaces the section_index lookup with a direct MemoryRegionSection
pointer stored in CPUTLBEntryFull.

Note that the fix primarily targets ARM/RISC-V, but since it eliminates
iotlb_to_section() and performs the lookup based on CPUTLBEntryFull,
it may also help address some currently observed QEMU boot issues
on x86, e.g. the https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1625=
9.

AI-Generated: kiro-cli

Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...tlb_to_section-for-different-Address.patch | 274 ++++++++++++++++++
 2 files changed, 275 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-io=
tlb_to_section-for-different-Address.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 7aa593bc5d..a8b4a1a541 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-f=
or-.patch \
            file://0001-linux-user-elfload.c-Correction-to-HWCAP2-accesso=
r.patch \
+           file://0001-accel-tcg-Fix-iotlb_to_section-for-different-Addr=
ess.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_=
section-for-different-Address.patch b/meta/recipes-devtools/qemu/qemu/000=
1-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
new file mode 100644
index 0000000000..d19f872fc3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section=
-for-different-Address.patch
@@ -0,0 +1,274 @@
+From 858e6bb252e075e09cca6e78299151d3af0bf5fb Mon Sep 17 00:00:00 2001
+From: Quan Sun <Quan.Sun@windriver.com>
+Date: Tue, 28 Apr 2026 14:56:36 -0400
+Subject: [PATCH] accel/tcg: Fix iotlb_to_section() for different Address=
Space
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+'CPUTLBEntryFull.xlat_section' stores section_index in last 12 bits to
+find the correct section when CPU access the IO region over the IOTLB.
+However, section_index is only unique inside single AddressSpace. If
+address space translation is over IOMMUMemoryRegion, it could return
+section from other AddressSpace. 'iotlb_to_section()' API only finds the
+sections from CPU's AddressSpace so that it couldn't find section in
+other AddressSpace. Thus, using 'iotlb_to_section()' API will find the
+wrong section and QEMU will have wrong load/store access.
+
+To fix this bug of iotlb_to_section(), store complete MemoryRegionSectio=
n
+pointer in CPUTLBEntryFull to replace the section_index in xlat_section.
+Rename 'xlat_section' to 'xlat_offset' as we remove last 12 bits
+section_index inside. Also, since we directly use section pointer in the
+CPUTLBEntryFull (full->section), we can remove the unused functions:
+iotlb_to_section(), memory_region_section_get_iotlb().
+
+This bug occurs only when
+(1) IOMMUMemoryRegion is in the path of CPU access.
+(2) IOMMUMemoryRegion returns different target_as and the section is in
+the IO region.
+
+This patch incorporates prerequisite changes from upstream commit
+94c6e9cf0440 ("accel/tcg: Send the CPUTLBEntryFull struct into
+io_prepare()") needed for the fix to apply cleanly.
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/854cd16e318eed12de2995014b28d9f374c64bf7]
+
+Signed-off-by: Jim Shu <jim.shu@sifive.com>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Tested-by: Mark Burton <mburton@qti.qualcomm.com>
+Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
+---
+ accel/tcg/cputlb.c        | 32 +++++++++++++++-----------------
+ include/accel/tcg/iommu.h | 15 ---------------
+ include/exec/cputlb.h     |  4 ++--
+ include/hw/core/cpu.h     | 17 +++++++++--------
+ system/physmem.c          | 25 -------------------------
+ 5 files changed, 26 insertions(+), 67 deletions(-)
+
+diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
+index fd1606c85..fa0f4d8b3 100644
+--- a/accel/tcg/cputlb.c
++++ b/accel/tcg/cputlb.c
+@@ -1089,7 +1089,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
+         }
+     } else {
+         /* I/O or ROMD */
+-        iotlb =3D memory_region_section_get_iotlb(cpu, section) + xlat;
++        iotlb =3D xlat;
+         /*
+          * Writes to romd devices must go through MMIO to enable write.
+          * Reads to romd devices go through the ram_ptr found above,
+@@ -1140,10 +1140,9 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx=
,
+     /*
+      * When memory region is ram, iotlb contains a TARGET_PAGE_BITS
+      * aligned ram_addr_t of the page base of the target RAM.
+-     * Otherwise, iotlb contains
+-     *  - a physical section number in the lower TARGET_PAGE_BITS
+-     *  - the offset within section->mr of the page base (I/O, ROMD) wi=
th the
+-     *    TARGET_PAGE_BITS masked off.
++     * Otherwise, iotlb contains a TARGET_PAGE_BITS aligned
++     * offset within section->mr of the page base (I/O, ROMD)
++     *
+      * We subtract addr_page (which is page aligned and thus won't
+      * disturb the low bits) to give an offset which can be added to th=
e
+      * (non-page-aligned) vaddr of the eventual memory access to get
+@@ -1153,7 +1152,8 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
+      */
+     desc->fulltlb[index] =3D *full;
+     full =3D &desc->fulltlb[index];
+-    full->xlat_section =3D iotlb - addr_page;
++    full->xlat_offset =3D iotlb - addr_page;
++    full->section =3D section;
+     full->phys_addr =3D paddr_page;
+
+     /* Now calculate the new entry */
+@@ -1269,14 +1269,14 @@ static inline void cpu_unaligned_access(CPUState=
 *cpu, vaddr addr,
+ }
+
+ static MemoryRegionSection *
+-io_prepare(hwaddr *out_offset, CPUState *cpu, hwaddr xlat,
++io_prepare(hwaddr *out_offset, CPUState *cpu, CPUTLBEntryFull *full,
+            MemTxAttrs attrs, vaddr addr, uintptr_t retaddr)
+ {
+     MemoryRegionSection *section;
+     hwaddr mr_offset;
+
+-    section =3D iotlb_to_section(cpu, xlat, attrs);
+-    mr_offset =3D (xlat & TARGET_PAGE_MASK) + addr;
++    section =3D full->section;
++    mr_offset =3D full->xlat_offset + addr;
+     cpu->mem_io_pc =3D retaddr;
+     if (!cpu->neg.can_do_io) {
+         cpu_io_recompile(cpu, retaddr);
+@@ -1335,7 +1335,7 @@ static bool victim_tlb_hit(CPUState *cpu, size_t m=
mu_idx, size_t index,
+ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned siz=
e,
+                            CPUTLBEntryFull *full, uintptr_t retaddr)
+ {
+-    ram_addr_t ram_addr =3D mem_vaddr + full->xlat_section;
++    ram_addr_t ram_addr =3D mem_vaddr + full->xlat_offset;
+
+     trace_memory_notdirty_write_access(mem_vaddr, ram_addr, size);
+
+@@ -1592,9 +1592,7 @@ bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, =
int mmu_idx,
+
+     /* We must have an iotlb entry for MMIO */
+     if (tlb_addr & TLB_MMIO) {
+-        MemoryRegionSection *section =3D
+-            iotlb_to_section(cpu, full->xlat_section & ~TARGET_PAGE_MAS=
K,
+-                             full->attrs);
++        MemoryRegionSection *section =3D full->section;
+         data->is_io =3D true;
+         data->mr =3D section->mr;
+     } else {
+@@ -1980,7 +1978,7 @@ static uint64_t do_ld_mmio_beN(CPUState *cpu, CPUT=
LBEntryFull *full,
+     tcg_debug_assert(size > 0 && size <=3D 8);
+
+     attrs =3D full->attrs;
+-    section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs, =
addr, ra);
++    section =3D io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
+     mr =3D section->mr;
+
+     BQL_LOCK_GUARD();
+@@ -2001,7 +1999,7 @@ static Int128 do_ld16_mmio_beN(CPUState *cpu, CPUT=
LBEntryFull *full,
+     tcg_debug_assert(size > 8 && size <=3D 16);
+
+     attrs =3D full->attrs;
+-    section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs, =
addr, ra);
++    section =3D io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
+     mr =3D section->mr;
+
+     BQL_LOCK_GUARD();
+@@ -2521,7 +2519,7 @@ static uint64_t do_st_mmio_leN(CPUState *cpu, CPUT=
LBEntryFull *full,
+     tcg_debug_assert(size > 0 && size <=3D 8);
+
+     attrs =3D full->attrs;
+-    section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs, =
addr, ra);
++    section =3D io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
+     mr =3D section->mr;
+
+     BQL_LOCK_GUARD();
+@@ -2541,7 +2539,7 @@ static uint64_t do_st16_mmio_leN(CPUState *cpu, CP=
UTLBEntryFull *full,
+     tcg_debug_assert(size > 8 && size <=3D 16);
+
+     attrs =3D full->attrs;
+-    section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs, =
addr, ra);
++    section =3D io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
+     mr =3D section->mr;
+
+     BQL_LOCK_GUARD();
+diff --git a/include/accel/tcg/iommu.h b/include/accel/tcg/iommu.h
+index 90cfd6c0e..547f8ea0e 100644
+--- a/include/accel/tcg/iommu.h
++++ b/include/accel/tcg/iommu.h
+@@ -14,18 +14,6 @@
+ #include "exec/hwaddr.h"
+ #include "exec/memattrs.h"
+
+-/**
+- * iotlb_to_section:
+- * @cpu: CPU performing the access
+- * @index: TCG CPU IOTLB entry
+- *
+- * Given a TCG CPU IOTLB entry, return the MemoryRegionSection that
+- * it refers to. @index will have been initially created and returned
+- * by memory_region_section_get_iotlb().
+- */
+-MemoryRegionSection *iotlb_to_section(CPUState *cpu,
+-                                      hwaddr index, MemTxAttrs attrs);
+-
+ MemoryRegionSection *address_space_translate_for_iotlb(CPUState *cpu,
+                                                        int asidx,
+                                                        hwaddr addr,
+@@ -34,8 +22,5 @@ MemoryRegionSection *address_space_translate_for_iotlb=
(CPUState *cpu,
+                                                        MemTxAttrs attrs=
,
+                                                        int *prot);
+
+-hwaddr memory_region_section_get_iotlb(CPUState *cpu,
+-                                       MemoryRegionSection *section);
+-
+ #endif
+
+diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
+index 9bec0e789..16f866990 100644
+--- a/include/exec/cputlb.h
++++ b/include/exec/cputlb.h
+@@ -43,8 +43,8 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_a=
ddr_t length);
+  * @full: the details of the tlb entry
+  *
+  * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
+- * @full must be filled, except for xlat_section, and constitute
+- * the complete description of the translated page.
++ * @full must be filled, except for xlat_offset & section, and
++ * constitute the complete description of the translated page.
+  *
+  * This is generally called by the target tlb_fill function after
+  * having performed a successful page table walk to find the physical
+diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
+index 961505177..a3db3f66f 100644
+--- a/include/hw/core/cpu.h
++++ b/include/hw/core/cpu.h
+@@ -214,15 +214,16 @@ typedef uint32_t MMUIdxMap;
+  */
+ struct CPUTLBEntryFull {
+     /*
+-     * @xlat_section contains:
+-     *  - in the lower TARGET_PAGE_BITS, a physical section number
+-     *  - with the lower TARGET_PAGE_BITS masked off, an offset which
+-     *    must be added to the virtual address to obtain:
+-     *     + the ram_addr_t of the target RAM (if the physical section
+-     *       number is PHYS_SECTION_NOTDIRTY or PHYS_SECTION_ROM)
+-     *     + the offset within the target MemoryRegion (otherwise)
++     * @xlat_offset: TARGET_PAGE_BITS aligned offset which must be adde=
d to
++     * the virtual address to obtain:
++     *   + the ram_addr_t of the target RAM (if the physical section
++     *     number is PHYS_SECTION_NOTDIRTY or PHYS_SECTION_ROM)
++     *   + the offset within the target MemoryRegion (otherwise)
+      */
+-    hwaddr xlat_section;
++    hwaddr xlat_offset;
++
++    /* @section contains physical section. */
++    MemoryRegionSection *section;
+
+     /*
+      * @phys_addr contains the physical address in the address space
+diff --git a/system/physmem.c b/system/physmem.c
+index c9869e404..a21e7ca64 100644
+--- a/system/physmem.c
++++ b/system/physmem.c
+@@ -748,31 +748,6 @@ translate_fail:
+     return &d->map.sections[PHYS_SECTION_UNASSIGNED];
+ }
+
+-MemoryRegionSection *iotlb_to_section(CPUState *cpu,
+-                                      hwaddr index, MemTxAttrs attrs)
+-{
+-    int asidx =3D cpu_asidx_from_attrs(cpu, attrs);
+-    CPUAddressSpace *cpuas =3D &cpu->cpu_ases[asidx];
+-    AddressSpaceDispatch *d =3D address_space_to_dispatch(cpuas->as);
+-    int section_index =3D index & ~TARGET_PAGE_MASK;
+-    MemoryRegionSection *ret;
+-
+-    assert(section_index < d->map.sections_nb);
+-    ret =3D d->map.sections + section_index;
+-    assert(ret->mr);
+-    assert(ret->mr->ops);
+-
+-    return ret;
+-}
+-
+-/* Called from RCU critical section */
+-hwaddr memory_region_section_get_iotlb(CPUState *cpu,
+-                                       MemoryRegionSection *section)
+-{
+-    AddressSpaceDispatch *d =3D flatview_to_dispatch(section->fv);
+-    return section - d->map.sections;
+-}
+-
+ #endif /* CONFIG_TCG */
+
+ void cpu_address_space_init(CPUState *cpu, int asidx,
+--
+2.43.0
--=20
2.49.0


