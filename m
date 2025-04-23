Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A10EC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 10:23:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4929.1745403796944334390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 03:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=620845931d=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAC4kV019802
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 10:23:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jh60kfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 10:23:15 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53NANFSn004823;
	Wed, 23 Apr 2025 10:23:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jh60kfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 10:23:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gH+Gq9RwGNo0oD4o5K1jeV2ki/pnZgDPIr6JdC4062LukiL1vvqS3dkl9NYxddJcICeU3taaGDYsVCAg8Xg8Qtj6kxQybjd0DTvfgBSoHJRFpqfrr+ub9GkPLo1zuY9FwKzVHFlE5xiepKKL1eSZ5OFDqxiAEQfADPmAhhEm4S2kEcWwnUewFGTzr0wCPnNWbxZWnj0VNJx/mkE2ziGzVvIo1N6aWWnHyXElL8X3VKTGOO0I8UqQYj51jdUe7vQ7R/g3rUkQEWeD2ohe/SarjbuQmKboY5ZJ7YUc2yOFMtioCCWoCNAaJ5CiZB4uzLIq+HuBemjYlDcOYVMzs4W5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFSnZjDRZI+qzcyl4QX1AhceNko2uu7wCTMGypq8voU=;
 b=WNUvEBlFXyZjE1hS6WlqXEVd+bRbNz4uAUyJndAMMz7N135VoCdCCEaiVjcPyDabB3wsPyoQWBjWcjA6SW/HvogXGtoU3WVOO3vlRXAM9px+12IcX5DUWtTSjpOGo0oDNCD7nlJNOm6wQtxhyfObdXPstb2mFZW/UejAR4NFa3TMD7uBcY6Op10a/8Kxq2ic2Vp8vVfgBGHRysfLYq/x6oyI22eSIGdec5udWBs9VAzf5fpdyP6bwDzWGBLfAt4QEmHrIjILoRO2q5/iCywfhWj7s8Z8998Pd2bB04y1ZNOa3VDPTuGGL8VZSwIZik6Dx+0D1ZuEd/kNJo5veCUixg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ5PPF7CF5FEA5F.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::838) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 10:23:11 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 10:23:10 +0000
Content-Type: multipart/alternative;
 boundary="------------VlTrISsevCk0PZeBSfuGKyAH"
Message-ID: <73c9bad4-bedc-43ec-a06d-a8b4dc62548b@windriver.com>
Date: Wed, 23 Apr 2025 18:23:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3] icu: set ac_cv_path_install to install under
 hosttools
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20250422130702.1337476-1-changqing.li@windriver.com>
 <D9DR2YV3L26S.29EB7OC0D9J5S@bootlin.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <D9DR2YV3L26S.29EB7OC0D9J5S@bootlin.com>
X-ClientProxiedBy: SGAP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::16)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ5PPF7CF5FEA5F:EE_
X-MS-Office365-Filtering-Correlation-Id: e5fedb08-daf7-463e-5e76-08dd8250d8d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3BaUXRRRkVaeHRxdUkzSjJQajVuSVB0cHpNNlpUU2YzcGpVVDZGVkRqU1VF?=
 =?utf-8?B?ZDNLdEJQT05kQXVIMmdyck01VFY0Q1NmNU1QZlFFN0dHdmE3UHloeFpIS3ln?=
 =?utf-8?B?WW5oU1NneEdvbjNjS2NyTHV3Z2NOZ3czMUFYTWFwL1BhRjdXKzNqZXV4WmZH?=
 =?utf-8?B?bk5NTGs0d1FhNVJMa0J5RzQ2V1Z3WitQZjcrWURjRzA3ZmlvT3loR3NtM1BB?=
 =?utf-8?B?S2huemN2SHd4VHJtTjdNSGRCd3Y5N3lBRVptNUdYVlg2ZGlFc01TNnpjWFps?=
 =?utf-8?B?Vkt1MnZQZnFkRGM1ZGRBM04zdjltWDNUeXViTXFqVmNTOU1uMGlDcFZCQUlX?=
 =?utf-8?B?SDRyV3FHVVVxZTUzeTE4MWVCMHRsNU5zdHdodzd1WDNQWEFnYnAzOUNOU1E4?=
 =?utf-8?B?eW9FK2ZFMWZoQTMvQklMd2prdTZWcjlkcFprTjdROEZyOUtMWVI4d3NIMU1C?=
 =?utf-8?B?ZFZYelUxdXlJV2hOYVkxYmZVTkxiSFM4Nm4rN1BIRVJUNDU2TDlKNUgrdTZt?=
 =?utf-8?B?ZGR5VWJSS0x4dVhQUjU5elJ2ZGVSSUZGc2dLaUluR0JvZFJFNkRvZjQ4aUlp?=
 =?utf-8?B?T0ZHVy9EKy84WXZERlR4dFdxL1Q3bHFzdEl4aUY3ZDQ2NzY2VTR3T0F4VDhX?=
 =?utf-8?B?WElKL1hkZHROS1FRRkdGZ1NXVDYzUXZ1aGVXNVlSKzJOVG1QMlZZYjNlS1VO?=
 =?utf-8?B?dmQ3TldsTlpYbDBlaE9hMnNDVmZlTkpyOHZhUnVxZ012K0YrR1MwcU5YSzA0?=
 =?utf-8?B?c3M0VExKY0NjMUdkcW1zc3hncUROUU13VnErdyt6ZXh0d3Exc1phd0doc21X?=
 =?utf-8?B?TTRDODlTOTdvYmhHdHZJRENsQmtQOXRWNzY1bmVGdE5ZNmZ1eG1MRG1COHdO?=
 =?utf-8?B?MkYwRjdaN1hZTFpKUExjZmRZcElTT0dESE4vQTFPRktoZnhIeDJuMzYzczEx?=
 =?utf-8?B?elpJbHhDQUtzT25uem9hVWJYVlREWGJlTXphZ1pEUkdkQXBvT3VVSzlreUZr?=
 =?utf-8?B?eGU0cXRTeUhFS256R09jZ3hHOEdPNklMQis5TzFXMk8zeXl6eUFTN0toUWhl?=
 =?utf-8?B?UmVqblphREtDcVNFSURHbEUweDF1R3FZZGZSMWFkSlZCckN5WDkzQ0pVVGlI?=
 =?utf-8?B?RThSQzZRajFNOUZyTmpwVWJKKzZ5eHVFcTU1MTlxOUphUlVXbERxOXQyN0x6?=
 =?utf-8?B?TkV6VmtKdllDc1VzZ00rRTdyNmNHR1hsVjFSQVN4YjhtOTZ1RWlQWEN5OS9V?=
 =?utf-8?B?WklkUW9PcHNWOTE1LzZNYXArTEhoNFZ0cDNLSTdtMklNdkVrM1V5Z0h5elFL?=
 =?utf-8?B?dmlRc1RnYW0vYllRUzNLdVE3Y3FFUm5LL2FUUFMra2hUVEFLN1RpUGIyQjIz?=
 =?utf-8?B?UmErbm5TN21nRTAyWC9WM0lWeVVldWFydk5uVVdNb3h1STVxYWJQaG9Va2li?=
 =?utf-8?B?UnUranRRc3VyZ0JjMjRnUm9mZzllMVJkM0ZuWEY1alpCNm8xejAxNkxNKzgv?=
 =?utf-8?B?YkhyUm9BWHZjSTdkb0taMGFpdTBTNE52elpvVW1TZndjSzZycW9NbFlBYmJC?=
 =?utf-8?B?RmxqSU4rL0haTnByTzlkZWd0THM1dXptQVBrODFpRUVheFI5VUJtQUp0NkpF?=
 =?utf-8?B?ZUNCUi83anFjV096SUdRTTRQMFVLUGRTMGREVFdWVHEwd1Jubno3TDZDRG9v?=
 =?utf-8?B?YWc1bk1rU2pMTTZSSks4ZktWSnpDakR2VHNwTjB5eGE4ZUt2R3BTVzRSWUo3?=
 =?utf-8?B?bDQycFdMeSt3emhVay9RL0ZrbVBPckVtWHRpZTB6ME41eW5lc2FNZnloS3BU?=
 =?utf-8?Q?LzAbQfrajKZF9JMYvuuT8VPKhemKAIHsZnLUk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QlVKTUNCNUVJYTViaWlVM0NOckJGYzJFVjY0TFFiWmpFODd4cXJ4UWVVTm5O?=
 =?utf-8?B?c3BFU0F4eENNeEQxRjBIU2I1QXJrMUlZRXFDRlc0a1pwbEZTTnptQ2RFcmtM?=
 =?utf-8?B?N1RhQW1MNmpyQjdlaXJBQ2pmWVpJZ1VqRDJPOHkveVMyVEFzeXBJajBIeVFh?=
 =?utf-8?B?b1dJeXhvWHFTNThvVzUxcGpndm1HZkIxZVJWWXg4d1B1VjBQY0daa2JVbEpN?=
 =?utf-8?B?V1hpdGk3UUFzSHRtZ3VHVGdjak9qVjJJaXB0WTZLZFo3dXBFS0V1YzJ0L3po?=
 =?utf-8?B?Qkc0VGM3Nm04azIrTmhlWGhZblMrTTNwTHpIdnRyNm1aNGVWLzlzOWxIWHd0?=
 =?utf-8?B?WGEwMjdkYWZpVndRbGZBTkdaQjdkMEYwNmtHV3dJeTY2UDl3RUJVWk13RkJh?=
 =?utf-8?B?eG9LYmYxUTA1d2hNYTEzZkl1R09JSFVkUFJqYlRXY2NyR3Yza2FDWldxRDND?=
 =?utf-8?B?cVhzazArRkVQUXhTcWhRUUlmUHdwbUZhWTVydkpiMWN4dWE0OG8yQlZ2Y2Jt?=
 =?utf-8?B?cDBWOW50Q01OaVZoTTI3dWsyQ0pOTmgyNEVGbHpsdHJIQllJZDJJNU1VOWJh?=
 =?utf-8?B?YmZ0TUE3VlgxSjk3eHRxdURrakZLSHQ5bTFLQ2RtOEJ0NmlTMnlWSWtaMG5F?=
 =?utf-8?B?TkJtaGlNaDRWVWNDUVRUUDBaN2pSeG1FZXlTTVBpS3o2b0lCTVF5M1VUU2tx?=
 =?utf-8?B?S21wcjJhMjdmWlRHaXBNMnFBQU80cGl5MXhBbFhTNE0xVDd4czNyTGlpd3pK?=
 =?utf-8?B?VUZBeS9Vb1ZGQ1lOMFd1RVY1YjY0UUVXaS9qVkdodGhlTnU5bFZxWmN6a0ll?=
 =?utf-8?B?NnRraXBwSUQzWDJxTnE4YXZmeFBqY2ZXcW1GY0VZM3plRXl2Z2lER1gzWlZx?=
 =?utf-8?B?VEdhaHhRNDNNbzNMWFBFWFZ4N2ZuVXNCY1kzdG50a1d2WnR2VVlhYnhSU0FX?=
 =?utf-8?B?N2ZCUjV0SEk2aFdIdWtSTGh6dTRpWm5SWWROWWlNR2FIVTVqNk5zem9BTDVq?=
 =?utf-8?B?azkyNTRjTGpaZGR3empqMmhwekd1S2FxM290U1NxdXhtYUxVV1ZBN01PZXh4?=
 =?utf-8?B?RUFvZzQ2ZHRSSkE4Y1o4cGVSTDVMTHg0RjNDOU1HaFUzbERLV0VCSjBBeFgw?=
 =?utf-8?B?NjZwNlFiWHN1RE1sU1RGcWtwbGc3YmNYN1RDUnJNaXhXdjRobXBkNXRnaUNL?=
 =?utf-8?B?UVBCanFSRGdwSnBiZnY2cUVYTkw4QXJ2T3hMUml4SHBnbHkzOW5mb1NLVXUw?=
 =?utf-8?B?N3NIZDVkd2FKYmt1Yy9WaThJTnYxaTFwTHBGbk1yMXZIbW1jTU15cWx4M29H?=
 =?utf-8?B?NzQ3Skttd2t4T1R2SVQrVi9JZzV1NjVYM2hwMTF3cXFMamt1QjBiRGcxTGNn?=
 =?utf-8?B?MnBFWmNXOExIOXhRSkVKbTdMbUgzb3dJT3JDNlNLUzMwR3lnM0VYSWdKMExx?=
 =?utf-8?B?MkNIdi82c0UxVDNRRFRkcjBFNHpTSU9PMDgra3Y0aG9TT2pqRHB2S2JNbHVx?=
 =?utf-8?B?VCtVTXo1eXNhUnB1b2hhL1ZWYVA2enp4SFRkUHhYNTlSR0NDVUI0OHVNcEVn?=
 =?utf-8?B?OCszai9INFloTEJzTzdYSW1maUpJa2QzRHhxNHZoWTR6d2hYM0Zac29qU1Iv?=
 =?utf-8?B?TkkyUmJxWWJqV1J3SXNzZzVrVSs2SXhpSTJGNE9LbWc5SlM2UjJBSmZOMFBu?=
 =?utf-8?B?TVFURFFlaXhmWmZ3K3k5cVhZdmxmT3dyRG5RYnhLMGZ1L25VRE5veVlXNEQ3?=
 =?utf-8?B?VWE2TUxaMHF0YjJoOU54eEs0R1BPYmhtSU82K05HdVllNzJjNjZtakFDbkpW?=
 =?utf-8?B?Z2VhWkk5MjZ6b3NWNVBtQ0NWSllPRDhrdFhDQjl6RlMyTURyUWExOForc0F5?=
 =?utf-8?B?NE1HejJWR2hqd1hEeGkvK050alRzNXZtMHRFOUF5V2pRWXhBSlBsSER5eXNn?=
 =?utf-8?B?U1cwZDQwSWxPeSt5eW5DOThGaHJuUVdaWko5QnNOK2ZoVmJPeU8reHdYVDJy?=
 =?utf-8?B?SXpaL3RSajdZbytGQ044RS83bGg1M3VGQmdGODJwOTJQN2tvNTZHL3llRFlx?=
 =?utf-8?B?N0g1aGxjUFI5N2VpU2s5bncxTEZxL2RsZFBJbUR2bmZkUVp0eXM4US9YU0tF?=
 =?utf-8?B?dzJvMjV5QUVlbVlqMHBCbm1vSSs1VkZOY2ovMDUwVmxhY2ZCNEdhQU4xT2VB?=
 =?utf-8?B?U0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fedb08-daf7-463e-5e76-08dd8250d8d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 10:23:10.6516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4M1kDDXw/hydwWroVEnfSovLKG0mjAXCD8Alny5Zw4M3Mt7X1VyoCQ9oQImGU2I9cDGVGYaQ6qfJ2JvoRcJRsEWr0aqEIDKm0JeOdJXWxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7CF5FEA5F
X-Proofpoint-GUID: -EcwXsnXOTJvxijG62BG6UkKstTWaCCh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3MSBTYWx0ZWRfX0TeqJo2JEUH1 d2jcGts8Xex4rTt8zUIVl7jACtkwBfqZnPYeYK6htJhn7U+66Tt+bmZaDSvQoCcPLG6pUlmKrVi SsOfBxDRSUNSLaft/2FKGze+dgtToS+jtopErTWlsqBikImlK73fE+lfHiszJpVE6TLjbgbuQBP
 EPDN9lcps4DUGRPsfHAZb/kA/KcS3BhHaEXrbBSgCQMLo+87csyJBtnid2gwNG7SWpLLKTNLo8f su3zrJGIVs/q4pHtWsUeYYzQbGMR5eUy5viUolglbRmANr6+RNFmGNiV+PtHLeVsS1wgySspL43 qXj0Sp4yO5wDCqthgdqmSzbziPilVsRuIQUK/OXk1vuAzF7+lKXVEyJnYhs5Lkgm9PSx+B4QIHC
 MCFzlcH14efEzXGu2/FXLpUn5czMJ6LcIPlYmj2/t6BBYkS3qlmZsquaEWYr3jn9gawQXFoX
X-Authority-Analysis: v=2.4 cv=Lu+Symdc c=1 sm=1 tr=0 ts=6808bf93 cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=aZwwZB3yVhp3aQnmzjgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=yj-aMKAYKbz0kkd27lYA:9 a=T18JjxTkPQ1uMTk-:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BR9LnLnJAiit-zZtezKaUn9AcRp2c0_Q
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504230071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 10:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215275

--------------VlTrISsevCk0PZeBSfuGKyAH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53NAC4kV019802


On 4/23/25 12:57, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue Apr 22, 2025 at 3:07 PM CEST, Changqing Li via lists.openembedde=
d.org wrote:
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
>> or /build/tmp/hosttools/install.
>>
>> set ac_cv_path_install to install under hosttools to make a determined
>> result of INSTALL_CMD, avoid vary caused by the execute sequence of
>> another task which DEPENDS on coreutils-native and independent with
>> do_configure
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
> Hi,
>
> Thanks for your patch.
>
> It looks like we have some issue with is, as can be seen on the
> autobuilder:
>
> ERROR: icu-76-1-r0 do_package_qa: QA Issue: File /usr/lib/icu/76.1/pkgd=
ata.inc in package icu-dev contains reference to TMPDIR [buildpaths]
> ERROR: icu-76-1-r0 do_package_qa: Fatal QA errors were found, failing t=
ask.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1435/=
steps/12/logs/stdio
>
> Can you have a look at this failure please?

Hi,

I cannot reproduce this locally,=C2=A0 in my local env,=C2=A0 buildpaths =
is=20
removed by function remove_build_host_references.

Could you help to check the content of /usr/lib/icu/76.1/pkgdata.inc,=20
what is this buildpaths reference?

Besides, I see that poky-contrib mathieu/master-next has the V2 patch,=20
but I also cannot reproduce with V2 patch.

Thanks

Changqing

>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
--------------VlTrISsevCk0PZeBSfuGKyAH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/23/25 12:57, Mathieu Dubois-Briand
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:D9DR2YV3L26S.29EB7OC0D9J5S@bootlin.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue Apr 22, 2025 at 3:07 PM CEST, Changqing Li via lists.openembedded.org wrote:
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
or /build/tmp/hosttools/install.

set ac_cv_path_install to install under hosttools to make a determined
result of INSTALL_CMD, avoid vary caused by the execute sequence of
another task which DEPENDS on coreutils-native and independent with
do_configure

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi,

Thanks for your patch.

It looks like we have some issue with is, as can be seen on the
autobuilder:

ERROR: icu-76-1-r0 do_package_qa: QA Issue: File /usr/lib/icu/76.1/pkgdata.inc in package icu-dev contains reference to TMPDIR [buildpaths]
ERROR: icu-76-1-r0 do_package_qa: Fatal QA errors were found, failing task.

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1435/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1435/steps/12/logs/stdio</a>

Can you have a look at this failure please?</pre>
    </blockquote>
    <p>Hi,</p>
    <p>I cannot reproduce this locally,&nbsp; in my local env,&nbsp; buildpaths is
      removed by function remove_build_host_references.</p>
    <p>Could you help to check the content of&nbsp; <span style="white-space: pre-wrap">/usr/lib/icu/76.1/pkgdata.inc, what is this </span><span style="white-space: pre-wrap">buildpaths reference?</span></p>
    <p><span style="white-space: pre-wrap">Besides,  I see that poky-contrib  mathieu/master-next  has the V2 patch,  but I also cannot reproduce with V2 patch.</span></p>
    <p><span style="white-space: pre-wrap">Thanks</span></p>
    <p><span style="white-space: pre-wrap">Changqing
</span></p>
    <blockquote type="cite" cite="mid:D9DR2YV3L26S.29EB7OC0D9J5S@bootlin.com">
      <pre class="moz-quote-pre" wrap="">

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>

</pre>
    </blockquote>
  </body>
</html>

--------------VlTrISsevCk0PZeBSfuGKyAH--

