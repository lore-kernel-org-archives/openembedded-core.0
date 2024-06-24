Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CB2C2BD05
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 06:18:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.134423.1719209914384411232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jun 2024 23:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6905e5654b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O5xxD8013541
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 06:18:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywktwsch7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 06:18:32 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45O6IWQi007592;
	Mon, 24 Jun 2024 06:18:32 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywktwsch6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 06:18:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGokY5VTj8zfHbeKppW0YSZRV+JrUgti+p7/jUuEG4/vTlDWbm30pA+CEEWn6E/MrTdrJt9Bd6mTrz/LGXZ28H688ylCpipM47mkUGV3b+sbjH6pTZ0KyF+N9LEYjA1YILFuNHYNLFLFHsiu0TKHsGF6G4BsyZfpiIgC7KCoVlRScnrCDizCt+Avp+YUtlCAz/D6FXZ7o86QZyaSI2Mi597b3SBn1b72xbWiWVW27Y/dx0zzkYf81/ym2X+0pJOxUDbHacyVqyP8GXGStk8OI2HuqVtWc8v1lCA3YiNyAZ0iB4PVy+mhhewr4D1hgepko55uDWkpDUL7BRMO4/k+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0dyCsIY9nyBdHuzdwHjrce32skxzU8xxJfJuZz4f/M=;
 b=SP5c8m/1UETkuTuiQG4J2mqA7Yr/nxo/H/Ty6vsfuF7fqqEXC9l+5VXIIUSTvyA5qoODQYapkp86yerrrsfEAx9q7UXiVQxvJ5nlhnUnAAMaiKZNOtfJ084LSsx/Jj432KtO6FKYqxvG81neDbPf9G0d7qTwrtDj3/xnCUcq7jW9WCal+/hP7nMAS6nZphBsKv9wLe+pr0OFV5l97O+zVDaIR696SoXduX9QFDAmK6qgYSEPGljWvQ12Usqt12yFnmpn1Dmsw3hD/jb1PlwsKxITgv7BwSAwiyf5O1TXIVcT6ZoEa5Qp0t8MVpwosoN7kh2AWXXxDig6ux/Q4beaoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 06:18:29 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 06:18:29 +0000
Message-ID: <94191867-e75b-4893-ae59-1d267f9ab686@windriver.com>
Date: Mon, 24 Jun 2024 14:18:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] acl: Fix nfs ptest failure
To: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240619091703.1410186-1-mingli.yu@windriver.com>
 <2a775a76-43da-4139-ace1-d28e35a66504@bootlin.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <2a775a76-43da-4139-ace1-d28e35a66504@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0182.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::9) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA0PR11MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: 7baf057b-7139-462b-22b4-08dc9415770c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|4022899006|1800799021|366013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MGpydkRHMWx5WlVuVmduTjl5bEFVTzh1R1lZMEJtSTU1bWp5QlpGVnY1RzBy?=
 =?utf-8?B?MWNmNzRmdXZmdEREVVhoUnNNUlF6bS82czJZQllGNUtmRWIzNkVYNStFT1RG?=
 =?utf-8?B?ejJiRndsb0c5VXlWSFBaSTVkcDY2UVNzK21UeDlvMGFHV1Vybmo3dkpVd0hG?=
 =?utf-8?B?S2VnWDFuVGd2TWMyR0pWUnVmUkNrTHdJc1NUc0xNSXNSTHBJWndkaUR6WVVO?=
 =?utf-8?B?S1JhOTQ0V3l0eVlNYUNUd0p0RUZ0bHorNnJGcVNZWFRtS3o3SmtyY0VqTnVi?=
 =?utf-8?B?Vk1mb2pTYU05bU5za2J5Y1pQZC9QVVJ3dTd1TGtoNFN2dEVUWHhPdU5QMkFk?=
 =?utf-8?B?UTZoZTlTWEh5MkYyUjk0MjZrTWtPQ0lrYzBITWJkWmlLd1JVbEthWFhsRU10?=
 =?utf-8?B?b3BNNjFsKytWd2VzM2poTzVKVHhlZHZ3Q3VRNEZtREsxeGJCZmRpVm04RENL?=
 =?utf-8?B?RWpEQkZDU1pxMGxMTGdlNENZWWk4UStZb2taZHgxTmxvTHBzelhzdlVsT0NE?=
 =?utf-8?B?a3F2Uml5cThjR1lWdFdCZHA1Y2hvVFF5QTdkaTVjT3VrZXFYbmt1Ni8yNCt1?=
 =?utf-8?B?MURQT1JOcVo1YnowbjlBT2s1ZGpUTnFRY0RCQXRqeTNkRi9Cc3ljeDJIL044?=
 =?utf-8?B?WFlmNWtndTZ3NjgyL0JDd0owZGRJckVlLzgvOW5oVWFjNFA0cWFKOVQrbUFk?=
 =?utf-8?B?aWlxZWRQK01ZK1NPQlFBdC9tczZvVXAvNjBYemJQZE5URFRtNE1GcnZja1hB?=
 =?utf-8?B?a25vbVZLN1pzTHR4MVJZTFVOeUxEWHBaajdXU2xxYkNGeEZaWmk2K1VMYlA3?=
 =?utf-8?B?N0ZvMFozQUZwdU45NmF5Z05aSW1wUU5zVVQ4dU9DZUhRWHBSWmFYYWxjVXQy?=
 =?utf-8?B?Ykx0OFJPVWk5ZzJxaXQ2Qm9uWEVkZU03dmhmVkVjck56Y1V2VzlFQXVQSndk?=
 =?utf-8?B?RWFIdnRWek51REN0dUJsUEhUUjdCRStxaUd0dVJ3cjE2MjV6cFNBM0laVytP?=
 =?utf-8?B?V2NYSm1ndUIvRzlIbVcwSWtlVFFMSUl1emxBenI3R2hDR0VwMFQ1RUJQNm82?=
 =?utf-8?B?RlpqODkrdzlmYWpEWkNSS2F5ZG1FZmh2YUZkWHcwdWxkVHROZHdLeXArMGJy?=
 =?utf-8?B?WnY3L1hSekhsa2d6OXNTdTdNYnNML0lpTGFmbjREd1IvbWlZRGViTWVkcndS?=
 =?utf-8?B?TFg4Ujh0cWRXYTVMZjJlcTZsekNMakZkTEhjVVh3bndLSnlVOHcvbGRMMHB3?=
 =?utf-8?B?L2Q1YlZDb0kwUG96dEZJR0poSEcrUmQ0U2VOaVNjT2xXS09DNmMrTzRpalFD?=
 =?utf-8?B?T0RoRGxvZzR3TE5WeFhDYmZpS3JNbnJ1SkJNd1lYUm9VWjVIaDRpNXJzWXRj?=
 =?utf-8?B?TGxKTmRGOU91OUpHSThEdnp4bkJhOTMwR0NPVUdzaUhySm0wdkFJRTJmanNv?=
 =?utf-8?B?TVlDYnZhYjlkV2oyKzB3ZERWNEo3c3FvcmRQd1QyRjhIMnkxUHU2Q0dTd2tD?=
 =?utf-8?B?MkovYS9LVmxhTzZQTFd4N2hZclV0QkRRcVNBVnA5TXIzWThZQlQySjM1Zm5a?=
 =?utf-8?B?MTJNRzE3WTFvK05idlhld3hPdTFKSWVaMWhRR3NiaklOeHpibnFlWVhJcmpG?=
 =?utf-8?B?ZzFFUXVUbGJiOVMvcWpjUElPQVM4VW9YdnQ0RUluSmxPb3gxK3RuNjRyYjds?=
 =?utf-8?B?QmgzKzBGcWJ2emVXbWFCRCtqT1pRQWUvOGhXOCt4Mk9aL25pcFBEUzVnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(4022899006)(1800799021)(366013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QW1YUnhEeGl0Wm1RZXNvL0h3VUg2bXB0Z3ZQcWZnbmRPM0tjdU1yYTVibTNy?=
 =?utf-8?B?UFdXc1labk5kejl2cGFEYm9pcTJGUmFYd3BUUDJzcm9HQmYvVkVLVEhLZHYz?=
 =?utf-8?B?ZkNoMXQ1M1ViZUo0NFpXdk1WUWNQUmRCWXp0TXZraWJnWTd3VGh5bkw2UUd6?=
 =?utf-8?B?eTZGSTNZK21RVWRiL0Z0REx5TzNuYlJtY1JoNjZzaXpZQmdWalBNUzRqU1Vy?=
 =?utf-8?B?NEdiQnlkeDJmMW81OTc4eHZXblNYQis3STU5L0w0cGordDBrb3FteXJCRDhE?=
 =?utf-8?B?V3NLZkNZZ2g1Y0xUMEpLc292dDZTMU5NVktYcmVRVHFvc0pMOVRnU3JGcC9z?=
 =?utf-8?B?ay9UTkxVRWVNcnF2OEZ3dlVjNiszeFR4cUMyVnAyT1ZTa0kxQmpJbG5SWVEw?=
 =?utf-8?B?Z3V4aDBXWDRpb3VrOUhJQi9tMTROS0tJZ0M4VkQ0N095eUVJN3hzUDUrenNJ?=
 =?utf-8?B?YytBZitqTEorVWJEbXBUczI5MDJlMXN3cTgvZXgvQVgvbWdYeGFDVmRHMjg3?=
 =?utf-8?B?eitzRk40alB0dlRnaUdodWtjaUtIUWllWXVIcllmeU5QcU85a09XU2pnR0xN?=
 =?utf-8?B?RXJKNmVYd3l2QzFLMWh3VHJ1M25rcmt1dlNGNDA0S0ZhU2U3ZlhGSjVVR2JC?=
 =?utf-8?B?RnVSaStlTDEyMXlPOWN3K1FaZlJNSzNCeTBiZVp1WkR6V005dVMvTENsckkx?=
 =?utf-8?B?cktUWkEwTUZZVWxYMStyUjFwZThiUTlMRmp5eXZZMHpKYkMzT25vOGJKUTNO?=
 =?utf-8?B?LzBsK2FaSGlpL1h0MzVteU5yTi9QemN5bFRocFA3dkIyUUs4Q0VWcGxEU0xT?=
 =?utf-8?B?U2tCekU3cVRRRzZYSENBMGZpVkM2SmZsVzVwcFRvSzNqdlNkYk9DbWNqVGJV?=
 =?utf-8?B?eTJ5RGQ0QWRWVlRCZ3h5Mi9McktpRTR5MHR3VXZpWGF3QzdxcW8yMXo2a3Y0?=
 =?utf-8?B?a0F6cHdLWXRMSlNma2Z0bWQ4QnBidWU0emNLVHlTTVdCN3JnL0V0STRSS3Bn?=
 =?utf-8?B?dmNLNVNjWXplblRIOXl4b1pEcjJpdGVEbUU0dUprS1ZTb01kenlrSzJKYVds?=
 =?utf-8?B?enQ4YzlTZnBTZmdoeEFPVFQ1dVdSL2diSjlJM0ptRVhSUzlrUVhEd2RKUjd6?=
 =?utf-8?B?VFZOdHVTR2NvSDJpdnVWT1lib0ozMlF4NFExTis2Z3poVFM4aFNNaExyU2l1?=
 =?utf-8?B?TjJNa2NCRTkzUGpCMndNQmZ1VDFSUCtBdHZEaDlaOEtDVEo4WnNZaWZNVEx5?=
 =?utf-8?B?ZjFyZWxYWVVDdy9PK1BRNThHekhpeXB4Y2FtSFJpcFluNDBtMGpNRitEZlVM?=
 =?utf-8?B?KzkxTmpKbEZEOENoUFNRUnRqRmcrdzR0US9qREhYK2J3ZUdvR2dYc3BQZEpm?=
 =?utf-8?B?b01vVlVMZW5LM3R2WjFwcnlOdUNFNlJseTJYWnRlUEFVWXhScC81b3ViazIx?=
 =?utf-8?B?QjdUR1pDVzFNd2tMTGZHR0lOTjVBQXZ5L2JXdjB2VmowbUIyUEtVazZmaXcr?=
 =?utf-8?B?WmN4VUZwNkx0UWxzdDBiejREWUsrTE12bC9lQXkvc0xqNDR2NmEzc0FWY3lj?=
 =?utf-8?B?dHo4M3YzRWUyM0hmTms1YWJTUDB2ZEJMZ3pqZlNiK2F2dnAyQnRUcU9Qdi9G?=
 =?utf-8?B?aDhsWlpqSmtrN2JjVjcvcHBOSmNUQnlvQThPSW1pemFlanpnTnBjcVhiY2VZ?=
 =?utf-8?B?Kzk4cEQ3YWZ4Z2Z6R1lQcHlrd2ZvWThEQmhVTGc3MnhoM0t0VHd5TEhOTllw?=
 =?utf-8?B?d0dnelJOWGJ5aEI1Z2UzMUp2YXJFQlBlNXQvaURBMU1Bd1VHZ01YOFJJTnow?=
 =?utf-8?B?cy9KNFRwYmZLY3IxaU1YRnVNQWcxZkdIbVdGTVVkY1RIVDVUMkhJL3pmc3hx?=
 =?utf-8?B?eVZzUVhGUjhpUnBUZTFNM093NEIyMXdhUUZpSk5KUVdZZTdlSmk4MlIxcUtV?=
 =?utf-8?B?WmQxc0tNWTM2NEZ6dEs4bzVadEJYTjNHREFFTlMwQWxLSmhJazJFeE5UKzVS?=
 =?utf-8?B?U0VRWkpYa0VlbmJXL1Z4ZTBQM0JIVmpLc3lWL2ZCckxDaXN5TW84VkRNMmk4?=
 =?utf-8?B?eDIrTUNCSEd2c1hCOEowakZxRHFWSTlXQnkwS2VkUHk0M0lpYlByQ0NObHZ0?=
 =?utf-8?Q?f7DLjyC7JFJa+4QjeFakfKUmq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7baf057b-7139-462b-22b4-08dc9415770c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 06:18:29.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otCugie6O9TKNG/6+9crGx3YeciApVM0de6FXgAbmu1LUHuLCdREp9vAUBrzazowiyCRnWZ0IQkyuTljQlDMPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-Proofpoint-ORIG-GUID: U_0360VKP50HPvsPKb6GEgtMzG-rUooK
X-Proofpoint-GUID: Sv0oNwCj9mO9iTTRQVexGEDuu6b4fba-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_05,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406240049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45O5xxD8013541
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 06:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201064



On 6/21/24 18:29, Joao Marcos Costa via lists.openembedded.org wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>=20
> Hello,
>=20
> On 6/19/24 11:17, Yu, Mingli wrote:
>> From: Mingli Yu<mingli.yu@windriver.com>
>>
>> * The date such as "Jun 13" should take 2 columns, so the expected che=
ck
>> item "test/sub2" should the column 9.
>>   # ls test/sub2 -dl
>>   drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
>>
>>    Corret the check item to fix the below failure in the test/nfsacl.t=
est.
>>    [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}' -=
- failed
>>    drwxr-xr-x 07:23                      !=3D drwxr-xr-x test/sub2
>>    -rw-r--r-- 07:23                      !=3D -rw-r--r-- test/sub2/bla=
h
>>
>> * Use the abosulte path otherwise we won't find the expected file blah.
>>
>> * The calls to getgrnam_r would always fail because the size of the
>> buffer was smaller than the minimum (170000) specified in the test
>> implementations of getgrnam_r and getpwnam_r.  Use test_get*_match dir=
ectly
>> because getpwnam and getgrnam should never fail on ERANGE.
>>
>> This commit fixes the following failure in the test/nfs/nfs-dir.test t=
est:
>>
>> [16] $ su bin -- failed
>> su: user bin does not exist           !=3D ~
>>
>>   # ./run-ptest
>> PASS: test/cp.test
>> PASS: test/getfacl-lfs.test
>> PASS: test/getfacl-noacl.test
>> PASS: test/getfacl-recursive.test
>> PASS: test/malformed-restore.test
>> PASS: test/misc.test
>> PASS: test/sbits-restore.test
>> PASS: test/setfacl-X.test
>> PASS: test/utf8-filenames.test
>> PASS: test/root/getfacl.test
>> PASS: test/root/permissions.test
>> PASS: test/root/restore.test
>> PASS: test/root/setfacl.test
>> PASS: test/nfs/nfsacl.test
>> PASS: test/nfs/nfs-dir.test
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> Testsuite summary for acl 2.3.2
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>>   # TOTAL: 15
>>   # PASS:  15
>>   # SKIP:  0
>>   # XFAIL: 0
>>   # FAIL:  0
>>   # XPASS: 0
>>   # ERROR: 0
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>>
>> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>> ---
>=20
> The patch is intended to fix a ptest failure, but could it be causing=20
> this nfsacl.test failure?
>=20
> Please, check the following output:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6734/=
steps/13/logs/stdio
>=20
> and from the autobuilder logs:
>=20
> FAIL: test/nfs/nfsacl
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> [6] $ umask 022 -- ok
> [7] $ mkdir -p test/sub -- ok
> [8] $ echo blah > test/sub/blah -- ok
> [10] $ cp -rp test/sub test/sub2 -- ok
> [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
> [15] $ rm -rf test/sub2 -- ok
> [17] $ setfacl -m u:daemon:rwx test/sub -- ok
> [18] $ setfacl -dm u:daemon:rwx test/sub -- ok
> [19] $ getfattr -m- test/sub -- failed
> Can't exec "getfattr": No such file or directory at ./test/run line 369=
,=20
> <TEST_FILE> line 24. !=3D # file: test/sub
> getfattr: No such file or directory=C2=A0=C2=A0 !=3D system.posix_acl_a=
ccess
> ~=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !=3D=
 system.posix_acl_default

I didn't reproduce this failure in my environment.
XPASS: test/nfs/nfsacl
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[6] $ umask 022 -- ok
[7] $ mkdir -p test/sub -- ok
[8] $ echo blah > test/sub/blah -- ok
[10] $ cp -rp test/sub test/sub2 -- ok
[11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
[15] $ rm -rf test/sub2 -- ok
[17] $ setfacl -m u:daemon:rwx test/sub -- ok
[18] $ setfacl -dm u:daemon:rwx test/sub -- ok
[19] $ getfattr -m- test/sub -- ok
[25] $ cp -rp test/sub test/sub2 -- ok
[26] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
[30] $ rm -rf test/sub2 -- ok
[32] $ setfacl -m u:daemon:rw test/sub/blah -- ok
[33] $ cp -rp test/sub test/sub2 -- ok
[34] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
[38] $ rm -rf test/sub2 -- ok
[42] $ rm -rf test -- ok
17 commands (17 passed, 0 failed)
XPASS test/nfs/nfsacl.test (exit status: 0)


Thanks,


> ~=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !=3D
> [25] $ cp -rp test/sub test/sub2 -- ok
> [26] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
> [30] $ rm -rf test/sub2 -- ok
> [32] $ setfacl -m u:daemon:rw test/sub/blah -- ok
> [33] $ cp -rp test/sub test/sub2 -- ok
> [34] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
> [38] $ rm -rf test/sub2 -- ok
> [42] $ rm -rf test -- ok
> 17 commands (16 passed, 1 failed)
> FAIL test/nfs/nfsacl.test (exit status: 1)
>=20
> --=20
> Best regards,
> Jo=C3=A3o Marcos Costa
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201005): https://lists.openembedded.org/g/openembed=
ded-core/message/201005
> Mute This Topic: https://lists.openembedded.org/mt/106757200/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mingli.yu@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

