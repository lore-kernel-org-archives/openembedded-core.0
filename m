Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5918EB64DC
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 02:39:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4523.1689129586180708940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 19:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=S+PKHfmB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65573a9d19=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36C2bBaH020393
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 19:39:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=ZKoceOmIcaqjdP8h2eU28TfkqxolEdM7HFfAKlkG8EA=; b=
	S+PKHfmByNqk6lte6FeOOrWNonzsk9C4Ze9WbNJCkI+01QgZZ9U/sZqB2u1lVzP9
	CTJaRhdAT6i7f4VHu14x87PrgaBovidrWMxAfOErlrPFo8QdHzDWAW0a+XVyAItP
	kJrAPeUgesHgTmilcuG9ehnOr54/hHUZN2OhSOBbB3hiPPNYVe66IjhFeVuf+8fJ
	5c9b1S0RJiQXGt6A/hwtbrwzbTIMb6oy9i1Ub+OEa22OISdG/Grxhd4R8O1rRqpd
	e+V7IsNHM3Gk96tQbu1G4QXvjmw5g4XeuK3v8ej5Wzc1/3o0HyFomqD13OfPDY5x
	F5V8ex5CjVlBwHxUyNiM0g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq7afavbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 19:39:45 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36C2djUP023498;
	Tue, 11 Jul 2023 19:39:45 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq7afavbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 19:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIORUV334QB02MOAfhT83c7GKbXgQ0D90dd+01whEACK5nbfXxePbJNIRIPeI7qunkanebN/4fqljuZ4vHShAITbVklbuJ7V9zI/7QGrtrZZwxQNJRXJQefN+nE9WkQjBhKv4zZE14LfLK4kYuOVF+rFjcTvy9zNC4aRzK0CPzcO+/0u1pMqtMc9727z/bYGqiQnmVYvok3KPjGBUhEV2vblhx4XDeH9rAD9El3gvZTKAYnYyu9gxf21Ki9NLsMhIimlJ3v8h1gqKSWYm6wcV9vFLh+7rf5Oze1mhKxfLerVn5DH3a7DmTpYvCVkzQyR8FhIcW6xNdIYR1LR88M/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKoceOmIcaqjdP8h2eU28TfkqxolEdM7HFfAKlkG8EA=;
 b=e4UC/EV8tX6uD9MSwiJbCSKo01W7SjZl3XIktA0CgvV/NXwtvA/AhWFF551N0BahRcV/XeyvwLcF0MOXzZQgcSTDqndAXORYtne1udZVxOOeRQ/xv8iRNQun5+1DQVLHo6CPNdk6WOLUq1AMZGRUfvo9Nt8cRocQ0E+pNR1daPhICLQb6VJr6YEk2UfhmC83nmPBRITsi6hMvHI1R88BJnj9wRp/0P2yK7M4UrHtLF2l/X0g2PvzhP9rXfTU0P6bFEPiCe9LgH4/zHsSCzsh9chdmWLNITEDQkpmY2133o94MUy4vos3drYmJP+KJGAeCXUUQ8pM4oWmjKO6FVTjoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 02:39:38 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::5896:32db:f6ae:c431]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::5896:32db:f6ae:c431%7]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 02:39:38 +0000
Message-ID: <8d04228a-e461-231a-6d7b-560b0671aceb@windriver.com>
Date: Wed, 12 Jul 2023 10:39:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v3] qemu: Add qemu-common package
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
References: <E57733DA-39D3-494F-A91D-9AA8306DBDAB@arm.com>
 <20230710103218.3834001-1-mingli.yu@eng.windriver.com>
 <20230710204725c6afc9b5@mail.local>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <20230710204725c6afc9b5@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::12) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|BN0PR11MB5709:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd68ff3-2180-4257-c75e-08db82813bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eEkz51RAs+Qabikut7jjU+IsZORQij9/82Hexy6awsfbdv+k6+MYhszYpW/dTqbs4mEnWs3yrGZ/sM7fXm+Cbq4ItsYc2koa4hqPjdf1JAyKIW8N9rP3ENytE5EI4MCUm9XKNJyJuKH2wPsepQ+obRQvTlowpNxiQnzYNUrs0K9YidMQC9/bGxF7p2FcS6/KArTH8HLCBwyWw7XD20mZ1fdZVapyJrv4QgdMN7StABNQU0AVv26H0RGPAoMV7DMkLD8z0K3JR5JVGTZ75k9/1Mf5fP8DGjDVWtCNBvo+JOzkhoKzzemOOe3lGLZfekmurcoc48LDs4FEbqT8MlyvLAbBYLTzAvv/aMTg7ujdQwJynZsVDTk59jbEHZ0ibJorNcn0C0RBVY+Zbj2lfaImp6dUhmMZ0+o2Oep3h0vNGCnCCKi4X6A7FoSUBNwU/lPZkPRchBsuXWUuzJq58BiS3SH35fBUfa2jmxSDDFUgFHPAddPsuIa4wTh5pvYzSZPuMD4E4avhcB+yJFE1vI4YUElWGR72qOEn6ogJaL4012a5MvEGBplPcOuu5eyIfaZh2YO6MOEyLzfb0rbExWqHDYPgtv8IOvDq3Sltnl8Q2LoVRj3cyDB/ZPFRtglCc2ANTnk7icSongZ619wFuABiIAxVq2oKG+yovVbNIf+jFEA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(451199021)(6486002)(186003)(66899021)(86362001)(6666004)(2616005)(31696002)(478600001)(110136005)(53546011)(6506007)(26005)(316002)(8936002)(8676002)(36756003)(41300700001)(31686004)(5660300002)(83380400001)(966005)(6512007)(66476007)(66556008)(66946007)(4326008)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aFh2czZtckliZmFLbklOcU1pQWZHcG9oTHc4ZHJuNjBmc0REZjFIMHhzVzE5?=
 =?utf-8?B?YnBlbFhsVWlMd1EvenQxcXNIVW92bmlvaUcyWGJqQk5nMklBUkl4NnJFcFdW?=
 =?utf-8?B?TFBOam9VSGJyRVJCNGwwRWRXRFJ1cmNRT05FUnQvVzNsdFFKWTE0UFI4a09a?=
 =?utf-8?B?NWRBMnB6UjRFeXNiOVFReDBqV3l6SjN5NEhTS0xhUmZwQ2ZGbkozLzdnc1pL?=
 =?utf-8?B?b0IyZ3E3VytGYThRdkZuSWlkbThMa3NKRmFCQlBzdUJjWE03UVFHMEdlWGVz?=
 =?utf-8?B?ZVJyeFRGRU1mVFRTeDlZQlNSYnN3emEzaUtyM25wQTFxL21MdlpXT280UWdC?=
 =?utf-8?B?V3N4UExsTFB1eXFlOXlIbTZBZGx5eGJWRCtVV3lnU2pMZS8rUi9iY1hMcHpi?=
 =?utf-8?B?WmVnYzFBWG1ZcXRodkpGdDNVeUJoK2dLM2VyMmpKbE55dEsxTVZJbU9xRjBv?=
 =?utf-8?B?b1VlVFpDTjIrWXRBMUdkUkd6RXNZdGJTYWJYbG9nQUN0dHJCK3QyMTB5UHJL?=
 =?utf-8?B?Nnc0bE03Mk5GSWJiOHE4MUU4YWFlekFkaXBqL2MyRWRscjJiV2poUUNlNzVM?=
 =?utf-8?B?K0pLdlNSNCt1NWpINjN3S0JVYmM4dHpWbmJoZEZCR1VldnpldjBCbk1BNklQ?=
 =?utf-8?B?V2JpaDhPWHVUQVp3d21xVnE3UTFlVnh6YkxyOGR1UXh2K3pQaXVHK1ZDRjNL?=
 =?utf-8?B?YTAvcGoxOWlERW1kbGlFU0grRGVzdEVPeTJTV05rSUlxWXlIR3h1b0U2UlNo?=
 =?utf-8?B?NS9VWUFMcHZsNG1MT1ZDUWJkSE1TUnY1b2ZzMHM1Rnp3bzRBQTZORnBvWjlQ?=
 =?utf-8?B?Tmw4WWIxTVIyeEY0TlQ1dndQS1JwNHM3d3dEUGRsTUtXM1pDV3NBY0lQTFgx?=
 =?utf-8?B?NjVrWHVTdjZPQmwvcURLMHM0d1dHUHJoVmJnN3IyWG4vamRtODRsR05mWnVM?=
 =?utf-8?B?VEdLZ1U4THBZSlBUUXJCUmZDRkd2d1pzdkc5allBSzdqMktNWVdra0pPQUZD?=
 =?utf-8?B?UWY4VGZsY3NsbVoxaVhqY0FiTHFROHRNQ1VKaVY3d1gvNk1OeW0xd3Qrd1d4?=
 =?utf-8?B?UUYyMXhGRkVDQmxmWW5vdVRJMXZuTmNWZHNVMlJBeXY3YjF2MVVFYkNjZ1Zj?=
 =?utf-8?B?K2d0a3VkMTJuUmhrSGd4WkkzY3NhQTNEdTBkY1VFRXM5WjB6aERRazhySDVK?=
 =?utf-8?B?VkJkUytqcXZTcWROdlR4bEgyamdJWEwrcExRSzg4K1VBeUw4YkZHNHBERVQ2?=
 =?utf-8?B?b0JlT0lEdkVGR1g2Y3E1K3VPTzBTeHB6WmJFWmdyb01wZHVvWm9ubkFoOGg2?=
 =?utf-8?B?L3hkN1RmbHE5Nnc0RW5RejZjbW5BeUhsdmJaNTFLN29teVlMU0RYMzJ2SGxX?=
 =?utf-8?B?VFphVlVmK1FSOVk1Qll1ZkpTOE9wb0RrR0tQQ3c1WG5Md2xQckdPS2xpWWR6?=
 =?utf-8?B?bTQrZ0V1bzVIRllsdVBXL1ZTZDhmSkRSVk9nL3YydFZ5cWkzd1RUbmRmOTRK?=
 =?utf-8?B?SnY2ekpMamJJSzYvYm9BMjc1WXlxcmhYQ0YrQUZCaWhaYnBLVy92UkM5MHVK?=
 =?utf-8?B?YVFxWEZmdDNOWHhsTFhVQWNnb3lKdUhVSjNVSHVoM0xsV1Jsa2M2UGVnamZO?=
 =?utf-8?B?bnNqUklPRm9ma2o4U1hwNmJ0ZitXemZFREhBT2NEblZHSXNQS294eXBkVndp?=
 =?utf-8?B?OVlMLzU0N3BQWFZwVHhVWGlNWFRac2MvLzlmcUNpVXNWdUJsT0xNRmlBMDJB?=
 =?utf-8?B?eXVCNXVJSERTMlBPVm54Zjc4TSsvSW5NemxPejhob3oxRkFxOEFkcFRyMFVZ?=
 =?utf-8?B?Kzh2QlNOWFJhWXpBazRFclpUMTcwZ2VRMTlmL2tPQVJIK29lcHVyMnFuNVZT?=
 =?utf-8?B?VnY1Yk9Sbkl6VXQzMENsMlR1MFdFNXZ0VHNEVlBVdE9RV0RWVE5RRGRTdGRE?=
 =?utf-8?B?REIyWGp4a29Xbmhidjk2Q1RRaDZIdmF6UkZ4WGZiVFdGbitub1ltRFA1Wjh3?=
 =?utf-8?B?a1F1c1IwYklxYStqWWJqd2xYbDd0WjMvWXFPMlppazFlYVR2R21KNlRzSXJO?=
 =?utf-8?B?ODNCOWRJUnlzb0ZtY1J4RHVwV3IvYjFmV21NcnE4REplWUxjNUVVWURNOFM4?=
 =?utf-8?Q?kM40bcwTc9T8O7AIQPhy0lkNP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd68ff3-2180-4257-c75e-08db82813bdf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 02:39:37.3016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ht7RS9NEMrgVegKfhTGETxSejnZMdNmwd3MXcUoWgsWxVOdyUBrWLvrpeUPa/Nn3BdZVqfb2rbTdV+JCcsurdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5709
X-Proofpoint-ORIG-GUID: 5VxBOFP5ONtYYpvNZmCNS85SamfdpHau
X-Proofpoint-GUID: ZMFoyE7b7o-Lzftw8GjAX8qb5KRTojaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_14,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1011 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=593 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2305260000 definitions=main-2307120021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 02:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184167



On 7/11/23 04:47, Alexandre Belloni wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> Hello,
> 
> On 10/07/2023 18:32:18+0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> We split the qemu package [1] to add support to make user can install
>> one qemu arch emulation rpm to ease the concerns who care much about
>> the rpm size in embedded device.
>>
>> But for the user who only install the qemu-*.rpm can't do anything
>> except they install the qemu emulation rpm like qemu-system-x86-64-*.rpm
>> explicitly.
>>
>> So add qemu-common package to package all thing into qemu-common when
>> not split the package, and package only the basic into qemu-common and
>> other arch related to each qemu arch emulation rpm when split the package
>> to fix the backward compatibility.
>>
>> qenu-*.rpm which is meta package rdepends on qemu-common and the available
>> qemu arch emulation rpm like qemu-system-x86-64-*.rpm and etc.
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=893846ead7ee54d53e9076150cd655e0c8bca5db
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
> 
> Please insert a changelog between your patch versions here, especially
> since you are sending v3 while v2 is under tessting.

Will insert changelog next time.

> 
> Also, don't put subsequent version in the same thread as v1, this may
> cause your patches to be ignored as they appear in an old thread.

Got it.

Thanks,

> 
>>   meta/recipes-devtools/qemu/qemu.inc      | 23 ++++++++++++-----------
>>   meta/recipes-devtools/qemu/qemu_8.0.0.bb |  3 ++-
>>   2 files changed, 14 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>> index a5bdeef66d..94624163d0 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -226,15 +226,18 @@ PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
>>   PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
>>   PACKAGECONFIG[debuginfo] = "--enable-libdw,--disable-libdw,elfutils"
>>
>> -INSANE_SKIP:${PN} = "arch"
>> +INSANE_SKIP:${PN}-common = "arch"
>>
>>   FILES:${PN} += "${datadir}/icons"
>>
>>   # For user who want to install all arch packages
>> -PACKAGES =+ "${PN}-system-all ${PN}-user-all"
>> +PACKAGES =+ "${PN}-common"
>> +RDEPENDS:${PN} += "${PN}-common"
>>
>> -ALLOW_EMPTY:${PN}-system-all = "1"
>> -ALLOW_EMPTY:${PN}-user-all = "1"
>> +ALLOW_EMPTY:${PN} = "1"
>> +FILES:${PN} = ""
>> +
>> +FILES:${PN}-common = "${bindir}/* ${includedir}/* ${libexecdir}/* ${datadir}/* ${localstatedir}"
>>
>>   PACKAGES_DYNAMIC += "^${PN}-user-.*  ^${PN}-system-.*"
>>
>> @@ -242,15 +245,13 @@ PACKAGESPLITFUNCS =+ "split_qemu_packages"
>>
>>   python split_qemu_packages () {
>>       archdir = d.expand('${bindir}/')
>> -    syspackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True)
>> -    if syspackages:
>> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.join(syspackages))
>> +    subpackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
>>
>> -    userpackages = do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True)
>> -    if userpackages:
>> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(userpackages))
>> +    subpackages += do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
>> +    if subpackages:
>> +        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(subpackages))
>>       mipspackage = d.getVar('PN') + "-user-mips"
>> -    if mipspackage in ' '.join(userpackages):
>> +    if mipspackage in ' '.join(subpackages):
>>           d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
>>   }
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu_8.0.0.bb b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
>> index 42e133967e..412c2bc7f0 100644
>> --- a/meta/recipes-devtools/qemu/qemu_8.0.0.bb
>> +++ b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
>> @@ -8,7 +8,8 @@ DEPENDS:append:libc-musl = " libucontext"
>>
>>   CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
>>
>> -RDEPENDS:${PN}:class-target += "bash"
>> +RDEPENDS:${PN}-common:class-target += "bash"
>> +RDEPENDS:${PN}-common:class-nativesdk += "bash"
>>
>>   EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
>>   EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
>> --
>> 2.25.1
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184068): https://lists.openembedded.org/g/openembedded-core/message/184068
>> Mute This Topic: https://lists.openembedded.org/mt/100054994/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

