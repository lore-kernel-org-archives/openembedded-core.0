Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E1EC433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 22:05:20 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web11.8.1636063519280710793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 15:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=MnRRUAN6;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=694221e644=alex.stewart@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A4Kf8Z2000743;
	Thu, 4 Nov 2021 17:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=lUabgoY8OorLBjx2bBcck/0n7wFuIJ66Wh4nEe48MUc=;
 b=MnRRUAN6b1obLrSHqiRrdzDDB5MpHtaheF9MtJUto/oM68r2BRblBPPNbQbcp4eK8A+d
 +OQ+wUkGLyBoAfuBKtR19Q/5EizONyPexjKZGxsZA95hORNQz63408+Xqm4K6eXfKCPH
 F7XX2BjgmY3Qw7lfWtrM1ZpMkV7G3DIJIzb+7vxOmsKe/d2zB1VMTRoZNEr1F2PmR+7F
 +/Cgb+IXOOQ6XWxY5AJr/mHPy9/hLjgyVBZYZXuGhrW2jpeq7bu219FICH+f0dqwCcX6
 +pkd4i521yaB3V10d30oXRaqFpMNii+3tMwlHaFRwBl67qT25ee1tiaGBPgkLUk+ow3b sw==
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3c4hv7gtfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Nov 2021 17:05:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwQRXmOtPdAJRs7wS7bxBL6i7d6+pdzkHlNKEAP23nbsXkyUW1QPoqXARpOF0Q6WgMfZvxX8KJIlpTfHTYSCtju+jtWdaMKVdsJtL4okob5nxD9FNaL2GUhEOXrF9ZMkI03sFnYyl1qOP8Lp28Y3MvMoTuXi/m6opqzcdgJDVgFZe6OxSpXJexz3NjX945WjcSkzlHusLWI77YHDy0gcd3q765O9pfT9PyJJGoU3nSLtM9Dg2u0f9ZMTVvIU2pqGP/46veK8TLH8V9JLoabcA6KeG+nvDjj6tXGN0DYZ3JAINygjS1J6BKsnn+INE2pEtYujOSuRQq0ecNFiqQsQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUabgoY8OorLBjx2bBcck/0n7wFuIJ66Wh4nEe48MUc=;
 b=HDJFJzViSoukPtDgnvnNtpmiKkpEsHoVMhg5MbvIbo9xv/XPzevG41crurLm4RR5N7lRFWavm88vnZwLsrFbuophe1stkrsj6itE1rQ8hvFGgClU0ERnXDjrLdNNEXHlQzluwEqb2OKsg3LuKPpgfA+Yy3BYl6B4B9KAeOYgroBAX2QLWWyH6npAYu3cGZ17iM7GEYj2b6l1MomXMYpeML5c1IjIUvsw915eEd3X/WnS/f5k4+ewEzVbic4wDwLRBm4JMibRalqZo0+2eZMoqrioa4cwFIElnoGCS5twuQPm5PGmCN4NQqk0P5p2Q+M9VjscpDrqndeHfvJSyA4RKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUabgoY8OorLBjx2bBcck/0n7wFuIJ66Wh4nEe48MUc=;
 b=VZXNnlu5saReIOU8stt22aSyJNLcXslJaMgtRYThy58do6e9BhS9nyYxhvf2qbyl+PJMK7tvNHO6UldQvyZsvYnr34OOyMctHQhDV1pPpUBN5BnTzE4BybwZJm0mCKVBwHV8EyZVjYkgUAwADoCNVelwDUSqaPggVDkcR0dng8w=
Authentication-Results: bmw.de; dkim=none (message not signed)
 header.d=none;bmw.de; dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 4 Nov
 2021 22:05:12 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::3db5:5987:435c:27af]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::3db5:5987:435c:27af%7]) with mapi id 15.20.4649.020; Thu, 4 Nov 2021
 22:05:12 +0000
Message-ID: <55a04e1f-b2a2-39c5-dbe7-d2fb06a7666f@ni.com>
Date: Thu, 4 Nov 2021 17:05:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@bmw.de>, richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <20211104140257.3622680-1-richard.purdie@linuxfoundation.org>
 <YYPvsoYTwoCH3PRT@korppu>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <YYPvsoYTwoCH3PRT@korppu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0191.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::16) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
Received: from [192.168.1.3] (65.36.69.14) by
 SA0PR11CA0191.namprd11.prod.outlook.com (2603:10b6:806:1bc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Thu, 4 Nov 2021 22:05:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80985698-04eb-4d1a-9a66-08d99fdf2c8a
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:
X-Microsoft-Antispam-PRVS: 
	<SN6PR04MB515160C4525B1B7D93A3A05EFE8D9@SN6PR04MB5151.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xCL3BCsFdo1bsAeLVS5bVE0P1SWx4YgyVkuujaoFLdlw52so8a8drtjaKlGCs0EpretDtYywHzzkt5u9dqZto6pgP4jSHH88bLcjLAKnZfvRKwt/E+4EagsIVoEID5r6XugptKBS1gbtRhk1fbWWwIwubQnXJ1qUYlZg/9d0kGJdi3a+yGdzzWuMBwwlVrSgZ5WBz3Xt6RR6Xqh91ijt+EpbxVmhEBZ77RaIjINqsrVOoyDqcJBvhQS48cWr7tp2tt0WjcM7Ij9lUskntBXWY2aZOIwi/DCjUM09ntfxrCvAJjPTrParjum3HohtARiosU3W8zEXWAbj6UK8wfM3MK1/JrJ/xK3Dohv6En90neD6BzFI/dHtPIGpoP6vFKYrV15Ga1p56AxyZODgP3UWcr9I/ufF+zgVcdE8PTpi8Zcbvm6OAA5ee+eJUdCUQ9TQBolcfdg2Qufz5nOeKJmJooMVj4qC30Y2fADnFqcs7ckikxThYi72/0JHvWCwqrFn4nkseE8QnBPQkAFcyyh5qGLY7sz7zcy3xloHTuqMo31qxXikc5hPo5YUhxxTg4/37WTr7TOsd02xO1PBhq2EkPOnOJuDWBRv2XL7L/I5Xn26XaeR9Kp1O5pYO3PH2oKMiFjEbu/AnK4P+4UnHqfjOQKw41oyfzVZGnkKNBKmSMOxE8TGe0LJxWX+0oP5ylYKKbNu7G7KfUDrZBlLwyht1Q3kUGosGGjxopu8vuJgUlFvgzAriG6debE23LaGve3CpdZs0o3rhhc9RLM4GFsh/g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(2616005)(66556008)(83380400001)(26005)(316002)(31686004)(956004)(31696002)(53546011)(16576012)(66946007)(5660300002)(8936002)(4326008)(36756003)(6486002)(52116002)(508600001)(8676002)(186003)(44832011)(38100700002)(38350700002)(86362001)(36916002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3lvaWFNVEROSWx4Yisxc1VDWkdWVU93cUk2SXRMb3o3WWVoeU9wc1JTOVg3?=
 =?utf-8?B?eGxjRkI4Nnord1VSSVc2c01rbCtFWHlvRWttdDlzWVJRYlc4dDFvYnlGaEM5?=
 =?utf-8?B?N3pYS0NsaTc2OXIxaGFiQlNjVVNOSGljRy93YU5UWjlramNpUTdSRmhYWjBz?=
 =?utf-8?B?UURsMmk2UzhzZ2YwUFVwdU1nMWF2Q2gvdU1HTnR2R3lMekFOMEhOZVhza1BJ?=
 =?utf-8?B?RVZHL2UvNXZOMy9kRldVZ3ozKzZubGNCSkJVdmF1U0ZWcnJ5RjF3enRDYmQ4?=
 =?utf-8?B?WVpDR3I5SkUzWjRrcU9wcCtsZU9VK0JQaDZZSVRPbGlxVnZJZVVieXBKWmdj?=
 =?utf-8?B?b3F6ODJiRmxxOEtjTXV5WWtYNWIrYlNmU1RIY0xLMGNCeEQzQVVRcjIyWWdu?=
 =?utf-8?B?bUQvcEIyUVp6dWlvRTJWemxvL04yOGkvK25yYkVtSElpdWVGdmVTTmdaSG93?=
 =?utf-8?B?bTlCdjdZQkNkVlNDUE5ScHoyUDd6b2JCZHRIaUhvckZQZjJjaUV2RzZ0RDA5?=
 =?utf-8?B?TXJPOHZHMFlHRUZZVGZmM0NzMFhPbUZ5Q2FUc2xuc1JWWFhxOXVUbmFocVhO?=
 =?utf-8?B?S3FYU2pCT0o1WE8ydVE5eGJ3OGM5ejJsSVpSYVQ1dFNUVU5PUWhpL3hXRVFD?=
 =?utf-8?B?L2JLNWhTMGU3L2VHd2ZMOHZMY1VHTityQU1EWnA3MHZFYmpVTVl4N2FXdER2?=
 =?utf-8?B?NXdyeW5uOWpGODIxTGlqNEtjQ0tIbWdlU1Q1SXpQNjJxOFlDQWExU3gyMWU2?=
 =?utf-8?B?cU9VbDN6NFVubWdTU09jZzg1ZGhFdHM5MUJDM2xGZ3RzQlBTVWtJVVVuRW9O?=
 =?utf-8?B?Uy80SzNCeitYaEE4a1VDV0ZQbFRWN0R1Ri9ZYzhJYXdCNHUzYWwwZFI0dnJ2?=
 =?utf-8?B?ZFZpUFUzZW1ScGltMEN5NHIxdU5VUjVpS2FjZnpCeDgzaFQ3TWtZUjZNellM?=
 =?utf-8?B?eWdRcDN2RURmZG5mZC85czFYZjV4a3ZwaW9YUG9TN3ZmTnUzYkhuakhjb3Az?=
 =?utf-8?B?RTlPOWJOWENLWDRUNVRLcHVEc3dVYUNvTzBtMjlIcmxuOVErQitDN01LWWxy?=
 =?utf-8?B?em1DUThNaHY2NCtHb2htQmd0elp2OGdIa29jUGw5TVRGVXZsVDh4QXh3dUdF?=
 =?utf-8?B?ajgzVEd2R2ZNcGJvSE4yR25FZ2ZscVBWMnRPM1hRdVFRcWYvWFRnSGpmNS9z?=
 =?utf-8?B?eSs5SnZWWkNyeGF4VEJ0UXpZa3NWUDhUTW9mT1JKTUlnTnBDdmpoWmR4SHg1?=
 =?utf-8?B?ZHlLa2crRW9RdVhhSGhJMVZDVDAwVWhHUlpyRm1xbWVCSWdCOG5wZlgxaUxy?=
 =?utf-8?B?RFgyNFZIY2hOeVJ4emhobnFzaFgzTy9zbUJueFJKMkxMS0U3SWlsRG1rM1pW?=
 =?utf-8?B?OFpkcGVBV052K0pxVUJsWG9PeUUxMnhPa1dGUzJGTXlPWGtLME1YQ0p6TW5k?=
 =?utf-8?B?andiaXp1UGFKRzVpSDUrWU5OMjhEc3ZObWxnT0h6TzhnMWNwQzdVdURFSFFn?=
 =?utf-8?B?d2F5RG1aUmNIcXFZYjlIQmhlYnkxZTZwV3hMWDZXeWNsa2FneTZDT1BmL0Vx?=
 =?utf-8?B?bEFxUytrcitXNnQxRmEyeXpQSDVsVnlLaldud0FmYjRLdEhEMUl1dnNDSi9m?=
 =?utf-8?B?TnFJT29UeUtXNk1nYlY3RjJUMmRMeVpQTDd6VzhoUmY3bXgrYXlWcGNlamdN?=
 =?utf-8?B?aExmcVU5SGUzMFpEcjlPeEdSWkhwdm9XbHFocUFzT1pjczZFV1I0VTcyTEpm?=
 =?utf-8?B?RkJkYVZjUWpIc21qSExPRTZCb241N1RreG1KekFRMUtSUjFGYWlTQ3VsNEdh?=
 =?utf-8?B?aHRzSkV6L2JjNkcxd0NtMEtYOGpieXAxcU4xamhTa1FQMTJFOURpenJndVBt?=
 =?utf-8?B?ekVwREhzTXNZb20rblJXbGhHZ2ZYWlZjYWY2ejIvWkE3bm4ra214a28rdW80?=
 =?utf-8?B?MHFYNjRONGlFbjhhTkNNZlh5Y1N1eDBuREZ6a0hoYWxYaEZWN284Vm5lMTRW?=
 =?utf-8?B?WUkxejd0bEVXaW5vTHdJL2ZSQk1JZ0NTdHZQem5PdnV3K3llVFJYdkZ1dkEz?=
 =?utf-8?B?Y2pwWnkrU20vdTIrRXJPNFpjbHdYU2d0U3hEa0tncFBEQ25xVTJHQjJIajRo?=
 =?utf-8?B?QkpBdk52MGVkMnpBbFdHTFI5d0tzQWdtdFFBL0RNUFRrT3hMSFJNcmh4ZXdi?=
 =?utf-8?Q?OdTla27K5mTz2Wr25W/xYGM=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 80985698-04eb-4d1a-9a66-08d99fdf2c8a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 22:05:12.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZBiDysT/hIWGdJMe+zVi/x1FOym4mZcDVwVfMbN6c1RvAbsviqq74ydMrcExt/Evj2AQj6eEFGHMtHIaPP2yvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5151
X-Proofpoint-ORIG-GUID: vENAQVtw2rzeKsPrxocmgLcZhHMGrven
X-Proofpoint-GUID: vENAQVtw2rzeKsPrxocmgLcZhHMGrven
Subject: Re: Re: [OE-core] [PATCH] opkg: Fix poor operator combination choice
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-04_07,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 spamscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111040085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 22:05:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157877


On 11/4/21 09:35, Mikko Rapeli wrote:
> On Thu, Nov 04, 2021 at 02:02:57PM +0000, Richard Purdie wrote:
>> Combining :append with += rarely makes sense. Improve it to use the standard
>> format (and tweak the implied spacing).
> Maybe I'm silly but I find :append with += safer to do than manually remembring
> to add the space character.

I tend to agree; hence why I wrote it that way in the original patch. 
But I'm not going to defend the practice in this case, so ACK from me 
either way.

I'm intending to drop this recipe warning after the opkg_0.5.0 release 
in December. So the recipe-as-written will only exist in the mainline 
for another few months.

>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   meta/recipes-devtools/opkg/opkg_0.4.5.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.5.bb b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
>> index 2760fc58786..8af047a51ff 100644
>> --- a/meta/recipes-devtools/opkg/opkg_0.4.5.bb
>> +++ b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
>> @@ -60,7 +60,7 @@ do_install_ptest () {
>>   	sed -i -e '/@PYTHONPATH=. $(PYTHON) $^/a\\t@if [ "$$?" != "0" ];then echo "FAIL:"$^;else echo "PASS:"$^;fi' ${D}${PTEST_PATH}/tests/Makefile
>>   }
>>   
>> -WARN_QA:append += "openssl-deprecation"
>> +WARN_QA:append = " openssl-deprecation"
>>   QAPKGTEST[openssl-deprecation] = "package_qa_check_openssl_deprecation"
>>   def package_qa_check_openssl_deprecation (package, d, messages):
>>       sane = True
>> -- 
>> 2.32.0
>>
>

Thanks,

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


