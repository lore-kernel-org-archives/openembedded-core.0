Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4D9C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 06:10:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17323.1677564628639624286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 22:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PjnvcYr3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1423c8d1c8=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31S6ASId015144
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 22:10:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=9zp2fE8vn08auAeLFMU8m8P9Pr41olao1fmeAEJc3Hk=;
 b=PjnvcYr3Nk5x3FKxEc+LwlQrXtPNRKPPQKlgDnwEJGB2rv4+G8ISDRngRIvmt2n8ANk7
 R65mxtIwPEQGYbQKJN20tg46k/KyWg9EKdH0ilRe2h9O5MqNcKkzhPqOKENFJPB2vD90
 wiTZ/ZGtuOjRABq0PRCaZCyQSZks5XUJi1EZv4xzyn1RkMaxKdpnwjkIrRSUjfpXG2J/
 5pmiy3dJA5kSG/DDMZ0CDCXRL3ZLd2mdIBzY9n/k6bnd8aqJAX7gh3RayXmuJhpw2Cqc
 nK67UPcVkROMNliEsvUrnnbtOou3GTJMZAR0/y0wOsD2PD7dJBVe7UFnhyZugOyWWrhU /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyjqrad88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 22:10:27 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31S6AReO015134
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 22:10:27 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyjqrad87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Feb 2023 22:10:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FA+EHBZEsESIXWjLfTUHBwE7k6Zyp5d91dMheo0a2F45LWQso2Yku3TF+QHSqbmSFzz0GVYWNIG0goKiwAV9Tt3r7CUGm9Z8ch4nDPEEd47HXaiS1gqkS5CwENVrgcqbxxjRPMM1A57vjuP4jfEg2I5CVgbML5XpfOEe8f9K4YFf9dbyO6H71EpojupSd7PCpjbSPaQIu5dzuYLTEyv49S7/GxLzfTAMUxsfdQ9c4BHO153qIaRNoPKZ8zzEA8dk0ybj0RNzJ32586ovIBIpaZoyJLxlXUk5OZWa2jqSA2CVW96E1J5qWAtQC7ELhRGmZNgufpd7f3eGTQdWOlJJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zp2fE8vn08auAeLFMU8m8P9Pr41olao1fmeAEJc3Hk=;
 b=E/D6T5qpkA5WwQwhholKDy7nRPXN7GhRrC1mlaMJ6jUye+hjnhzwjg1B8X/0NoMSfblVILbRyjolPkSsG6FimKo8DMDCqgQgcWro3Yaabnt15Y2K9O/m+U8yQcVs2DIqYR7NAuiD4LcYZsE7TDAUMuHDgFdXzEtcyS3F/ShCS4FuwPqxISkBTpNGwd+duLSWdkMCSjWN7ws9qNhs0BhEim46240WG+gxR9mc5/aKR/Yt/tTyJoisOODcZgPHnf7zlmHhJF9gaQDG1kdP9hqB8AuBnqhnsaPrF+b8CdCHdNYQhMsgBHP+xjs5l1bj11LIoyTWwvv/Poujz6Z07jcfSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB7189.namprd11.prod.outlook.com (2603:10b6:8:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Tue, 28 Feb
 2023 06:10:23 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::53d6:17ce:f612:ba23]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::53d6:17ce:f612:ba23%4]) with mapi id 15.20.6134.029; Tue, 28 Feb 2023
 06:10:22 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        Yash Shinde
	<yashinde145@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "steve@sakoman.com"
	<steve@sakoman.com>
CC: "Kallapa, Umesh" <Umesh.Kallapa@windriver.com>,
        "Gowda, Naveen"
	<Naveen.Gowda@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        "Moodalappa, Shivaprasad"
	<Shivaprasad.Moodalappa@windriver.com>
Subject: RE: [kirkstone][PATCH] binutils : Fix CVE-2023-22608
Thread-Topic: [kirkstone][PATCH] binutils : Fix CVE-2023-22608
Thread-Index: AQHZScJduU4/YTdB6USSQ5UdB2PPFq7jnWAAgAA/Ag8=
Date: Tue, 28 Feb 2023 06:10:22 +0000
Message-ID: 
 <SJ1PR11MB6129A763D8105BB88C04C8D7EBAC9@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20230226091122.4085470-1-yashinde145@gmail.com>
 <115d65b7-a18d-1fbb-67f9-51d6e9b92b30@windriver.com>
In-Reply-To: <115d65b7-a18d-1fbb-67f9-51d6e9b92b30@windriver.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS0PR11MB7189:EE_
x-ms-office365-filtering-correlation-id: e743c102-e903-4647-2628-08db1952799d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8gptiWZIXKPWZnR/4XGgfxzyEEuZJCTuIfwrRikhAWrZAIu1SfpeGpBar3/SzwW0HCNvdOGcyOcIeJHkVJxNi7I+feD2Q13dm0vkrzXKGi8gsHbZIn6kTpZnO60SLEq2wpMmysaMurPtUrrGkIQoNE2BAyRtUy7DIngYi+xuO94WzO2Il25fRYyeVjE+I6u4PRc8coxBJGFvmj0Vga8JikjE+yOopfUhWZxpruX3xV523jxIKcQtNLOn5ru2ZySULXkCj/emn37KTqyR+cCivT+14w5ffuRbXjdrIYQblyI2Q5+5HQQio9aKEnkhdDk14yPaNAFtMMlhxBPN5TCJBayTmYdhS4ukCXzc8RpVI71MXjVNT7SmM/Uqv3yGkW3k36CT9su8Snchc10q1QK/+/dehCqrBcQ+dEQZLBquyqlNEmWXwr0otIiBZYNrTi511vrXWMs/axqok9nMxn4whmYrP8HaWdI4XySVsDL9dyHlAVPpUntVmJXLF0PIBxbtrysMXLUEOs5k52X/vkCREcQBlwxyp2YYhRV7SdLc305rvQTL9W8BxRp+OyF2F5IEdR0RPd3++Il3U3/agEgZa4oLcae5uxuHcyPKJtNP+8jhENmUzgdpfJ/hVTv3ZW5sKb5vk8D6qFEv6/PNylqX3oYk/uWzoskKynuoCTlSi8RDjFL/jKQlt6h2DZqqk8+A4Z4FIVnopFtqO3kKHPBb+qusAhCRJeXZZx3nZN/n7ig=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(376002)(136003)(396003)(346002)(366004)(451199018)(107886003)(38100700002)(6506007)(53546011)(26005)(966005)(66446008)(186003)(9686003)(316002)(110136005)(54906003)(52536014)(41300700001)(2906002)(76116006)(71200400001)(66946007)(4326008)(66476007)(66556008)(7696005)(30864003)(64756008)(122000001)(5660300002)(8936002)(478600001)(38070700005)(55016003)(166002)(33656002)(66574015)(8676002)(83380400001)(86362001)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?jPqYUxikDDr1oN2vhbi233trC2brYEnDNacX//Adq0gjfcEWi5fOS57S?=
 =?Windows-1252?Q?WePdDYjsBjjUrS5Ad+y0T+eFTo4dlLr7NeMRkzfrPtVLaU5mUDcMls9l?=
 =?Windows-1252?Q?jCu0Q5dwhQ4qamTjbt3tDEBHFI/G9dlDWTcD1FZ5rxgjjkBJwOLSOvmZ?=
 =?Windows-1252?Q?AgN4H64vVS20z+fME6ueFoELPqC7BN7SZywYvIZlbPhlSqSzZaj4HKYJ?=
 =?Windows-1252?Q?INu6Ukw1lp0i/SJtbmS/GC/koOhARdlGE3rlkQOWFOhD6xgqv2flozd/?=
 =?Windows-1252?Q?Qg9BNhaJ/X1TNnAM6Ai+ibxAHCVhC7sQIE8lW7fM2KferuLhgj++pVE4?=
 =?Windows-1252?Q?oqqjDzVVbSSgvnJAg3N0AvQ4ij6ghjhqjhOYt4+ZE2+lcSTsviHmbK/t?=
 =?Windows-1252?Q?Tsluv5FcGx0m1KY6W5LPsWi8fgJtVGpCB8GMIFUA65gdnMs+M5a2mJw3?=
 =?Windows-1252?Q?cqx7mjFa3YJU1PK01lSzK0xuSosBEcRncyzscJqxSSC55Ga1FFdAgfda?=
 =?Windows-1252?Q?Dh5eO7QoLGATkMOxROEWN4oSU2w5O09AkLZegMi4s1n/QPXmEvs6BMZq?=
 =?Windows-1252?Q?KDp0rmXeNaYF0lFc3CWDWvqtcTfDdAFmZmAwvxJBLcQ4OPFg/looauVR?=
 =?Windows-1252?Q?yRrKTvd3o/rih+/KwcoWyh+a3TfTqj41uhvizh7RaYANivCIOz57NqI0?=
 =?Windows-1252?Q?QzBKxLE7Yu5U8gHNadL1PcV++HjVlowjCi7JHil//gLzRP3DllXmfCr6?=
 =?Windows-1252?Q?TqjFFbVT91KeJcrVMp4Bg2m0ZcGzxXiQbvsTNyF0JMRNXAsHAG82ajr7?=
 =?Windows-1252?Q?/8Bor7FFhxh+ExqFjjx9lX9hVK3VLu/s8VGCnES1cEHQCpNRMHXtMUeQ?=
 =?Windows-1252?Q?0EkSziW7wMyKJP0xQ07Q6w5fh6Dq6HxXQEr2aKbGJVtNF9rN+7TRckmD?=
 =?Windows-1252?Q?THVmHutU5YR+NljU63unnp2kJyCpsSiRYJjzKv8eEEww6nbkzvH7e7OB?=
 =?Windows-1252?Q?rcno9bvl2pnpzKfvvJ44BWBmcYfkIltAJPcfV4u9ssqU5w1QARt9G/fc?=
 =?Windows-1252?Q?pSOi51d4WH6g3i4EBqDedOmuftI3PN1YBEuV6qjeauFIsC0V5tfGvJfi?=
 =?Windows-1252?Q?dwaZ9WuA17BPn46dg1zt7sNV5zOrttnrI2OFDionmVf0DKjTQs0fhiqG?=
 =?Windows-1252?Q?IRk4WZT9GQ9ehUdYeSgKzgcPWogqKwCgcuuxf+cHD/3cM6gsQvU33YR0?=
 =?Windows-1252?Q?W9E465/O7ObFC7bQG3n3zTRUxxSbToMnNXLzt4RcBRV4oU6vghrnCJ1P?=
 =?Windows-1252?Q?cKNla9nKFjCQ5uA/7x1NwZa+NJVkja7QKrUIy9bALCqjSV+XZbgm8p9h?=
 =?Windows-1252?Q?8RHBemo6VeO4Kk2OpKq5972F7Y1Sv+JYjEQ396fEmauvWGGOG0IOwGvH?=
 =?Windows-1252?Q?3XImvt09J07HqJ67Hxf26EqcNko/LIPdGrCWbKOAg0yLplS36gOXeJZC?=
 =?Windows-1252?Q?YN0d6IQr3Dh1KHQfiORH5qA3jXpn8ZMGmqByYOP1OSlvISOvnAezIsAf?=
 =?Windows-1252?Q?AN2n9Iy0sbU0woPHeWSDSd5s2EVcWG3/iXJjCF9S1XSXz55hSoNp+mtV?=
 =?Windows-1252?Q?HcxT+1gJwGMiGdAdiUzOKIS28UTB+NtY7O9tzj2fXId2/b3CgFa7aO2g?=
 =?Windows-1252?Q?Oc0z4HoLPRWCmnKjG9d21EdFXmVyPaVUIPJMv5x7dzbq2kNwM95lwi2X?=
 =?Windows-1252?Q?/VLzsm6gxQ8zxTg38OU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB6129A763D8105BB88C04C8D7EBAC9SJ1PR11MB6129namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e743c102-e903-4647-2628-08db1952799d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 06:10:22.0943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YNRUv5D5z0wZcD+IK+GzjtGDe5mD9LwDOo9Ffcq7efOOCXxgGkoHvE8zZk3XKuKsjUq2Z8r5V/XpCd/LUMishm62KQWodRhDIaNm64s7ygs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7189
X-Proofpoint-GUID: YVYGd5xFncM_R7ragZz6x17hioGzQQch
X-Proofpoint-ORIG-GUID: MtwsLN5_tEYEnVVA-uvrRiNLAK2CFqdA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-28_02,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302280045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 06:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177818

--_000_SJ1PR11MB6129A763D8105BB88C04C8D7EBAC9SJ1PR11MB6129namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Yes, the actual fix is 0020-CVE-2023-22608-3.patch. The other two files are=
 the dependent patch files required for this patch to apply. If these are e=
xcluded, the build gives errors in do_compile task due to missing code depe=
ndencies.

Regards,
Yash

From: MacLeod, Randy<mailto:Randy.MacLeod@windriver.com>
Sent: 28 February 2023 07:30
To: Yash Shinde<mailto:yashinde145@gmail.com>; openembedded-core@lists.open=
embedded.org<mailto:openembedded-core@lists.openembedded.org>; steve@sakoma=
n.com<mailto:steve@sakoman.com>
Cc: Kallapa, Umesh<mailto:Umesh.Kallapa@windriver.com>; Gowda, Naveen<mailt=
o:Naveen.Gowda@windriver.com>; Kokkonda, Sundeep<mailto:Sundeep.Kokkonda@wi=
ndriver.com>; Moodalappa, Shivaprasad<mailto:Shivaprasad.Moodalappa@windriv=
er.com>; Shinde, Yash<mailto:Yash.Shinde@windriver.com>
Subject: Re: [kirkstone][PATCH] binutils : Fix CVE-2023-22608

On 2023-02-26 04:11, Yash Shinde wrote:

From: Yash Shinde <Yash.Shinde@windriver.com><mailto:Yash.Shinde@windriver.=
com>



Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.git=
;a=3Dcommitdiff;h=3D8af23b30edbaedf009bc9b243cd4dfa10ae1ac09]



Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com><mailto:Yash.Shinde@w=
indriver.com>

---

 .../binutils/binutils-2.38.inc                |   3 +

 .../binutils/0020-CVE-2023-22608-1.patch      | 502 ++++++++++++++++++

 .../binutils/0020-CVE-2023-22608-2.patch      | 211 ++++++++

 .../binutils/0020-CVE-2023-22608-3.patch      |  33 ++

This is a large patch so I took a look at it.





The actual fix is: 0020-CVE-2023-22608-3.patch

https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dbfd/dwarf=
2.c;h=3D88335cb4fb0dddc3b1ca8a1d76c32b88ff85aa89;hp=3Db608afbc0cf260e98e2f8=
7ab6d55c935937b2810;hb=3D8af23b30edbaedf009bc9b243cd4dfa10ae1ac09;hpb=3D8fb=
ad19958c9b9c06a710bf7d6589d52f1ed8a64

which is just a few lines.

Unfortunately we do need the other two, rather large patches to make that a=
pply it seems.

The patch that adds a trie seems like a feature but the code is all (I thin=
k) file
scope local structs with static functions so as far as the ABI stability, i=
t seems fine
to backport. It will change the memory footprint:

commit b43771b045fb5616da3964f2994eefbe8ae70d32
Author: Steinar H. Gunderson <sesse@google.com><mailto:sesse@google.com>
Date:   Fri May 20 10:10:34 2022

    add a trie to map quickly from address range to compilation unit

    When using perf to profile large binaries, _bfd_dwarf2_find_nearest_lin=
e()
    becomes a hotspot, as perf wants to get line number information
    (for inline-detection purposes) for each and every sample. In Chromium
    in particular (the content_shell binary), this entails going through
    475k address ranges, which takes a long time when done repeatedly.

    Add a radix-256 trie over the address space to quickly map address to
    compilation unit spaces; for content_shell, which is 1.6 GB when some
    (but not full) debug information turned is on, we go from 6 ms to
    0.006 ms (6 =B5s) for each lookup from address to compilation unit, a 1=
000x
    speedup.

    There is a modest RAM increase of 180 MB in this binary (the existing
    linked list over ranges uses about 10 MB, and the entire perf job uses
    between 2=963 GB for a medium-size profile); for smaller binaries with =
few
    ranges, there should be hardly any extra RAM usage at all.

../Randy



 4 files changed, 749 insertions(+)

 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2023-2=
2608-1.patch

 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2023-2=
2608-2.patch

 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2023-2=
2608-3.patch



diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipe=
s-devtools/binutils/binutils-2.38.inc

index 0a4a0d7bc1..30a34d7ba4 100644

--- a/meta/recipes-devtools/binutils/binutils-2.38.inc

+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc

@@ -43,5 +43,8 @@ SRC_URI =3D "\

      file://0018-CVE-2022-38128-2.patch \

      file://0018-CVE-2022-38128-3.patch \

      file://0019-CVE-2022-4285.patch \

+     file://0020-CVE-2023-22608-1.patch \

+     file://0020-CVE-2023-22608-2.patch \

+     file://0020-CVE-2023-22608-3.patch \

 "

 S  =3D "${WORKDIR}/git"

diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.=
patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.patch

new file mode 100644

index 0000000000..dd3d533d0d

--- /dev/null

+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.patch

@@ -0,0 +1,502 @@

+From a79c274dad99863f58b9ed627b38908daadb6d7e Mon Sep 17 00:00:00 2001

+From: "Steinar H. Gunderson" <sesse@google.com><mailto:sesse@google.com>

+Date: Fri, 20 May 2022 16:10:34 +0200

+Subject: [PATCH] add a trie to map quickly from address range to compilati=
on

+ unit

+MIME-Version: 1.0

+Content-Type: text/plain; charset=3DUTF-8

+Content-Transfer-Encoding: 8bit

+

+When using perf to profile large binaries, _bfd_dwarf2_find_nearest_line()

+becomes a hotspot, as perf wants to get line number information

+(for inline-detection purposes) for each and every sample. In Chromium

+in particular (the content_shell binary), this entails going through

+475k address ranges, which takes a long time when done repeatedly.

+

+Add a radix-256 trie over the address space to quickly map address to

+compilation unit spaces; for content_shell, which is 1.6 GB when some

+(but not full) debug information turned is on, we go from 6 ms to

+0.006 ms (6 =B5s) for each lookup from address to compilation unit, a 1000=
x

+speedup.

+

+There is a modest RAM increase of 180 MB in this binary (the existing

+linked list over ranges uses about 10 MB, and the entire perf job uses

+between 2-3 GB for a medium-size profile); for smaller binaries with few

+ranges, there should be hardly any extra RAM usage at all.

+

+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3Db43771b045fb5616da3964f2994eefbe8ae70d32]

+

+CVE: CVE-2023-22608

+

+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com><mailto:Yash.Shinde@=
windriver.com>

+

+---

+ bfd/dwarf2.c | 326 ++++++++++++++++++++++++++++++++++++++++++++++++---

+ 1 file changed, 312 insertions(+), 14 deletions(-)

+

+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c

+index fdf071c3..0ae50a37 100644

+--- a/bfd/dwarf2.c

++++ b/bfd/dwarf2.c

+@@ -82,6 +82,77 @@ struct adjusted_section

+   bfd_vma adj_vma;

+ };

+

++/* A trie to map quickly from address range to compilation unit.

++

++   This is a fairly standard radix-256 trie, used to quickly locate which

++   compilation unit any given address belongs to.  Given that each compil=
ation

++   unit may register hundreds of very small and unaligned ranges (which m=
ay

++   potentially overlap, due to inlining and other concerns), and a large

++   program may end up containing hundreds of thousands of such ranges, we=
 cannot

++   scan through them linearly without undue slowdown.

++

++   We use a hybrid trie to avoid memory explosion: There are two types of=
 trie

++   nodes, leaves and interior nodes.  (Almost all nodes are leaves, so th=
ey

++   take up the bulk of the memory usage.) Leaves contain a simple array o=
f

++   ranges (high/low address) and which compilation unit contains those ra=
nges,

++   and when we get to a leaf, we scan through it linearly.  Interior node=
s

++   contain pointers to 256 other nodes, keyed by the next byte of the add=
ress.

++   So for a 64-bit address like 0x1234567abcd, we would start at the root=
 and go

++   down child[0x00]->child[0x00]->child[0x01]->child[0x23]->child[0x45] e=
tc.,

++   until we hit a leaf.  (Nodes are, in general, leaves until they exceed=
 the

++   default allocation of 16 elements, at which point they are converted t=
o

++   interior node if possible.) This gives us near-constant lookup times;

++   the only thing that can be costly is if there are lots of overlapping =
ranges

++   within a single 256-byte segment of the binary, in which case we have =
to

++   scan through them all to find the best match.

++

++   For a binary with few ranges, we will in practice only have a single l=
eaf

++   node at the root, containing a simple array.  Thus, the scheme is effi=
cient

++   for both small and large binaries.

++ */

++

++/* Experiments have shown 16 to be a memory-efficient default leaf size.

++   The only case where a leaf will hold more memory than this, is at the

++   bottomost level (covering 256 bytes in the binary), where we'll expand

++   the leaf to be able to hold more ranges if needed.

++ */

++#define TRIE_LEAF_SIZE 16

++

++/* All trie_node pointers will really be trie_leaf or trie_interior,

++   but they have this common head.  */

++struct trie_node

++{

++  /* If zero, we are an interior node.

++     Otherwise, how many ranges we have room for in this leaf.  */

++  unsigned int num_room_in_leaf;

++};

++

++struct trie_leaf

++{

++  struct trie_node head;

++  unsigned int num_stored_in_leaf;

++  struct {

++    struct comp_unit *unit;

++    bfd_vma low_pc, high_pc;

++  } ranges[TRIE_LEAF_SIZE];

++};

++

++struct trie_interior

++{

++  struct trie_node head;

++  struct trie_node *children[256];

++};

++

++static struct trie_node *alloc_trie_leaf (bfd *abfd)

++{

++  struct trie_leaf *leaf =3D

++    bfd_zalloc (abfd, sizeof (struct trie_leaf));

++  if (leaf =3D=3D NULL)

++    return NULL;

++  leaf->head.num_room_in_leaf =3D TRIE_LEAF_SIZE;

++  return &leaf->head;

++}

++

+ struct dwarf2_debug_file

+ {

+   /* The actual bfd from which debug info was loaded.  Might be

+@@ -139,6 +210,9 @@ struct dwarf2_debug_file

+   /* A list of all previously read comp_units.  */

+   struct comp_unit *all_comp_units;

+

++  /* A list of all previously read comp_units with no ranges (yet).  */

++  struct comp_unit *all_comp_units_without_ranges;

++

+   /* Last comp unit in list above.  */

+   struct comp_unit *last_comp_unit;

+

+@@ -147,6 +221,9 @@ struct dwarf2_debug_file

+

+   /* Hash table to map offsets to decoded abbrevs.  */

+   htab_t abbrev_offsets;

++

++  /* Root of a trie to map addresses to compilation units.  */

++  struct trie_node *trie_root;

+ };

+

+ struct dwarf2_debug

+@@ -220,6 +297,11 @@ struct comp_unit

+   /* Chain the previously read compilation units.  */

+   struct comp_unit *next_unit;

+

++  /* Chain the previously read compilation units that have no ranges yet.

++     We scan these separately when we have a trie over the ranges.

++     Unused if arange.high !=3D 0. */

++  struct comp_unit *next_unit_without_ranges;

++

+   /* Likewise, chain the compilation unit read after this one.

+      The comp units are stored in reversed reading order.  */

+   struct comp_unit *prev_unit;

+@@ -296,6 +378,10 @@ struct comp_unit

+

+   /* TRUE if symbols are cached in hash table for faster lookup by name. =
 */

+   bool cached;

++

++  /* Used when iterating over trie leaves to know which units we have

++     already seen in this iteration.  */

++  bool mark;

+ };

+

+ /* This data structure holds the information of an abbrev.  */

+@@ -1766,9 +1852,189 @@ concat_filename (struct line_info_table *table, un=
signed int file)

+   return strdup (filename);

+ }

+

++/* Number of bits in a bfd_vma.  */

++#define VMA_BITS (8 * sizeof (bfd_vma))

++

++/* Check whether [low1, high1) can be combined with [low2, high2),

++   i.e., they touch or overlap.  */

++static bool ranges_overlap (bfd_vma low1,

++                      bfd_vma high1,

++                      bfd_vma low2,

++                      bfd_vma high2)

++{

++  if (low1 =3D=3D low2 || high1 =3D=3D high2)

++    return true;

++

++  /* Sort so that low1 is below low2. */

++  if (low1 > low2)

++    {

++      bfd_vma tmp;

++

++      tmp =3D low1;

++      low1 =3D low2;

++      low2 =3D tmp;

++

++      tmp =3D high1;

++      high1 =3D high2;

++      high2 =3D tmp;

++    }

++

++  /* We touch iff low2 =3D=3D high1.

++     We overlap iff low2 is within [low1, high1). */

++  return (low2 <=3D high1);

++}

++

++/* Insert an address range in the trie mapping addresses to compilation u=
nits.

++   Will return the new trie node (usually the same as is being sent in, b=
ut

++   in case of a leaf-to-interior conversion, or expansion of a leaf, it m=
ay be

++   different), or NULL on failure.

++ */

++static struct trie_node *insert_arange_in_trie(bfd *abfd,

++                                  struct trie_node *trie,

++                                  bfd_vma trie_pc,

++                                  unsigned int trie_pc_bits,

++                                  struct comp_unit *unit,

++                                  bfd_vma low_pc,

++                                  bfd_vma high_pc)

++{

++  bfd_vma clamped_low_pc, clamped_high_pc;

++  int ch, from_ch, to_ch;

++  bool is_full_leaf =3D false;

++

++  /* See if we can extend any of the existing ranges.  This merging

++     isn't perfect (if merging opens up the possibility of merging two ex=
isting

++     ranges, we won't find them), but it takes the majority of the cases.=
  */

++  if (trie->num_room_in_leaf > 0)

++    {

++      struct trie_leaf *leaf =3D (struct trie_leaf *) trie;

++      unsigned int i;

++

++      for (i =3D 0; i < leaf->num_stored_in_leaf; ++i)

++       {

++         if (leaf->ranges[i].unit =3D=3D unit &&

++             ranges_overlap(low_pc, high_pc,

++                       leaf->ranges[i].low_pc, leaf->ranges[i].high_pc))

++           {

++             if (low_pc < leaf->ranges[i].low_pc)

++               leaf->ranges[i].low_pc =3D low_pc;

++             if (high_pc > leaf->ranges[i].high_pc)

++               leaf->ranges[i].high_pc =3D high_pc;

++             return trie;

++           }

++       }

++

++      is_full_leaf =3D leaf->num_stored_in_leaf =3D=3D trie->num_room_in_=
leaf;

++    }

++

++  /* If we're a leaf with no more room and we're _not_ at the bottom,

++     convert to an interior node.  */

++  if (is_full_leaf && trie_pc_bits < VMA_BITS)

++    {

++      const struct trie_leaf *leaf =3D (struct trie_leaf *) trie;

++      unsigned int i;

++

++      trie =3D bfd_zalloc (abfd, sizeof (struct trie_interior));

++      if (!trie)

++       return NULL;

++      is_full_leaf =3D false;

++

++      /* TODO: If we wanted to save a little more memory at the cost of

++        complexity, we could have reused the old leaf node as one of the

++        children of the new interior node, instead of throwing it away.  =
*/

++      for (i =3D 0; i < leaf->num_stored_in_leaf; ++i)

++        {

++         if (!insert_arange_in_trie (abfd, trie, trie_pc, trie_pc_bits,

++                           leaf->ranges[i].unit, leaf->ranges[i].low_pc,

++                           leaf->ranges[i].high_pc))

++           return NULL;

++       }

++    }

++

++  /* If we're a leaf with no more room and we _are_ at the bottom,

++     we have no choice but to just make it larger. */

++  if (is_full_leaf)

++    {

++      const struct trie_leaf *leaf =3D (struct trie_leaf *) trie;

++      unsigned int new_room_in_leaf =3D trie->num_room_in_leaf * 2;

++      struct trie_leaf *new_leaf;

++

++      new_leaf =3D bfd_zalloc (abfd,

++       sizeof (struct trie_leaf) +

++         (new_room_in_leaf - TRIE_LEAF_SIZE) * sizeof (leaf->ranges[0]));

++      new_leaf->head.num_room_in_leaf =3D new_room_in_leaf;

++      new_leaf->num_stored_in_leaf =3D leaf->num_stored_in_leaf;

++

++      memcpy (new_leaf->ranges,

++             leaf->ranges,

++             leaf->num_stored_in_leaf * sizeof (leaf->ranges[0]));

++      trie =3D &new_leaf->head;

++      is_full_leaf =3D false;

++

++      /* Now the insert below will go through.  */

++    }

++

++  /* If we're a leaf (now with room), we can just insert at the end.  */

++  if (trie->num_room_in_leaf > 0)

++    {

++      struct trie_leaf *leaf =3D (struct trie_leaf *) trie;

++

++      unsigned int i =3D leaf->num_stored_in_leaf++;

++      leaf->ranges[i].unit =3D unit;

++      leaf->ranges[i].low_pc =3D low_pc;

++      leaf->ranges[i].high_pc =3D high_pc;

++      return trie;

++    }

++

++  /* Now we are definitely an interior node, so recurse into all

++     the relevant buckets.  */

++

++  /* Clamp the range to the current trie bucket.  */

++  clamped_low_pc =3D low_pc;

++  clamped_high_pc =3D high_pc;

++  if (trie_pc_bits > 0)

++    {

++      bfd_vma bucket_high_pc =3D

++       trie_pc + ((bfd_vma)-1 >> trie_pc_bits);  /* Inclusive.  */

++      if (clamped_low_pc < trie_pc)

++       clamped_low_pc =3D trie_pc;

++      if (clamped_high_pc > bucket_high_pc)

++       clamped_high_pc =3D bucket_high_pc;

++    }

++

++  /* Insert the ranges in all buckets that it spans.  */

++  from_ch =3D (clamped_low_pc >> (VMA_BITS - trie_pc_bits - 8)) & 0xff;

++  to_ch =3D ((clamped_high_pc - 1) >> (VMA_BITS - trie_pc_bits - 8)) & 0x=
ff;

++  for (ch =3D from_ch; ch <=3D to_ch; ++ch)

++    {

++      struct trie_interior *interior =3D (struct trie_interior *) trie;

++      struct trie_node *child =3D interior->children[ch];

++

++      if (child =3D=3D NULL)

++        {

++         child =3D alloc_trie_leaf (abfd);

++         if (!child)

++           return NULL;

++       }

++      child =3D insert_arange_in_trie (abfd,

++                          child,

++                          trie_pc + ((bfd_vma)ch << (VMA_BITS - trie_pc_b=
its - 8)),

++                          trie_pc_bits + 8,

++                          unit,

++                          low_pc,

++                          high_pc);

++      if (!child)

++       return NULL;

++

++      interior->children[ch] =3D child;

++    }

++

++    return trie;

++}

++

++

+ static bool

+-arange_add (const struct comp_unit *unit, struct arange *first_arange,

+-           bfd_vma low_pc, bfd_vma high_pc)

++arange_add (struct comp_unit *unit, struct arange *first_arange,

++           struct trie_node **trie_root, bfd_vma low_pc, bfd_vma high_pc)

+ {

+   struct arange *arange;

+

+@@ -1776,6 +2042,19 @@ arange_add (const struct comp_unit *unit, struct ar=
ange *first_arange,

+   if (low_pc =3D=3D high_pc)

+     return true;

+

++  if (trie_root !=3D NULL)

++    {

++      *trie_root =3D insert_arange_in_trie (unit->file->bfd_ptr,

++                             *trie_root,

++                             0,

++                             0,

++                             unit,

++                             low_pc,

++                             high_pc);

++      if (*trie_root =3D=3D NULL)

++       return false;

++    }

++

+   /* If the first arange is empty, use it.  */

+   if (first_arange->high =3D=3D 0)

+     {

+@@ -2410,7 +2689,8 @@ decode_line_info (struct comp_unit *unit)

+            low_pc =3D address;

+          if (address > high_pc)

+            high_pc =3D address;

+-                 if (!arange_add (unit, &unit->arange, low_pc, high_pc))

++                 if (!arange_add (unit, &unit->arange, &unit->file->trie_=
root,

++                        low_pc, high_pc))

+            goto line_fail;

+          break;

+        case DW_LNE_set_address:

+@@ -3134,7 +3414,7 @@ find_abstract_instance (struct comp_unit *unit,

+

+ static bool

+ read_ranges (struct comp_unit *unit, struct arange *arange,

+-            bfd_uint64_t offset)

++            struct trie_node **trie_root, bfd_uint64_t offset)

+ {

+   bfd_byte *ranges_ptr;

+   bfd_byte *ranges_end;

+@@ -3169,7 +3449,7 @@ read_ranges (struct comp_unit *unit, struct arange *=
arange,

+ base_address =3D high_pc;

+        else

+ {

+-         if (!arange_add (unit, arange,

++         if (!arange_add (unit, arange, trie_root,

+                   base_address + low_pc, base_address + high_pc))

+     return false;

+ }

+@@ -3179,7 +3459,7 @@ read_ranges (struct comp_unit *unit, struct arange *=
arange,

+

+ static bool

+ read_rnglists (struct comp_unit *unit, struct arange *arange,

+-              bfd_uint64_t offset)

++              struct trie_node **trie_root, bfd_uint64_t offset)

+ {

+   bfd_byte *rngs_ptr;

+   bfd_byte *rngs_end;

+@@ -3253,19 +3533,19 @@ read_rnglists (struct comp_unit *unit, struct aran=
ge *arange,

+   return false;

+ }

+

+-      if (!arange_add (unit, arange, low_pc, high_pc))

++      if (!arange_add (unit, arange, trie_root, low_pc, high_pc))

+ return false;

+     }

+ }

+

+ static bool

+ read_rangelist (struct comp_unit *unit, struct arange *arange,

+-               bfd_uint64_t offset)

++               struct trie_node **trie_root, bfd_uint64_t offset)

+ {

+   if (unit->version <=3D 4)

+-    return read_ranges (unit, arange, offset);

++    return read_ranges (unit, arange, trie_root, offset);

+   else

+-    return read_rnglists (unit, arange, offset);

++    return read_rnglists (unit, arange, trie_root, offset);

+ }

+

+ static struct funcinfo *

+@@ -3563,7 +3843,8 @@ scan_unit_for_symbols (struct comp_unit *unit)

+

+        case DW_AT_ranges:

+          if (is_int_form (&attr)

+-                     && !read_rangelist (unit, &func->arange, attr.u.val)=
)

++                     && !read_rangelist (unit, &func->arange,

++                             &unit->file->trie_root, attr.u.val))

+            goto fail;

+          break;

+

+@@ -3679,7 +3960,8 @@ scan_unit_for_symbols (struct comp_unit *unit)

+

+       if (func && high_pc !=3D 0)

+ {

+-         if (!arange_add (unit, &func->arange, low_pc, high_pc))

++         if (!arange_add (unit, &func->arange, &unit->file->trie_root,

++                     low_pc, high_pc))

+     goto fail;

+ }

+     }

+@@ -3874,7 +4156,8 @@ parse_comp_unit (struct dwarf2_debug *stash,

+

+ case DW_AT_ranges:

+   if (is_int_form (&attr)

+-             && !read_rangelist (unit, &unit->arange, attr.u.val))

++             && !read_rangelist (unit, &unit->arange,

++                       &unit->file->trie_root, attr.u.val))

+     return NULL;

+   break;

+

+@@ -3916,7 +4199,8 @@ parse_comp_unit (struct dwarf2_debug *stash,

+     high_pc +=3D low_pc;

+   if (high_pc !=3D 0)

+     {

+-      if (!arange_add (unit, &unit->arange, low_pc, high_pc))

++      if (!arange_add (unit, &unit->arange, &unit->file->trie_root,

++                      low_pc, high_pc))

+ return NULL;

+     }

+

+@@ -4747,6 +5031,14 @@ _bfd_dwarf2_slurp_debug_info (bfd *abfd, bfd *debug=
_bfd,

+   if (!stash->alt.abbrev_offsets)

+     return false;

+

++  stash->f.trie_root =3D alloc_trie_leaf (abfd);

++  if (!stash->f.trie_root)

++    return false;

++

++  stash->alt.trie_root =3D alloc_trie_leaf (abfd);

++  if (!stash->alt.trie_root)

++    return false;

++

+   *pinfo =3D stash;

+

+   if (debug_bfd =3D=3D NULL)

+@@ -4918,6 +5210,12 @@ stash_comp_unit (struct dwarf2_debug *stash, struct=
 dwarf2_debug_file *file)

+   each->next_unit =3D file->all_comp_units;

+   file->all_comp_units =3D each;

+

++         if (each->arange.high =3D=3D 0)

++           {

++             each->next_unit_without_ranges =3D file->all_comp_units_with=
out_ranges;

++             file->all_comp_units_without_ranges =3D each->next_unit_with=
out_ranges;

++           }

++

+   file->info_ptr +=3D length;

+   return each;

+ }

diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.=
patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.patch

new file mode 100644

index 0000000000..8ffb500c1d

--- /dev/null

+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.patch

@@ -0,0 +1,211 @@

+From 73e97e32e1428d63d81d971176772ae69397a1a0 Mon Sep 17 00:00:00 2001

+From: Nick Clifton <nickc@redhat.com><mailto:nickc@redhat.com>

+Date: Tue, 30 Aug 2022 16:01:20 +0100

+Subject: [PATCH] BFD library: Use entry 0 in directory and filename tables=
 of

+ DWARF-5 debug info.

+

+ PR 29529

+ * dwarf2.c (struct line_info_table): Add new field:

+ use_dir_and_file_0.

+ (concat_filename): Use new field to help select the correct table

+ slot.

+ (read_formatted_entries): Do not skip entry 0.

+ (decode_line_info): Set new field depending upon the version of

+ DWARF being parsed.  Initialise filename based upon the setting of

+ the new field.

+

+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D37833b966576c5d25e797ea3b6c33d0459a71892]

+CVE: CVE-2023-22608

+

+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com><mailto:Yash.Shinde@=
windriver.com>

+

+---

+ bfd/ChangeLog                      | 12 +++++

+ bfd/dwarf2.c                       | 86 ++++++++++++++++++++----------

+ ld/ChangeLog                       |  5 ++

+ ld/testsuite/ld-x86-64/pr27587.err |  2 +-

+ 4 files changed, 76 insertions(+), 29 deletions(-)

+

+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c

+index 0ae50a37..b7839ad6 100644

+--- a/bfd/dwarf2.c

++++ b/bfd/dwarf2.c

+@@ -1571,6 +1571,7 @@ struct line_info_table

+   unsigned int    num_files;

+   unsigned int    num_dirs;

+   unsigned int    num_sequences;

++  bool                  use_dir_and_file_0;

+   char *          comp_dir;

+   char **         dirs;

+   struct fileinfo*   files;

+@@ -1791,16 +1792,30 @@ concat_filename (struct line_info_table *table, un=
signed int file)

+ {

+   char *filename;

+

+-  if (table =3D=3D NULL || file - 1 >=3D table->num_files)

++  /* Pre DWARF-5 entry 0 in the directory and filename tables was not use=
d.

++     So in order to save space in the tables used here the info for, eg

++     directory 1 is stored in slot 0 of the directory table, directory 2

++     in slot 1 and so on.

++

++     Starting with DWARF-5 the 0'th entry is used so there is a one to on=
e

++     mapping between DWARF slots and internal table entries.  */

++  if (! table->use_dir_and_file_0)

+     {

+-      /* FILE =3D=3D 0 means unknown.  */

+-      if (file)

+-       _bfd_error_handler

+-         (_("DWARF error: mangled line number section (bad file number)")=
);

++      /* Pre DWARF-5, FILE =3D=3D 0 means unknown.  */

++      if (file =3D=3D 0)

++       return strdup ("<unknown>");

++      -- file;

++    }

++

++  if (table =3D=3D NULL || file >=3D table->num_files)

++    {

++      _bfd_error_handler

++       (_("DWARF error: mangled line number section (bad file number)"));

+       return strdup ("<unknown>");

+     }

+

+-  filename =3D table->files[file - 1].name;

++  filename =3D table->files[file].name;

++

+   if (filename =3D=3D NULL)

+     return strdup ("<unknown>");

+

+@@ -1811,12 +1826,17 @@ concat_filename (struct line_info_table *table, un=
signed int file)

+       char *name;

+       size_t len;

+

+-      if (table->files[file - 1].dir

++      if (table->files[file].dir

+   /* PR 17512: file: 0317e960.  */

+-         && table->files[file - 1].dir <=3D table->num_dirs

++         && table->files[file].dir <=3D table->num_dirs

+   /* PR 17512: file: 7f3d2e4b.  */

+   && table->dirs !=3D NULL)

+-       subdir_name =3D table->dirs[table->files[file - 1].dir - 1];

++       {

++         if (table->use_dir_and_file_0)

++           subdir_name =3D table->dirs[table->files[file].dir];

++         else

++           subdir_name =3D table->dirs[table->files[file].dir - 1];

++       }

+

+       if (!subdir_name || !IS_ABSOLUTE_PATH (subdir_name))

+ dir_name =3D table->comp_dir;

+@@ -1857,10 +1877,12 @@ concat_filename (struct line_info_table *table, un=
signed int file)

+

+ /* Check whether [low1, high1) can be combined with [low2, high2),

+    i.e., they touch or overlap.  */

+-static bool ranges_overlap (bfd_vma low1,

+-                      bfd_vma high1,

+-                      bfd_vma low2,

+-                      bfd_vma high2)

++

++static bool

++ranges_overlap (bfd_vma low1,

++               bfd_vma high1,

++               bfd_vma low2,

++               bfd_vma high2)

+ {

+   if (low1 =3D=3D low2 || high1 =3D=3D high2)

+     return true;

+@@ -1887,15 +1909,16 @@ static bool ranges_overlap (bfd_vma low1,

+ /* Insert an address range in the trie mapping addresses to compilation u=
nits.

+    Will return the new trie node (usually the same as is being sent in, b=
ut

+    in case of a leaf-to-interior conversion, or expansion of a leaf, it m=
ay be

+-   different), or NULL on failure.

+- */

+-static struct trie_node *insert_arange_in_trie(bfd *abfd,

+-                                  struct trie_node *trie,

+-                                  bfd_vma trie_pc,

+-                                  unsigned int trie_pc_bits,

+-                                  struct comp_unit *unit,

+-                                  bfd_vma low_pc,

+-                                  bfd_vma high_pc)

++   different), or NULL on failure.  */

++

++static struct trie_node *

++insert_arange_in_trie (bfd *abfd,

++                      struct trie_node *trie,

++                      bfd_vma trie_pc,

++                      unsigned int trie_pc_bits,

++                      struct comp_unit *unit,

++                      bfd_vma low_pc,

++                      bfd_vma high_pc)

+ {

+   bfd_vma clamped_low_pc, clamped_high_pc;

+   int ch, from_ch, to_ch;

+@@ -2031,7 +2054,6 @@ static struct trie_node *insert_arange_in_trie(bfd *=
abfd,

+     return trie;

+ }

+

+-

+ static bool

+ arange_add (struct comp_unit *unit, struct arange *first_arange,

+     struct trie_node **trie_root, bfd_vma low_pc, bfd_vma high_pc)

+@@ -2412,10 +2434,8 @@ read_formatted_entries (struct comp_unit *unit, bfd=
_byte **bufp,

+     }

+ }

+

+-      /* Skip the first "zero entry", which is the compilation dir/file. =
 */

+-      if (datai !=3D 0)

+-       if (!callback (table, fe.name, fe.dir, fe.time, fe.size))

+-         return false;

++      if (!callback (table, fe.name, fe.dir, fe.time, fe.size))

++       return false;

+     }

+

+   *bufp =3D buf;

+@@ -2592,6 +2612,7 @@ decode_line_info (struct comp_unit *unit)

+       if (!read_formatted_entries (unit, &line_ptr, line_end, table,

+                      line_info_add_file_name))

+ goto fail;

++      table->use_dir_and_file_0 =3D true;

+     }

+   else

+     {

+@@ -2614,6 +2635,7 @@ decode_line_info (struct comp_unit *unit)

+   if (!line_info_add_file_name (table, cur_file, dir, xtime, size))

+     goto fail;

+ }

++      table->use_dir_and_file_0 =3D false;

+     }

+

+   /* Read the statement sequences until there's nothing left.  */

+@@ -2622,7 +2644,7 @@ decode_line_info (struct comp_unit *unit)

+       /* State machine registers.  */

+       bfd_vma address =3D 0;

+       unsigned char op_index =3D 0;

+-      char * filename =3D table->num_files ? concat_filename (table, 1) :=
 NULL;

++      char * filename =3D NULL;

+       unsigned int line =3D 1;

+       unsigned int column =3D 0;

+       unsigned int discriminator =3D 0;

+@@ -2637,6 +2659,14 @@ decode_line_info (struct comp_unit *unit)

+       bfd_vma low_pc  =3D (bfd_vma) -1;

+       bfd_vma high_pc =3D 0;

+

++      if (table->num_files)

++       {

++         if (table->use_dir_and_file_0)

++           filename =3D concat_filename (table, 0);

++         else

++           filename =3D concat_filename (table, 1);

++       }

++

+       /* Decode the table.  */

+       while (!end_sequence && line_ptr < line_end)

+ {

+diff --git a/ld/testsuite/ld-x86-64/pr27587.err b/ld/testsuite/ld-x86-64/p=
r27587.err

+index fa870790..807750ca 100644

+--- a/ld/testsuite/ld-x86-64/pr27587.err

++++ b/ld/testsuite/ld-x86-64/pr27587.err

+@@ -1,3 +1,3 @@

+ #...

+-.*pr27587.i:4: undefined reference to `stack_size'

++.*pr27587/<artificial>:4: undefined reference to `stack_size'

+ #...

diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.=
patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.patch

new file mode 100644

index 0000000000..603824155b

--- /dev/null

+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.patch

@@ -0,0 +1,33 @@

+From 20c75f063a999f9e849a77613a82b15de78ea45f Mon Sep 17 00:00:00 2001

+From: Nick Clifton <nickc@redhat.com><mailto:nickc@redhat.com>

+Date: Fri, 23 Dec 2022 13:02:04 +0000

+Subject: [PATCH] Fix illegal memory access parsing corrupt DWARF informati=
on.

+

+ PR 29936

+ * dwarf2.c (concat_filename): Fix check for a directory index off

+ the end of the directory table.

+

+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D8af23b30edbaedf009bc9b243cd4dfa10ae1ac09]

+CVE: CVE-2023-22608

+

+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com><mailto:Yash.Shinde@=
windriver.com>

+

+---

+ bfd/ChangeLog | 6 ++++++

+ bfd/dwarf2.c  | 3 ++-

+ 2 files changed, 8 insertions(+), 1 deletion(-)

+

+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c

+index b7839ad6..8b07a24c 100644

+--- a/bfd/dwarf2.c

++++ b/bfd/dwarf2.c

+@@ -1828,7 +1828,8 @@ concat_filename (struct line_info_table *table, unsi=
gned int file)

+

+       if (table->files[file].dir

+   /* PR 17512: file: 0317e960.  */

+-         && table->files[file].dir <=3D table->num_dirs

++         && table->files[file].dir

++         <=3D (table->use_dir_and_file_0 ? table->num_dirs - 1 : table->n=
um_dirs)

+   /* PR 17512: file: 7f3d2e4b.  */

+   && table->dirs !=3D NULL)

+ {



--

# Randy MacLeod

# Wind River Linux


--_000_SJ1PR11MB6129A763D8105BB88C04C8D7EBAC9SJ1PR11MB6129namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Mangal;
	panose-1:2 4 5 3 5 2 3 3 2 2;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Yes, the actual fix is <i>0020-CVE-2023-22608-3.patc=
h</i>. The other two files are the dependent patch files required for this =
patch to apply. If these are excluded, the build gives errors in
<i>do_compile</i> task due to missing code dependencies.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<br>
Yash<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:Randy.MacLeod@windriver.com">MacLeod, Randy</a><br>
<b>Sent: </b>28 February 2023 07:30<br>
<b>To: </b><a href=3D"mailto:yashinde145@gmail.com">Yash Shinde</a>; <a hre=
f=3D"mailto:openembedded-core@lists.openembedded.org">
openembedded-core@lists.openembedded.org</a>; <a href=3D"mailto:steve@sakom=
an.com">
steve@sakoman.com</a><br>
<b>Cc: </b><a href=3D"mailto:Umesh.Kallapa@windriver.com">Kallapa, Umesh</a=
>; <a href=3D"mailto:Naveen.Gowda@windriver.com">
Gowda, Naveen</a>; <a href=3D"mailto:Sundeep.Kokkonda@windriver.com">Kokkon=
da, Sundeep</a>;
<a href=3D"mailto:Shivaprasad.Moodalappa@windriver.com">Moodalappa, Shivapr=
asad</a>;
<a href=3D"mailto:Yash.Shinde@windriver.com">Shinde, Yash</a><br>
<b>Subject: </b>Re: [kirkstone][PATCH] binutils : Fix CVE-2023-22608</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On 2023-02-26 04:11, Yash Shinde wrote:<o:p></o:p></=
p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre>From: Yash Shinde <a href=3D"mailto:Yash.Shinde@windriver.com">&lt;Yas=
h.Shinde@windriver.com&gt;</a></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/?p=3D=
binutils-gdb.git;a=3Dcommitdiff;h=3D8af23b30edbaedf009bc9b243cd4dfa10ae1ac0=
9">https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D8af2=
3b30edbaedf009bc9b243cd4dfa10ae1ac09</a>]</pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Signed-off-by: Yash Shinde <a href=3D"mailto:Yash.Shinde@windriver.com=
">&lt;Yash.Shinde@windriver.com&gt;</a></pre>
<pre>---</pre>
<pre> .../binutils/binutils-2.38.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +</pre>
<pre> .../binutils/0020-CVE-2023-22608-1.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 502 ++++++++++++++++++</pre>
<pre> .../binutils/0020-CVE-2023-22608-2.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 211 ++++++++</pre>
<pre> .../binutils/0020-CVE-2023-22608-3.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 33 ++</pre>
</blockquote>
<pre>This is a large patch so I took a look at it.</pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>The actual fix is: 0020-CVE-2023-22608-3.patch</pre>
<p><a href=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff=
;f=3Dbfd/dwarf2.c;h=3D88335cb4fb0dddc3b1ca8a1d76c32b88ff85aa89;hp=3Db608afb=
c0cf260e98e2f87ab6d55c935937b2810;hb=3D8af23b30edbaedf009bc9b243cd4dfa10ae1=
ac09;hpb=3D8fbad19958c9b9c06a710bf7d6589d52f1ed8a64">https://sourceware.org=
/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dbfd/dwarf2.c;h=3D88335cb4fb0ddd=
c3b1ca8a1d76c32b88ff85aa89;hp=3Db608afbc0cf260e98e2f87ab6d55c935937b2810;hb=
=3D8af23b30edbaedf009bc9b243cd4dfa10ae1ac09;hpb=3D8fbad19958c9b9c06a710bf7d=
6589d52f1ed8a64</a></p>
<p>which is just a few lines.</p>
<p>Unfortunately we do need the other two, rather large patches to make tha=
t apply it seems.</p>
<p>The patch that adds a trie seems like a feature but the code is all (I t=
hink) file<br>
scope local structs with static functions so as far as the ABI stability, i=
t seems fine<br>
to backport. It will change the memory footprint:<br>
<br>
commit b43771b045fb5616da3964f2994eefbe8ae70d32<br>
Author: Steinar H. Gunderson <a href=3D"mailto:sesse@google.com">&lt;sesse@=
google.com&gt;</a><br>
Date:&nbsp;&nbsp; Fri May 20 10:10:34 2022<br>
<br>
&nbsp;&nbsp;&nbsp; add a trie to map quickly from address range to compilat=
ion unit<br>
&nbsp;&nbsp; &nbsp;<br>
&nbsp;&nbsp;&nbsp; When using perf to profile large binaries, _bfd_dwarf2_f=
ind_nearest_line()<br>
&nbsp;&nbsp;&nbsp; becomes a hotspot, as perf wants to get line number info=
rmation<br>
&nbsp;&nbsp;&nbsp; (for inline-detection purposes) for each and every sampl=
e. In Chromium<br>
&nbsp;&nbsp;&nbsp; in particular (the content_shell binary), this entails g=
oing through<br>
&nbsp;&nbsp;&nbsp; 475k address ranges, which takes a long time when done r=
epeatedly.<br>
&nbsp;&nbsp; &nbsp;<br>
&nbsp;&nbsp;&nbsp; Add a radix-256 trie over the address space to quickly m=
ap address to<br>
&nbsp;&nbsp;&nbsp; compilation unit spaces; for content_shell, which is 1.6=
 GB when some<br>
&nbsp;&nbsp;&nbsp; (but not full) debug information turned is on, we go fro=
m 6 ms to<br>
&nbsp;&nbsp;&nbsp; 0.006 ms (6 =B5s) for each lookup from address to compil=
ation unit, a 1000x<br>
&nbsp;&nbsp;&nbsp; speedup.<br>
&nbsp;&nbsp; &nbsp;<br>
&nbsp;&nbsp;&nbsp; There is a modest RAM increase of 180 MB in this binary =
(the existing<br>
&nbsp;&nbsp;&nbsp; linked list over ranges uses about 10 MB, and the entire=
 perf job uses<br>
&nbsp;&nbsp;&nbsp; between 2=963 GB for a medium-size profile); for smaller=
 binaries with few<br>
&nbsp;&nbsp;&nbsp; ranges, there should be hardly any extra RAM usage at al=
l.<br>
<br>
../Randy</p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre><o:p>&nbsp;</o:p></pre>
<pre> 4 files changed, 749 insertions(+)</pre>
<pre> create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2=
023-22608-1.patch</pre>
<pre> create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2=
023-22608-2.patch</pre>
<pre> create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2=
023-22608-3.patch</pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/r=
ecipes-devtools/binutils/binutils-2.38.inc</pre>
<pre>index 0a4a0d7bc1..30a34d7ba4 100644</pre>
<pre>--- a/meta/recipes-devtools/binutils/binutils-2.38.inc</pre>
<pre>+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc</pre>
<pre>@@ -43,5 +43,8 @@ SRC_URI =3D &quot;\</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0018-CVE-2022-38128-2=
.patch">file://0018-CVE-2022-38128-2.patch</a> \</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0018-CVE-2022-38128-3=
.patch">file://0018-CVE-2022-38128-3.patch</a> \</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0019-CVE-2022-4285.pa=
tch">file://0019-CVE-2022-4285.patch</a> \</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0020-CVE-2023-22608-1.patc=
h">file://0020-CVE-2023-22608-1.patch</a> \</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0020-CVE-2023-22608-2.patc=
h">file://0020-CVE-2023-22608-2.patch</a> \</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0020-CVE-2023-22608-3.patc=
h">file://0020-CVE-2023-22608-3.patch</a> \</pre>
<pre> &quot;</pre>
<pre> S&nbsp; =3D &quot;${WORKDIR}/git&quot;</pre>
<pre>diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-226=
08-1.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.=
patch</pre>
<pre>new file mode 100644</pre>
<pre>index 0000000000..dd3d533d0d</pre>
<pre>--- /dev/null</pre>
<pre>+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.pa=
tch</pre>
<pre>@@ -0,0 +1,502 @@</pre>
<pre>+From a79c274dad99863f58b9ed627b38908daadb6d7e Mon Sep 17 00:00:00 200=
1</pre>
<pre>+From: &quot;Steinar H. Gunderson&quot; <a href=3D"mailto:sesse@google=
.com">&lt;sesse@google.com&gt;</a></pre>
<pre>+Date: Fri, 20 May 2022 16:10:34 +0200</pre>
<pre>+Subject: [PATCH] add a trie to map quickly from address range to comp=
ilation</pre>
<pre>+ unit</pre>
<pre>+MIME-Version: 1.0</pre>
<pre>+Content-Type: text/plain; charset=3DUTF-8</pre>
<pre>+Content-Transfer-Encoding: 8bit</pre>
<pre>+</pre>
<pre>+When using perf to profile large binaries, _bfd_dwarf2_find_nearest_l=
ine()</pre>
<pre>+becomes a hotspot, as perf wants to get line number information</pre>
<pre>+(for inline-detection purposes) for each and every sample. In Chromiu=
m</pre>
<pre>+in particular (the content_shell binary), this entails going through<=
/pre>
<pre>+475k address ranges, which takes a long time when done repeatedly.</p=
re>
<pre>+</pre>
<pre>+Add a radix-256 trie over the address space to quickly map address to=
</pre>
<pre>+compilation unit spaces; for content_shell, which is 1.6 GB when some=
</pre>
<pre>+(but not full) debug information turned is on, we go from 6 ms to</pr=
e>
<pre>+0.006 ms (6 =B5s) for each lookup from address to compilation unit, a=
 1000x</pre>
<pre>+speedup.</pre>
<pre>+</pre>
<pre>+There is a modest RAM increase of 180 MB in this binary (the existing=
</pre>
<pre>+linked list over ranges uses about 10 MB, and the entire perf job use=
s</pre>
<pre>+between 2-3 GB for a medium-size profile); for smaller binaries with =
few</pre>
<pre>+ranges, there should be hardly any extra RAM usage at all.</pre>
<pre>+</pre>
<pre>+Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/?p=
=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3Db43771b045fb5616da3964f2994eefbe8ae7=
0d32">https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3Db=
43771b045fb5616da3964f2994eefbe8ae70d32</a>]</pre>
<pre>+</pre>
<pre>+CVE: CVE-2023-22608</pre>
<pre>+</pre>
<pre>+Signed-off-by: Yash Shinde <a href=3D"mailto:Yash.Shinde@windriver.co=
m">&lt;Yash.Shinde@windriver.com&gt;</a></pre>
<pre>+</pre>
<pre>+---</pre>
<pre>+ bfd/dwarf2.c | 326 ++++++++++++++++++++++++++++++++++++++++++++++++-=
--</pre>
<pre>+ 1 file changed, 312 insertions(+), 14 deletions(-)</pre>
<pre>+</pre>
<pre>+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c</pre>
<pre>+index fdf071c3..0ae50a37 100644</pre>
<pre>+--- a/bfd/dwarf2.c</pre>
<pre>++++ b/bfd/dwarf2.c</pre>
<pre>+@@ -82,6 +82,77 @@ struct adjusted_section</pre>
<pre>+&nbsp;&nbsp; bfd_vma adj_vma;</pre>
<pre>+ };</pre>
<pre>+</pre>
<pre>++/* A trie to map quickly from address range to compilation unit.</pr=
e>
<pre>++</pre>
<pre>++&nbsp;&nbsp; This is a fairly standard radix-256 trie, used to quick=
ly locate which</pre>
<pre>++&nbsp;&nbsp; compilation unit any given address belongs to.&nbsp; Gi=
ven that each compilation</pre>
<pre>++&nbsp;&nbsp; unit may register hundreds of very small and unaligned =
ranges (which may</pre>
<pre>++&nbsp;&nbsp; potentially overlap, due to inlining and other concerns=
), and a large</pre>
<pre>++&nbsp;&nbsp; program may end up containing hundreds of thousands of =
such ranges, we cannot</pre>
<pre>++&nbsp;&nbsp; scan through them linearly without undue slowdown.</pre=
>
<pre>++</pre>
<pre>++&nbsp;&nbsp; We use a hybrid trie to avoid memory explosion: There a=
re two types of trie</pre>
<pre>++&nbsp;&nbsp; nodes, leaves and interior nodes.&nbsp; (Almost all nod=
es are leaves, so they</pre>
<pre>++&nbsp;&nbsp; take up the bulk of the memory usage.) Leaves contain a=
 simple array of</pre>
<pre>++&nbsp;&nbsp; ranges (high/low address) and which compilation unit co=
ntains those ranges,</pre>
<pre>++&nbsp;&nbsp; and when we get to a leaf, we scan through it linearly.=
&nbsp; Interior nodes</pre>
<pre>++&nbsp;&nbsp; contain pointers to 256 other nodes, keyed by the next =
byte of the address.</pre>
<pre>++&nbsp;&nbsp; So for a 64-bit address like 0x1234567abcd, we would st=
art at the root and go</pre>
<pre>++&nbsp;&nbsp; down child[0x00]-&gt;child[0x00]-&gt;child[0x01]-&gt;ch=
ild[0x23]-&gt;child[0x45] etc.,</pre>
<pre>++&nbsp;&nbsp; until we hit a leaf.&nbsp; (Nodes are, in general, leav=
es until they exceed the</pre>
<pre>++&nbsp;&nbsp; default allocation of 16 elements, at which point they =
are converted to</pre>
<pre>++&nbsp;&nbsp; interior node if possible.) This gives us near-constant=
 lookup times;</pre>
<pre>++&nbsp;&nbsp; the only thing that can be costly is if there are lots =
of overlapping ranges</pre>
<pre>++&nbsp;&nbsp; within a single 256-byte segment of the binary, in whic=
h case we have to</pre>
<pre>++&nbsp;&nbsp; scan through them all to find the best match.</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp; For a binary with few ranges, we will in practice only =
have a single leaf</pre>
<pre>++&nbsp;&nbsp; node at the root, containing a simple array.&nbsp; Thus=
, the scheme is efficient</pre>
<pre>++&nbsp; &nbsp;for both small and large binaries.</pre>
<pre>++ */</pre>
<pre>++</pre>
<pre>++/* Experiments have shown 16 to be a memory-efficient default leaf s=
ize.</pre>
<pre>++&nbsp;&nbsp; The only case where a leaf will hold more memory than t=
his, is at the</pre>
<pre>++&nbsp;&nbsp; bottomost level (covering 256 bytes in the binary), whe=
re we'll expand</pre>
<pre>++&nbsp;&nbsp; the leaf to be able to hold more ranges if needed.</pre=
>
<pre>++ */</pre>
<pre>++#define TRIE_LEAF_SIZE 16</pre>
<pre>++</pre>
<pre>++/* All trie_node pointers will really be trie_leaf or trie_interior,=
</pre>
<pre>++&nbsp;&nbsp; but they have this common head.&nbsp; */</pre>
<pre>++struct trie_node</pre>
<pre>++{</pre>
<pre>++&nbsp; /* If zero, we are an interior node.</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; Otherwise, how many ranges we have room for=
 in this leaf.&nbsp; */</pre>
<pre>++&nbsp; unsigned int num_room_in_leaf;</pre>
<pre>++};</pre>
<pre>++</pre>
<pre>++struct trie_leaf</pre>
<pre>++{</pre>
<pre>++&nbsp; struct trie_node head;</pre>
<pre>++&nbsp; unsigned int num_stored_in_leaf;</pre>
<pre>++&nbsp; struct {</pre>
<pre>++&nbsp;&nbsp;&nbsp; struct comp_unit *unit;</pre>
<pre>++&nbsp;&nbsp;&nbsp; bfd_vma low_pc, high_pc;</pre>
<pre>++&nbsp; } ranges[TRIE_LEAF_SIZE];</pre>
<pre>++};</pre>
<pre>++</pre>
<pre>++struct trie_interior</pre>
<pre>++{</pre>
<pre>++&nbsp; struct trie_node head;</pre>
<pre>++&nbsp; struct trie_node *children[256];</pre>
<pre>++};</pre>
<pre>++</pre>
<pre>++static struct trie_node *alloc_trie_leaf (bfd *abfd)</pre>
<pre>++{</pre>
<pre>++&nbsp; struct trie_leaf *leaf =3D</pre>
<pre>++&nbsp;&nbsp;&nbsp; bfd_zalloc (abfd, sizeof (struct trie_leaf));</pr=
e>
<pre>++&nbsp; if (leaf =3D=3D NULL)</pre>
<pre>++&nbsp;&nbsp;&nbsp; return NULL;</pre>
<pre>++&nbsp; leaf-&gt;head.num_room_in_leaf =3D TRIE_LEAF_SIZE;</pre>
<pre>++&nbsp; return &amp;leaf-&gt;head;</pre>
<pre>++}</pre>
<pre>++</pre>
<pre>+ struct dwarf2_debug_file</pre>
<pre>+ {</pre>
<pre>+&nbsp;&nbsp; /* The actual bfd from which debug info was loaded.&nbsp=
; Might be</pre>
<pre>+@@ -139,6 +210,9 @@ struct dwarf2_debug_file</pre>
<pre>+&nbsp;&nbsp; /* A list of all previously read comp_units.&nbsp; */</p=
re>
<pre>+&nbsp;&nbsp; struct comp_unit *all_comp_units;</pre>
<pre>+</pre>
<pre>++&nbsp; /* A list of all previously read comp_units with no ranges (y=
et).&nbsp; */</pre>
<pre>++&nbsp; struct comp_unit *all_comp_units_without_ranges;</pre>
<pre>++</pre>
<pre>+&nbsp;&nbsp; /* Last comp unit in list above.&nbsp; */</pre>
<pre>+&nbsp;&nbsp; struct comp_unit *last_comp_unit;</pre>
<pre>+</pre>
<pre>+@@ -147,6 +221,9 @@ struct dwarf2_debug_file</pre>
<pre>+</pre>
<pre>+&nbsp;&nbsp; /* Hash table to map offsets to decoded abbrevs.&nbsp; *=
/</pre>
<pre>+&nbsp;&nbsp; htab_t abbrev_offsets;</pre>
<pre>++</pre>
<pre>++&nbsp; /* Root of a trie to map addresses to compilation units.&nbsp=
; */</pre>
<pre>++&nbsp; struct trie_node *trie_root;</pre>
<pre>+ };</pre>
<pre>+</pre>
<pre>+ struct dwarf2_debug</pre>
<pre>+@@ -220,6 +297,11 @@ struct comp_unit</pre>
<pre>+&nbsp;&nbsp; /* Chain the previously read compilation units.&nbsp; */=
</pre>
<pre>+&nbsp;&nbsp; struct comp_unit *next_unit;</pre>
<pre>+</pre>
<pre>++&nbsp; /* Chain the previously read compilation units that have no r=
anges yet.</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; We scan these separately when we have a tri=
e over the ranges.</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; Unused if arange.high !=3D 0. */</pre>
<pre>++&nbsp; struct comp_unit *next_unit_without_ranges;</pre>
<pre>++</pre>
<pre>+&nbsp;&nbsp; /* Likewise, chain the compilation unit read after this =
one.</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The comp units are stored in reversed =
reading order.&nbsp; */</pre>
<pre>+&nbsp;&nbsp; struct comp_unit *prev_unit;</pre>
<pre>+@@ -296,6 +378,10 @@ struct comp_unit</pre>
<pre>+</pre>
<pre>+&nbsp;&nbsp; /* TRUE if symbols are cached in hash table for faster l=
ookup by name.&nbsp; */</pre>
<pre>+&nbsp;&nbsp; bool cached;</pre>
<pre>++</pre>
<pre>++&nbsp; /* Used when iterating over trie leaves to know which units w=
e have</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; already seen in this iteration.&nbsp; */</p=
re>
<pre>++&nbsp; bool mark;</pre>
<pre>+ };</pre>
<pre>+</pre>
<pre>+ /* This data structure holds the information of an abbrev.&nbsp; */<=
/pre>
<pre>+@@ -1766,9 +1852,189 @@ concat_filename (struct line_info_table *tabl=
e, unsigned int file)</pre>
<pre>+&nbsp;&nbsp; return strdup (filename);</pre>
<pre>+ }</pre>
<pre>+</pre>
<pre>++/* Number of bits in a bfd_vma.&nbsp; */</pre>
<pre>++#define VMA_BITS (8 * sizeof (bfd_vma))</pre>
<pre>++</pre>
<pre>++/* Check whether [low1, high1) can be combined with [low2, high2),</=
pre>
<pre>++&nbsp;&nbsp; i.e., they touch or overlap.&nbsp; */</pre>
<pre>++static bool ranges_overlap (bfd_vma low1,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; bfd_vma high1,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; bfd_vma low2,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; bfd_vma high2)</pre>
<pre>++{</pre>
<pre>++&nbsp; if (low1 =3D=3D low2 || high1 =3D=3D high2)</pre>
<pre>++&nbsp;&nbsp;&nbsp; return true;</pre>
<pre>++</pre>
<pre>++&nbsp; /* Sort so that low1 is below low2. */</pre>
<pre>++&nbsp; if (low1 &gt; low2)</pre>
<pre>++&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma tmp;</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D low1;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; low1 =3D low2;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; low2 =3D tmp;</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D high1;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; high1 =3D high2;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; high2 =3D tmp;</pre>
<pre>++&nbsp;&nbsp;&nbsp; }</pre>
<pre>++</pre>
<pre>++&nbsp; /* We touch iff low2 =3D=3D high1.</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; We overlap iff low2 is within [low1, high1)=
. */</pre>
<pre>++&nbsp; return (low2 &lt;=3D high1);</pre>
<pre>++}</pre>
<pre>++</pre>
<pre>++/* Insert an address range in the trie mapping addresses to compilat=
ion units.</pre>
<pre>++&nbsp;&nbsp; Will return the new trie node (usually the same as is b=
eing sent in, but</pre>
<pre>++&nbsp;&nbsp; in case of a leaf-to-interior conversion, or expansion =
of a leaf, it may be</pre>
<pre>++&nbsp;&nbsp; different), or NULL on failure.</pre>
<pre>++ */</pre>
<pre>++static struct trie_node *insert_arange_in_trie(bfd *abfd,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct trie_node *trie,<=
/pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma trie_pc,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int trie_pc_bit=
s,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct comp_unit *unit,<=
/pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma low_pc,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma high_pc)</pre>
<pre>++{</pre>
<pre>++&nbsp; bfd_vma clamped_low_pc, clamped_high_pc;</pre>
<pre>++&nbsp; int ch, from_ch, to_ch;</pre>
<pre>++&nbsp; bool is_full_leaf =3D false;</pre>
<pre>++</pre>
<pre>++&nbsp; /* See if we can extend any of the existing ranges.&nbsp; Thi=
s merging</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; isn't perfect (if merging opens up the poss=
ibility of merging two existing</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; ranges, we won't find them), but it takes t=
he majority of the cases.&nbsp; */</pre>
<pre>++&nbsp; if (trie-&gt;num_room_in_leaf &gt; 0)</pre>
<pre>++&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct trie_leaf *leaf =3D (struct tr=
ie_leaf *) trie;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int i;</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; leaf-&gt;num_sto=
red_in_leaf; ++i)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; if (leaf-&gt;ranges[i].u=
nit =3D=3D unit &amp;&amp;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
ranges_overlap(low_pc, high_pc,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; leaf-&gt;ranges=
[i].low_pc, leaf-&gt;ranges[i].high_pc))</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if (low_pc &lt; leaf-&gt;ranges[i].low_pc)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; leaf-&gt;ranges[i].low_pc =3D low_pc;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if (high_pc &gt; leaf-&gt;ranges[i].high_pc)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; leaf-&gt;ranges[i].high_pc =3D high_pc;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
return trie;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_full_leaf =3D leaf-&gt;num_stored_=
in_leaf =3D=3D trie-&gt;num_room_in_leaf;</pre>
<pre>++&nbsp;&nbsp;&nbsp; }</pre>
<pre>++</pre>
<pre>++&nbsp; /* If we're a leaf with no more room and we're _not_ at the b=
ottom,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; convert to an interior node.&nbsp; */</pre>
<pre>++&nbsp; if (is_full_leaf &amp;&amp; trie_pc_bits &lt; VMA_BITS)</pre>
<pre>++&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct trie_leaf *leaf =3D (str=
uct trie_leaf *) trie;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int i;</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trie =3D bfd_zalloc (abfd, sizeof (st=
ruct trie_interior));</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!trie)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_full_leaf =3D false;</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* TODO: If we wanted to save a littl=
e more memory at the cost of</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  complexity, we could have reus=
ed the old leaf node as one of the</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  children of the new interior n=
ode, instead of throwing it away.&nbsp; */</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; leaf-&gt;num_sto=
red_in_leaf; ++i)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; if (!insert_arange_in_tr=
ie (abfd, trie, trie_pc, trie_pc_bits,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; leaf-&gt;ranges[i].unit, leaf-&gt;ranges[i].low_pc,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; leaf-&gt;ranges[i].high_pc))</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; return NULL;=
</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</pre>
<pre>++&nbsp;&nbsp;&nbsp; }</pre>
<pre>++</pre>
<pre>++&nbsp; /* If we're a leaf with no more room and we _are_ at the bott=
om,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; we have no choice but to just make it large=
r. */</pre>
<pre>++&nbsp; if (is_full_leaf)</pre>
<pre>++&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct trie_leaf *leaf =3D (str=
uct trie_leaf *) trie;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int new_room_in_leaf =3D tri=
e-&gt;num_room_in_leaf * 2;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct trie_leaf *new_leaf;</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_leaf =3D bfd_zalloc (abfd,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof (struct trie_leaf) +</pr=
e>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; (new_room_in_leaf - TRIE=
_LEAF_SIZE) * sizeof (leaf-&gt;ranges[0]));</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_leaf-&gt;head.num_room_in_leaf =
=3D new_room_in_leaf;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_leaf-&gt;num_stored_in_leaf =3D l=
eaf-&gt;num_stored_in_leaf;</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy (new_leaf-&gt;ranges,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
leaf-&gt;ranges,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
leaf-&gt;num_stored_in_leaf * sizeof (leaf-&gt;ranges[0]));</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trie =3D &amp;new_leaf-&gt;head;</pre=
>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_full_leaf =3D false;</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Now the insert below will go throu=
gh.&nbsp; */</pre>
<pre>++&nbsp;&nbsp;&nbsp; }</pre>
<pre>++</pre>
<pre>++&nbsp; /* If we're a leaf (now with room), we can just insert at the=
 end.&nbsp; */</pre>
<pre>++&nbsp; if (trie-&gt;num_room_in_leaf &gt; 0)</pre>
<pre>++&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct trie_leaf *leaf =3D (struct tr=
ie_leaf *) trie;</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int i =3D leaf-&gt;num_store=
d_in_leaf++;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; leaf-&gt;ranges[i].unit =3D unit;</pr=
e>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; leaf-&gt;ranges[i].low_pc =3D low_pc;=
</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; leaf-&gt;ranges[i].high_pc =3D high_p=
c;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return trie;</pre>
<pre>++&nbsp;&nbsp;&nbsp; }</pre>
<pre>++</pre>
<pre>++&nbsp; /* Now we are definitely an interior node, so recurse into al=
l</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; the relevant buckets.&nbsp; */</pre>
<pre>++</pre>
<pre>++&nbsp; /* Clamp the range to the current trie bucket.&nbsp; */</pre>
<pre>++&nbsp; clamped_low_pc =3D low_pc;</pre>
<pre>++&nbsp; clamped_high_pc =3D high_pc;</pre>
<pre>++&nbsp; if (trie_pc_bits &gt; 0)</pre>
<pre>++&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma bucket_high_pc =3D</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trie_pc + ((bfd_vma)-1 &gt;&gt;=
 trie_pc_bits);&nbsp; /* Inclusive.&nbsp; */</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (clamped_low_pc &lt; trie_pc)</pre=
>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clamped_low_pc =3D trie_pc;</pr=
e>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (clamped_high_pc &gt; bucket_high_=
pc)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clamped_high_pc =3D bucket_high=
_pc;</pre>
<pre>++&nbsp;&nbsp;&nbsp; }</pre>
<pre>++</pre>
<pre>++&nbsp; /* Insert the ranges in all buckets that it spans.&nbsp; */</=
pre>
<pre>++&nbsp; from_ch =3D (clamped_low_pc &gt;&gt; (VMA_BITS - trie_pc_bits=
 - 8)) &amp; 0xff;</pre>
<pre>++&nbsp; to_ch =3D ((clamped_high_pc - 1) &gt;&gt; (VMA_BITS - trie_pc=
_bits - 8)) &amp; 0xff;</pre>
<pre>++&nbsp; for (ch =3D from_ch; ch &lt;=3D to_ch; ++ch)</pre>
<pre>++&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct trie_interior *interior =3D (s=
truct trie_interior *) trie;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct trie_node *child =3D interior-=
&gt;children[ch];</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (child =3D=3D NULL)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; child =3D alloc_trie_lea=
f (abfd);</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; if (!child)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; return NULL;=
</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; child =3D insert_arange_in_trie (abfd=
,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbs=
p; child,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbs=
p; trie_pc + ((bfd_vma)ch &lt;&lt; (VMA_BITS - trie_pc_bits - 8)),</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbs=
p; trie_pc_bits + 8,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbs=
p; unit,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbs=
p; low_pc,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbs=
p; high_pc);</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!child)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interior-&gt;children[ch] =3D child;<=
/pre>
<pre>++&nbsp;&nbsp;&nbsp; }</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp; return trie;</pre>
<pre>++}</pre>
<pre>++</pre>
<pre>++</pre>
<pre>+ static bool</pre>
<pre>+-arange_add (const struct comp_unit *unit, struct arange *first_arang=
e,</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; bfd_vma low_=
pc, bfd_vma high_pc)</pre>
<pre>++arange_add (struct comp_unit *unit, struct arange *first_arange,</pr=
e>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; struct trie_=
node **trie_root, bfd_vma low_pc, bfd_vma high_pc)</pre>
<pre>+ {</pre>
<pre>+&nbsp;&nbsp; struct arange *arange;</pre>
<pre>+</pre>
<pre>+@@ -1776,6 +2042,19 @@ arange_add (const struct comp_unit *unit, stru=
ct arange *first_arange,</pre>
<pre>+&nbsp;&nbsp; if (low_pc =3D=3D high_pc)</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; return true;</pre>
<pre>+</pre>
<pre>++&nbsp; if (trie_root !=3D NULL)</pre>
<pre>++&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *trie_root =3D insert_arange_in_trie =
(unit-&gt;file-&gt;bfd_ptr,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp; *trie_root,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp; 0,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp; 0,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp; unit,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp; low_pc,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp; high_pc);</pre>
<pre>++ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (*trie_root =3D=3D NULL)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;</pre>
<pre>++&nbsp;&nbsp;&nbsp; }</pre>
<pre>++</pre>
<pre>+&nbsp;&nbsp; /* If the first arange is empty, use it.&nbsp; */</pre>
<pre>+&nbsp;&nbsp; if (first_arange-&gt;high =3D=3D 0)</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; {</pre>
<pre>+@@ -2410,7 +2689,8 @@ decode_line_info (struct comp_unit *unit)</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; low_pc =
=3D address;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; if (address &gt; hi=
gh_pc)</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; high_pc=
 =3D address;</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp; if (!arange_add (unit, &amp;unit-&gt;arange, low_pc=
, high_pc))</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp; if (!arange_add (unit, &amp;unit-&gt;arange, &amp;u=
nit-&gt;file-&gt;trie_root,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; low_pc, h=
igh_pc))</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; goto li=
ne_fail;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; break;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DW_LNE_set_address:</=
pre>
<pre>+@@ -3134,7 +3414,7 @@ find_abstract_instance (struct comp_unit *unit,=
</pre>
<pre>+</pre>
<pre>+ static bool</pre>
<pre>+ read_ranges (struct comp_unit *unit, struct arange *arange,</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; bfd_ui=
nt64_t offset)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; struct=
 trie_node **trie_root, bfd_uint64_t offset)</pre>
<pre>+ {</pre>
<pre>+&nbsp;&nbsp; bfd_byte *ranges_ptr;</pre>
<pre>+&nbsp;&nbsp; bfd_byte *ranges_end;</pre>
<pre>+@@ -3169,7 +3449,7 @@ read_ranges (struct comp_unit *unit, struct ara=
nge *arange,</pre>
<pre>+ base_address =3D high_pc;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else</pre>
<pre>+ {</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; if (!arange_add (unit, a=
range,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; if (!arange_add (unit, a=
range, trie_root,</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; base_address + low_pc, base_address + hi=
gh_pc))</pre>
<pre>+ &nbsp;&nbsp;&nbsp; return false;</pre>
<pre>+ }</pre>
<pre>+@@ -3179,7 +3459,7 @@ read_ranges (struct comp_unit *unit, struct ara=
nge *arange,</pre>
<pre>+</pre>
<pre>+ static bool</pre>
<pre>+ read_rnglists (struct comp_unit *unit, struct arange *arange,</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; bfd_uint64_t offset)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; struct trie_node **trie_root, bfd_uint64_t offset)</pre>
<pre>+ {</pre>
<pre>+&nbsp;&nbsp; bfd_byte *rngs_ptr;</pre>
<pre>+&nbsp;&nbsp; bfd_byte *rngs_end;</pre>
<pre>+@@ -3253,19 +3533,19 @@ read_rnglists (struct comp_unit *unit, struct=
 arange *arange,</pre>
<pre>+ &nbsp; return false;</pre>
<pre>+ }</pre>
<pre>+</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!arange_add (unit, arange, low_pc=
, high_pc))</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!arange_add (unit, arange, trie_r=
oot, low_pc, high_pc))</pre>
<pre>+ return false;</pre>
<pre>+&nbsp;&nbsp; &nbsp;&nbsp;}</pre>
<pre>+ }</pre>
<pre>+</pre>
<pre>+ static bool</pre>
<pre>+ read_rangelist (struct comp_unit *unit, struct arange *arange,</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bfd_uint64_t offset)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; struct trie_node **trie_root, bfd_uint64_t offset)</pre>
<pre>+ {</pre>
<pre>+&nbsp;&nbsp; if (unit-&gt;version &lt;=3D 4)</pre>
<pre>+-&nbsp;&nbsp;&nbsp; return read_ranges (unit, arange, offset);</pre>
<pre>++&nbsp;&nbsp;&nbsp; return read_ranges (unit, arange, trie_root, offs=
et);</pre>
<pre>+&nbsp;&nbsp; else</pre>
<pre>+-&nbsp;&nbsp;&nbsp; return read_rnglists (unit, arange, offset);</pre=
>
<pre>++&nbsp;&nbsp;&nbsp; return read_rnglists (unit, arange, trie_root, of=
fset);</pre>
<pre>+ }</pre>
<pre>+</pre>
<pre>+ static struct funcinfo *</pre>
<pre>+@@ -3563,7 +3843,8 @@ scan_unit_for_symbols (struct comp_unit *unit)<=
/pre>
<pre>+</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DW_AT_ranges:</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; if (is_int_form (&a=
mp;attr)</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; !read_rangelist =
(unit, &amp;func-&gt;arange, attr.u.val))</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; !read_rangelist =
(unit, &amp;func-&gt;arange,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp; &amp;unit-&gt;file-&gt;trie_root, attr.u.val))</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; goto fa=
il;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; break;</pre>
<pre>+</pre>
<pre>+@@ -3679,7 +3960,8 @@ scan_unit_for_symbols (struct comp_unit *unit)<=
/pre>
<pre>+</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (func &amp;&amp; high_pc !=3D=
 0)</pre>
<pre>+ {</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; if (!arange_add (unit, &=
amp;func-&gt;arange, low_pc, high_pc))</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; if (!arange_add (unit, &=
amp;func-&gt;arange, &amp;unit-&gt;file-&gt;trie_root,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; low_pc, high_pc))</pre>
<pre>+ &nbsp;&nbsp;&nbsp; goto fail;</pre>
<pre>+ }</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; }</pre>
<pre>+@@ -3874,7 +4156,8 @@ parse_comp_unit (struct dwarf2_debug *stash,</p=
re>
<pre>+</pre>
<pre>+ case DW_AT_ranges:</pre>
<pre>+ &nbsp; if (is_int_form (&amp;attr)</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&amp;&amp; !read_rangelist (unit, &amp;unit-&gt;arange, attr.u.val))</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&amp;&amp; !read_rangelist (unit, &amp;unit-&gt;arange,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &amp;unit-&gt;f=
ile-&gt;trie_root, attr.u.val))</pre>
<pre>+ &nbsp;&nbsp;&nbsp; return NULL;</pre>
<pre>+ &nbsp; break;</pre>
<pre>+</pre>
<pre>+@@ -3916,7 +4199,8 @@ parse_comp_unit (struct dwarf2_debug *stash,</p=
re>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; high_pc +=3D low_pc;</pre>
<pre>+&nbsp;&nbsp; if (high_pc !=3D 0)</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; {</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!arange_add (unit, &amp;unit-&gt;=
arange, low_pc, high_pc))</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!arange_add (unit, &amp;unit-&gt;=
arange, &amp;unit-&gt;file-&gt;trie_root,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; low_pc, high_pc))</pr=
e>
<pre>+ return NULL;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; }</pre>
<pre>+</pre>
<pre>+@@ -4747,6 +5031,14 @@ _bfd_dwarf2_slurp_debug_info (bfd *abfd, bfd *=
debug_bfd,</pre>
<pre>+&nbsp;&nbsp; if (!stash-&gt;alt.abbrev_offsets)</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; return false;</pre>
<pre>+</pre>
<pre>++&nbsp; stash-&gt;f.trie_root =3D alloc_trie_leaf (abfd);</pre>
<pre>++&nbsp; if (!stash-&gt;f.trie_root)</pre>
<pre>++&nbsp;&nbsp;&nbsp; return false;</pre>
<pre>++</pre>
<pre>++&nbsp; stash-&gt;alt.trie_root =3D alloc_trie_leaf (abfd);</pre>
<pre>++&nbsp; if (!stash-&gt;alt.trie_root)</pre>
<pre>++&nbsp;&nbsp;&nbsp; return false;</pre>
<pre>++</pre>
<pre>+&nbsp;&nbsp; *pinfo =3D stash;</pre>
<pre>+</pre>
<pre>+&nbsp;&nbsp; if (debug_bfd =3D=3D NULL)</pre>
<pre>+@@ -4918,6 +5210,12 @@ stash_comp_unit (struct dwarf2_debug *stash, s=
truct dwarf2_debug_file *file)</pre>
<pre>+ &nbsp; each-&gt;next_unit =3D file-&gt;all_comp_units;</pre>
<pre>+ &nbsp; file-&gt;all_comp_units =3D each;</pre>
<pre>+</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; if (each-&gt;arange.high=
 =3D=3D 0)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
each-&gt;next_unit_without_ranges =3D file-&gt;all_comp_units_without_range=
s;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
file-&gt;all_comp_units_without_ranges =3D each-&gt;next_unit_without_range=
s;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }</pre>
<pre>++</pre>
<pre>+ &nbsp; file-&gt;info_ptr +=3D length;</pre>
<pre>+ &nbsp; return each;</pre>
<pre>+ }</pre>
<pre>diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-226=
08-2.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.=
patch</pre>
<pre>new file mode 100644</pre>
<pre>index 0000000000..8ffb500c1d</pre>
<pre>--- /dev/null</pre>
<pre>+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.pa=
tch</pre>
<pre>@@ -0,0 +1,211 @@</pre>
<pre>+From 73e97e32e1428d63d81d971176772ae69397a1a0 Mon Sep 17 00:00:00 200=
1</pre>
<pre>+From: Nick Clifton <a href=3D"mailto:nickc@redhat.com">&lt;nickc@redh=
at.com&gt;</a></pre>
<pre>+Date: Tue, 30 Aug 2022 16:01:20 +0100</pre>
<pre>+Subject: [PATCH] BFD library: Use entry 0 in directory and filename t=
ables of</pre>
<pre>+ DWARF-5 debug info.</pre>
<pre>+</pre>
<pre>+ PR 29529</pre>
<pre>+ * dwarf2.c (struct line_info_table): Add new field:</pre>
<pre>+ use_dir_and_file_0.</pre>
<pre>+ (concat_filename): Use new field to help select the correct table</p=
re>
<pre>+ slot.</pre>
<pre>+ (read_formatted_entries): Do not skip entry 0.</pre>
<pre>+ (decode_line_info): Set new field depending upon the version of</pre=
>
<pre>+ DWARF being parsed.&nbsp; Initialise filename based upon the setting=
 of</pre>
<pre>+ the new field.</pre>
<pre>+</pre>
<pre>+Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/?p=
=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D37833b966576c5d25e797ea3b6c33d0459a7=
1892">https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D3=
7833b966576c5d25e797ea3b6c33d0459a71892</a>]</pre>
<pre>+CVE: CVE-2023-22608</pre>
<pre>+</pre>
<pre>+Signed-off-by: Yash Shinde <a href=3D"mailto:Yash.Shinde@windriver.co=
m">&lt;Yash.Shinde@windriver.com&gt;</a></pre>
<pre>+</pre>
<pre>+---</pre>
<pre>+ bfd/ChangeLog&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1=
2 +++++</pre>
<pre>+ bfd/dwarf2.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 86 ++++++++++++++++++++----------</pre>
<pre>+ ld/ChangeLog&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbs=
p;|&nbsp; 5 ++</pre>
<pre>+ ld/testsuite/ld-x86-64/pr27587.err |&nbsp; 2 +-</pre>
<pre>+ 4 files changed, 76 insertions(+), 29 deletions(-)</pre>
<pre>+</pre>
<pre>+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c</pre>
<pre>+index 0ae50a37..b7839ad6 100644</pre>
<pre>+--- a/bfd/dwarf2.c</pre>
<pre>++++ b/bfd/dwarf2.c</pre>
<pre>+@@ -1571,6 +1571,7 @@ struct line_info_table</pre>
<pre>+&nbsp;&nbsp; unsigned int&nbsp;&nbsp;&nbsp; num_files;</pre>
<pre>+&nbsp;&nbsp; unsigned int&nbsp;&nbsp;&nbsp; num_dirs;</pre>
<pre>+&nbsp;&nbsp; unsigned int&nbsp;&nbsp;&nbsp; num_sequences;</pre>
<pre>++&nbsp; bool&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use_dir_and_file_0;</pre>
<pre>+&nbsp;&nbsp; char *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; comp_dir;</pre>
<pre>+&nbsp;&nbsp; char **&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
dirs;</pre>
<pre>+&nbsp;&nbsp; struct fileinfo*&nbsp;&nbsp; files;</pre>
<pre>+@@ -1791,16 +1792,30 @@ concat_filename (struct line_info_table *tabl=
e, unsigned int file)</pre>
<pre>+ {</pre>
<pre>+&nbsp;&nbsp; char *filename;</pre>
<pre>+</pre>
<pre>+-&nbsp; if (table =3D=3D NULL || file - 1 &gt;=3D table-&gt;num_files=
)</pre>
<pre>++&nbsp; /* Pre DWARF-5 entry 0 in the directory and filename tables w=
as not used.</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; So in order to save space in the tables use=
d here the info for, eg</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; directory 1 is stored in slot 0 of the dire=
ctory table, directory 2</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; in slot 1 and so on.</pre>
<pre>++</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; Starting with DWARF-5 the 0'th entry is use=
d so there is a one to one</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp; mapping between DWARF slots and internal ta=
ble entries.&nbsp; */</pre>
<pre>++&nbsp; if (! table-&gt;use_dir_and_file_0)</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; {</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* FILE =3D=3D 0 means unknown.&nbsp;=
 */</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (file)</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _bfd_error_handler</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; (_(&quot;DWARF error: ma=
ngled line number section (bad file number)&quot;));</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Pre DWARF-5, FILE =3D=3D 0 means u=
nknown.&nbsp; */</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (file =3D=3D 0)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return strdup (&quot;&lt;unknow=
n&gt;&quot;);</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- file;</pre>
<pre>++&nbsp;&nbsp;&nbsp; }</pre>
<pre>++</pre>
<pre>++&nbsp; if (table =3D=3D NULL || file &gt;=3D table-&gt;num_files)</p=
re>
<pre>++&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _bfd_error_handler</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (_(&quot;DWARF error: mangled l=
ine number section (bad file number)&quot;));</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return strdup (&quot;&lt;unknown=
&gt;&quot;);</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; }</pre>
<pre>+</pre>
<pre>+-&nbsp; filename =3D table-&gt;files[file - 1].name;</pre>
<pre>++&nbsp; filename =3D table-&gt;files[file].name;</pre>
<pre>++</pre>
<pre>+&nbsp;&nbsp; if (filename =3D=3D NULL)</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; return strdup (&quot;&lt;unknown&gt;&quot;);=
</pre>
<pre>+</pre>
<pre>+@@ -1811,12 +1826,17 @@ concat_filename (struct line_info_table *tabl=
e, unsigned int file)</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *name;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t len;</pre>
<pre>+</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (table-&gt;files[file - 1].dir</pr=
e>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (table-&gt;files[file].dir</pre>
<pre>+ &nbsp; /* PR 17512: file: 0317e960.&nbsp; */</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &amp;&amp; table-&gt;fil=
es[file - 1].dir &lt;=3D table-&gt;num_dirs</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &amp;&amp; table-&gt;fil=
es[file].dir &lt;=3D table-&gt;num_dirs</pre>
<pre>+ &nbsp; /* PR 17512: file: 7f3d2e4b.&nbsp; */</pre>
<pre>+ &nbsp; &amp;&amp; table-&gt;dirs !=3D NULL)</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subdir_name =3D table-&gt;dirs[=
table-&gt;files[file - 1].dir - 1];</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; if (table-&gt;use_dir_an=
d_file_0)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; subdir_name =
=3D table-&gt;dirs[table-&gt;files[file].dir];</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; else</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; subdir_name =
=3D table-&gt;dirs[table-&gt;files[file].dir - 1];</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</pre>
<pre>+</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!subdir_name || !IS_ABSOLUTE=
_PATH (subdir_name))</pre>
<pre>+ dir_name =3D table-&gt;comp_dir;</pre>
<pre>+@@ -1857,10 +1877,12 @@ concat_filename (struct line_info_table *tabl=
e, unsigned int file)</pre>
<pre>+</pre>
<pre>+ /* Check whether [low1, high1) can be combined with [low2, high2),</=
pre>
<pre>+&nbsp;&nbsp;&nbsp; i.e., they touch or overlap.&nbsp; */</pre>
<pre>+-static bool ranges_overlap (bfd_vma low1,</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; bfd_vma high1,</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; bfd_vma low2,</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; bfd_vma high2)</pre>
<pre>++</pre>
<pre>++static bool</pre>
<pre>++ranges_overlap (bfd_vma low1,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bfd_vma high1,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bfd_vma low2,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bfd_vma high2)</pre>
<pre>+ {</pre>
<pre>+&nbsp;&nbsp; if (low1 =3D=3D low2 || high1 =3D=3D high2)</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; return true;</pre>
<pre>+@@ -1887,15 +1909,16 @@ static bool ranges_overlap (bfd_vma low1,</pr=
e>
<pre>+ /* Insert an address range in the trie mapping addresses to compilat=
ion units.</pre>
<pre>+&nbsp;&nbsp;&nbsp; Will return the new trie node (usually the same as=
 is being sent in, but</pre>
<pre>+&nbsp;&nbsp;&nbsp; in case of a leaf-to-interior conversion, or expan=
sion of a leaf, it may be</pre>
<pre>+-&nbsp;&nbsp; different), or NULL on failure.</pre>
<pre>+- */</pre>
<pre>+-static struct trie_node *insert_arange_in_trie(bfd *abfd,</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct trie_node *trie,<=
/pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma trie_pc,</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int trie_pc_bit=
s,</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct comp_unit *unit,<=
/pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma low_pc,</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma high_pc)</pre>
<pre>++&nbsp;&nbsp; different), or NULL on failure.&nbsp; */</pre>
<pre>++</pre>
<pre>++static struct trie_node *</pre>
<pre>++insert_arange_in_trie (bfd *abfd,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct trie_node *tri=
e,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma trie_pc,</pre=
>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int trie_pc_=
bits,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct comp_unit *uni=
t,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma low_pc,</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma high_pc)</pre=
>
<pre>+ {</pre>
<pre>+&nbsp;&nbsp; bfd_vma clamped_low_pc, clamped_high_pc;</pre>
<pre>+&nbsp;&nbsp; int ch, from_ch, to_ch;</pre>
<pre>+@@ -2031,7 +2054,6 @@ static struct trie_node *insert_arange_in_trie(=
bfd *abfd,</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; return trie;</pre>
<pre>+ }</pre>
<pre>+</pre>
<pre>+-</pre>
<pre>+ static bool</pre>
<pre>+ arange_add (struct comp_unit *unit, struct arange *first_arange,</pr=
e>
<pre>+ &nbsp;&nbsp;&nbsp; struct trie_node **trie_root, bfd_vma low_pc, bfd=
_vma high_pc)</pre>
<pre>+@@ -2412,10 +2434,8 @@ read_formatted_entries (struct comp_unit *unit=
, bfd_byte **bufp,</pre>
<pre>+ &nbsp;&nbsp;&nbsp; }</pre>
<pre>+ }</pre>
<pre>+</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Skip the first &quot;zero entry&qu=
ot;, which is the compilation dir/file.&nbsp; */</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (datai !=3D 0)</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!callback (table, fe.name, =
fe.dir, fe.time, fe.size))</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; return false;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!callback (table, fe.name, fe.dir=
, fe.time, fe.size))</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; }</pre>
<pre>+</pre>
<pre>+&nbsp;&nbsp; *bufp =3D buf;</pre>
<pre>+@@ -2592,6 +2612,7 @@ decode_line_info (struct comp_unit *unit)</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!read_formatted_entries (uni=
t, &amp;line_ptr, line_end, table,</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; line_info_add_file_nam=
e))</pre>
<pre>+ goto fail;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table-&gt;use_dir_and_file_0 =3D true=
;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; }</pre>
<pre>+&nbsp;&nbsp; else</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; {</pre>
<pre>+@@ -2614,6 +2635,7 @@ decode_line_info (struct comp_unit *unit)</pre>
<pre>+ &nbsp; if (!line_info_add_file_name (table, cur_file, dir, xtime, si=
ze))</pre>
<pre>+ &nbsp;&nbsp;&nbsp; goto fail;</pre>
<pre>+ }</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table-&gt;use_dir_and_file_0 =3D fals=
e;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp; }</pre>
<pre>+</pre>
<pre>+&nbsp;&nbsp; /* Read the statement sequences until there's nothing le=
ft.&nbsp; */</pre>
<pre>+@@ -2622,7 +2644,7 @@ decode_line_info (struct comp_unit *unit)</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* State machine registers.&nbsp=
; */</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma address =3D 0;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char op_index =3D 0;</p=
re>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char * filename =3D table-&gt;num_fil=
es ? concat_filename (table, 1) : NULL;</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char * filename =3D NULL;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int line =3D 1;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int column =3D 0;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int discriminator =3D 0=
;</pre>
<pre>+@@ -2637,6 +2659,14 @@ decode_line_info (struct comp_unit *unit)</pre=
>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma low_pc&nbsp; =3D (bfd_vm=
a) -1;</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bfd_vma high_pc =3D 0;</pre>
<pre>+</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (table-&gt;num_files)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; if (table-&gt;use_dir_an=
d_file_0)</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; filename =3D=
 concat_filename (table, 0);</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; else</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; filename =3D=
 concat_filename (table, 1);</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</pre>
<pre>++</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Decode the table.&nbsp; */</p=
re>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (!end_sequence &amp;&amp; =
line_ptr &lt; line_end)</pre>
<pre>+ {</pre>
<pre>+diff --git a/ld/testsuite/ld-x86-64/pr27587.err b/ld/testsuite/ld-x86=
-64/pr27587.err</pre>
<pre>+index fa870790..807750ca 100644</pre>
<pre>+--- a/ld/testsuite/ld-x86-64/pr27587.err</pre>
<pre>++++ b/ld/testsuite/ld-x86-64/pr27587.err</pre>
<pre>+@@ -1,3 +1,3 @@</pre>
<pre>+ #...</pre>
<pre>+-.*pr27587.i:4: undefined reference to `stack_size'</pre>
<pre>++.*pr27587/&lt;artificial&gt;:4: undefined reference to `stack_size'<=
/pre>
<pre>+ #...</pre>
<pre>diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-226=
08-3.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.=
patch</pre>
<pre>new file mode 100644</pre>
<pre>index 0000000000..603824155b</pre>
<pre>--- /dev/null</pre>
<pre>+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.pa=
tch</pre>
<pre>@@ -0,0 +1,33 @@</pre>
<pre>+From 20c75f063a999f9e849a77613a82b15de78ea45f Mon Sep 17 00:00:00 200=
1</pre>
<pre>+From: Nick Clifton <a href=3D"mailto:nickc@redhat.com">&lt;nickc@redh=
at.com&gt;</a></pre>
<pre>+Date: Fri, 23 Dec 2022 13:02:04 +0000</pre>
<pre>+Subject: [PATCH] Fix illegal memory access parsing corrupt DWARF info=
rmation.</pre>
<pre>+</pre>
<pre>+ PR 29936</pre>
<pre>+ * dwarf2.c (concat_filename): Fix check for a directory index off</p=
re>
<pre>+ the end of the directory table.</pre>
<pre>+</pre>
<pre>+Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/?p=
=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D8af23b30edbaedf009bc9b243cd4dfa10ae1=
ac09">https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D8=
af23b30edbaedf009bc9b243cd4dfa10ae1ac09</a>]</pre>
<pre>+CVE: CVE-2023-22608</pre>
<pre>+</pre>
<pre>+Signed-off-by: Yash Shinde <a href=3D"mailto:Yash.Shinde@windriver.co=
m">&lt;Yash.Shinde@windriver.com&gt;</a></pre>
<pre>+</pre>
<pre>+---</pre>
<pre>+ bfd/ChangeLog | 6 ++++++</pre>
<pre>+ bfd/dwarf2.c&nbsp; | 3 ++-</pre>
<pre>+ 2 files changed, 8 insertions(+), 1 deletion(-)</pre>
<pre>+</pre>
<pre>+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c</pre>
<pre>+index b7839ad6..8b07a24c 100644</pre>
<pre>+--- a/bfd/dwarf2.c</pre>
<pre>++++ b/bfd/dwarf2.c</pre>
<pre>+@@ -1828,7 +1828,8 @@ concat_filename (struct line_info_table *table,=
 unsigned int file)</pre>
<pre>+</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (table-&gt;files[file].dir</p=
re>
<pre>+ &nbsp; /* PR 17512: file: 0317e960.&nbsp; */</pre>
<pre>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &amp;&amp; table-&gt;fil=
es[file].dir &lt;=3D table-&gt;num_dirs</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &amp;&amp; table-&gt;fil=
es[file].dir</pre>
<pre>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &lt;=3D (table-&gt;use_d=
ir_and_file_0 ? table-&gt;num_dirs - 1 : table-&gt;num_dirs)</pre>
<pre>+ &nbsp; /* PR 17512: file: 7f3d2e4b.&nbsp; */</pre>
<pre>+ &nbsp; &amp;&amp; table-&gt;dirs !=3D NULL)</pre>
<pre>+ {</pre>
</blockquote>
<p><o:p>&nbsp;</o:p></p>
<pre>-- </pre>
<pre># Randy MacLeod</pre>
<pre># Wind River Linux</pre>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_SJ1PR11MB6129A763D8105BB88C04C8D7EBAC9SJ1PR11MB6129namp_--

