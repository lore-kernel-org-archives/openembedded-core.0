Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FD3C47DAF
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 22:21:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7156.1705616479755069204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 14:21:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AecDCwfe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=174791ccb8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40IAc7Nm022126
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 14:21:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:references:to:from
	:in-reply-to:mime-version; s=PPS06212021; bh=IHPEcZU1MOJUnoOOroh
	jGgbMvX1e9dfcLSnWYqIl0O0=; b=AecDCwfeU61rwSjsg+0p0dAlO6mKzdbhwej
	iXkHLqH4PUPVzmPLfewBZoJOieFUq8PzltCyEk6YZ7zA2XyrKDXUhA9MJYNF6UWG
	ouMFA6C6IwmM7ikQOvt8FUN+nhkU8uzdaxKkewc79qiV8uNDvCaMOz4y2VB1IQGe
	Y7cnGnY0sNooYf36VOXNiWyYgrZW7W/TW8z2ts1dr/c6uEiSc3TfWDW/IQBmtWSq
	MXupOydKAvNyQP3IxUCzw4CgrKkuV7o1IJ6+my2HXrSYUu4RfyalXkiULF9/TvNN
	DhKIjwmfXCeeVtDW5UkU1Jy6XWmJ3c90W2MqmuPBynHLrvDdDXw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp464gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 14:21:19 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40IMLId5015179;
	Thu, 18 Jan 2024 14:21:18 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp464g6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 14:21:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACN8NDgx6Le89pnYPQ9PxZidMC3VtlTuBvB9Lu9FMvcC6LN5AZJeGjT70ydpHTuxPRqrKOppjaUJLaRSmwZn1dxuvZJ1GF60eps6gF5QtSPS8u5ecLZn91uap21Co+c01SuSJCktAnE5rtHCp6QkkYtvP+D5FEh15EQQ2qyhU0byFDdltehF3WvwqqN51XlSxtFY/0+hu1YsGDAZJOMMRfDvYOICbvuXG5lb0WbpGCXNdQrvKhY4n3TDpasI0GmWYMzNV/j0RJayrJ2a4IlpLcaclPVeiQRjEp/WMXc9D6SCon+WidBJw+z5ND707U7f8J6iMvK0HN0+x75Svz9KeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHPEcZU1MOJUnoOOrohjGgbMvX1e9dfcLSnWYqIl0O0=;
 b=lx9gDL/fDAG2Hpq8RA486pvO90dSrNh505W3XT1ovQIooi7CcODXdceZe577A3jaXeCpFPz+2UUwMABDgUXmwQi6/53Rg1UN1QnvOxtz0L87+6SdTDlv1Fn7viYhLOkqaduD3LTOlo2NMie6dy2xKVrKyK2iQXI4iOtX6kNuhzM7zM5ximnaprTG3cYJGZ/5v+cxBpb/wfPt8izfW3sFIrl17b/b6ZDIX6Xi4JDHz5R1hycuHmM054/3dDH99724dIxASjb9Ebdeqbmpj6lYeyzdiXeW3md7IOmkZCEYAKBdX0v7URpmuaASxGYRWr4obhVDfnVeGnHSSCAGBJxOcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 22:21:13 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7181.026; Thu, 18 Jan 2024
 22:21:13 +0000
Content-Type: multipart/mixed; boundary="------------HOQq3J31LZWJzjEipYYAHGEv"
Message-ID: <46f26c82-6ff5-4b62-a4b0-c190ad8f34a2@windriver.com>
Date: Thu, 18 Jan 2024 17:21:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Fwd: Patchtest results for [OE-core][kirkstone][PATCH 1/1] tiff: fix
 CVE-2023-6228
References: <0101018d1c3d1efe-c3d3daa9-36b9-4ac0-bd6c-2d04c8750cda-000000@us-west-2.amazonses.com>
Content-Language: en-CA
To: Yogita Urade <Yogita.Urade@windriver.com>,
        "steve@sakoman.com" <steve@sakoman.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <0101018d1c3d1efe-c3d3daa9-36b9-4ac0-bd6c-2d04c8750cda-000000@us-west-2.amazonses.com>
X-Forwarded-Message-Id: <0101018d1c3d1efe-c3d3daa9-36b9-4ac0-bd6c-2d04c8750cda-000000@us-west-2.amazonses.com>
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 31110430-ebfd-46d6-550c-08dc1873c7b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h7Fsgd2ziL21BkzTXSXSs7Ix+AI0xJ884ktbPbesqklQEyvlAzgq3YySQozqA0yhY33u+AqE7d6boB4/UsS0xIYe0S/N1CIryhVlNu3tg4TS0yC6Rn6H8ES/jj1OkwK9LWjHPNXFaPTpIKVWPnFYIfgCs5BGjeI+jFEdrG8w4PvYCmmAjmYy9je6z4bagx8MC2X1XXmDXOXPh4c3RZMar+1LpiBvQHdgjXltl5P62TvNT2ZVp6sFmZ5E0oHpOeP2n0kmH3CnL8xIg8hvmMjqfT1zXAPXJa8WgA+tx7B80lWIJdRHXveovI/HnV+ASLwZKw0shE0rE5v1Xqsn4EiqxsIlrhb9P1MH+uAsjYfOW9axmxn0A8v/bINacgiLnWc54BQ5nsfryfLZdlfWVi/BUcHOKTc0dlSpLBld9vxCNYsGisZ09OiLnnCREAIAuOk7X8AacyJG/y2GcHVmG/RpVJB6GyBfuqRtK1KezFsck6e9NziVALs0+UiigNwVUwFIIstfKoWjx6DPoI98TJhOV9FrKjnP4Ab013y534509xENhQ7/cONL+S6cTqI3SzqW4BIG3I2axoR3jkQoJv/35vwEvcPHGJ2oESe921j/osxHNMTCMl8IEOtYDJ6LDf5oiSvHG68i0DXmIJsSxHtDAiTH8HfL2Na879TMu754l2KlYd4m02/3o6VhdJ5qjpf5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39850400004)(376002)(366004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(451199024)(1800799012)(31686004)(41300700001)(26005)(6512007)(83380400001)(2616005)(86362001)(31696002)(36756003)(166002)(8676002)(8936002)(110136005)(5660300002)(235185007)(6506007)(33964004)(38100700002)(66556008)(66946007)(316002)(66476007)(2906002)(6486002)(966005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXZITTRKcmpTcnh2TnliVWhyRzVVeGEwT2duSXNmNm93U0Q1bWxEaGNlVnY1?=
 =?utf-8?B?MVpncW9mWUQwek9lNFhrb3BNWFVzdGJLejgwckJOemJTaGhXTks5dmtGa1ha?=
 =?utf-8?B?a2tlbGJWR2FXNGQwMzkwK0tjNUtabmRWWlZrb2QyOVZEQTMvQTVaeEgrMGVU?=
 =?utf-8?B?YVB2c2UvWndWQ0ZHOG1IRmkwR1lUbWpqL1M4RVRnQUlCckF6WWpnWnJlTlpX?=
 =?utf-8?B?NTlWeEJjNGZicThvbEg3cWMxV1MvOFBOVG9uNDEyQ004Y2NNNjZvOTRuTnc3?=
 =?utf-8?B?ejhEWllwd3ZuOHJLSnBsWHNiUDBsbUVMNy9CSXFFeDhhVzBRcE04akZlUDZr?=
 =?utf-8?B?TWdvSVZ4aEVwWUxTdUM3eG1LZzdUcytEYnFjbmlVK1FzL3Y3Rjd6ZkFlSTQ4?=
 =?utf-8?B?UzQweDZILzdBN1E5dHh3b2d0QUl3WWlpV1B2RlZhWWtHMmh1WnB3SFhRdDQ3?=
 =?utf-8?B?TFd3Vk9YNzFLWmlZeVJwRHpEL2oxYWVuYWhJVTVqYWpGN1p4cUFNUWFxOUF6?=
 =?utf-8?B?ZFJyVHlUVTdGei9IOXl3TjZyeVh4OW02SEZQTGJnUVhvWGJRWXpTZVk3VjRk?=
 =?utf-8?B?N2NZWkFoVUZ3djlmMEdQMzFnSi9sazlnVGdHU2QvQ3d6RjNlUUF6RnFSMkFL?=
 =?utf-8?B?YkFOMStmWVFNQk51MUcxY2JpWHR2WEF3dEV5VStPUGlIYmlSZGxjZ2FJMnJH?=
 =?utf-8?B?MjR0TkZ3OFExd2lXNGM0WUdIekNsSTBYZDZ4THYvblJGcWVWRElRcmwxSWVY?=
 =?utf-8?B?Q2FUaHIydC95dWFWYkhudGZBcFA0Wk5JTndkS0RTbHVESnZYdDJ5YTcvcXdm?=
 =?utf-8?B?K1N4aWJGRzJjUTVyc3dhTktZOFlJL05qdVI1Z3dwUGc1U2pHYnFTc0hqMDBv?=
 =?utf-8?B?Q1lTMW4wRjZsVnNPVWI0NTB4UndUclRseW8xRStoK1VxL296b3JsbHlFdENU?=
 =?utf-8?B?c1k4V0FEZFRMeTBWa2FtQ0h0Nk5MclNJNHlDYWUwTEZSK0lJRnRYSHdsZzlv?=
 =?utf-8?B?ZFJvSm8weDRiWW0wRFljTVJEVkRyTlRSQVhTSGpzenpMaTZWd282Y21XdFZz?=
 =?utf-8?B?SVB0SklNMXRlVmx3QXBiSk5ZSmxiK1E0UllzMXlVc2lOUm1DTlUrZllRKzRl?=
 =?utf-8?B?NG41eVEzeWE4RTBheXRIVXpXTmpEN0dUa1ViWTdQUTVLbHZ5c2lJQWV1cUtn?=
 =?utf-8?B?RDR6VWZRZEpsenU2TG1pVUpyVkE3Q252dnB1ZGd0RGVXd1Z2d05ySGl5amQy?=
 =?utf-8?B?S0xuQTZYcVVQR1k2R0UxalBVU09veVJkMXlQRDNaM0x2RVhOazR2Qm1Qdnhp?=
 =?utf-8?B?QWpGVm1DUElvblRmbzFZUDdOVGh0QVB4c0loOVhvUGpQck5qTEhrdk9vS1JM?=
 =?utf-8?B?Z2xiNEx3SGdsYk9UaHFJN0U5WHdQNVY0QitUVmRDOXptM3JpSUJ5NkhOVGJr?=
 =?utf-8?B?TVFsdVVxSjEwU3pCL0R2SklKUk9WWVVlOUNHKzNYbGgydXBodGcrWmVrVUhu?=
 =?utf-8?B?SzJ2Vm0yaHAwVSt4bmkzZnM0RTdCTkd2ak9CTzIrc0ZmRDZ2ZEE4eGEzMXhl?=
 =?utf-8?B?NURpUXdtSU1XZUMrUHFzLzM3K0tzY21Qc3lXM3JsWWY5b0crbGJHU21jOCtu?=
 =?utf-8?B?Y29WaUhUcXdacUFMNXZBbzgvWkpUeFlEZEl2TEk2U2ZhUFZIWnRxTVg1eU82?=
 =?utf-8?B?bjg0Tis4MGdIa05PNWFxdzBFL3lqQjE2ajBmWHZUQmNDRW5jMllnbFVLVVBC?=
 =?utf-8?B?d2tLM1BGaTJkdkgwbXZZUVV2elBVdERkOFQ1Y1pvVXM1aFF0K29ML2ppUldJ?=
 =?utf-8?B?ZHZZUFFXS0NENlhvcVNQQ2ZFV1RmQm56UmJIYklDUHV2dGQ3b25MeFZYNC9G?=
 =?utf-8?B?ZUxnZVpCdWp0ZjVkZUw3YlVWL2NubGpVVE5SSTBPR2EvM0MvV1h2NEZwWkp4?=
 =?utf-8?B?MkdkMW5lbFVBWXBzbHhIMmtaSjZ0ZlEvN3orTEtFNFdxZFJDZ3NlY21hODNl?=
 =?utf-8?B?U1Rxa2lwTzBTOFRTRk80M0xBSk44Nlozc3EvSUpDUUFCN2tVNDQzZVJJWVkw?=
 =?utf-8?B?YUtBZHVoYm9lQVdQVnluRWR6OGhiOEQ1bitwWUdlc3VSMWs1YkdGUVJvVnVQ?=
 =?utf-8?B?VnYwMmhKb2hSL0c2VU16ZW5PcWpRRGxpS2xBSWxtV2ZzaFlFaWtYZ3F2Vm1I?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31110430-ebfd-46d6-550c-08dc1873c7b8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 22:21:13.1971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8VD62hCbAckpEApf2+pkyTmxFAMBypaoeld2dbbClohHFJkgxp74HOff0IYRtuj0FbzSVdA6qremH0wBDNEYN3ExZSJ24Qxxv69suBqMF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
X-Proofpoint-GUID: TZYUUqnEX_3tZA7sRCDKCRw_7dVDR21N
X-Proofpoint-ORIG-GUID: mNbP-SZie85tYPkX09yzODavrWg957TD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_10,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401180152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 22:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193999

--------------HOQq3J31LZWJzjEipYYAHGEv
Content-Type: multipart/alternative;
 boundary="------------8fsEO6JChK3DrxFpiZGy6uro"

--------------8fsEO6JChK3DrxFpiZGy6uro
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Yogita,

Pleae tell people if you will send a v2 or if you plan to fix the 
warning in a follow-up commit.

I don't see your commit in Steve's kirkstone-nut repo so I think he's 
expecting a v2.

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

../Randy

-------- Forwarded Message --------
Subject: 	Patchtest results for [OE-core][kirkstone][PATCH 1/1] tiff: 
fix CVE-2023-6228
Date: 	Thu, 18 Jan 2024 11:03:04 +0000
From: 	Patchtest via lists.openembedded.org 
<patchtest=automation.yoctoproject.org@lists.openembedded.org>
Reply-To: 	patchtest@automation.yoctoproject.org
To: 	yurade <yogita.urade@windriver.com>
CC: 	openembedded-core@lists.openembedded.org



Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch 
/home/patchtest/share/mboxes/kirkstone-1-1-tiff-fix-CVE-2023-6228.patch

FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and should 
be replaced by CVE_STATUS (test_metadata.TestMetadata.test_cve_check_ignore)

PASS: pretest src uri left files 
(test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence 
(test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence 
(test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence 
(test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence 
(test_mbox.TestMbox.test_commit_message_presence)
PASS: test lic files chksum modified not mentioned 
(test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files 
(test_metadata.TestMetadata.test_src_uri_left_files)

SKIP: pretest pylint: No python related patches, skipping test 
(test_python_pylint.PyLint.pretest_pylint)
SKIP: test bugzilla entry format: No bug ID found 
(test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test 
(test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test 
(test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test 
(test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now 
(test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test summary presence: No added recipes, skipping test 
(test_metadata.TestMetadata.test_summary_presence)
SKIP: test target mailing list: Series merged, no reason to check other 
mailing lists (test_mbox.TestMbox.test_target_mailing_list)

---

Please address the issues identified and
submit a new revision of the patch, or alternatively, reply to this
email with an explanation of why the patch should be accepted. If you
believe these results are due to an error in patchtest, please submit a
bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
under 'Yocto Project Subprojects'). For more information on specific
failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
you!

--------------8fsEO6JChK3DrxFpiZGy6uro
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Yogita,<br>
    </p>
    <div class="moz-forward-container">Pleae tell people if you will
      send a v2 or if you plan to fix the warning in a follow-up commit.</div>
    <div class="moz-forward-container"><br>
    </div>
    <div class="moz-forward-container">I don't see your commit in
      Steve's kirkstone-nut repo so I think he's expecting a v2.</div>
    <div class="moz-forward-container"><br>
    </div>
    <div class="moz-forward-container"><a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut">https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut</a><br>
    </div>
    <div class="moz-forward-container"><br>
    </div>
    <div class="moz-forward-container">../Randy<br>
    </div>
    <div class="moz-forward-container"><br>
      -------- Forwarded Message --------
      <table class="moz-email-headers-table" cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Subject:
            </th>
            <td>Patchtest results for [OE-core][kirkstone][PATCH 1/1]
              tiff: fix CVE-2023-6228</td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Date: </th>
            <td>Thu, 18 Jan 2024 11:03:04 +0000</td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">From: </th>
            <td>Patchtest via lists.openembedded.org
              <a class="moz-txt-link-rfc2396E" href="mailto:patchtest=automation.yoctoproject.org@lists.openembedded.org">&lt;patchtest=automation.yoctoproject.org@lists.openembedded.org&gt;</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Reply-To:
            </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:patchtest@automation.yoctoproject.org">patchtest@automation.yoctoproject.org</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">To: </th>
            <td>yurade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">CC: </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      Thank you for your submission. Patchtest identified one<br>
      or more issues with the patch. Please see the log below for<br>
      more information:<br>
      <br>
      ---<br>
      Testing patch
      /home/patchtest/share/mboxes/kirkstone-1-1-tiff-fix-CVE-2023-6228.patch<br>
      <br>
      FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and
      should be replaced by CVE_STATUS
      (test_metadata.TestMetadata.test_cve_check_ignore)<br>
      <br>
      PASS: pretest src uri left files
      (test_metadata.TestMetadata.pretest_src_uri_left_files)<br>
      PASS: test CVE tag format
      (test_patch.TestPatch.test_cve_tag_format)<br>
      PASS: test Signed-off-by presence
      (test_mbox.TestMbox.test_signed_off_by_presence)<br>
      PASS: test Signed-off-by presence
      (test_patch.TestPatch.test_signed_off_by_presence)<br>
      PASS: test Upstream-Status presence
      (test_patch.TestPatch.test_upstream_status_presence_format)<br>
      PASS: test author valid (test_mbox.TestMbox.test_author_valid)<br>
      PASS: test commit message presence
      (test_mbox.TestMbox.test_commit_message_presence)<br>
      PASS: test lic files chksum modified not mentioned
(test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)<br>
      PASS: test max line length
      (test_metadata.TestMetadata.test_max_line_length)<br>
      PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)<br>
      PASS: test non-AUH upgrade
      (test_mbox.TestMbox.test_non_auh_upgrade)<br>
      PASS: test shortlog format
      (test_mbox.TestMbox.test_shortlog_format)<br>
      PASS: test shortlog length
      (test_mbox.TestMbox.test_shortlog_length)<br>
      PASS: test src uri left files
      (test_metadata.TestMetadata.test_src_uri_left_files)<br>
      <br>
      SKIP: pretest pylint: No python related patches, skipping test
      (test_python_pylint.PyLint.pretest_pylint)<br>
      SKIP: test bugzilla entry format: No bug ID found
      (test_mbox.TestMbox.test_bugzilla_entry_format)<br>
      SKIP: test lic files chksum presence: No added recipes, skipping
      test (test_metadata.TestMetadata.test_lic_files_chksum_presence)<br>
      SKIP: test license presence: No added recipes, skipping test
      (test_metadata.TestMetadata.test_license_presence)<br>
      SKIP: test pylint: No python related patches, skipping test
      (test_python_pylint.PyLint.test_pylint)<br>
      SKIP: test series merge on head: Merge test is disabled for now
      (test_mbox.TestMbox.test_series_merge_on_head)<br>
      SKIP: test summary presence: No added recipes, skipping test
      (test_metadata.TestMetadata.test_summary_presence)<br>
      SKIP: test target mailing list: Series merged, no reason to check
      other mailing lists (test_mbox.TestMbox.test_target_mailing_list)<br>
      <br>
      ---<br>
      <br>
      Please address the issues identified and<br>
      submit a new revision of the patch, or alternatively, reply to
      this<br>
      email with an explanation of why the patch should be accepted. If
      you<br>
      believe these results are due to an error in patchtest, please
      submit a<br>
      bug at <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/">https://bugzilla.yoctoproject.org/</a> (use the 'Patchtest'
      category<br>
      under 'Yocto Project Subprojects'). For more information on
      specific<br>
      failures, see: <a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/Patchtest">https://wiki.yoctoproject.org/wiki/Patchtest</a>. Thank<br>
      you!<br>
      <br>
    </div>
  </body>
</html>

--------------8fsEO6JChK3DrxFpiZGy6uro--

--------------HOQq3J31LZWJzjEipYYAHGEv
Content-Type: text/plain; charset=UTF-8; name="Attached Message Part"
Content-Disposition: attachment; filename="Attached Message Part"
Content-Transfer-Encoding: base64

Ci09LT0tPS09LT0tPS09LT0tPS09LT0tCkxpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMg
c2VudCB0byB0aGlzIGdyb3VwLgpWaWV3L1JlcGx5IE9ubGluZSAoIzE5Mzk3NSk6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTkzOTc1
Ck11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMzgw
NTg1MS8zNjE2NzY1Ckdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnClVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcmFuZHkubWFjbGVvZEB3aW5kcml2ZXIuY29t
XQotPS09LT0tPS09LT0tPS09LT0tPS09LQoKCg==

--------------HOQq3J31LZWJzjEipYYAHGEv--

