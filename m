Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F42AEB7EB6
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:27:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14949.1772620022689630844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=i4Asl/6U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523de4f93=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62470Wbw2212747
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 10:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=4Y4Mc+83+vkgMbEAVKZ9dMTyKB43fihZwHE2pD29hbE=; b=i4Asl/6Uulri
	zPkRIx/Y3owt/b+QjQWq54GcSHX+rUkA31THSS6F0HaE4EQEpiJyBhjZxP2th/0N
	xSoTlEHK4zT3JGPklS6jYl9xdShmgthw4CPjY2v04XFl047SqlwWjds+jsyOl7kl
	kqy9Qjbv3UG61j81FlhLwL/kUOFupoNVFHvvb/K3QJwNoos3qWYZG+8AYCwj5Q7P
	6qa43V6/E8eJyz/LV/cq2v+fS0YoGXetCdBosSQnFFDc21FMtrAQYgKRlURiSirN
	3PY1NcQMiZlCYsO4E1zGJcyrdpq8nMscG64xpM53sY46hwAV6Vz7nLIGsG9+6wuh
	ZHe7OigMxQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvn1bk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 10:27:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEozd4+nzlgy7pELPDKWja+iQI52ZbbPOxdY4e60LreqjNddsK/OdpqbC/QGmxj1oRv8GtNcv5WQ6C2mimxUALnNb/yoZcLEEn+oHH96Ixj5oV5h5j5DkrWcmmDW29fCS4IhybgWr48dfaCAkLLdcTgPoDJ/jFQiIl2aosdAvxhYOWuleRAJJRP/58wL6DXQmmZlCE86WGr6OeRAkTO32WSiX4+0Z+j/Nf9NUlVefdKhAC+6r8agcszkibgEVva/xwqpaU/eV6/OlL9huyJCK1irt+qrqLu6qDsPd616Y8heOF2zD7cgMoOPwdr1WuM60HjNOM7ZwYEYiw6qUhZksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Y4Mc+83+vkgMbEAVKZ9dMTyKB43fihZwHE2pD29hbE=;
 b=JHQ89yul+rfJLnXHZP8KiObZbxd6X2yneTG5OAD+ZMIPYLJk3XQOw7ZVA6DeFOnv1v1eRdWLaEjIf/X3sh+vJThL+TC1kb+1n26/xBvQjYxF+kRmm2TzKmDKyMiWaA9p1R9ofcqyp9QBD6/UdlctEP6E2H75ybzK8h61kQtu8VAPJui3pJIje5DpE0nLzaOM1rx6hwqdzTqJGgSx+56jrVERT0qRFcfVvf71NEMnKQrhaObxHVJBvmn1gbLfSs3oI9Cz/pS6lVn+49rHOCbKg/kYqIIFQpXNnfeFlZ3wpWDUbdYpbVfPAspQTpzScfS0EDmABjgK0nsq64nQciwBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 10:26:58 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 10:26:58 +0000
Message-ID: <5907e0aa-332d-4a4d-80eb-a7d8e02fc747@windriver.com>
Date: Wed, 4 Mar 2026 18:26:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 02/19] ncurses: upgrade 6.5 -> 6.6
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
 <20260303065640.2541884-2-hongxu.jia@windriver.com>
 <DGTU8O5LFUJI.34TT9V1SM5Z8U@bootlin.com>
 <189994AF67AC963D.971272@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <189994AF67AC963D.971272@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0113.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::10) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS0PR11MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4e3f9d-6296-42a6-e446-08de79d890f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	z7M5EwiBRQc/IRF7UDxRb/AxXES/ZKPhoIiZRRpAyqAQ9YuAy23L96BFLo7uIxeJe/cpSOFwzyTdv4LRL/zkjPZUaAewuXE/x6P4LgeftSjfueXcI3mKCoOiyvH+JpqQY1eTACWq/Ef8NAqoYEhmEPeFqirYlBFqWsG9pvMBamEJZaWf+wMq/0/eNUglQqj9mROkXf13PXHrUe/oVP53LgwTeZCPi+YTww9q6i80ETAp7yFW6ap0J6d+56xRLhbGPCesSYUdTVDgdulZdzYEmtXy6Xb5Tc7TV3RY6S+avm8wTrO4nrIcJeOjX1gcrEtv04FHXNRS24AFntYrWKI/mSkVfHpMfg/qOVdQvZOjcNpFEyfa/Mx9kx1UkHLHDvR8TwC/i2LPmcaa/dTE9dU1ko0q6lTVIqWYBe4EhHqsWEAPCBTXPzvVziRpr2WG8vKgwNr9VBxdqYmQGV2JOaudO+t39fjxcoeYXv84G91bmVfUmH6pNNcBgfAHO0IHe6izrC9JGe0k35v6lqaZlhc508md/j0gTsdH6DOPYdoGFSSxHFRzj1qd+pP2GzDp5juRCIiqQqaW6bUevdrJCY1MzpUvrStGKRPCMgzabXi1UZKkG6CMi+BIvjWyFBhkWgL2WjMTbxQk9gMWlKF33oswn1xnQr0ysakifBQ27SRmdWE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlJ5QjlxZXVIWW02UXBIdndnVERWVGI3SzhYdUlQSWErV0VOMkxzbEQ1bTZ0?=
 =?utf-8?B?bVJCVThQTXUwR1llTmhnRGdLK05SSjY3VEFMM29ZZkIxRGcwZHgvbnh3RzFH?=
 =?utf-8?B?ODRkSDlSbHRpN0c0V2Q1TzE5WWNXdVRHS0o3WWQybE9mUUNVeUpvS05keHRR?=
 =?utf-8?B?RFBhK0VVZHh5VTd1MHVRQ2dJOWIrSVdpM3o5Umd6TnZQMXFhTzltQU1TZ2F1?=
 =?utf-8?B?TzRzQnV1T0NEKzZFaTBZQW9UZU5kc28xbWN2cFBVV1VuaGtmajZqVGREMGVG?=
 =?utf-8?B?Wlh5elpDUDVlTEJNWGRtTnRQalVLZ2FWelhhUTdKMHFHNnVOLzBJUU9yN2k3?=
 =?utf-8?B?ZVBhMFJiczBpOFM4dkJlUVd0djBUbmFwMEUvaUIySGtVU2NsWkU0OE5kOFVq?=
 =?utf-8?B?ZXFHTlFwcnFFbmUzNmhhbVNuZkZkNG5sMXBiMEJVUlVMMSs5QUlDZ21qSFpX?=
 =?utf-8?B?aXR1WHpKRnBabmxPcldUT3prRmpKNk5xbEhnQk9wTXdjbDRQaUNpSTBUMmRh?=
 =?utf-8?B?VkI4c2RkZStsSk43K3pGcGtxZXlZdXdlSmQ2Lzh1Wkh3ZW9WOGJiUUhTcEhs?=
 =?utf-8?B?S215NVhhb29Eak9MNGt0TVFpbGVuS1htaWZrd1VaSXlNYS9kanAvM2FRbHFL?=
 =?utf-8?B?WER2VmR4eEZOYlhZb3dOcTU1YzdIWUtEVVlVUHVZZlhwQ0RqdTVhZHExL2t4?=
 =?utf-8?B?VEVVSGJIdUY5aU1UcG1xdFBhUEZQdWR2TEhTQUJSRXFrZmVJWUQvVldCd3BC?=
 =?utf-8?B?TmtvK0xjZStUYkx2bDZIdWZ4WDlVWEJHSFE2Wlllc3BpcVNtbmNTZkpqY1FQ?=
 =?utf-8?B?Y2ZES0htaVBGQldZYU52TUZWTUN4Rnhiek1icDc0SHZaaVEwUjh4N2dsd3A3?=
 =?utf-8?B?RGV3OE43RDZWSFVWd1NrQ29oY3RDNGFoTS9FOHAra2t4dndIcjdvM2FCeEs0?=
 =?utf-8?B?VkJBUHdrVllveG5LRHNjVCthRVZvd1dFQ0NZdlhqQmhxc3F4SEFkNXl2ZzRr?=
 =?utf-8?B?Qm5makExazV6TGNHSGdLZGRaTGVOajBMa0dGcEdlbjVVOWFkVnl5UWVKRnB0?=
 =?utf-8?B?aG5VV0xYUTNqbUtJYXBKU1VYbUpEZTJRWVRCQ0VZZ3puL2txQUVUcmoyNHBY?=
 =?utf-8?B?WWRCVnVSK3VyOXRocVdNQTg5VmZJbXpwZkRwNmR6RTUyZGpFQVo4RFc3N01N?=
 =?utf-8?B?TmZaWGZVMjk2bExYVVlpNHZQUkljOEJncmJ1NWtWcEZLRW1BRWhnOHQ0TUo0?=
 =?utf-8?B?aytKUFd4b3JjWlNpOVpDMVRsZExkOEJDdHBhWUU5RlBwL1RReTRrWHBYU3Bk?=
 =?utf-8?B?OTVKd3ZiOHZaVWxYS1hzbEpJWTQ1SEI4cHFoY0xMZVJMUW5wMGNoNDlhc3Ro?=
 =?utf-8?B?aGlqMnNiSldRRWlHSjFIdzQ3T2QyUGQ1S2ZjWWJvNlpKYlJlVnpBK2s2TEJH?=
 =?utf-8?B?VEYwVFJybUZpZCtmNjZhU3dJbjRpVmpJT09SVnlkQWwwWUExMXo3V3QwSlJE?=
 =?utf-8?B?ZUdQd2dBbUdHL2lvcjdrbkI5WjBPdGtpS0F2OHBqQ2JoNzJMeGVSWlJ5OENq?=
 =?utf-8?B?YklyS05DRldvaE45YWNRVTRidk9Jc25vaVd1emF0ampubGVVZVNrdmRISWRH?=
 =?utf-8?B?VjdQZ2UraVRHOVF1SFFyOXRrWUlKZHNUUXRES3ZpOHVQVUlnWU9Vd05TdkV3?=
 =?utf-8?B?WUlFV2dzV2hDalpGU1I5VU1ocGs5MWFzUmh2RnhmTyswS3VlZzhHbVBWSTFX?=
 =?utf-8?B?djJwTHROVzJMWE1YK3c3MlhsczZwb0VSa0YxWDhjN0N6cGxieU90ZjFhcWM4?=
 =?utf-8?B?M25ZZlZNdnhnVnVHbForOVZaUFN6NTJiVmg1cnRGeTdWWVB0YUxwZHVRT2tq?=
 =?utf-8?B?bFNOcy9pSGlNUTN4cURDVG1iRUg0S1J4dlBBbGYxRVNOWDdaZVZpSVlFL01i?=
 =?utf-8?B?bm42d3lKUmVacE1WeEM2cTdLRXFpZ3RzTituand1cithcVVqZ0wzSE1uUE1t?=
 =?utf-8?B?NzRySVVRV2kzQU52K1ZqcEVyaDFSaTkxSUZ2aEpEa2dMWU1TYXF6S0tBdUxU?=
 =?utf-8?B?aEpkZTNJMWI0YVhOaHhpYVJ2aktMYU1kcGxyOXdVWFlhUFFvaWNKR29iaVE3?=
 =?utf-8?B?WXA0U09BZDdkM0g1T1ZiYXg2ZU5neEJzTFVVMXRDUG1lNjhLS3FLZGdLQ1px?=
 =?utf-8?B?WXZZQzdZRGEwTFN2dzZwUEdONEQwalc1dWlRRDBuK3kzYjRqOUhaSVo4c05P?=
 =?utf-8?B?WjRNdFNZTDVLUURvZE04NE5xNTBVOFpRVFl3MDQvTklRWW5VeDF5UUdEVnIy?=
 =?utf-8?B?V25FTi82ZCtBUnBoa0I0a0cyNEpzcThncUFSRVBjYVpCNktlZ1VVSzliZ3dz?=
 =?utf-8?Q?6MXqGKzpMSKuOS3s=3D?=
X-Exchange-RoutingPolicyChecked: 
	CDncPs0XT8QwKfb2Aw5nvWhgg5k4iU3IeqbsiYAQSMpuSJ3YInEbP5cFeNLdMXN/cu19DIdTg8xlSW0grbTqMG3xNHHkjYk1wlrt/CtiSBVWcNn6Nqvfoe3UhSDKh1SqiSQi+MKTK7AQtE27TQbhECxHqcYbwuAL5JPdMQeV8j6P89yYTzh1gYse2bSAf/fspyYZRrzKAZDwYegESA2yXGrmFkynY+U7ywttaKkpHTsii4XfV1jvHlQdm18eo56/g6V41bM53l5QeUDaF3oLIHd9V93qVdzkWBwsN1MFacDkzRjkNqeZDwdeyu7ymYp760rcCbG729HS37j5gEbxfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4e3f9d-6296-42a6-e446-08de79d890f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 10:26:58.6775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QdVrdH3hXyWrmfi6SEtdka6rwxyRb6zIDnwS2Q44Zt5wOFCXXt7IRSovxYspY7Ws8swqfjjkt3LFFOhNlMgmFAZBmR+IL9VO/lYJI0mWOno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 4X1_Iz09Ed-NjdLZfFYfcibL9wXKifBW
X-Proofpoint-ORIG-GUID: qHsjM2uhXcOd7u4FeTzT1Z06ipqanDek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4MCBTYWx0ZWRfX0djvd2guhHb3
 35xQvl0l833LWDFD7YPiJb8ua9bXv0tG0hGxH39rc/exUbUbFRIgbmKR+Fd8wnnGAA+0siqibXR
 SEn7hlBYaCciqFZ21oLa9Ew75qedAAiPqG9T97k+Zv+V0S1/Z7IFGZ39L3TzVHPp+e20fNKBCI0
 RSQRxBOsiNeKYawZrB+TjOLy8lS4beq8lgDqJqFbHn1Zz45eDJrf7pzgTxzM6dqTzK7pkA7RPfF
 lCWMyRG+Y4BleAipCtlS1EJCLzIBQngeHmKlXuWH7BqGAlsWtxcY860+D7NKDVjH5CLH4GC9EQm
 8oxxkU/IBPK3KeVGFctBWn97QUgGXg4nSWD8FVJWMNAK3RBDWQXJFthnqqFJwksJKrSxWU5GTm4
 euN8qfdF067AfZSVgvbp7NUV4+oSkz6eCswFKQEu+AR2lv/fOQvppX0C2MDqEMsCZvPzfbw1hoR
 cVrZAj0U6Vv0beg051A==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a808f5 cx=c_pps
 a=OPuTCcLOD/60NKbq+Taa8g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=mDV3o1hIAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=n0EJvW4DrmCS9BOSgxoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040080
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62470Wbw2212747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232358

On 3/4/26 16:03, hongxu via lists.openembedded.org wrote:
> On 3/4/26 16:00, Mathieu Dubois-Briand wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> On Tue Mar 3, 2026 at 7:56 AM CET, hongxu via lists.openembedded.org=20
>> wrote:
>>> License-Update: copyright years updated
>>>
>>> Delete backport patch
>>> - CVE-2025-6141.patch
>>>
>>> Announcing ncurses 6.6:
>>> https://lists.gnu.org/archive/html/info-gnu/2025-12/msg00010.html
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>> Hi Hongxu,
>>
>> Thanks for the upgrade.
>>
>> We have some QA error about installed files:
>>
>> ERROR: ncurses-6.6-r0 do_package: QA Issue: ncurses:=20
>> Files/directories were installed but not shipped in any package:
>> =C2=A0=C2=A0 /usr/lib
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/326=
9
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/312=
3
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/328=
9
>>
>> Can you have a look at it?
>
> Copy, I am working on it
>
Please drop this patch, v2 incoming

//Hongxu

> //Hongxu
>
>> Thanks,
>> Mathieu
>>
>> --=20
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232353): https://lists.openembedded.org/g/openembed=
ded-core/message/232353
> Mute This Topic: https://lists.openembedded.org/mt/118109840/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
hongxu.jia@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


