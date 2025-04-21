Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82D9C369D2
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 08:10:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11063.1745223001887918142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 01:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=620617753d=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L7oOFl019706
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 08:10:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 464121hmsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 08:10:00 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53L8A0j7016205;
	Mon, 21 Apr 2025 08:10:00 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 464121hmse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 08:10:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGaAYlKw1VmQQylr/Fk2X5Nbd10q4AeXEgElswL2RhwHzdprL+FbUekEaJx3ioJK/5pWmKjZuzGQq8cEa7WBL5DX1PtAOd33udobEIV0jU9+M/kAZnZ8iHT/cCJ1I/E8K2r7A67dRge8cQ27U0cYF5Lce8LNHkAUVpNKNQhfhKpSYYcWyDiXvqkToIev5V4Hklhab5r9bYsWqp2KJBouButlYyCegXcWv2Qho/pPF9Jp6Ii5JgEz+CasHdBTrQJqrjz451WJr04BePUTA3bEC64CQhiz6WxwprVyaNUW5W66lczG6ZKhIpmeTWaLSn6IeG/ewbGB5WviCAZR3yCwAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTbhDJZL6a/LTvCnhYJiSYgWFxPwEXd9s8jZdXff+/E=;
 b=kDncMoJMErIFcsmRHlEaNlBk/ni+4XdQFnIYSYnF2dI6fuU/UWr9DgkwwMM9WjsIQgy1LVTobzATkE7Q/aYyrCUmKH7IplgtxeDSwtFzAVqKP1VF0uujUoWCqpNTZFNs3K5WCw9cffWX7BKpkkO7KGid6PPo258x9JQnTXmLZMnX+2HnbB58W8SKFGaerK3gf5M5T9ScA0URWS3QrRQfh5HERbuW7cAua1rosl7DvCw6Xa5zQtj7NXdelQWo5bHiupNTiVQl6567PXuT0sBu5pltHnzY174IHksjFYpKMKQMsqM3FfliO5PDoKBsLuqBxV8L/IzszgxowUFndGOt2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 08:09:56 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:09:54 +0000
Message-ID: <fbc94278-b91a-4c05-9212-cea620a76a44@windriver.com>
Date: Mon, 21 Apr 2025 13:36:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH 1/2] curl: fix CVE-2024-11053
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20250417103606.3841180-1-yogita.urade@windriver.com>
 <4e8cf2ab-554b-469e-8481-91328f66e1d9@gmail.com>
Content-Language: en-GB
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <4e8cf2ab-554b-469e-8481-91328f66e1d9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:510:23d::10) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|PH0PR11MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 1891b257-e0ff-41f7-1932-08dd80abe5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?amtZNjNrRXAzS0tNMC9MM29OL2dNVEZXWVc0clQrZXQ5NkQ0T3NnSE1mZEFB?=
 =?utf-8?B?dzcwQm85VytNMFJRekdjRThzZmY4czdsZTRMNkhvU0lzelFLN0RsWTAwSXpW?=
 =?utf-8?B?T2RFZ0xQREtZK0lhVy9hY0xDV2ZTRDFLWHgwNGxuRjBhdHQ4SmNjaGxqSGt3?=
 =?utf-8?B?SWs2dzhlMHNhU0hJTU9meUZFNGRsQVE3K1d2UTRVMzE5RTFwbTFhK1UyN2U1?=
 =?utf-8?B?U2VqajlLajdvSU01TXRmemhDM1RjMGl0QnB0MUt4TlFPeUJocHl1L21GeVZ3?=
 =?utf-8?B?TlVJZGxwNjJocklsY3hDc0ZNOUJuZ1RpK2diMk8yRG1qU0xXcGU2QmVKRzBl?=
 =?utf-8?B?bHNUNDdNemFha21pOGRoeTRzWStrSWNmUUd2Q3JTUUxWUllsRnZ0RE4xd2VF?=
 =?utf-8?B?NlRRZzNySHJVMEZjMkRaUXdjdHRnMjdHcjhDUmpvZWZFUTZJOWtRMGw4c2hv?=
 =?utf-8?B?QTM2VWtYSCtDRzFkb0lkTUQ5QjNrd1JsM1ZzbnZPQ0ZtUkpFUEF0YXBaWHgx?=
 =?utf-8?B?OHJTNjczWk1rY0FVN1dwZjk4aHRyWklMS0tEckRwaTQyN2xpWkJnNkZSQUFl?=
 =?utf-8?B?bERmc2h5WDRDSUdjUGJZL0dBVzBsT3ZuSnZEeVI4YjhFR0FVTi90b05jTWJR?=
 =?utf-8?B?N0tZY2loeFpGY0xBTk1kTFRsZlZ2RkwyTzlaZXF0RmJhbG1XTVUvTlFFMmhl?=
 =?utf-8?B?S3Z6YjhidmZoSysvZitsU1JkSXVyNHczT1ZrUDE5Zi9hS1lRd1Y3QW9SYkZj?=
 =?utf-8?B?Qi9oVWNucXBZWWM4WlE1bkxsK1lScTRlZUJpY1FtMGZEMTMzWEhMV2NUWHd0?=
 =?utf-8?B?TW9TWWxHUE9EYURMbCswK2NIdGRhMTBaQmdZdXk1SXJ5WExEeEFsdjJWR3dB?=
 =?utf-8?B?ZGVDWVNsc05yK0hJd0tQbkJ3UXFabCtBS2RQbWlYTklPdXVpRXVVakpWbWJz?=
 =?utf-8?B?SHRYbGIwNDZ2SXpZemVtV01SajVnblpGWGFGeEUvSVQ1M3dnWks1TmtXa2Nn?=
 =?utf-8?B?UXRKWHRhQnhSUTFnU1EwdGE1dUgyYlhPOUR2QU9YanJFUDlOWWVidE02NzF1?=
 =?utf-8?B?ckdER2lQbVpyL2F6SFNHMFdKWmhaTnBNc2lMa3JUbXZUU0EvcWRsL1NBNVdO?=
 =?utf-8?B?K2pnMFo4OXIzdzVSSS9QT3hxR00zWjFZOU5PS1RSZFhZMVZlRHNOTkV3anBX?=
 =?utf-8?B?ZzlqTW1zc00wWm9jNjZhcGhkM0ExL1RCMzhhd2NIRExEaWlyWWpBRkxXMVN6?=
 =?utf-8?B?NFZzUjE5K241U3hjQWt2dVd4VWN4Y2FrZmRhcWlpY01lamRROFlWUUpjWTNO?=
 =?utf-8?B?SFA5Zmx4NndvTlRiTXArUHVsT3NHbVA1a2tzUWdzbnhYaStOcllpc3dZNHV5?=
 =?utf-8?B?RjBMMXdMeXZHVk80YzNSVFRiQ0tpV1JieWQ4SUJlZ05heGpSZ3l0c0hpQUNp?=
 =?utf-8?B?OGdxRVZ2bEIxcVh3aTZYeXU4MXErNFZHRnA5bVBFelVOVXRGcU4xalFwUFQx?=
 =?utf-8?B?T3BydE5KODNVMTIyc3hnR1NCVDlodG10RVc0NjFrV1d5RkNEYytIOEFpbTI0?=
 =?utf-8?B?UEhyRU1pRURCSmEwam9PNU9Jb2VwTG1WYXBYM0dtTjd1WW54amhwaHhXL1c2?=
 =?utf-8?B?UHFGNWsxQ0d0NHo1ejBCU2tKSStuTVVWcHczWXlVS1VSU0NtblBiRTIwTmhU?=
 =?utf-8?B?VkpQaGhCSXEzVTBFR28yQmlaUXJUUzV6NnFXTjNuY3BSVkQzYTVTNjJOdDNC?=
 =?utf-8?B?OHViYVNOcVJyQzNwWGtDZHVrZGh0ejFTWGtUQWlOVGErbVUwdXlHNUYvZEZ0?=
 =?utf-8?B?L2dlRVVndDhUZ1NFQ01ZSG9ObDhpYy96TVZmd3AzSkFlSTZQNTV6VGFtdDZH?=
 =?utf-8?Q?vgh+qa7ThaWS+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWx6WFB3bm9zbW5Bc2ZFVS83bnRRa281RTNwM1ZKaE0vaEc1c2tTOW1aeXZ3?=
 =?utf-8?B?bjFkL2tMdEU2UHlta1dHczlua2NIYmlSckpZUHJEUTRqMUQ3K0ppVTJhcXJo?=
 =?utf-8?B?YXpFQXVyQVA5NHBnOXpQMmVDT1gzcFM3c3VBd0ZEUVM5SHB1NDRmVlloYzky?=
 =?utf-8?B?ZVliY2t6K3k2aHlSVkhWek5KSlRiSW9YcFd1blN3ZVRVQyswUU1mQ1UvUGRM?=
 =?utf-8?B?Rm1lcDk4RDlRRHRGczdmMVZkZkJBdFplQnZCSjVlRmxSeEE0NjZZRW51N2hH?=
 =?utf-8?B?QjlqbWtHaU0wUGRBSnVLMFVzaWd6SHUzR1JsbEJRNTRxYWJ0SXRKUmlsaXNP?=
 =?utf-8?B?SWdLNDRLMXo2YnhEMTc4SmoxTHU2Wm56Y2dsdndFUXd5VmRvS1c4NjZTNmhO?=
 =?utf-8?B?QjZOdmxsZ1VCdlFtSUJRTUVUd2crQXBEMWRBRHhlUXBZZFlkeXZiWXhXWFRB?=
 =?utf-8?B?bzcvVTVIS1RQaWkrNnJraUxHZVI2WWFwTFRuaWRHMDVtZFFwTXJhVndNZFEr?=
 =?utf-8?B?c01JMzlKaXVPTC9ZeWpwSkQ5MHdmM1hUMjcxNDljUTB5TWVlZ1VFRnp5bk9m?=
 =?utf-8?B?NHI4NHM0QW5TRFhqdlBzOEJ3M25Xam9vclFoeThHcERzanJGUHhiMHRhUGor?=
 =?utf-8?B?SmE0dzZ4L0xGaEErclIzUmFRVE55U2hQblBHWVdmQWlJSGxaR2Q1TVFIZHBO?=
 =?utf-8?B?QkdTQTdydlhYQmFOdms4NGxxZER1bjErWU1HeXFnUWZwSXBjeDdPRWtLUGFB?=
 =?utf-8?B?OWZjWVVjMjZ4RVpwZEgrelR3VEorK3I5Zk92SVltWVNPOURtLzg1NXpLay9n?=
 =?utf-8?B?UHFGVmxCZzFKNDRRRUx5Q21jNGgxd0FUNFI3U3p1UXBGeDJ3Si9HWTdIbGxi?=
 =?utf-8?B?UTZBOVc4WEo4Q0s3SUlSczlBNEV5TE1uaUY5RGw0QUdFSmY3VUxSMXl3NjFH?=
 =?utf-8?B?cnk3emR2NCsyTTJZWDlTVU5GTGg2T3JWcDlrYXRJOE4rc2JzczYrQWd1Y3BI?=
 =?utf-8?B?MXhhWmdCQmRYNnUzS2ZZMlNPUkErZVF0SXlBVm5jdTRWcDR2TW9CTk1tKyta?=
 =?utf-8?B?ZzRjWXFVWjJ4d1NFd01KblkvOXR4N3hZLy81SWZHK0xTb3NVRXQvUUNyRDAw?=
 =?utf-8?B?T0ZBQzJaM05wRks3K2lDbkdIc3RtTlRkOXk4djBzelZCblNpZlMxdlg4cjZl?=
 =?utf-8?B?VXN4amhFMitzcGVINUovTmljeVNnRjE1SmxROHRyM0RyS2lvQ1R4a2FyY2dZ?=
 =?utf-8?B?b25BQUZFK2VqaWs3R2NFSW92aitMcGNWY2o3QlFzSlZjSFFtZG5VVVcyMnFZ?=
 =?utf-8?B?YW92RkxBZDdGSlR6eVNQd3A4MkRSYlZBN3Y3MUhEQVY3bEptS0hzUm9TL2RW?=
 =?utf-8?B?VTgrYkd0SUpTNVVQaEZsNUI2WWlFU3gxSHhKTC82L3VxYVNjb2NiRG85UDVm?=
 =?utf-8?B?ZnFXTmpDbks3VTlrbm01dlFUSlZod1VHSkNhVzNjcW5YZG53TXJ2bnBwd1Ry?=
 =?utf-8?B?alFzSUJNYnRmcFdteCtLSEVEYWpCc3dkamxYa1JZN2h4UnFPWHNSQm5kSWx0?=
 =?utf-8?B?VmtxTFAyK04yaHh4dXdVSVJ2cjBBZkdJSUNvWkhDL3hTSXpHdlBxSTRXSmkv?=
 =?utf-8?B?Y1FoRGhTN3pqYk0wNjhsQThMTWZmdGliK2hTMnNHUU0vQzlaNU1jUjUvT2V1?=
 =?utf-8?B?WXJBQW5ZdmNUTnpxMU5lemtheFRSMzBvaWpDQUJqVC9SVEJuVGR0VjJPdW9l?=
 =?utf-8?B?RndTRnBXM2p0WGdDd1FrcjNXNUdoaDBRRUozRmVDN2VNV2NhWjJ3YlMvVUtI?=
 =?utf-8?B?NnVkSFMxY1hTbHU4NGNjSHF0WVNuYWp4UWVRWTcvcWJkaUJOVDVxR09zNVZ6?=
 =?utf-8?B?Qlpxc0lPeTRlWU11VExrNTBiOWpQc2ZNU3ZaOVAya1owVitxVUJIQUlFVENy?=
 =?utf-8?B?YSt6RkJSTEZ3bFNZT2FnYVAzc1dkOEo4M2FPN3FYT3NKY1NGeFBlczIxaFlz?=
 =?utf-8?B?MUxRM0UyejM2VkJWb2tFY3FVbm1La2NwWnZyQTZLdzFKazNHK3FzbmV2YThx?=
 =?utf-8?B?dFVkeXBDV0trNGl6K0VQWG9EdHF5bEQ4ckYvTjlXeEhCNWVUQjZPa1dCRlBJ?=
 =?utf-8?B?QkxxYXpabkF6LzhIdmxFZUlEVUVpeFRGMUpGVjk1WGxxaXBWa21KTWpkaXF1?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1891b257-e0ff-41f7-1932-08dd80abe5c9
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 08:09:54.0860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XlBsx+yAuhMKNrvNEVynv4+O5/NhAYYyZau+mecqkTHcfRiWskOZ09kJ0Vn/bdJZ3EO8fMqmaDK89LM36TWzWT2IWPdzwzAJLemiw6g/fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
X-Authority-Analysis: v=2.4 cv=QZNmvtbv c=1 sm=1 tr=0 ts=6805fd58 cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=ugkhXdxtAAAA:8 a=danhDmx_AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=lwqLFhAod3TbjKVDk7UA:9 a=QEXdDO2ut3YA:10 a=3UGHni60EXgA:10 a=VinBSYM5t5AA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: oyewT8W1SgANjYcaLkG-DHH9HPjeZmmq
X-Proofpoint-ORIG-GUID: MEJzwUGzDfSgOdlYt7bF3ef8jNgmjBcD
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_03,2025-04-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504210062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 08:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215170


On 17-04-2025 16:41, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 4/17/25 12:36, Urade, Yogita via lists.openembedded.org wrote:
>> Reference:
>> https://curl.se/docs/CVE-2024-11053.html
>> https://git.launchpad.net/ubuntu/+source/curl/commit/?h=applied/ubuntu/noble-devel&id=9ea469c352a313104f750dea93e78df8d868c435
>>
>> Upstream patches:
>> https://github.com/curl/curl/commit/9bee39bfed2c413b4cc4eb306a57ac92a1854907
>> https://github.com/curl/curl/commit/e9b9bbac22c26cf67316fa8e6c6b9e831af3194
> The first upstream patch isn't mentioned in the curl.se reference you
> mentioned. But the same page references a second commit, that should be
> included in the fix (to fix a regression from the first commit - this
> second commit doesn't seem to be present). Is 9bee39bf related to this CVE?
>
> JFTR curl.se references these commits:
>
> https://github.com/curl/curl/commit/e9b9bbac22c26cf6731 (which is also
> present in this commit)
>
> https://github.com/curl/curl/commit/9fce2c55d4b0273ac99 (which is not)

The commit 9bee39bf is not the actual CVE fix but is a dependent patch 
for the CVE fix.
I have backported this patch with reference to ubuntu.
I somehow missed the regression fix patch, will send v3 patch along with 
regression fix.

../Yogita

>

