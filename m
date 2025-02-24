Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E21DC021B2
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 00:27:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.78911.1740356868300362685
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Feb 2025 16:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4150c0ec72=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O0I41A017825
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 16:27:47 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44yeyqh6wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 16:27:47 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51O0Rll5031527;
	Sun, 23 Feb 2025 16:27:47 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44yeyqh6wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Feb 2025 16:27:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyVtLXtWLdjBfTec/YIfV353eT1IvhN3y3Tee8nSivLk8npbJjC02PW0OlFNAlG5smB/AUNQ5EqiZZrX034zbQ9Zd+hmnAFuWleGb91GADYHGKH1yivHOJGdHZDRnlV2k3ZqtVX0SELvJwEt17ZEJtrE34o1mm64ldE5BQNhmrF59ZMIcGUtZFnD5BvTw9ZWTBL7aYDwWDHpGH540FQ41UR5lwSsMyG6ggHoc1drRShM7GkwpE4rz37cwF7M55WezkpURCF6DMTd3F2GJTG6+erMl7r5SdJ6CdU3meVL10Okctj0eJrcFsJVvq3RZYs/5/cqAR3rC9EkaYArdeMr2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+4MQYeoOm9SgOMz3pLms+WeJC/f55y7wajma6+yZtM=;
 b=UCwYtGmRWvzHMtT/55aMdAfmHfO6tRGHIsd+V2WFI69GSDhCmi0uLJUkX9IdzyN+y5j7U04ooAu9JQbkNawmqd5B5rfslkgUDAxn2T8mppscmTg9zMTxpEh571kYKtR8ISHb7TB7AmrXTU+LWS2BTCKeBjRbJBKRb290HShJZ6zSBVDdzOYJQxBLcxFo/wqiYvsGLAX0ChoagPd2S7N9qdxZUo3b0n0BrfNWpE4YOYei0q8jPjbUu9B0y3tGRUrKJZ7Jc+qBwPCsEunzOPGb/CRKjIOJN3YTY7brwdfRSB/B0X1WZ3mfWrVqJxkKRuGvrqYtoSwsrIIFQmxH0JBZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH2PR11MB8814.namprd11.prod.outlook.com (2603:10b6:610:281::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 00:27:39 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 00:27:39 +0000
Content-Type: multipart/alternative;
 boundary="------------vU0PsbDR2c57w9CBvoE7nE07"
Message-ID: <61954cfa-8064-4751-b88d-f13ca08ebce4@windriver.com>
Date: Mon, 24 Feb 2025 08:27:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig only
 if distro-feature set"
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
References: <20250220035724.1460062-1-changqing.li@windriver.com>
 <D7Y7576F5D4R.128DYAUZ74YXF@bootlin.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <D7Y7576F5D4R.128DYAUZ74YXF@bootlin.com>
X-ClientProxiedBy: TYCP286CA0202.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::10) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH2PR11MB8814:EE_
X-MS-Office365-Filtering-Correlation-Id: 4559127b-6467-4cae-6628-08dd546a0b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WXBmckFvUGdQeE13SEs3c01GNmhwWHVLQlNsTlpOcWgrLzFNamxYaFZEMnlB?=
 =?utf-8?B?UlFNbTc1QmxpSFo5UkhxN09mdFBMWWc3cU9QTHZLb3VKbFEwelJ3N0VLRDZO?=
 =?utf-8?B?MjBEcXdmOXRXZ1RDS0pocklLRVkwUVVWRjZVdFpvM0x4b0x6Z1NXSm0vdTNq?=
 =?utf-8?B?QmtpZWhjU3VKYkNpcVZneDdRSnVFZmRKU3ZXTVJ1c0lzVHo2WWNwMmErQmZ0?=
 =?utf-8?B?WFg4S1dDN2dwOFJLSjFNWHRBL0c2b3R1M3FtRzV5aEVacUVWekZpcUROWXJr?=
 =?utf-8?B?NXhGT2RsU1pWaGwzVWh3SDZ5di9BTU0rZVdYUEhDYTVZL2pxNWVmSmhBRmN1?=
 =?utf-8?B?aFcrUGtBUzRpZU8xT2V3U2ozRWMzZ3ZJRUR2dzFsTHpvQWpsV283ZjJ1MFhj?=
 =?utf-8?B?VTVjVG96UXBrUmVaVmpCY3FseXRwTVZaVFYzTS8xNnNzbGRGZCs2Qll1VkZr?=
 =?utf-8?B?UUJ6bTBtNEdka0x2SU1NWDlRLzQwTmViSlpnS0FQeWdGYU5zUDlyaEZFSkxC?=
 =?utf-8?B?elJVOE5vb281UlBaZG9uQndteXFuU0NMZmJlV1NXdHNxU0JYRkJXL3l2bEhS?=
 =?utf-8?B?U0ljbW0wcE80bFJaUXlBUzdSM2w3U2dOQTYrZ0NvWE9Jc0lhZ1hxcWlEazA4?=
 =?utf-8?B?cmlzSzFiZ0VQNExPM1ZmQmxHN0hKOXFlZzk3d00zVzlmd2JjT0Qwa1lEOElN?=
 =?utf-8?B?S0k3VHROS21lYWxqU2JMZVYxWnJTK2xvbEFGYmg5S2R0dTVyVXBlQWVzeldH?=
 =?utf-8?B?MzNrL0N3MmluRm9GS3B0UEJ0ZDllVlg0UlZYRy93S2t2VGtWMGo0Rm8rWkVk?=
 =?utf-8?B?OHRhSXVabDA4cmljajYxc2hZaTVUeU1meGRjZVNpYlJKZ2lWQjhka290cTZS?=
 =?utf-8?B?Wm1IbHhIRnMzZzNNM1l1bnpoSTVPaGlWWTlKeDRQL3A3dFB2OFJ1K0g0MkIv?=
 =?utf-8?B?N2hCVG9uSVNzUWVpQ0Z4aXRVM2pzT01Qd0l2cG9QRzlEbU1wWjdYbFBhK1ps?=
 =?utf-8?B?a2xvME5vQ3FtODRtcDRZT1Y5dkRMQnVRcHNBdi9hVFZVdHRTODUyV0h0L3ho?=
 =?utf-8?B?MlNYcVdkSENWeW8rU0tkd1hyc1BUVTVpS0hqOEhLWnMwWWJ5NnhFSWx1YkZM?=
 =?utf-8?B?WGZXbHFYdzFwQTlwckczTW9MSWNMTFpKKzlrTkYvRllncGhGR1RkTTBSeUx2?=
 =?utf-8?B?aHNhSmErVnV5cXd2aCtteFRsZEg0bVM2Zi8yT0ZmU1gzUFJNeDhteUprZ3Fh?=
 =?utf-8?B?MHhXZWdEQlpGZ3JEblE5eGd2QmNnZW8rZmZobndNL3F6ZXpSSWJmTGVhUG5r?=
 =?utf-8?B?bjJVTkQyczI5OWRnbnJCMENUR2hTYWlHUFBYS2JNeW9NN0Y3RFdwWGlmTGxB?=
 =?utf-8?B?cnZUNU93QS9hTDBiS3B6ekRWSGRzTlBwTm9LRTltOVhYRU1xRmcwd3VOMEsx?=
 =?utf-8?B?d1RqMnZIOUhUclNjRWQ4aitER3JmeGZMNnhGM1FGWWRxazVYdTNzWFArYUpT?=
 =?utf-8?B?RWErbmszcldqcDE5eExJWlpaSnJYYzEvbzgzUTErT1V5OGZmL1V6T3RZRE9j?=
 =?utf-8?B?V0tjZ1JQUWNuVmV4Qm1LWjRWUk1rWWhYNVlsSzcveFY2TytGaW1aM1UrT2do?=
 =?utf-8?B?WHcxb1BMRm1rZG1EdlpSWnc2cFU0SzFNVUc2ZDJHR3ZVck9QUXBwWTRjdHdx?=
 =?utf-8?B?eUJDU2JVT0VISDFuN0lzQ0ViSWdTSnc5bHIyY1hoZ1ZVODU5MVpZQjVabW56?=
 =?utf-8?Q?YcjYbrZA4jrb+mq1rUcSydvEvyRrUtYuhjo4KZF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TllNdWE3bFZjZWU3cmpSN2JBZy9IUkxFTjVjYXBTaHJUOXVic1BvakY5Q3Ev?=
 =?utf-8?B?V1NVbi9mVEcrMDdHUkVuM2dVWkJyVWZ0SjZSTnczdGF2WDNOaXRKZ0ZMRDZz?=
 =?utf-8?B?VUorUmR1UWVlVzk3TCs2dk5GZithMXVkeVdGWVZja3BydFM0U0lCQkhZVWJZ?=
 =?utf-8?B?Q05yQ0t3dlJQRVZzbnNObTAzQU51NGU0MGlob3JLMGM2aEwzbEx4RjBOcThI?=
 =?utf-8?B?ay9acUhWbWhtek5MSUMzSHN4eWlVL3g5MytaN0E2TDNOOTQwUHF6RHlSdld4?=
 =?utf-8?B?T0xnc3NyTUdGSzBIMno2NzlsZmR5T2ZobTZOZUVHWUszRFQrNGVqWUl0dHdJ?=
 =?utf-8?B?RlRpeXVENjVrQWtGa2pQRmJNd3kxWit2a0Jha1J3UkMvdHFndzFOeXhVZ3dE?=
 =?utf-8?B?ajZ4V3d4blU1S1FmTGRySzBKV2l4UjBEbUtvKzhVODVMY2hZWnJsdUI1Ym4z?=
 =?utf-8?B?dGFkbVlYSFNIU1RpN1VSMFRNcnhHWGNhL05rK2p3RWs0bDZsdTRmQ3BHSG1C?=
 =?utf-8?B?dkRnME52b2JuVjZBNCs0NXpIVmE4MEZTQWJNM3NSblo1VXlxK3d2YWNxY2lR?=
 =?utf-8?B?Y3RWOUJqZlVPZ0NHYzVKVkJ6WFd3ajl5RER5MXYwN09ab1VZYUlubTBRSUNP?=
 =?utf-8?B?QkgrU0NndnFMYUQvMnk1SCtiMFh6TlJCWDJ1MkNKU0JNSUdIb1g4bXdHWFBn?=
 =?utf-8?B?VkloTFJUR1VMeGdzbTV3WjFmczljSThxRGMvayt5ZzE0ZFVnWW9tdkJya3RO?=
 =?utf-8?B?K2RuWkxVZkJhR1lpRDFmYTQzSFBxejFWMmE5ZHNuK2dvNXo0UjRCaERRVWJG?=
 =?utf-8?B?RWc3NmZIVzRSRG5EY2JjUDdZa2Q2SXFGYWtHdk1MelpXc0dzdHg2Rkk0YW5W?=
 =?utf-8?B?cEhJOWlORmliQTBDbGdPMXhhRWNvd2luK2lmYWdodFpiN25MWG5zdzVVM0Vw?=
 =?utf-8?B?Skd5cnhFWldtNW1RSTcwNFVGeFpBVllqbHV0eUlzMlpmWlpFUXdQNUo2TTF5?=
 =?utf-8?B?em8wZ1Z1TzFhVk8rVUJBa2d3V0p3bTByYkM5eUQ4RnFGNmI3U0RHVlNyTWU4?=
 =?utf-8?B?YkYzam1Ca0JGdnB6b0plbkgzUy8vNld0UzhWeklPMHk5RDBWLzVGdUNiNkFI?=
 =?utf-8?B?UEVPK29Xc01GYlFzRHEwUDMraFBpaWtCdnFJMW5mekk1c3RuOE9pYzVJbnFy?=
 =?utf-8?B?L25waWp3TE5zQWFPNUY1Um5ONXJUVlZTdjZNZGQxcTNGdS9vK3BZMWNMU2Fs?=
 =?utf-8?B?WDlTVHFxQ2YvQWpYKy9TS0pFblV6c0FpOEVLRkYxVjR0WW1scUZWTWM1NEtw?=
 =?utf-8?B?ekFLU3lrSVZjUHNuNitrV1Vzcm5YNEtueGg4cTFjOVhqZFdmUHJDam5hNjR2?=
 =?utf-8?B?UnNSd2FtMmtmc2RUZWhaV1M5WlNja0drM3FwRnFsQVQrWkovS2l6cmJMNDB2?=
 =?utf-8?B?a2lGY3l6M2lNV2JLMWJiUkpjY3BockdYQjJndmVGMi9jMUh6cGtLS1JmaFB1?=
 =?utf-8?B?RkZteCtMamFubG9Bem5JSlRlSGhHWFpzRDIvSGswbWc2dzFRTE5yNi84QWJG?=
 =?utf-8?B?ZFJHVDRqeEFDRmFVbE55bXZ1djRaOHJJOHBCeU83RTBDbmFtUmNCQ2x2V1Uv?=
 =?utf-8?B?N2NpcktqWnhUNDJQaFk2emhRNVo1ejVLb0gwbHJUM29pcGpSWFFxWjNodHU4?=
 =?utf-8?B?eE5NYU9tbWFaaGFWczdIQmgvd2VwNjhhcVlIcFEyRHBIalNRTEhxU1Qyd0dy?=
 =?utf-8?B?cjRUZ2g4SmJJSklMSHNPeXJGeUlBQnY0a3ZZK3NiQXh4RGNQa05XdXpCQ253?=
 =?utf-8?B?OU0vRWVoTWdWWTBCZU1QdjFCTU9NNnhVZlEvWU9MVmE3M2t3dlZLdjhmRGxm?=
 =?utf-8?B?cFhVWTkvdGdBdU95ZmhISGdwbVA5STYwSzkzU0d5YitDMDUvdkpuYU5sVUhl?=
 =?utf-8?B?aHVYeFNySllSbUV5MlFURm9zY3VQZzl3MmhrdENxN1Z3bU9ieU1HQ0k5WHVX?=
 =?utf-8?B?ZlpwNFRJbmZ4ckNxVE52UGlGZTlDTHUvWjdyU015UGFFWGhyZkwxY2ZFc2Fu?=
 =?utf-8?B?TkJnWXVIcHhKajJlN09qbGZnT0U0czdOajIvZkREQWIvcEhLMjZHblFwdjly?=
 =?utf-8?B?ZlZ0UWJYakEvKysvc0dxSWorVXowa0RaczkvR2V6R2NCVk82QS9HUXBZeHlC?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4559127b-6467-4cae-6628-08dd546a0b01
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 00:27:38.8324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHIHPDsLkwO9S1Svv8qkt8ui3uwrMDG0Oz+37vDJ4KZz9zqnbaLJ5P09Ok/HvNTQEXvQenB1Ykqjn+nYF0frzI5UchFbc6Q2onp1TWDrJhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8814
X-Authority-Analysis: v=2.4 cv=AbBLH2XG c=1 sm=1 tr=0 ts=67bbbd03 cx=c_pps a=sGbpJkUcFVeWJOR+0qTsNQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=eRd5XgGZmAZCNO8hLxcA:9 a=QEXdDO2ut3YA:10 a=yj-aMKAYKbz0kkd27lYA:9 a=GDiSTbxfgD4MBsPj:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nq0v-B4hrOqlPz-ugDmt6lDsF5RlJF0U
X-Proofpoint-GUID: rZuRGqwNPIXDBQaCpkBB2yUiYrVbWvSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-23_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502240001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 00:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211834

--------------vU0PsbDR2c57w9CBvoE7nE07
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/21/25 22:34, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu Feb 20, 2025 at 4:57 AM CET, Changqing Li via lists.openembedded.org wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> In oe-core, function ldconfig_postinst_fragment use exist of
>> /sbin/ldconfig to decide if ldconfig is runned to generate the cache,
>> and function _run_ldconfig will run ldconfig to generate cache during
>> generate rootfs.  ldconfig.service is actually not used since we have
>> generate ld.so.cache during do_rootfs, refer[1][2][3]. ldconfig
>> dependency is necessary when ldconfig not in DISTRO_FEATURES.
>>
>> The reverted commit causes regression when ldconfig not in
>> DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
>> ctypes.util.find_library(name) can find the lib if it is installed, now,
>> since ldconfig is not installed, ctypes.util.find_library(name) cannot
>> find the lib even if it is installed.
>>
>> Here is one usecase(gtk+3 lib is installed, ctypes.util.find_library
>> used to find the lib):
>> import wx.lib.wxcairo as wxcairo
>> File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/{}init{}.py", line 59, in <module>
>>    from .wx_cairocffi import _ContextFromDC, _FontFaceFromFont
>> File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py", line 189, in <module>
>>    gdkLib = _findGDKLib()
>> File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py", line 181, in _findGDKLib
>>    return _findHelper([libname], 'gdk',
>>                       "Unable to find the GDK shared library")
>> File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py", line 170, in _findHelper
>>    raise RuntimeError(msg)
>> RuntimeError: Unable to find the GDK shared library
>>
>> [1]https://git.openembedded.org/openembedded-core/tree/meta/classes-global/package.bbclass#n394
>> [2]https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/rootfs.py#n316
>> [3]https://github.com/systemd/systemd-stable/blob/v255-stable/units/ldconfig.service
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
> Hi,
>
> Thanks for your patch. However, I believe this is introducing some
> regression: I've got some ptest failures on the autobuilder:
>
> AssertionError:
> Failed ptests:
> {'python3': ['test_timerfd_TFD_TIMER_ABSTIME', 'python3']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/992
>
> You can get some more advanced about ptest failures in there:
>
> https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86-64-ptest/core-image-ptest-python3/
>
> Can you have a look at this issue please?

Sure. I will check this.

Regards

Changqing

>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
--------------vU0PsbDR2c57w9CBvoE7nE07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/21/25 22:34, Mathieu Dubois-Briand
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:D7Y7576F5D4R.128DYAUZ74YXF@bootlin.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Thu Feb 20, 2025 at 4:57 AM CET, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

In oe-core, function ldconfig_postinst_fragment use exist of
/sbin/ldconfig to decide if ldconfig is runned to generate the cache,
and function _run_ldconfig will run ldconfig to generate cache during
generate rootfs.  ldconfig.service is actually not used since we have
generate ld.so.cache during do_rootfs, refer[1][2][3]. ldconfig
dependency is necessary when ldconfig not in DISTRO_FEATURES.

The reverted commit causes regression when ldconfig not in
DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
ctypes.util.find_library(name) can find the lib if it is installed, now,
since ldconfig is not installed, ctypes.util.find_library(name) cannot
find the lib even if it is installed.

Here is one usecase(gtk+3 lib is installed, ctypes.util.find_library
used to find the lib):
import wx.lib.wxcairo as wxcairo
File &quot;/usr/lib/python3.13/site-packages/wx/lib/wxcairo/{}init{}.py&quot;, line 59, in &lt;module&gt;
  from .wx_cairocffi import _ContextFromDC, _FontFaceFromFont
File &quot;/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py&quot;, line 189, in &lt;module&gt;
  gdkLib = _findGDKLib()
File &quot;/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py&quot;, line 181, in _findGDKLib
  return _findHelper([libname], 'gdk',
                     &quot;Unable to find the GDK shared library&quot;)
File &quot;/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py&quot;, line 170, in _findHelper
  raise RuntimeError(msg)
RuntimeError: Unable to find the GDK shared library

[1] <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta/classes-global/package.bbclass#n394">https://git.openembedded.org/openembedded-core/tree/meta/classes-global/package.bbclass#n394</a>
[2] <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/rootfs.py#n316">https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/rootfs.py#n316</a>
[3] <a class="moz-txt-link-freetext" href="https://github.com/systemd/systemd-stable/blob/v255-stable/units/ldconfig.service">https://github.com/systemd/systemd-stable/blob/v255-stable/units/ldconfig.service</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi,

Thanks for your patch. However, I believe this is introducing some
regression: I've got some ptest failures on the autobuilder:

AssertionError:
Failed ptests:
{'python3': ['test_timerfd_TFD_TIMER_ABSTIME', 'python3']}

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/992">https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/992</a>

You can get some more advanced about ptest failures in there:

<a class="moz-txt-link-freetext" href="https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86-64-ptest/core-image-ptest-python3/">https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86-64-ptest/core-image-ptest-python3/</a>

Can you have a look at this issue please?</pre>
    </blockquote>
    <p>Sure. I will check this.</p>
    <p>Regards<br>
    </p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:D7Y7576F5D4R.128DYAUZ74YXF@bootlin.com">
      <pre class="moz-quote-pre" wrap="">

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>

</pre>
    </blockquote>
  </body>
</html>

--------------vU0PsbDR2c57w9CBvoE7nE07--

