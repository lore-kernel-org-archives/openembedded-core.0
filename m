Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43E5CCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 12:49:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10977.1760186951556428869
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Oct 2025 05:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Tix2+af6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2379fe7d79=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59BCP2bK845318
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 12:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=CBZTmwcvqHsDFY/U8DSoEjgmQ9rx8lqW8bVTCgGBug0=; b=Tix2+af6JpqI
	LYy+aBrCOZfI4MkLFgHPHpWyMTnnfs4wlsdDbZzD2c2FJ1O3PSvUrROgBhWjR7ta
	xw3MnHmUSRZBEBbx3d4qk1q+lh7jie6Hz7NoeX8/X7IIG8o7PXkGcn6WuEzVvdCo
	4joFAgmIctp0nOO70Fqhr6kTvrpoUW5CZe8SvIX5yKxNBVm6mq8iatsqBexCjYip
	E1Z4thuy2Rf9Dhmf/cgZbu2n3NA23ZZM+2qzw+Tdq4xFf6l3mVEgktdjImckM8Rs
	P5XnPz4PAQC36BYa/pb2iQB8FeCa6Bu+cDaNktd2CBckNkXxUM92rt6s1MNrpPPA
	xQK9JRKUBQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qe768ae6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 12:49:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyXch+a33Dn2XI0IC/5uyA+tAM6kWaLs2UPE0gFpZWG8RqD4klj+q+994hKxjLGOPc16OfuVyNN5fLUwe06dSDf8Cp6pmZHaikMNDXoRbfPCf693KU2ZkCOIDGgomiRWCoMo95PwoPoCNRMiIMs1FchwV7zbOf3qnWfRUeAGCZBcAUY51CdJwMEos0KXjNvmHeo6M6sIpzoiCq67msQzTae/OVrg5KpNB950vbPnBcPX5HkYu5nmDcDVsYQDj+EB16KSaVZA1mNbngRf4f1eYDT/EYKLN6t6uTjXZq3wulPi9H5IAziE1t4L4gr37CvTKdvxEsYzGLlVVFu+sAKP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBZTmwcvqHsDFY/U8DSoEjgmQ9rx8lqW8bVTCgGBug0=;
 b=m+joO401ARTwPtM+g+sDoPmrK9Wpbd257aQ74m0g+r0e8+BLQdBnSTMLFLIa/ixrnDFih2fl0i+6pMrINSxlg2XXTNuq5+rOm5LV6U60elKo8Wt08tCmISekCPzIrZTn2dAx8dy5iTNx60RtEiQs477cVxwoEuLukFWoaxeahgwIS+MTEr7xFBCG67eDbdQIltjkQDfrLoRl7u+9HXezBQOD63TFxoORAejO361mB00XULhxqrVkL31roISbS2gXWxg6FkVq5Yd/j1Lq9XENEQUFuDfrHEx5jYDGOtDZV/pDPzyQh9QDRjTrySv8YWe4bo9GwXr9DcAQMQHOeZqeuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DS4PPF990BCE628.namprd11.prod.outlook.com (2603:10b6:f:fc02::3d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Sat, 11 Oct
 2025 12:49:06 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 12:49:06 +0000
Message-ID: <07604c56-dd5c-4e6f-8916-426cc011a4bc@windriver.com>
Date: Sat, 11 Oct 2025 20:49:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] syslinux: clean old object and dependency
 files before do_install
To: openembedded-core@lists.openembedded.org
References: <1869A174E96D7910.29244@lists.openembedded.org>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <1869A174E96D7910.29244@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DS4PPF990BCE628:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec6b12f-6718-405e-9f21-08de08c49040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NExaTzZsOFExaFE3VDRqMnArVDZ3MGFjUGU2d0tuNzZ3RlkxTHZsK1FGOHFo?=
 =?utf-8?B?T1lxMjdSOHRYUVNkWHg5SS9KVkRjUFNCMkVyK0wzeVlHcTdZQjFxRFFBcmRa?=
 =?utf-8?B?T0RSU2hkM3IvZEo4QkxTKy9jcFdQVU04cUp1U1A5eEd1QkVoQjhPVHlFQ21w?=
 =?utf-8?B?eTFMdG5zeGc3aEs0bUl1Ui80YlRCTlY0c3hORGR2dlFxMVU5Uy9DSGlPb3Jz?=
 =?utf-8?B?ekdTZDZ6UTIrMTZyS1Ryd1NhRGNoOW5tNUJCTXBnRUFhRkdCaHpDMitxSjJi?=
 =?utf-8?B?OXhxT2tjczJrOFU5ZUNKQmhNTE1vRXpwTEQ3bjlrSWVBZU8vNzJBdExkN0RW?=
 =?utf-8?B?dmttQURkdU5Ea09tWk9pSldkOGhKckFLUTdiZkFTVC9oaWYxOUhFdWpVSkpr?=
 =?utf-8?B?NG1pWEFSZTJSZ2dWVVpjdEJRWnYvZXdXTVBvVVdwY0NxRm1zSW55MnhFMnM2?=
 =?utf-8?B?NlNFeXd0OHVKZTFNdVFWVXNscnhLUkxFQU95bWY1VmFSbDduN29FcmdJRk9q?=
 =?utf-8?B?QXc2VXRZOHZzVnpaSzJJRjI3Y2R5OGpUTGFXNkdVd0JHaTNHV2NZNHd0OTFa?=
 =?utf-8?B?czJicFRqRSt3QWF1SVl3UGZsSElsMk1LekNqdUJhRWVHbDcxM2U2YnkrVytY?=
 =?utf-8?B?WjFGcktwemR2dGs0aVpleUt3aTY1aUV3Y3F1VnpxYk55K1dHWGZoZFlFcGlV?=
 =?utf-8?B?VzVrME9XcTVwM09hUVpvM3NhbmV6U0hISHpQekh6Tm4xUklXUmprWFBHbFlJ?=
 =?utf-8?B?dDNrcmlwcTIxaGRYWG5kRXRRS0hqSmZTeGpjSmRWMnlYVlNjZFFWOG8zekRM?=
 =?utf-8?B?SkN2RDJiSk9jUEMrWE9JQXVwN2YrOXltVHZ3TjYrZG9JcFJ0QzU5bDgrbWd6?=
 =?utf-8?B?bjRXQlRsa3QvWFd6SmRYL2REVmd1MXZGS2sydTdncks3N3pDUjU5UjVROU8w?=
 =?utf-8?B?TURNZWVQYWp6MlpwYUJsN2cxblIxV2QzMmszSlJvZjhRV0NpczJmcmR3bmdS?=
 =?utf-8?B?UExWdDFCZnZxbFkvbWt1b1RXUElFWXlVQUVZMERNY3BCbndKSjd3eENKb2xZ?=
 =?utf-8?B?dlRhTVFHVnpDbmMveE5xMkhaSnM0YkpRc3RCR1duYkZYMHpndGhlSWVOeEFY?=
 =?utf-8?B?eCsxS3FZR2pWY0FlcHoyMDUybkhEUllHcmtKWFpRZERhcTNkd0tZdUlGbEZC?=
 =?utf-8?B?K0RXNUVoTW4waEpiWG1jdEtkUDZZWnJkaFRtS1FYcFdwbmhDc1haV0tlTHBW?=
 =?utf-8?B?dzlQcHFoelNScEVLS2RmTmdTVTVMWHd2MFlQSGkrOEJKU2Y4ejd1dmJTb3o1?=
 =?utf-8?B?NkdORWJQV25WVWZzeHh4bXBLWWlybFBxcmUxb0lza2dqUG5DSTdjRzh6QjhT?=
 =?utf-8?B?UkVEVnE0azExZVdySVBNVjJkaE0zK1J4cmJxOGN4dkZYUDdRQTg3Z1NWK2tS?=
 =?utf-8?B?MmdLcDNrSmN6ci9WZlowcEFRbUl1dzhncUs1LzVqN0NWbXRlVXB1QUxZRElE?=
 =?utf-8?B?YytKdjhDYnRQRDNvaDhLWjhMYWNTVFdGcFZRRGdaM2p0OFNsVkJUZDFVVVVu?=
 =?utf-8?B?OE95Q1NUbkhCRnNzN2I4OXBRQUpEMlhHL3ZhYkZIM3RMVzJhVFlZbEUvSmgy?=
 =?utf-8?B?ZWowc3U5eWlOc3pDdGNsSWRwalJabmx6c2dOS1Q5eVczN08vUndDL2ozMEpQ?=
 =?utf-8?B?QWYwRW9yUklURmF4UUdxOHVjKzZNbGtoSjlnQm5vbk1keW80dGlkSHJRNXJT?=
 =?utf-8?B?eXhMNStBVnhMa2ZnbURPM2t1VDZ6MXk3SENIRGhmcjhYRDBxcXNoQzhpcDZv?=
 =?utf-8?B?MnNwSUNYVVFqZkwyTzlmTkc3UEcyR280a1A0NGVoZzZSTlEyU1BnbUZzMVc4?=
 =?utf-8?B?NWt6bUV0b1B2Vm9GUk1YV1duc0t1WHU2d3VPamh4MFQrN2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mktici9qSWxJOFlnNFp1R202NjhxTjRvWkNWZXdrUkNIdm1QdUozTzN5TDJH?=
 =?utf-8?B?bW5ZU0NBQ3VqTW04Z1I2QXV2bjFaUWRYenFnc3pqMjROdTZWUlNwQnRQelBN?=
 =?utf-8?B?UjF2NENqdndEVmlGeEhpMlEzNktYNWlSUmlGZUJhZk0xUzNpMUxOaWFYdXg5?=
 =?utf-8?B?Qk1qdS84NVh5aGwwL2lnMElCek5kbTg1ejMzc3YrK0dPdmRCS1JTYTllVngw?=
 =?utf-8?B?YjY3dnY5OElTblltWGowYzd6ZXhyVmNoQUxnZUU3aUI2aVJzOE9OS1d4MEJL?=
 =?utf-8?B?QTJkY1RueTZueGVuVWw1WmhYSUJsbzVyMGhoQmlpWkRBbFNyRU05NWZsSGFr?=
 =?utf-8?B?ckgzT3h5NGFyem5Wb0xyOExYYjJRUG0wdmNXM0JFQ3VNNnNsR3JmR1hWNkp0?=
 =?utf-8?B?RTV5SEpWMGVlbWZTRUw4cHdJcEl5TlVkcEE0R3FVZU84dWduTmoydXBIa0Fz?=
 =?utf-8?B?UWVDM01SbFVuYkJxT0F5QkNLclEwUmQzZG5aN0g5eHppUHFrTGxYc0pDeUxs?=
 =?utf-8?B?ZFlZQ2JtckJaanRXVld2Tlp6MXZYSklxS0E3UVhmRjdxYlBkRVFySDhtdWt1?=
 =?utf-8?B?aEJCZEs3cUIxWEMzM3N4WDAvTzdjWjhuNUFIYkpGTnBXRnJJSnZqU2UzbWVn?=
 =?utf-8?B?dWJPVCtVZ2FnMDY4ZVdSaHhFcERETTVnVVNCenV1WVpTUVFLL0JBYlpqeGVH?=
 =?utf-8?B?RGlBU1NxTlpjLzlUZ2tKMW01OFJIaXczOFhCZlVkNEprOCt3clpheXN3R1NK?=
 =?utf-8?B?UHZyM2l2UlFpTittZ1Y0YjhwT0x6TGQ0VGhDSzhwSTU4SFFrWEUzbkFzN3lk?=
 =?utf-8?B?SzgxR25MRVBWQ2x2S2dXUzdocFJlQTZXaDFDRVZnNUtvb2h2Wm1WbXJjUGdC?=
 =?utf-8?B?UFhjTmNTTmxvWi9Ja3ZnL1d2V09mcDEyY25HTksvNFRvSlFBNitiZmswQ1FW?=
 =?utf-8?B?WjczK1ljRUVtTmdxMUhNaHV4TlFkVnVNWEtzekVPVEY5M0hZMVk2RG1GTUZz?=
 =?utf-8?B?eHBvMmpoR3k4MzBjNGpiZjJtMXY1L1cyUjJuNWR3YnZOZk15UUd5NXgwUkJs?=
 =?utf-8?B?cHN4VkZmcXU3dmFMVWJwNURKRjkwUGlrcEpkOGhzOEpkb3JJVkpWNmtMRFZB?=
 =?utf-8?B?Q1NvVFZtRWxqZ3AwdXZvamJUNzgrSmJKODlUUDRMemtwZ09PTE1oeFZVZTg2?=
 =?utf-8?B?TFNEa0cyVEkzbzkzSWhOQnRQU0tsdmR6aUlnbC9DKzFVbTJybTVTNm56LzRu?=
 =?utf-8?B?M1FPMXJxZFA0Ylg0dlhmanVrY2xHZ0FFQno1bnRQeGd2NGlhODFyZUMzdVJ4?=
 =?utf-8?B?cVEwN2NYYzdGdDRpeVY1dWlMRzJONFA4MWF0VU14SUllelpkNy9zcndxYmNS?=
 =?utf-8?B?R1dQU3VzbTYxT012NjhUUXFlU2Mxd2VOamNaalZhM1U0U3YyVXRTc2Qwa0ZU?=
 =?utf-8?B?eVFzSDVpQ3BCZEI2RFkySHUzMzlwY1ptVjZpOVVUc3hOdk5tcW5vYlBHY2Np?=
 =?utf-8?B?MlNsc3JCdUZIWFBNeXNaa2F4b1N0dnhLN0czM1czUTVJV2JZU0hLbnVHQWto?=
 =?utf-8?B?enJ5SHYveWtrZ2JzMjdvczg2eHQzc0plMGk2aXNpeE5oZjhqRW1Nb1NGaDIv?=
 =?utf-8?B?MHJYbXNuTEo5bG1IUFBSSlorMHYzRVZkelJtSE44K0thMXJLcFExOWlpSmV4?=
 =?utf-8?B?cktKQ1E2RHB6d1FFY2RxaHdIR21kSU13N3graFZZRFBjY0FLcHUvejR2QXZG?=
 =?utf-8?B?R21EcXdvWG1rcjV6QUlrS1NyRTRrWTlGTW44dms4b1d4UjBtR3NmMFFNRVR4?=
 =?utf-8?B?d2NmN0ZidjluT1RPcVp1dlp2M25NVjEvaWpoRGZ4QndyNm1leW1jTjRxUnhv?=
 =?utf-8?B?WVNlTnNyOWhKbERoUkRNVUJRcXBaQzNyRVdIMksvNG82V0R0MHZsREcwTHNj?=
 =?utf-8?B?eklUU2Y4eHcrb2p4cGNDL3NSRjEyeDE1TmZFZDBXaVR4NTg5cFdZZTdocmR4?=
 =?utf-8?B?SG9NelVRYmppVFV6NTBkMU5SRHpSUjd2YUh2Vmlpb1l6U3VuYlphVEg1MUpj?=
 =?utf-8?B?ZGxxdDRDMU1aZWJYNnA3R1ovNXNURnk0cXdSdE5xb1FYRllLbUU0cjBKQ3Zu?=
 =?utf-8?B?UXJMYXB3Umo4aFB6VVRDS1dlRndjSEMrZ3lpMFBiOFVRNEwwV1UzcENUYjFw?=
 =?utf-8?B?WFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec6b12f-6718-405e-9f21-08de08c49040
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 12:49:06.3101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SB2XhPGMoeF8KFPRUZa9aC9YgD7jRMTcGxQRViDvCVQlQt5880J0KSESc6Y02u5qckPtnmHGSNPY2NDKx88UMham9hHyWzck7qaHfTW10WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF990BCE628
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDA3MSBTYWx0ZWRfX+zlzFxxJQzRU
 7mc3SZDvhDpgx+/oRdmJnSJi1Vi60EN4HvttH6H1SLEJ+aSa5C1xm0IjKlRQCSdtaHvF0PUIjRp
 LQByIDxM1nfooc8zdPprfzMWNdzMRH6Eq40mQ9LJmTRNZA3Ip2azxe6bE2GMblRNdRjn+3Csppt
 f7KSXJ3SA7i8cJMyv5BCgbsCfUX7gHloSBOewNNFJjfUT8N5Im3aoCjAM3Z//X34Na9YHoM4JQ1
 KhJ/UydmlM/h9Tty7FjygKrEWPd3OwA0NQX7PlUiEI6WSWr+33CPGgVb74wlPBtP34k6p3n4UVX
 dwtRec3V0Fk23vapat6okNVhxyuko1qjmqTZlu00CnmLZEiImxOVOm60jr95ou3C9CDQk6H7wjq
 r5gbIZqDrUVMSJJ7tgE3H2TD+qTRGg==
X-Authority-Analysis: v=2.4 cv=E8vAZKdl c=1 sm=1 tr=0 ts=68ea5246 cx=c_pps
 a=zclsoE7mv10+eI8hWvbpiQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=vAy3_97hLmy9cp79vkUA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: cOlvsjUni6IcXqonp_ZEDmT0M0ptE264
X-Proofpoint-ORIG-GUID: cOlvsjUni6IcXqonp_ZEDmT0M0ptE264
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510110071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 12:49:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224717

ping

On 9/29/2025 10:56 AM, Yan, Haixiao (CN) via lists.openembedded.org wrote:
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> Remove all previous .o and .d files from OBJ directories before
> running do_install. This prevents stale build artifacts from
> interfering with the installation of new binaries and modules,
> especially after GCC upgrades that can invalidate existing dependency
> files, such as:
>
> make[4]: *** No rule to make target
> '/build/tmp-glibc/work/corei7-64-wrs-linux/syslinux/6.04-pre2-r1/recipe-sysroot-native/
> usr/lib/x86_64-wrs-linux/gcc/x86_64-wrs-linux/12.4.0/include/stdarg.h',
> needed by 'zlib/adler32.o'.  Stop.
>
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
>   meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> index 449a75ebf8ab..59f1e936eff9 100644
> --- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> +++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> @@ -96,11 +96,6 @@ do_install() {
>   #
>   # Tasks for target which ship the precompiled bootloader and installer
>   #
> -do_configure:class-target() {
> -	# No need to do anything as we're mostly shipping the precompiled binaries
> -	:
> -}
> -
>   do_compile:class-target() {
>   	# No need to do anything as we're mostly shipping the precompiled binaries
>   	:
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224110): https://lists.openembedded.org/g/openembedded-core/message/224110
> Mute This Topic: https://lists.openembedded.org/mt/115489669/8599992
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Haixiao.Yan.CN@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

