Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB0CC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 11:44:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8355.1720093491600082959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 04:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7915cbbb95=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4648Mwmj016562
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jul 2024 11:44:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jrsge5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 11:44:50 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 464BioJm006502;
	Thu, 4 Jul 2024 11:44:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jrsge5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 11:44:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBjvZ2ShS++r8jWTnuqgiMbsj2pI0IluFzE9DcFCtYQc4hj7Y08K15F9REX2G8yxHupo1XFe5ceOQPkq/RCYqIEpcTMWVHeg+lZxcc88E0lJUVgqlYyBpbL/VLG2eWGCKkNd0zvSQeBul6yY6xTU9p1YQHOulh2I3j+Vt5pG9XYu9y1J8elXy3cdWpOVf6PTu1bryYUGVdDLA9cnUuZ+rD9GSPPRvY+8C/+PP0svwH8Eeul8bAD9j0yCv9cGiCLhKxKIPrWIrcjCBJ5sHu0d0ix4tSONkUWLyJY8TsJ/5xFaTXETHrpoY2W6L/mJD/sJCmZUTJ+3ECtvlIx16P2CGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbzUtAjHulokL5ckJf4zWSkrBFiof1sCjVHz/kD85P4=;
 b=Vr4YkQ4PksCQ9tPmKHmcjEqi+ixBswtFug1i/MyVb4l9V2X0Pit/8p6xsdrRfb2rq+prU8sLAwD/tOqAdSOSy58ZCPtxjJw2V+GRE4CdTRCz56wEHH2ZrOUiEDrN1F3n/2hNZoAAgOZbvsV3aOBZhpGGS/TdlSlfEjYmg5mfQpPJSGTlOdYirf5XxzHBSz9V7t7a5D8INZvHmKN/YY4WsAgD3UbdpB8Epmv01wBFnYysZju/nv4srUvcq+j6G+LvEaYFzCVe/cALzsqtjbN/GjF0t0dWCeF8q7qkS5MFgpvrOY6LORUPqunHU4qkw6DU2wDqs08mXKoUiHHpeIxzPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by BL3PR11MB6338.namprd11.prod.outlook.com (2603:10b6:208:3b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.30; Thu, 4 Jul
 2024 11:44:44 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 11:44:44 +0000
Message-ID: <daf07720-a442-4d63-a2b2-a9cc27fa14f3@windriver.com>
Date: Thu, 4 Jul 2024 17:14:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 9/9] rust: Upgrade 1.77.2->1.78.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <31491.1720072149300569224@lists.openembedded.org>
 <Groupsio.2.31491.1720072149300569224@lists.openembedded.org>
 <17DEFC31DA378080.5810@lists.openembedded.org>
 <CANNYZj9PzQg+FfTdULjsGty3J2w3eyVu5kktQA0HdJS-h=E1KQ@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CANNYZj9PzQg+FfTdULjsGty3J2w3eyVu5kktQA0HdJS-h=E1KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0154.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::38) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|BL3PR11MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: cc8c8958-9976-428c-3ac3-08dc9c1eb2b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U1dYMWpDajdPR1dMbXhlT1VycmpGd0pOcUlJcjFBaUdFdytFSWUxM0pnSGo0?=
 =?utf-8?B?dW8rcVB2Sjg1MFVSbG1sdmJLakRmNVV6OG9JaVZZWVYzVDViZW0wY2lRNGsx?=
 =?utf-8?B?a1pZWEdoS2pjS2w2RWo4RGU2TTZvVW5ndXRmVjRlSDFvVEJFc2ZCenNXVnFL?=
 =?utf-8?B?ZDIrbHRTMkJCblBCc3k0V3ZmRjY1bVVqRUdOb0NFempIZ0ZPM3AyejkxVStX?=
 =?utf-8?B?R0hsVTlnYzZEZTNUTlR4cVRPYlREMXE5T2tZZDB0cE1HSGxTVENjS0EwTU8x?=
 =?utf-8?B?cFZOa1Zhc2VKN2lYaEhRd3VsOXdDQlBLZElUZGFVS0tPcndPNkE3NXJZMkhp?=
 =?utf-8?B?bXVMb214RVI5bU1WNjBvMlJWdlVxeldGejZSaHR3Y1U2WlhDZWl1UElZajBp?=
 =?utf-8?B?N1pGWFZrdlBLU0d6dndJOXFjRWd1MWtkQ3I0c01mR2YyRDBHZWR2Z3JHTGhH?=
 =?utf-8?B?RUR2M3RWeU9RK1d3WXV0blBNN24wcUJ2eUNPZmNRT2M3bHlCZnM5MmMydTIz?=
 =?utf-8?B?cytpMFZlL1JFYUxhSnFaNC9mZkZJZFExbFQzQ2d2aHRwemhFdUJqaGU0R0dR?=
 =?utf-8?B?YWtLK2Y2TjlNOUxuSmY0Y2JEb3FKQzJ1V2VGTlBOcVNDL1FNT1JmUHdTb1dW?=
 =?utf-8?B?dTRodjROR0ZxTVEyc2d5SUlic3pKOE8yYVkzTmlOcmVjNVZhRDJpdnhFcytV?=
 =?utf-8?B?QTlGRHBaeUNLblFhZndpOFpJdWtmQ1hLdTFDaGdHVThGaG1MNHpiWC83RlRz?=
 =?utf-8?B?MXFvRXN4OXhQRERZNloxZWJlRzlCbnZMK0kwRHFGeG1CM2Zac3JlRmdRK3Z4?=
 =?utf-8?B?WGk3TWlCMXhIWEIrK21uZ2JNb0NUenM5cUVkUnExUUVBMDlYaDI1d2lxaG56?=
 =?utf-8?B?RHZGTVg3QmRVTHFVRlJlYVkrQWl6NG5BNU5zUEo0cDJ2dGhLaTl6cW55Vy9T?=
 =?utf-8?B?U2toMncwNUdFeEtNMFphSkJ3Wk1BZG93WU1QNnRqWEdQbmQ2V0VNZDFCRlN0?=
 =?utf-8?B?b2dkcC9IbmVtZ1JaSzJPV3U1UzJjNFV2Z1JqdmlSSm9NUWNDNHNqRWw0dDg4?=
 =?utf-8?B?MmxmUkc0eDgyZi9MRDlSK0l3bm4yMS9SbFovN0I5emNtc0FQL2xMd090M1Nh?=
 =?utf-8?B?dEhtbjB5Sm5QdHVqbHllNlkydW5xUG93eFNJOWhIWXJMa3FVQnptRHVsb2J6?=
 =?utf-8?B?SmdGcHAycXlUaVpGR1gvaTFrYXgyOXNubkZtdG05eURGYUlsdDlOYUVhSkc3?=
 =?utf-8?B?VWJvVkI2emxtZEQySk9ka2tUZXdwRGdYRkR0MHhKcHp4Y3VkenUrb2dlQ1pS?=
 =?utf-8?B?SXBmeVpQMWw5WUVVM2NHWkVqMjUzU2ptTmFoQkthWm1rejZnWGljc3VrVUpP?=
 =?utf-8?B?SGR5ZXNnTllTSjdNbVQ2R213U0sxUDV0VFo2djZVSFdrRmMzR2FlRnF4YStu?=
 =?utf-8?B?WXZiMW5mVWVkSk1Cc2tYaW5iYWNkRjk2bmVRbC9vQVYzUHl4OGVkdDFxQVp0?=
 =?utf-8?B?eFhOdlZNbUNHcGNYMlRab2FVYmhFN0F6U1g0c1lRelc1VnZBc2JFL3lpVG1r?=
 =?utf-8?B?WkpZVTgydzljZGpwSm5nc0NDbmNRdGVaZVZBYUx2elppbktIa2Z5MjI3ZjFC?=
 =?utf-8?B?Tkw0aHBMYUhUT0JNK054cDVQdHJqbTUrZUhaQUVOdEk4WGd5RVR3d1k2VTBt?=
 =?utf-8?B?c081d0NJTlZaQUJjTUh5cExBYWdaV1BtQmcrZHROM0Y0Y3ZtU0QwcGZvWlUv?=
 =?utf-8?Q?xHOUQt+lGYaYIuSjdw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2RmMUFhVGhxRzI5S3FDV0g1TlY1em5JM3M1djFyVHpGWjBxMEFBdEZCOWF0?=
 =?utf-8?B?NmJnanVCV3hoZE5ZaWRsZFVqQjVZNmppdnJXenV4ZU1FY0V0R0sxSHY4MVpp?=
 =?utf-8?B?YUxnYm9pb2NIcm1jY0k2anpvMDk4Rlk2dHN1YjlmZTEvcEQ5Zk1FclBnblda?=
 =?utf-8?B?RHlzVXc5YXQwaDk3YkpzWmJUQUx5bzJlSkNyZ29zaWNkM0txNUxJTXlCam9i?=
 =?utf-8?B?OFNTTHRpaVgyenhTa1VKRldSWGdtY3h6OFVHY0JRMDVpZG5HVjZrRG9rcFhD?=
 =?utf-8?B?K21sbFAxVTFIQWZLMnhFbS9jVjlaZkJ5YW84Tm5sNy9qa2Vvbm01V1BCejJs?=
 =?utf-8?B?SWdQdU1LcjVzNWRwM2VmQVZ4bmFPb0k2ZW9peVgwZUFrZE90dDhsMUtBNWpR?=
 =?utf-8?B?N2hWZEtBVUMzLzRHa3pqQ0xBQWdzNi93RnZUa2thcWZaSVI5S2JSUEtrUjA5?=
 =?utf-8?B?WWpuY3ptc0IySzI3OXI3TnFPb20yQkx1bVhWVlM4TmxrL3hURTdSdEsweDRy?=
 =?utf-8?B?UVFxTE5lUENXcFRuOUpHdnNWejd3d2h2c0F1MHJNbFVWeTZzVW1hQ2xUUms2?=
 =?utf-8?B?MENLc0NjdGRnYVlOWC84TWtnL1EyQjlRRUxaZzRBSjZwVDdwUmxDQzBhVzNq?=
 =?utf-8?B?d1VWSW0vTUNkdHIvZVRvcDkwRHZIUEFZWHE2eDFLbVF3MmlTR3F1Ky9BaUdp?=
 =?utf-8?B?YitOVXJhclV6Q1llUFI1RHlJbFlUbHJwbDhzZW9HaTJhNGJBL0JaaVIvZm8w?=
 =?utf-8?B?bGEyWjVqUU5QWXo2eEpyRk8wbTU5WFhabi93RWdVQ0Z3b3UwSVVBamp2UkRs?=
 =?utf-8?B?K01XSWZiRXBMeWdwVkZXdTNqT3FMTU9NcGVqOEFLMDBwcnYzWUdDOUI1bHAw?=
 =?utf-8?B?cnZqTzljQldvSWdMYTdPV2lQM0pFc0JRem0zYkkydHE1YUgzNVlqVWw4dzRp?=
 =?utf-8?B?YnhTNTZYbkFIaTNSZEdaSktzZzFuNG8zVkY2cEFoVTNyRUhlZ3BiMWFyUC9q?=
 =?utf-8?B?RHh3bTRyTUZYTVFONG1JN2RUaldaRncvREZyWW1BZmhQR01HVHBzTHFVR0hi?=
 =?utf-8?B?NHU4b3FBQi8ybmlXbzEyU3k1aFpDOXdyU25nK1BHYmxUN3BrK2RUelczVEVi?=
 =?utf-8?B?QnJFQlk0R1NvVHBhVzZQeXlGMExENHduZkx4STQzejZsNzNtcGlMeEpZUjNr?=
 =?utf-8?B?Q083UVhNd0hiemtlRGk1WTFuZXVVaHpreSs0WDc1YlpIVlhqRmpoRzhwRS9N?=
 =?utf-8?B?ZEZOdU93YnV6RU5oWEdoU2ZnRkFSais2WjJVVVppUENFaDltZU15L25NUWda?=
 =?utf-8?B?REQ4NnIxZFJxU3JOYit2Nm5hNHZhRnJndndNNCt3aE1UZVVCVktQbGtWZjEr?=
 =?utf-8?B?KzFDdWY2N1NtMzFqVzNvekxUemJhQWRVVmlqQTFLaUd3dlNDa0FHdnpQQnpS?=
 =?utf-8?B?MVBhdlowTktiSlRQYWxzczdicDA1MTlLQmVUa01TYjNjYU1sMVJ5LzBvb1Jr?=
 =?utf-8?B?UXRtOGdJOXpxbnpEMkx3VEZUWnRmWHp1Z0JvY0ZVcFgxRWhWMjFZM1JlV3VV?=
 =?utf-8?B?U0NIb29WaXA3VWVFYTQ3NlFxYzZCYlVZNjJiOGRXRFAveVRtcm9UekNHeUY4?=
 =?utf-8?B?OG84K0xmMmZmSFRrZVIrbUxDNDhOK0pjazRHRzdrSkEzMUhUbDBDa004WmIv?=
 =?utf-8?B?dUpoN012dG0vd3dhNUJvWjd0cVNWMy83UzdzaEVCdlNyY05xU2JYMWlPNUdB?=
 =?utf-8?B?U1hySDB0bGFlVGh1SG5PdXNmeUJ4bTh2MWRwZS9LaExlR2wwMkJvd1E3TDhQ?=
 =?utf-8?B?R1FSWjdoR0tZZ2E0WXhaSVgwZG1jNy9paDMyWUJqdmR2aU5iaW8yUDgxK2xj?=
 =?utf-8?B?ZTV4cFVPMWhZalFGSXhWNHUwcGFMdU1MdzhQYklqSFNNTEVEdFhmZHkxWCtP?=
 =?utf-8?B?ZGdQK05DWjFEejU4NjlhVmNTalllMHdIbHBPaEFLWFIwbVp3YTI2d1B1eFJT?=
 =?utf-8?B?cTBtSVZMUGlTbklxWktJRkNObTUwK05JTHBScE1oTmJndXlKeDVDaFpoRVJv?=
 =?utf-8?B?VFI2ZVhMYXFkVjg5UEZ3cXdOVFJMeHZIUm5vWXRyR1g4cWVOK1pKZ3dUZ3Ny?=
 =?utf-8?B?ZHRTVWNzdUk3bmJLMmZTRC9ZQy96T01qQklZT0paYWhaUjU1cWpiT1d2Z1k0?=
 =?utf-8?B?ZlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8c8958-9976-428c-3ac3-08dc9c1eb2b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 11:44:44.3567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaSQiZkNVtpGPH/pT1QRBtA2rdhMfvBb3V4tmyKTpI97bqn30vcDAEI+X/hVaT0p+18TOsv4g50+vL1zvPJpiXbAKo+/c441XeyNgZrNwYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6338
X-Proofpoint-GUID: PtYASmhfzmL_DVKeECWjNertkCS5JCT1
X-Proofpoint-ORIG-GUID: fAcGqK8TIM9NS3vM1O2x9TWfROy_FvCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_08,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2407040083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 11:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201540


On 04-07-2024 16:52, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, 4 Jul 2024 at 12:36, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
>> It's arm/arm64/x86/x86-64/mips/mips64/ppc.
>>
>> Given that rust upstream has all mips support in tier 3 (no promises),
>> and ppc support in tier 2 without host tools (only building standard
>> libraries for the target is tested), I don't think we should be
>> fighting against that:
>> https://doc.rust-lang.org/rustc/platform-support.html
>>
>> Those targets already have reduced testing via arch-qemu-lite here:
>> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json
>>
>> and I think we need toolchain-lite as well where rust would be skipped.
> I see that mips32 is already skipped by the test itself. So maybe
> mips64 and ppc should simply be added there.
>
> Alex
Since, rust upstream also doesn't have much support for those targets,
we can skip them if everyone agrees.

Regards,
Yash

