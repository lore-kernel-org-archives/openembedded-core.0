Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9132DD36122
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 19:55:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29558.1730836556857457826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 11:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1039086fff=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5I4a66007592
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Nov 2024 19:55:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42n9a0kjx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 19:55:55 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A5JttG1012828
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Nov 2024 19:55:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42n9a0kjx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 19:55:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoMpSchgxStrLlZMIYkOjt3hn36dS9b20edNaq7gwnsXXOH3/BbTBQEt7ev/zqDxNwckwDRCoWJqPAS3jTqLmGNekfZfKoneRJ6CKIRf0dahdp9wkIUUqxQXoSePIvjuAqOpVcdTMtOh1mwWltSBsMWa/e4a4J6hudc1syl3z1L+lxb5PF67MlQLmzYKoRRX+B8adypx55swDCxUwEzP5ex7p1XMa3Bc7+uUfbFsPw2AGM8YSUv69Bx2DCxSn+Yc7ZIv+W8Kn1WftaM4GhPIg2P4QD5KwV0Cb9uGGvpAh/tuQSTRof8b3waAQBu+Uo1+qXHfLh7MErxp/acdYpn2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/C4Mq5JMvN9eVnZzNpPUdiFDNdWhnadX66WlRZ98n0=;
 b=nKM17YDLx0Lt+AgU99RCBiOvwQbSbFlXMgsvm0fnWuQJdyNtgo884KU/S/yz+4g5qhOKZJElktiuka6yBOiuOewK+kcJsP7ISuohONKaPo1z1jC2zXqaL6oi0Vha7v8UiLZBKDudfVjV/gUcxlMamUg7zjCwC1NDQSvQSydmydhSvdtzFc8mpR4cxHYF0nQKzPUDv1cTN0uZaYPeguARZkYlnsdJpef5BLumL/mtG/5zLw9zACsava3/w8wfEtdPHzMqOCUWB7QbbUoDNWpvJIlWxYWnPU6Ot8sUQ+EVHx4B1yw9pHO0UQAIaY8/fU5ygq45nY2GLdlQ5ip4SiF08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SN7PR11MB7438.namprd11.prod.outlook.com (2603:10b6:806:32b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Tue, 5 Nov
 2024 19:55:52 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 19:55:52 +0000
Content-Type: multipart/alternative;
 boundary="------------G0WA10pXLImF7c2UoiBqHX8w"
Message-ID: <2d3ff647-1f43-4a66-9f96-a4c56b1b5702@windriver.com>
Date: Tue, 5 Nov 2024 14:55:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH scarthgap] systemd: stable update 255.4 ->
 255.13
To: openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <180446A0F11CA2F7.30502@lists.openembedded.org>
Content-Language: en-CA
Cc: Khem Raj <raj.khem@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <180446A0F11CA2F7.30502@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::10) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SN7PR11MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 022941e9-a3d0-4f32-6fd6-08dcfdd3da26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cyszVUM0WExNV3lOZ1B1cWtmN0lYMWFGQ0plZXZxZVFvb2NwazhEekN6UEZG?=
 =?utf-8?B?VjNaS3RlMm96emF2YTE1VXA2Ui9KeTE0RmdxY1V1VEJiL1UwN1FpakJsSGg1?=
 =?utf-8?B?c05OYURaWkFTbzdpNS9kV1RaMFlVbkVhUmR6bWIrcjZvWkhadUczTzlBYXMw?=
 =?utf-8?B?RWorb1ZHRWVZWEY4NzRGaGJ3aDRCelU2Z3VTSDZqZjJDRExEaVVpRHpDQkNp?=
 =?utf-8?B?dWVUU2IyMFNnY1BSNExOMG1ra1pJYVQvRFhKTkw5b3F6d1RtZjRqWHN1K3dP?=
 =?utf-8?B?aHpEbGhaN1J4K212aWJLYXl6WUxGU3pvMjg1MC9CNlBmVW43b3JERFJhMzBN?=
 =?utf-8?B?YndsV0lUYUl6N3RuYjJpajRWUmxYQnRRY1dMMVQ4VmdzVlJIcnUzWWFUMU4r?=
 =?utf-8?B?Z1ZDallsUGRiUHFKREhaL2FoM2xIRXBwUDJkVmNwRkVMTW0rK3JqWWVWMkV2?=
 =?utf-8?B?bThIQkRnNWFodi8rMzg3TjlJWEJCVDJRYnplblFJY202Zit6WWxkWUpWRVpN?=
 =?utf-8?B?R29jSDFqaGxHY3poc0J5RU12eVhLdzBVbitNWm0vVkFMTmF2azc2dUx1Mjlp?=
 =?utf-8?B?Tlh5dnFNTUwxdWNTdjZwNWZ3cXMzcmVpUU1HNE9MTHpQbUF1ZU9EVklFU05Q?=
 =?utf-8?B?clUwcElBenYzREdiR0FHRmlFQklYeUpZMkhJNGNVcXN1b3VtZ0tzeDJLSmlt?=
 =?utf-8?B?dmNSMXRHMGhGNnV0RnlLeWllZytOaU53bEMyeWdNYnNHUzVvSUVJWGU0Q1V0?=
 =?utf-8?B?c1JlWDR0VDNteVBkNUNOZzZMREx2ZzEyOGNkUmhUWDZuQWg3K3QveXdubCtI?=
 =?utf-8?B?eTFoNVl5UHM5YldJZ2NaYWFnL3A3dHg5RmlpVytNZCs1cytneXkzVjg5WHdv?=
 =?utf-8?B?NXB5T0kvSHVmWHVmVGErcUtZN045K0ZzZ2dSdGFWeVRvNytuMkJnTHI2VzEy?=
 =?utf-8?B?WGhBV0J6NTFHaFdGZC9obFVLbXRwQldyendqMjR5clF3Vyt6SU1tbHRSbnlv?=
 =?utf-8?B?azUrN3V0TTJDM2tMdUR1VjlpZFFYRTJNdTFVam1xeDJQbFJFTVRNYk5rYy9y?=
 =?utf-8?B?STZncmtCRDV3MWk0VUlvUy9iTG0rR29KSjc4bDRlZDI0YWFZUGhiOUp2SC9p?=
 =?utf-8?B?bVc1clo1dU5jOEFITDhIbFFFQWRTTHpieGhNU2RVMGlmbDdqaXlpTzFUeFlI?=
 =?utf-8?B?aW96SXNMRWJYdGs2QmZKZjNNYnd4K2lBaTg5S2JFMHVNRzNVbXhZVVNMZWNI?=
 =?utf-8?B?YW5jUlMwbHliTjN6bVd1Wi9YbzZtS2lINDFsUEpCWUtUTnJtWW91eUFjYTFj?=
 =?utf-8?B?V25MV0I0YWltKytNbkZxMkZjUFBRZHRGTVJtQ0FaKzF3ZXh0VnptbXdhdWdv?=
 =?utf-8?B?N3crcW52czdpS2VwL0ppMFBkWDRlWmlJblJzTFVjeUZ6K3ZObVUzSFV5NDlF?=
 =?utf-8?B?R09ybnRWMDFtMWR1N0FMNnFySkF6ZnZaZGFMYmZZNHdtTDVNN1NDMXpqam8w?=
 =?utf-8?B?eXdsMlVHd25yS0xyZUxiZzlaMHBUUUx5cUpPYWxvaVFUTnJhNExuZ01SMnJH?=
 =?utf-8?B?R2VSZ24zdWw0Q1g5bUlFZG1zMWVTa1Mzd2ljMFYzQkZSUGtMcGVCQXlGY3dh?=
 =?utf-8?B?THpManVMU2E5VmJjb1NvNkxNZmNTV2lXaEdIZnQrT2RMc3BOY0Y1MGxZTDNQ?=
 =?utf-8?B?S0g4NzN0Q3JMRXlLV0h5RGxOZEhrdnZ3bU9Gd3RrTG9ObVVjTzIralR3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGlpSENPdWllR2VvSG1LVnA3Rnd1alBOWmdlenhzNW5PdStJeG9Pd3BJbklh?=
 =?utf-8?B?Zi9yTlJJbnVFOFdGU1JkYVdiVWs1eEIvYWcrR2pJcThmczd1QmtXYVo0cVNC?=
 =?utf-8?B?bjBobUNFMVdmWXFvT3BiclVDdzM2MjBMNXhHWC9ETlVRNzBmOGhLaDl0NVRV?=
 =?utf-8?B?ZGMyU3R1ZDFDVkxZUExRRExPOFp4MFV6QmtFMlRuL0pUWENPN245U2V6OGJ1?=
 =?utf-8?B?RUdGMEtsMDJtWGxmeDExeDlGVjNPTTF4enRXOGV2Wis5ZlNtRVJaeVB6aG5s?=
 =?utf-8?B?b2FPSkNPS1pnZCsrNE9tTG1QaTlDYXEweUpPaFFpQUs1Q0RSYWpBbUZLUUNm?=
 =?utf-8?B?bmkvd1dsOE1WZ1dTcjJaZGNJQnNLTWtqVFllaWFjM0x1OUNMSFpTb1NQUWZt?=
 =?utf-8?B?Ujg0Q0cwZEhUVlR0SG1yN2dLdFRZSWRvSXpvUVV2YzJqVmxvM2xJM1RTRUVC?=
 =?utf-8?B?VUh6UTR5bXB3TUdPQjlPanpPUndrdGNYeitmTkZ4YVlmOW8vSlZpVGlLQTRu?=
 =?utf-8?B?dVAyZ21icmpCRWpadHZDSzFFNDVLOGc3bmdUMDgxMm9GNHYzRVd2YlhrdjJB?=
 =?utf-8?B?RTVuY0pNWnRMaXJZejhBcUJCbzJLV0E1eUh4YVV1aHZYSVFwZEpaODM3cldL?=
 =?utf-8?B?ekxJZWI4T0F4Nk80R2w5NWtyWGlFMkJjMXN1UU9oRjcyeVNQQmpOU2RRNnRw?=
 =?utf-8?B?bnpDb2krRmNQZmdjSGRDUENqdk9qUXB4Q1VpMm45MXhFekkrWUdlYmsyL2xm?=
 =?utf-8?B?V1dHRk0vOWxka1p5SHdLZUFHRkpDUnNST3djV1hjM1dxak9WMVEwNXk3YzdR?=
 =?utf-8?B?eTdYZm9uY290R0FiWEZZVnNHdXhvUngwOEtYR2pjN2kvUUdBeUhEdGhUeGQx?=
 =?utf-8?B?VlBlWDJwMkFpOXNJc1JPNWpwRDFBeXFlQUIzWkFvNGlXNlFyUW9wbGxUMW9s?=
 =?utf-8?B?Y08rWkFabVdMVk1sK2U2R2I2UEdCL29PdHplaTljRGNvbDEyVTZzK1R2eE1X?=
 =?utf-8?B?OGk5RTJsYW1zRy9NK09USUo4NnBESkdpaVRkTFRRU3JRWWxKWUxJMTUzQVpr?=
 =?utf-8?B?TEF5ZjNneE5ibnVIRWhSQWZwWFIxWWNHbThKSW1OMlBsYUFnWFdVT2hxN3Ev?=
 =?utf-8?B?K3ZiZFJVaVlDZzdqelE1ZDVSNmJZY2pQZ241VUMvcTNUZXlOd2l0Ymc4ZEFF?=
 =?utf-8?B?U0RpNVZySmw2aVBjV0hEaFpnTlFRVkNadGJENkozcmpBcEVNcmlhQWw4U3kx?=
 =?utf-8?B?TTFxSU9JRkQxenR2TVNydzJvUE1qWk14UkV6UzYrV25IakJ1dTl4UStJT0hW?=
 =?utf-8?B?RmNtK3EvYis3SENIRUowVHplSWE4NWwyTUFwNUhYbHduUVpTaG4zcktSVU1y?=
 =?utf-8?B?OWFzTVBTdE5GQ1RMK20ydnlrWFJxNmhuNGY3NXQ5dTArTXpnNm9meDdXb0M0?=
 =?utf-8?B?Z0FoTUxaVW4vZTUvNzErTVBIK2FMMHpxSnpkV3ZvZ3pVUjZuWWhNbERZZkRu?=
 =?utf-8?B?cnByUi9RaHE0ODBVNTRrRUd0eStWOWZ5bEZYWGJ6amhpMnFGSFpqZU5tamdi?=
 =?utf-8?B?bkhmQ09rZzAxaUh6cjQxN1RFNjZ2MzhZdkdYMTFZd0RDdENaSkRYbnNxS1VP?=
 =?utf-8?B?Nk9Fa1FFRXVxL2FNMWYvK3diQXR4K1FEdllaK29rV3ppNi9jSWl4MFU0c2lV?=
 =?utf-8?B?aGhqMXFoWXlPTENOV1V6OFR6WFpyL1VZL29ja256YWRGQVN2bVpKYUpLcGNY?=
 =?utf-8?B?MkRLb29MOEpaSm1qeUxXWmpsT0liVmJnYlllYzNqWnpLc256Rklmem9KRTVt?=
 =?utf-8?B?WnR1UEtBMnUyNlNSNjNvK2tPTDA0Nmpsb1hXd0FjVyt0aEtiTmMybzdLbjcx?=
 =?utf-8?B?ZFY5TTdCcjlaN0JjWUtlSGUwVXJzRFoyWE02YklRRnRaajMyaEFKRUJyWVJZ?=
 =?utf-8?B?eVRVazFkUHhOckNaY2V3anZzaEZ3K3JwY1JpRkw0WERISU5ZQ1laeVVydTht?=
 =?utf-8?B?bkY4TlVzRm9TamVBUHBwY3JXYjhOTUpUSDgzWENYQXgxcnMvOTc0QjUxdXEx?=
 =?utf-8?B?Znkwd3J4a1J1NnlWRGcxTXF6ZUYySm1iclRQRXRlWnVDOFM5YXkwaDEyOFo2?=
 =?utf-8?B?M0JzVElDaTdYU0JZSll1ODFLMU9iZUpaRWp4cVZiYlZ5YjRYNzhMdXYwdG1C?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 022941e9-a3d0-4f32-6fd6-08dcfdd3da26
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 19:55:52.1504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JquKUn2asYZhxeZH4SWnJjEF06r9jU6te8XjNje+Xtam8NZBSd9q03bvNW8cM/v1hsy8yVI6xjWWG3FqsPyzj46YGSrM6FkyWLaZ0JfE7c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7438
X-Authority-Analysis: v=2.4 cv=H7mJwPYi c=1 sm=1 tr=0 ts=672a784b cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=kzGQuXsLzBQGFiUDDNEA:9 a=QEXdDO2ut3YA:10 a=HYiRS_cQVhe9uerdRVoA:9 a=6oWQz_aqOwxnfuXr:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 7fhk2o1_oDbjZjXS787ljgON_Veq_PSY
X-Proofpoint-GUID: X30TIJL1H1BvWsOyJ9rz9FsiNllk3N4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411050154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 19:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206752

--------------G0WA10pXLImF7c2UoiBqHX8w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-11-02 6:16 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> Full change log:
>     https://github.com/systemd/systemd-stable/compare/v255.4...v255.13
>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   ...stemd-boot-native_255.4.bb => systemd-boot-native_255.13.bb} | 0
>   .../systemd/{systemd-boot_255.4.bb => systemd-boot_255.13.bb}   | 0
>   meta/recipes-core/systemd/systemd.inc                           | 2 +-
>   .../systemd/{systemd_255.4.bb => systemd_255.13.bb}             | 0
>   4 files changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-core/systemd/{systemd-boot-native_255.4.bb => systemd-boot-native_255.13.bb} (100%)
>   rename meta/recipes-core/systemd/{systemd-boot_255.4.bb => systemd-boot_255.13.bb} (100%)
>   rename meta/recipes-core/systemd/{systemd_255.4.bb => systemd_255.13.bb} (100%)
>
> diff --git a/meta/recipes-core/systemd/systemd-boot-native_255.4.bb b/meta/recipes-core/systemd/systemd-boot-native_255.13.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot-native_255.4.bb
> rename to meta/recipes-core/systemd/systemd-boot-native_255.13.bb
> diff --git a/meta/recipes-core/systemd/systemd-boot_255.4.bb b/meta/recipes-core/systemd/systemd-boot_255.13.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_255.4.bb
> rename to meta/recipes-core/systemd/systemd-boot_255.13.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index a35db5091e..88f24f99c2 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
>   LIC_FILES_CHKSUM ="file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \ 
> file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>   
> -SRCREV = "387a14a7b67b8b76adaed4175e14bb7e39b2f738"
> +SRCREV = "565916c245b53b49f5917f5326d21246f46ae3db"
>   SRCBRANCH = "v255-stable"
>   SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
>   
> diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.13.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd_255.4.bb
> rename to meta/recipes-core/systemd/systemd_255.13.bb


I just remembered to test the TCLIBC=musl build and
of course there are some problems.

I'll fix them and send a follow-up patch on top of this one
so best to not merge unless you really want to Steve.
Please let me know.


../Randy

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206658):https://lists.openembedded.org/g/openembedded-core/message/206658
> Mute This Topic:https://lists.openembedded.org/mt/109359316/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------G0WA10pXLImF7c2UoiBqHX8w
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-11-02 6:16 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:180446A0F11CA2F7.30502@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Full change log:
   <a class="moz-txt-link-freetext" href="https://github.com/systemd/systemd-stable/compare/v255.4...v255.13">https://github.com/systemd/systemd-stable/compare/v255.4...v255.13</a>

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 ...stemd-boot-native_255.4.bb =&gt; systemd-boot-native_255.13.bb} | 0
 .../systemd/{systemd-boot_255.4.bb =&gt; systemd-boot_255.13.bb}   | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../systemd/{systemd_255.4.bb =&gt; systemd_255.13.bb}             | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_255.4.bb =&gt; systemd-boot-native_255.13.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.4.bb =&gt; systemd-boot_255.13.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.4.bb =&gt; systemd_255.13.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_255.4.bb b/meta/recipes-core/systemd/systemd-boot-native_255.13.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_255.4.bb
rename to meta/recipes-core/systemd/systemd-boot-native_255.13.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_255.4.bb b/meta/recipes-core/systemd/systemd-boot_255.13.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.4.bb
rename to meta/recipes-core/systemd/systemd-boot_255.13.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index a35db5091e..88f24f99c2 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = &quot;LGPL-2.1-or-later&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe\file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c">&quot;file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c&quot;</a>
 
-SRCREV = &quot;387a14a7b67b8b76adaed4175e14bb7e39b2f738&quot;
+SRCREV = &quot;565916c245b53b49f5917f5326d21246f46ae3db&quot;
 SRCBRANCH = &quot;v255-stable&quot;
 SRC_URI = &quot;git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}&quot;
 
diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.13.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_255.4.bb
rename to meta/recipes-core/systemd/systemd_255.13.bb</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I just remembered to test the TCLIBC=musl build and<br>
      of course there are some problems. <br>
      <br>
      I'll fix them and send a follow-up patch on top of this one<br>
      so best to not merge unless you really want to Steve.<br>
      Please let me know.</p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:180446A0F11CA2F7.30502@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#206658): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/206658">https://lists.openembedded.org/g/openembedded-core/message/206658</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/109359316/3616765">https://lists.openembedded.org/mt/109359316/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------G0WA10pXLImF7c2UoiBqHX8w--

