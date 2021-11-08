Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9077C433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 04:03:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.40650.1636344186951523953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 20:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=oWlMMG3S;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6946217091=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A83tPof021498
	for <openembedded-core@lists.openembedded.org>;
 Sun, 7 Nov 2021 20:03:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=VuidvhxY7Oj+MfcEJcy/gVTI2m31GSwRsvN4NAZV0BQ=;
 b=oWlMMG3SxuFm7XERyPJoEoOmA2FiLVs10G3QCyXeDbWVUfkN6pEyfYRAyFTC/3Qy42da
 oik/N+GPbRDHGkgL0xiFGabFIHqcqOBbqJfahhd/Yb/NSWLzFbTzW+c/99hv/3PZppa+
 QN06YHOoQFnCxJLx7XF2kTWf2bQ7nEB++StBNzrzNEYfKDxR9qUCGpEgbNP6ktz3oF1O
 LVDfakrMv0Ep5QVpHIyRVnUBlteN/SRazvjDirAOppyt7vkmBh9Y90zUj2Jx0B4kik4m
 MvIdKKhHSQZE4WuapJq03gU8xYcbbBROHnApknBSVyJMOSZaaREboXvxXUOC1f/Mjs76 Gw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c5n0614uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 20:03:06 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A841JC5005558
	for <openembedded-core@lists.openembedded.org>;
 Sun, 7 Nov 2021 20:03:05 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c5n0614ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Nov 2021 20:03:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDURWtwv5u9mTQaRtKWhBS/G94rDtWilyZVYRiZUCy+ra8f0OvoJEVjMZId5FWb2RgvDBN6+JPD9bpJWl/hnFfL9WhzBos8+UEpY/HU44CAfwJ/aDb1JkLWUeUpOER6SVeGQLUfdVIem5ivNPVuaF8CoLG9vr1kLlKfcBZUyWH/Dt3p7DURVDNAQNB/p9KlH6yZTLTidWYmntAeEK9FCtfK5Zj7+7vhUZqpgONTB6QaetmYHEpfOfX5jAgcQFjsAfKt5AR03iU1ChviZU7FUaJkPnmV9TyBBj73z5DhF6lBPRPGQCwKVMp7t6+RWHja3RWSaHmy22veU9ADC32Yq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuidvhxY7Oj+MfcEJcy/gVTI2m31GSwRsvN4NAZV0BQ=;
 b=TKcZGB8OHZBOH3zwD6SeOEN8gWMgMDc+PRdsgwFkLtXcE8SNXfjOOPNI9Ns97EllLHmNLICPgc943aTzdKiXfib+l0xLNmPbv2/jtRr0AH+tSwz1KtzrnbPW79biJyIF+iVLtG4EaldZnf2BAIH3s0Bi2DUmvltHiOL1UsnIpw0d4xDvf1BDeUj4xxtCADm3CQP/GTfoYGQ8plVlotdYRZHAH4ZJ8UNvjK6miTIiDO9MZF3X4eAu7980W59hD28xgVBF8xQIE7PHghiSgm7jscOGMdCB6RK9JJw17/HrRGDqfANTBj6JklQdLuyvcJWFCslUJ0djjdxYPGlaYOX/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3456.namprd11.prod.outlook.com (2603:10b6:805:c8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Mon, 8 Nov
 2021 04:03:02 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::61c0:c477:d993:1727]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::61c0:c477:d993:1727%4]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 04:03:02 +0000
Subject: Re: [OE-core] [V3][PATCH] ruby: workaround ptest hang problem
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20211105021848.6807-1-changqing.li@windriver.com>
 <69bc0138e89d4f77b6062e451dc6fd81e48becbc.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <f45b132a-b8c5-1d74-3008-dd79aa888153@windriver.com>
Date: Mon, 8 Nov 2021 12:02:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <69bc0138e89d4f77b6062e451dc6fd81e48becbc.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: SG2P153CA0039.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::8)
 To SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
MIME-Version: 1.0
Received: from [128.224.162.189] (60.247.85.82) by
 SG2P153CA0039.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::8) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.4 via Frontend
 Transport; Mon, 8 Nov 2021 04:03:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d88e918f-68d8-4f98-1f59-08d9a26ca8b0
X-MS-TrafficTypeDiagnostic: SN6PR11MB3456:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3456C3E3A819DB209395F46B82919@SN6PR11MB3456.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KmRSFRqjN5J0OcqJdEzC1B5fdWVcl2skc5KRY41lZ9eDwFkICvhOiXed5bySAPzuh6fYYnX6LVI5X3D527Rmd1BozqiVH0YI+Qj8nlN/agLIOAmV4hy64JsreRbAvaUTAhBH216CIeZYeidV0kiBaTZ5SAfxJCaJJCg/426T7cmAqOhH0uwwvRrsHehA9c0QktFh6GNHthr0PDdbbNO2VJAlU7feUefITZPuz65NQ8kLfGCOHM/ryf/ONAXEqthu6PiOIukV1TB2HtYgA1Rk82YI8WFWIFUPuqDgOZxfQXA2wToqS/NQcI7RIiksRoKWPge08Kmxo/WJnqWURe0XDeIz4i6XCWT9A3wGWJ7ovP1fXP4UkkGJbo3YeUtCJtD64QWmvJB+YVoPuLK1DftO+IT+oj68R4V7IUBdTHdyb41j9Z+FlaH7TkM3xyRSwxBc6iHH96rmPJN5LhuymON8D1v4py5cK6TTD49E5GcRvJwmXce36sbPlJ+U/ha5kAdYDtKVvCHwwHmpKfBLsGLJp7s4LyuBa0u9G1oHNroj1QOjbL6hZkBfXe5ZTQSCHwA0oK3ITwdPmbHPXZ0WZJcqHAJKXTmNHivkmwJM0o4D+B90JPTKn6NAVHXtA49vz4N6TKRnvZVl0ocLDelkSmf1HinchjYjiQmUQoEJtkxojfuJQFvUUQBITPI/UKo/6VQTUamrN42OsP70LMPaXTkNKi9CP7/tOYowEs6GrTOQjewoMf51FHljsZMqPoFtrQSsC4fhEcToz/F0nh40Ar7g2pp9hWVvrJ5CD92pvWRkZXo+Pps7TFSdK20d9TpQS79vtkMn2DqjO9cyKVnsa1pwyJDKOMINEgTJxVk0YnYCHY+SdgNGkcTK8HUmV5naQbjWgt+nR94ij98GLd1MZHClLNMFdC586a5TEeE9D4xa1A8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(316002)(2616005)(31686004)(16576012)(186003)(36756003)(8676002)(44832011)(956004)(53546011)(6706004)(508600001)(6666004)(6486002)(2906002)(83380400001)(31696002)(26005)(66476007)(38350700002)(66556008)(86362001)(38100700002)(966005)(5660300002)(8936002)(66946007)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cmZMRTgxS29uUFg4TVpyMHMrYUZuOFI3aDhlTG8xVlh0SXRpakFodElxV1hV?=
 =?utf-8?B?ak1BNjV1QTkyNVlubnJ3TS9uaHBPUCt4eU9IZFQ4QXVqcFZTdXVVbm1JK01m?=
 =?utf-8?B?TXRZZE9pLzNFeTNiYnVpUm55OVFpTFhxMlhlNE90WC9SQ2c3ZEJOT2d0bWQ5?=
 =?utf-8?B?R0VnVVdacmdNR2FyUlJ5SVlzcTlGblIvNUtoclhwTE5UMk5CYmsyN1NqYzUv?=
 =?utf-8?B?bVl1SFlPYWFhSzFDek9DQ3drNHdEbTdzZWtCK2NvNUkvUXVBUko5Q2ZvQkxn?=
 =?utf-8?B?YkNZczN5S1ZTSjJUZE9mZDAxVnY5dTFhMVJ1bTA0elhYRTdCRHhLNjlXTkFU?=
 =?utf-8?B?cFRpQlhBaHBmSVVSNlJHS29HNVM2dDlPUjREeWp0QkcwU1AzWWpZQVRYYVBl?=
 =?utf-8?B?elFMa3BnYlE1YmlyNk0ySXpQSkRJQU1STHN1M2x0QmowM3U3Qm5KS3pQd1R2?=
 =?utf-8?B?V1ZxclhrMjJTblFGOUh5dFNtUjBCaHRvZ1Y0WHUvNzFXRkFpK1pSbzRlVFVI?=
 =?utf-8?B?RndqSDM5TGJyTEtXYWdBaDVWV0xodGprbWZJUTI3R09jWnIzYjllVkEzaW4x?=
 =?utf-8?B?NlA4S0tQYVN6Z3lJZHA4WG5NVTFVQnBNWTY2Mm4yQ1lod21KeFFNUFZjVklG?=
 =?utf-8?B?b0d1ZFdxYjJ3WTlaZ2pKOFpVY3ZQd29HaXJvQTMzUkhKbmR6VGxGekE2YjBw?=
 =?utf-8?B?TGFMempLMTQ2OU9FTVV3aHg4VWxsOHI0MnY5L0tOb0taeVNtVE9CbVQ3NS9u?=
 =?utf-8?B?cGlJYU5ubzhPcjFYVyttMGhVMXNkS3NQVElqWWVsSWxBd3ZxSVJrUmZmRTYr?=
 =?utf-8?B?NEYxbGM4b2NHYlkyZUJGd290aDdqSnZLNkd1blc4VGJsNzhZMUhraVJjWU5Y?=
 =?utf-8?B?bnZFWmdGdW1Xcmc1QmVaTkNRcFp2UGc3MzRXdHJ4aGxveU1oeU00UWRMYVkz?=
 =?utf-8?B?OG1qMFJVOVUveHg2d2duNGJZZjdobWEwNVI4MzJiRVBFNVcxTTVvKy9yTVdB?=
 =?utf-8?B?eHJMam0rMXQ1Z1FDb2JTdlhUYlNiSGo4RGJpRmc2cmhhRnF3YmsxSjhzUkNR?=
 =?utf-8?B?dnhvc1I4a3h1RnU5aGVUUEhyVm9Oci9zT1NjVGlBWjFYTVkyVWtseXg3OTBY?=
 =?utf-8?B?QTlLak9JMXpqZTJINHNLZ1RTN0lWa3ovZHNld1VnN3pGbm5Ra1FJR2JmL3o4?=
 =?utf-8?B?bVVFMDROS2FOVTZOWFllMFMwSXk4SmZNWDZoamc4bHFtS2d1dlRJZGt0NDFv?=
 =?utf-8?B?anRoVGdFVDZTRDdnRXBPSDNSeXVESndKdW5FSTMyRWpEYXZjMElRVFZhbEoz?=
 =?utf-8?B?b2RDTHZWZnFubHVYd0ZDQmtKWk9kaDI2aHQyRDQ5OTNacU1aSjdyZGticEZQ?=
 =?utf-8?B?VE9jaC9hVUhPRFNSczFVa2tEUFprMnFtREc0Ui9JK1QzVURZTXcvOW5hWnhx?=
 =?utf-8?B?ZnhCN2xiYnBTdkJPelRQb0ZyTFBuTmdHaWE1WW5rMWo1cHdDeHYvTDBwdzRO?=
 =?utf-8?B?Q0F1VGgxYWpMdGppUnU3N1RzVzR3azZtQWNzOE54cmNvc0JHbENxcVgvZisr?=
 =?utf-8?B?ZUJhYnlXTFRiWWx4ZnJOQTYvajBrNjVRQWZhRFBtT29lUHRUOE5qdEdEUjlV?=
 =?utf-8?B?UHJOQzVKb0N6anhVY3BrUGRRU0JzdE0vN1Z3NUZ4QUdOb1l1OFZFbnkxa01K?=
 =?utf-8?B?UjQ5VUFNeXZTdU1ubHV5ZmdrVFI1ZUhNR1o1djE2RGRKRUpxN3dHZGhES01z?=
 =?utf-8?B?UVpIV1BkTEpjY1VpVHE1d25wWmZLeExxS2N6V2ViL21kTjNlY0o2bm5HN2dQ?=
 =?utf-8?B?RUYvQW5pUzM1c2JRTUtGVXdDbkV6TFNvd201VTk0aDhpSjJoREhFeXhNQ3RL?=
 =?utf-8?B?RDVOaHN1aGF2UlhZVVBwaThCVkZGUDVjVVhETzJvQStzd1Q2bU9wYTB2QTlx?=
 =?utf-8?B?ZThOOG85N3prMVhuZ2Z5Vis0bVMrb0huU0ZJYmwvNEVvYXNFeFFJQ2NRMWVU?=
 =?utf-8?B?SUZ5V3FHc2UxMWdsUnZwL1RBVUt0WG1UMXl5OUpiNmpOd21ac1hLMGpldkZX?=
 =?utf-8?B?OE5BVGFiMnlqNDVBdktUMkpQTVJ2bXBUbFNialFGZUdCTzJ4UmVkZjltK2Jq?=
 =?utf-8?B?OHdKV2NQN3FCSktkY1ozYlRQczhIVWZCRTNUa3Z6Nzdra0xIQ0xycDRzNXVC?=
 =?utf-8?B?TW05UFdscmhCRm5LWFhBeTViYXZjL2w5eSt6NUlyTDNweG5NVkpaTjZlTmQ4?=
 =?utf-8?B?WVY4RVlIbDhJc0RkRlFLMzlidmV3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d88e918f-68d8-4f98-1f59-08d9a26ca8b0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 04:03:02.3815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oo04LKssj+ZAcv+G5NwezjBtK95yJHIpGQHO/c1ViM4A5JJTQc92KrEbiIibQRFt5QlKcPb8WeyxWY3sch/25EJ8uF+6Z25A4vWItZgHT4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3456
X-Proofpoint-ORIG-GUID: MsiW4Nrv69pVar3pnnbCafIjcEszFT7E
X-Proofpoint-GUID: 5eYKSLTareRwL9PEGvvO2dkIHgGk26M0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_01,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080026
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1A83tPof021498
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 04:03:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157962


On 11/6/21 5:27 PM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Fri, 2021-11-05 at 10:18 +0800, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> since openssl 3 not compatible problem, ruby have disable openssl
>> extention. But disable openssl extention make test_smtp.rs hang at
>> test case "test_start".
>>
>> Net::TestSMTP#test_start:
>> NameError: uninitialized constant Net::SMTP::OpenSSL
>> Did you mean? Open3
>> /usr/lib64/ruby/3.0.0/net/smtp.rb:195:in `default_ssl_context'
>> /usr/lib64/ruby/3.0.0/net/smtp.rb:552:in `start'
>> /usr/lib64/ruby/3.0.0/net/smtp.rb:475:in `start'
>> /usr/lib64/ruby/ptest/test/net/smtp/test_smtp.rb:199:in `test_start'
>>
>> temporarily remove the hang case to make other testcases can be run.
>>
>> Meantime, move ruby-ptest out of the PTESTS_PROBLEMS list.
>> On 48 core host, run ruby ptest in qemux86-64:
>> root@qemux86-64:/usr/lib64/ruby/ptest# time ./run-ptest
>> PASS: test/test_set.rb
>> PASS: test/stringio/test_stringio.rb
>> ...
>> PASS: test/did_you_mean/test_tree_spell_checker.rb
>> PASS: test/test_mutex_m.rb
>>
>> real  5m42.872s
>> user  3m50.923s
>> sys   0m44.136s
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/conf/distro/include/ptest-packagelists.inc | 3 +--
>>   meta/recipes-devtools/ruby/ruby.inc             | 4 ++++
>>   2 files changed, 5 insertions(+), 2 deletions(-)
> Unfortunately the success rate isn't like that when we tried this on th=
e
> autobuilder, it failed on both arm64 and x86_64 with multiple failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2791
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2507

Sorry,=C2=A0 I thought this is expected.=C2=A0 Ruby have 800+ test cases,=
 and=20
failed about

30+ all the time.=C2=A0 so I think we still need to put ruby ptest in the=
=C2=A0=20
PTESTS_PROBLEMS list until

we address all the failed cases.

>
>
> Cheers,
>
> Richard
>

