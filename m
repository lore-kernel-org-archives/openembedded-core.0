Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F19C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 07:55:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.64046.1701676533603827783
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 23:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rg6RhVFG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07024b9cb0=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B47QNkS002050
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Dec 2023 07:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=8T7b0TGCpMGPxQWYNb5fWsc/GHhPpZz0pHRukjfhios=; b=
	Rg6RhVFGAxobFj6YWh7NksqC9YWMLUCH0XVSNOcPuxzzBbxCbN4CLLLFtZFznUuX
	fOSz8wKi0U1voH3zL5f2cD8dhPLGR9mCtsbiAkASiXsZKJ+IjknHDTKbVRazI0gL
	WGYz2wSGTmDiHPpvN1ptGS4T3lMJ3FVu2KNSh1n90L85/jFsGhyLsFTGXLludq7f
	We9iX3sxKfkUPN1cHd/fbr7qfCCWS2YZB3yjf92R+MFmNErXFHE4OwbyWveg8NOT
	dlSwaISM8+wdftVw8ghjRZNge9QbP4ti154O8UKbvdhaCG9lDzlRWcBhFvKmCPyM
	D2A5uIxREe4IYvJIGFZ8mg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3us4d5g8jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:55:32 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B47tVwD001451;
	Mon, 4 Dec 2023 07:55:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3us4d5g8jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 07:55:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjxD83uA8WUGz2y6s0rjY5YGnADOosKTcpIDCn+S2pmM5kela9b3xkNPpShAh6+HaJK0Qv8nJ/eIQ3rgOj90QLwrS7h+aL6ZuFMd/zSI4MIJNlCMx+t/hRr2GehHKoOB9KVDcaqhBP3WDXnnBjMXd5Hixji1+2bzMK1mJsvAsy2C1/9h8uVoqyFARPBi9oc9tiAYLKSX2dUo9n2i8JH0F/YJHV37eNp/Lgk/m8Z/J3xL350AGvXveNwT8cI7LyuKBGVTSS+jDT4eanwF90svjKqD3QQ3blLv4ysOfx0MDWDulSpQA27nraKxzjOeSonMO22sBUZmFgrENNgIczlVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T7b0TGCpMGPxQWYNb5fWsc/GHhPpZz0pHRukjfhios=;
 b=ZvsbcR3blT/0ra0AwgNVkZRNWvaNpktTnuYvSEzcE++0NRN3Sm1lG8GgvVYb4+flja+C1Sd+DJJazxVaxAa/LNITQX/VEwC5vzJX3TIxcUGcK2X7VUGLfxopdZNOuusRO+N+nK2DCOCq+8B6wpLmHcHWGwu0fx3L37xeXM5+DDsDpbLa07Jra/xR/kE7wqHMeMmp+EJJWNr4OcSujtknwO3I5cgXt4wX+ZMHXl6CXMZJl4/eA2Ht1HKdgf+wfwslMOD4gNOzJQgsrcY5DG/SHaCKm+MUVV0bR1CFz1Ld2n3E94z+RrEGq3wVEW5P55E5+4kXxMojfVMh1VKEYSGF0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by PH0PR11MB5806.namprd11.prod.outlook.com (2603:10b6:510:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 07:55:13 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7%7]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 07:55:13 +0000
Message-ID: <fd932bd5-3aae-43ff-adcf-4f98d03276cc@windriver.com>
Date: Mon, 4 Dec 2023 15:55:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] gnu-config: Update to latest revision
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1701157879.git.liezhi.yang@windriver.com>
 <7701bc572c2df6c9fb52f2a699b48b3afbafd343.1701157879.git.liezhi.yang@windriver.com>
 <202312010816005c17f058@mail.local>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <202312010816005c17f058@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0360.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::6) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2789:EE_|PH0PR11MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b4dba8-38da-4e28-7ddb-08dbf49e5852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GD/MaH4WHItOith/eDB7fFnY8y0JDpENgVHNyt9kSF+u9yA8OqdqB/4KAMGMFdE/MTcvFl7QTbk5xynjeWgqw5aIPArglumIQK1+oy8kKZBcknx/TFcmM7v53s5IjBsUPsODZHTqe+sApENHsvUK3SNS2iLmYbVk1tQTblH9NbqwvrkEhc72iRPeC+fHFDMIm1tYg7ETAlWoO2pNxmPqjN7Eluf7ZdY4FzoXKyFjnRO41n69ImYuMKnACy/13MoOb7z185YJ0+trHqb9U745lz07YdA1GHnCzrtuqshnxwKfeN04447psI7VzFICL9DfSBMuT1rjCne6YZBuMFDMUJbHX2yOW8rdDOTrk8qwEXKK12x3efPzvqQOkTpkViOleBU7mEIQpPEsOA8I0Jc3vpSIQUdLQrujO3CrNE2kpqhYwqHq+X/zMeDNMqNxx9yNdscBhVd6KEZCAMx3c28W5rtwBCgd6FeYDvupHl8UK/Biu8Befo0pspm4fPFZIq4mIpJNvkOCd/7w1pYlWo1aAyD4uhNCDDr77gikeUvAcWXo2Sqhs2SYApTJGj7+Fvca4l4rJU/C3WXXf76Lkps8INT1TxeyEFz4pyjNwGJP91ghcMf1n4tzit+o6oCANI9bKzybn+g5ivDCBRzGhXUVGY502n4z2e48EwJIbfn7CFChFjvjgt8VNq6RI7mvAdd/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39840400004)(366004)(136003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(316002)(66899024)(6666004)(66946007)(66476007)(66556008)(6916009)(966005)(6486002)(478600001)(15650500001)(5660300002)(41300700001)(36756003)(2906002)(31696002)(8676002)(8936002)(4326008)(86362001)(2616005)(83380400001)(31686004)(26005)(53546011)(6512007)(6506007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVNkYW1wVVhabitKRHNUQ2dKdDl0YVh3eXZGU3d4NzlzSHYzMDJ0dEZ5akNI?=
 =?utf-8?B?N2RmWFk1VUZGNmszcUh0ZWJ5NnZ6T2lXdysxRUtVWGNKWmFGTndTcCtFcjhq?=
 =?utf-8?B?NE5FVnEwS2liUzgxbmhZam54VTBWNXhjWHZoZ3RyTi9Fem1uMkZKR2tMQVNk?=
 =?utf-8?B?OXJZTVppTnBWeVpMR2Yxd1JqV1BsQWtJem0wVi95dytmNHlrVlJyMjBZcDNS?=
 =?utf-8?B?TFQ5WEdad0hKb0RiYzYzUW9oVnZxck9zZENNNHhUT1Y2SXpjTWFWZms0SVNx?=
 =?utf-8?B?R2w4NkU3WUdWTmQ2TUk2N0U0cWhNK1pEYzFUQVJXS1NiU2Z6UnNkUjZBMnlP?=
 =?utf-8?B?R290dXhzZWJkL0VUOWVyUjZKenRHcjE4aEV6V1NzUHFVUnQwWmdBOFlTWGRV?=
 =?utf-8?B?TDhRNHdnWWk2RkJPanMwZkJYaTdFcTl6dzRDaUM5T1FWUUIxa0Nua0lLOGli?=
 =?utf-8?B?U2VnSU5QbkhjTCtwc25DQ2s5TFBFbnVueWcxRlloQW1uZExvUGRTU2MwUktE?=
 =?utf-8?B?YjdINS95ejRrRktmdmdYdzA4VGoxYjNYSFVLUWhKR0QvUXZYWWV2eXhLakFF?=
 =?utf-8?B?Sjg2SG1WQ0lIVmVGWXR1d1huZm1rSW0vMFNXVDRDb1BDc2lhVmw3aUduU0pw?=
 =?utf-8?B?V0lsRVZZRk9mdm9zV2ZMVnQvUXhmQjNOcHNOYUhESUU4SjNaaFNrTUJSUWsw?=
 =?utf-8?B?VStpMXByMzhiZWd1VzAvMDlnQk9FTDVyMkJ0Y3FaUlJnWGFNZ3JIcnhmYTVH?=
 =?utf-8?B?WExtTzJrcHh2dTZPNjdMUi8yV0doeXZPRms0Q0dLMnRVVzJ5djNFUUhXZGZ3?=
 =?utf-8?B?N3BSQVNoTkhEek0wRS91MlVweldpbFpwa1YxdVFoN2JJaG1iTGhDWHBwZXZY?=
 =?utf-8?B?Q2UrZUp5eUFzMTc2VWwzZWR3MDBGR3czMVhZUzFNYzV6VGkxRElSbll5MTQ3?=
 =?utf-8?B?bTBNbFB4SThuek14SHhBV1ZGNkJFNzJubjIxOFcwblozemVPK2h0dmRBaGY4?=
 =?utf-8?B?c2U0eXF4UlBJa0dvb1l4aVhpRlVhWGdKUTlRWG5MeGZ5Q3BrOFZJdDhqK1Jz?=
 =?utf-8?B?ZEs0Y2lLRUpxOHFQUlJQV0NBVUliYURyd2NOVnNnbi9EMVE2L1FFVExOeGpE?=
 =?utf-8?B?SVIvQjZ3eFZjM1dLc1owVVhDeXlGdTFCbDI5ZlhXeGdqMkpYYWorTDJKcHBM?=
 =?utf-8?B?Wm9DNGhBS3BCMW5ZdzlISWx6NXp4VDNHQU5sR1NCaW9PZStubzJtVzliYU1q?=
 =?utf-8?B?RlVwU3hhV3JLVGp2KzJqUWkvby9CbnByUWRkSGx0RHpUYmdySTlRbkdBVzFr?=
 =?utf-8?B?WXRzM2trcEo4UDkveVltNXRXcm9SRmZSZlI5bTlLYnBEQnpxMzBVc0w0bTdW?=
 =?utf-8?B?eHBSZ2FBdGFsc0lsZzk1SHlSSEYxQTBwSFhtQ1VMa0R1MVpyMEZsQ0crNGJT?=
 =?utf-8?B?V2ZsSVgxbWJLQlpFSUlQVmZPT2tyMjBocHQ4ZlZUcFg1UW53VmRwRlloMFps?=
 =?utf-8?B?MTQzR3cweUx0UDZUT3dNNEc4K3prVVI0bzkrQ0ZoQnlpWjd1OGNCN2d1WC9o?=
 =?utf-8?B?amo2U2cyQXJJamd3ZkJDTThGUEpkcTJreFZZSGxSelVlVXY1MENlb0JoTmg2?=
 =?utf-8?B?YzRlbkFFdnZhQnl5N3FKZmpEWmJQZ0IxYmJjWWRFVEpmNGRpc3hWS3ZXRnV1?=
 =?utf-8?B?cTdPWm5lUG5rU3kxV1hlSURGQVo5bS9ETFQvbUNsVUhuWUYwU1ZBWlYxb0NU?=
 =?utf-8?B?cm92QWV2WHo3bkJDdVliU1BqbVBqKzZZeXpUbWoycEdYVFg2Umh5aEVlSWJF?=
 =?utf-8?B?eDZ0RFRZZGlJd1Z4ay9UeWUyemR3VG1Vc0xaYzZocVNRVkE2bWtnb2xGUFVt?=
 =?utf-8?B?c0szdGlCaTBEaTdVYWIxTzdDVEhUVnE3MUQvZDZCVWNwUG5US0Y3eEgxVnR4?=
 =?utf-8?B?c3JzSlRabFpKc2RNd2NEcU53UmlFdHp2WmlMQWc5aXJnZHVnUWZVTlhKNUlF?=
 =?utf-8?B?TndMeGpmSGtBeGk0NzB5bzd1Y2U5SmdIQ1pzSTFkVDQvWDFqellLWUp6U3g0?=
 =?utf-8?B?QUoxczRzRGE4NHVZMHZBRG9UUlo2Sk9jYnhWTTcyMTVNaFpIdkJQVnJMMUxa?=
 =?utf-8?B?U0d6b0Z6bHFhQ3cvcEF1T3ZjMTFBdFRzQm9rTlVCVmZsTmJYNENxSXI5UE1u?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b4dba8-38da-4e28-7ddb-08dbf49e5852
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:55:12.9020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPU6d1jPusFffG7noS5jNANjPyCi8hN+3s4SSRqk7nru7fd9f5S9XSMDQcx8E/LzjtB5VgKBmOdGFQ9czMYDBa9bK44v9TUvBeYv256wi4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5806
X-Proofpoint-ORIG-GUID: 1GOWBriEDrelzkdkchcusnlG7LTsX4Tp
X-Proofpoint-GUID: YeWmobWpnxlmJQtxU0WoryCzEvS_kWvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312040058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191725



On 12/1/23 4:16 PM, Alexandre Belloni wrote:
> Please follow https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity

Thanks, fixed.

// Robert

> 
> On 27/11/2023 23:55:06-0800, Robert Yang via lists.openembedded.org wrote:
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
>> index 2a0e6f8e41..718f798a00 100644
>> --- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
>> +++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
>> @@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
>>   
>>   INHIBIT_DEFAULT_DEPS = "1"
>>   
>> -SRCREV = "63acb96f92473ceb5e21d873d7c0aee266b3d6d3"
>> -PV = "20230216+git"
>> +SRCREV = "28ea239c53a2d5d8800c472bc2452eaa16e37af2"
>> +PV = "20231127+git"
>>   
>>   SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
>>              file://gnu-configize.in"
>> -- 
>> 2.42.0
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#191338): https://lists.openembedded.org/g/openembedded-core/message/191338
>> Mute This Topic: https://lists.openembedded.org/mt/102846999/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 

