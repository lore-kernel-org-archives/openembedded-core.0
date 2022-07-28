Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE624C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 03:53:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.28809.1658980431893221734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 20:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fg/8G76O;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=42083b20aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26S3rp9H031317
	for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 20:53:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=z2xGZp9BvzQPxF5akBBt24cr8zPxpWbBIBl7ivr/GB8=;
 b=fg/8G76OihRoaSkuHV2RO0vAj5KLJXSP2Ds+RAlDrk55VCdfrm/kCLGObK2GovTUzwZ6
 cRSYt+cWFDmhtZQSnJLiKnOy8lMkYUSqzvfuMxPAXSdrGHgjBKzKcYck22okCtUgKob2
 +7MrqQwCcI5TIrRw5+u0qD+n4XqNx8kbIyHmY7dq/sws5YpLFSP9w+YoOKVpRM+Bwvut
 7+tIDWUrouVfRlrHJE+tU8teiEeUDeLu6wvl2sVO7Zu37aZSMO7MtRhpRTWu1/vFVp4P
 rYw1WPHflu6HIWaMsB1hG45JC/WdT7jtxnC5x7zYF/BR9T+iGSigSDQOECctT/rnUkmJ MQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hgggkbkjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 20:53:51 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26S3rojL031300
	for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 20:53:50 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hgggkbkjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Jul 2022 20:53:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9rC/5FdTf4SPFP8R2dcKqzbkcK97ZOvYyTugwvaqxiZsKLJIHM3Zhp/v51sc6zHhRtx67Fi88HoCkenJl8LyG/98u8u3UJL1zTrxqfi9vnVHlHnUsulnF1G0+v1iMNtwEpOMtNCtQypx0D9W4nTRixdD1TzGk7g7aLGiji52XRxPldgZpoEuX6PcvEO5arSujW7Ga4IW+3KKN2aSbJT/DbOhvkTSLAfrBNMpI07I6pe2B5RJRzeGwhm6x6GQ3buTAiB6Tu2/a/J6GjehzOlqivOIsID9+Tg4XybXFHRCiyR3n5lY77SXj9kH+9sogHho6qdlpvQEzm+Rvc5y/ke0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2xGZp9BvzQPxF5akBBt24cr8zPxpWbBIBl7ivr/GB8=;
 b=jSfyJSCwssFFxXOp+xgHgvNvEkk1o3vP2G0vhQwQaJ7Mc+XN1WdEYEsnahFSo6lYT9RwxmmTI7xOlsvDOW4RhcKO0nX90bifQucJlausC8IYR8PgwIJBnqRSOJ6y2UD/UxaIXZfPuhEqjQoS2OSSkupVQSu97W5tFwJT9IvL5XX1KyN6F4rHbWIlmQTRHAk9pCCtRA+He5tqv97QEMeiMXWRE50VUTEbCRn4rdxkPqU4Tq3SrMjiS9NiTZ5mdaEvcoTe4saaX4hD4HM7cB9yYhLcKWobH7LeGzNss2SjfuzpoO+H86I3mNm/WZYEUKW/pWyWKPmEbZYMsVexQ7MNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SJ0PR11MB5866.namprd11.prod.outlook.com (2603:10b6:a03:429::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Thu, 28 Jul
 2022 03:53:47 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b15a:47d5:1944:4a86]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b15a:47d5:1944:4a86%5]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 03:53:47 +0000
Message-ID: <1dfde637-8448-920a-91cb-7963cda09297@windriver.com>
Date: Thu, 28 Jul 2022 11:53:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [kirkstone][master][PATCH] apt: fix do_package_qa
 failure
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20220727053939.353717-1-changqing.li@windriver.com>
 <CANNYZj--dxtiE6OvQzmUkpzKD3nQ-Zt1C5kbPLUWaBszfvqFLA@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: 
 <CANNYZj--dxtiE6OvQzmUkpzKD3nQ-Zt1C5kbPLUWaBszfvqFLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0024.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::11)
 To SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84894774-54e4-46bd-7acf-08da704cc648
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5866:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rroDed+V3ZuZhfkg6RXs7FCt59j4oiOIax8vDZbaNqAMsiZUgPbVL2goej0HmdKkWSuXxAGdFgIj2hryCRn/L03X19Xei5dsU6cXBudg1E0hZsmrFHJzherJL6yoi9cw7VPH1LJ6BSF02VYIUILXA3S88VpESb+MtVPEPBqlmf3NGUhCCIimIe7aju9fccOjNMCoLKseZk5rfdW3JdWGBXgMpN+rwNvI9diB4MBaG5fgbPP0D9xLnLWLfRBP9Cc41tQx0CD6jWJ6kS9q6N8Ju8ewrHJ9qjAseKrN2XGOiJ/IRj3b9z1WEj8dC1RuDwyJgBlExxmC6aDbo83+HQEwzq/p1qvx23JQfpKp+bxesZBgTSKwRV9/kQ8MlGzspIZMhoLm40tIyDwAXaRzF1ZsLLrNC2RTZEstaUzWO0SMVXMhTnhUtxoyvUP2bIpRCoCr5UoFMSSFs5oxMgEDPgnL85O9V9bJqeUwBr2E+db3YK9xSJ6MjQPa1H0zHhaqsO+txFmu8B+zmBzDJuNzfUx6dpv/wUQGwEzADNAqNUNYMX2YXK7M0SXEsBo47IRvPjXu27mDhDF2iEpMFT1BCNKO3iytDLLGANTCioxVFZ5SCpciEN7h4vURm493CAkaGmh2zlw20EWChpe06eu4jOiMyinrvalYNMIAIebYKLClwqh+e8jaQkCD8hrvnm2Yg8SIRWk05Su07mkQNKuvMFJ0KLBiUFDJYTzj4cvxErD6r6x1EumrUK/GreYEzrY6y2fFMzI9c61q+cdCcklRXuSpgh+7k2cNc6ME+HVN1Nt89fbavTIY/NpONf27jnS4MKGNPwAK03gUxnbsZ71VyARqi+XrZgPr6Th8MLXSEi5zpYaAHo66LvZIjl4xn4UlpJYN6yc2BLvTNpr4iiYe5b5wCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(39850400004)(136003)(6512007)(8936002)(6506007)(83380400001)(6666004)(53546011)(2906002)(66946007)(186003)(44832011)(86362001)(31696002)(41300700001)(5660300002)(478600001)(966005)(26005)(6486002)(6916009)(2616005)(38100700002)(66556008)(4326008)(8676002)(31686004)(316002)(66476007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K1l2L3Faazl0cVBrTStDVTh4QXdZb3lPQi96Q25RMzhjUnVJVE05bWw1SWEy?=
 =?utf-8?B?NnYxZkJ2UXNFeEpKWWlCcVMyTUhjOERrZmVTQzZ5VSt0aFlKdWwxMjFtWlho?=
 =?utf-8?B?VmdHK3pBUlR5eGRKaTVQU0E5R0g0TVo1bWFLellmbHMrbHRnYnhtNlI0RE9y?=
 =?utf-8?B?TWpVYW14YTVYbkpJd3RmTTRJTnBETnM1NXd4M25SZ1dFVXFaeDlySEFuL1FL?=
 =?utf-8?B?dUR4ZmJuSnUra2FPbXhXd3FiVzErQWpHU3BHM0xGdW4rNlNDcDJZYmZkb1Rq?=
 =?utf-8?B?N2RIZUlSR3p6by95cktuZ0ZDNjVhT1h6V1krVmMxaEtEUmNWajhTWEpsSWkw?=
 =?utf-8?B?dXErbmdsRUErc2cvZUcxY0NDTUZNMW1ueTdGM3dDQ0pSdDlmNWhLVnpsY3pJ?=
 =?utf-8?B?cE85eDlrMWdoN0JPTkZkM2FDemdOZFllQjA4RnFzT3V6ZVhrWlZEMVBibnRn?=
 =?utf-8?B?R0NFVm0yTTEvZ244WEtCZU00eElpeDBnZjNaTThyWXBsUmR4ZUVFZ3ZpWGt2?=
 =?utf-8?B?aUZnMFVsNDk0MmhnNW1SV21oU05udDZnVlAvVUxOcTVsVGtEajVMYjhRRXZo?=
 =?utf-8?B?RytKU3R5WFd2NVAwYmlpR2cxY0pySG5zNHNDZm9wMVA3alludGI0SzBSWmtv?=
 =?utf-8?B?L1RCK3VaMnJRcUtwbnpJS2JCdXE4Y3MrQmhSVFpXc2VlUXBIZGg5aFFkaXE2?=
 =?utf-8?B?SWo4eTlDTngzbnNCVmtpNnZoLzY3WTArdHJLcUxRVnF2Mk5CblF2cWE2RUox?=
 =?utf-8?B?YmIwUVIrRGFFc0tUSXZiSjVSYTB4cWd2WHJjV0VhdmtpMkZmRmdUMVA0aG12?=
 =?utf-8?B?VzhHeDJpaWt2Zjk1R2M5djZqZVhQbkcvZzUyRnl5cEZNMndJNVcrR0hucnpa?=
 =?utf-8?B?R2NUWDQzSnV2emlDWGdkU1pEaTlvODZtU3B4ZVpDTlFSMVdrSEg3a0lXRlN1?=
 =?utf-8?B?NGVvd1VPNE1hQUFyQVhzc2ZTUktzcUROL0o4dHdqMktnb05hclRrbFRUNHlo?=
 =?utf-8?B?SGpDdXFBRks1ellwYnhnS1NuMjNqb3J4K1RiY0Nybnl5bHVJdlhHa1R0cmhT?=
 =?utf-8?B?UFJEWkdZNUt3ZXJVZ3dISWRPZVc2VWxQYTdXK3JEbWZEcUhxUzZ1emRQSDA1?=
 =?utf-8?B?bkdWV2NINHB4WHFvdUJFYitvbnkvRUZRa3ZabjF0b2piSkZnVFpOZEFaTk00?=
 =?utf-8?B?bmhyeEZmdGxVNDhIcndPVlpKRGRBa0RiaHczODA0V3h4SmJ3SmlBZVFXbmFM?=
 =?utf-8?B?cFVkVzRxYmkxL2hEQ0dvQzdqc01Ld3RrTzc3ZUc2VVprUTZmZkpHSnhUZXpR?=
 =?utf-8?B?a0NHek1lNS8yYkN3OUV5cXk4WjJoNUsyUDNvS3E0eVZaVnU1RGpjYlExa3pI?=
 =?utf-8?B?TFVIdW5mNlRoVVZIVWdWR1JDLzhGWTN0UUpoNW1zcVRIbjkrOEV6NkFNRXZN?=
 =?utf-8?B?cGNQSGVyQ0ZNT1JFL0RnNjVyVzdTeG51OUFYKzFvQ0tmV1o3TElXSmpEZmp6?=
 =?utf-8?B?eCtwYVNaMUNiTmg1cDdQYVlOL0FxZC9pemdEQXhWRDJKSDI5ZmZsZi9GaUZZ?=
 =?utf-8?B?MGR0L1dGVllHRlZCajB4bHRJRVNTdW1vdTlSSjQxdVcvYWRzUFowZUs4L1Nt?=
 =?utf-8?B?V0RKZFVpdDhtZnRkMmlKTE8wYXo5bkVyb1ZERUV5b2xFMm5lNzUxd01LcWlv?=
 =?utf-8?B?Vi9mcmR2cVp0YlljKzZEcmF4NGtaS2llZHVJWkhJd2pZNkdMN0syUTZwTjJl?=
 =?utf-8?B?UWFDTGprMEtzT2Q2My9JdEViWHQ0WUNLeUlQcTR0d0ZvT0RnQjlUR3VLbXZY?=
 =?utf-8?B?bmpMQmVQVkltYmNqSDBtTHJ6Z3hLV1N0S3BmdWxaSThWWTVJTXl6WjB0VnBY?=
 =?utf-8?B?UThsTGZFbUwwNnpSbElJV0xaNTFGNUlMelVzbFhKMEZDWFdMTEpNQWFXMWc0?=
 =?utf-8?B?czlsMWR2K2dUcnBUdmRUa01mbGRudStnc2hNbDZFYW1IQUtnNGkxazFPeGNX?=
 =?utf-8?B?KytFSzNyb1Q2bDA0dkdjeHdwL1RSTVEvaVJuQWRrSnVieVNnN0JBVE9iSzI5?=
 =?utf-8?B?aVRvdXVxV2JvSlRxaFJ1NldFajN4M2t0dXY1Q3NlQTkva3BRTy85SE5pODR2?=
 =?utf-8?B?b2QxY2hSTGN6MEljdTJmRFhpU0dLZ1hPUFdPRmxXUWdkOGVpN0YrOWg3ZjNy?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 84894774-54e4-46bd-7acf-08da704cc648
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 03:53:47.6091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UgKSd3CmvhOjiVQBFz2F+CrOzy8RDziAe2Qv78gp+iOlIFvVGXumB2/5l0qqZ2oZT6o6tfZnAsZrwre97Q3Oh2lHwkWnxt9ibQKKiKsIvHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5866
X-Proofpoint-ORIG-GUID: WLi6UP4SpWi6Tr7RqCctifgbOini3Lms
X-Proofpoint-GUID: fKhBngfl2S_53JEopD-nvEDZJjXVfDfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_08,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207280017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 03:53:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168590


On 7/27/22 19:51, Alexander Kanavin wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> What is actually being installed in there? Is it really right to remove it?

An empty dir apt is installed under /var/log/. It should be ok to remove 
it since apt could create it when it doesn't exist.

We have remove it for target. So I do the same for nativesdk. Another 
solution could be INSANE_SKIP the empty-dirs.

How do you think?

Changqing

>
> Alex
>
> On Wed, 27 Jul 2022 at 07:39, Changqing Li <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> bitbake nativesdk-apt failed with error:
>> ERROR: nativesdk-apt-2.4.5-r0 do_package_qa: QA Issue: nativesdk-apt installs files in /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/var/volatile, but it is expected to be empty [empty-dirs]
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-devtools/apt/apt_2.4.5.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
>> index 1d94dd118c..d79a33857a 100644
>> --- a/meta/recipes-devtools/apt/apt_2.4.5.bb
>> +++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
>> @@ -123,6 +123,7 @@ do_install:append:class-native() {
>>
>>   do_install:append:class-nativesdk() {
>>          customize_apt_conf_sample
>> +       rm -rf ${D}${localstatedir}/log
>>   }
>>
>>   do_install:append:class-target() {
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#168542): https://lists.openembedded.org/g/openembedded-core/message/168542
>> Mute This Topic: https://lists.openembedded.org/mt/92643987/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

