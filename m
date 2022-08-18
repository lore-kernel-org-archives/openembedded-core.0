Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8540C25B08
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 01:54:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37054.1660787661641841583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 18:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=BJeDtk7f;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52292b5a13=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27I1a4LE024583
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 01:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=/Npvr2aixN87fd4k6sqK1QGoktVFUmEVXAG4EDX0SiY=;
 b=BJeDtk7f1jNXY89cKCe7YaKY/NlpyTjOSNMxCyuk+OzBasCYvosALsogLHgroFdnBUOH
 8azLsV8eRYdbBnIiv5+XfEwbfTI6EPY8zS3e9bRcXB7UkIZmr0fkplJtJjsbFqmZjXo9
 THeInAJy4TEjHXW8crJ0vz+UrhEsA3NyhromUukb1L35QjdHXG3Z9b3Z5/mcI3EubRaI
 JoIar2U99rLkxzZqbuTSUuDVh7RnePP/orA71b88TRD/++dyXgE3O4bla/LzB28lhAXw
 R+YLSdLNbeuKrgCWSzxojnzw/aFis+IHs9/2eHR8EQu+K2iju/r7ovKKmwTZY3tYg8BO 9Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160v1qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 01:54:20 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27I1sKVn025178
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 01:54:20 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160v1qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 01:54:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDt7lbzy+UD55CWkKNcXe0PThyQdN33wqGhPL7ut6G4LM/CXXZafFCPgf1OuAED60CxFIWkgt7zr+n/akOVZiJY0QAs+juCS1yWE3asVlcyEV3bVmxkxpViXM5Oy6JI1BxUqvgj20XTCormi2fN+WOBBWpVLvbGmaI23f+CtoR1Zg4cy6/59Vxts0gIGnBPoZIBpYeErGf8CogMXDi1M1z7biZbkxcIlUktY8TKV1IymmPc1d2xBg0JJU6l16skADSn3XlUYGCfQ/e8YqfwQ7Z89GRpgdr5caTPTSB4nJOnW88nps4d5/wlDc4CTeSFpV+cPfs3jD72b5QrYR3/Smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Npvr2aixN87fd4k6sqK1QGoktVFUmEVXAG4EDX0SiY=;
 b=dWvuYpmQ5EJZu2WNn1cwCpKT2yUc3UG65BE4zzTtxRRoLMqM4hqg28auBoVK17j3ApAbSv2dSCvDP/CWZatTCdlRFUlH0yWuHbPiW6evy7t4R2X3oTnibdHnFRRiXW3km7M9y4Mw+zzEmPIoZYynqlU+4nfOiH8c2kTXeIV1TwWMPbBTTy3O6SOyyZxeVfpMLtFx0FiGrRKioJE0zXcV6UOVTsMslBXAQPS8nPwZ1sZM5iU60kAkp1N/WkkxJbw6zPfFtrBWLwxqbrHriXqFjcZP+TSJX4YuoA8Q2ZkSFZLs9/8rYRUardq6SEZUIg6lRNretOPh2yGhQnHAMG4/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 DM5PR11MB1785.namprd11.prod.outlook.com (2603:10b6:3:10d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.19; Thu, 18 Aug 2022 01:54:18 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::d0c1:127f:313e:e8f9]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::d0c1:127f:313e:e8f9%3]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 01:54:18 +0000
Content-Type: multipart/alternative;
 boundary="------------Vb8eFZcUTQa1MhmY45xoAQD6"
Message-ID: <a7721619-50b8-8d35-b392-3fd5088ee5a8@windriver.com>
Date: Thu, 18 Aug 2022 09:54:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] distrooverrides.bbclass: use IMAGE_CLASSES
Content-Language: en-US
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20220816075432.22347-1-kai.kang@windriver.com>
 <CABcZANmYBerOcEo9NRhY43w8SQyEKsbdSMbgMwFh81Rh1u7Xhg@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: 
 <CABcZANmYBerOcEo9NRhY43w8SQyEKsbdSMbgMwFh81Rh1u7Xhg@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::20) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d46ac6a-b14f-48ac-f454-08da80bc8f9d
X-MS-TrafficTypeDiagnostic: DM5PR11MB1785:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CX5cFmYcacMJybdSjUS15XB2MeQztbFC9wmtvWZGaa4Jovbhnyya2R6oXKLNbFc6Hut+V6LcdvdlVPoOyfVJjgpWu4Fa3SWoRzV2Ag9KCInWX4VxRye8McwNyfaQN/thWW8SN7A3p7yScBqTbyasR4zcPYHR0Q9GYA77XZq3QW5gf8ABprZfhb7z1hCASM65LoXm5ntYUeQM7En9R67ODzEuDx32dB539YG1DIQE0hB4UsSNMaUoUxiyU+ZgRulajvWAqyCuCiHvo8Ql5k6qa50f1usQxY/EvxVTPzxu0FUX1lLvQOnPFRhYbAgJ9N20uwP2/uqcmk9esG75UYpPNvSy2wv+x1fwC408uGhY3rkYqrLSPfPDI5nWvP7HJ13R6r5EOyBrwOgiERwnqSzECe6Qs8TSUSeo73D/MK1tTaGgCX+OrMwZqaQ6qZzUma36p5a8MAPUm82vl5hHQZLYrBYvk9wKpRJ+b3ma7T4YvgfbVElZyOCzUZ1B/rPRS+b9HV33myjZ6uGmOcNzPLRraERs7bC8c0ifhnP4Ds1n9Z7HbyunmXrWML/Q7vbmiklgL5TgUA9Umb231lnKQNLJG6VGDSGsSPzOrpd89vugz2E4nCcQqSR0XE7f8eu5uyxEu+tUVV3O6ihP7VFkONFzepVhH2esvCgh2uKn/bXTxxNB0lXd2MuORUHx/FllZ4+dGn6QVpZHKJFySOjIdWBpmBH5hXQroPC3ZnYv/vXkO80DQ7EE62viKJ5pxU3jSUvs7X+sUvSJ02a1AOoZrNZVEy4eXNHEEqZLuBEble9XLs+SyZDQKnoX2Lngi0KUCrhsLSV9JYN2z7QvUut+nbBhYTjEqnRwp7OadIkqA7YYYAQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39850400004)(366004)(136003)(5660300002)(478600001)(36756003)(166002)(316002)(6666004)(6916009)(41300700001)(4326008)(2906002)(6486002)(66946007)(966005)(31686004)(66556008)(8936002)(8676002)(66476007)(31696002)(186003)(33964004)(53546011)(6512007)(2616005)(26005)(86362001)(6506007)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SzRTbVZJQmc1OHB4WWZ5Mks0SkZhaW5qcldtQTQ3d2IrN0FacmIyakhVSk95?=
 =?utf-8?B?ZGVxUk14UGoxN2VxZ2V1V1p6bG90bUZ6M1ovNzBuWnhDVkl3T0Q5cUlvelhn?=
 =?utf-8?B?Zyt6SFFnSlpJQVNTa2plUlBnekRGUXBtRi9WWTlWdnozeDVaaGg1czA1c1RP?=
 =?utf-8?B?TFNBNWpTQkxWL0o1K0l1akF6bGVjQjVmNXBGNk9IdXM5Mk9oT29sNk9DRDRR?=
 =?utf-8?B?czM5T255NDBwOXJOWCsxVlFwVGRGUWtCRW5MMTF0aFJlQkczZVZmYi9qQU1x?=
 =?utf-8?B?dU1JTFBNM0s5YWRZYVdlNmtZV0Zld1cxYkRYUXFsOGFweFc3V29RSytNdWJr?=
 =?utf-8?B?UmUzSklocXhHdk9Hei9jVkZpMXp3aDc0NmdwbXY1dUdSTVRZbVNnb3diTVF4?=
 =?utf-8?B?S1pFNWpBbFowbVVDRCsyczh3d2hnY0dpaDNoamYzNmNlQ0tGOEJDTmhvcmIy?=
 =?utf-8?B?T1VFaHJnamVvY2QvSlR0UTA5YjdMU3R6cTRCdWdNWkw1NHNtTUdqNTZLSU5i?=
 =?utf-8?B?eHVmamdPRFBjYWRlQjR1ajVtZ3ljRUViNVFMakFlMGZSdHBlWFlET0piTG4w?=
 =?utf-8?B?WmM3WGcra1Vzb3JRbUVnZEhHQUptL1RZeUErSlhiaWZBT2tTNTlIeFQyY3o3?=
 =?utf-8?B?QndXczJYeWd5WkRONXB3cHRpcEZMVDhZRXhrWG5qazJwNksycmYwbTBRUjdq?=
 =?utf-8?B?RFVWTHZsN1BVZWoweUNZd2FGbnhhSHAvZm9GTGo4MnZFZFZPbWNjOWJRbm1L?=
 =?utf-8?B?elJ1SXlCbVlkUVJWRXYvd2xKUythNm8vTHA5Tk1tNEg5SVFzZmRCa1NpVHBJ?=
 =?utf-8?B?QmczbUh3anR2QzVwYjc3Y0Y2cm8rOWxkcmFIL2hoejMyZzFRNkZiQkt1Mkt6?=
 =?utf-8?B?bjkrdm9Fdm04QmUwdWhtZ2pFWmE2cmE3ejJoSTVxU28yb3JTSlh3U01TSVI1?=
 =?utf-8?B?ZXN4SW5hcmZoRFZ1aVA0anJ4aWZYdkN0aFhpWXNOcTl6UHQwZ3dOUEZGazhp?=
 =?utf-8?B?ZmVzREZaL1UyQzlQRFlmMXFDbCtJdGt3R2tOcUhaZG5mblBrWmpMMENZTVk1?=
 =?utf-8?B?R1VhS2FZVmZHMkxtLzEzWEJJbE1COWxDWHBPQ0t2TnZhU1pLeFFpL21YcnlS?=
 =?utf-8?B?RmZoS1V3R0ZISVlVZTJ0K2hqZG1WYXZLMjB4cHhqTnExdzFTMzQydkZkTVgw?=
 =?utf-8?B?N0VBeFFqZm02Yjl1RmRPZTVCZTRUNEplSHQxT1NkSmZmRWR1eVM0eE1QV2N5?=
 =?utf-8?B?UURqV3A5MTVSczc4L0YyTEE4bkk4NllqdUd5bFAxMlhTRGo4bmg1cmNVWWsy?=
 =?utf-8?B?TWRCMDZzLzRRQ0N3WDN3VWplTGZXRnJUQm83dmYzWXdwbmVJdjdyd3d5aDdI?=
 =?utf-8?B?YjRPYWZiSzJWZFFvb1RpaVUxMEpLTk1QK0tmRVJIYm1WTXNPd3dMbDRNd3I2?=
 =?utf-8?B?YS85TWtJZWM5akg1YjVLWHlDbktaeTliU1A5czJGNUFSd1AyZ01IcmoyQ2Y5?=
 =?utf-8?B?VGdTNmRCbFFNcWhpNmpwcWt6bllRa2luenZaM1M3K1g4OEVTVHJBdVF6NnRK?=
 =?utf-8?B?WGJPQjJScUtrOHFFUjRHUkZDMmpOU0YrWVdNT0M4UWxvRFRyaWhxaGF5aDRX?=
 =?utf-8?B?NFdINjFJNlJkbHJVdTRYc2tsa3dadTdGTlV3clpzOGcwVFpOMlZTeU5MUmlC?=
 =?utf-8?B?Vk5OYis3VW1KV2U2WEhhR1VuZzZlcVVBRFo1dksrUzdqOHh5eHNEdFRiUVNq?=
 =?utf-8?B?ZXZLMUVKenM1S1h3YmFmUVdmQlNlMmNlV2JDVy9kYVpjSnZabkdtbnkvWGNG?=
 =?utf-8?B?YnNhK1RIZUNEM2dONzVCcitLckhmNmZ1aWJ0NTRMVnIvcTVRTExwQ252WFAy?=
 =?utf-8?B?eTMwYUxZTG95L0NWSnB3QktadU85MklSSUNudjZQZ2xMUjdnaUlsS1M3MFJx?=
 =?utf-8?B?Mlc0SDlWK05aWDNSWUQvUmZpUXlkU0RMREhhbVJNQ2p6RHMvN1lkb1lPZlYw?=
 =?utf-8?B?VHBIUWtYRHFlU1IyU2Nuc1BSdVl0ZTA0bHpZa0pwY2d6TFgyQW5PUnhZRGhw?=
 =?utf-8?B?dXpTNmU2TnVNRHB0bHJFc2ZUckNiRWFXRzRDbTNhMVRBdFo5Nmw0QXdoWWZ6?=
 =?utf-8?Q?7faaGgnl+gaPR2mFKo+2TVVys?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7d46ac6a-b14f-48ac-f454-08da80bc8f9d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 01:54:18.1952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Org36Tbl+YmWH6Zo6jjGrs+E22H+oTKdS1f4Ii94j+MW7PPL2QcF1wHn35Eu7QHFlt/GgOdPwKr02tgJN8X2KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1785
X-Proofpoint-ORIG-GUID: 0QSZVubKZ-Bl5Y4g44N-C9yFBP1WZs1D
X-Proofpoint-GUID: tABDlGvm2uaXKCeTnNbUiqxIP1F0z9uj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_17,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 01:54:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169511

--------------Vb8eFZcUTQa1MhmY45xoAQD6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27I1a4LE024583

On 8/16/22 22:55, Christopher Larson wrote:
> This class functionality isn't limited to images.

If not, it may need to move to classes-global. Otherwise it fails to pars=
e:

ERROR: ParseError in configuration INHERITs: Could not inherit file=20
classes/distrooverrides.bbclass


>
> On Tue, Aug 16, 2022 at 12:54 AM kai <kai.kang@windriver.com> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com>
>
>     Update comment in distrooverrides.bbclass to use IMAGE_CLASSES rath=
er
>     than globally with INHERIT.
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com>
>     ---
>     =C2=A0meta/classes-recipe/distrooverrides.bbclass | 2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta/classes-recipe/distrooverrides.bbclass
>     b/meta/classes-recipe/distrooverrides.bbclass
>     index 8d9d7cda7d..b5346b465e 100644
>     --- a/meta/classes-recipe/distrooverrides.bbclass
>     +++ b/meta/classes-recipe/distrooverrides.bbclass
>     @@ -17,7 +17,7 @@
>     =C2=A0#
>     =C2=A0# The class is meant to be used in a layer.conf or distro
>     =C2=A0# .inc file with:
>     -# INHERIT +=3D "distrooverrides"
>     +# IMAGE_CLASSES +=3D "distrooverrides"
>     =C2=A0# DISTRO_FEATURES_OVERRIDES +=3D "my-feature"
>     =C2=A0#
>     =C2=A0# Beware that this part of OVERRIDES changes during parsing, =
so usage
>     --=20
>     2.17.1
>
>
>
>
>
>
> --=20
> Christopher Larson
> chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
> Principal Software Engineer,=C2=A0Embedded Linux Solutions,=C2=A0Siemen=
s Digital=20
> Industries Software
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169439):https://lists.openembedded.org/g/openembedd=
ed-core/message/169439
> Mute This Topic:https://lists.openembedded.org/mt/93054585/3616933
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
kai.kang@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Kai Kang
Wind River Linux

--------------Vb8eFZcUTQa1MhmY45xoAQD6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 8/16/22 22:55, Christopher Larson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CABcZANmYBerOcEo9NRhY43w8SQyEKsbdSMbgMwFh81Rh1u7Xhg@mail.gmail.com">
      
      <div dir="ltr">This class functionality isn't limited to images.</div>
    </blockquote>
    <p>If not, it may need to move to classes-global. Otherwise it fails
      to parse:</p>
    <p>ERROR: ParseError in configuration INHERITs: Could not inherit
      file classes/distrooverrides.bbclass</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CABcZANmYBerOcEo9NRhY43w8SQyEKsbdSMbgMwFh81Rh1u7Xhg@mail.gmail.com"><br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Tue, Aug 16, 2022 at 12:54
          AM kai &lt;<a href="mailto:kai.kang@windriver.com" moz-do-not-send="true" class="moz-txt-link-freetext">kai.kang@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">kai.kang@windriver.com</a>&gt;<br>
          <br>
          Update comment in distrooverrides.bbclass to use IMAGE_CLASSES
          rather<br>
          than globally with INHERIT.<br>
          <br>
          Signed-off-by: Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">kai.kang@windriver.com</a>&gt;<br>
          ---<br>
          &nbsp;meta/classes-recipe/distrooverrides.bbclass | 2 +-<br>
          &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
          <br>
          diff --git a/meta/classes-recipe/distrooverrides.bbclass
          b/meta/classes-recipe/distrooverrides.bbclass<br>
          index 8d9d7cda7d..b5346b465e 100644<br>
          --- a/meta/classes-recipe/distrooverrides.bbclass<br>
          +++ b/meta/classes-recipe/distrooverrides.bbclass<br>
          @@ -17,7 +17,7 @@<br>
          &nbsp;#<br>
          &nbsp;# The class is meant to be used in a layer.conf or distro<br>
          &nbsp;# .inc file with:<br>
          -# INHERIT += &quot;distrooverrides&quot;<br>
          +# IMAGE_CLASSES += &quot;distrooverrides&quot;<br>
          &nbsp;# DISTRO_FEATURES_OVERRIDES += &quot;my-feature&quot;<br>
          &nbsp;#<br>
          &nbsp;# Beware that this part of OVERRIDES changes during parsing,
          so usage<br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
      <br clear="all">
      <div><br>
      </div>
      -- <br>
      <div dir="ltr" class="gmail_signature">
        <div dir="ltr">
          <div dir="ltr"><font color="#333333">Christopher Larson<br>
              <a moz-do-not-send="true">chris_larson@mentor.com</a>,&nbsp;<a moz-do-not-send="true">chris.larson@siemens.com</a>,&nbsp;<a moz-do-not-send="true">kergoth@gmail.com</a><br>
              Principal Software Engineer,&nbsp;Embedded Linux
              Solutions,&nbsp;Siemens Digital Industries Software</font><br>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#169439): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/169439">https://lists.openembedded.org/g/openembedded-core/message/169439</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/93054585/3616933">https://lists.openembedded.org/mt/93054585/3616933</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------Vb8eFZcUTQa1MhmY45xoAQD6--

