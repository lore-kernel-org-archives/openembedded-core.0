Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E43BEDEC1F
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 07:23:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13125.1772609004364187702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 23:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=pj0CWprT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523625cfc=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6244BLvo3916912
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 07:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=nJA9MVDPBo1a1PiDAZsXpJ
	ZJZtK4HiLIoTm8sEs/P4I=; b=pj0CWprTZQ5HLYlHAMVaPSv90mt88DRdZG03Hd
	1fIlKEqKGV2ZeuhZktEFdguS7tqL4GRzrpJ3kYdfxbFOksa/R9IomVIi9FofB4Q/
	VcZyDe/0RQpaqU9cmLL6hUqRwW63rmGZ/V5IcJWDMLIgnJXzTIz9WmdQ2HNCLre7
	O8yZw4r4ub/IWZ/23MNJ4mbaXsOlCsyKz4f0UMt6xFfaRrFT1UbYIfrQI/TXQYSI
	hj316ZRJudt2P6i+PO0X4SqnSaRHO0jVdevgu9vDg9DxchRRR+LWSxSSz6dsFFWd
	0Mtq1hlLgFQO1Gpqg55xIg0Jm4u2ybpjXkm87gnKVrVqAgrg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4mr65-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 07:23:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=id9jWAQahfN32do6jb+jeAUBSncILMN3i1ZkpyPV+95zA9UkHXexG44PLhArePF71e8A+QUfpN5Iu1Hfbr/JScDaNe3wGDMGJ/UOfn1ZQsw+RZ/U/3UNY61nJkhFPksmfCHZHI9gQj83BoVdvNNXQO/9ovWaFY+fHfWN8NPl296OBzuf5XadxFVZRv5ipts5hIu0AhpGtpCkrEzJIWri8xm4ZhyCIN86GaySFLjvymfDoJChUIIzBuVT/IHhLJBpGh4Lr8pn7h3BOXkdTV0NqrPyS938f5uwktOn4h4u5FIrTs/Dwrur7TsHQC1WDrGPWyEMNjw67LdtClMFuDeaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJA9MVDPBo1a1PiDAZsXpJZJZtK4HiLIoTm8sEs/P4I=;
 b=BJQXImKxJEcV6AR2Tpy4D0wM/KWpbkRzA3z66V8lHUrqmImxKMSLqesYcy3gdCDXGOZB3MQvZ1NU4h0xYVwnBq3CUuiiVYmLyTGEO/WSBixttNHlqr/WwMbEfrY91pIBuKQNw49x/EOo6Oo1exEZasv+h1zZK8nYCA1hhRoIo1ZsPIXYX9ZX0uqbrx6tK+7eZRq8qAplqQIp0c/oFqe7kHWPjc8Q35aH9LQjx6IVsvEt3PbxwKfkSPYqovIkhh/DzCgUd0R/PL3XYCKAsxN0s8t7GOmJDat/L0jhkXw2p9AFRMHnM5KHthIFgSJp/+4CinRDpbP4l9Nc1QOFjxGRMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB6526.namprd11.prod.outlook.com (2603:10b6:8:8d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 07:23:20 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 07:23:19 +0000
Content-Type: multipart/alternative;
 boundary="------------0664Sv030bTpCavIogCuU5X6"
Message-ID: <519f845e-41a2-4cc3-8b8c-ff57b743a0ce@windriver.com>
Date: Wed, 4 Mar 2026 15:23:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3] lua: upgrade from 5.4.8 to 5.5.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <39D9B021-BF4B-4050-8D22-53C33E84F8C9@arm.com>
 <20260227070858.2687898-1-changqing.li@windriver.com>
 <FEAC2A3F-4384-4D3C-B9CE-FDA23332604B@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <FEAC2A3F-4384-4D3C-B9CE-FDA23332604B@arm.com>
X-ClientProxiedBy: KL1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:820:c::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 09126ad1-ba59-4f2a-d0cc-08de79bee941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|13003099007|14125299003;
X-Microsoft-Antispam-Message-Info: 
	Bx10sEzLRLAA3jpr9KSxoJWdiPYfOc+xiP9Ow2GN4NjnGPcblc90wqkM1TFDUCm+3qv065KPdtaP7z2/HmzRITlPrKUmveRA7V9zY9Hp/aw9eEwzzeG/wQzjHu3Xm2KPfTkieA6N0GxTdMz51qiaj7ZDV+HsEf+mxgfL7F2pdQwaQe+CRdj9XSq6N1xxu5UEQEiJks1EZUTWOQdjKbFHVK3+dLKgVfsD6mlZCtn0ZyJJwzQqfsQbGNs7d4pC7FeztzkGI2qEc2zO/MzNxsUxe7InLjk6k7i7qWFUtr1Dwt3GrBLWcFTLOkXzh7vXNGVw/MWb72N/110E5ro9vSy4SlTkLKDCgUxjwqnezv2GnQsnFgbutt5e5HwmVlkWGOewo86FOJD+CkEwlyzh+H2Jn8Ndks9KgRrl8k3EMZh+0QFiEFOf8lMieYWwDOeSrAQ04aA4/IgD7eUshFhUTrf1v+WegJrDVhQtWpdMNjwTPAy9+QAYIqyLPorVpJOEARUA28XSN6yS09qzR3GWrr3Roph/DNZZC6qOoHdd6de9lPbGgBU7mNl3mcUyuHMb2+aHCc9wJd1mldqBn/xSoBCpN3qYuwAVyToofpCY5xL4rPGD6S7kErjgeyFE6HI6KYQeGKyYfKIeOWw/qB5BKaJdXw/i6mO5aRDNm0zjYEdGv+cCjxjRebrTjV0WCwGQImadDU0jWQzhWp6BWmXW+fpx+WOyT510rQ8hDc3ry8+EsTs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007)(14125299003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWJJY0dlQnB5UlA5WUo1cXNDZHFHS1Y4OGJxZk9Bd2l4Wmx6TmZIYm5OMHhP?=
 =?utf-8?B?RjA4Y1pBcnFpZGJWSVAyNmhvZDk2Qm5NSFRicVdBTzNHbEcybzg0SWYzTE83?=
 =?utf-8?B?b1FQM2JTNG5uZkZ3MnJrYlVzSmVycTNyQmh2T3UyNG8xcFdyaHpWeHRHZlZC?=
 =?utf-8?B?bEZKbWVtRnJjWE9JNVlCS1JqaTRoY250MlJ2dlBXclZSeEJnb2wrSmRkSDBV?=
 =?utf-8?B?ZHVjN29vL2diY3h3aG1lT2hQQzRDdTN4cWdrbW96aEpQVHhycnJUTlNPNEtN?=
 =?utf-8?B?U0w1R3RobFpKRnphS3ZJeXVXSEpBNnZZV052eTVTcFEyQTBKR0xrVUI2YzlK?=
 =?utf-8?B?ckMrZDVFaGV4ZVdXS2FIcThaaktveHVEczV2NGxpcW91SEdwRTk5aHNTc2hl?=
 =?utf-8?B?QkIvMGZJOHl3a3hkN0JOMWxkNWQyV3N3WTdRM2JHVm82VkNpVzJacmozb1pB?=
 =?utf-8?B?TEt5dU9kL3kwV0hieGN5QWU5SmVUZU1hajRSYjlMR3pxNnZMQzkxcHpIUFJN?=
 =?utf-8?B?WDVXdzRkWnVOUjFDMFB3WEtNblRVa2phOS83ZHRhWjBIb05GQWFCZG5CaTF1?=
 =?utf-8?B?SmxsMUd2WCtDM09NOGRpN2dmYVdtU2dYTklyanpkQkNjc3hlbmo4Q0ZGYnUz?=
 =?utf-8?B?VXVndDFIbUtBV3VCWXRLa0tlNTdIT01vUUdZU0YrNkpZZTUzOUo3MTlzdnY5?=
 =?utf-8?B?Q3R5dXF2WXpPMXptYWd6ZWxKUUIwbnpnTGR6cVZyYi9odEtUaGMvc1ZIZElK?=
 =?utf-8?B?cXBZa28yZWdtWXNXcjlLVkRpbXp2d1kzSjVyeVhCYTRrbndMRDdXY3ArdDV2?=
 =?utf-8?B?SzRyL3o4bENyNFVXbmlPWTE1Z1VIbVBWeU1NTHBYaWYvZDRCZ3ZWZ1lNYTVM?=
 =?utf-8?B?SzM1cnZ1U0tXQ1E2dkdDak5zbU9NajZHVkdZanRzMTErWVIwOURPMUJYSVZO?=
 =?utf-8?B?OGV0ZkdDRWhsWnlGYTkxMUpxUUlRY2hxMVQ0YSt2TXQ5VnljcTVvN0FlelJ2?=
 =?utf-8?B?SGFtTVNmeUpTVEYyditpMDI1bkNiUW4weVFsVUJtMFoyRHcraC9IZUJmUHJx?=
 =?utf-8?B?TkNlVGF5cktuc3E4Wm43QXBWdmQ2TVRBc0pjYjhIMjR2OUFtU0Q1UFRTSmxT?=
 =?utf-8?B?WjlQV3BpOElrK0lLWTREZGFsVEF2YzlOYUlMT0VIL0dCR28wcngrQmVJNDc3?=
 =?utf-8?B?YVNBK2lLeVdOT2NQdVFwWGxDMVUyeHdpTW9ETTVkaUt6c0hsa1UwNDRZYkFR?=
 =?utf-8?B?cWJQZXhPZGF0SkhnZ0N2R2JOUDFMUHJ3a2N6RjZRSFd5clJuaEZIaTlkdTZk?=
 =?utf-8?B?T1EyaHgwZGx0Qm1CazNuT0pKQjN2N1U4Z3Vvckl2U3V2Z0NySG5VWnlwQXlx?=
 =?utf-8?B?RzFZaGI2TEJWcFdOQWhsUHRXbFF1U2didkIrR0tPY2dCU0NlZWZxaE1QNWxz?=
 =?utf-8?B?Y1V1Tk91c24wekFXWVlZK25lWGxuZnloTGdBdTFMWFo5SWdpMy9BYWxFQVJs?=
 =?utf-8?B?dS82eE5DVGE3dmZYZHg4cXZ5U2NiN2ZMTUxmVGsxR2RGQlZOY0xUa2JubEZv?=
 =?utf-8?B?eFZXREYvejBUdmhXcDgwZzltWVcxRmZCeitYWDd3THRDeC94dStCZmRldmtn?=
 =?utf-8?B?NFpacFBBRDZpWW1LU1p4TEEzdUpiMlNGYnJML252ZHNNcXVRZjVHR3UxZ2M4?=
 =?utf-8?B?M3pYQzJCcmZuQ04xZzUwZjBuazBqYnBPWFVsK0Jja2w4WEllMUc0SHdVWkJG?=
 =?utf-8?B?cnhKSEVrNGM0NlV2bGRydGJ4N2thbTZ3bzJjVmhMeExDcWhIU3I4b1VQSzdC?=
 =?utf-8?B?MXcxbVBIMnBzVTBDR2E1SU9ZU3NuNWV3a2xJaEdncFJValJtNHZYUy9rcTJ5?=
 =?utf-8?B?UzBhRFBrM0xrT2VJWmM3YnlMNlBnb3FRYU5lK3ZwQXhVMy9wRFBGZDBBTzhO?=
 =?utf-8?B?a0EwVUtyM0hEVG5NNzNIaUo5VEpoQ3hCdGdRcmM5QkhGWjNZVEhzRGpKVEly?=
 =?utf-8?B?UzVXT1lNdDNOaWFQbk5WaHAydkg3azYveXFyd3c0cDg1TnV5UGZUL1NGVldR?=
 =?utf-8?B?bnZSQWxLQ2laNFIzaFJWWUNSUTlIVkQ1K3VxSEJsVHdXSUpwTEVPd2JYUTM3?=
 =?utf-8?B?bXgycURETXdCTzZRZnRsSTdqZmZJaEdGZUhQMTN2b0VUTnhUdlpBQnd3RnJE?=
 =?utf-8?B?a0hGS1ZYeFZ0Nm83Q2hzdDB1S3ZtbHdPb3VocnBuN1RqMW0wYmNPeFlic3E4?=
 =?utf-8?B?ZkxMTFR5TEZxT3V1THJZYk1nTWFlRzdEYXVpOUdnQzg4d3NPTlVhRmtnL0xI?=
 =?utf-8?B?azdxb3cwUTlheXBmOFQ3SXh5VUFlT0NuNE1tajNHaHFYWGJPbEg0aE0xQXhx?=
 =?utf-8?Q?03tVWHRHlFj0EqbQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09126ad1-ba59-4f2a-d0cc-08de79bee941
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 07:23:19.8660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qq+W3AxgXUUJIQwRji+nv/M3bogdgUQpB3o3iqcTYWTumr9G0DzWRVI46e3qMfqptc2dmQQVnqveBTTk4aUzYJMBIeL6noO5niYIzo8sS4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6526
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a7ddeb cx=c_pps
 a=VYnc1ZjkwFV8r4Zgssgzxg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=nVEJAy90AAAA:8
 a=Q4-j1AaZAAAA:8 a=z_5uEx5cAAAA:8 a=HpgTo1YZZgG0HNP2RNcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9
 a=Mj0Cox4YveUg3IXe:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=-U0SAjNf3xB-U7MGp2Je:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=JtrFjcrP6MhGCbC1Nd-z:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: kqM9OVHNXubENTmP7--8rg3DyYsKxSAm
X-Proofpoint-ORIG-GUID: jJTgsR4HwW4hD43BMIRO29PnB_j9nkwg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA1OSBTYWx0ZWRfX6FuirUQKYd5g
 uD/2IktTEb7DuIXHTgmneD1vQntw5HvVmcZ1qKPYq+cvwpgReF3oNisBATOXj0s//3RN52/Et54
 XRb4wVkL0WaOvdQqX87logOM0tBRJWkzgqxyxVRB4+KsdnZdZlOU+lJ74cVqJoBl1GKCfcncUDM
 niIhCopl0tja2ZbD/yCAnM+02eMJKDz/pvw2CfNtkOLKhB/5SqwaZfcB032txuJFD9f2G8+N+rP
 Hek8nHtgBoeTP7ghcIxdIFsTqzaOy1XbiNeR2gIpYYjul84ikHA7tIwTcgHCVwYcrtJY9Z6q+cM
 btWCX1dRTyeDATPlkv0GlTIEkQhTdcjRbv44NRnz5hccL+bYt/kHHwARDQrsAJqQdXDqcTrIcIh
 BpbHm/ITED5Nnga7mRxcX4TNhexLVGtbLbp75JXEhCHFAgMiDrV+masWJRmUYqMnctzAJ0yOSAh
 2JsmFdZ1k84QFFkdJWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 07:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232350

--------------0664Sv030bTpCavIogCuU5X6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6244BLvo3916912


On 3/3/26 23:16, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Hi,
>
>> On 27 Feb 2026, at 07:08, Changqing Li via lists.openembedded.org<chan=
gqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> Refer [1], PLATS linux-readline is moved, and readline is changed to
>> load dynamically, keep readline as PACKAGECONFIG to allow user to remo=
ve
>> readline dependency.
> As is traditional with people using dlopen(), this is now broken=E2=80=A6
>
> Lua defaults to dlopen() support being enabled (LUA_USE_DLOPEN is defin=
ed on linux) and the readline library is set to libreadline.so<http://lib=
readline.so/>.
>
> So the PACKAGECONFIG is not doing the right thing anymore: having readl=
ine in the sysroot doesn=E2=80=99t change the build, and has no impact on=
 the runtime packages.
>
> The obvious answer is to change the PACKAGECONFIG to =E2=80=9C,,,readli=
ne=E2=80=9D so that there=E2=80=99s still an option that has the effect o=
f enabling readline in lua, but that also won=E2=80=99t work as the on-di=
sk file isn=E2=80=99t called libreadline.so<http://libreadline.so/> unles=
s you install the -dev package=E2=80=A6. This means we should also set LU=
A_READLINELIB to "libreadline.so.8=E2=80=9D.
>
> Bonus points for adding readline as a build dependency and looking up w=
hat the libreadline.so<http://libreadline.so/> symlink resolves to, but I=
 don=E2=80=99t expect the readline soname to change in the near future so=
 this can be considered overkill.

Hi, Ross

Thanks for pointing out this.=C2=A0 How about we just install -dev packag=
es?=20
so that we don't need a local patch to set LUA_READLINELIB to=20
"libreadline.so.8=E2=80=9D. And

in this way, we are align with lua upstream expected (if readline-dev=20
installed, readline is used, otherwise, not use readline)

Here is the diff based on V3:

 =C2=A0PACKAGECONFIG ??=3D "readline"
-PACKAGECONFIG[readline] =3D ",,readline"
+PACKAGECONFIG[readline] =3D ",,,readline-dev"

 =C2=A0TARGET_CC_ARCH +=3D " -fPIC ${LDFLAGS}"
 =C2=A0EXTRA_OEMAKE =3D "'CC=3D${CC} -fPIC' 'MYCFLAGS=3D${CFLAGS} -fPIC'=20
MYLDFLAGS=3D'${LDFLAGS}' 'AR=3Dar rcD' 'RANLIB=3Dranlib -D'"
@@ -64,3 +64,5 @@ BBCLASSEXTEND =3D "native nativesdk"

 =C2=A0inherit multilib_script
 =C2=A0MULTILIB_SCRIPTS =3D "${PN}-dev:${includedir}/luaconf.h"
+
+INSANE_SKIP:${PN} +=3D "dev-deps"

With V3 patch:

root@qemux86-64:~# lua -i -W
Lua 5.5.0=C2=A0 Copyright (C) 1994-2025 Lua.org, PUC-Rio
Lua warning: library 'libreadline.so' not found
 >

With the V4 patch:

root@qemux86-64:/usr/lib# lua -i -W
Lua 5.5.0=C2=A0 Copyright (C) 1994-2025 Lua.org, PUC-Rio
 >

if you think this is ok,=C2=A0 I will send a V4 like this.

Regards

Changqing

>
> Ross
--------------0664Sv030bTpCavIogCuU5X6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6244BLvo3916912

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/3/26 23:16, Ross Burton wrote:<br=
>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:FEAC2A3F-4384-4D3C-B9CE-FDA2333=
2604B@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Hi,

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">On 27 Feb 2026, at 07:08, =
Changqing Li via lists.openembedded.org <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:changqing.li=3Dwindriver.com@lists.openembedded.org">&lt=
;changqing.li=3Dwindriver.com@lists.openembedded.org&gt;</a> wrote:
Refer [1], PLATS linux-readline is moved, and readline is changed to
load dynamically, keep readline as PACKAGECONFIG to allow user to remove
readline dependency.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
As is traditional with people using dlopen(), this is now broken=E2=80=A6

Lua defaults to dlopen() support being enabled (LUA_USE_DLOPEN is defined=
 on linux) and the readline library is set to libreadline.so <a class=3D"=
moz-txt-link-rfc2396E" href=3D"http://libreadline.so/">&lt;http://libread=
line.so/&gt;</a>.

So the PACKAGECONFIG is not doing the right thing anymore: having readlin=
e in the sysroot doesn=E2=80=99t change the build, and has no impact on t=
he runtime packages.

The obvious answer is to change the PACKAGECONFIG to =E2=80=9C,,,readline=
=E2=80=9D so that there=E2=80=99s still an option that has the effect of =
enabling readline in lua, but that also won=E2=80=99t work as the on-disk=
 file isn=E2=80=99t called libreadline.so <a class=3D"moz-txt-link-rfc239=
6E" href=3D"http://libreadline.so/">&lt;http://libreadline.so/&gt;</a> un=
less you install the -dev package=E2=80=A6. This means we should also set=
 LUA_READLINELIB to &quot;libreadline.so.8=E2=80=9D.

Bonus points for adding readline as a build dependency and looking up wha=
t the libreadline.so <a class=3D"moz-txt-link-rfc2396E" href=3D"http://li=
breadline.so/">&lt;http://libreadline.so/&gt;</a> symlink resolves to, bu=
t I don=E2=80=99t expect the readline soname to change in the near future=
 so this can be considered overkill.</pre>
    </blockquote>
    <p>Hi, Ross</p>
    <p>Thanks for pointing out this.&nbsp; How about we just install -dev
      packages? so that we don't need a local patch to set&nbsp;<span sty=
le=3D"white-space: pre-wrap">LUA_READLINELIB to &quot;libreadline.so.8=E2=
=80=9D.  And</span></p>
    <p><span style=3D"white-space: pre-wrap">in this way,  we are align w=
ith lua upstream expected (if readline-dev installed,  readline is used, =
otherwise,  not use readline)</span></p>
    <p><span style=3D"white-space: pre-wrap">Here is the diff based on V3=
:</span></p>
    <p>&nbsp;PACKAGECONFIG ??=3D &quot;readline&quot;<br>
      -PACKAGECONFIG[readline] =3D &quot;,,readline&quot;<br>
      +PACKAGECONFIG[readline] =3D &quot;,,,readline-dev&quot;<br>
      &nbsp;<br>
      &nbsp;TARGET_CC_ARCH +=3D &quot; -fPIC ${LDFLAGS}&quot;<br>
      &nbsp;EXTRA_OEMAKE =3D &quot;'CC=3D${CC} -fPIC' 'MYCFLAGS=3D${CFLAG=
S} -fPIC'
      MYLDFLAGS=3D'${LDFLAGS}' 'AR=3Dar rcD' 'RANLIB=3Dranlib -D'&quot;<b=
r>
      @@ -64,3 +64,5 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br=
>
      &nbsp;<br>
      &nbsp;inherit multilib_script<br>
      &nbsp;MULTILIB_SCRIPTS =3D &quot;${PN}-dev:${includedir}/luaconf.h&=
quot;<br>
      +<br>
      +INSANE_SKIP:${PN} +=3D &quot;dev-deps&quot;</p>
    <p>With V3 patch:</p>
    <p>root@qemux86-64:~# lua -i -W<br>
      Lua 5.5.0&nbsp; Copyright (C) 1994-2025 Lua.org, PUC-Rio<br>
      Lua warning: library 'libreadline.so' not found<br>
      &gt;<br>
    </p>
    <p>With the V4 patch:</p>
    <p>root@qemux86-64:/usr/lib# lua -i -W<br>
      Lua 5.5.0&nbsp; Copyright (C) 1994-2025 Lua.org, PUC-Rio<br>
      &gt;&nbsp;</p>
    <p>if you think this is ok,&nbsp; I will send a V4 like this.</p>
    <p>Regards</p>
    <p>Changqing&nbsp;&nbsp;</p>
    <blockquote type=3D"cite" cite=3D"mid:FEAC2A3F-4384-4D3C-B9CE-FDA2333=
2604B@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Ross
</pre>
    </blockquote>
  </body>
</html>

--------------0664Sv030bTpCavIogCuU5X6--

