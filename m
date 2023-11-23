Return-Path: <wenlin.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2DAC27C40
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 02:13:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.83187.1700705609008910307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 18:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=iZWvNTgQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9691a9d378=wenlin.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AN1kUMR015233
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 02:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=H16DJ4udBfAeIJmEbvIttms+UzZr2cW0JLwH+/u9FTI=; b=
	iZWvNTgQnfOPiZyN5GOR2hTkHvaUYPYtn1u8ggYpa1fsnbUYDmHXjutqyGMS1Vzr
	qRklwNN/xecE8JdbqQq6P1+kI4aJnL1rHAwbC0AJuKHqDuLzCDutX2mAAHTQ8uQu
	oNwv0yIEjMUXoIgQG0LZNfU/bfYMkrmO2B7EK272MFJangPEwi2LO0lHy7q1f+nQ
	o4jeAQFLJmB3MlMi6/Z9W3ywHuRZWjBmjm5TF//+XapJc4YkjTNUcMsQ5xgLnsxI
	GUKGbsLtO94tecjBK7yPLXkZOWZfTLpsNlYfEemEc8MAA9Vd2nbG0Kg0jIZ3Unrr
	djlVL3bRBs+KMGU1KHZnKA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uejfwv3a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 02:13:27 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3AN2DR15023820;
	Thu, 23 Nov 2023 02:13:27 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uejfwv3a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 02:13:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTv6iBf93KualZAujpRwszJVgXEHmDLsRJ3Mc50c+LebNCO1Wc/iMKnhHeGy0vtkK2Ff/pkSLyWlu0mYEHrNIyPd+u18JnCKzWr1X/n4pQw4jFe7C7Fb2gnkuhkrH/znko0pux4h0wqURhjfMGcpMS2s4c4lmcaAehV66kYj2n8y4hG44igBdkCii1B0WruNZOvFgtbEyAUl7O/hGnUXQgGDKKM9cKuKYZsSm2luq2xLQJir8G9yZCLV1pSQsQ4G180i3ZyMaj8U/FKYqABFKAaVTohJtVDLsnKurUAYE5upi9Bs2KD0SexHJ6lDuJNMZg+9JfkqIqJPx+7S8PQh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H16DJ4udBfAeIJmEbvIttms+UzZr2cW0JLwH+/u9FTI=;
 b=UDXttAIWI6F8rGuhBRC4tT8JIfVU66N9Xpius2UGrpT4dqnowYCD+H0gRFCpiH00eF5JDAy8Gc69UmaGkKdDqQerQXENYIgX63wnJHsWpiaW8a1w3YvSDiZOdri+0S6NGN6rYyQlgPH3P9WnrTVn6Oymqewdlws8ju+sh2VZUBCofmH+EFBaUuc5oCHHjFQNxPWXkn/sxdbE8EIoXSDWiUH6h9dQib2cB6cqE3INcVG49tOlnXFwdYb5bahu6DlBUjvLQ7H0/3dnhhCisfxG8yXCkYH6MqHbqCvh2Y97+J5Vz2KKmQtY2iP4lB4yMmy++Hx6+QeHaTuuQ+2fUSw3vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) by
 CH0PR11MB5539.namprd11.prod.outlook.com (2603:10b6:610:d6::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.19; Thu, 23 Nov 2023 02:13:23 +0000
Received: from DS0PR11MB6325.namprd11.prod.outlook.com
 ([fe80::58c:71ab:32d4:dbfe]) by DS0PR11MB6325.namprd11.prod.outlook.com
 ([fe80::58c:71ab:32d4:dbfe%5]) with mapi id 15.20.7002.028; Thu, 23 Nov 2023
 02:13:22 +0000
Message-ID: <d10bb7c5-cd99-47fb-9fbd-17658d68c520@windriver.com>
Date: Thu, 23 Nov 2023 10:13:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] libxcrypt: fixed some build error for nativesdk
 with mingw
To: Khem Raj <raj.khem@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20231121094154.3406211-1-wenlin.kang@windriver.com>
 <7946b5be5430d60cf12b4a342c6c9047e2b1b843.camel@linuxfoundation.org>
 <CAMKF1srWETQTQ3Gc_VAHt0Yi6tb5PpXhPzQcDOZdm9nzUG=rNw@mail.gmail.com>
Content-Language: en-US
From: Kang Wenlin <wenlin.kang@windriver.com>
In-Reply-To: <CAMKF1srWETQTQ3Gc_VAHt0Yi6tb5PpXhPzQcDOZdm9nzUG=rNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::18) To DS0PR11MB6325.namprd11.prod.outlook.com
 (2603:10b6:8:cf::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6325:EE_|CH0PR11MB5539:EE_
X-MS-Office365-Filtering-Correlation-Id: f907255e-862a-4d0a-abd5-08dbebc9c4ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kzjYmnOM9WL7CQku6SNmpgSHs1HgIdeHqsIYxVgGYi4hUu41EZimK0Cd9qVdjvStytvbG30ENfiIhngisMZgcTTZg3hRFjUUSUQnLMQvybczYgdNvdQlheX5c7R45dA+mbox8KG83PLYjCOD2Mh0OOj0ATRaoHobHIwvwmGRGt0R4dTzGP/HtH/eptAEKjeiX83hrtQ6/uSoNem5fkrrCJqWAxSWvYuNO9oNknig/Vt2Pt+qxN1uCW3xw0peUHY54TN73I38LwIia9oJtjlUYZdBOYUTwe/c2/jHMqCiJCxlZIpo7Ynm7jI27CI2j6ki+uKq91EdYluLCJWtY2XExcjQ70oNhmHSbwavEU4/hR1DmzYqCNp2zM6vBPNMXISJDZq/zQ6TCxJc1E8an8lfNxb/HbcDsfLQbvtJnB7FCL2wN19IutpMv5Ae9Rb3aaWHX+o+lZ7QmSWz9KaQoE2EnxDSv+Og9QLWJjyvBa9ZkRGyArEyQiRF6psdZ99K7cC9Ea4TqlujOiadCzsU3t/8Eg4QjkBIMHuYpa1e1nomNOCmr7/jb7uV8YvzHunqp19JU6CwiTZTXPsfXWP2Hq9VSEB210+JMG8hycBp8CuYnbwVSMyPh8FJsH/Qi0l+UK4E5fHY9YRYb1Piu2tPD46ZJplkaelsDay65phgUx6q2tVRTgbAZFbmlfda5KiDTxs5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6325.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39850400004)(230273577357003)(230173577357003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(6506007)(53546011)(83380400001)(6512007)(2616005)(5660300002)(8936002)(8676002)(41300700001)(4326008)(4001150100001)(6486002)(2906002)(966005)(478600001)(316002)(110136005)(66476007)(66946007)(66556008)(86362001)(31696002)(36756003)(38100700002)(31686004)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXMwT3g1WUI0a0tSbXR4WFBaS24vQ0NPZ2kwNWFzNXpyRU9XakhyZlhUY2ht?=
 =?utf-8?B?bGI4SGdZMUdiZ1Z0R2NKUHF3RDVheFlyV3I2cXFFWW8wQ0lnMG5LNXE1Sm1W?=
 =?utf-8?B?SUZKdEtkZ0YyMjA0UDJPTkN2R0Q0WWt2OTFvbEc0R3ZFWEdyVHVYMFQybXFn?=
 =?utf-8?B?Z1VsTE9lU2F3L0UrSyszYi9teTg3WDg5UGJ6MHAzL3VpZkxrL1Z5MW84a29C?=
 =?utf-8?B?blU2R1ZuSXRiOGJ1NzI0RjFNc2ZqdjdKN3ZmbC9MTnhndlZDTHh3eVFjWmM4?=
 =?utf-8?B?SW9DYkx3L2t1dlNNbWpVR2Y3MnJVSVA0R1F4Rmx6ejR2aThqMTRlSmJtSUtY?=
 =?utf-8?B?dHpOWm80MlpFRWtjeWM3YkZmSWpwVlNjTGpTeHVLb0xjQkVmWXFBMW9qTnhQ?=
 =?utf-8?B?WHA2eHZyb1piWnFyNUpoWE5mV29BSXV6c3c4eVpBdjZHQ2pPb2pqVERaU0xp?=
 =?utf-8?B?YnBkUUw0eXl6VG83YmlmRnBPb2huRE42MVkrRGpXOWZKZnk3ZU5WQk52d2J2?=
 =?utf-8?B?RkR5TXp0ajhlejNuUmpVTG8vSUpXL245ekY2RnNnRUNsU0ZBdTc2QURGK1RX?=
 =?utf-8?B?WFNTWjlnQUZwNUVWV3E4MVFCcWRTV09PK3ZKMzRqQ1hDclFLb1VQNFhHWlF0?=
 =?utf-8?B?VVFUNVRuUXdvSWw1QkZGbEZjZ2pSYUtYYVBiUVBTT1RXT0pBMW1lYks0STBw?=
 =?utf-8?B?ZXNBSitUZUZvaDFwVCszVy9pQUpnbE4rQTVOS1VwQWFtelptck03THFWeUVH?=
 =?utf-8?B?bHJFQVJwQ2dXdkFmcjMzRlJVNE1rM3ZFNzI0TGt6eHRlK25Tcm9tZGhLY2t6?=
 =?utf-8?B?N1hRWWxvbVZPdWZ2ZWpjTTU0K1dUMk5sWTZlQlVBcjlMckhjY2l2VlloSHR5?=
 =?utf-8?B?SnVyaCt2Z1pEdzlVWS9Oc0lGV05XSGVjdmFHSEpjMXpob0hCa3M3eW1ZUU00?=
 =?utf-8?B?cTdkSGV3TFJpY2pDeWZTR1QwdWVEeksvWEJ1UndKUDZmM1hpZnArRzV4bnMr?=
 =?utf-8?B?cTZYWFFRdXgrNjlCWUVPNzJOQThLcXROUUZPMlA5QnN2RWlHOThrQnBjUGtK?=
 =?utf-8?B?Wkk2WEoweXNpd2c5eFVycHo4YWRGbExZVHJ6dlRrKzR3QVBRNVYwM1hRbUp2?=
 =?utf-8?B?aG5GT2djRmRFamJMNEcvV2l6eEFYM1FBanB0UzVudlpic3BjZzhWRmVBR1di?=
 =?utf-8?B?amNrMCtaR0JQMUZ4MnJCMGhBOUJidnEwNmdCK0VEcHdsN285NWU5S3J0d2hK?=
 =?utf-8?B?V3dhOFpLcWpObVRSVWVDZ3R1MWF3MTluVUNGb0dTTHJ2OE9wdkVQQW96bENn?=
 =?utf-8?B?bEpsdGNRaGh6RnQxK1daQ2Y5YUJqZkdSd0xwQVp4azc0NktiL1pkZWlqL05w?=
 =?utf-8?B?ZVBPSXRkSko2YXlnVG9HdHdRc3dnUFlERVVVMHlzRTRMZ25UeFhJREFZbEI2?=
 =?utf-8?B?K0xHc0QwZGU4MUprRXZMVjZKMGpqYStGWXMrclVSZXNodXMrT3NSRVlMUm1Z?=
 =?utf-8?B?N1ZGWWxReVZxUEN1cDE3K05JRks5S2N4L0lSb01zK0V0RlBJM2lzdXNHSEpZ?=
 =?utf-8?B?THFGKzJ3YWYwSVV2WXhtN2xYR1llUnloc25DOWM0dzhMRWZ6UG53dmZoZXRs?=
 =?utf-8?B?SUZIdVcwMFJ2N282OGF5cE12YjJtTElxbWpZRGpQSUxvd01JYmoxNS9RcW8w?=
 =?utf-8?B?cHlLV2QvSTJOcU5RVG4vRUpzbVJCRzBQR1V4TUFQR2F5OWJ2QzYyUEhaTkFu?=
 =?utf-8?B?NWVZTlY1aGVKM2drT2Rpc0ZsNHRJelBjcEF0VVpYSU93YjlKK0c4czkrMThh?=
 =?utf-8?B?dHB1bkdrN0xiZndzQ2JET0c2U05HSE5Nb0R4Qm11RVM1QmZPck51S3Bja0kv?=
 =?utf-8?B?OElsVy9NWDViTTRONGc1NjlmUjJWWHdKdm9VWEFoKzg3NUZFRGMvdkpmKzdY?=
 =?utf-8?B?NkhYT1hocWJDSFBxTlR5b0gwUi9VVm5ZMTFzUnVxUGFHRjR4cDNtQXhZYjhB?=
 =?utf-8?B?Rlh5bDhXYkkyNXdnUXVtaEE4RUtXQjRqdnpsYW9TNnIzQWhTcm8ralIrcS9z?=
 =?utf-8?B?Y0NKdzgzUHlTMnVMZE1MekdWdEdxbXZEaVo2enl1dS9Jb0djTTNUL2xZN3FS?=
 =?utf-8?B?T0tlT2ErZFlLb29vNk94VWdqQjNDN0EzTWM5TjVBeUdwSDNJUmpxQnVoMHBp?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f907255e-862a-4d0a-abd5-08dbebc9c4ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6325.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 02:13:22.6831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+ANc0fbByKsg1oO8rR6edwI598reaLTFpHl35JClTaO9zabw4265s/NjtNVtTqvaRwihHHsICggsy3m6DxDIiQEDfWeyUnJOg2nCY/B8mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5539
X-Proofpoint-GUID: 6PBtHyiSeMTvvuqDlBO47QZ_VvCUrKPP
X-Proofpoint-ORIG-GUID: fWZHzDkVRv_qxbmPWE4Ztqbcq2CmsqBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311230014
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3AN1kUMR015233
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 02:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191129


On 11/22/2023 06:44, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, Nov 21, 2023 at 2:42=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2023-11-21 at 01:41 -0800, wenlin.kang@windriver.com via
>> lists.openembedded.org wrote:
>>> From: Wenlin Kang <wenlin.kang@windriver.com>
>>>
>>> Steps to reproduce
>>>    1) add layer meta-mingw
>>>    2) add line in local.conf
>>>       SDKMACHINE =3D "x86_64-mingw32"
>>>    3) bitbake nativesdk-libxcrypt
>>>
>>> Fixed:
>>> 1. pedantic error
>>>    | ../git/lib/crypt.c:316:24: error: ISO C does not allow extra ';'=
 outside of a function [-Werror=3Dpedantic]
>>>    |   316 | SYMVER_crypt_gensalt_rn;
>>>    |       |
>>>
>>> 2. conversion error
>>>    | ../git/lib/util-get-random-bytes.c: In function '_crypt_get_rand=
om_bytes':
>>>    | ../git/lib/util-get-random-bytes.c:140:42: error: conversion fro=
m 'size_t' {aka 'long long unsigned int'} to 'unsigned int' may change va=
lue [-Werror=3Dconversion]
>>>    |   140 |           ssize_t nread =3D read (fd, buf, buflen);
>>>
>>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>>> ---
>>>   ...dom-bytes.c-fixed-conversion-error-w.patch | 47 ++++++++++++++++=
+++
>>>   meta/recipes-core/libxcrypt/libxcrypt.inc     |  6 ++-
>>>   2 files changed, 52 insertions(+), 1 deletion(-)
>>>   create mode 100644 meta/recipes-core/libxcrypt/files/0001-lib-util-=
get-random-bytes.c-fixed-conversion-error-w.patch
>>>
>>> diff --git a/meta/recipes-core/libxcrypt/files/0001-lib-util-get-rand=
om-bytes.c-fixed-conversion-error-w.patch b/meta/recipes-core/libxcrypt/f=
iles/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch
>>> new file mode 100644
>>> index 0000000000..3846f76674
>>> --- /dev/null
>>> +++ b/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-byte=
s.c-fixed-conversion-error-w.patch
>>> @@ -0,0 +1,47 @@
>>> +From ff99091eb8a6b9e6edc567f6d2552183fbaacec3 Mon Sep 17 00:00:00 20=
01
>>> +From: Wenlin Kang <wenlin.kang@windriver.com>
>>> +Date: Mon, 6 Nov 2023 14:43:28 +0800
>>> +Subject: [PATCH] lib/util-get-random-bytes.c: fixed conversion error=
 with
>>> + mingw
>>> +
>>> +With x86_64-w64-mingw32-gcc. get below error:
>>> +| ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random=
_bytes':
>>> +| ../git/lib/util-get-random-bytes.c:140:42: error: conversion from =
'size_t' {aka 'long long unsigned int'} to 'unsigned int' may change valu=
e [-Werror=3Dconversion]
>>> +|   140 |           ssize_t nread =3D read (fd, buf, buflen);
>>> +|       |                                          ^~~~~~
>>> +
>>> +In util-get-random-bytes.c, has get_random_bytes(void *buf, size_t b=
uflen),
>>> +but in mingw-w64-mingw-w64/mingw-w64-headers/crt/io.h, read() has "u=
nsigned int"
>>> +read(int _FileHandle,void *_DstBuf,unsigned int _MaxCharCount), and =
has:
>>> + #ifdef _WIN64
>>> +   __MINGW_EXTENSION typedef unsigned __int64 size_t;
>>> + #else
>>> +   typedef unsigned int size_t;
>>> + #endif /* _WIN64 */
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>>> +---
>>> + lib/util-get-random-bytes.c | 4 ++++
>>> + 1 file changed, 4 insertions(+)
>>> +
>>> +diff --git a/lib/util-get-random-bytes.c b/lib/util-get-random-bytes=
.c
>>> +index 79816db..68cd378 100644
>>> +--- a/lib/util-get-random-bytes.c
>>> ++++ b/lib/util-get-random-bytes.c
>>> +@@ -137,7 +137,11 @@ get_random_bytes(void *buf, size_t buflen)
>>> +         dev_urandom_doesnt_work =3D true;
>>> +       else
>>> +         {
>>> ++#ifdef _WIN64
>>> ++          ssize_t nread =3D read (fd, buf, (unsigned int)buflen);
>>> ++#else
>>> +           ssize_t nread =3D read (fd, buf, buflen);
>>> ++#endif
>>> +           if (nread < 0 || (size_t)nread < buflen)
>>> +             dev_urandom_doesnt_work =3D true;
>>> +
>>> +--
>>> +2.25.1
>>> +
>>> diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes=
-core/libxcrypt/libxcrypt.inc
>>> index ba93d91aef..b93d56b4dc 100644
>>> --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
>>> +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
>>> @@ -13,7 +13,9 @@ SRC_URI =3D "git://github.com/besser82/libxcrypt.gi=
t;branch=3D${SRCBRANCH};protocol=3D
>>>   SRCREV =3D "f531a36aa916a22ef2ce7d270ba381e264250cbf"
>>>   SRCBRANCH ?=3D "master"
>>>
>>> -SRC_URI +=3D "file://fix_cflags_handling.patch"
>>> +SRC_URI +=3D "file://fix_cflags_handling.patch \
>>> +            file://0001-lib-util-get-random-bytes.c-fixed-conversion=
-error-w.patch \
>>> +         "
>>>
>>>   PROVIDES =3D "virtual/crypt"
>>>
>>> @@ -26,4 +28,6 @@ CPPFLAGS:append:class-nativesdk =3D " -Wno-error"
>>>   API =3D "--disable-obsolete-api"
>>>   EXTRA_OECONF +=3D "${API}"
>>>
>>> +CFLAGS:append:class-nativesdk =3D " -Wno-pedantic"
>>> +
>>>   BBCLASSEXTEND =3D "native nativesdk"
>> Should this go to meta-mingw instead of OE-Core? Shouldn't something b=
e
>> submitted upstream? This certainly isn't the kind of patch we want to
>> carry.
>>
> yeah I tend to agree, even though they are backports but the nature of
> fixes is very
> windows specific


Okay, thanks for your comments,=C2=A0 I will send it to upstream and meta=
-mingw.


>
>> Cheers,
>>
>> Richard
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#190994): https://lists.openembedded.org/g/openembe=
dded-core/message/190994
>> Mute This Topic: https://lists.openembedded.org/mt/102725680/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--=20
--
Thanks
Wenlin Kang


