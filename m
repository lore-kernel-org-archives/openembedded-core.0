Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C9EC77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:33:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.26616.1685612021852451437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=npVjQFKy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=551627edc3=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3517jtEg029876
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Jun 2023 09:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=FSfEeAUPMqll/uzCI8dyapF/wPrDUXgqlTnOgdMYWOY=;
 b=npVjQFKybJ4EJbDtkdOnHIIrhDc7OXEWpV3MgCdWRLXiICSkKengejCXoQ4OPzkS26mI
 5HO8O1910X2/5X1dmtiMH3XmREhyqXUTFrlKHRrlSRscNVtbiKta9f0DVuTreqEtVz3s
 gwt/mUQBU2HyL5pqeqF2TpCYjTkA/4GuNweaKxESDruxZ4pW1/EglV+LSlev6O6Iqsb1
 QZsMcY/LWD/VATpocn2/8XF7fpQlrkWhdpbrfiNShh5wlNFGww8dHzyir7FHG3x7M/dX
 0jkjbDn3KCxGdbYJcsE1QjtS3VPg4IRLUPY1Nr3ZrKEc1N5wdK1V2DCU/SwOUVTJT6Q4 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qu8u8mpw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:33:40 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3519XV39003348
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Jun 2023 09:33:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qu8u8mpw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 09:33:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZCmYW/h2Bvz+JMA5A8m0xIEavoU9rgU67Hr3al12TvLADFdZNf/h4uxak7bp0tgksclhpGevFgriQP6faOd7fTjeAnb2VnJ2x9cXC7hNo694atL3v6F11gsGEGqH1iS6BpuwKTFX3zt8h/c3qV133M/K6t/1ft4EaqZbrxD7oAhc5G5Bk1u4z2av2Kqe1Zkglw2NBkuYHWGl/iUMwCZbAestgz/FfLkvdYkDDOqJHfTzsq5Gte2+0mg54SDmNW7Tz538iYBSAZif8bSOXhdve1U1PL+++5dUOREFpCq1Fc0KdVnLbhCZvzroouUKxsnY+BWiHvE5BtG89mm+DNNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSfEeAUPMqll/uzCI8dyapF/wPrDUXgqlTnOgdMYWOY=;
 b=AWI2KHhL99666+iSjl5CDJMP6UPfDE03cTKluBH9Zklaa4JNkK+jkWnVTOvNzGREh3tj+m4tcbUhHAR4c9KRjhVUoBYQlTd7BaGi2rclUj8vc1vZQi+yXcpPcVnalHsPlXBjzDlp/cAznqrw328Xvur0yq1Hks43prkJ+EAyFKOjoLBBip2loJ6Ekbsupw+Wk77ULVtdbfT56bjTXe7deZktAOZ+BTlAhR9eag7PSS+3F/xGqtGpFgXkhtwP4oDZQj7ozDptsGl+r9z7nNDbqYPD4o24NOYx+YIGluwyrFeBeIT4lM/d+WcsNJQn6QZetdwY2fDET6Q8H2qBiWAQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB5075.namprd11.prod.outlook.com (2603:10b6:303:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 09:33:37 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::5896:32db:f6ae:c431]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::5896:32db:f6ae:c431%7]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 09:33:37 +0000
Message-ID: <199e4af0-7ec4-2abe-d4e9-d4eb648513d9@windriver.com>
Date: Thu, 1 Jun 2023 17:33:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] qemu: Split the qemu package
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230530131708.1916975-1-mingli.yu@eng.windriver.com>
 <CADkTA4MLkWsaiLWJoj_7A+2uc4TP13Zyp=JASyZnraNZqrTwsA@mail.gmail.com>
 <CANNYZj9xxEnyxEyWv9q4AY9Cj_zpw6fSyqc6uwLOwzkFYFnZvw@mail.gmail.com>
 <01fcd740217f9836f3d13deb15b77ea94910f62e.camel@linuxfoundation.org>
 <CADkTA4O6q8sB3QCWMOWpuxNFLUoSbiwCGxFZDMzrYTSzAPjJwA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CADkTA4O6q8sB3QCWMOWpuxNFLUoSbiwCGxFZDMzrYTSzAPjJwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0197.jpnprd01.prod.outlook.com
 (2603:1096:404:29::17) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|CO1PR11MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea87eb9-2d9d-49a7-fd93-08db628346d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uyWqppnXzo1LE3EnseHS0uK7BI2ux3LV/OA61QtU9bV8HvvIoX5QlGFGiWhzvLkrY2RB1TG8fZ81calc3AxuvEekkgvDvXmYgjYORFau4bEqAkqOHOFXkPFIWqj5UCbfyPgCippf3TJfUmO2hK/OuciUnG3aBOiPFuUMGkkM6TbO+7Tgxi7VJ3OX1+24bmLIKeKGFw0AONkBVyj+To+vcvx1u1cyItzqc2cGXMJdCaXDire/c4TLJv9MaonefY+ETGUsHK7eWPxfjQnFzp7YR7QKZCVNCQMtN2Qa9l5EprAAczv1IsjXgxG2cru02BoK+eaO3y0tdX8rq5xjf0+b5Eo2ftytOuSNOR+g/+TG+CLeHxLUhkyg8k5H7IUSjsErqWm3vJBrpOBIFvAjseV4dUjj54B2jk8K9fVm52hn3yfUMsnyke2l0XXkbQzPSk4aBjAuFk8wFgu8XF56IR0WPZWY/0dfIxSOcID/zK1KRJdJkCdawyEu0Nh5Ol8TL3mbFqAvxEeD6xIYAUTcGSqaIFRkvQa2Pl5XrJDNJWAS0aHN1Y+WrWXIe5dQR+R6JgUf/Gn5Kz7KO6lL+ev/PJWSzcPjhD+KPRjZXPdP/e369J/uoaRsUQ/CI7AJMBQyQM+BRtxfj2i6Eca4/yB2wbJL9SHaL7vNDCKnIbiSwmW1jFg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(346002)(136003)(396003)(366004)(451199021)(966005)(83380400001)(41300700001)(38100700002)(6666004)(6506007)(6512007)(31686004)(2616005)(53546011)(26005)(6486002)(186003)(478600001)(8676002)(110136005)(54906003)(66946007)(66476007)(4326008)(316002)(5660300002)(8936002)(86362001)(2906002)(66556008)(36756003)(31696002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STl6MmZhSUVNUi8yNkVoZEt5RUVnTFBnQ3JmMDRnaU1zcXI3ZnV2bDI5YUd0?=
 =?utf-8?B?WXFRSXN6NjdWTlRzUTZLL1VqZ1o4SkFYVDhRbjhTelJwdC95SStwanp4SXZ1?=
 =?utf-8?B?VXlqZmRHUXdmLzhTNEVUYUtUUFJMWjRYcVRpVmhob0RPLzFWNlc0WkFXZFhN?=
 =?utf-8?B?cHQ4Tzd2NFpYODBSbk16azR5Z3ZWMFIrMk1GYW90QUFKZmp0bUJuV0hVOUlT?=
 =?utf-8?B?SVlJWHdOaTFuaElvRmtOalphSmRzWjRabjh0OFphcnhobHhWNmV5cnR3bnUr?=
 =?utf-8?B?RHN1YVEwQmJ0RE1wTytYZWE0K3lQTi9aZGZRbFMxU0pBVTNTSGR6YzREYUZI?=
 =?utf-8?B?YjNLMWxUY2VyRGdDU1RxRVNMdm9GMUNPVkFoczBUV09lelphRWk2ZmdQZFJY?=
 =?utf-8?B?Z25CSHNoM0dZVTd1R2ZpcFppbitZR1EwakUrTE9JQWgxVnVIOWRYMVh3RDk4?=
 =?utf-8?B?UVNsNkw3anhieVQ1VGU1U2dZUE1HYmE0M0FDRC9QK3dKNnJLTmg2WTZSb1gr?=
 =?utf-8?B?K1JXb1ozOER1eEJMK2Fsc1k2YXpHSVRhbkJXSDlJNnd2V0txcUQwZGFnelJp?=
 =?utf-8?B?RjdmUkxkdjFJbjY5NDB3dUdCRlBqaTF3SU41aksxU2d1Q0JrRXR6UFU4L3Jw?=
 =?utf-8?B?VVdMMmsrQ3JSY2JMQ1hGMmI5WmhVa0dzbExFK29BeTFEd3pCTHd3NXpJLzJS?=
 =?utf-8?B?NmhHTE1RVlE5Z0hhcS9xWHpUWWxzRE9GZHZhN3B5OUZvblVKWVA3c2g1THhx?=
 =?utf-8?B?b1JyVU1RMEk2bk4vQmdKcitQVjRGOEdZK2FRbVZ4eWhJYVZ0Rzg0N3hyUjEz?=
 =?utf-8?B?U1ZPeG9CRkNYRk82NENaVVVUTmtSSysxSmtrZmFPZHNjTkxOaWxqZ1dpSnJt?=
 =?utf-8?B?Z04vU3ZkeGxrNVNLemkyYkJiL2VMbVdPMk5yTWZpRjdKb0pEcm1ObUNZR3FY?=
 =?utf-8?B?bDNZc3dnK3dMaitPNis0TGJRWXhWUWdpRXIvMHlUZmJCSkdGOFEzKzNvRGR6?=
 =?utf-8?B?cStSSitXSSt1RS9vYjFWZnJZVGdrREZ6TDRFbmw1SmN2ZTdrWWJKWk56UXAy?=
 =?utf-8?B?aTk3V0gxdVlhdTc3Q3h6V1dwYmxvRE9idjNuOStKa29lSjFvZzErS0hHUkVW?=
 =?utf-8?B?OXZCMGZjUFl5TDZUVC80d05rcHFPMTVsc3J4L0YzRXdTRnh3Y0hkZ2ltNzdM?=
 =?utf-8?B?d1lsSmRKRm5WVytCOFJiWmNwaU5pRk9kbCs4UE9jMkpoRU80c2RXeTdlTlhQ?=
 =?utf-8?B?STdyamlDT3JRQWlCeGJ0dE12VnMzeCtsWXk4RU4yVWZGaVhIVExBcUlnQjNT?=
 =?utf-8?B?UHFCaFJEaGwwZGdmMmd4U0lUeFV0K2JnaFgweWlCNUJxNDE1bEZpVnVycnlD?=
 =?utf-8?B?VmpjMGx0Z0dWQzgwVUYwVnVUU1d2cUZ1VUFValhBekZTNWpGSGZERHh5ZDBy?=
 =?utf-8?B?Q09MZ25vWWNFMVZjZFBWd2t0TmhVT3pVL0RRMXdSaG1kU3RVRm0rQlRRMUQw?=
 =?utf-8?B?bnFUa01sWWxjb1Y5U1RsTkk0bDl4d2tYVUNzRlBxWWhvaWtPV05mNERDWStT?=
 =?utf-8?B?dkRVTmlKamNhWUZ0WWxrM1Q5aUVNY0sxUUNLTit4RkV0cDR1bzNYVjN1Yndr?=
 =?utf-8?B?Ylhjc3pQREFnalVMcmM5eSs3RjZkQlZ4ZGhnQ3ZSbHRmV3EvQlNpU2JJV1VM?=
 =?utf-8?B?b3ZxQTNNWEFnR09HZEd1OFFGMVA3aitDUzBkVDlPbFFKalBneWJyU0YyVWc3?=
 =?utf-8?B?VkVwV0VRc1A2YS9Gd2xpNldsLzBOYkZIU1dzR2F0QlhKL0YvZS9zVFpaZ1Ix?=
 =?utf-8?B?a1ZlcU9wTjU3M3lQM04xWk5hSk9YK2JjUWFDdFdVMFZtdzhNc3ROcjk4aU9h?=
 =?utf-8?B?VkVoOVAzVExMczQzMFZsdVFiOHdhYkFuTUpvUEJXekNhWnRwd2pDZDhkaDlX?=
 =?utf-8?B?cWtRb3RLYjUwUmhyQmJWOVA0Nk5YNXV5NjgvNmZzcWtvT0UwRHhVNTBaUWx3?=
 =?utf-8?B?WUpNMHozVXFhOVhKSW9pRUNGUCt6UU52d2hJbG9QeWI3c29tbXY1WW9ibkpU?=
 =?utf-8?B?R1RmbllkRVRqdE5FUysxQ29Zb0sxZ2lYZTBhdW1ZY3RJOXdiMlZiYnZIN1BS?=
 =?utf-8?Q?qkjuCbgtdlueMfISjOWFCbrvJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea87eb9-2d9d-49a7-fd93-08db628346d4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 09:33:37.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcnSSJvbH5Eul6jDy9GeusXfEG7PBbZOcgTZR+m/Fqgp9gTIkojQCOKDI3Y5OR+M5hbz/LeG05zZLO3atvs1Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5075
X-Proofpoint-ORIG-GUID: N9-7_jMJzwoZEkMhxrlrmVyNOFccS7wH
X-Proofpoint-GUID: 8BO6D1z24YbbtLcgQwfNBPo9GyQ5Ep92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_06,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010085
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3517jtEg029876
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182094



On 5/30/23 23:09, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On Tue, May 30, 2023 at 10:54=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Tue, 2023-05-30 at 16:33 +0200, Alexander Kanavin wrote:
>>> I might be missing something here, but can the free-form, anonymous
>>> python code block be avoided? Don't we have PACKAGES_DYNAMIC for this
>>> purpose?
>>
>> PACKAGES_DYNAMIC is for when we can't predict the packages a recipe
>> might generate. A good example might be kernel modules.
>>
>> You're right that we could add a do_split_packages() call to the qemu
>> recipe have have it generate these dynamically.
>>
>> The downside would be the namespacing as dynamic packages need to have
>> specific namespaces (e.g. kernel-module-XXX). This means qemu-mips
>> wouldn't be an option (conflicts with non dynamic packages like qemu-
>> dbg).
>>
>> We could use a more specific prefix like qemu-system-XXX and qemu-user=
-
>> XXX and use do_split_packages
>>
>> I did also wonder about using more specific inline python for some of
>> this, things along the lines of:
>>
>> PACKAGES +=3D '${@" ".join("qemu-system-" + x for x in d.getVar('QEMU_=
TARGETS').split())}'
>>
>> I'm also not a fan of the python code block.
>>
>> We do use do_split_packages() in other recipes like gstreamer to handl=
e
>> things like this.
>>
>=20
> And in case anyone hasn't looked it up, this is the meta-virt solution:
>=20
> https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/=
qemu/qemu-package-split.inc

Thanks! I did see this before I send out=20
https://patchwork.yoctoproject.org/project/oe-core/patch/20230530131708.1=
916975-1-mingli.yu@eng.windriver.com.=20


Considering to dynamically generate the sub-packages via QEMU_TARGETS,=20
so I use a python block and don't need the change the code even=20
QEMU_TARGETS has some change.

But I should let all sub-package to depend the qemu-7.2.0*.rpm.

Thanks,

>=20
> Which I'll have to re-work once (if) something lands in core.
>=20
> It isn't suitable as-is, but it doesn't need any python code to suit
> the on-target system emulation needs of meta-virt.
>=20
> Bruce
>=20
>> Cheers,
>>
>> Richard
>>
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

