Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE2CC54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 09:31:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.37041.1675071057104322084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 01:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sm/P8Uex;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=139497dc38=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30U98x52007964
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 01:30:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=XZVHBwBxmqwXo0+7YEPAx9/3knNx0+LY5tkP8S1ynSk=;
 b=sm/P8Uex5Rdebfa4eStUILEHsm8MHwg840XzORLPECaYC2wn3re6Q/Wlb0NmlCKR8GDk
 +gkWEl2Itoh8bVK9b1TAjS4D6BOLKENjkR/l5cU0p7eG+e3QYMPWdXkZgiXyxOJIavPC
 dShDFmk0K3sE5pnSbcGahreV2ubTG4mGnuHQ1hcO/JsyB7woDh0F5XxUIK/QiL8ewFt7
 aDq6M5DX414VADj8WpeYprFx8t77H41ioHg96ddjfBYHdPFnh71j8bvWOrkOUXs5aVlU
 //jYW8ZIbpyEYtP9ENG+rEn/2y9+jmqnH1Umibdjcox+EZL/2PguUJqx+8rvS3U4g4Vq FA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nd43rhhmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 01:30:56 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30U9RpwN016081
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 01:30:56 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nd43rhhma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 01:30:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzIyxtbWxem+hHiuuT6sSX5AhcJBFc0hrrAefKUqYfmCzPkkWE7RMRgxBdx/yvdeQnP/lOLNb/q4P6UrGTHYgYE6y0m+stMazvYBnymHCR51eZE/HTDdnCrtADOoOQKa4wkRC8lv8w0r0A0VnpKveppz2BtJOYXtxIk2f1nCqBDaCSJ/didDXPdvpdyyxaN3NHO6jqmg310m1yvGajNWgG8Hb8HAjEhN6DomhB63GnPfitBl3N+yE3FA/OhTnqgy43gwTkrhmQwoA26nqzT9uv1YDkY83IJDJAStSuozixFi3lwKzeGDlEJh6quLWreAYUZF0mjGbIUql9qI0sIgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZVHBwBxmqwXo0+7YEPAx9/3knNx0+LY5tkP8S1ynSk=;
 b=jOkaA5pq4kbqiOEbtdcSMQWomB0wRKxme9ogPzuhG/d/NPjKsYRuq3theUJKRFlEgQGfPs13AWiDvO4tp+P0gD/2dLux599DyngXO1nwUIGL7DDSaG2wva2ZvbploXBz/W6nLxUKFFteut4qGTNbLHcfMnP8YlDQbwdydaZdpVZirHx+yqpEknc/2s7Voi/R+41AirMbPkq6YmzP8aNwOpAHqFnmfav8oPJdrti+J2ck37A4enqcy+MPpw8PVXzeeIgMhjbud8kPUtReA/W7aoUHCHNaj8QQ7kqlmGfpAXDkI/FOK92tib2ElZKAaIK+EJrFgNkXFkK+5IyjZ/wD4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 09:30:52 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:30:52 +0000
Message-ID: <0d9e690a-3221-0fb9-28d7-20360040c6b5@windriver.com>
Date: Mon, 30 Jan 2023 17:30:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] libportal: add opengl to
 REQUIRED_DISTRO_FEATURES
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230106100806.838732-1-mingli.yu@eng.windriver.com>
 <CANNYZj_cxDBBbe3mz3R5qiiqeSaiQp-Q6Sj_druYWbXcxeFDVQ@mail.gmail.com>
 <44949595-157b-943d-f248-43b65c1e0d9f@windriver.com>
 <CANNYZj87-0q6qg19Ph_Tkhu5cF_n=Gw1AMVRb+_ch=1Eac+3RA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CANNYZj87-0q6qg19Ph_Tkhu5cF_n=Gw1AMVRb+_ch=1Eac+3RA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::21) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce9a84b-ce08-49bb-710b-08db02a4ae02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I3s/r3O/CYl8oKVOxfajxZLaI56NijrjZmHVD4JSV3QZeR8ASNv9ye5NEQ7Er4xq5Y13SUTDKsf4cmAGPgHU2uFRnYvJmQKV6VcsCAMXImUBufC0/oSrBB4hZu84ZWL48clcILzHdJdW48ifMR6f3hDn+onTbD/xUMi+IYojbvt37TGue6ocz6aZ6DhbbLAWKFOI+lXXL5KrCeml3je0b67Qi0yEpjk9gkPG/oMfloWv7xPIZwpejfCKGGP3ajExNemNUYZEus0zoOQIQtIDz6kSjA1O+zGdGhTvw8qVp8h4pBODMNknrav1n+yw0OHV44s6cBdQ6bmaJOuGM/VQ14QtXRSiZSIGoUItWudwtVRoDX39TvrdCG7n0dIxWh9uHxLtgaewkuVnrj0zDSB8p/rr4pkg3HvtsDhhyFu3lQTesnnkitGY6IvRJpRPhFXtSdHQ4OWhc84qhSmG1e9MRLNT9xsoOaybll/rESoRzm2//Zegh+hyXDvKa6ZB7xNUMSczVIueRn0n4yHXtMeKaDqCYe03yMbYd4krIVEQu+q71WHudNAdLfZKFw8M4YGnfRMI16wDThUU3MgtjfenAZCKzfgEgXbsCP3e9F5nE7DqcbvWFZcTlFIvAMVGh01GWiG8PIR+Tg3E3Uk4OVnRPN805awsYaAJfOIaJaN6Y3Wzgiplkv7OpMk9+VWdiGsUrmSXyKZVKqsX1EUOKtLl2EdUJIZ/yC2+qZ2Ehx02zBZfjCOHXGxaFW3mz1g/4wh5wmUAVeX3hlXupnHwvTZieQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39830400003)(346002)(366004)(376002)(136003)(451199018)(31686004)(36756003)(26005)(6512007)(38100700002)(2616005)(186003)(5660300002)(2906002)(53546011)(966005)(478600001)(6486002)(6506007)(31696002)(66946007)(6916009)(8676002)(4326008)(86362001)(83380400001)(6666004)(66556008)(66476007)(316002)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c3BFekNIUFpZUGNjSlV6NWR5TStLMkV6ZVV2L2JRMU1MS1l6d3RoYmxEQlN3?=
 =?utf-8?B?eTBXdkZyKzFxaEJmYVdwcWcxNlhjeGJ1OXVrVVRoNTFNUnJuL2xJRm5aK0Fs?=
 =?utf-8?B?U2p4bG43eUJReGNiRUEyMUVMcDdudGZCZUhBSVUyUVFRSFQ4M1VGZUE3MEVp?=
 =?utf-8?B?TUswbHpkL0dTemxTYUgvSFhQZ2YwR1dmZjVnTTFIaW0rOTNUQThtNTROWE03?=
 =?utf-8?B?TUJBbU5zQ0EzbytVcCtVUUJETTc1UjljTzRtSVVmVFlmVW03bzd0WmIxY0E2?=
 =?utf-8?B?ZlBaRDVIUVNFdEwyd1FnZ3dKb1UzT0p6MVhoS0lCRm82WkdCelRudlF5NnU2?=
 =?utf-8?B?aForTW5DdTh2TnNEYml1SFNOejNkQVpGaWpCaXVZVHhhd0phd3o3VlZoTUhB?=
 =?utf-8?B?Q2huOVluSXk0SWplN3ptd2pWalhvdTBXbDJ2ckhpRmd2OXNpRlNzT0pnditj?=
 =?utf-8?B?Rkl3Z29wTnd2SUlTQkd6RGhhT3RTUTltVi9yTllnaTIzS2plM0hlMEt4K3NE?=
 =?utf-8?B?M2FlaHIrTGwvdGVBbUJDSGNuNzFPRHoxYlRJQmFGZlNMMXRteDVURDM0U1B5?=
 =?utf-8?B?RThFUk1Zdk8vZWVubHFQcHR5Q3lrM0F2WDdZN0ZGM1dSeENDcGhXVG5tbGVt?=
 =?utf-8?B?cWRpUXZHWDZ1TTFZU2t6TTNiY2JjNmNXcG8yUzl2UXo0RVk3MkltMWJHc0xQ?=
 =?utf-8?B?dE91MlNPTnBUeWlvNDFEWkgxYUczZ05XcXl3TGxXemlJUW1DdVhkMVFzTHV2?=
 =?utf-8?B?MEYzN0dMTUlpV0k1SjBJSVhlMmhVOHlFV00xRW05Y1hCUWdrRDJKSEZtVUZv?=
 =?utf-8?B?V0RuRjZYRWRJTVhzWEFiMTZPZlRyeDIya0Z3RERhZjJEelk2SlFmNGRUMmxz?=
 =?utf-8?B?VjcwOHBlOXo5Vk5GalUrUWRKNThmTjIzNlhjTU5LZEY1NHhJSktzVHBIT0tL?=
 =?utf-8?B?aFhoTFVMSkxIMHVMWjJ0bGF6V3UzdXhQM3lwbUgzYWZzdnFUU1Zka3MycG1y?=
 =?utf-8?B?cC9mOWlwV3dhUDhVZ1BBallVNkY4djBqSnJlbE4rRUJhU2NDN3JJMzRQdDdk?=
 =?utf-8?B?MlBqY2ZQcjhjbEt1ekwvMzJuaWQrRkFVZXhGNjZOSm1XNG5kRFF2SFFJSXpa?=
 =?utf-8?B?USs1eFVSYnpXZ3FiVFlnbGVXVEtObjRZMGNCNnNtOU1CeDcvNDN2cURIZzdk?=
 =?utf-8?B?TFJyVzNvWkxLZk85SWpTRzVpOFFCeFBOOTRQTFhENmtwc2xyT1hUR0pTZXV3?=
 =?utf-8?B?ZGtRNkhTVFJWVk1SUDNwNmJTd21nSlA5bzJwZ0tFR3I5KzVSa2NYbnRRT2Qz?=
 =?utf-8?B?R1NNTEFweFhxSDhMN2RaV0Z0dXBHSEp0RnJPUm9QdzNHcTN5cCtkbGxBcUs5?=
 =?utf-8?B?R0pGM2c0clRrSVoxaVVpTmFmOG1FeGZ6VVNSeEVPNlF0bUxsRGJBVEJXODB5?=
 =?utf-8?B?VFJrU0E3QzRMcVJDN0dpZ0c4YlV0OFBTcFlDNzd5WEc2WFRSenhONkVJTUFF?=
 =?utf-8?B?ZmtIRnI5OWZyY0VsRlgwSzBiYThjOW5YRGxMeGYxQ09ucjlLOUFDMXIzbmZR?=
 =?utf-8?B?Q25nTlEvQWhFL040OHhnUlBYYUJNdjUwSlNRcjFKOHhScS9FOElyMWhPbHhk?=
 =?utf-8?B?NG16aEZCQmlSZkwzUWM3RkR3V2lEclhySjd5bmprc25LQjRkV29qdVdyNkFv?=
 =?utf-8?B?K1lTNGxMNTJXY2tEQXRPMUpHalBOeU8ydUNkSEJuYlNWazlDMzhicitteWtJ?=
 =?utf-8?B?Mndkdk5SSVRhbll5dXlxYktqd0lkcWlJRHIyZTVpd1lSaTY4dEJpdkh5VXVW?=
 =?utf-8?B?K2QyUk5MQTZzOGwrcnE2OHVzaFRLRTcweGRxOW1ub2VZME9RMlZZNEMrUjBM?=
 =?utf-8?B?MEZjRnNmeWtZdjdCNDJPYUgyK2N6cFl3SWgrcVdEMVA5Z3lkc3FjYXVvdUNY?=
 =?utf-8?B?a0NvampCQklVSlFKVU5JeXhXYXJwdzRzVTV0d0VycTNQK2l3bzN0YmJINXNF?=
 =?utf-8?B?UTFQVUVObE1SVGZrb05XTk5hR3d4ZmhMOWQyYVV5cEN3NkRoKzNZMlJUaE5u?=
 =?utf-8?B?OGprcHdTRzlBWERRY1laZHFDOHpBd2FKMzJoaXdpNkkrcFUxUW95L0taRHZE?=
 =?utf-8?B?STdvV3Fqb3h0dy82N1R4RjllZGxrU3NrdDUwUktaZ1M4WXFMZjNWdlhUSERa?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce9a84b-ce08-49bb-710b-08db02a4ae02
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:30:52.2077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qizsf2JrxTDA/wFyPOXr+I4e8xDbNyw66WyAiLlsfWXJ9NU53UaCTNETpsKUhXybpHNY9WvtNA9jPwvXfGmzUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
X-Proofpoint-ORIG-GUID: YxQNf100zlfYo3zPmzxINtNYf59gY6oV
X-Proofpoint-GUID: t_c4IKj1HbkakjnRR21TGGTwxoht_xLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_07,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=973
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 09:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176484

Ping.

Thanks,

On 1/9/23 17:10, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Mon, 9 Jan 2023 at 10:02, Yu, Mingli <mingli.yu@windriver.com> wrote:
>> Sorry for noise!
>>
>> Originally, the patch is used to fix the yocto compliance issue. The
>> libportal depends on gtk4 and there is a line "REQUIRED_DISTRO_FEATURES
>> = "opengl"" as [1] in gtk4_4.8.2.bb. If not make opengl mandatory for
>> libportal, how to solve the below yocto compliance issue?  Any hints?
>>
>>
>> ERROR: Nothing PROVIDES 'gtk4' (but
>> /build/layers/oe-core/meta/recipes-gnome/libportal/libportal_0.6.bb
>> DEPENDS on or otherwise requires it)
>> gtk4 was skipped: missing required distro feature 'opengl' (not in
>> DISTRO_FEATURES)
>> ERROR: Required build target 'meta-world-pkgdata' has no buildable
>> providers.
>> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
>> 'libportal', 'gtk4']
>>
>>
>> [1]
>> https://git.openembedded.org/openembedded-core/tree/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb#n55
> 
> Thanks for clarifying. Meanwhile there was a discussion in a different
> thread about this, so the patch is fine.
> 
> Alex

