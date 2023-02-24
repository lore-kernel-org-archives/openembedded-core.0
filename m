Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9605BC61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 03:27:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9673.1677209237785093033
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 19:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GLDSqrC5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1419ccb9dd=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31O3O2Bx019788
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 03:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=HSmDCx4lBfxZh5rMEQVpPV0MjW0qoxVuK/RCebZj7MI=;
 b=GLDSqrC5vdYRHHUs3P2020ihlr2A1MNMHgiaF4hIoX76OetOO58lQX/VYdZSLDD7DIzx
 qvqPZ8iK2obnpMr7O/XtxgandqAFXyDpT+iZg9/IlDFL/wsAEgGB409Qf6XNYXR9rheN
 hZn2RmIHKuT2cZ6F4M2+tMgthiFkmoTXgk/txKb9AgoC0Wbn461JoPHpvZaWIW0/P5uJ
 teMWnN9tfRH26fZide9o50U+aAzLhz5CW9aYgWqiv6eCGlCTUOC8hZcDXvJzzREMmnTR
 5pvoPVUzA3It+ycZJeciIkzPbluganbUYCiK0u9E0ckzMoHb9T0Wo4TcOj7o7I8bOqG5 wA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3wevu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 03:27:16 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31O3O6kv019796
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 03:27:16 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3wevs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Feb 2023 03:27:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMROZCDEg1Hr0DcroCiBDBOAzhax8ASWE1jJ7cfD9/uIg2hJtwgfR6oIB4JJe9QvUMQw21tOl6FxM0IodPh+AZleBIXo+eV8KzUgUWTdrPyL+CbKJ8bFkC1QWSIcW2sTMHXu2HbI3l09LBnfHm3LOBWRiDtyBsKxmvYL/5kp7deeIBBY+1y89JTlKnZvZe3ZBD7KQVr+a+paQ5pRxEE6pwu8NPkOeJoO/iex7fiZoJJ3wJ0pKD48//0m9lX+AW6TyN3hqfnBjMmOGaF4w+we3PoFrGSkIomF1mwrfJ6cKfAw+mFosGn4OzVhmZQqAM5kih9+5es82xuRCcUtu6+pAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSmDCx4lBfxZh5rMEQVpPV0MjW0qoxVuK/RCebZj7MI=;
 b=JgDPrAfVkYCPspIKGS8NCooptf5egBmwCmCcQnpidjjmFr8Vm5rbpRRmYr6aBLpHK5XyE+LOFbYNuk4oCVNiOH3z0Ca8xsu0u3KvL5o3zKR8xF3oHKEPtmvADsohHqjiEeU1DXdhtvfbmvbyq8rl2FVTH4anxqYCB33dTTMvNEua9KHzFbDA3YYzjKoUWXNzvIGQUczQyOBkl3tLhxAajvqqLTM/Z+WLQ4waOLcJG1PG20J8BV4VvBkHBeo3rqyJ5d3SYKu2mDfc5NtzHxAHujzaRo1C6q/QNmCZ8O2EB5U1l8uv2pB9UedXltrn5EZJiBrtdqLhZZDogGY/JMCUPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM8PR11MB5656.namprd11.prod.outlook.com (2603:10b6:8:38::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.24; Fri, 24 Feb 2023 03:27:12 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 03:27:12 +0000
Message-ID: <efda9be1-9e59-d4ca-cff1-4d05c179d0a0@windriver.com>
Date: Fri, 24 Feb 2023 11:27:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH] nghttp2: Fix do_rootfs error as following:
Content-Language: en-US
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <1676014485-3128-1-git-send-email-leimaohui@fujitsu.com>
 <b9adc480-1eab-3c45-151f-a60387882ca2@windriver.com>
 <OS0PR01MB6178114270DF9619E2FF60B1A0A89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <OS0PR01MB6178114270DF9619E2FF60B1A0A89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:180::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM8PR11MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: e25c1947-3c37-43fd-df94-08db16170424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UDdW7xWFWxBUP6sJDOg2Ke7yr1Y3dhCS3cg/bRDNA7tbV7jwDDm6CIqrqHt0cjIxPkO2KsHURrCJPUzoAEDuoionIptjpWXUblMX1C6LYHXlDqKGw/IKt7i5Vy7KuQDzs8F/1r8v1gLmFtj6f5hOqjStPhQK93/khQQSb1pO0PoiYHKHkXMysTVvBQp3MKfDyQU7vVzOQJ9PBXd4ltqMUk/+VoNMmBwCjP/reMaf1NJQrqsLQm2FxVw85j/p/AImYLUn6Q7/6hbUcAIaA+gvKOKwjtRK8zNLrrWZrdzlNrfzzDFTR0bFpmScxD/vfN6/TCkoTUbqqRGZnvia9o/KDM9gGVxNgwwyxUhHjvkBzrbWiPHjvBRwreVlVJrxD//6MwHABEDpN4ulEXSThKnzYtwBVXivBZ/DVsR4BAU5XhACXS2TyyobBB0b3F4xyLKqxoNIaxANr0+iCh9kra4KZMxLaOkF0AJ40QVxX8LUUo3jW9EyFdOHrUMQ0G4eGCtohKqQdPHVCK51Ixq+mLUmQZ8dJtm4VBsfEsct5pP0UHCEPyVTcCILvUPGhwksypP35lXQ00tUUKG4DwFLXJHQKzf1cgUy13EIqlICi8cOFj29LUzWxe9zBG2/XMptRWTnXFM5FUrGUwWd8KW9QUSP+iAcJJKjdyuZZv28Wq60oXo2K4mOdhMPGgw2QgFUfsCWT3RRcAr1OiZB7eOw5Z8TxiXf/dR9goHmApasqwfKzDn0IFtYk5r32ozaPXiSerV+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(39850400004)(366004)(136003)(451199018)(186003)(53546011)(26005)(2616005)(478600001)(6486002)(966005)(8676002)(83380400001)(66899018)(66946007)(66556008)(66476007)(110136005)(6506007)(6512007)(6666004)(31686004)(316002)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3VBYWJJdTVMOUNSTjVmUmNsZFhqeDVEL3JrRFNCKzdOQUtJWkVSQjNWbW42?=
 =?utf-8?B?L0xPa1hOYlkxOHp6WTM1TlVQQTloREtEVC96NzB2VmFzMFgzU2M2TGFQeHpl?=
 =?utf-8?B?aENmRTBDMlFXR2xGamFuK2xwU011MUM0Nm9mOU5XNm9ITmhIcGRGQzQyb25M?=
 =?utf-8?B?Z2RmK2lYcXBLb2VrS0Eremd5Y0FENFFJSjVxSTBZRENKNWVxeUovNHlacUFU?=
 =?utf-8?B?YmlMaURiNlpRbnE0NEk0UHFHK01DQTRjbHZkL0pHWTZqVzFOMjgxQlkxcjh0?=
 =?utf-8?B?VDV0SlBnODFla0xPUGE5WDFyNlpoTkdiMlJNeFhEYS9UNm9ha0VyenYxZEJv?=
 =?utf-8?B?bmhxeEdTc0pSOVZIK1VrMTlDNDJ6dHl4K050Szhlak5hSDJkQ0cxbldkd2ZQ?=
 =?utf-8?B?bDlTVnZianJOR05lVlJWNTJmQXB2UCt1K2taRnZreDVuRDJaaklQS01DL3Y3?=
 =?utf-8?B?d05GenR2a05CSEZjUzc5Tk1rdWJVaEdwcXE0WVJIb3VmQVgyazlrMlJhbVpv?=
 =?utf-8?B?SWwrUlNVV000dURYc1NaMnZ5SXRLbkNaam9VVTFLZ0hVNEdLOVlTU2g3c1FZ?=
 =?utf-8?B?SlZyOGFPWGV1MEc3VGZ0OGFFYzhjZjN1SmVuemdsNWFIMEhWbHhRM2Z3TFFL?=
 =?utf-8?B?OVJxYUNFTUtNZnE4ZFFPeUx5Qnc2OEtlS3NodTFMbTd3WkovVlUxWnlZTmlw?=
 =?utf-8?B?NVdWOUI3MVdRWFE4L3A3VGd5YjZCcm9ZT1lvc1UzTWY5Q1g0elpXTWE0M0Nw?=
 =?utf-8?B?WHZoWEVPOVNLdnhKOFgzeXNKdWt6cTNvZ1RVWkRhdjQ2TVBtOXpHMFdBb2Mx?=
 =?utf-8?B?Um1mODcyUTJFZWIyUUJqdm9DN1RFVmRRN21hM2hDU015QnBPeUdRRE9FVm15?=
 =?utf-8?B?WEtmdWk3eXllQjI2UGJKUmdyUDQyVUoycjFHTm83cDdsM3NSYVJwblBtc0NM?=
 =?utf-8?B?dFBndkx3SUdUWWRYVFRLZzNDRVhpVnZsNW1IOWNtcU96TEsxTnhwSGRDaDJy?=
 =?utf-8?B?Z0RPdWhDN2pGRWtiRUFiK05vVjlybmoyYi9RWmwzRHJjVWc1ZzVldmRyREIr?=
 =?utf-8?B?aFZUWXp6Y3ZwK2RlemwvUUVRcUQybnRPN1NkdUcwbkZYTVJtVFpvMzhHbVlE?=
 =?utf-8?B?WkgrS2cwT2kxK1kxSkgyQ0VIY0RpR1hNM0xVMXZCdFFTY3VHeVZDc29CK20w?=
 =?utf-8?B?WFk4ekZmd3JBdk9IVnJBaTFBbnFMbzJ3SDhQa0VGR3g5RTUvbzVqbHVoejYw?=
 =?utf-8?B?WnVoUktQdG1lVmxsdDFDd2M2a1FNU21ybU5VQ3hJR1lCTHh3UTVJVmJoUlc3?=
 =?utf-8?B?SmxFYmJROHA5TzlMVngrNjNoNHNJRE5nbE1MWGhETjQ1dEZOeDIxQmxSZGNZ?=
 =?utf-8?B?TXZ0K0J6aHg5M3NEOGZpZUpvY3pvd3RSRTgxVWxUMWs5YlJ0L2wxZ0pZR1Ev?=
 =?utf-8?B?dDVvM0lEUVF0dGx2OHljS09sdmhOekhyVklMbUxGYk5EUVhWN2dTWlFGTWlp?=
 =?utf-8?B?aitUQllIeWNteHN1bEl4cUxBcFFBQU5idTNZZkF2Yk9TNmU4U0JwbXVXRTlR?=
 =?utf-8?B?RzVEMUlycVUvT3JsZ29sNmhLelBQVFVrSW1HdUxGOFZnYkIvRlpmdDVjQW5W?=
 =?utf-8?B?cVNTUzRTZjJvcDQ0R0cxaVdWeXpCZU5RbVo1eGlyVXpyR3JMN3pENGtQY3li?=
 =?utf-8?B?SFFHSnRxQ05zRnlkZUFkWTlRVUxwbWNvT3BLeGthR2NJNmVmT0dqYVQ2OEl5?=
 =?utf-8?B?TTY1ZUJadTU4alhnUU92czZKU0tTNVdHTHE3bWt6bVArM2RlalI0RlNCMEdV?=
 =?utf-8?B?SlU4Rjlqa00yVUdFTHAxdFRKVUZ6OVVBSDFWaFFQNHlvMysvVzNkRzNoRnZu?=
 =?utf-8?B?UThzYlVkVUtydGEweXB6blJHQ1h4RFVpN1FMQjVWNlp5YS9tYWp1Q2FMbGJJ?=
 =?utf-8?B?cDVVSFljNmh4TjNrRUdqQVJUZ2dzWUdGS2QycGxBazJJWGpEdTNTMDU0Q0R4?=
 =?utf-8?B?VVUrNTRTbk5aTGNYREZJV3Z3Q2tIdk1YMUhQcDFERitmc0NBOVEyZDlqV1ZJ?=
 =?utf-8?B?Z3Z2Vjl0bk93T3VSbGtUNWhWVHpPOHZtZkROYUlJeTg2clJERUthNXpWZWlw?=
 =?utf-8?Q?36m8Vs3+hZmoflJfWr3c6R2Yj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25c1947-3c37-43fd-df94-08db16170424
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 03:27:12.0791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVd18WHfQIXVAc+3Zw8F/tgt4Mt0HWNvRtjK2WpL4F2OgapyX/lsv0I50yhGkWt5XldSNqetclXrLLAw/B7Nvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5656
X-Proofpoint-GUID: mxETmIAkfsRAUobsS0NcsxOy2FzmCsp7
X-Proofpoint-ORIG-GUID: 1v4BynlMKiiXfsqCGU1sjsOCJxcryhdi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_15,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 03:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177655

On 2/24/23 09:45, leimaohui@fujitsu.com wrote:
> Hi
>
> I'm sorry I missed this patch.
>
>> This does not seem correct. These two packages have FILES specified, and
>> ALLOW_EMPTY:${PN} is set to "1". I suspect the actually problem lies in
>> somewhere else.
> This recipe is special. Libsoup has a hard dependency on nghttp2, so it can't be moved to meta-oe. But nghttp2-client and nghttp2-server depend on recipes of meta-oe.

Hi Lei,

Which ones? Do you have some local patch or some bbappend files? Also, 
if this is the case, I think Yocto's autobuilder will detect such issue 
by doing pure poky world build. I also just ran `bitbake -n nghttp2' and 
there's no error.

Regards,

Qi

> I tried to fix this error according to Alex's comment by PACKAGECONFIG entries. But dependences is too complex to complete.
> My patch is just following the existing code. But maybe it is not a best way.
> I'm talking this patch with Alex, welcome to give me some suggestion.
>
> Best regards
> Lei
>
>
>
>> -----Original Message-----
>> From: ChenQi <Qi.Chen@windriver.com>
>> Sent: Friday, February 10, 2023 3:49 PM
>> To: Lei, Maohui <leimaohui@fujitsu.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] nghttp2: Fix do_rootfs error as following:
>>
>> This does not seem correct. These two packages have FILES specified, and
>> ALLOW_EMPTY:${PN} is set to "1". I suspect the actually problem lies in
>> somewhere else.
>>
>> Regards,
>> Qi
>>
>> On 2/10/23 15:34, leimaohui wrote:
>>> Problem: conflicting requests
>>>     - nothing provides nghttp2-client >= 1.51.0 needed by
>> nghttp2-1.51.0-r0.core2_64
>>>     - nothing provides nghttp2-server >= 1.51.0 needed by
>>> nghttp2-1.51.0-r0.core2_64
>>>
>>> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>>> ---
>>>    meta/recipes-support/nghttp2/nghttp2_1.51.0.bb | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
>>> b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
>>> index 8ddb851f71..72a4372214 100644
>>> --- a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
>>> +++ b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
>>> @@ -24,6 +24,8 @@ RDEPENDS:${PN}:class-native = ""
>>>    RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
>>>
>>>    ALLOW_EMPTY:${PN} = "1"
>>> +ALLOW_EMPTY:${PN}-server = "1"
>>> +ALLOW_EMPTY:${PN}-client = "1"
>>>    FILES:${PN} = ""
>>>    FILES:lib${BPN} = "${libdir}/*${SOLIBS}"
>>>    FILES:${PN}-client = "${bindir}/h2load ${bindir}/nghttp"
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#176983):
>>> https://lists.openembedded.org/g/openembedded-core/message/176983
>>> Mute This Topic: https://lists.openembedded.org/mt/96872036/7304865
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>>> [Qi.Chen@eng.windriver.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


