Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232C0E77188
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 03:10:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2002.1735096243435061164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Dec 2024 19:10:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208980716c=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP2uADR003286
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 03:10:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn8bj3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 03:10:42 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BP3AfOu023388;
	Wed, 25 Dec 2024 03:10:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn8bj3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 03:10:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKfn4/urqEkOt4/P0QxZg4cV9WGw6DhO+HGy54uMEVkRPUfT/PkYk7Ukmi3/U4zC6ViF83A3S+und9iSNnbhHknALPnN1qEJdQetKbogGa1Q8rNeReOGdEhsceEtYGioxglB71oPSohbN55OjowBJa14m+h7b1K9tUZou/ULRIDojcx7xZD44Q4f52g8xFc9U4VUpz0UHYvdtpeyXHoGoLHmimHETKJh0qLX7ffiFVQJ1x95FDQwj+smF2EJM8bIpbjqCGRPdiQddvnduFWDxv3X0d4NxsSGlK5OO1KxusR71kBXUPmSMiw4Rr61mWorfdnhR/ShOT/cV8Zbo1Pi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpVHvBKbJpHLybCBxmhVqj3x+hJLnA3RdA8kmdQgEQw=;
 b=IBt/mNH90YRXsuoLZynEfUI3QmN/HKNdEs7m55UOg/y3uAZoQrQNHHrU19y7iy2c5eDTlTMyue4yqTP6hC1jobSCbtoi06WAffw9UbWihzqXHy4bPwhF95Ns+LqhgOUPuLHt8u8YKlGrvpSN7drTH4UUpowiL7iwggQJL5Vb0aoqTC2yTR59yFUF4OoOQBc1e8PVXepo04xRYJD+2BBwlCUkrq1EJp67EqG5Y7xcQi7sME6g8QG94AEky9/lBf/j+SVppD/v4yPKY9UleBrg8kuu15At9qJWBWaM5CgOYDS6Ta/taZqQINL8ScnQ1gvXZPoznk+AT7jJ2MV6Dcccew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Wed, 25 Dec
 2024 03:10:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8272.013; Wed, 25 Dec 2024
 03:10:34 +0000
Message-ID: <5f2b9a77-7f3a-4a6a-9481-e1a4c54a1f0e@windriver.com>
Date: Wed, 25 Dec 2024 11:10:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-core][PATCH] lib32-64k-pagesize.inc:
 add conf file for easier building of 32bit binary with 64K alignment
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <20241224025708.4192067-1-Qi.Chen@windriver.com>
 <01010193f6aa6012-d78373e6-a1b7-4828-a150-9b6fde33cba2-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <01010193f6aa6012-d78373e6-a1b7-4828-a150-9b6fde33cba2-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA0PR11MB8399:EE_
X-MS-Office365-Filtering-Correlation-Id: 780347d9-b040-411a-839d-08dd2491b2a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M1J3Q2NxWFAvVE16R2EreDY2a0J1U081M1JoUzZ5VlNRalZ6TERpZDBkUEtY?=
 =?utf-8?B?YjFUNW16SHNWYk5GcUpOZXZKNnp0V2RYNFUxZEwydTdtYWVYeloxUFRtbkQ4?=
 =?utf-8?B?bUM5WGRka09HNlppRUZ5U0pQazJjL29ZWnpPclNIT0ZwdG96NG56dHp4QXNG?=
 =?utf-8?B?aU1uc3Z3cytOMlpOU1YwbnR3czlQK3ljQzNUcEFaZDVnR1FUTXZSSlR3TUNu?=
 =?utf-8?B?am03V0hXS3lGcjNEM01aZGN3eTJRTVA5QnVqemFpYW96RXU1R3oxNjVRazhw?=
 =?utf-8?B?SXRGeVRGRnd0RytFQmRsYTJEZU8zS2l4djFEN01obWs2ZHNuNlgxRUNWalJs?=
 =?utf-8?B?OU1odFh4cVZjQTZML1B0Rk5XWmMrdytwNkxoTWxpVzRaQVlsaTZjME9vbkFN?=
 =?utf-8?B?YnZ3QnpNNTJhbFdta29NUmNiRTlDblp3UHJxTklVQkxKTTBmc05pQkhuNGFh?=
 =?utf-8?B?YUJyNzdocVRwMjZSdnFJQkc3WURFa0laWHhlUmZPVko1R1BFSzlXcjJTNHNn?=
 =?utf-8?B?aVhESkF4NDJsQlo1MFZpMzdiN04wME5PcUpZOEpJRWZ4bzR2Wi9ud2JzSEdN?=
 =?utf-8?B?UHlZbzA2akplSlhZK1MvSTJvN3ZzSHpKOXNnVWhoenF5R3YraU5vWFl4NUQr?=
 =?utf-8?B?VGFsNjdQYUxTbDh1dUFVVW4xa0NxUEdORk9kS0I5NnJ4MWFaTjgzd2EraStD?=
 =?utf-8?B?Y1hIbDUvdW9GbmxPMFZha3UzMi8yV2I4dkZCNjN6NU1meXMwZG5CVGQ5NnZR?=
 =?utf-8?B?dWRBdVFnRHg2eTcrSDAxckNiMmJBVkhxcnA5M2V5ZkYzb2hHZmdQczNOSWtN?=
 =?utf-8?B?ZjV5eGFFU1VpdDhrMWdqUlE3N3Jub1B3K1RmY3pjVnM5MnEzak9NZWNEWlhQ?=
 =?utf-8?B?Mk9SNCtRZCtZRGwrYUY1OVQyL1pGTlQ0U2c0ZnVtUXduUkt5b3NlQU9vNzRJ?=
 =?utf-8?B?MmkxU24wZ2h3bUxRaU8xRkJuU0dLTDBEKytXUXVxS2toV0l4L1hpck04NlNy?=
 =?utf-8?B?bjFIcmdEMDFVWS9PcEFHczFiWjg2QzIrUjNpaWtNZFVPamh0aE5hTVg0a3N5?=
 =?utf-8?B?c3IwZFBwZUNBbTFqVnFFalVodWlvSlM1QWdEK3ZmNm9RWWRPbXZOUmx3eFBx?=
 =?utf-8?B?S0c2RjR6OEpxU2ZlRlA1dWVoSkN5WjhqWDZYVWxnbDV3VmFWQ0tGay9QZ3Qv?=
 =?utf-8?B?VTZDYXRuZStKVDdDY1NUSHdydGQ0S0NITnBJRk5vaFlFMFBlWjFzLzlPNGdN?=
 =?utf-8?B?MjFKdVVXMndIaFFJVzFtUUVhMHVzN1p0ZnVXUkN6ZDZOL0tnMHNkY3kyUjI0?=
 =?utf-8?B?eTVtcHc4bVp1Rmw2T1JnVkUzcWtvUUtkUGhnVmFSekg2cFVWcUZwcEJKZE5i?=
 =?utf-8?B?TzZ5dmIyTUJzUG1pZ296RThnU2hUVG5RUTZQSmROeS9rUG5oc0NjekFCR3A0?=
 =?utf-8?B?QVg5VDA1VTNBYmZHdGtsNXFVUEE4YVVSMW95aXZoeW1veE9NMEltNGNxZzdl?=
 =?utf-8?B?WEpsdVkxTTljc1ptTkFQRHlsSUpuOERDdmsvLzdKM3JLZ0N4K0FOb3p4bkk2?=
 =?utf-8?B?ZVBOaW5kZkt0dlRtaExrMFF3YUdXZ3ZjMWpYcU5KcEIwR0REenZLYjVFV1JL?=
 =?utf-8?B?NXFLdVFaYXh4MnhmS1o5MjNyUFZxMW1WTDBRRkI5bnJGSCs5Wjg2eVpjalFZ?=
 =?utf-8?B?ZGgvWGE0MDlZaUNReEhBM093V3ozVlBvenphYzBHYmh2Q0FZUURIc1dXakFL?=
 =?utf-8?B?NW5qZ3RES3c2VmZPTEc2emhScjBDa0RSYWExVUFmbW0raEh5Z1lpZEgvVDl1?=
 =?utf-8?B?MjRxaXJYSVRDRHpzMzZYdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SlFTanE4bDU4TjJZajdVQmJVYThLMERjU1hnSnBKRFFheWZ6dmNUZ2pZdjFv?=
 =?utf-8?B?Z2hXV0JMeXJXQlBybWFJSE1nOEIxOEZuZTlBbHlNeXp0UTg0M280VHRUTEJJ?=
 =?utf-8?B?TUJBbkY0dDYvWUtvbk42eldCVEgvOHk3UitiSzkvUnZacXhXWkpoMVNWNmJs?=
 =?utf-8?B?MHpJcllIbk1KbjQyZVN1ajRjMlhSQzNseHJxTU9UZGNWa0FXTkg3OVdqVlhn?=
 =?utf-8?B?dkt2S2FZNy92NmYwQ042R21JanZmZEFFQWV3NVp5UFhnajFuTzYvRS9Vb3hO?=
 =?utf-8?B?UjVqOUVGNDkyZXhmSmtyU2hES3g5TmVCa1JTYUF5OERGaDNlWXVZSlZ6MGdp?=
 =?utf-8?B?ckY2eFFKbkNsUGIvVXAxSTBTQ2pab1pIdkFRM3Jla0dKTDJsQ0M5SFRlaGha?=
 =?utf-8?B?M0szbExIMWd1ekpna2kyaGdRb25IaTMzL0tFY1hUemVKTWRXRTRvakJVRXd5?=
 =?utf-8?B?UVVnYllTcmN5MExmdUUrZ0lLVnRJd3A3dnV5QU5DNi95U1Q5OUpOR2xEc1py?=
 =?utf-8?B?Vy9uTWNtZFdCL3kzdjlXQXFqenVCbExFcXFTSnl0N0g1L1JBRDBZUXlOUklm?=
 =?utf-8?B?WXpmTGxUNTZmWjRNOTVHaDBwNlRTTU1NQk05VlFOTDRLZjc4ZTFIZno5Z050?=
 =?utf-8?B?UExET1R2eS9XUXRVTnZIVGlrWDdSSm0xZ1dFQlR3a2FaSjZvQ2YyWURuR2pO?=
 =?utf-8?B?dE9UTkNsMzZUNk5NWCtNbExaSHNCajRtQlEzM29aeVdhOXYwajV2ZHdhWUd3?=
 =?utf-8?B?RWQxeGVGM29QM1p0dVR5K1VIR2hYVVlIZTVmVEpiVG1scHY3WW1nTVA0TG9v?=
 =?utf-8?B?WXZuNWMwYzVxUVhMR3ZXVFpOWVJodEhVNjZYRFdxK2ZIMjBmOERPeXNFa1dy?=
 =?utf-8?B?YTZmdGg4T1lWeUh6M3gyWjJIblFTOUpoL1k3aU5xc2RSVkJYS3l6aUwxbWIz?=
 =?utf-8?B?ck9GL2VXdlhHSGJRK0owNlpNVjJDM3paOFhoRHJ1VGhMaGVGb1B3cXpuc0hT?=
 =?utf-8?B?SGVRMGs0ZE15YnczbkpBL1RHckZPKzNFNVZVL3FrOVhrODZZaGQzbGJpZVVJ?=
 =?utf-8?B?ZTBPcDc5YnZpRlUrd1FXZmNMSnAvTmZ5d2J6RnhlMitWelpXSFN2YU5naEM5?=
 =?utf-8?B?YXFOL2pLQUxwdWhjOHB4RnZjbjd2dlg0UFY4WVRSMmtTR1Z3VWkyWHp4c0Zy?=
 =?utf-8?B?K3dkZUZuVmdMN0JIM28yRE8zL1ozSmVvaHJwdVp3NGc2Q0tJeVZZVUdhSmo3?=
 =?utf-8?B?ckxtcUJUamg4TURxVmVuR2lROW5GOGlnQzV2dDNHT2ZTWjlOME5jSE9sbDQ1?=
 =?utf-8?B?dmxmak5HcmFSNU5TZVZYK1AzUEVLZUxaVmtQWVZSeEhMQUphaS9HL2dnbVlx?=
 =?utf-8?B?YkxISExtTTMrL081NlhFVjIvdWhtT1VSdVZjUTFndmJqUGkxNGJLZlZhcGxG?=
 =?utf-8?B?Z3h3dGdMUGlKUTdCaHB2bldrU2ViRjhpcFEvZ1ozalRMR2pXYkgxQ2RyVEw4?=
 =?utf-8?B?bkVSMzVxb216Szh1UzNURG52eXpuVlo3K1hIZlZsMm9XNVgxUWFzUSsxUzlj?=
 =?utf-8?B?L25FeFdHTUJoUkJUSjNYM3RhSlhwYWNIN0JrbjhKdnJqcE5YVHI0Z3duYUR4?=
 =?utf-8?B?cEhyUElsWjNZSEhsalBMU1lmSlNiMzhZZUU1cStMMXV5Z0NIL1Y0dGl5c1Q4?=
 =?utf-8?B?ZEdIQU9zVWgyV1ZONUk0R0NrS05sSVYreWxoMjUxbjgwWDRlQlU2dWdJNjc0?=
 =?utf-8?B?cXZSMVY2Z1VDS29DaXhYa2pkay9lbVE4NCswczZsTk1NK3JNWGc5RGYvWkdn?=
 =?utf-8?B?b1kweTdFTFlBSlZkcXZ5b1Q4bXp3R3dQVFRYbGQ4YkhRQUk4YUhsLzM4bzR0?=
 =?utf-8?B?V2FOZzhyYnFqRzJlT2dGcWZVWlZWS2JMTUVrMnJSdXFuOFVZQmQzeUhQOG9q?=
 =?utf-8?B?WXRSdXZuNDZEWGRDdXRxQlhTUGk3ODRvSTMvYW42Sk9CVG9WdlU5bVJ2RnZj?=
 =?utf-8?B?Sm1LUUluemtCT3RVYVNCUENYaTdQcFhac3dhdjR2d2ZKRzVINkt1VnJkZmtM?=
 =?utf-8?B?bmUrYS9NdCttL3dSUk1zMHdKdUcveEs3NXpqVzB1aVIxaDNUOVZIWExUdWRr?=
 =?utf-8?Q?nc/pu/oGHsKE/X6JRj+BacZ5p?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780347d9-b040-411a-839d-08dd2491b2a7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 03:10:34.3483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CZfhlmotl5MjWQv9zrQWCIm3wzGZOBsOtBDYs3LJoxL0Sv4i6B3SVicc6MhO55NMJ2PDHyvaQlCSPTX1/aSog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8399
X-Proofpoint-GUID: hdEPrx9OpPviMCMV2dTR3kILRLvM3VQs
X-Proofpoint-ORIG-GUID: zklBypk8wfF2MwWeCcBqtPAnIr9MXscH
X-Authority-Analysis: v=2.4 cv=CeHy5Krl c=1 sm=1 tr=0 ts=676b77b2 cx=c_pps a=rPWB9DPlu1VaKM/QD/CSBg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=8P_Yl7PHX7KaqECW:21 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10
 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8 a=OmQg1XK9loyA-OjW1fMA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_09,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412250025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 03:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209072

I'll send out V2 with a shorter title.

Regards,
Qi

On 12/24/24 11:16, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/lib32-64k-pagesize.inc-add-conf-file-for-easier-building-of-32bit-binary-with-64K-alignment.patch
>
> FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 92 characters) (test_mbox.TestMbox.test_shortlog_length)
>
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
>
> ---
>
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!



