Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1899C5320E
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 08:46:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.206264.1724057177539288968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 01:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8961296bbf=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47J7NwTI011267
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 01:46:17 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412q541dgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 01:46:16 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47J8kGd6004181;
	Mon, 19 Aug 2024 01:46:16 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412q541dgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 01:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dq99apclC4UiJpSRR45ztNlLYFRzKPqkxXz6eGkjyztIjri7g7Ja3yZQbjc3Qo8tpQ5hpsYRjRlPIial8BhoeSHctqt+bIWooZdZ3baXjlfiTr+PymTQKuHgtyUEN5JfcVK1xOLKXA5zclABZEcliBiLoUr+1F2CUgA9fxIvLv7dveyEtBGdiIIfBbs8gowjCd7tK9anOX/HxuUAogC9zyePAe1YDIL2m5GwcUmhJZWQAHgaYm0lptXAJkxA1OaLJtLV0LZEZ0V79Bq49QmmYsz10C6Ow4NSpofwlonRxQ7O1LcflZMXWdpJN+AjCuYdZYFm4aVUPrwH4uWJ9X1ZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7vbzvAhrMrRt+ZiRPgQA6XCayoQ2WUjGRVrBLSwqQo=;
 b=TaysmrY2LRSgs1HfCSxbdS6X79tUD8FmaChPv9auFsGAKC4j10qbHbTxTWeIxlpjaP6KenPmlHkAzVEeoXYjLJlnRQnkBnX3FKxGOL0nQXy93mdg1mNDhUjCp5qtae4mqjZ+5B2cGniWjCXGAqOg7vDnQAyEIbWqm2e/hgx7G7aR2/TILkmNHO4DuF5Hdqn7PNhwk+3x6lqjyajeojL5JLaEYKgW3COKhxLtxZAwmzxdiXLcbRul6DBQZg9s066XVH78seTeWSU4SxqKXSLHZ9F+gcF8ziNJt3+fWMh6X3+uKFsrt1TE6mffHTRYQ1qfaV3QouxX+bKsvo1S8MPpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by MN2PR11MB4534.namprd11.prod.outlook.com (2603:10b6:208:265::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 08:46:12 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 08:46:12 +0000
Message-ID: <f854e120-873a-4822-acd1-84a01651e81a@windriver.com>
Date: Mon, 19 Aug 2024 16:46:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
To: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
References: <20240819082215.1322013-1-niko.mauno@vaisala.com>
 <17ED14A5FE0BDAC0.10903@lists.openembedded.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <17ED14A5FE0BDAC0.10903@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|MN2PR11MB4534:EE_
X-MS-Office365-Filtering-Correlation-Id: 1820739e-da3a-4e1d-51a5-08dcc02b611c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cVpVcWFLdUdzNkYwRlJXVGFiZWJIdXN2ejZPQ3lIQUtKR0c2SEdsRTkvOFl4?=
 =?utf-8?B?UW9KZXJUcE5qTWhRbktmRWFmZ3dmMllJbFFvbndwLythU1VLUytKRDFRdkNE?=
 =?utf-8?B?VzNkQW1DbkpNOTY2cWRiYXUvRG5sTkZrNk5OcjJyc2JOWFVrWnBSbTZiTHRD?=
 =?utf-8?B?OXFlcUZoWGNETDZDQUVKcFZaVWhxVkNNM2FiSVNkd3JtOHJ5ZW52UC81OTl1?=
 =?utf-8?B?UEplMFcwVmR3eDQxRmlTUlJsdVg5OWQwSmdoNU84dk03VWhpcnRJbDBrVHRm?=
 =?utf-8?B?VENRMkFOcDZHdXRoU1Z6YzROVmlVeElWbHZXRGo2alJPditnU2pPZDF6cHU3?=
 =?utf-8?B?eUZjeU9NRW0xblRJUVAvNXA0RWhRY1FIZlo0bkQrSDlCbkc3VFNHUnhUSTA2?=
 =?utf-8?B?dHB3TFRPWlF4K3RKdE04dEhVT0NDMS9YbGNpbVJoMmlidFl2blpjWElWTXhR?=
 =?utf-8?B?OUZFdGdNWENLelIzYS9KdXI2Sk5PYzI5dlNGc1RRdVZqKzJXcFB5bUFoLzM2?=
 =?utf-8?B?SjZLZFQwNDlqd3l6QndYNlMzMFZHNU1MZGpPcXZTWWxEQlZJZFhLZ2x5d2xa?=
 =?utf-8?B?ZWxvRE9pZGpNdmg4U1NsNmxuWGs0OGRMRDAvcnhBbnB3QzBQUkhCVVFaMkRa?=
 =?utf-8?B?eWdzT3J4b2hDR3pJMVJYYzVaSzZzOWhrQkxXbGxpRWJwUWxkY2tpcHVRcmE3?=
 =?utf-8?B?WUNVOGtrTXF1NVEzZ2xuVVlFdVkxYnJTRjcwSElHR3dXeld4bG9lcDJJZXo1?=
 =?utf-8?B?QlNIbTZLbjlZZFY0NnZNV0VobGpHK2lnRDRKamphakMzcTNtbXgyVWs2cTEv?=
 =?utf-8?B?SC9nOVRlT1h0TnJ0cmVQM1BQTUxBVFYrMUtlRUJQbGJBOW9kbmhuUkRYQmgw?=
 =?utf-8?B?SnBESkwyT2twZkJxWDRBdGlpUFlKN2lGanpMaTBSNzQ5SC9zdVhpbkd3dWMr?=
 =?utf-8?B?OVJvM3A4Y0x0b0crK3FRakF0K2JmNnQwWk1rMlA4OUNYMm9uU0dVYnl3b2hy?=
 =?utf-8?B?QWdCYVhDYTFYT3lSaEZvaGplclB3ZXJOSFMvSWhrN3ZVTGY1bzJPcDE5WDJk?=
 =?utf-8?B?L3VBcnNpOWNmdmlQaU1Wc0t0N1dscjg4WkhzWFZPWDhBS1l4SnBVR1UzS1Jr?=
 =?utf-8?B?SENFUEdPQVFNVExSdXBtRnhHMlZyTUdZU0Z0a2MwUlNPN1EzbHNMTEpHUkdx?=
 =?utf-8?B?K3dYSlZoSzVWVDYyVWdpTFIwQXJMc3ViWDFtNmNiRnlnNEQvRVU2ZkM4UVFy?=
 =?utf-8?B?clAveW91bHVhZ3k1YXVsWGVqdXk1WG5Zd2gwK1YzVHFGZkFtSEJ6OGxHcVRn?=
 =?utf-8?B?QkxpR0VwNVBEZ0VlQ3d0aDVoclQzclFBcUx2QTNSVzBXN2JhNmovanNFK0FV?=
 =?utf-8?B?TCsvZkVxRzNSQk1aMUI1VkdYemxBZUVLUml2d3pqNFRYd0hrc0dTMjFzRWRo?=
 =?utf-8?B?bFB5OVVXMll3MXNUY1krRmZwdUYvOWdPVVdyVzlUY3M4WTB5bjV6TnBlelVN?=
 =?utf-8?B?R0wvK1FJZFJTZHliTnQ5Q2k3cWZOUTRxakZOWis3Zjh3ajh0Nkcwa0tJelpo?=
 =?utf-8?B?eXQvT0dINUt4VXZTU0I2NTlSV0lpU1ByNk83YlpkaDJoV01SWHZvV1Y0aFJU?=
 =?utf-8?B?T001S29QM2RpdGZTQTBrV0d0YUNTVEVnUWxzcWhVWjk3RCtYdFM5YUwwU0hu?=
 =?utf-8?B?R1ZBMytXemtlTTRxVVZCNVBueVpRUzBaVDI0SitpWG9GSWxTYXBXc1dOVHls?=
 =?utf-8?Q?q/w+Wd3Z0WrI8rxb1os8/5qY3EtYoj+Mx5Gjbiy?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkF1OVhhOHU3TUlZVHh2RUtmKzUvYmhCVkZDSXBZUFZZenArUndoZU5kRVVU?=
 =?utf-8?B?ZUdURnpVb3pvOHp1OE5nMWVjRXFDeXc0NHVJYWNtWXhCTVRLdkpZSktnd1pi?=
 =?utf-8?B?aytNWC9POHA3YTJVbHhXdDdsd205MlRsTnQxRGpuZ3YzRi9aVjh0eUFtYVFh?=
 =?utf-8?B?NnJvaGdFYlErVU5iOWdzRG8vSzBSd3hNa0RBNmxtc3UzTWFFNldiRVdiT1Za?=
 =?utf-8?B?U2lyRFZ0MXk0eVo1UmtvV0FPdjJva29IcEhHNHZtMUs0ek9TNTJPbXVoU1B2?=
 =?utf-8?B?NWsvRG9Wc2pkMzNWN2puSWJnTGxCS1hWZ2dLNTdEbFI2UUtnU0NzLzA5cE9k?=
 =?utf-8?B?N1FWcXlGMitvMmpXaGtyVU5vOUFQSmF2UnlMZk00am5McDlVQzg4WUYrVEl1?=
 =?utf-8?B?QTkzNlV3a2dWUklhV3NyQlB3dFpuTW13RHZyRUFjWVhJTSs1YzJaNFNHZHJS?=
 =?utf-8?B?cDBzeVBqSzZlNjRXMjdjSElRQTFuaUVla0kxQ0liRTVrb1hhYnQ2MGdFMnR5?=
 =?utf-8?B?dWo4Y2Y0aWRhSk9zUEprdW9jSWhqZExuc1hnMFVsWG9uMUZyTGdOd3FBSGJU?=
 =?utf-8?B?Z3pZNCtpRTZ1YUxKOG1xTW1ZQkQ1QUhCVndaZVM3aVRsUWR0RWdzK1Y3OVY0?=
 =?utf-8?B?bmhrck5xWC9OV3ZkQjV6QkRSYk9iTUJMajJ6NG1ZL09Wc0dkRnNhTElZUjVx?=
 =?utf-8?B?K0dOTlFWelFDK2k2OGJjMndUSTZBN2FzcEhqMVYzSVJnVkwyMzVINUVHa0NM?=
 =?utf-8?B?OVFySEVFR3JLUHpjd1lia0grRkx3cTNDU2xXNlQxL0U3UkVoRng2T3ZYdmNn?=
 =?utf-8?B?VnFDR2tQY3BwOEttY2xpYnhQczVHUEovdkVzYVFGTkIra3ptSENDVWxFNVdy?=
 =?utf-8?B?MHZISkNTb3JQbTVzUHQvd1VRYmpIUkF2cGQ4dEFoZXBqRXVUSHExcWxnMzNm?=
 =?utf-8?B?akY2UWF3NDhDYUxTVXVPVysyVUhmZXJMYmM1c3hJdythcTdRczhjSGZvdGdE?=
 =?utf-8?B?dVlOS1FqOVZUb0tOb2pBdVF6dWEyVnJFQWlEZVR3citET3N2OTRZaENyTlBP?=
 =?utf-8?B?dGhwNTJXcE1Wd3craXBBWmdwbFUwQUFyY01xSUxYZldQdzhmVExQdGtnWUlJ?=
 =?utf-8?B?ei9BZWVVVVljVlRVVHR5S2pZYWthYmo2cEVJMTV1SWZKek50WDNXRFZlQi9N?=
 =?utf-8?B?S1JrUkcwMjBvQStGVWs5cDkrbEk0OVEweXBkeUtSNnFQYndkaFdyS3p3aUNG?=
 =?utf-8?B?d21TMEMrenVES29WTWFiTTNlL1NaM0QxZzhMc3E0dHdQQk84bmZLQmRzeVVH?=
 =?utf-8?B?emd2RzN4Zzl1V1ZxTkZLMGwyZnJic0lsdld4MlJ1VHNob3hTQ2s1ajI4MENW?=
 =?utf-8?B?dTdHVk11M0RoZldHSERDaTRTd1k1OW9iWDZPSGxXdzRoYlZSVmxOaG4xRDUr?=
 =?utf-8?B?a08wNlBZUEpESVU2dk1JUDVUanBubUVhOWpoMzZKc0JrekpUSzRsSUlqQVlL?=
 =?utf-8?B?eEpObng2TThKOUExQ0NPMU50U05Vak5ZMEM3ZmhBZTRHdW00cHg3d1Jvcy9J?=
 =?utf-8?B?WmlVOG5obFBhR0U3dy9KVDNKL3duWkpFNHljbEpNWFdTZXkyekw5b1JseFB4?=
 =?utf-8?B?TVNuT29jaWFyUXZvZy8waVdFUnBrMkdkbXFKL1lKdGhkWGZzcnV5YVZkSjZD?=
 =?utf-8?B?VjgrcFM4NmI2SElSeTY5T2VRQklNT3lVOE9rcnYvSzROWGtSc21VK2hQa210?=
 =?utf-8?B?Tk5vWDQ4UHhoVjlnNmltSm1laXQ1WHVaQnpxejFoNHZUL0hDMjdjdHZkVVdk?=
 =?utf-8?B?b093NUo2MGpUM2o1RzVwMExlR0Vta3prM3c0bGJLRlBNeXIybjdOM0x0cmEz?=
 =?utf-8?B?Wjd0YVNMYXVBVElRN012SW8ydnA5dUhHQ1MzWFlxK1VUekwxTUFubEZzek1z?=
 =?utf-8?B?NEY3Q2tBcWprdGR1Y3gzb3o0MDJrMnc2Q3doTFpSelJtVFVYM1lLalpwaVUv?=
 =?utf-8?B?a1lNb012UTV3QjRHNHZobWs4WFd5RFEvQnFXVDdwOVRYSnRvMndISWQzajFx?=
 =?utf-8?B?MXZNQ3UvbG9Ib3dxNGRyNTRYN1Q4a1Jtd1grdXdvMmRjMmlwTS9OTldVd0tT?=
 =?utf-8?Q?ygJA/QYLq55nCDcm3cTwD5l1d?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1820739e-da3a-4e1d-51a5-08dcc02b611c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 08:46:12.6093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/qUED+s7JVFVIN9Usrv6Ym1Em/rWLuP4nigGDhWJT4AjNQNKwmQWuhR9ZbKzbEpzkUajSyxXw502gVLw0H+UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4534
X-Proofpoint-GUID: Z9Dspzz6gcwHC9krTNGwA9HDyLIlFEcp
X-Proofpoint-ORIG-GUID: j6u3cXWiFPN59nefjbnn8bTM3awsuRVo
X-Authority-Analysis: v=2.4 cv=b+3g4cGx c=1 sm=1 tr=0 ts=66c30658 cx=c_pps a=JZW2CxG2E6UWpsn1SfDs7A==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=eWRtdWc1AAAA:8 a=t7CeM3EgAAAA:8 a=q7VCI_wDtxHqIyHiihsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AjGcO6oz07-iQ99wixmX:22 a=fQEa9puXOWAy-YWvlEz7:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_07,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408190062
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47J7NwTI011267
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203491

I agree with Alex, if we really need to add this PACKAGECONFIG, the=20
default should be enabling mountfd support.

Regards,
Qi

On 8/19/24 16:42, Chen Qi via lists.openembedded.org wrote:
> Please see my comments in your v1 patch.
> I don't think we should add this PACKAGECONFIG, instead the=20
> util-linux's check codes need to be improved.
>
> Regards,
> Qi
>
> On 8/19/24 16:22, Niko Mauno via lists.openembedded.org wrote:
>> The 2.39 version of util-linux took new file descriptors based mount
>> kernel API into use. In relation to this change, the upstream release
>> notes in
>> https://github.com/util-linux/util-linux/blob/v2.39/Documentation/rele=
ases/v2.39-ReleaseNotes#L14-L21=20
>>
>> mention that
>>
>> =C2=A0=C2=A0 This change is very aggressive to libmount code, but hope=
fully, it=20
>> does not introduce regressions in traditional mount(8) behavior.
>>
>> After observing following failure when booting a board using a bit
>> older 6.1 series kernel together with initramfs rootfs based boot flow
>>
>> =C2=A0=C2=A0 [FAILED] Failed to start Remount Root and Kernel File Sys=
tems.
>> =C2=A0=C2=A0 See 'systemctl status systemd-remount-fs.service' for det=
ails.
>>
>> closer inspection revealed:
>>
>> =C2=A0=C2=A0 demoboard ~ # systemctl status -l systemd-remount-fs.serv=
ice
>> =C2=A0=C2=A0 x systemd-remount-fs.service - Remount Root and Kernel Fi=
le Systems
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Loaded: loaded=20
>> (/usr/lib/systemd/system/systemd-remount-fs.service; enabled-runtime;=20
>> preset: disabled)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Active: failed (Result: exi=
t-code) since Wed 2024-08-14=20
>> 14:53:48 UTC; 1min 22s ago
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Docs: man:syste=
md-remount-fs.service(8)
>> https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Process: 76 ExecStart=3D/usr/lib/=
systemd/systemd-remount-fs=20
>> (code=3Dexited, status=3D1/FAILURE)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Main PID: 76 (code=3Dexited, status=3D1=
/FAILURE)
>>
>> =C2=A0=C2=A0 Aug 14 14:53:48 demoboard systemd-remount-fs[76]: /usr/bi=
n/mount=20
>> for / exited with exit status 32.
>> =C2=A0=C2=A0 Aug 14 14:53:48 demoboard systemd-remount-fs[81]: mount: =
/: mount=20
>> point not mounted or bad option.
>> =C2=A0=C2=A0 Aug 14 14:53:48 demoboard systemd-remount-fs[81]: dmesg(1=
) may=20
>> have more information after failed mount system call.
>> =C2=A0=C2=A0 Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.=
service:=20
>> Main process exited, code=3Dexited, status=3D1/FAILURE
>> =C2=A0=C2=A0 Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.=
service:=20
>> Failed with result 'exit-code'.
>> =C2=A0=C2=A0 Aug 14 14:53:48 demoboard systemd[1]: Failed to start Rem=
ount Root=20
>> and Kernel File Systems.
>>
>> also consequentially, 'systemctl status' reported:
>>
>> =C2=A0=C2=A0 State: degraded
>>
>> When issuing 'strace -ff mount -o remount /' the failure occurred at
>>
>> =C2=A0=C2=A0 mount_setattr(3, "", AT_EMPTY_PATH,=20
>> {attr_set=3DMOUNT_ATTR_RDONLY|MOUNT_ATTR_NOATIME|MOUNT_ATTR_NODIRATIME=
,=20
>> attr_clr=3DMOUNT_ATTR_NOSUID|MOUNT_ATTR_NODEV|MOUNT_ATTR_NOEXEC|MOUNT_=
ATTR_NOATIME|MOUNT_ATTR_STRICTATIME|MOUNT_ATTR_NOSYMFOLLOW|0x40,=20
>> propagation=3D0 /* MS_??? */, userns_fd=3D0}, 32) =3D -1 EINVAL (Inval=
id=20
>> argument)
>>
>> After further investigation, The issue was pinpointed to lack of Linux
>> kernel commit
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commi=
t/?id=3D95de4ad173ca0e61034f3145d66917970961c210=20
>>
>> ("fs: relax mount_setattr() permission checks") in the kernel version
>> that was being used. Above mitigation was discussed in email related t=
o
>> then-rejected CVE-2024-26821:
>> https://lore.kernel.org/linux-cve-announce/2024051606-imaging-entrench=
-b327@gregkh/T/=20
>>
>>
>> After testing with qemuarm64 machine different linux-yocto versions,
>> it was observed that the issue impacts following versions of currently
>> supported LTS kernels:
>> =C2=A0 - 6.6.17 (fixed since 6.6.18 i.e. mount_setattr() returns 0)
>> =C2=A0 - 6.1.78 (fixed since 6.1.79 i.e. mount_setattr() returns 0)
>> =C2=A0 - 5.15.164 which is currently the newest of 5.15.y series (i.e.=
 no
>> =C2=A0=C2=A0=C2=A0 known working version)
>>
>> Taking the above findings into consideration, add a new PACKAGECONFIG
>> option which by default opts users out from using the feature which
>> can cause issues with some older kernels.
>>
>> Versions 5.10.223, 5.4.279 and 4.10.317 were also tested but the issue
>> was not reproduced with those versions - using strace showed that the
>> mount_setattr call associated with the new mount API problem was not
>> issued with these LTS kernel versions, which seemed to be confirmed
>> also by following libmount debug message in these cases:
>>
>> =C2=A0=C2=A0 415: libmount:=C2=A0=C2=A0=C2=A0=C2=A0 HOOK: [0x7fa115e81=
8]: failed to init new API
>>
>> Note: In addition to the aforementioned, this change was
>> tested also briefly using the current latest kernel versions 6.1.104,
>> 6.6.45 and 6.10.3 that using the old mount API with newest kernels
>> did not introduce any observable regression to the boot flow.
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>> =C2=A0 meta/recipes-core/util-linux/util-linux_2.40.1.bb | 7 +++++++
>> =C2=A0 1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb=20
>> b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
>> index a1aab94055..2d89eb6745 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
>> @@ -107,6 +107,13 @@ PACKAGECONFIG[cryptsetup] =3D=20
>> "--with-cryptsetup,--without-cryptsetup,cryptsetup"
>> =C2=A0 PACKAGECONFIG[chfn-chsh] =3D "--enable-chfn-chsh,--disable-chfn=
-chsh,"
>> =C2=A0 PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,li=
bselinux"
>> =C2=A0 PACKAGECONFIG[lastlog2] =3D=20
>> "--enable-liblastlog2,--disable-liblastlog2,sqlite3"
>> +# Using the new file descriptors based mount kernel API can cause=20
>> rootfs remount failure with some older kernels.
>> +# Of currently supported LTS kernels, it seems safe to enable this=20
>> option with:
>> +# - version 6.6.18 and newer in the 6.6.y series.
>> +# - version 6.1.79 and newer in the 6.1.y series.
>> +# - with the 5.15.y series, versions till at least 5.15.164 can not=20
>> use it.
>> +# - with 5.10.y, 5.4.y and 4.19.y series kernels libmount seemed to=20
>> use the old API regardless of this option.
>> +PACKAGECONFIG[new-mount-api] =3D=20
>> "--enable-libmount-mountfd-support,--disable-libmount-mountfd-support"
>> =C2=A0 =C2=A0 EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D=
 'OPT=3D${CFLAGS}'"
>>
>>
>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203490): https://lists.openembedded.org/g/openembed=
ded-core/message/203490
> Mute This Topic: https://lists.openembedded.org/mt/107977031/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


