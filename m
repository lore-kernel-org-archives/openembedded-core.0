Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438D9C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 09:06:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.81609.1718701552275249297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 02:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6899ef744a=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I8xQNB011527
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 09:05:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys05w2qx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 09:05:51 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45I95oMU021448;
	Tue, 18 Jun 2024 09:05:50 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys05w2qwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 09:05:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTu8MN293TD9Sp4W4CDvo+J9Keu33K1iUP7+tTcZIueZCpyD3JfKxy6APhpUCIZDfgFpzF/bjNulRTM1IQJbiNPRIzcUD+1/U3iE65/USX4o43jL3GjlARaPsiWJDzEsagDdCCKEfmIBw1qxROdX1PwMcGO1qC9RsGPMMQlXB+z1em6FCM7d/4FZAyw3fAWOQ9XqjQ0r8yPqZ3cW7nW520oh1crJi5eoSp9OEsZ17hpodAj/K1GNKduZQIsvHAKlppal+qWG/b8ghm/3OCvsOeRgAazXvAVlAdfw/h1HME25tVncT4nM4HY22Pxez/bD95Rx90t0S+NTuDJncykgGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtUJtlnM22juFwJTRk8jvvB+mZxXpJp0p4uN/D0mIsk=;
 b=UASPLEF5k7uEftPG44IhAaSqT1DGjFedCjYybYmZ55o6mZmVE6/nx8WxI9Yh7W8ih7Utp3l4FN/qyMpX2LbVhSHy8IshjSIgrrg+hAUM9jsnMX9nefn0dQNGDMTj08z8cx9/VeHDxvVyxPxX3yNf3ScxVWG4UMP54uPMTeO5YoWj6h0DbLa8VnGGw2kW9dgR0gt5R6eVd0654aa5+IGREKzZ1VLMuDScIgUkTrsfOIGNBLGF92kWdMavnbsUbr5qeQ5Bd/YHV6LaqcDhbVljStqpgyFaR1JSfX9UQcz9gedqMAOjp22Yt36lMqdY5bI9Qom5F6x/UheoId0uYgDxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 09:05:46 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 09:05:46 +0000
Content-Type: multipart/alternative;
 boundary="------------TWMnlcSLSwdwcNG02OijDLnu"
Message-ID: <b92e416f-3d33-4f84-bbc5-ec985c7baba6@windriver.com>
Date: Tue, 18 Jun 2024 17:05:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][master][PATCH 2/2] apt: runtime error:
 filename too long (tmpdir length)
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240618033019.1181198-1-changqing.li@windriver.com>
 <20240618033019.1181198-3-changqing.li@windriver.com>
 <CANNYZj-S7gkEHb+mc9jjZxXn1xfs+V=eAtTgdJ_G_fa3KfZmtw@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj-S7gkEHb+mc9jjZxXn1xfs+V=eAtTgdJ_G_fa3KfZmtw@mail.gmail.com>
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ab8aec-50eb-430d-7904-08dc8f75d71c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RjFKU3ZJcjdsRHdJaTljN2xwTm9KNjN1RzBiSlM5ZE03bHZwd3dQcktQSGVM?=
 =?utf-8?B?RldzYUNXWEdWbHN1cENWOTJsbEV2WU5ab0x1SGlMbkhBODlmZktlQTlFQWRl?=
 =?utf-8?B?SHdhTHhUak1md1J6VTRPSC8rSVA1S1ljelg4SGZXd0lHTDZVcEd4c0Q1ZDF3?=
 =?utf-8?B?MjREL3djQ1R0RVEyenNSNkVqdVJHM0ZaUzZzWjE4Q2VtTXQ4dDM0L05hOEVy?=
 =?utf-8?B?N1dYNjlPUUZxY3E1U1JCN3d1WTVPNGhsa0EvMmsyaEQwYmVoRytIZnkvRm5j?=
 =?utf-8?B?QnBNNmVMN3BHUTVCOHJyb2pHM2NQNmNEU2ZCL2JFM2lDUGozZkpSMmV4SlFh?=
 =?utf-8?B?NXo3eTVBcEVsd0lZZmwvVzVQNmJ5L0JVMG12Y1I5Z0k4b2ZZU2VkTWMyYURE?=
 =?utf-8?B?MkROWUhxWS8rUVk2YzNSTXZlbG02a3F0dTlqaGdadHlORVpORzJERkczU253?=
 =?utf-8?B?VjlHZnFpa2oyV1VoUFI0N0NyamhsZTAzL2RaYTRHYlJ2SzZSVWJ4RlVhanpw?=
 =?utf-8?B?Z3A1L0RXN3ZDR3drN1cyUUMzYW1mRStCak1BbCtYVGdZbHBycHRoS2tQRDla?=
 =?utf-8?B?Z1gxK0pDdXUrOWZuQUU1WEtTN1dQWkVENmxsaVhaY2tZT2FpbTNmcnhPUVlt?=
 =?utf-8?B?eXZvVnlZdjVxWTJQa3QwVmpnM0JvQmRpdGlSdXlLRFBDczJKcE53RGd3T2lQ?=
 =?utf-8?B?dE1lR3NDbjU2QVMrcE9tbGplU1FkRkFpV2VJMjk1TXY0UGo0R1FuRmt4VDI5?=
 =?utf-8?B?UTU0OHhMU2tDeWNUa2U1ZXdqVk1kTnROUG1RTXlOWUdWaGhZVXBBdGswaGtv?=
 =?utf-8?B?N1R3eGZrSEdLTkZReHZjQzcreE9uenQ0SzQybFppY25uY09ySGNCZE96NnJk?=
 =?utf-8?B?Rm5ldHR5bnBJNHZaZk1KOFlQUzZrdk1MQjhEbXY3VjlreFB5Y3VEbVJzV3hM?=
 =?utf-8?B?NlZ0ejJQRTVRRnRPbU1nTFFzZzIyQUREUkJxMElmVnE5YURwZlBzSEJOT0hj?=
 =?utf-8?B?cmtOM3lPc2NSanEyWUc3VHFJZWgrWXFmWkxHK3l3aEhGTEJJdGRhTzIrMU5T?=
 =?utf-8?B?Tm1WN0FyaFRDalU2dnU1ZmFQNFpQMTBPR3MyQmFxeXB5R1BSOU8vcFZXNHA2?=
 =?utf-8?B?bU5RQ0EyR0pWRXBTcy9vYXFQcTdZcnVTaWRLdmxyY1hISUt4cFlENVYzWC9p?=
 =?utf-8?B?Y0FxSjJUVnNpNlFmOEFsVk1MQTFVZThjL2RDaklYRytCR1ZlVmhMbVNyMkFt?=
 =?utf-8?B?MEVIdmpaTUplU055WnpPTm9pVTBqZ0NrZkhRc1U5d3VhSXlnWmFpQUltc0Vv?=
 =?utf-8?B?ejJZS0pWTUtuQksvRm5hNmxkRTdNL1dtdkU3ckRFSDFzRDlXRHBJbG8yeFcz?=
 =?utf-8?B?RlUxR3VZSjhhelZ5Q3JRK1E3bkwwakpyYUJFbVhJVE9WZ2N6M1Y1VkZveVdu?=
 =?utf-8?B?TlpxRVJ6VVdFSFlBYjVZVUdSaGRzOWhMOE5xTUJoU29Da3I2bkxjaFZvVk01?=
 =?utf-8?B?eVJ0WXFHTHc2TklhWmJvekVGKzEvWURNUDBkSFhyR0NlZmdnYVgrUkIwNlc3?=
 =?utf-8?B?WC9McnYyL285d3E1MUFCL29va1NDNHprZHA0RUZyYkFkdTM5N3VUZTk0RlJT?=
 =?utf-8?B?V3dCSzZweXFYdTJhTWtPY3pKYjhucDlPYkdOOFZFL1ErTmJHWmcyOU9XbSt2?=
 =?utf-8?B?dDR3LzIvN1RWaVAxdXRRTEpMVitSS3BiOGhpYWMrTUdtT01xZU9JajBRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a1hMUnVOMXdob1U3dWpxU0x1MDRDVW54OXh6eXFTeStUcVRJUWdndVdaMFRr?=
 =?utf-8?B?SGZMVE1qdEdYRWRrWmxvbzE3MWhMb0dSRkwyNjh0YWRCOFFEdlJrZUF6WlpW?=
 =?utf-8?B?REt0MVZidm1CZzJsektKUHhWSlp1SWlaS3FLTG94QW8zQUtwSDNkdHRDY0lN?=
 =?utf-8?B?MXJDdHFha09ZbTE2eW5uUlo0NFRpRHA3bmtwVXREMXlhSDhSaUZpZnFDSE9C?=
 =?utf-8?B?UFFQZDhWZEM4Y0F5eEdpS3dueXIrWWlTc29nYmVEN2k1S0FDYTZVdFdkbThy?=
 =?utf-8?B?UTF2cXowRi9VMG9XY0Z0WXIrTHRJWG9rRnR0QURDdEJTRVFCOWE2VTFKMEhI?=
 =?utf-8?B?cGhKWFVWOENFS3NVR3ovR2hYYmxna2licXF6ZksvUkxjOEJ4SjQ5NVgwbThL?=
 =?utf-8?B?Wm9rQURFL1AyYitRZmljTkQyeTVQdHJXQkF5V0xoSG95MkhNQjdYcWFSejVS?=
 =?utf-8?B?ZU1SSXUrZGJPbXJqTGpTcWhxRlBqUWc0RW5WYWg4VGU5WVRxOG1uL1Q2TGt3?=
 =?utf-8?B?T0RkUkJHcDc3clVDMW5xejB3czhsZ3ZaUm9rWkpobjgrTUo0UDhpSVgrdURK?=
 =?utf-8?B?U2dUT2wvZ3RDZVZ0TmxtdndldFhiV25ZZmtqZ0k4MUN1QUlVZ1FNUUZreUdi?=
 =?utf-8?B?NjNFWTFwRlRia0dxdG1vMFBRVjl2T1c0aEpkREIwWTkzdE5iUW00bjQ5dy9p?=
 =?utf-8?B?eDkrUFlrMjNsUW45bHZJY1dPZXBTRXBadUJNVVNIOUdDcXFTcUJRNWlwUkZa?=
 =?utf-8?B?TlZONTErTzVyazVOSHI4cmU0QU9EZGFydGJwU0s0anZNMTU3TlRzd3huSHZV?=
 =?utf-8?B?N3dGVTlhN1ZHY3dQL1hRaTA0WXlqL2xXZjVHR0pkdkhjVXQ4cWQ5SGVMcUVh?=
 =?utf-8?B?UU5DcVN6RUdFYURyVlhMSU9yMXMyNDE1ejNkbTZXWVJ0S3BSYkNqZTJtQjds?=
 =?utf-8?B?M3BtTTV5OXhTMGY5bW1pVVVEejRCMmdNeTNuZngvUGkwV0hUQmU5b2dnWTJZ?=
 =?utf-8?B?R2t4SkZTREI5bzR5bzBMenJWdU52bDBPc3N1cHo5c3VZRFdXbUg5bVJhVUFI?=
 =?utf-8?B?aFVLSGJGSXhMTmdpOTl2VjJ4dzYxM1U2VFhJU3ppeTVsbHpndkQ2SlpvWTcw?=
 =?utf-8?B?UnpDQUROWmFaQVpGbnN1YkR2M2xKeWFjTjBEeFZDbU9NZjV0Mm5tWmhDOXlZ?=
 =?utf-8?B?c0Z6TnVsc3MrTjJ6am9aVDVMb09XTWlIQXNKNW1uelR2eU1rNjBUU3VCTDVn?=
 =?utf-8?B?UDgwM1JiRmlnSzFLRWhDa0FWaUM4bW0vZ0dKaUpGQXhiaGlWdkNRcjFPQm9k?=
 =?utf-8?B?Y1NNUXNOWGJHWUp6MFl3UDZSTVdQK1RkYys4aHVTdkJlZWxEVytsdng4eTFD?=
 =?utf-8?B?V1JaZitkclBhSmpkeU4rVjZkNzhnbmM2aSsxTm1rUWN4WW9HMksvOUVyV0FB?=
 =?utf-8?B?RjRkc2hMYTlsUkM2Q05Db3A3TUNRU05mOGp0Vy9DZmwrdlBPaFA1dUNBMkp6?=
 =?utf-8?B?Rk1hcmMzSmVLZmozUk1CamFrS1hzZ2dRWERuMUhJUGtEMlhHWjJYTHhHWnk4?=
 =?utf-8?B?Q2l0VTBxUW9oTXc1QmpoVnd5VlVyZGhoR2RxK0I5cDI2Vmt4SWxDMUZmVGV4?=
 =?utf-8?B?VGZzcVpaenFmRE1WTTgzVURtb2hWSXZGMzRORitYc3FTTjgxNnFMNFdJaFRI?=
 =?utf-8?B?TlgvSVRyZ1pVNDhnUUpITlBHMG9RcUFCU0xyYlNhcjVFWStiNnB0SHlCWTlN?=
 =?utf-8?B?SnJlYUxyV2F4TmFyVGZ5Y3ZMeEQvOXR2YWZaY3EwUy9nNWJpcndadzBhaDVh?=
 =?utf-8?B?bjBUUFlpOWxHTG5LTHBCc3BCQU1mcHE2eHk0OUUxd1ErNW4yM0hST2VNYzNU?=
 =?utf-8?B?YmxmR05qVVVGa1FOMjlpTGl1T1FNSis4aHVkNjRoZUJxL2lHb3lxOEZOS1pD?=
 =?utf-8?B?KzBzMjBUL1lrR3hFN0JyVmhCWStUWjRJeXhMTUdXeTIvQ2c0ZEZtYVQwN0ZK?=
 =?utf-8?B?ZUplMzhDMjUxb1FxMjI4SmtjUWN4Y2s4WkIyek1PL3JOeXBsbU5uTzJOcnRw?=
 =?utf-8?B?UlNFNmRDekJWd3hCNGR6ZnkrWFpiUks3VjViREdwS2twRS8rSE9xdkJoL0ly?=
 =?utf-8?B?WTRnRVpnV1lKWjRGN3FOb1IwWEtvWVFMOWlNbFYrWVRKZlhxMTNYYURDVXFr?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ab8aec-50eb-430d-7904-08dc8f75d71c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 09:05:46.3966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxQwUfh+TFpUu/7bpGEUVEX/Jfkjr1wDiotyzkoXaapz5ntluLge+PzePZttoEPDUM4fx1RhVajRANJSxSDWGcT+AYvWB+7DT3XGw6iHo9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
X-Proofpoint-ORIG-GUID: 7D5O1xyVSgo3idQ1ix3EZ3frz2ySEHTA
X-Proofpoint-GUID: 03CbM30NT_d8FNZt9XLRYOFyTcdkHNZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406180067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 09:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200864

--------------TWMnlcSLSwdwcNG02OijDLnu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/24 16:01, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, 18 Jun 2024 at 05:30, Changqing Li via lists.openembedded.org
> <changqing.li=windriver.com@lists.openembedded.org>  wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> when the tmpdir dir is longer than 220, there is no files saved in
>> tmp/sysroots/x86_64-linux/var/lib/apt/lists/ after run apt-get update,
>> this is because apt-get uses the path as the file name, but the file
>> name can't be longer than 255 according to /usr/include/linux/limits.h.
>>
>> [YOCTO #2688]
>>
>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>>
>> Take back fromhttps://git.openembedded.org/openembedded-core/commit/?id=9a0c0393871eda4bbcecfdd4b595f0c1b8e42edf
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   ...he-filename-can-t-be-longer-than-255.patch | 40 +++++++++++++++++++
>>   meta/recipes-devtools/apt/apt_2.6.1.bb        |  1 +
>>   2 files changed, 41 insertions(+)
>>   create mode 100644 meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
>>
>> diff --git a/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
>> new file mode 100644
>> index 0000000000..c88efa3aae
>> --- /dev/null
>> +++ b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
>> @@ -0,0 +1,40 @@
>> +From 918295aa1320718d342116f76c98d2289d377800 Mon Sep 17 00:00:00 2001
>> +From: Changqing Li<changqing.li@windriver.com>
>> +Date: Tue, 18 Jun 2024 10:32:55 +0800
>> +Subject: [PATCH] strutl.cc: the filename can't be longer than 255
>> +
>> +The URItoFileName translates the path into the filename, but the
>> +filename can't be longer than 255 according to
>> +/usr/include/linux/limits.h.
>> +
>> +Truncate it when it is longer than 240 (leave some spaces for
>> +".Packages" and "._Release" suffix)
>> +
>> +Upstream-Status: Submitted [submit@bugs.debian.org]
> Was this submitted just now, or is the status from the original patch?

It was submitted to that maillist just now. And it did automatically 
reply me a bug link later.

I will send a V2 for this patch to update the bug link.

Thanks

Changqing

>
> In any case, we need to trace the submissions, so please include a
> link to the bug page if there is one, or (better) re-submit as a pull
> request:
> https://salsa.debian.org/apt-team/apt
>
> Alex
--------------TWMnlcSLSwdwcNG02OijDLnu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/24 16:01, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-S7gkEHb+mc9jjZxXn1xfs+V=eAtTgdJ_G_fa3KfZmtw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue, 18 Jun 2024 at 05:30, Changqing Li via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:changqing.li=windriver.com@lists.openembedded.org">&lt;changqing.li=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

when the tmpdir dir is longer than 220, there is no files saved in
tmp/sysroots/x86_64-linux/var/lib/apt/lists/ after run apt-get update,
this is because apt-get uses the path as the file name, but the file
name can't be longer than 255 according to /usr/include/linux/limits.h.

[YOCTO #2688]

Signed-off-by: Robert Yang <a class="moz-txt-link-rfc2396E" href="mailto:liezhi.yang@windriver.com">&lt;liezhi.yang@windriver.com&gt;</a>

Take back from <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=9a0c0393871eda4bbcecfdd4b595f0c1b8e42edf">https://git.openembedded.org/openembedded-core/commit/?id=9a0c0393871eda4bbcecfdd4b595f0c1b8e42edf</a>
Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...he-filename-can-t-be-longer-than-255.patch | 40 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.6.1.bb        |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
new file mode 100644
index 0000000000..c88efa3aae
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
@@ -0,0 +1,40 @@
+From 918295aa1320718d342116f76c98d2289d377800 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Tue, 18 Jun 2024 10:32:55 +0800
+Subject: [PATCH] strutl.cc: the filename can't be longer than 255
+
+The URItoFileName translates the path into the filename, but the
+filename can't be longer than 255 according to
+/usr/include/linux/limits.h.
+
+Truncate it when it is longer than 240 (leave some spaces for
+&quot;.Packages&quot; and &quot;._Release&quot; suffix)
+
+Upstream-Status: Submitted [<a class="moz-txt-link-abbreviated" href="mailto:submit@bugs.debian.org">submit@bugs.debian.org</a>]
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Was this submitted just now, or is the status from the original patch?</pre>
    </blockquote>
    <p>It was submitted to that maillist just now. And it did
      automatically reply me a bug link later.<br>
    </p>
    <p>I will send a V2 for this patch to update the bug link.</p>
    <p>Thanks</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj-S7gkEHb+mc9jjZxXn1xfs+V=eAtTgdJ_G_fa3KfZmtw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

In any case, we need to trace the submissions, so please include a
link to the bug page if there is one, or (better) re-submit as a pull
request:
<a class="moz-txt-link-freetext" href="https://salsa.debian.org/apt-team/apt">https://salsa.debian.org/apt-team/apt</a>

Alex
</pre>
    </blockquote>
  </body>
</html>

--------------TWMnlcSLSwdwcNG02OijDLnu--

