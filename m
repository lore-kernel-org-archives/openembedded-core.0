Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9600CC27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 18:08:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.21643.1717697284506971410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 11:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6887a64903=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4564fRSu002273
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Jun 2024 11:08:04 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f5exg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 11:08:03 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 456I83A2022333;
	Thu, 6 Jun 2024 11:08:03 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f5exf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 11:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiQo31gTXTrPfAmBIlmCz7/jso+XRHyjgH0PvtLSmQEoMl+/6Ai8Fj2flltG2ivavwmkTsYTyvfxiYgrkItgsTA6T030BmQ8QlSGRz8WJ16cL4pvY9tfTdKtYOQSrb+mD4nylhzpFjKOfcFUY9SFCanr//VcZXRxrNUFSKNd2Cx/bVW1CBoLoTOB2Frzb8uZXM+kqnzNtkfmafWpZKnOThP8CTTUTz6XRBI884E/CidpuAiTvRXUNVr+Y+1o2NMignh7zr1rHHSrSALGc61G3NckejpxSy37drlQe3YJQZz5S5u6LUiT7iLmoiGraB9344CYy0U0046pb4k0YUMvFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJOxYpNpUkqOz+tiydYpMGDyblKTJ367ny/YTsFqWOQ=;
 b=Ls4+NhkbWz42xSucKM9FVK6cEnrtj3TqBEB28pE/2D3lMM+qvoxWPZMLshSbW04cmc9CBhGyRjAqywC5bLdys9p3tP79a78pIblLuTyaqT58r+xYBGBFvOErRE9Cckm+69t/lw3KyRfZqg9/lVh3+QwJ+d8upC98wHoKYJCb10W7ZlOu09//X9z+qV38g2rHN5fnvaAvXC7i9fQunzJGHoW37KSXQUYV8U9COykGSA8FBBmRlz0RQiFvlPaXAfs+Xc3Od6vPvIagpm2RUGi+e+KrtBXsh2oZuVEFzD+JmXGun6jLZL2hyFXTl3hKmj4lyAyqks9DihZ8k7T319Y7mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 18:08:00 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::9a1f:5bdb:b4ab:171a]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::9a1f:5bdb:b4ab:171a%4]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 18:08:00 +0000
Content-Type: multipart/alternative;
 boundary="------------0pl0q03aZMNlEgGy6Qtss0wa"
Message-ID: <983be3d4-ab67-4736-aee0-687876b614d3@windriver.com>
Date: Thu, 6 Jun 2024 23:37:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH V2] gcc : upgrade to v13.3
To: Steve Sakoman <steve@sakoman.com>,
        Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240605143945.405558-1-Deepthi.Hemraj@windriver.com>
 <18618.1717599402117239778@lists.openembedded.org>
 <86ffc957-8b91-48d9-afc9-629b0e1dcaad@windriver.com>
 <CAOSpxdaNze=WcFwW_6A=o7-HN85bW9wuONgJtPpQyzcPVYx66A@mail.gmail.com>
Content-Language: en-US
From: Deepthi H <deepthi.hemraj@windriver.com>
In-Reply-To: <CAOSpxdaNze=WcFwW_6A=o7-HN85bW9wuONgJtPpQyzcPVYx66A@mail.gmail.com>
X-ClientProxiedBy: DM6PR11CA0026.namprd11.prod.outlook.com
 (2603:10b6:5:190::39) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|CY8PR11MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1502ef-5bcd-4ba2-d07c-08dc865399bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dlJsZC9INjZoNUN5RE84c1VpTUpPTXV6SmI0bmpwNjdmeVRNbFJEV2pGYk81?=
 =?utf-8?B?YkFtZVVlOENhQVIzbFc5djRjMFV4cU5hU2xRakZUN1R0ZnpZNFlFSGNXbkYr?=
 =?utf-8?B?cldQdEdtREswc3BPbmxDYjYyd0lrditMZWU0L3pLc054NlI4VzVrU1NBRzRa?=
 =?utf-8?B?UFhrcmlxSXhlRHp2TFJHbFBtL1FCME1DME0rQ2xuVFRITkZpSDltV1R5cStM?=
 =?utf-8?B?eHFHdGN1NUdKdjlSam1mdkNjUjFmRS8xYTdZN2dTVTBhYWtzWnZhblMrZnI5?=
 =?utf-8?B?eVlyS1g4aXVWUXIyT2hqSHBFM3M0NTFWbElSblY0bVFiYnZTUTZQYkJuTlEw?=
 =?utf-8?B?aWFMZUcvVkk4Ly9uK212aFZlWnVTcFRMaVBnM1RNS2JiVlVUbDBHa2lNRloz?=
 =?utf-8?B?SGFERHRZVE1HZEhGa1RJV0FTYmxVaHJzWU5DdWkyaW1FL3p6UG9mRDh3Ujdx?=
 =?utf-8?B?VWFMd3cwVUpBM0ZPZURlTjNycCtmUVd1WkNmMzgxaDlCSkxiR0NSOENrd0M3?=
 =?utf-8?B?WnQ5U0RUQkYzWXcwQzRHc1dXWGVGN3VqUEsvK1Q1aXAwV05UNm1KK0tIbGJs?=
 =?utf-8?B?NWpycDhUVEQrcHlrbUgxNnVkUkFPUU9jMXBuaHlNWm91OTNHb1p1T2ZFelJR?=
 =?utf-8?B?UzhkRm1KWFErWWRHOGtWb3M1WDNhL251TGs5MG95ZVdSZlRXSUM4aVA1REtX?=
 =?utf-8?B?cU5ZcFVXaUl4T25zZjJ2MnVFRGprTThIRkI2SnVlSThRakJEZ0UrK2tlMlR4?=
 =?utf-8?B?US9SZ3FZVkpYK1V4SVJKaUV4Y2V0dEhwRlBncXZtcEsrZnhMWGlISVVxeWZ5?=
 =?utf-8?B?WC90RHR5dlFoRW8waUFUNmFsOFFTV2xqUWZzMmdZZlVHRHA3MVdRd3lNbVZP?=
 =?utf-8?B?Q3BIVXIvOW1DdTRIcUJIdXdzUStqRkkzdVZtOEoxSUdGN2x3M2pjbGVkRC9U?=
 =?utf-8?B?VXQrc2U3dWFlN1FlSzZ3YnVUdDFSU09USlRtOEE4MmxwQzIvYmxVZ2lFa29z?=
 =?utf-8?B?WHJjQVNvYjhMbnRGM3c3VkwwV2xZOC9mc213RzA3eVJSZkF1WW9aRktrb21N?=
 =?utf-8?B?QkxqeDVzaUJBNzN2Z2Z6RWxZRHdxMi94V0xZa3JSZjJla0xHQ0FjaU84eXli?=
 =?utf-8?B?RmFJMXJBbXp5Qmg0allOcnZZVWlxN1QxYzlVZFZrUEJQZE1jb2RzUGpGelFr?=
 =?utf-8?B?dXF3dmhXbGlNZFlEREs3aThPT1dKN2p5NzYyVjZKWGNsbHE5bW5PNWNvaTFj?=
 =?utf-8?B?eHNXOTFXUnBiRHh3UU0wb0kyYkQ5SmY3YUVWQWlSWGh4RmNzd3pnNEUvb2J4?=
 =?utf-8?B?dDNZbS94ME1nMHBJVUZNTkM0U3RCMWp5aFQvRStVSEM0bDJzRTNsU0lwMDZ6?=
 =?utf-8?B?S3hZRVVDdmJhbDRoVS9hRzR3UkkrVGRKYjBqd09xeFJGWW4wM1RYdGJJZitw?=
 =?utf-8?B?Ti83MkdtakJLM2VwK0o5TEtIa04vQkdMMjQrbXlJV0d1K2xGYTltcjBwOXBz?=
 =?utf-8?B?V0JoVnFlc0ppZXVRVUUxVlNvZ2U1cytBQnY3b3UzeHlsVlZpN0VkbU12QXFZ?=
 =?utf-8?B?c0prZ3NKNlVrMXNvckNIODlyNVNBVlUyZFZsTTRKbDNYb04zL1o4YlBPR3JT?=
 =?utf-8?B?T3YycnNnRnBzanRoQzZsRjJjQks4ZmwrZ0lTSFQ0S3BxK3lFcmxMT1lvQXhH?=
 =?utf-8?B?bFJIdE5CbUdFNHd6UTVRajBGcnNTTUlBL25reDF3TTBiNTR1WlZ6Sk5rUDBv?=
 =?utf-8?Q?tZzTuTOR40dYDo6XBhfV0misjSVsm6koEitOzUk?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RHl6Z3FVOVZiejF4Z1k2SWYxYUs2UTZWMlVjMmp4blZ2bW5YQVdibVNuTmp1?=
 =?utf-8?B?TVA4UnY1SlJLaW80UWZaakRhL28wZldEc1lLdUZrTTc2NmtSVGV1VlJ1RTZa?=
 =?utf-8?B?S1AzRVFZUkcwc0kyTkdoRk9iSUpxNmZLTUpOVHJtTE1PSmpMRDBkZGpaQU5Q?=
 =?utf-8?B?Z1lWNFBjKzJyZmNhWk5PWkdaWXFUN2xjQjZzTlQzTU41elBqWFlKVmZaM0FT?=
 =?utf-8?B?OVptQnhaU29HUnVNSFdZdEVONkd6dUFUS3dMWU1FWTV6cUkzbFJzcmNBeFRE?=
 =?utf-8?B?L29KcDV0QXNFWTZYQ0VuYTZVVTAxN09UQlk5dnpNeTIwS1Y5SkVVQm4rRnFH?=
 =?utf-8?B?bDlqQitzN2VVWDFPUDZPN3N1dlpmMGZYaEN4K0RqVUNUTlRXWDZ3TkxYcjB6?=
 =?utf-8?B?OHhkOWZGWVFvREFGaENSc2JVRCtlSWJOUHpjcnRhRW5WWDlPYzRGZktQTkVp?=
 =?utf-8?B?OFBKL1FWQW9YRGhpS0dzbWV2dG45TllERlUyK0tOSzRocjhDWVBWM3I2cjA4?=
 =?utf-8?B?VXBUais4Sjk4RDArVVhXR2puYytKb0tacnlRMVFFV2IwRnBHNjFueUYxNUpV?=
 =?utf-8?B?RVBEdTlyTDAycnk4bVVwbFVXUDJ2aWJMVisrNGh0R094MjlISHBVMmNobnNH?=
 =?utf-8?B?UkZVaHYwRm1GazJCVHdPTCtrKytaOGVPRWxtZWd0N2poRGdZS28yTlRTSUZC?=
 =?utf-8?B?S1B4ckZtWjg0cFZteG5BRmgyeWtFdXFsUjdIN0MvdHM3OGg0NGczMXFFeDVC?=
 =?utf-8?B?dTdPdFJZNmljWXEzQ0o4K0trVGVwOWx5QkU2L0IvSk1EVXN6clRzdjRENVda?=
 =?utf-8?B?b00zc09wdnY2UEIzUlhNQTNyMG1lNXA0dk1RNndTNDhqb0FBZXRIeUIzMzR3?=
 =?utf-8?B?K0dxaFhFMk8zcEJ4R21iSEVTR25jZy82Um9pbFdjd0sxYVZRZHdtYXdmVXJq?=
 =?utf-8?B?OTJpUGZIci82NUVXcmFLN2NoSklGUmhIT2JEQ3M1NHk1eENJYnB4V0Y4SHVO?=
 =?utf-8?B?TGlWUVQyNkIxZjVQMUQ5Rmg0cCtIakNUeFkreGRnVG9XNGMyVEdhOXRBZFF5?=
 =?utf-8?B?dWovYjltTUMzTUkzTkNHNnlHcVVlNUVHNHVRakFxYlE3OHFCNSs4VEZmRzZj?=
 =?utf-8?B?RVd0Zzl4dWErdWhVUjl3cWNhWGlpYlowTEtyaDFFbk9OcVFGUmowVUpzRWt4?=
 =?utf-8?B?TDc3VFBQUVlvSDh0T2hlS1kzUVhIZG1PUmtZejJ3T1YwY3R0UUFyME9mZXBX?=
 =?utf-8?B?bEc3YUR0d0t0ZnB0SGpMOWxnSHF4RTFFWjRCYjB0bGJkQ2QrK0xOUnd1eTVJ?=
 =?utf-8?B?SzZnem91V3dHS1pvOVRMYWw1eTRURnZ4dzk5U3NWbWI4RWk1QWNJQTc5eERa?=
 =?utf-8?B?N1dNQnZMaGhOSThWQXVKQWVRRlc3WVFVMy83eHJ2eVNUY2VNTHRpdHJSV3Vm?=
 =?utf-8?B?TmpCR2wwUUw1a29PS0pPRGt1bnBzTWtjSGJGallyOFprQnYvakRKKzdiaGdB?=
 =?utf-8?B?TE54TFEySVFYTm1PZkhEbTJMTFlJelNmandmMzZDWVZwVzZVR3hFazJwbzlB?=
 =?utf-8?B?NzBtYlFHWlVXcWNYUFBVWGVpYnl3NmppejFkZzN3S0ZqM04wN3l4b2F1RFdq?=
 =?utf-8?B?cUNFbnZwUEhUcXVMMFI4K21kd25wZmhJejhmaVp3TFY2SjZHT09Oa2tYaEow?=
 =?utf-8?B?Y0lIWE5jVkUxVDVTQkNDc0NZQnMwd21Xb2pURlJpb0tNMGdYL2NGV1RraFRH?=
 =?utf-8?B?SmE5THprRHEzL0ZuNkNaNkRrMm55dE5SSTJ1cWw5bk4zM1ZxM3FEZHVLd1Zu?=
 =?utf-8?B?Nkk0WEdVYXBZQ1ZGZ3EwNzFOaTBCOGczTzF5K091M1d4d2NiWmp6Q09GS0hL?=
 =?utf-8?B?Q05vL0gzRXJMZjNFN0JEaWlLdXI1TnZlNlRtTDBXVUpNMWc5YUdBZFFMbHRi?=
 =?utf-8?B?bEVzcFdmQ0lsL0hqc0ltOEVUSTJiZmFFS093TnlhV1dTVWxFcXhVUWtaaDVT?=
 =?utf-8?B?K2FQYVBweVRPMllDa25udnRkeXNicTBEWTkweXJWejBhK1BZQVNJWlhMMWd4?=
 =?utf-8?B?M0JoY0Yvc1NaQU42ekRPQlMyR1FWY1p1a2ZPbDhCNXQycGsyTURmZ0dyUFdV?=
 =?utf-8?B?aWZkWURKUjJhZnF2ZlhwR1l6M0tQdDYweWZ6WFk3dDl1MkZLUS9xWEJqWlFT?=
 =?utf-8?B?aVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1502ef-5bcd-4ba2-d07c-08dc865399bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 18:08:00.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2IhyDDWirdY4pR/cU2+v+n3QiBRuA41O1yI25Ch66BI3Emj85sEFknT2wHApSNe77yNi5vhQyYRQrED+OOBqEBZdVhgZauO1Kry7nm1LZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
X-Proofpoint-GUID: dag71LCmYg20Rdawx15KFG-tT57wMc_8
X-Proofpoint-ORIG-GUID: 3WEZu1I1wqmcySD4q_K_GC9gL_6W_y0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_14,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406060126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 18:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200413

--------------0pl0q03aZMNlEgGy6Qtss0wa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4564fRSu002273


On 6/5/2024 9:19 PM, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Jun 5, 2024 at 8:42=E2=80=AFAM Randy MacLeod
> <randy.macleod@windriver.com>  wrote:
>> On 2024-06-05 10:56 a.m., Hemraj, Deepthi via lists.openembedded.org w=
rote:
>>
>> Regression testing was done and below are the test results:
>> After update (v13.3)
>>
>> =3D=3D=3D gcc Summary =3D=3D=3D
>>
>> # of expected passes            248620
>> # of unexpected failures        9
>> # of expected failures          2484
>> # of unresolved testcases    25028
>> # of unsupported tests         4145
>>
>> Before update (v13.2)
>>
>> =3D=3D=3D gcc Summary =3D=3D=3D
>>
>> # of expected passes            148304
>> # of unexpected failures        15
>> # of expected failures          1420
>> # of unresolved testcases     25136
>> # of unsupported tests          2688
>>
>> Here are the computed differences for each category:
>>
>> Expected Passes: +100316
>> Unexpected Failures: -6
>> Expected Failures: +1064
>> Unresolved Testcases: -108
>> Unsupported Tests: +1457
>>
>> (Thanks to ChatGPT 4o !  Please do present the differences next time t=
o save me, ChatGPT, and others from the task. )
>>
>>
>> Can you explain the huge increase expected passes?
>> i.e. did upstream really add ~100316 new tests?
>>
>> Ah, you have a typo, and expected passes for 13.3 should be 148620, ba=
sed on:
>>     https://lists.openembedded.org/g/openembedded-core/message/200008
>>
>> The number of unexpected failures has decreased so that's good.
>>
>>
>> Also, did you check on the build problems that Steve reported?
>>
>> That should be discussed in a cover letter for v2, v3, ...
>>
>> Please learn how to write a v2 cover letter and send that with git:
>> $ git send-email -1 --cover-letter
>>
>> Also, I saved your v2 patch and tried to apply it to scarthgap HEAD an=
d that failed with:
> I had no issues applying the patch when taken from patchworks, only at
> build time when applying the CVE-2024-0151 patch:
>
> CmdError('quilt --quiltrc
> TOPDIR/tmp/work-shared/gcc-13.3.0-r0/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch CVE-2024-0151.patch
> patching file gcc/config/arm/arm.cc
> Hunk #1 succeeded at 19157 with fuzz 2 (offset -53 lines).
> Hunk #2 succeeded at 23668 with fuzz 2 (offset -8 lines).
> The next patch would create the file
> gcc/testsuite/gcc.target/arm/cmse/extend-param.c,
> which already exists!  Applying it anyway.
> patching file gcc/testsuite/gcc.target/arm/cmse/extend-param.c
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- rejects in file
> gcc/testsuite/gcc.target/arm/cmse/extend-param.c
> The next patch would create the file
> gcc/testsuite/gcc.target/arm/cmse/extend-return.c,
> which already exists!  Applying it anyway.
> patching file gcc/testsuite/gcc.target/arm/cmse/extend-return.c
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- rejects in file
> gcc/testsuite/gcc.target/arm/cmse/extend-return.c
> Patch CVE-2024-0151.patch can be reverse-applied
>
> So I suspect that V3 of the patch needs to also remove
> CVE-2024-0151.patch, since the version bump seems to include the fix.
>
> Steve
Hi Steve,

I was able to reproduce the issue. since the patch CVE-2024-0151.patch wa=
s added yesterday after I had committed the changes, the above issue was =
caused I will send a V3 tomorrow. Thank you, Deepthi

>> $ git status
>> On branch scarthgap
>> Your branch is up to date with 'origin/scarthgap'.
>>
>> $ git am /tmp/gcc-13.3-v2.eml
>> Applying: gcc : upgrade to v13.3
>> .git/rebase-apply/patch:121: trailing whitespace.
>> @@ -31,16 +31,16 @@
>> error: patch failed: meta/recipes-devtools/gcc/gcc-13.2.inc:65
>> error: meta/recipes-devtools/gcc/gcc-13.2.inc: patch does not apply
>> Patch failed at 0001 gcc : upgrade to v13.3
>> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
>> When you have resolved this problem, run "git am --continue".
>> If you prefer to skip this patch, run "git am --skip" instead.
>> To restore the original branch and stop patching, run "git am --abort".
>>
>> Looking at the diff between v1 and v2, it seems that you have some lin=
e wrap issues
>> and perhaps more. Please test for this by using git send-email to send=
 to yourself or
>> someone who is using a sane (non-MS Outlook) email client and save the=
 patch and apply it
>> to an unpatched poky repo.
>>
>>
>> Thanks,
>>
>> ../Randy
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#200370):https://lists.openembedded.org/g/openembed=
ded-core/message/200370
>> Mute This Topic:https://lists.openembedded.org/mt/106504365/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
--------------0pl0q03aZMNlEgGy6Qtss0wa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4564fRSu002273

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 6/5/2024 9:19 PM, Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdaNze=3DWcFwW_6A=3Do7-HN8=
5bW9wuONgJtPpQyzcPVYx66A@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, Jun 5, 2024 at 8:42=E2=80=AFAM Randy MacLeod
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod@windriver=
.com">&lt;randy.macleod@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
On 2024-06-05 10:56 a.m., Hemraj, Deepthi via lists.openembedded.org wrot=
e:

Regression testing was done and below are the test results:
After update (v13.3)

=3D=3D=3D gcc Summary =3D=3D=3D

# of expected passes            248620
# of unexpected failures        9
# of expected failures          2484
# of unresolved testcases    25028
# of unsupported tests         4145

Before update (v13.2)

=3D=3D=3D gcc Summary =3D=3D=3D

# of expected passes            148304
# of unexpected failures        15
# of expected failures          1420
# of unresolved testcases     25136
# of unsupported tests          2688

Here are the computed differences for each category:

Expected Passes: +100316
Unexpected Failures: -6
Expected Failures: +1064
Unresolved Testcases: -108
Unsupported Tests: +1457

(Thanks to ChatGPT 4o !  Please do present the differences next time to s=
ave me, ChatGPT, and others from the task. )


Can you explain the huge increase expected passes?
i.e. did upstream really add ~100316 new tests?

Ah, you have a typo, and expected passes for 13.3 should be 148620, based=
 on:
   <a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembedded.=
org/g/openembedded-core/message/200008">https://lists.openembedded.org/g/=
openembedded-core/message/200008</a>

The number of unexpected failures has decreased so that's good.


Also, did you check on the build problems that Steve reported?

That should be discussed in a cover letter for v2, v3, ...

Please learn how to write a v2 cover letter and send that with git:
$ git send-email -1 --cover-letter

Also, I saved your v2 patch and tried to apply it to scarthgap HEAD and t=
hat failed with:
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I had no issues applying the patch when taken from patchworks, only at
build time when applying the CVE-2024-0151 patch:

CmdError('quilt --quiltrc
TOPDIR/tmp/work-shared/gcc-13.3.0-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2024-0151.patch
patching file gcc/config/arm/arm.cc
Hunk #1 succeeded at 19157 with fuzz 2 (offset -53 lines).
Hunk #2 succeeded at 23668 with fuzz 2 (offset -8 lines).
The next patch would create the file
gcc/testsuite/gcc.target/arm/cmse/extend-param.c,
which already exists!  Applying it anyway.
patching file gcc/testsuite/gcc.target/arm/cmse/extend-param.c
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file
gcc/testsuite/gcc.target/arm/cmse/extend-param.c
The next patch would create the file
gcc/testsuite/gcc.target/arm/cmse/extend-return.c,
which already exists!  Applying it anyway.
patching file gcc/testsuite/gcc.target/arm/cmse/extend-return.c
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file
gcc/testsuite/gcc.target/arm/cmse/extend-return.c
Patch CVE-2024-0151.patch can be reverse-applied

So I suspect that V3 of the patch needs to also remove
CVE-2024-0151.patch, since the version bump seems to include the fix.

Steve</pre>
    </blockquote>
    Hi Steve,
    <pre class=3D"moz-quote-pre" style=3D"white-space: pre-wrap;" wrap=3D=
"">I was able to reproduce the issue. since the patch CVE-2024-0151.patch=
 was added yesterday after I had committed the changes<span style=3D"whit=
e-space: normal">, the above issue was caused
I will send a V3 tomorrow.

Thank you,
Deepthi
</span></pre>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdaNze=3DWcFwW_6A=3Do7-HN8=
5bW9wuONgJtPpQyzcPVYx66A@mail.gmail.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
$ git status
On branch scarthgap
Your branch is up to date with 'origin/scarthgap'.

$ git am /tmp/gcc-13.3-v2.eml
Applying: gcc : upgrade to v13.3
.git/rebase-apply/patch:121: trailing whitespace.
@@ -31,16 +31,16 @@
error: patch failed: meta/recipes-devtools/gcc/gcc-13.2.inc:65
error: meta/recipes-devtools/gcc/gcc-13.2.inc: patch does not apply
Patch failed at 0001 gcc : upgrade to v13.3
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
When you have resolved this problem, run &quot;git am --continue&quot;.
If you prefer to skip this patch, run &quot;git am --skip&quot; instead.
To restore the original branch and stop patching, run &quot;git am --abor=
t&quot;.

Looking at the diff between v1 and v2, it seems that you have some line w=
rap issues
and perhaps more. Please test for this by using git send-email to send to=
 yourself or
someone who is using a sane (non-MS Outlook) email client and save the pa=
tch and apply it
to an unpatched poky repo.


Thanks,

../Randy


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#200370): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/200370">https:/=
/lists.openembedded.org/g/openembedded-core/message/200370</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/106504365/3616765">https://lists.openembedded.org/mt=
/106504365/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--
# Randy MacLeod
# Wind River Linux
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0pl0q03aZMNlEgGy6Qtss0wa--

