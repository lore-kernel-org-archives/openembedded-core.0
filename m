Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23216C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 03:28:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6641.1745465315448306326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 20:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62098bb84e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O3KVEX012221
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 03:28:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhj9qq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 03:28:34 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53O3SX5n023681;
	Thu, 24 Apr 2025 03:28:33 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhj9qq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 03:28:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ng8A7FmDb62mbK9ciQ8OOxIeV+KM2YgxW4EphR2hqBicorenkHcnSrMf/HDdvv5Z2G2SKVL2nRDGOPFvTj+r1uf6YNxasKsudUELiyLjClfCQBY3obTQBOkF4dBxQZKObATzeAY5UfEOYkVnaP0ql4LBoOfh+PdQyZWPuIQ5KEEoo3RPGyEmUwwlpSmaIQl9S/8U4BiaaPFYs7LCSkdIRD7Hv3yWv9JqTvlW3Tny0sISoihrcEF35JALIaCmg2OrxZc3GgMhCbbDqXn7hjs9TvulSLDHcg5vfSlz42jshJESr7LhL7n+ajGNW5F8GUd7ivtk1btn9fAJXO7XADBxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cAMOnmudvCd2qS29h/5G1+/capArW0zTdYOSPLKOOg=;
 b=LF23lTR9wkLCM3A/NIMYB74qdiWmzT8ixR18XifDd9o3zszlm7SMO5KpAWWc2Ys9ZnvOt8zxv6bx0usQSw5mQbCj5Ze6FyGRcxAq7QufGofO20U6izQDD/asDFmBcdt0P4b2qh5U0yDgamMixTJsAwp6kSnee2okPhxTv3MijlTXMR9JiNqCAgc5qRi+UiQMLzMws87uSPnKPOpiZ3gyC/lfGKuh/n+NCQ53MmJpjI7hN+7pa4BbcfE2caMQOtFV2cxVYYAaEBVHtTg+ac+9QsmdRg91LimmiDCtuR5DiaoVE7ZSSKBYaymQzqjEMwfJCOOFhB1uSeOo27SWTYOPVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB7325.namprd11.prod.outlook.com (2603:10b6:8:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 03:28:29 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 03:28:28 +0000
Content-Type: multipart/alternative;
 boundary="------------20AYzViemx4mD1JJQz68vwvL"
Message-ID: <4aea547a-0b02-4ec4-8050-57a0f2d0677c@windriver.com>
Date: Thu, 24 Apr 2025 11:28:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] icu: Add coreutils-native as DEPENDS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20250418081919.382562-1-changqing.li@windriver.com>
 <0bf48ef944adc7ba879149b5c9427bc770fa86f4.camel@linuxfoundation.org>
Content-Language: en-US
Cc: OE-core <openembedded-core@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <0bf48ef944adc7ba879149b5c9427bc770fa86f4.camel@linuxfoundation.org>
X-ClientProxiedBy: TYCP301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::16) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa40a7b-34a7-4992-5122-08dd82e0149a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YjBoR1UxM1lQUzJDMWpvdHQxREZRK0FGaDg4N0Y1cTZ6MHZZMFVBMitSYzJT?=
 =?utf-8?B?WEdPMTZsdTdQMFpDazg3Z0FURTR1a3R4NUFVWGJianN5R0hPYUV5ZEdNWXhu?=
 =?utf-8?B?eStmdXdPdFNzWG1XK0VNeDdVNW1JYnRRUkFURnd5c1hGMWdLMXgxSkFZOUly?=
 =?utf-8?B?YnpoaStYaWxOZmhPWmlqTFhBVUpGNE1RUm4xdHNYU2xRS0txclpTK0V3Tm40?=
 =?utf-8?B?NEFKV3Qya1ViSEM5QVRUVFdRR0JQRURvd2gzMzB2dHhkV3EyWFZMb0JsRGdO?=
 =?utf-8?B?b0tOeVlpR2RrMFFnMlVNLzhpd0pTNUJOY0VEK1k2WHVicG52MWdmU2ZmcENo?=
 =?utf-8?B?d1NIVE9qVnl4T3F1TlAzS3llSGxkUUZobXgrUi9PRTNTNE9NM1paNVhKUFNk?=
 =?utf-8?B?d2pzOEd6aGF0UTJWci9hd25xeHVKaVJiamI3OHFtL3NPTVBkR0xSMVdNS1JC?=
 =?utf-8?B?OWFiS2VJTy95QmQvd2xOZVR6MTRZTDVWSjEyam1TeS9paDBMTnNMN1c3ZWIx?=
 =?utf-8?B?OUpFNnZXdVFMTGdFNkM5WVBKbFdndGxGMXJWNTN3YmJJWVU1SmEzR3pLeEto?=
 =?utf-8?B?bmV5em4xV3FBeG1vRkkzakZRaW9TSTlvbVlPaXNQZ1FRaVBiS3lqeThkTk5V?=
 =?utf-8?B?WFM5ZExpdXRvbC9sR2xaVWtGb0hvam5YS2hvK1BLYUVzTVBlMG8yTGFCdVAw?=
 =?utf-8?B?UFJwNWU5a0I5ZXN2cW5MeHl5d0loQTA3M3lqQkdBZEdTOTF3WFdCRGV3M3Fn?=
 =?utf-8?B?VCtwRWxPY1Zjc2ZIMlh0MWowak5KUWR5N3VSUit2VnVoUm9WdjN0Rk05V21F?=
 =?utf-8?B?SzdxZ244cDR4SkM3UmF2a1dlV1c2akhZb084ZlpycE1uN0h2aGxodGo4bzVi?=
 =?utf-8?B?K0RDU0crVEw3Rk5USU13dm53L1V6UURQdEZLQk9remZwdlFTNm5hd0Y2NXpV?=
 =?utf-8?B?ZHJKNWpOZjUxVWgrS3FFb2M1VnZvYW5wdzdSbUtJdkROU3Zod2RhaFBibnFS?=
 =?utf-8?B?ajlZNXNsSG00dnRrb3dWdmE0aU9sckxXLzUwNTVTR3dydkhKcXBwc3JVS3Vo?=
 =?utf-8?B?dmhPaEFRbTcrbEV1UVBIMUIxZTlmMnU5RjJQUXhiR3JkNWVkZkhmdkZDUVpX?=
 =?utf-8?B?a2xjZ2J1WjNZZ3g1VmYvdmw4Y3hPREl4YW9YNkF5S0tQSG9YU1Zzanpyblg4?=
 =?utf-8?B?VkU2eEtrSW1vRjNrSWt5cnQwbjdTcUxOSSsxb1YxWkhVNGIwU0RScDJ4OU1l?=
 =?utf-8?B?aE1ERGJKdFAwK3N6aGIzQ3N4QzZlQmYzcDB5ZmVMY083QUZIVDRJb2c3RVZF?=
 =?utf-8?B?dEh6YWc3anVBU1k2d2R2STFzYnNrdGo4OWdXVmxvSE1LRXJ2cml5V1U5L2Mz?=
 =?utf-8?B?ZjBtbTNyTEQwdGZROEpmWHlEc0Yxc21IK2xjOG04ekVvSXF4bHVlVnZCQkli?=
 =?utf-8?B?Mis1TUpiYjBNdnJXcjkvREwvNHdRWTNlNFpLSXVhTUViUHJRSi9QQTB0WUZE?=
 =?utf-8?B?dU1CRlFlYmY2blZGYU5TQm1ZMUxTUXhNMXlUY0FTRTU0d3lMN2JNdnl3R1FG?=
 =?utf-8?B?cWhnMnk0d0MxU2pCVW80Yjl0eHJxSlF1bXIvTmJPWUJUM3RqaXZRelVTNDFu?=
 =?utf-8?B?STBQMGlkdW43a1RXVGdRdGZpWVpqanlsOWhhVmtMajNDdFBvUDU2WTM2Y0E1?=
 =?utf-8?B?Qy8yY0FyejFaai9jbmNXLzhreStKcTBvNm1RQUZuTm5KWStwTC9mZGI0UExX?=
 =?utf-8?B?YjZNWTUrOHBDZWdGQ2hWYjNaRFJ3cUo0bHR1b1NsL2Mxbmd2OHkxd2tHZDBW?=
 =?utf-8?B?K0l3WG5tUU14MmMzTytjVkEwZWVxdTdhb05HUXpvNFhydUxpSEtFZXdUaUlL?=
 =?utf-8?B?bklmcFQ1dlk3R2pPNVV6ZTdiVzFwMFRXd3ZXNUVZVE1VUUZDcmExYkkzcm4v?=
 =?utf-8?Q?UwUOjpIRNAY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dkRQNEZuSjhZdERKS1JpWmhxT2N3bUhybjJFdS9zN3lLR2paaGJyNHl5Sk9X?=
 =?utf-8?B?cU51SGFWOWNiaWJpS3M2eUZ0dHpId3gyeWhQUzg5MElydFZrOUZ6R0NIZ1lB?=
 =?utf-8?B?b2pVUHduOEVUK0VPeFRrV2wwY0tYNW1RWE9FN3phNi9TdlFZTEtKaDB5UzAx?=
 =?utf-8?B?YkU0SXVreFQwd0NSVkV1VUdCdGVmYzNOb2gvRmdYQXdPZk9VS0F1VUNaWHF3?=
 =?utf-8?B?eGt5VVM5Z3lyVDdyVXQ4MitEb01oNFVmb09rZWIyZ0ZTeHZHMzhaTW9UMytY?=
 =?utf-8?B?RGNDY0RMdlpNOGhJRkRHdHc1Mml5dWZjOS9OOE13VVRlTTBvQWsrS0EwQWhv?=
 =?utf-8?B?Q01PME82MUNHWWY3MHB0N1ozcnF1OCsySUQreTNla0V3SGllN0s2YTRaK25j?=
 =?utf-8?B?aGcwV3NRZS81TXBmZklGTHJmZU9TZlA2ajVSTFFxQmNGM2Y0V08vZkhwTGw3?=
 =?utf-8?B?MHplR3BlekVKYXY4dVBoRU55UmlhNXB4VXB0aTVvZkpPSzBzaDhwamJiVHFk?=
 =?utf-8?B?TkhBM00vQXBEYll0Wi9UL2dCUUJHSGJQVmZGMHJzZ0lsTlViQ29wWGw3WFkx?=
 =?utf-8?B?UjNkditPeVVEb2tHMVJVenNRMHNpb2JoOUZ6VjRiQ1R0QVJBN3kzYVRmT2kr?=
 =?utf-8?B?RHVNYXNwWmR1bkNmSXFqclR2all2SG4xcjFkSWNzVTVJamQ1K2hveDdTVXda?=
 =?utf-8?B?MFA5akpKeUc1S3J6NzhjTVRlcEgrZGIrSGdRdWowcHNCdE1qWHE2K0ZNWCtv?=
 =?utf-8?B?RUdURXJQTm1BTHJKTTJmUG9Vc0tRdXJLSzJ2dGhaY3JxWWVNTW90cmVLMkFl?=
 =?utf-8?B?NDFCUFNwRzNPdW42YWZpR0VIWUJzc21Dais2cXM5dEthWVM5bEhZeGRNYm1F?=
 =?utf-8?B?dlFQbHFMb0w5WVdrQVJ3OFp3WEpHY3cwVmtVWUQ3bVdSUFhCMXoxdVBLbEZV?=
 =?utf-8?B?Z0xSVS84cmNGQVgvRUw1V3lHOUxma05LemlHYXJPS0w2Z1Vjc2NDR3BQcWtJ?=
 =?utf-8?B?QnptbFlMUFE1R2g1bC8xSE03WVUvcEd6aEY3d1hrdjJVR3loUWlqL1JRdUov?=
 =?utf-8?B?WGhLL0RZTGF3ZWRRRWR0d2FnbFZFaGtMSk1KTHUrMjFVc2ZJdXNOdkw1K0RP?=
 =?utf-8?B?NU5Ga3laNXVwbWRxMFpQOTdMZnk2T29rRVhvUk91UjF1dkVpZFpkNldiVHVH?=
 =?utf-8?B?MUpCWk1oVHUrZ1o0Nk1QTXBMSzVsaHBpbmcySG5mY2oySTcyUHhFejJHdXMr?=
 =?utf-8?B?QmwzZXNQamxSVzB1T1hpMDc5aEl5VjhGNVRUK28xRXllYU5yQmxVTnFKanJN?=
 =?utf-8?B?UGpmb2IyODQ1TWxZOHZoWitaL0QwRzUzblB0UXdlVk54THZQNzF5SmlSNkFt?=
 =?utf-8?B?dVFmSjJaNVNwM3llSGJoK1l4SVIydzQ1bHd0a1U4dWJvdWtodHZoS2twS2RX?=
 =?utf-8?B?bFRUSDNpZTh6dHdIWEdOZ1AwL29rMW1ISEN3RU12cm5XTHlnK012akk4MHZH?=
 =?utf-8?B?SDFLVTg2VXdYME5kSTg0d2U3RndGZ3JTbTY0N3RFSTRmU1E2d0hCTTMzMXpO?=
 =?utf-8?B?YTNBM0xtM0ZMV3RDT21wNnVQam80Szc0Y29QeTV5aElVZ2VPYTZaWkk4VnBK?=
 =?utf-8?B?clMxWkFkOWZLbmRRSlRJUkxycnFjbVdjeFk0VE5kZTQvYVNBTVprc0RzYkRi?=
 =?utf-8?B?eDR5ZkJTRkh0RE9RU0tjTGEwdGRvN01Ham1nT0FJbU1YMUZHSXBRUmdnbG9M?=
 =?utf-8?B?aDV6NFRSekdnN0czanBxWW5CVWRvVzJlSkxyV0VJVGpJZ0NxdUNRVEhmV1V4?=
 =?utf-8?B?SkkyMWhWemhEWG1mbG5OWDhOVGFIdDEvZmZnWjhOUGpXc094TXpGZno0S2c5?=
 =?utf-8?B?aVpFS0ZiWkdUQk1YcWNzSEJqL040YkRnbjFPTnhXNlY4NmVFOXIrNFBmTVFR?=
 =?utf-8?B?OHVWdEdkYXVWRnUyaXhXRHNIa1BVSVhKaHp0QlhYdzByQk1TSTNlcWRCZ2pI?=
 =?utf-8?B?RkNDUlVLbFR1cHMwVDJnTVUzWTV5SFFqL2o5cWNIdVVML1VGalR1Nko0ZUl5?=
 =?utf-8?B?K0l2ZWk0Uk1RTTFXK3o0TTRmdHdWMU9odFQ0UmFOYTkzell0b3NKRVladmdr?=
 =?utf-8?B?OXV2S1pnbHVqcVUyajBUeE1jZG1XUHhxQkVGQWlUN3ZkaE1aVGVYWTlubUZQ?=
 =?utf-8?B?eWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa40a7b-34a7-4992-5122-08dd82e0149a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 03:28:28.8957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1Tiz0FDHkpMFD1hBTrG4rvoj0GFt4RpPBN6VUWYZ9wfQ7fC9ZzoiAK6YQFvYe4sdjtYWIRriUYcn1m4xQKu9q2M461XVxUQOrdRnNGjLK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7325
X-Proofpoint-ORIG-GUID: otBbuCDsn8LRTXepWUgT0MCc31zWCxXG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAxOSBTYWx0ZWRfXyXEhVy2ebYOb vUvQzGUQn09gxEpBMSIwFsOItnKQUNgBESZeQuY+sW5vQdgi4u4dB+gG2f89dTr4BH0udvoflZT Tz4jWbJ7YpvXQMm2xE5LUEjpRPSBf8enMLQFZ8HDFwSd3Gj67oMwTXhoQ2o3n3mwIyx3om57Hr5
 IXq7dqcdPpyTvYjA1xFys4EQtMRLvun/KDXBZbkL0Xi+8D71XgGzVSsN0HMlHPGO65Pd9hv3OzV AWxE+XeqJNRDUx/WXOU2gTH2StVZjYAMKruisxTQ0YWiZjQL1hsRqGbTebn/uGg1Qtramgj36OS mNsDfYJsvAsDYDixeD8OaTj9+zchYJJPxk1DzB65WYamWNU0oG9fS/fdfGFtJSolOrG0tX9t6/7
 9nVWQ/CUg+qtyyuip7dmpBGGPq3dlYG3niazMzNUgNUUXd1/PqMJL1i3wTB9lRLzdkJs3O6t
X-Authority-Analysis: v=2.4 cv=ONQn3TaB c=1 sm=1 tr=0 ts=6809afe2 cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=MExtCd46UHBcOEm37zIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=ohsZLInhHGzXENAt:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: l7DuucppvQt_OG3bA7eRGxgoLa6ngL-d
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=993 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504240019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 03:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215324

--------------20AYzViemx4mD1JJQz68vwvL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53O3KVEX012221


On 4/21/25 20:26, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 2025-04-18 at 16:19 +0800, Changqing Li via lists.openembedded.=
org wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> icu will check program install path during do_configure, eg:
>> checking for a BSD-compatible install... /path/to/install -c
>>
>> And this path will be writen into pkgdata.inc:
>> INSTALL_CMD=3D$(INSTALL-L)
>>
>> Decided by if install is installed into recipe-sysroot-native during
>> do_configure stage, the INSTALL_CMD could be
>> /build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr=
/bin/install
>> or /build/tmp/hosttools/install
>>
>> Add coreutils-native as DEPENDS to make a determined result of
>> INSTALL_CMD, avoid vary caused by the execute sequence of another task
>> which DEPENDS on coreutils-native and also independent with do_configu=
re
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta/recipes-support/icu/icu_76-1.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> This needs to be fixed differently, we should be forcing it to use PATH
> and set the value to just "install". We don't want to add dependencies
> unless we really need them, they slow the builds down and add
> inefficiencies.

Hi, Mathieu, Richard

According to Richard's comments, I send a=C2=A0 V3 patch:=C2=A0 [PATCH V3=
] icu:=20
set ac_cv_path_install to install under hosttools

But I noticed that [PATCH V2] icu: Add coreutils-native as DEPENDS is on=20
master-next.

So I am wondering maybe V2 is merged by accident?=C2=A0 Please help to ch=
eck,=20
if there is no problem, you can just ignore this mail.

Thanks

Changqing

>
> Cheers,
>
> Richard
--------------20AYzViemx4mD1JJQz68vwvL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/21/25 20:26, Richard Purdie wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:0bf48ef944adc7ba879149b5c9427bc770fa86f4.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri, 2025-04-18 at 16:19 +0800, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

icu will check program install path during do_configure, eg:
checking for a BSD-compatible install... /path/to/install -c

And this path will be writen into pkgdata.inc:
INSTALL_CMD=$(INSTALL-L)

Decided by if install is installed into recipe-sysroot-native during
do_configure stage, the INSTALL_CMD could be
/build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr/bin/install
or /build/tmp/hosttools/install

Add coreutils-native as DEPENDS to make a determined result of
INSTALL_CMD, avoid vary caused by the execute sequence of another task
which DEPENDS on coreutils-native and also independent with do_configure

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-support/icu/icu_76-1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This needs to be fixed differently, we should be forcing it to use PATH
and set the value to just &quot;install&quot;. We don't want to add dependencies
unless we really need them, they slow the builds down and add
inefficiencies.</pre>
    </blockquote>
    <p>Hi, Mathieu, Richard</p>
    <p>According to Richard's comments, I send a&nbsp; V3 patch:&nbsp; [PATCH V3]
      icu: set ac_cv_path_install to install under hosttools</p>
    <p>But I noticed that [PATCH V2] icu: Add coreutils-native as
      DEPENDS is on master-next.&nbsp; <br>
    </p>
    <p>So I am wondering maybe V2 is merged by accident?&nbsp; Please help to
      check, if there is no problem, you can just ignore this mail.</p>
    <p>Thanks</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:0bf48ef944adc7ba879149b5c9427bc770fa86f4.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard
</pre>
    </blockquote>
  </body>
</html>

--------------20AYzViemx4mD1JJQz68vwvL--

