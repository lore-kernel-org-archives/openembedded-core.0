Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19514C7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 07:25:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7124.1685690721792167536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 00:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=V10YPCIP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55177065e7=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3527BOCQ012321
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Jun 2023 00:25:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=p8ZJpmLsrWw2+BUpXWMMrfHLlCTVoEqcIeLWGiS/TSY=;
 b=V10YPCIPbD93pFkcC5bowENC2GUvaZB8s6S/cq6+Zq/q1BkHowzdfpgt7hgKA7qcXl2y
 3eYRuNDdTX/e7ZsvRENA2dYGZG8jZHNqBhkp9qBCkr8L2vNYnUYSzslPRLO7VoGwftpT
 meLvGEXlm1v+mEgCdo3hu6so2qBzTDK/QKo31aQaODmhgjdie3YyLqiK9mqTo6PNo+A4
 09ZgCghouCIfxkJJKBvZDH71dgaZPGGg+np00cwV360HkjfzCeFjTvGxRtsSEvHyw2mp
 NxNqWvs8zHlFDJJCgE1ctribG/okU61wdBnVqyZm5UAQA14TIY/PjTFSjmayAMEH+mfE 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjdber-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 00:25:19 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3527PJqQ001279
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Jun 2023 00:25:19 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjdbep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 00:25:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FoQgCNkC8ORsbQhY1PgYFwQESUSuIRMxUQTxmUFOx24n+NvX14EWajVy0pIgNX40RjKUfJ29ngJnRY1+b7LbydO1I+xq5ybYihv5cMykabD02CTFviAifZ5z/FT0Ge0kMD4kyHBPGYSH3xx3BqUH1HeT8dzPyrBlF8T+cOht+2DRvTsLdUd4gadRNL5sH9/HJi1PJbomelvJJqB38/Rw7ejQbh7eSWV0kntSTzag9t7uznKXVrcfXsakjYU2ZKNdutm3tbovtOpDsvsqLafdkNPRC1TAxGpQ9yRrYkvfd/YU9MBpbzehZgjY0E95rjG3OQMO8+gqBN9LnApjocuqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8ZJpmLsrWw2+BUpXWMMrfHLlCTVoEqcIeLWGiS/TSY=;
 b=b0Cuwqy5uySXbF4vaW5ZnLP+NyK6AoTWP1IUS7uLqt65RhmLTeWxSK5z5jraqJ4WnrTp0Nk1aai+yrWVMLLMUXTkSkbnsLotUmThNakEcJt8F8Vtqt3T9ZgGKd25UUiKIJOgrubuE+okBXUTSRoTBIzht0ssJp/IleVlWkGG5+aa5nE7iaMpD3t7Yp22cC8NG3X+92eCgWzBQh2FlOE0K0IUWCruD728LVJoXdR2rqpoR2S3XQZSj/JW0VrpSg2Oc6V6zbYuwGdp/Fr8EBcqISoQ2Mbglb2PuutYwJpTH0QGtxQDiZ8WF7n1r1a/B1pZSvgwh4nCi4KOZBKQCfKNaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Fri, 2 Jun
 2023 07:25:13 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b29f:c09e:71b3:df12]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b29f:c09e:71b3:df12%4]) with mapi id 15.20.6455.024; Fri, 2 Jun 2023
 07:25:12 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Kallapa, Umesh"
	<Umesh.Kallapa@windriver.com>,
        "Gowda, Naveen" <Naveen.Gowda@windriver.com>,
        "Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>
Subject: RE: [PATCH v14] Rust Oe-Selftest implementation
Thread-Topic: [PATCH v14] Rust Oe-Selftest implementation
Thread-Index: AQHZkuTFrue5rkJstE6ePHeUChW9Gq9y2A4AgAEaWwCAAy0PEw==
Date: Fri, 2 Jun 2023 07:25:11 +0000
Message-ID: 
 <SJ1PR11MB61294CC48FD3D027E729C03CEB4EA@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20230530105125.445622-1-yashinde145@gmail.com>
 <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
 <CH2PR11MB4470880E838BBC66386FA2A489489@CH2PR11MB4470.namprd11.prod.outlook.com>
In-Reply-To: 
 <CH2PR11MB4470880E838BBC66386FA2A489489@CH2PR11MB4470.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DM4PR11MB6527:EE_
x-ms-office365-filtering-correlation-id: 7974a2a3-282d-4151-9d7e-08db633a8095
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tD5GagQzWo1kE+F85P7iSBUYF1MjAUv1NWFQswSJl+xCXSXu39IPL1CgGxmPAVHbEwXsFHmUAdwpeHnSpBR65S/NMUpHyYAfk5Wy5AMtQ9uJrqf09nT6L0jK8S0KPLgVQycrOekIhCIxbRLU9BP4z3fYupSIFApsY/wRKYJTPIFp6kk3LVA/cKdmVrmop0tZ09LdlKF/rkE9aH76Z7Nit0/6T66KyNdJu6j/xFcX0a+ob6gXy53hTRi7LzuzBo8aP/7YpA97piSTEMVwo4F9AECRUBwXbe4IYVLi6W1LBr6lrqpCvuH0at/MhDcwAsio3nbsQzKHme3fUjozasZDI478G4NhRzK0/lppIvaNO+dQLBu3h6Y3qqYzx2EEiC44fOeVs4KX97Fr7s8/PTl8ITLtWTdHUtW1g38YU/+2E87L0kdIeMFTOZ6R7eB9DMta4VJ6msz4bjfoUJccfKQIRBrShqtzY5zPZgzwHeTgivNldoEfK+n9Q1yGkLAAV4nY4xgAl4/feufn29eIKtM4+FpbNkarwyz0L5tXjtGUmHKmsPvIiKTDTOAwx0SJ/n6UcLlx7evsDLr813vBObWc8GQegpcUqB5kh4Y7EnVXX6ZMWI2CzkCQlMts4Ps07EG7mpSmsiXkIT4RVvFtyKjOqg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(376002)(39850400004)(451199021)(186003)(478600001)(86362001)(76116006)(7696005)(33656002)(316002)(66446008)(41300700001)(966005)(66556008)(66946007)(71200400001)(4326008)(66476007)(64756008)(84970400001)(54906003)(110136005)(38070700005)(52536014)(107886003)(55016003)(166002)(99936003)(5660300002)(26005)(9686003)(30864003)(2906002)(83380400001)(6506007)(8676002)(8936002)(122000001)(9326002)(53546011)(38100700002)(559001)(579004)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?V+6oH88uV26ED1nWOcczQX9GGvfI1684I4Pl7Dee2pMSjP+SWwGWSv03Y34H?=
 =?us-ascii?Q?EBQGhqcYE7pFJ2GquzlIJwMIGp/z5l+tOe9+e5g/4IjXs+ELMRDKzfrRd03M?=
 =?us-ascii?Q?x6WW+1JbXwmwei/LjdeJziUklzz5Gon4unx3CmEYFTyv0603OjPwn5/rReAc?=
 =?us-ascii?Q?h2gOMmYvPEHoCIZ0wyTYwQP4bD9vpieJ1+EkG+77qTgvy41PN3H4YPekFQe7?=
 =?us-ascii?Q?fxHFhaRpbmgGoq58HfLICU0JdTv/E+fTgSwtK5X3TkOw7/eyvzB80UNvZalu?=
 =?us-ascii?Q?TtxuLP4IVZy1tCPIp0TB5EKWXQpQlhQbmxrJbQYi60MZFTvIPp6vsaS81rsk?=
 =?us-ascii?Q?b7PVUkoLIO2y3K67Xm4LL2sLb9FtbfFRqQ5/iaD6wGnH4UObTtrbFDwHkyAP?=
 =?us-ascii?Q?GMgt9sWj7tTdlDxcrXkQXXxxSmeyzy4wDivqk1ngFTN6tKdHTq/kWUloOJj5?=
 =?us-ascii?Q?mNuulD9WYf3T08qFHoYM6Blf/047peRcciRj9LQint1+GOts5hI+kpLeVEJc?=
 =?us-ascii?Q?mbHHK8w+1cOQ4lo3t1mmpGFXWH09ob84X8I8DU3kazdOQyTdJ0BsXjNo2Xgb?=
 =?us-ascii?Q?LLCl4IqvPt5p7EHAKlbNvXSVMFa1p2CGN9xsEx7svPAYUvubm5kpAG/Eq04V?=
 =?us-ascii?Q?FgY6bhEavLBy9a9zClri/LEUif/tuj+LciLD6gBRIFPBELw90A1CoyeaULJq?=
 =?us-ascii?Q?ylhbsff8OCO7RLBk4mCoosWD1Erlz4HlMFg4LjUXHnhselhwZ76/t6s6/goD?=
 =?us-ascii?Q?JtX4zKxnQrYi5AxejTleR91yuGHKx46zVnuWG0ijQXtEw8pJl2mt5dvY/I+f?=
 =?us-ascii?Q?boaw9lFqVE+UI36X7KKSEE7T9HVQxhNoETp8wMVfo5JIIocPGr6ZyUfiFqWZ?=
 =?us-ascii?Q?wDedAtda2biFaDd/tho+fX8osLTioj302EV9qhgH0kDpEymGR45VJyNXtJxE?=
 =?us-ascii?Q?SCgWGzuANi6ion7z71oKHzo2j/+GBSRRPYqxJEoz0JYl+R0Aw6F9SShEK2aF?=
 =?us-ascii?Q?lKkFWrGFVOGP0d+FTaEvT2vNmD4jX1kqKULFI2cmjIeTYi4IO/WqL7P8pESL?=
 =?us-ascii?Q?bQhnZJ98Vn5a1ayPvU/9+8IICiLTcoJ+IYx599TkkQU8yGxZC257RI3ogJVM?=
 =?us-ascii?Q?+lg1SiGAHelbTyBS/T3c7UolUO6Squq67m4EL320JS+Y9WTn7qh6hpzPl0Gr?=
 =?us-ascii?Q?QH1OCtVeKZzG8Vi8drGV/iBWHjjev/7srGAPQYinaVRPjv+uUzUXJ3cQiLha?=
 =?us-ascii?Q?MR22FZUqGm+DLOdS8Nb7IE/4RB+4ARfmXvOV5QMibcPi1CELcKLmKnL6gHy8?=
 =?us-ascii?Q?ykFheriz0vlCNM2tXd9QR3VjdQnjy/Esojr0v/IfCbAfm0ibzmb2qE9UeSI3?=
 =?us-ascii?Q?IAO7JUHCLEcvn38Cn+57QT565I86wwmf5kBtATuoAhkYnTVDe4z4u6OgTZYV?=
 =?us-ascii?Q?+ae1Jiy4xFkknIRlJ0e9YzmwCFBMi/WCd53HBcjwmH5HJyW2rrveKD+sZjGv?=
 =?us-ascii?Q?5l3N9JarRFZ+K21VHa5qLc3X56ZCgXphtCe1VG3TKpuwZpMEqdjWUnrfQL7w?=
 =?us-ascii?Q?iBpeE2cuWclDZwSsahe+bJRw0razSWDQTbFl/HKEayo3YK7aCRnspVaiPu2m?=
 =?us-ascii?Q?HRCaaOZrxtxFZmqwyM+/z9M=3D?=
Content-Type: multipart/related;
	boundary="_004_SJ1PR11MB61294CC48FD3D027E729C03CEB4EASJ1PR11MB6129namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7974a2a3-282d-4151-9d7e-08db633a8095
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 07:25:11.9005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QG4Dj4Zh9HsYTjlXaPUPj42lqy3bF00+MGB1ngHmh01e4Lx/8IQChT2xf4kQWnNSp8cPrdPZxk9OXNwR0vgFxRPJUsarVN7nSUM5WiSp02U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6527
X-Proofpoint-GUID: 6eFRScUFnhwiVxoG-SOFRKZyZX7tHcFK
X-Proofpoint-ORIG-GUID: vN2RRRUQCUU8rfimXxGUHafF2_BnnuTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_04,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 07:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182145

--_004_SJ1PR11MB61294CC48FD3D027E729C03CEB4EASJ1PR11MB6129namp_
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB61294CC48FD3D027E729C03CEB4EASJ1PR11MB6129namp_"

--_000_SJ1PR11MB61294CC48FD3D027E729C03CEB4EASJ1PR11MB6129namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

As discussed in the meeting, I am sharing the steps followed and host confi=
gurations used for the testing-

Steps followed for testing-

1. Clone a fresh poky from $ git clone git://git.yoctoproject.org/poky
2. source the build environment setup script
3. add the meta-selftest layer in conf/bblayers.conf
4. add SANITY_TESTED_DISTROS=3D"" to local.conf
5. Apply the testing patch changes-
   a. Add  meta/lib/oeqa/selftest/cases/rust.py file containing testing cod=
e
   b. Add meta/recipes-devtools/rust/files/rust-oe-selftest.patch to exclud=
e failing cases.
   c. Add rust-oe-selftest.patch in meta/recipes-devtools/rust/rust-source.=
inc to apply on rust sources.
   d. Add "do_test_compile ()" for testing rust sources in meta/recipes-dev=
tools/rust/rust_1.69.0.bb
   e. Run the oe-selftest via "oe-selftest -r rust.RustSelfTestBase.test_ch=
eck" command.


Host configurations-

Linux ala-lpggp3 5.15.0-56-generic #62-Ubuntu SMP Tue Nov 22 19:54:14 UTC 2=
022 x86_64 x86_64 x86_64 GNU/Linux

Architecture:            x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Address sizes:         46 bits physical, 48 bits virtual
  Byte Order:            Little Endian
CPU(s):                  192
  On-line CPU(s) list:   0-191
Vendor ID:               GenuineIntel
  Model name:            Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz
    CPU family:          6
    Model:               79
    Thread(s) per core:  2
    Core(s) per socket:  24
    Socket(s):           4
    Stepping:            1
    CPU max MHz:         3400.0000
    CPU min MHz:         1200.0000
    BogoMIPS:            4399.78
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr p=
ge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2
                         ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant=
_tsc arch_perfmon pebs bts rep_good nopl xtopology nonsto     p_tsc cpuid a=
perfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fm=
a cx16 xtpr pdcm pc     id dca sse4_1 sse4_2 x2apic movbe popcnt tsc_deadli=
ne_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowpref      etch cpuid_fa=
ult epb cat_l3 cdp_l3 invpcid_single intel_ppin ssbd ibrs ibpb stibp tpr_sh=
adow vnmi flexprior      ity ept vpid ept_ad fsgsbase tsc_adjust bmi1 hle a=
vx2 smep bmi2 erms invpcid rtm cqm rdt_a rdseed adx smap
                         intel_pt xsaveopt cqm_llc cqm_occup_llc cqm_mbm_to=
tal cqm_mbm_local dtherm ida arat pln pts md_clear flush_l1d

Packages installed-

gcc (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0
g++ (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0
Python 3.10.6
rustc 1.69.0 (84c898d65 2023-04-16)
BitBake Build Tool Core version 2.4.0
OpenSSL 3.0.2 15 Mar 2022 (Library: OpenSSL 3.0.2 15 Mar 2022)
OpenSSH_8.9p1 Ubuntu-3, OpenSSL 3.0.2 15 Mar 2022

accountsservice/jammy-security,jammy-updates,now 22.07.5-2ubuntu1.3 amd64 [=
installed]
acl/jammy,now 2.3.1-1 amd64 [installed,automatic]
adduser/jammy,jammy,now 3.118ubuntu5 all [installed]
adwaita-icon-theme/jammy,jammy,now 41.0-1ubuntu1 all [installed,automatic]
amd64-microcode/jammy,now 3.20191218.1ubuntu2 amd64 [installed,automatic]
apache2-bin/jammy-security,now 2.4.52-1ubuntu4.4 amd64 [installed,upgradabl=
e to: 2.4.52-1ubuntu4.5]
apache2-data/jammy-security,jammy-security,now 2.4.52-1ubuntu4.4 all [insta=
lled,upgradable to: 2.4.52-1ubuntu4.5]
apache2-utils/jammy-security,now 2.4.52-1ubuntu4.4 amd64 [installed,upgrada=
ble to: 2.4.52-1ubuntu4.5]
apache2/jammy-security,now 2.4.52-1ubuntu4.4 amd64 [installed,upgradable to=
: 2.4.52-1ubuntu4.5]
apparmor/now 3.0.4-2ubuntu2.1 amd64 [installed,upgradable to: 3.0.4-2ubuntu=
2.2]
apt-transport-https/now 2.4.8 all [installed,upgradable to: 2.4.9]
apt-utils/now 2.4.8 amd64 [installed,upgradable to: 2.4.9]
apt/now 2.4.8 amd64 [installed,upgradable to: 2.4.9]
aptitude-common/jammy,jammy,now 0.8.13-3ubuntu1 all [installed,automatic]
aptitude/jammy,now 0.8.13-3ubuntu1 amd64 [installed]
arping/jammy,now 2.22-1 amd64 [installed]
autoconf/jammy,jammy,now 2.71-2 all [installed]
autofs/jammy-updates,now 5.1.8-1ubuntu1.2 amd64 [installed]
automake/jammy,jammy,now 1:1.16.5-1.3 all [installed]
autopoint/jammy,jammy,now 0.21-4ubuntu4 all [installed]
autotools-dev/jammy,jammy,now 20220109.1 all [installed,automatic]
base-files/now 12ubuntu4.2 amd64 [installed,upgradable to: 12ubuntu4.3]
base-passwd/jammy,now 3.5.52build1 amd64 [installed]
bash-completion/jammy,jammy,now 1:2.11-5ubuntu1 all [installed]
bash/jammy,now 5.1-6ubuntu1 amd64 [installed]
bc/jammy,now 1.07.1-3build1 amd64 [installed,automatic]
bind9-dnsutils/jammy-security,now 1:9.18.1-1ubuntu1.3 amd64 [installed,upgr=
adable to: 1:9.18.12-0ubuntu0.22.04.1]
bind9-host/jammy-security,now 1:9.18.1-1ubuntu1.3 amd64 [installed,upgradab=
le to: 1:9.18.12-0ubuntu0.22.04.1]
bind9-libs/jammy-security,now 1:9.18.1-1ubuntu1.3 amd64 [installed,upgradab=
le to: 1:9.18.12-0ubuntu0.22.04.1]
binutils-common/jammy-security,jammy-updates,now 2.38-4ubuntu2.2 amd64 [ins=
talled,automatic]
binutils-x86-64-linux-gnu/jammy-security,jammy-updates,now 2.38-4ubuntu2.2 =
amd64 [installed,automatic]
binutils/jammy-security,jammy-updates,now 2.38-4ubuntu2.2 amd64 [installed,=
automatic]
bison/jammy,now 2:3.8.2+dfsg-1build1 amd64 [installed]
bsdextrautils/jammy,now 2.37.2-4ubuntu3 amd64 [installed,automatic]
bsdmainutils/jammy,jammy,now 12.1.7+nmu3ubuntu2 all [installed]
bsdutils/jammy,now 1:2.37.2-4ubuntu3 amd64 [installed]
btrfs-progs/jammy,now 5.16.2-1 amd64 [installed]
bubblewrap/jammy,now 0.6.1-1 amd64 [installed,automatic]
busybox-initramfs/jammy,now 1:1.30.1-7ubuntu3 amd64 [installed]
busybox-static/jammy,now 1:1.30.1-7ubuntu3 amd64 [installed]
byobu/jammy,jammy,now 5.133-1 all [installed]
bzip2/jammy,now 1.0.8-5build1 amd64 [installed]
ca-certificates-java/jammy-security,jammy-security,jammy-updates,jammy-upda=
tes,now 20190909ubuntu1.2 all [installed,automatic]
ca-certificates/jammy-security,jammy-security,jammy-updates,jammy-updates,n=
ow 20230311ubuntu0.22.04.1 all [installed]
cargo/jammy-security,jammy-updates,now 0.66.0+ds0ubuntu0.libgit2-0ubuntu0.2=
2.04 amd64 [installed]
cgroup-lite/jammy,jammy,now 1.15 all [installed]
cgroup-tools/jammy,now 2.0-2 amd64 [installed]
choria/ubuntu,now 0.27.0+jammy amd64 [installed]
chrpath/jammy,now 0.16-2 amd64 [installed]
cmake-data/jammy-updates,jammy-updates,now 3.22.1-1ubuntu1.22.04.1 all [ins=
talled,automatic]
cmake/jammy-updates,now 3.22.1-1ubuntu1.22.04.1 amd64 [installed]
command-not-found-data/now 18.04.6 amd64 [installed,local]
command-not-found/jammy,jammy,now 22.04.0 all [installed]
console-setup-linux/jammy,jammy,now 1.205ubuntu3 all [installed]
console-setup/jammy,jammy,now 1.205ubuntu3 all [installed]
containerd.io/jammy,now 1.6.13-1 amd64 [installed,upgradable to: 1.6.21-1]
coreutils/jammy,now 8.32-4.1ubuntu1 amd64 [installed]
cpio/jammy,now 2.13+dfsg-7 amd64 [installed]
cpp-11/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [inst=
alled,automatic]
cpp-7/now 7.5.0-6ubuntu2 amd64 [installed,local]
cpp-9/jammy-security,jammy-updates,now 9.5.0-1ubuntu1~22.04 amd64 [installe=
d,automatic]
cpp/jammy,now 4:11.2.0-1ubuntu1 amd64 [installed,automatic]
cpulimit/jammy,now 2.7-2 amd64 [installed]
cron/jammy,now 3.0pl1-137ubuntu3 amd64 [installed]
cscope/jammy,now 15.9-1 amd64 [installed]
csh/jammy,now 20110502-7 amd64 [installed]
curl/jammy-security,jammy-updates,now 7.81.0-1ubuntu1.10 amd64 [installed]
dash/jammy,now 0.5.11+git20210903+057cd650a4ed-3build1 amd64 [installed]
dbus-user-session/jammy-security,jammy-updates,now 1.12.20-2ubuntu4.1 amd64=
 [installed,automatic]
dbus/jammy-security,jammy-updates,now 1.12.20-2ubuntu4.1 amd64 [installed]
dconf-gsettings-backend/jammy,now 0.40.0-3 amd64 [installed,automatic]
dconf-service/jammy,now 0.40.0-3 amd64 [installed,automatic]
debconf-i18n/jammy,jammy,now 1.5.79ubuntu1 all [installed]
debconf/jammy,jammy,now 1.5.79ubuntu1 all [installed]
debianutils/jammy,now 5.5-1ubuntu2 amd64 [installed]
desktop-file-utils/jammy,now 0.26-1ubuntu3 amd64 [installed,automatic]
dh-elpa-helper/jammy,jammy,now 2.0.9ubuntu1 all [installed,automatic]
dictionaries-common/jammy,jammy,now 1.28.14 all [installed,automatic]
diffstat/jammy,now 1.64-1build2 amd64 [installed]
diffutils/jammy,now 1:3.8-0ubuntu2 amd64 [installed]
dirmngr/jammy-security,jammy-updates,now 2.2.27-3ubuntu2.1 amd64 [installed=
,automatic]
distro-info-data/now 0.52ubuntu0.2 all [installed,upgradable to: 0.52ubuntu=
0.4]
dmidecode/jammy-updates,now 3.3-3ubuntu0.1 amd64 [installed]
dmsetup/jammy,now 2:1.02.175-2.1ubuntu4 amd64 [installed]
dnsutils/jammy-security,jammy-security,now 1:9.18.1-1ubuntu1.3 all [install=
ed,upgradable to: 1:9.18.12-0ubuntu0.22.04.1]
docker-ce-cli/jammy,now 5:20.10.22~3-0~ubuntu-jammy amd64 [installed,upgrad=
able to: 5:24.0.2-1~ubuntu.22.04~jammy]
docker-ce/jammy,now 5:20.10.22~3-0~ubuntu-jammy amd64 [installed,upgradable=
 to: 5:24.0.2-1~ubuntu.22.04~jammy]
dosfstools/jammy,now 4.2-1build3 amd64 [installed]
dpkg-dev/jammy-security,jammy-security,now 1.21.1ubuntu2.1 all [installed,u=
pgradable to: 1.21.1ubuntu2.2]
dpkg/jammy-security,now 1.21.1ubuntu2.1 amd64 [installed,upgradable to: 1.2=
1.1ubuntu2.2]
e2fsprogs/jammy-security,jammy-updates,now 1.46.5-2ubuntu1.1 amd64 [install=
ed]
ed/jammy,now 1.18-1 amd64 [installed]
efibootmgr/jammy,now 17-1ubuntu2 amd64 [installed,automatic]
eject/jammy,now 2.37.2-4ubuntu3 amd64 [installed]
emacs-bin-common/jammy,now 1:27.1+1-3ubuntu5 amd64 [installed,automatic]
emacs-common/jammy,jammy,now 1:27.1+1-3ubuntu5 all [installed,automatic]
emacs-gtk/jammy,now 1:27.1+1-3ubuntu5 amd64 [installed,automatic]
emacs/jammy,jammy,now 1:27.1+1-3ubuntu5 all [installed]
emacsen-common/jammy,jammy,now 3.0.4 all [installed,automatic]
evince-common/now 42.3-0ubuntu2 all [installed,upgradable to: 42.3-0ubuntu3=
]
evince/now 42.3-0ubuntu2 amd64 [installed,upgradable to: 42.3-0ubuntu3]
exo-utils/jammy,now 4.16.3-1 amd64 [installed,automatic]
expect/jammy,now 5.45.4-2build1 amd64 [installed]
exuberant-ctags/jammy-security,jammy-updates,now 1:5.9~svn20110310-16ubuntu=
0.22.04.1 amd64 [installed]
fdisk/jammy,now 2.37.2-4ubuntu3 amd64 [installed]
file/jammy,now 1:5.41-3 amd64 [installed]
findutils/jammy,now 4.8.0-1ubuntu3 amd64 [installed]
finger/jammy,now 0.17-17 amd64 [installed]
flex/jammy,now 2.6.4-8build2 amd64 [installed]
fontconfig-config/jammy,jammy,now 2.13.1-4.2ubuntu5 all [installed,automati=
c]
fontconfig/jammy,now 2.13.1-4.2ubuntu5 amd64 [installed,automatic]
fonts-dejavu-core/jammy,jammy,now 2.37-2build1 all [installed,automatic]
fonts-urw-base35/jammy,jammy,now 20200910-1 all [installed,automatic]
friendly-recovery/jammy,jammy,now 0.2.42 all [installed]
ftp/jammy,jammy,now 20210827-4build1 all [installed]
fuse3/jammy,now 3.10.5-1build1 amd64 [installed,automatic]
g++-11/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [inst=
alled,automatic]
g++/jammy,now 4:11.2.0-1ubuntu1 amd64 [installed]
gawk/jammy,now 1:5.1.0-1build3 amd64 [installed]
gcc-11-base/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 =
[installed,automatic]
gcc-11-multilib/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 am=
d64 [installed,automatic]
gcc-11/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [inst=
alled,automatic]
gcc-12-base/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [i=
nstalled,automatic]
gcc-12-base/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 i386 [in=
stalled,automatic]
gcc-7-base/now 7.5.0-6ubuntu2 amd64 [installed,local]
gcc-7-multilib/now 7.5.0-6ubuntu2 amd64 [installed,local]
gcc-7/now 7.5.0-6ubuntu2 amd64 [installed,local]
gcc-8-base/now 8.4.0-3ubuntu2 amd64 [installed,local]
gcc-9-base/jammy-security,jammy-updates,now 9.5.0-1ubuntu1~22.04 amd64 [ins=
talled,automatic]
gcc-9-multilib/jammy-security,jammy-updates,now 9.5.0-1ubuntu1~22.04 amd64 =
[installed,automatic]
gcc-9/jammy-security,jammy-updates,now 9.5.0-1ubuntu1~22.04 amd64 [installe=
d,automatic]
gcc-multilib/jammy,now 4:11.2.0-1ubuntu1 amd64 [installed]
gcc/jammy,now 4:11.2.0-1ubuntu1 amd64 [installed]
gdb/jammy-updates,now 12.1-0ubuntu1~22.04 amd64 [installed]
gedit-common/jammy,jammy,now 41.0-3 all [installed,automatic]
gedit/jammy,now 41.0-3 amd64 [installed]
geoip-database/jammy,jammy,now 20191224-3 all [installed]
gettext-base/jammy,now 0.21-4ubuntu4 amd64 [installed]
gettext/jammy,now 0.21-4ubuntu4 amd64 [installed,automatic]
gh/jammy,now 2.4.0+dfsg1-2 amd64 [installed]
gir1.2-atk-1.0/jammy,now 2.36.0-3build1 amd64 [installed,automatic]
gir1.2-freedesktop/jammy,now 1.72.0-1 amd64 [installed,automatic]
gir1.2-gdkpixbuf-2.0/jammy-updates,now 2.42.8+dfsg-1ubuntu0.2 amd64 [instal=
led,automatic]
gir1.2-glib-2.0/jammy,now 1.72.0-1 amd64 [installed]
gir1.2-gtk-3.0/jammy-updates,now 3.24.33-1ubuntu2 amd64 [installed,automati=
c]
gir1.2-gtksource-3.0/jammy,now 3.24.11-2build1 amd64 [installed,automatic]
gir1.2-gtksource-4/jammy,now 4.8.3-1 amd64 [installed,automatic]
gir1.2-harfbuzz-0.0/jammy-security,jammy-updates,now 2.7.4-1ubuntu3.1 amd64=
 [installed,automatic]
gir1.2-pango-1.0/jammy,now 1.50.6+ds-2 amd64 [installed,upgradable to: 1.50=
.6+ds-2ubuntu1]
gir1.2-peas-1.0/jammy,now 1.32.0-1 amd64 [installed,automatic]
git-email/now 1:2.39.0-0ppa1~ubuntu22.04.1 all [installed,upgradable to: 1:=
2.40.1-0ppa1~ubuntu22.04.1]
git-man/now 1:2.39.0-0ppa1~ubuntu22.04.1 all [installed,upgradable to: 1:2.=
40.1-0ppa1~ubuntu22.04.1]
git-review/jammy,jammy,now 2.2.0-1 all [installed]
git/now 1:2.39.0-0ppa1~ubuntu22.04.1 amd64 [installed,upgradable to: 1:2.40=
.1-0ppa1~ubuntu22.04.1]
gnome-desktop3-data/jammy-updates,jammy-updates,now 42.5-0ubuntu1 all [inst=
alled,automatic]
gnome-terminal-data/jammy,jammy,now 3.44.0-1ubuntu1 all [installed,automati=
c]
gnome-terminal/jammy,now 3.44.0-1ubuntu1 amd64 [installed]
gnupg-l10n/jammy-security,jammy-security,jammy-updates,jammy-updates,now 2.=
2.27-3ubuntu2.1 all [installed,automatic]
gnupg-utils/jammy-security,jammy-updates,now 2.2.27-3ubuntu2.1 amd64 [insta=
lled,automatic]
gnupg/jammy-security,jammy-security,jammy-updates,jammy-updates,now 2.2.27-=
3ubuntu2.1 all [installed]
gpg-agent/jammy-security,jammy-updates,now 2.2.27-3ubuntu2.1 amd64 [install=
ed,automatic]
gpg-wks-client/jammy-security,jammy-updates,now 2.2.27-3ubuntu2.1 amd64 [in=
stalled,automatic]
gpg-wks-server/jammy-security,jammy-updates,now 2.2.27-3ubuntu2.1 amd64 [in=
stalled,automatic]
gpg/jammy-security,jammy-updates,now 2.2.27-3ubuntu2.1 amd64 [installed,aut=
omatic]
gpgconf/jammy-security,jammy-updates,now 2.2.27-3ubuntu2.1 amd64 [installed=
,automatic]
gpgsm/jammy-security,jammy-updates,now 2.2.27-3ubuntu2.1 amd64 [installed,a=
utomatic]
gpgv/jammy-security,jammy-updates,now 2.2.27-3ubuntu2.1 amd64 [installed]
grep/jammy,now 3.7-1build1 amd64 [installed]
groff-base/jammy,now 1.22.4-8build1 amd64 [installed]
groff/jammy,now 1.22.4-8build1 amd64 [installed]
grub-common/jammy,now 2.06-2ubuntu7 amd64 [installed,upgradable to: 2.06-2u=
buntu7.1]
grub-efi-amd64-bin/jammy-security,now 2.06-2ubuntu10 amd64 [installed,upgra=
dable to: 2.06-2ubuntu14.1]
grub-efi-amd64-signed/jammy-security,now 1.182~22.04.1+2.06-2ubuntu10 amd64=
 [installed,upgradable to: 1.187.3~22.04.1+2.06-2ubuntu14.1]
grub-efi-amd64/jammy-security,now 2.06-2ubuntu10 amd64 [installed,upgradabl=
e to: 2.06-2ubuntu14.1]
grub2-common/jammy,now 2.06-2ubuntu7 amd64 [installed,upgradable to: 2.06-2=
ubuntu7.1]
gsettings-desktop-schemas/jammy,jammy,now 42.0-1ubuntu1 all [installed,auto=
matic]
gstreamer1.0-plugins-base/jammy,now 1.20.1-1 amd64 [installed,automatic]
gtk-update-icon-cache/jammy-updates,now 3.24.33-1ubuntu2 amd64 [installed,a=
utomatic]
gzip/jammy-updates,now 1.10-4ubuntu4.1 amd64 [installed]
haveged/jammy,now 1.9.14-1ubuntu1 amd64 [installed]
hdparm/jammy,now 9.60+ds-1build3 amd64 [installed]
help2man/jammy,now 1.49.1 amd64 [installed]
hicolor-icon-theme/jammy,jammy,now 0.17-2 all [installed,automatic]
hostname/jammy,now 3.23ubuntu2 amd64 [installed]
htop/jammy,now 3.0.5-7build2 amd64 [installed]
humanity-icon-theme/jammy,jammy,now 0.6.16 all [installed,automatic]
hyperfine/jammy-security,jammy-updates,now 1.12.0-3ubuntu0.1 amd64 [install=
ed]
iamerican/jammy,jammy,now 3.4.02-2 all [installed]
ienglish-common/jammy,jammy,now 3.4.02-2 all [installed,automatic]
ifupdown/jammy,now 0.8.36+nmu1ubuntu3 amd64 [installed]
info/jammy,now 6.8-4build1 amd64 [installed]
init-system-helpers/jammy,jammy,now 1.62 all [installed]
init/jammy,now 1.62 amd64 [installed]
initramfs-tools-bin/jammy-updates,now 0.140ubuntu13.1 amd64 [installed]
initramfs-tools-core/jammy-updates,jammy-updates,now 0.140ubuntu13.1 all [i=
nstalled]
initramfs-tools/jammy-updates,jammy-updates,now 0.140ubuntu13.1 all [instal=
led]
install-info/jammy,now 6.8-4build1 amd64 [installed]
installation-report/now 2.62ubuntu1 all [installed,local]
intel-microcode/jammy-security,jammy-updates,now 3.20230214.0ubuntu0.22.04.=
1 amd64 [installed,automatic]
iotop/jammy,now 0.6-24-g733f3f8-1.1build2 amd64 [installed]
iperf3/jammy,now 3.9-1build1 amd64 [installed]
iproute2/jammy,now 5.15.0-1ubuntu2 amd64 [installed]
iptables-persistent/jammy,jammy,now 1.0.16 all [installed]
iptables/jammy,now 1.8.7-1ubuntu5 amd64 [installed,upgradable to: 1.8.7-1ub=
untu5.1]
iputils-ping/jammy,now 3:20211215-1 amd64 [installed]
iputils-tracepath/jammy,now 3:20211215-1 amd64 [installed]
ipxe-qemu-256k-compat-efi-roms/jammy,jammy,now 1.0.0+git-20150424.a25a16d-0=
ubuntu4 all [installed,automatic]
ipxe-qemu/jammy,jammy,now 1.21.1+git-20220113.fbbdc3926-0ubuntu1 all [insta=
lled,automatic]
irqbalance/jammy,now 1.8.0-1build1 amd64 [installed]
isc-dhcp-client/jammy-security,now 4.4.1-2.3ubuntu2.3 amd64 [installed,upgr=
adable to: 4.4.1-2.3ubuntu2.4]
isc-dhcp-common/jammy-security,now 4.4.1-2.3ubuntu2.3 amd64 [installed,upgr=
adable to: 4.4.1-2.3ubuntu2.4]
iso-codes/jammy,jammy,now 4.9.0-1 all [installed]
ispell/jammy,now 3.4.02-2 amd64 [installed]
iucode-tool/jammy,now 2.3.1-1build1 amd64 [installed,automatic]
iw/jammy,now 5.16-1build1 amd64 [installed,automatic]
java-common/jammy,jammy,now 0.72build2 all [installed,automatic]
jq/jammy,now 1.6-2.1ubuntu3 amd64 [installed]
kbd/jammy,now 2.3.0-3ubuntu4 amd64 [installed,upgradable to: 2.3.0-3ubuntu4=
.22.04]
keyboard-configuration/jammy,jammy,now 1.205ubuntu3 all [installed]
keyutils/jammy,now 1.6.1-2ubuntu3 amd64 [installed,automatic]
klibc-utils/jammy,now 2.0.10-4 amd64 [installed]
kmod/jammy,now 29-1ubuntu1 amd64 [installed]
krb5-locales/jammy-security,jammy-security,now 1.19.2-2ubuntu0.1 all [insta=
lled,upgradable to: 1.19.2-2ubuntu0.2]
language-pack-en-base/now 1:22.04+20220721 all [installed,upgradable to: 1:=
22.04+20230209]
language-pack-en/now 1:22.04+20220721 all [installed,upgradable to: 1:22.04=
+20230209]
language-pack-gnome-en-base/now 1:22.04+20220721 all [installed,upgradable =
to: 1:22.04+20230209]
language-pack-gnome-en/now 1:22.04+20220721 all [installed,upgradable to: 1=
:22.04+20230209]
language-selector-common/jammy,jammy,now 0.219 all [installed,upgradable to=
: 0.219.1]
laptop-detect/jammy,jammy,now 0.16 all [installed,automatic]
ldap-utils/now 2.5.13+dfsg-0ubuntu0.22.04.1 amd64 [installed,upgradable to:=
 2.5.14+dfsg-0ubuntu0.22.04.2]
less/jammy-security,jammy-updates,now 590-1ubuntu0.22.04.1 amd64 [installed=
]
lib32asan4/now 7.5.0-6ubuntu2 amd64 [installed,local]
lib32asan5/jammy-security,jammy-updates,now 9.5.0-1ubuntu1~22.04 amd64 [ins=
talled,automatic]
lib32asan6/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [=
installed,automatic]
lib32atomic1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [=
installed,automatic]
lib32cilkrts5/now 7.5.0-6ubuntu2 amd64 [installed,local]
lib32gcc-11-dev/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 am=
d64 [installed,automatic]
lib32gcc-7-dev/now 7.5.0-6ubuntu2 amd64 [installed,local]
lib32gcc-9-dev/jammy-security,jammy-updates,now 9.5.0-1ubuntu1~22.04 amd64 =
[installed,automatic]
lib32gcc-s1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [i=
nstalled,automatic]
lib32gomp1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [in=
stalled,automatic]
lib32itm1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [ins=
talled,automatic]
lib32mpx2/now 8.4.0-3ubuntu2 amd64 [installed,local]
lib32quadmath0/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64=
 [installed,automatic]
lib32stdc++6/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [=
installed,automatic]
lib32ubsan0/now 7.5.0-6ubuntu2 amd64 [installed,local]
lib32ubsan1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [i=
nstalled,automatic]
libaccountsservice0/jammy-security,jammy-updates,now 22.07.5-2ubuntu1.3 amd=
64 [installed]
libacl1/jammy,now 2.3.1-1 amd64 [installed]
libaio1/jammy,now 0.3.112-13build1 amd64 [installed,automatic]
libapparmor1/now 3.0.4-2ubuntu2.1 amd64 [installed,upgradable to: 3.0.4-2ub=
untu2.2]
libapr1/jammy-security,jammy-updates,now 1.7.0-8ubuntu0.22.04.1 amd64 [inst=
alled,automatic]
libaprutil1-dbd-sqlite3/jammy-security,jammy-updates,now 1.6.1-5ubuntu4.22.=
04.1 amd64 [installed,automatic]
libaprutil1-ldap/jammy-security,jammy-updates,now 1.6.1-5ubuntu4.22.04.1 am=
d64 [installed,automatic]
libaprutil1/jammy-security,jammy-updates,now 1.6.1-5ubuntu4.22.04.1 amd64 [=
installed,automatic]
libapt-pkg6.0/now 2.4.8 amd64 [installed,upgradable to: 2.4.9]
libarchive13/jammy,now 3.6.0-1ubuntu1 amd64 [installed,automatic]
libargon2-0/jammy,now 0~20171227-0.3 amd64 [installed]
libargon2-1/jammy,now 0~20171227-0.3 amd64 [installed,automatic]
libasan4/now 7.5.0-6ubuntu2 amd64 [installed,local]
libasan5/jammy-security,jammy-updates,now 9.5.0-1ubuntu1~22.04 amd64 [insta=
lled,automatic]
libasan6/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [in=
stalled,automatic]
libasound2-data/jammy,jammy,now 1.2.6.1-1ubuntu1 all [installed,automatic]
libasound2-dev/jammy,now 1.2.6.1-1ubuntu1 amd64 [installed,automatic]
libasound2/jammy,now 1.2.6.1-1ubuntu1 amd64 [installed,automatic]
libaspell15/jammy,now 0.60.8-4build1 amd64 [installed,automatic]
libassuan0/jammy,now 2.5.5-1build1 amd64 [installed,automatic]
libasyncns0/jammy,now 0.8-6build2 amd64 [installed,automatic]
libatk-bridge2.0-0/jammy,now 2.38.0-3 amd64 [installed,automatic]
libatk1.0-0/jammy,now 2.36.0-3build1 amd64 [installed,automatic]
libatk1.0-0/jammy,now 2.36.0-3build1 i386 [installed,automatic]
libatk1.0-data/jammy,jammy,now 2.36.0-3build1 all [installed,automatic]
libatm1/jammy,now 1:2.5.1-4build2 amd64 [installed]
libatomic1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [in=
stalled,automatic]
libatspi2.0-0/jammy,now 2.44.0-3 amd64 [installed,automatic]
libattr1/jammy,now 1:2.5.1-1build1 amd64 [installed]
libaudit-common/jammy,jammy,now 1:3.0.7-1build1 all [installed]
libaudit1/jammy,now 1:3.0.7-1build1 amd64 [installed]
libauthen-sasl-perl/jammy,jammy,now 2.1600-1.1 all [installed]
libavahi-client3/jammy,now 0.8-5ubuntu5 amd64 [installed,automatic]
libavahi-client3/jammy,now 0.8-5ubuntu5 i386 [installed,automatic]
libavahi-common-data/jammy,now 0.8-5ubuntu5 amd64 [installed,automatic]
libavahi-common-data/jammy,now 0.8-5ubuntu5 i386 [installed,automatic]
libavahi-common3/jammy,now 0.8-5ubuntu5 amd64 [installed,automatic]
libavahi-common3/jammy,now 0.8-5ubuntu5 i386 [installed,automatic]
libbabeltrace1/jammy,now 1.5.8-2build1 amd64 [installed,automatic]
libbind9-160/now 1:9.11.3+dfsg-1ubuntu1.18 amd64 [installed,local]
libbinutils/jammy-security,jammy-updates,now 2.38-4ubuntu2.2 amd64 [install=
ed,automatic]
libblas3/jammy,now 3.10.0-2ubuntu1 amd64 [installed,automatic]
libblkid-dev/jammy,now 2.37.2-4ubuntu3 amd64 [installed,automatic]
libblkid1/jammy,now 2.37.2-4ubuntu3 amd64 [installed]
libblkid1/jammy,now 2.37.2-4ubuntu3 i386 [installed,automatic]
libboost-iostreams1.74.0/jammy,now 1.74.0-14ubuntu3 amd64 [installed,automa=
tic]
libboost-locale1.74.0/jammy,now 1.74.0-14ubuntu3 amd64 [installed,automatic=
]
libboost-regex1.74.0/jammy,now 1.74.0-14ubuntu3 amd64 [installed,automatic]
libboost-thread1.74.0/jammy,now 1.74.0-14ubuntu3 amd64 [installed,automatic=
]
libbpf0/jammy-security,jammy-updates,now 1:0.5.0-1ubuntu22.04.1 amd64 [inst=
alled,automatic]
libbrlapi0.8/jammy-updates,now 6.4-4ubuntu3 amd64 [installed,automatic]
libbrotli1/jammy,now 1.0.9-2build6 amd64 [installed,automatic]
libbrotli1/jammy,now 1.0.9-2build6 i386 [installed,automatic]
libbsd0/jammy,now 0.11.5-1 amd64 [installed]
libbsd0/jammy,now 0.11.5-1 i386 [installed,automatic]
libbz2-1.0/jammy,now 1.0.8-5build1 amd64 [installed]
libc-bin/jammy-updates,now 2.35-0ubuntu3.1 amd64 [installed]
libc-dev-bin/jammy-updates,now 2.35-0ubuntu3.1 amd64 [installed,automatic]
libc6-dev-i386/jammy-updates,now 2.35-0ubuntu3.1 amd64 [installed,automatic=
]
libc6-dev-x32/jammy-updates,now 2.35-0ubuntu3.1 amd64 [installed,automatic]
libc6-dev/jammy-updates,now 2.35-0ubuntu3.1 amd64 [installed,automatic]
libc6-i386/jammy-updates,now 2.35-0ubuntu3.1 amd64 [installed,automatic]
libc6-x32/jammy-updates,now 2.35-0ubuntu3.1 amd64 [installed,automatic]
libc6/jammy-updates,now 2.35-0ubuntu3.1 amd64 [installed]
libc6/jammy-updates,now 2.35-0ubuntu3.1 i386 [installed,automatic]
libcaca-dev/jammy,now 0.99.beta19-2.2ubuntu4 amd64 [installed,automatic]
libcaca0/jammy,now 0.99.beta19-2.2ubuntu4 amd64 [installed,automatic]
libcacard0/jammy,now 1:2.8.0-3build2 amd64 [installed,automatic]
libcairo-gobject2/jammy,now 1.16.0-5ubuntu2 amd64 [installed,automatic]
libcairo2/jammy,now 1.16.0-5ubuntu2 amd64 [installed,automatic]
libcairo2/jammy,now 1.16.0-5ubuntu2 i386 [installed,automatic]
libcap-ng0/jammy,now 0.7.9-2.2build3 amd64 [installed]
libcap2-bin/jammy,now 1:2.44-1build3 amd64 [installed]
libcap2/jammy,now 1:2.44-1build3 amd64 [installed]
libcap2/jammy,now 1:2.44-1build3 i386 [installed,automatic]
libcapture-tiny-perl/jammy,jammy,now 0.48-1 all [installed,automatic]
libcbor0.8/jammy,now 0.8.0-2ubuntu1 amd64 [installed,automatic]
libcc1-0/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [inst=
alled,automatic]
libcdparanoia0/jammy,now 3.10.2+debian-14build2 amd64 [installed,automatic]
libcgroup1/jammy,now 2.0-2 amd64 [installed,automatic]
libcilkrts5/now 7.5.0-6ubuntu2 amd64 [installed,local]
libcolord2/jammy,now 1.4.6-1 amd64 [installed,automatic]
libcom-err2/jammy-security,jammy-updates,now 1.46.5-2ubuntu1.1 amd64 [insta=
lled]
libcom-err2/jammy-security,jammy-updates,now 1.46.5-2ubuntu1.1 i386 [instal=
led,automatic]
libcompfaceg1/jammy,now 1:1.5.2-5.1 amd64 [installed,automatic]
libconfig-dev/jammy,now 1.5-0.4build1 amd64 [installed]
libconfig-simple-perl/jammy,jammy,now 4.59-6.1 all [installed,automatic]
libconfig9/jammy,now 1.5-0.4build1 amd64 [installed]
libcrypt-dev/jammy,now 1:4.4.27-1 amd64 [installed,automatic]
libcrypt1/jammy,now 1:4.4.27-1 amd64 [installed,automatic]
libcrypt1/jammy,now 1:4.4.27-1 i386 [installed,automatic]
libcryptsetup12/jammy-updates,now 2:2.4.3-1ubuntu1.1 amd64 [installed]
libctf-nobfd0/jammy-security,jammy-updates,now 2.38-4ubuntu2.2 amd64 [insta=
lled,automatic]
libctf0/jammy-security,jammy-updates,now 2.38-4ubuntu2.2 amd64 [installed,a=
utomatic]
libcups2/jammy-security,jammy-updates,now 2.4.1op1-1ubuntu4.1 amd64 [instal=
led,automatic]
libcups2/jammy-security,jammy-updates,now 2.4.1op1-1ubuntu4.1 i386 [install=
ed,automatic]
libcurl3-gnutls/jammy-security,jammy-updates,now 7.81.0-1ubuntu1.10 amd64 [=
installed,automatic]
libcurl4-openssl-dev/jammy-security,jammy-updates,now 7.81.0-1ubuntu1.10 am=
d64 [installed]
libcurl4/jammy-security,jammy-updates,now 7.81.0-1ubuntu1.10 amd64 [install=
ed,automatic]
libcwidget4/jammy,now 0.5.18-5build1 amd64 [installed,automatic]
libdatrie1/jammy,now 0.2.13-2 amd64 [installed,automatic]
libdatrie1/jammy,now 0.2.13-2 i386 [installed,automatic]
libdaxctl1/jammy,now 72.1-1 amd64 [installed,automatic]
libdb5.3/jammy,now 5.3.28+dfsg1-0.8ubuntu3 amd64 [installed]
libdbd-pg-perl/jammy,now 3.15.1-1 amd64 [installed,automatic]
libdbd-sqlite3-perl/jammy,now 1.70-3build1 amd64 [installed,automatic]
libdbi-perl/jammy,now 1.643-3build3 amd64 [installed,automatic]
libdbus-1-3/jammy-security,jammy-updates,now 1.12.20-2ubuntu4.1 amd64 [inst=
alled]
libdbus-1-3/jammy-security,jammy-updates,now 1.12.20-2ubuntu4.1 i386 [insta=
lled,automatic]
libdbusmenu-glib4/jammy,now 16.04.1+18.10.20180917-0ubuntu8 amd64 [installe=
d,automatic]
libdbusmenu-gtk3-4/jammy,now 16.04.1+18.10.20180917-0ubuntu8 amd64 [install=
ed,automatic]
libdconf1/jammy,now 0.40.0-3 amd64 [installed,automatic]
libdebconfclient0/jammy,now 0.261ubuntu1 amd64 [installed]
libdebuginfod-common/jammy,jammy,now 0.186-1build1 all [installed,automatic=
]
libdebuginfod1/jammy,now 0.186-1build1 amd64 [installed,automatic]
libdeflate0/jammy,now 1.10-2 amd64 [installed,automatic]
libdeflate0/jammy,now 1.10-2 i386 [installed,automatic]
libdevmapper1.02.1/jammy,now 2:1.02.175-2.1ubuntu4 amd64 [installed]
libdjvulibre-text/jammy,jammy,now 3.5.28-2build2 all [installed,automatic]
libdjvulibre21/jammy,now 3.5.28-2build2 amd64 [installed,automatic]
libdns-export1100/now 1:9.11.3+dfsg-1ubuntu1.18 amd64 [installed,local]
libdns-export1110/jammy,now 1:9.11.19+dfsg-2.1ubuntu3 amd64 [installed,auto=
matic]
libdns1100/now 1:9.11.3+dfsg-1ubuntu1.18 amd64 [installed,local]
libdpkg-perl/jammy-security,jammy-security,now 1.21.1ubuntu2.1 all [install=
ed,upgradable to: 1.21.1ubuntu2.2]
libdrm-amdgpu1/jammy,now 2.4.110-1ubuntu1 amd64 [installed,upgradable to: 2=
.4.113-2~ubuntu0.22.04.1]
libdrm-common/jammy,jammy,now 2.4.110-1ubuntu1 all [installed,upgradable to=
: 2.4.113-2~ubuntu0.22.04.1]
libdrm-nouveau2/jammy,now 2.4.110-1ubuntu1 amd64 [installed,upgradable to: =
2.4.113-2~ubuntu0.22.04.1]
libdrm-radeon1/jammy,now 2.4.110-1ubuntu1 amd64 [installed,upgradable to: 2=
.4.113-2~ubuntu0.22.04.1]
libdrm2/jammy,now 2.4.110-1ubuntu1 amd64 [installed,upgradable to: 2.4.113-=
2~ubuntu0.22.04.1]
libdw1/jammy,now 0.186-1build1 amd64 [installed,automatic]
libedit2/jammy,now 3.1-20210910-1build1 amd64 [installed]
libefiboot1/jammy,now 37-6ubuntu2 amd64 [installed,automatic]
libefivar1/jammy,now 37-6ubuntu2 amd64 [installed,automatic]
libegl-dev/jammy,now 1.4.0-1 amd64 [installed,automatic]
libegl-mesa0/now 22.0.5-0ubuntu0.1 amd64 [installed,upgradable to: 22.2.5-0=
ubuntu0.1~22.04.1]
libegl1/jammy,now 1.4.0-1 amd64 [installed,automatic]
libelf-dev/jammy,now 0.186-1build1 amd64 [installed]
libelf1/jammy,now 0.186-1build1 amd64 [installed]
libenchant-2-2/jammy,now 2.3.2-1ubuntu2 amd64 [installed,automatic]
libepoxy0/jammy,now 1.5.10-1 amd64 [installed,automatic]
liberror-perl/jammy,jammy,now 0.17029-1 all [installed,automatic]
libestr0/jammy,now 0.1.10-2.1build3 amd64 [installed]
libevdocument3-4/now 42.3-0ubuntu2 amd64 [installed,upgradable to: 42.3-0ub=
untu3]
libevent-core-2.1-7/jammy,now 2.1.12-stable-1build3 amd64 [installed,automa=
tic]
libevview3-3/now 42.3-0ubuntu2 amd64 [installed,upgradable to: 42.3-0ubuntu=
3]
libexif12/jammy,now 0.6.24-1build1 amd64 [installed,automatic]
libexo-2-0/jammy,now 4.16.3-1 amd64 [installed,automatic]
libexo-common/jammy,jammy,now 4.16.3-1 all [installed,automatic]
libexpat1-dev/jammy-security,jammy-updates,now 2.4.7-1ubuntu0.2 amd64 [inst=
alled,automatic]
libexpat1/jammy-security,jammy-updates,now 2.4.7-1ubuntu0.2 amd64 [installe=
d]
libexpat1/jammy-security,jammy-updates,now 2.4.7-1ubuntu0.2 i386 [installed=
,automatic]
libext2fs2/jammy-security,jammy-updates,now 1.46.5-2ubuntu1.1 amd64 [instal=
led]
libfastjson4/jammy,now 0.99.9-1build2 amd64 [installed]
libfdisk1/jammy,now 2.37.2-4ubuntu3 amd64 [installed]
libfdt1/jammy,now 1.6.1-1 amd64 [installed,automatic]
libffi-dev/jammy,now 3.4.2-4 amd64 [installed,automatic]
libffi6/now 3.2.1-8 amd64 [installed,local]
libffi7/jammy,now 3.3-5ubuntu1 amd64 [installed,automatic]
libffi8/jammy,now 3.4.2-4 amd64 [installed,automatic]
libffi8/jammy,now 3.4.2-4 i386 [installed,automatic]
libfido2-1/jammy,now 1.10.0-1 amd64 [installed,automatic]
libfile-basedir-perl/jammy,jammy,now 0.09-1 all [installed,automatic]
libfile-which-perl/jammy,jammy,now 1.23-1 all [installed,automatic]
libflac8/jammy-security,jammy-updates,now 1.3.3-2ubuntu0.1 amd64 [installed=
,automatic]
libfontconfig1/jammy,now 2.13.1-4.2ubuntu5 amd64 [installed,automatic]
libfontconfig1/jammy,now 2.13.1-4.2ubuntu5 i386 [installed,automatic]
libfontenc1/jammy,now 1:1.1.4-1build3 amd64 [installed,automatic]
libfreetype6/jammy-security,jammy-updates,now 2.11.1+dfsg-1ubuntu0.2 amd64 =
[installed,automatic]
libfreetype6/jammy-security,jammy-updates,now 2.11.1+dfsg-1ubuntu0.2 i386 [=
installed,automatic]
libfribidi0/jammy-security,jammy-updates,now 1.0.8-2ubuntu3.1 amd64 [instal=
led]
libfribidi0/jammy-security,jammy-updates,now 1.0.8-2ubuntu3.1 i386 [install=
ed,automatic]
libfuse2/jammy,now 2.9.9-5ubuntu3 amd64 [installed]
libfuse3-3/jammy,now 3.10.5-1build1 amd64 [installed,automatic]
libgarcon-1-0/jammy,now 4.16.1-1 amd64 [installed,automatic]
libgarcon-common/jammy,jammy,now 4.16.1-1 all [installed,automatic]
libgarcon-gtk3-1-0/jammy,now 4.16.1-1 amd64 [installed,automatic]
libgbm1/now 22.0.5-0ubuntu0.1 amd64 [installed,upgradable to: 22.2.5-0ubunt=
u0.1~22.04.1]
libgc1/jammy,now 1:8.0.6-1.1build1 amd64 [installed,automatic]
libgcc-11-dev/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd6=
4 [installed,automatic]
libgcc-7-dev/now 7.5.0-6ubuntu2 amd64 [installed,local]
libgcc-9-dev/jammy-security,jammy-updates,now 9.5.0-1ubuntu1~22.04 amd64 [i=
nstalled,automatic]
libgcc-s1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [ins=
talled,automatic]
libgcc-s1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 i386 [inst=
alled,automatic]
libgcrypt20/jammy,now 1.9.4-3ubuntu3 amd64 [installed]
libgcrypt20/jammy,now 1.9.4-3ubuntu3 i386 [installed,automatic]
libgd3/jammy,now 2.3.0-2ubuntu2 amd64 [installed,automatic]
libgdbm-compat4/jammy,now 1.23-1 amd64 [installed,automatic]
libgdbm5/now 1.14.1-6 amd64 [installed,local]
libgdbm6/jammy,now 1.23-1 amd64 [installed,automatic]
libgdk-pixbuf-2.0-0/jammy-updates,now 2.42.8+dfsg-1ubuntu0.2 amd64 [install=
ed,automatic]
libgdk-pixbuf-2.0-0/jammy-updates,now 2.42.8+dfsg-1ubuntu0.2 i386 [installe=
d,automatic]
libgdk-pixbuf-xlib-2.0-0/jammy,now 2.40.2-2build4 amd64 [installed,automati=
c]
libgdk-pixbuf2.0-0/jammy,now 2.40.2-2build4 amd64 [installed,automatic]
libgdk-pixbuf2.0-common/jammy-updates,jammy-updates,now 2.42.8+dfsg-1ubuntu=
0.2 all [installed,automatic]
libgeoip1/jammy,now 1.6.12-8 amd64 [installed]
libgfapi0/jammy,now 10.1-1 amd64 [installed,automatic]
libgfortran5/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [=
installed,automatic]
libgfrpc0/jammy,now 10.1-1 amd64 [installed,automatic]
libgfxdr0/jammy,now 10.1-1 amd64 [installed,automatic]
libgif7/jammy,now 5.1.9-2build2 amd64 [installed,automatic]
libgirepository-1.0-1/jammy,now 1.72.0-1 amd64 [installed]
libgl-dev/jammy,now 1.4.0-1 amd64 [installed,automatic]
libgl1-mesa-dev/now 22.0.5-0ubuntu0.1 amd64 [installed,upgradable to: 22.2.=
5-0ubuntu0.1~22.04.1]
libgl1-mesa-dri/now 22.0.5-0ubuntu0.1 amd64 [installed,upgradable to: 22.2.=
5-0ubuntu0.1~22.04.1]
libgl1/jammy,now 1.4.0-1 amd64 [installed,automatic]
libglapi-mesa/now 22.0.5-0ubuntu0.1 amd64 [installed,upgradable to: 22.2.5-=
0ubuntu0.1~22.04.1]
libgles-dev/jammy,now 1.4.0-1 amd64 [installed,automatic]
libgles1/jammy,now 1.4.0-1 amd64 [installed,automatic]
libgles2/jammy,now 1.4.0-1 amd64 [installed,automatic]
libglib2.0-0/now 2.72.4-0ubuntu1 amd64 [installed,upgradable to: 2.72.4-0ub=
untu2]
libglib2.0-0/now 2.72.4-0ubuntu1 i386 [installed,upgradable to: 2.72.4-0ubu=
ntu2]
libglib2.0-bin/now 2.72.4-0ubuntu1 amd64 [installed,upgradable to: 2.72.4-0=
ubuntu2]
libglib2.0-data/now 2.72.4-0ubuntu1 all [installed,upgradable to: 2.72.4-0u=
buntu2]
libglib2.0-dev-bin/now 2.72.4-0ubuntu1 amd64 [installed,upgradable to: 2.72=
.4-0ubuntu2]
libglib2.0-dev/now 2.72.4-0ubuntu1 amd64 [installed,upgradable to: 2.72.4-0=
ubuntu2]
libglu1-mesa-dev/jammy,now 9.0.2-1 amd64 [installed]
libglu1-mesa/jammy,now 9.0.2-1 amd64 [installed,automatic]
libglusterfs0/jammy,now 10.1-1 amd64 [installed,automatic]
libglvnd-core-dev/jammy,now 1.4.0-1 amd64 [installed,automatic]
libglvnd-dev/jammy,now 1.4.0-1 amd64 [installed,automatic]
libglvnd0/jammy,now 1.4.0-1 amd64 [installed,automatic]
libglx-dev/jammy,now 1.4.0-1 amd64 [installed,automatic]
libglx-mesa0/now 22.0.5-0ubuntu0.1 amd64 [installed,upgradable to: 22.2.5-0=
ubuntu0.1~22.04.1]
libglx0/jammy,now 1.4.0-1 amd64 [installed,automatic]
libgmp10/jammy,now 2:6.2.1+dfsg-3ubuntu1 amd64 [installed]
libgmp10/jammy,now 2:6.2.1+dfsg-3ubuntu1 i386 [installed,automatic]
libgnome-desktop-3-19/jammy-updates,now 42.5-0ubuntu1 amd64 [installed,auto=
matic]
libgnutls30/jammy-security,jammy-updates,now 3.7.3-4ubuntu1.2 amd64 [instal=
led]
libgnutls30/jammy-security,jammy-updates,now 3.7.3-4ubuntu1.2 i386 [install=
ed,automatic]
libgomp1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [inst=
alled,automatic]
libgpg-error0/jammy,now 1.43-3 amd64 [installed]
libgpg-error0/jammy,now 1.43-3 i386 [installed,automatic]
libgpgme11/jammy,now 1.16.0-1.2ubuntu4 amd64 [installed,automatic]
libgpm2/jammy,now 1.20.7-10build1 amd64 [installed,automatic]
libgraphite2-3/jammy,now 1.3.14-1build2 amd64 [installed,automatic]
libgraphite2-3/jammy,now 1.3.14-1build2 i386 [installed,automatic]
libgs9-common/jammy-security,jammy-security,jammy-updates,jammy-updates,now=
 9.55.0~dfsg1-0ubuntu5.2 all [installed,automatic]
libgs9/jammy-security,jammy-updates,now 9.55.0~dfsg1-0ubuntu5.2 amd64 [inst=
alled,automatic]
libgspell-1-2/jammy,now 1.9.1-4 amd64 [installed,automatic]
libgspell-1-common/jammy,jammy,now 1.9.1-4 all [installed,automatic]
libgssapi-krb5-2/jammy-security,now 1.19.2-2ubuntu0.1 amd64 [installed,upgr=
adable to: 1.19.2-2ubuntu0.2]
libgssapi-krb5-2/jammy-security,now 1.19.2-2ubuntu0.1 i386 [installed,upgra=
dable to: 1.19.2-2ubuntu0.2]
libgstreamer-plugins-base1.0-0/jammy,now 1.20.1-1 amd64 [installed,automati=
c]
libgstreamer1.0-0/jammy-updates,now 1.20.3-0ubuntu1 amd64 [installed,automa=
tic]
libgtk-3-0/jammy-updates,now 3.24.33-1ubuntu2 amd64 [installed,automatic]
libgtk-3-common/jammy-updates,jammy-updates,now 3.24.33-1ubuntu2 all [insta=
lled,automatic]
libgtk2.0-0/jammy,now 2.24.33-2ubuntu2 amd64 [installed,automatic]
libgtk2.0-0/jammy,now 2.24.33-2ubuntu2 i386 [installed]
libgtk2.0-common/jammy,jammy,now 2.24.33-2ubuntu2 all [installed,automatic]
libgtksourceview-3.0-1/jammy,now 3.24.11-2build1 amd64 [installed,automatic=
]
libgtksourceview-3.0-common/jammy,jammy,now 3.24.11-2build1 all [installed,=
automatic]
libgtksourceview-4-0/jammy,now 4.8.3-1 amd64 [installed,automatic]
libgtksourceview-4-common/jammy,jammy,now 4.8.3-1 all [installed,automatic]
libgtop-2.0-11/jammy,now 2.40.0-2build3 amd64 [installed,automatic]
libgtop2-common/jammy,jammy,now 2.40.0-2build3 all [installed,automatic]
libgudev-1.0-0/jammy,now 1:237-2build1 amd64 [installed,automatic]
libgxps2/jammy,now 0.3.2-2 amd64 [installed,automatic]
libhandy-1-0/jammy,now 1.6.1-1 amd64 [installed,automatic]
libharfbuzz0b/jammy-security,jammy-updates,now 2.7.4-1ubuntu3.1 amd64 [inst=
alled,automatic]
libharfbuzz0b/jammy-security,jammy-updates,now 2.7.4-1ubuntu3.1 i386 [insta=
lled,automatic]
libhavege2/jammy,now 1.9.14-1ubuntu1 amd64 [installed,automatic]
libhogweed4/now 3.4.1-0ubuntu0.18.04.1 amd64 [installed,local]
libhogweed6/jammy,now 3.7.3-1build2 amd64 [installed,automatic]
libhogweed6/jammy,now 3.7.3-1build2 i386 [installed,automatic]
libhunspell-1.7-0/jammy,now 1.7.0-4build1 amd64 [installed,automatic]
libibverbs1/jammy,now 39.0-1 amd64 [installed,automatic]
libice6/jammy,now 2:1.0.10-1build2 amd64 [installed,automatic]
libicu60/now 60.2-3ubuntu3.2 amd64 [installed,local]
libicu70/jammy,now 70.1-2 amd64 [installed,automatic]
libidn11/now 1.33-2.2ubuntu2 amd64 [installed,local]
libidn12/jammy,now 1.38-4build1 amd64 [installed,automatic]
libidn2-0/jammy,now 2.3.2-2build1 amd64 [installed]
libidn2-0/jammy,now 2.3.2-2build1 i386 [installed,automatic]
libijs-0.35/jammy,now 0.35-15build2 amd64 [installed,automatic]
libinih1/jammy,now 53-1ubuntu3 amd64 [installed,automatic]
libio-socket-ssl-perl/jammy,jammy,now 2.074-2 all [installed,automatic]
libip4tc0/now 1.6.1-2ubuntu2 amd64 [installed,local]
libip4tc2/jammy,now 1.8.7-1ubuntu5 amd64 [installed,upgradable to: 1.8.7-1u=
buntu5.1]
libip6tc0/now 1.6.1-2ubuntu2 amd64 [installed,local]
libip6tc2/jammy,now 1.8.7-1ubuntu5 amd64 [installed,upgradable to: 1.8.7-1u=
buntu5.1]
libipc-system-simple-perl/jammy,jammy,now 1.30-1 all [installed,automatic]
libiperf0/jammy,now 3.9-1build1 amd64 [installed,automatic]
libipt2/jammy,now 2.0.5-1 amd64 [installed,automatic]
libiptc0/jammy,now 1.8.7-1ubuntu5 amd64 [installed,upgradable to: 1.8.7-1ub=
untu5.1]
libirs160/now 1:9.11.3+dfsg-1ubuntu1.18 amd64 [installed,local]
libisc-export1105/jammy,now 1:9.11.19+dfsg-2.1ubuntu3 amd64 [installed,auto=
matic]
libisc-export169/now 1:9.11.3+dfsg-1ubuntu1.18 amd64 [installed,local]
libisc169/now 1:9.11.3+dfsg-1ubuntu1.18 amd64 [installed,local]
libisccc160/now 1:9.11.3+dfsg-1ubuntu1.18 amd64 [installed,local]
libisccfg160/now 1:9.11.3+dfsg-1ubuntu1.18 amd64 [installed,local]
libiscsi7/jammy,now 1.19.0-3build2 amd64 [installed,automatic]
libisl22/now 0.22.1-1 amd64 [installed,local]
libisl23/jammy,now 0.24-2build1 amd64 [installed,automatic]
libitm1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [insta=
lled,automatic]
libjansson4/jammy,now 2.13.1-1.1build3 amd64 [installed,automatic]
libjbig0/jammy-security,jammy-updates,now 2.1-3.1ubuntu0.22.04.1 amd64 [ins=
talled,automatic]
libjbig0/jammy-security,jammy-updates,now 2.1-3.1ubuntu0.22.04.1 i386 [inst=
alled,automatic]
libjbig2dec0/jammy,now 0.19-3build2 amd64 [installed,automatic]
libjpeg-turbo8/jammy,now 2.1.2-0ubuntu1 amd64 [installed,automatic]
libjpeg-turbo8/jammy,now 2.1.2-0ubuntu1 i386 [installed,automatic]
libjpeg8/jammy,now 8c-2ubuntu10 amd64 [installed,automatic]
libjpeg8/jammy,now 8c-2ubuntu10 i386 [installed,automatic]
libjq1/jammy,now 1.6-2.1ubuntu3 amd64 [installed,automatic]
libjs-jquery/jammy,jammy,now 3.6.0+dfsg+~3.5.13-1 all [installed,automatic]
libjs-sphinxdoc/jammy,jammy,now 4.3.2-1 all [installed,automatic]
libjs-underscore/jammy,jammy,now 1.13.2~dfsg-2 all [installed,automatic]
libjson-c3/now 0.12.1-1.3ubuntu0.3 amd64 [installed,local]
libjson-c5/jammy-updates,now 0.15-3~ubuntu1.22.04.1 amd64 [installed,automa=
tic]
libjsoncpp25/jammy,now 1.9.5-3 amd64 [installed,automatic]
libk5crypto3/jammy-security,now 1.19.2-2ubuntu0.1 amd64 [installed,upgradab=
le to: 1.19.2-2ubuntu0.2]
libk5crypto3/jammy-security,now 1.19.2-2ubuntu0.1 i386 [installed,upgradabl=
e to: 1.19.2-2ubuntu0.2]
libkeybinder-3.0-0/jammy,now 0.3.2-1.1 amd64 [installed,automatic]
libkeyutils1/jammy,now 1.6.1-2ubuntu3 amd64 [installed]
libkeyutils1/jammy,now 1.6.1-2ubuntu3 i386 [installed,automatic]
libklibc/jammy,now 2.0.10-4 amd64 [installed]
libkmod2/jammy,now 29-1ubuntu1 amd64 [installed]
libkpathsea6/jammy-security,jammy-updates,now 2021.20210626.59705-1ubuntu0.=
1 amd64 [installed,automatic]
libkrb5-3/jammy-security,now 1.19.2-2ubuntu0.1 amd64 [installed,upgradable =
to: 1.19.2-2ubuntu0.2]
libkrb5-3/jammy-security,now 1.19.2-2ubuntu0.1 i386 [installed,upgradable t=
o: 1.19.2-2ubuntu0.2]
libkrb5support0/jammy-security,now 1.19.2-2ubuntu0.1 amd64 [installed,upgra=
dable to: 1.19.2-2ubuntu0.2]
libkrb5support0/jammy-security,now 1.19.2-2ubuntu0.1 i386 [installed,upgrad=
able to: 1.19.2-2ubuntu0.2]
libksba8/jammy-security,jammy-updates,now 1.6.0-2ubuntu0.2 amd64 [installed=
,automatic]
liblapack3/jammy,now 3.10.0-2ubuntu1 amd64 [installed,automatic]
liblcms2-2/jammy,now 2.12~rc1-2build2 amd64 [installed,automatic]
libldap-2.5-0/now 2.5.13+dfsg-0ubuntu0.22.04.1 amd64 [installed,upgradable =
to: 2.5.14+dfsg-0ubuntu0.22.04.2]
libldap-common/now 2.5.13+dfsg-0ubuntu0.22.04.1 all [installed,upgradable t=
o: 2.5.14+dfsg-0ubuntu0.22.04.2]
libllvm13/jammy-security,jammy-updates,now 1:13.0.1-2ubuntu2.1 amd64 [insta=
lled,automatic]
libllvm14/jammy,now 1:14.0.0-1ubuntu1 amd64 [installed,automatic]
liblmdb0/jammy,now 0.9.24-1build2 amd64 [installed,automatic]
liblocale-gettext-perl/jammy,now 1.07-4build3 amd64 [installed]
liblsan0/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [inst=
alled,automatic]
libltdl7/jammy,now 2.4.6-15build2 amd64 [installed,automatic]
liblua5.2-0/jammy,now 5.2.4-2 amd64 [installed,automatic]
liblua5.3-0/jammy,now 5.3.6-1build1 amd64 [installed,automatic]
liblwres160/now 1:9.11.3+dfsg-1ubuntu1.18 amd64 [installed,local]
liblz4-1/jammy,now 1.9.3-2build2 amd64 [installed]
liblz4-1/jammy,now 1.9.3-2build2 i386 [installed,automatic]
liblz4-tool/jammy,jammy,now 1.9.3-2build2 all [installed]
liblzma5/jammy,now 5.2.5-2ubuntu1 amd64 [installed]
liblzma5/jammy,now 5.2.5-2ubuntu1 i386 [installed,automatic]
liblzo2-2/jammy,now 2.10-2build3 amd64 [installed,automatic]
libm17n-0/jammy,now 1.8.0-4 amd64 [installed,automatic]
libmagic-mgc/jammy,now 1:5.41-3 amd64 [installed]
libmagic1/jammy,now 1:5.41-3 amd64 [installed]
libmailtools-perl/jammy,jammy,now 2.21-1 all [installed]
libmaxminddb0/jammy,now 1.5.2-1build2 amd64 [installed,automatic]
libmd0/jammy,now 1.0.4-1build1 amd64 [installed,automatic]
libmd0/jammy,now 1.0.4-1build1 i386 [installed,automatic]
libmnl0/jammy,now 1.0.4-3build2 amd64 [installed]
libmount-dev/jammy,now 2.37.2-4ubuntu3 amd64 [installed,automatic]
libmount1/jammy,now 2.37.2-4ubuntu3 amd64 [installed]
libmount1/jammy,now 2.37.2-4ubuntu3 i386 [installed,automatic]
libmpc3/jammy,now 1.2.1-2build1 amd64 [installed,automatic]
libmpdec2/now 2.4.2-3 amd64 [installed,local]
libmpdec3/jammy,now 2.5.1-2build2 amd64 [installed,automatic]
libmpfr6/jammy,now 4.1.0-3build3 amd64 [installed,automatic]
libmpx2/now 8.4.0-3ubuntu2 amd64 [installed,local]
libnautilus-extension1a/jammy-security,now 1:42.2-0ubuntu2.1 amd64 [install=
ed,upgradable to: 1:42.6-0ubuntu1]
libncurses-dev/jammy-security,jammy-updates,now 6.3-2ubuntu0.1 amd64 [insta=
lled,automatic]
libncurses5-dev/jammy-security,jammy-updates,now 6.3-2ubuntu0.1 amd64 [inst=
alled]
libncurses5/jammy-security,jammy-updates,now 6.3-2ubuntu0.1 amd64 [installe=
d]
libncurses6/jammy-security,jammy-updates,now 6.3-2ubuntu0.1 amd64 [installe=
d,automatic]
libncursesw5/jammy-security,jammy-updates,now 6.3-2ubuntu0.1 amd64 [install=
ed]
libncursesw6/jammy-security,jammy-updates,now 6.3-2ubuntu0.1 amd64 [install=
ed,automatic]
libndctl6/jammy,now 72.1-1 amd64 [installed,automatic]
libnet-smtp-ssl-perl/jammy,jammy,now 1.04-1 all [installed,automatic]
libnet-ssleay-perl/jammy,now 1.92-1build2 amd64 [installed,automatic]
libnet1/jammy,now 1.1.6+dfsg-3.1build3 amd64 [installed,automatic]
libnetfilter-conntrack3/jammy,now 1.0.9-1 amd64 [installed]
libnettle6/now 3.4.1-0ubuntu0.18.04.1 amd64 [installed,local]
libnettle8/jammy,now 3.7.3-1build2 amd64 [installed,automatic]
libnettle8/jammy,now 3.7.3-1build2 i386 [installed,automatic]
libnewt0.52/jammy,now 0.52.21-5ubuntu2 amd64 [installed]
libnfnetlink0/jammy,now 1.0.1-3build3 amd64 [installed]
libnfsidmap1/jammy-updates,now 1:2.6.1-1ubuntu1.2 amd64 [installed,automati=
c]
libnftables1/jammy-updates,now 1.0.2-1ubuntu3 amd64 [installed,automatic]
libnftnl11/jammy,now 1.2.1-1build1 amd64 [installed,automatic]
libnghttp2-14/jammy,now 1.43.0-1build3 amd64 [installed,automatic]
libnih1/jammy,now 1.0.3-12build1 amd64 [installed]
libnl-3-200/jammy,now 3.5.0-0.1 amd64 [installed,automatic]
libnl-genl-3-200/jammy,now 3.5.0-0.1 amd64 [installed,automatic]
libnl-route-3-200/jammy,now 3.5.0-0.1 amd64 [installed,automatic]
libnotify4/jammy-updates,now 0.7.9-3ubuntu5.22.04.1 amd64 [installed,automa=
tic]
libnpth0/jammy,now 1.6-3build2 amd64 [installed,automatic]
libnsl-dev/jammy,now 1.3.0-2build2 amd64 [installed,automatic]
libnsl2/jammy,now 1.3.0-2build2 amd64 [installed,automatic]
libnspr4/jammy,now 2:4.32-3build1 amd64 [installed,automatic]
libnss-nis/jammy,now 3.1-0ubuntu6 amd64 [installed]
libnss-systemd/jammy-security,now 249.11-0ubuntu3.7 amd64 [installed,upgrad=
able to: 249.11-0ubuntu3.9]
libnss3/jammy-security,jammy-updates,now 2:3.68.2-0ubuntu1.2 amd64 [install=
ed,automatic]
libntfs-3g88/now 1:2017.3.23-2ubuntu0.18.04.5 amd64 [installed,local]
libntfs-3g89/jammy-security,jammy-updates,now 1:2021.8.22-3ubuntu1.2 amd64 =
[installed,automatic]
libnuma1/jammy,now 2.0.14-3ubuntu2 amd64 [installed]
libnx-x11-6/jammy,now 2:3.5.99.26-5 amd64 [installed,automatic]
libogg0/jammy,now 1.3.5-0ubuntu3 amd64 [installed,automatic]
libonig5/jammy,now 6.9.7.1-2build1 amd64 [installed,automatic]
libopengl-dev/jammy,now 1.4.0-1 amd64 [installed,automatic]
libopengl0/jammy,now 1.4.0-1 amd64 [installed,automatic]
libopenjp2-7/jammy,now 2.4.0-6 amd64 [installed,automatic]
libopus0/jammy,now 1.3.1-0.1build2 amd64 [installed,automatic]
liborc-0.4-0/jammy,now 1:0.4.32-2 amd64 [installed,automatic]
libotf1/jammy,now 0.9.16-3build1 amd64 [installed,automatic]
libp11-kit0/jammy,now 0.24.0-6build1 amd64 [installed]
libp11-kit0/jammy,now 0.24.0-6build1 i386 [installed,automatic]
libpam-cap/jammy,now 1:2.44-1build3 amd64 [installed]
libpam-modules-bin/jammy-security,jammy-updates,now 1.4.0-11ubuntu2.3 amd64=
 [installed]
libpam-modules/jammy-security,jammy-updates,now 1.4.0-11ubuntu2.3 amd64 [in=
stalled]
libpam-runtime/jammy-security,jammy-security,jammy-updates,jammy-updates,no=
w 1.4.0-11ubuntu2.3 all [installed]
libpam-systemd/jammy-security,now 249.11-0ubuntu3.7 amd64 [installed,upgrad=
able to: 249.11-0ubuntu3.9]
libpam0g/jammy-security,jammy-updates,now 1.4.0-11ubuntu2.3 amd64 [installe=
d]
libpango-1.0-0/jammy,now 1.50.6+ds-2 amd64 [installed,upgradable to: 1.50.6=
+ds-2ubuntu1]
libpango-1.0-0/jammy,now 1.50.6+ds-2 i386 [installed,upgradable to: 1.50.6+=
ds-2ubuntu1]
libpangocairo-1.0-0/jammy,now 1.50.6+ds-2 amd64 [installed,upgradable to: 1=
.50.6+ds-2ubuntu1]
libpangocairo-1.0-0/jammy,now 1.50.6+ds-2 i386 [installed,upgradable to: 1.=
50.6+ds-2ubuntu1]
libpangoft2-1.0-0/jammy,now 1.50.6+ds-2 amd64 [installed,upgradable to: 1.5=
0.6+ds-2ubuntu1]
libpangoft2-1.0-0/jammy,now 1.50.6+ds-2 i386 [installed,upgradable to: 1.50=
.6+ds-2ubuntu1]
libpangoxft-1.0-0/jammy,now 1.50.6+ds-2 amd64 [installed,upgradable to: 1.5=
0.6+ds-2ubuntu1]
libpaper1/jammy,now 1.1.28build2 amd64 [installed,automatic]
libparted2/jammy,now 3.4-2build1 amd64 [installed]
libpcap0.8/jammy,now 1.10.1-4build1 amd64 [installed]
libpci3/jammy,now 1:3.7.0-6 amd64 [installed]
libpcre16-3/jammy-security,jammy-updates,now 2:8.39-13ubuntu0.22.04.1 amd64=
 [installed,automatic]
libpcre2-16-0/jammy-security,jammy-updates,now 10.39-3ubuntu0.1 amd64 [inst=
alled,automatic]
libpcre2-32-0/jammy-security,jammy-updates,now 10.39-3ubuntu0.1 amd64 [inst=
alled,automatic]
libpcre2-8-0/jammy-security,jammy-updates,now 10.39-3ubuntu0.1 amd64 [insta=
lled,automatic]
libpcre2-8-0/jammy-security,jammy-updates,now 10.39-3ubuntu0.1 i386 [instal=
led,automatic]
libpcre2-dev/jammy-security,jammy-updates,now 10.39-3ubuntu0.1 amd64 [insta=
lled,automatic]
libpcre2-posix3/jammy-security,jammy-updates,now 10.39-3ubuntu0.1 amd64 [in=
stalled,automatic]
libpcre3-dev/jammy-security,jammy-updates,now 2:8.39-13ubuntu0.22.04.1 amd6=
4 [installed,automatic]
libpcre32-3/jammy-security,jammy-updates,now 2:8.39-13ubuntu0.22.04.1 amd64=
 [installed,automatic]
libpcre3/jammy-security,jammy-updates,now 2:8.39-13ubuntu0.22.04.1 amd64 [i=
nstalled]
libpcre3/jammy-security,jammy-updates,now 2:8.39-13ubuntu0.22.04.1 i386 [in=
stalled,automatic]
libpcrecpp0v5/jammy-security,jammy-updates,now 2:8.39-13ubuntu0.22.04.1 amd=
64 [installed,automatic]
libpcsclite1/jammy,now 1.9.5-3 amd64 [installed,automatic]
libpeas-1.0-0/jammy,now 1.32.0-1 amd64 [installed,automatic]
libpeas-common/jammy,jammy,now 1.32.0-1 all [installed,automatic]
libperl5.34/jammy-security,jammy-updates,now 5.34.0-3ubuntu1.1 amd64 [insta=
lled,automatic]
libpipeline1/jammy,now 1.5.5-1 amd64 [installed]
libpixman-1-0/jammy-security,jammy-updates,now 0.40.0-1ubuntu0.22.04.1 amd6=
4 [installed,automatic]
libpixman-1-0/jammy-security,jammy-updates,now 0.40.0-1ubuntu0.22.04.1 i386=
 [installed,automatic]
libpixman-1-dev/jammy-security,jammy-updates,now 0.40.0-1ubuntu0.22.04.1 am=
d64 [installed]
libpkcs11-helper1/jammy-updates,now 1.28-1ubuntu0.22.04.1 amd64 [installed,=
automatic]
libplymouth4/now 0.9.3-1ubuntu7.18.04.2 amd64 [installed,local]
libplymouth5/jammy,now 0.9.5+git20211018-1ubuntu3 amd64 [installed,automati=
c]
libpmem1/jammy,now 1.11.1-3build1 amd64 [installed,automatic]
libpmemobj1/jammy,now 1.11.1-3build1 amd64 [installed,automatic]
libpng-dev/jammy,now 1.6.37-3build5 amd64 [installed,automatic]
libpng16-16/jammy,now 1.6.37-3build5 amd64 [installed]
libpng16-16/jammy,now 1.6.37-3build5 i386 [installed,automatic]
libpolkit-gobject-1-0/jammy,now 0.105-33 amd64 [installed]
libpoppler-glib8/jammy-security,jammy-updates,now 22.02.0-2ubuntu0.1 amd64 =
[installed,automatic]
libpoppler118/jammy-security,jammy-updates,now 22.02.0-2ubuntu0.1 amd64 [in=
stalled,automatic]
libpopt0/jammy,now 1.18-3build1 amd64 [installed]
libpq5/jammy-security,jammy-updates,now 14.8-0ubuntu0.22.04.1 amd64 [instal=
led,automatic]
libprocps6/now 2:3.3.12-3ubuntu1.2 amd64 [installed,local]
libprocps8/jammy,now 2:3.3.17-6ubuntu2 amd64 [installed,automatic]
libprotobuf23/jammy-security,jammy-updates,now 3.12.4-1ubuntu7.22.04.1 amd6=
4 [installed,automatic]
libpsl5/jammy,now 0.21.0-1.2build2 amd64 [installed]
libpthread-stubs0-dev/jammy,now 0.4-1build2 amd64 [installed,automatic]
libpulse-dev/now 1:15.99.1+dfsg1-1ubuntu2 amd64 [installed,upgradable to: 1=
:15.99.1+dfsg1-1ubuntu2.1]
libpulse-mainloop-glib0/now 1:15.99.1+dfsg1-1ubuntu2 amd64 [installed,upgra=
dable to: 1:15.99.1+dfsg1-1ubuntu2.1]
libpulse0/now 1:15.99.1+dfsg1-1ubuntu2 amd64 [installed,upgradable to: 1:15=
.99.1+dfsg1-1ubuntu2.1]
libpython3-dev/jammy-updates,now 3.10.6-1~22.04 amd64 [installed,automatic]
libpython3-stdlib/jammy-updates,now 3.10.6-1~22.04 amd64 [installed]
libpython3.10-dev/jammy-security,jammy-updates,now 3.10.6-1~22.04.2ubuntu1 =
amd64 [installed,automatic]
libpython3.10-minimal/jammy-security,jammy-updates,now 3.10.6-1~22.04.2ubun=
tu1 amd64 [installed,automatic]
libpython3.10-stdlib/jammy-security,jammy-updates,now 3.10.6-1~22.04.2ubunt=
u1 amd64 [installed,automatic]
libpython3.10/jammy-security,jammy-updates,now 3.10.6-1~22.04.2ubuntu1 amd6=
4 [installed,automatic]
libpython3.6-dev/now 3.6.9-1~18.04ubuntu1.8 amd64 [installed,local]
libpython3.6-minimal/now 3.6.9-1~18.04ubuntu1.8 amd64 [installed,local]
libpython3.6-stdlib/now 3.6.9-1~18.04ubuntu1.8 amd64 [installed,local]
libpython3.6/now 3.6.9-1~18.04ubuntu1.8 amd64 [installed,local]
libquadmath0/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [=
installed,automatic]
librados2/jammy-security,jammy-updates,now 17.2.5-0ubuntu0.22.04.3 amd64 [i=
nstalled,automatic]
librbd1/jammy-security,jammy-updates,now 17.2.5-0ubuntu0.22.04.3 amd64 [ins=
talled,automatic]
librdmacm1/jammy,now 39.0-1 amd64 [installed,automatic]
libreadline7/now 7.0-3 amd64 [installed,local]
libreadline8/jammy,now 8.1.2-1 amd64 [installed,automatic]
librhash0/jammy,now 1.4.2-1ubuntu1 amd64 [installed,automatic]
librpm9/jammy,now 4.17.0+dfsg1-4build1 amd64 [installed,automatic]
librpmio9/jammy,now 4.17.0+dfsg1-4build1 amd64 [installed,automatic]
librsvg2-2/jammy,now 2.52.5+dfsg-3 amd64 [installed,automatic]
librsvg2-common/jammy,now 2.52.5+dfsg-3 amd64 [installed,automatic]
librtmp1/jammy,now 2.4+20151223.gitfa8646d.1-2build4 amd64 [installed,autom=
atic]
libruby2.7/now 2.7.0-5ubuntu1.7 amd64 [installed,local]
libruby3.0/jammy-security,jammy-updates,now 3.0.2-7ubuntu2.3 amd64 [install=
ed,automatic]
libsasl2-2/jammy,now 2.1.27+dfsg2-3ubuntu1 amd64 [installed,upgradable to: =
2.1.27+dfsg2-3ubuntu1.2]
libsasl2-modules-db/jammy,now 2.1.27+dfsg2-3ubuntu1 amd64 [installed,upgrad=
able to: 2.1.27+dfsg2-3ubuntu1.2]
libsasl2-modules/jammy,now 2.1.27+dfsg2-3ubuntu1 amd64 [installed,upgradabl=
e to: 2.1.27+dfsg2-3ubuntu1.2]
libsctp1/jammy,now 1.0.19+dfsg-1build1 amd64 [installed,automatic]
libsdl1.2-dev/jammy,now 1.2.15+dfsg2-6 amd64 [installed]
libsdl1.2debian/jammy,now 1.2.15+dfsg2-6 amd64 [installed,automatic]
libseccomp2/jammy,now 2.5.3-2ubuntu2 amd64 [installed]
libsecret-1-0/jammy,now 0.20.5-2 amd64 [installed,automatic]
libsecret-common/jammy,jammy,now 0.20.5-2 all [installed,automatic]
libselinux1-dev/jammy,now 3.3-1build2 amd64 [installed,automatic]
libselinux1/jammy,now 3.3-1build2 amd64 [installed]
libselinux1/jammy,now 3.3-1build2 i386 [installed,automatic]
libsemanage-common/jammy,jammy,now 3.3-1build2 all [installed]
libsemanage2/jammy,now 3.3-1build2 amd64 [installed,automatic]
libsensors-config/jammy,jammy,now 1:3.6.0-7ubuntu1 all [installed,automatic=
]
libsensors5/jammy,now 1:3.6.0-7ubuntu1 amd64 [installed,automatic]
libsepol-dev/jammy,now 3.3-1build1 amd64 [installed,automatic]
libsepol1/now 3.0-1ubuntu0.1 amd64 [installed,local]
libsepol2/jammy,now 3.3-1build1 amd64 [installed,automatic]
libserf-1-1/jammy,now 1.3.9-10ubuntu2 amd64 [installed,automatic]
libsigc++-2.0-0v5/jammy,now 2.10.4-2ubuntu3 amd64 [installed,automatic]
libsigsegv2/jammy,now 2.13-1ubuntu3 amd64 [installed,automatic]
libslang2-dev/jammy,now 2.3.2-5build4 amd64 [installed,automatic]
libslang2/jammy,now 2.3.2-5build4 amd64 [installed]
libslirp0/jammy,now 4.6.1-1build1 amd64 [installed,automatic]
libsm6/jammy,now 2:1.2.3-1build2 amd64 [installed,automatic]
libsmartcols1/jammy,now 2.37.2-4ubuntu3 amd64 [installed]
libsndfile1/jammy,now 1.0.31-2build1 amd64 [installed,automatic]
libsodium23/jammy,now 1.0.18-1build2 amd64 [installed,automatic]
libsource-highlight-common/jammy,jammy,now 3.1.9-4.1build2 all [installed,a=
utomatic]
libsource-highlight4v5/jammy,now 3.1.9-4.1build2 amd64 [installed,automatic=
]
libspectre1/jammy,now 0.2.10-1 amd64 [installed,automatic]
libspice-server1/jammy,now 0.15.0-2ubuntu4 amd64 [installed,automatic]
libsqlite3-0/jammy-security,jammy-updates,now 3.37.2-2ubuntu0.1 amd64 [inst=
alled]
libsqlite3-dev/jammy-security,jammy-updates,now 3.37.2-2ubuntu0.1 amd64 [in=
stalled]
libss2/jammy-security,jammy-updates,now 1.46.5-2ubuntu1.1 amd64 [installed]
libssh-4/jammy,now 0.9.6-2build1 amd64 [installed,automatic]
libssh2-1/jammy,now 1.10.0-3 amd64 [installed,automatic]
libssl-dev/jammy-security,jammy-updates,now 3.0.2-0ubuntu1.10 amd64 [instal=
led]
libssl1.0.0/now 1.0.2n-1ubuntu5.10 amd64 [installed,local]
libssl1.1/now 1.1.1f-1ubuntu2.16 amd64 [installed,local]
libssl3/jammy-security,jammy-updates,now 3.0.2-0ubuntu1.10 amd64 [installed=
,automatic]
libssl3/jammy-security,jammy-updates,now 3.0.2-0ubuntu1.10 i386 [installed,=
automatic]
libstartup-notification0/jammy,now 0.12-6build2 amd64 [installed,automatic]
libstd-rust-1.65/jammy-security,jammy-updates,now 1.65.0+dfsg0ubuntu1-0ubun=
tu0.22.04.1 amd64 [installed,automatic]
libstd-rust-dev/jammy-security,jammy-updates,now 1.65.0+dfsg0ubuntu1-0ubunt=
u0.22.04.1 amd64 [installed,automatic]
libstdc++-11-dev/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 a=
md64 [installed,automatic]
libstdc++6/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [in=
stalled]
libstdc++6/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 i386 [ins=
talled]
libsvn1/jammy-security,jammy-updates,now 1.14.1-3ubuntu0.22.04.1 amd64 [ins=
talled,automatic]
libswitch-perl/jammy,jammy,now 2.17-2.1 all [installed,automatic]
libsynctex2/jammy-security,jammy-updates,now 2021.20210626.59705-1ubuntu0.1=
 amd64 [installed,automatic]
libsystemd0/jammy-security,now 249.11-0ubuntu3.7 amd64 [installed,upgradabl=
e to: 249.11-0ubuntu3.9]
libsystemd0/jammy-security,now 249.11-0ubuntu3.7 i386 [installed,upgradable=
 to: 249.11-0ubuntu3.9]
libtasn1-6/jammy,now 4.18.0-4build1 amd64 [installed]
libtasn1-6/jammy,now 4.18.0-4build1 i386 [installed,automatic]
libtcl8.6/jammy,now 8.6.12+dfsg-1build1 amd64 [installed,automatic]
libtext-charwidth-perl/jammy,now 0.04-10build3 amd64 [installed]
libtext-iconv-perl/jammy,now 1.7-7build3 amd64 [installed]
libtext-unidecode-perl/jammy,jammy,now 1.30-1 all [installed,automatic]
libtext-wrapi18n-perl/jammy,jammy,now 0.06-9 all [installed]
libthai-data/jammy,jammy,now 0.1.29-1build1 all [installed,automatic]
libthai0/jammy,now 0.1.29-1build1 amd64 [installed,automatic]
libthai0/jammy,now 0.1.29-1build1 i386 [installed,automatic]
libtheora0/jammy,now 1.1.1+dfsg.1-15ubuntu4 amd64 [installed,automatic]
libthunarx-3-0/jammy,now 4.16.10-1 amd64 [installed,automatic]
libtiff5/jammy-security,jammy-updates,now 4.3.0-6ubuntu0.4 amd64 [installed=
,automatic]
libtiff5/jammy-security,jammy-updates,now 4.3.0-6ubuntu0.4 i386 [installed,=
automatic]
libtimedate-perl/jammy,jammy,now 2.3300-2 all [installed,automatic]
libtinfo5/jammy-security,jammy-updates,now 6.3-2ubuntu0.1 amd64 [installed]
libtinfo6/jammy-security,jammy-updates,now 6.3-2ubuntu0.1 amd64 [installed,=
automatic]
libtirpc-common/jammy-security,jammy-security,jammy-updates,jammy-updates,n=
ow 1.3.2-2ubuntu0.1 all [installed,automatic]
libtirpc-dev/jammy-security,jammy-updates,now 1.3.2-2ubuntu0.1 amd64 [insta=
lled,automatic]
libtirpc3/jammy-security,jammy-updates,now 1.3.2-2ubuntu0.1 amd64 [installe=
d,automatic]
libtokyocabinet9/jammy,now 1.4.48-14build1 amd64 [installed,automatic]
libtool/jammy,jammy,now 2.4.6-15build2 all [installed]
libtry-tiny-perl/jammy,jammy,now 0.31-1 all [installed,automatic]
libtsan0/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [in=
stalled,automatic]
libubsan0/now 7.5.0-6ubuntu2 amd64 [installed,local]
libubsan1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [ins=
talled,automatic]
libuchardet0/jammy,now 0.0.7-1build2 amd64 [installed,automatic]
libudev1/jammy-security,now 249.11-0ubuntu3.7 amd64 [installed,upgradable t=
o: 249.11-0ubuntu3.9]
libunistring2/jammy,now 1.0-1 amd64 [installed]
libunistring2/jammy,now 1.0-1 i386 [installed,automatic]
libunwind8/jammy,now 1.3.2-2build2 amd64 [installed]
libupower-glib3/jammy,now 0.99.17-1 amd64 [installed,automatic]
liburing2/jammy,now 2.1-2build1 amd64 [installed,automatic]
libusb-1.0-0/jammy-updates,now 2:1.0.25-1ubuntu2 amd64 [installed]
libusbredirparser1/jammy,now 0.11.0-2build1 amd64 [installed,automatic]
libutempter0/jammy,now 1.2.1-2build2 amd64 [installed,automatic]
libutf8proc2/jammy,now 2.7.0-3 amd64 [installed,automatic]
libuuid1/jammy,now 2.37.2-4ubuntu3 amd64 [installed]
libuuid1/jammy,now 2.37.2-4ubuntu3 i386 [installed,automatic]
libuv1/jammy,now 1.43.0-1 amd64 [installed,automatic]
libvisual-0.4-0/jammy,now 0.4.0-17build2 amd64 [installed,automatic]
libvorbis0a/jammy,now 1.3.7-1build2 amd64 [installed,automatic]
libvorbisenc2/jammy,now 1.3.7-1build2 amd64 [installed,automatic]
libvte-2.91-0/jammy,now 0.68.0-1 amd64 [installed,automatic]
libvte-2.91-common/jammy,now 0.68.0-1 amd64 [installed,automatic]
libvulkan1/jammy,now 1.3.204.1-2 amd64 [installed,automatic]
libwayland-client0/jammy-security,jammy-updates,now 1.20.0-1ubuntu0.1 amd64=
 [installed,automatic]
libwayland-cursor0/jammy-security,jammy-updates,now 1.20.0-1ubuntu0.1 amd64=
 [installed,automatic]
libwayland-egl1/jammy-security,jammy-updates,now 1.20.0-1ubuntu0.1 amd64 [i=
nstalled,automatic]
libwayland-server0/jammy-security,jammy-updates,now 1.20.0-1ubuntu0.1 amd64=
 [installed,automatic]
libwebp7/jammy-security,jammy-updates,now 1.2.2-2ubuntu0.22.04.1 amd64 [ins=
talled,automatic]
libwebp7/jammy-security,jammy-updates,now 1.2.2-2ubuntu0.22.04.1 i386 [inst=
alled,automatic]
libwnck-3-0/jammy,now 40.1-1 amd64 [installed,automatic]
libwnck-3-common/jammy,jammy,now 40.1-1 all [installed,automatic]
libwrap0/jammy,now 7.6.q-31build2 amd64 [installed]
libx11-6/jammy,now 2:1.7.5-1 amd64 [installed]
libx11-6/jammy,now 2:1.7.5-1 i386 [installed,automatic]
libx11-data/jammy,jammy,now 2:1.7.5-1 all [installed]
libx11-dev/jammy,now 2:1.7.5-1 amd64 [installed,automatic]
libx11-xcb1/jammy,now 2:1.7.5-1 amd64 [installed,automatic]
libx2go-config-perl/jammy,jammy,now 4.1.0.3-5 all [installed,automatic]
libx2go-log-perl/jammy,jammy,now 4.1.0.3-5 all [installed,automatic]
libx2go-server-db-perl/jammy,now 4.1.0.3-5 amd64 [installed,automatic]
libx2go-server-perl/jammy,jammy,now 4.1.0.3-5 all [installed,automatic]
libx2go-utils-perl/jammy,jammy,now 4.1.0.3-5 all [installed,automatic]
libx32asan4/now 7.5.0-6ubuntu2 amd64 [installed,local]
libx32asan5/jammy-security,jammy-updates,now 9.5.0-1ubuntu1~22.04 amd64 [in=
stalled,automatic]
libx32asan6/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 =
[installed,automatic]
libx32atomic1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 =
[installed,automatic]
libx32cilkrts5/now 7.5.0-6ubuntu2 amd64 [installed,local]
libx32gcc-11-dev/jammy-security,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 a=
md64 [installed,automatic]
libx32gcc-7-dev/now 7.5.0-6ubuntu2 amd64 [installed,local]
libx32gcc-9-dev/jammy-security,jammy-updates,now 9.5.0-1ubuntu1~22.04 amd64=
 [installed,automatic]
libx32gcc-s1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [=
installed,automatic]
libx32gomp1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [i=
nstalled,automatic]
libx32itm1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [in=
stalled,automatic]
libx32quadmath0/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd6=
4 [installed,automatic]
libx32stdc++6/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 =
[installed,automatic]
libx32ubsan0/now 7.5.0-6ubuntu2 amd64 [installed,local]
libx32ubsan1/jammy-security,jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [=
installed,automatic]
libxapian30/jammy,now 1.4.18-4 amd64 [installed,automatic]
libxau-dev/jammy,now 1:1.0.9-1build5 amd64 [installed,automatic]
libxau6/jammy,now 1:1.0.9-1build5 amd64 [installed]
libxau6/jammy,now 1:1.0.9-1build5 i386 [installed,automatic]
libxaw7/jammy,now 2:1.0.14-1 amd64 [installed,automatic]
libxcb-dri2-0/jammy,now 1.14-3ubuntu3 amd64 [installed,automatic]
libxcb-dri3-0/jammy,now 1.14-3ubuntu3 amd64 [installed,automatic]
libxcb-glx0/jammy,now 1.14-3ubuntu3 amd64 [installed,automatic]
libxcb-present0/jammy,now 1.14-3ubuntu3 amd64 [installed,automatic]
libxcb-render0/jammy,now 1.14-3ubuntu3 amd64 [installed,automatic]
libxcb-render0/jammy,now 1.14-3ubuntu3 i386 [installed,automatic]
libxcb-shape0/jammy,now 1.14-3ubuntu3 amd64 [installed,automatic]
libxcb-shm0/jammy,now 1.14-3ubuntu3 amd64 [installed,automatic]
libxcb-shm0/jammy,now 1.14-3ubuntu3 i386 [installed,automatic]
libxcb-sync1/jammy,now 1.14-3ubuntu3 amd64 [installed,automatic]
libxcb-util1/jammy,now 0.4.0-1build2 amd64 [installed,automatic]
libxcb-xfixes0/jammy,now 1.14-3ubuntu3 amd64 [installed,automatic]
libxcb1-dev/jammy,now 1.14-3ubuntu3 amd64 [installed,automatic]
libxcb1/jammy,now 1.14-3ubuntu3 amd64 [installed]
libxcb1/jammy,now 1.14-3ubuntu3 i386 [installed,automatic]
libxcomp3/jammy,now 2:3.5.99.26-5 amd64 [installed,automatic]
libxcomposite1/jammy,now 1:0.4.5-1build2 amd64 [installed,automatic]
libxcomposite1/jammy,now 1:0.4.5-1build2 i386 [installed,automatic]
libxcompshad3/jammy,now 2:3.5.99.26-5 amd64 [installed,automatic]
libxcursor1/jammy,now 1:1.2.0-2build4 amd64 [installed,automatic]
libxcursor1/jammy,now 1:1.2.0-2build4 i386 [installed,automatic]
libxdamage1/jammy,now 1:1.1.5-2build2 amd64 [installed,automatic]
libxdamage1/jammy,now 1:1.1.5-2build2 i386 [installed,automatic]
libxdmcp-dev/jammy,now 1:1.1.3-0ubuntu5 amd64 [installed,automatic]
libxdmcp6/jammy,now 1:1.1.3-0ubuntu5 amd64 [installed]
libxdmcp6/jammy,now 1:1.1.3-0ubuntu5 i386 [installed,automatic]
libxext-dev/jammy,now 2:1.3.4-1build1 amd64 [installed,automatic]
libxext6/jammy,now 2:1.3.4-1build1 amd64 [installed]
libxext6/jammy,now 2:1.3.4-1build1 i386 [installed,automatic]
libxfce4panel-2.0-4/jammy,now 4.16.3-1 amd64 [installed,automatic]
libxfce4ui-1-0/now 4.14.1-1ubuntu1 amd64 [installed,local]
libxfce4ui-2-0/jammy,now 4.16.1-1 amd64 [installed,automatic]
libxfce4ui-common/jammy,jammy,now 4.16.1-1 all [installed,automatic]
libxfce4ui-utils/jammy,now 4.16.1-1 amd64 [installed,automatic]
libxfce4util-common/jammy,jammy,now 4.16.0-1 all [installed,automatic]
libxfce4util7/jammy,now 4.16.0-1 amd64 [installed,automatic]
libxfconf-0-3/jammy,now 4.16.0-2 amd64 [installed,automatic]
libxfixes3/jammy,now 1:6.0.0-1 amd64 [installed,automatic]
libxfixes3/jammy,now 1:6.0.0-1 i386 [installed,automatic]
libxfont2/jammy,now 1:2.0.5-1build1 amd64 [installed,automatic]
libxft2/jammy,now 2.3.4-1 amd64 [installed,automatic]
libxi6/jammy,now 2:1.8-1build1 amd64 [installed,automatic]
libxi6/jammy,now 2:1.8-1build1 i386 [installed,automatic]
libxinerama1/jammy,now 2:1.1.4-3 amd64 [installed,automatic]
libxinerama1/jammy,now 2:1.1.4-3 i386 [installed,automatic]
libxkbcommon0/jammy,now 1.4.0-1 amd64 [installed,automatic]
libxkbfile1/jammy,now 1:1.1.0-1build3 amd64 [installed,automatic]
libxkbregistry0/jammy,now 1.4.0-1 amd64 [installed,automatic]
libxklavier16/jammy,now 5.4-4build2 amd64 [installed,automatic]
libxml-libxml-perl/jammy,now 2.0207+dfsg+really+2.0134-1 amd64 [installed,a=
utomatic]
libxml-namespacesupport-perl/jammy,jammy,now 1.12-1.1 all [installed,automa=
tic]
libxml-sax-base-perl/jammy,jammy,now 1.09-1.1 all [installed,automatic]
libxml-sax-perl/jammy,jammy,now 1.02+dfsg-3 all [installed,automatic]
libxml2/jammy-security,jammy-updates,now 2.9.13+dfsg-1ubuntu0.3 amd64 [inst=
alled]
libxmu6/jammy,now 2:1.1.3-3 amd64 [installed,automatic]
libxmuu1/jammy,now 2:1.1.3-3 amd64 [installed]
libxpm4/jammy-security,jammy-updates,now 1:3.5.12-1ubuntu0.22.04.1 amd64 [i=
nstalled,automatic]
libxpresent1/jammy,now 1.0.0-2build1 amd64 [installed,automatic]
libxrandr2/jammy,now 2:1.5.2-1build1 amd64 [installed,automatic]
libxrandr2/jammy,now 2:1.5.2-1build1 i386 [installed,automatic]
libxrender1/jammy,now 1:0.9.10-1build4 amd64 [installed,automatic]
libxrender1/jammy,now 1:0.9.10-1build4 i386 [installed,automatic]
libxres1/jammy,now 2:1.2.1-1 amd64 [installed,automatic]
libxshmfence1/jammy,now 1.3-1build4 amd64 [installed,automatic]
libxslt1.1/jammy-security,jammy-updates,now 1.1.34-4ubuntu0.22.04.1 amd64 [=
installed]
libxt6/jammy,now 1:1.2.1-1 amd64 [installed,automatic]
libxtables12/jammy,now 1.8.7-1ubuntu5 amd64 [installed,upgradable to: 1.8.7=
-1ubuntu5.1]
libxtst6/jammy,now 2:1.2.3-1build4 amd64 [installed,automatic]
libxtst6/jammy,now 2:1.2.3-1build4 i386 [installed]
libxv1/jammy,now 2:1.0.11-1build2 amd64 [installed,automatic]
libxxf86dga1/jammy,now 2:1.1.5-0ubuntu3 amd64 [installed,automatic]
libxxf86vm1/jammy,now 1:1.1.4-1build3 amd64 [installed,automatic]
libxxhash0/jammy,now 0.8.1-1 amd64 [installed,automatic]
libyaml-0-2/jammy,now 0.2.2-1build2 amd64 [installed]
libzstd1/jammy,now 1.4.8+dfsg-3build1 amd64 [installed]
libzstd1/jammy,now 1.4.8+dfsg-3build1 i386 [installed,automatic]
linux-base/jammy,jammy,now 4.5ubuntu9 all [installed]
linux-firmware/jammy-security,jammy-security,now 20220329.git681281e4-0ubun=
tu3.12 all [installed,upgradable to: 20220329.git681281e4-0ubuntu3.13]
linux-generic/jammy-security,jammy-updates,now 5.15.0.73.71 amd64 [installe=
d,automatic]
linux-headers-5.15.0-56-generic/now 5.15.0-56.62 amd64 [installed,local]
linux-headers-5.15.0-56/now 5.15.0-56.62 all [installed,local]
linux-headers-5.15.0-73-generic/jammy-security,jammy-updates,now 5.15.0-73.=
80 amd64 [installed,automatic]
linux-headers-5.15.0-73/jammy-security,jammy-security,jammy-updates,jammy-u=
pdates,now 5.15.0-73.80 all [installed,automatic]
linux-headers-generic/jammy-security,jammy-updates,now 5.15.0.73.71 amd64 [=
installed,automatic]
linux-image-5.15.0-56-generic/now 5.15.0-56.62 amd64 [installed,local]
linux-image-5.15.0-73-generic/jammy-security,jammy-updates,now 5.15.0-73.80=
 amd64 [installed,automatic]
linux-image-generic/jammy-security,jammy-updates,now 5.15.0.73.71 amd64 [in=
stalled,automatic]
linux-libc-dev/jammy-security,jammy-updates,now 5.15.0-73.80 amd64 [install=
ed,automatic]
linux-modules-5.15.0-56-generic/now 5.15.0-56.62 amd64 [installed,local]
linux-modules-5.15.0-73-generic/jammy-security,jammy-updates,now 5.15.0-73.=
80 amd64 [installed,automatic]
linux-modules-extra-5.15.0-56-generic/now 5.15.0-56.62 amd64 [installed,loc=
al]
linux-modules-extra-5.15.0-73-generic/jammy-security,jammy-updates,now 5.15=
.0-73.80 amd64 [installed,automatic]
linux-signed-generic/now 4.15.0.197.182 amd64 [installed,local]
locales/jammy-updates,jammy-updates,now 2.35-0ubuntu3.1 all [installed]
login/jammy-security,jammy-updates,now 1:4.8.1-2ubuntu2.1 amd64 [installed]
logrotate/jammy-security,jammy-updates,now 3.19.0-1ubuntu1.1 amd64 [install=
ed]
logsave/jammy-security,jammy-updates,now 1.46.5-2ubuntu1.1 amd64 [installed=
,automatic]
lsb-base/jammy,jammy,now 11.1.0ubuntu4 all [installed]
lsb-release/jammy,jammy,now 11.1.0ubuntu4 all [installed]
lshw/jammy,now 02.19.git.2021.06.19.996aaad9c7-2build1 amd64 [installed]
lsof/jammy,now 4.93.2+dfsg-1.1build2 amd64 [installed]
lto-disabled-list/jammy,jammy,now 24 all [installed,automatic]
ltrace/jammy,now 0.7.3-6.1ubuntu6 amd64 [installed]
lz4/jammy,now 1.9.3-2build2 amd64 [installed,automatic]
lzip/jammy,now 1.23-1 amd64 [installed]
m17n-db/jammy,jammy,now 1.8.0-3 all [installed,automatic]
m4/jammy,now 1.4.18-5ubuntu2 amd64 [installed,automatic]
mailcap/jammy,jammy,now 3.70+nmu1ubuntu1 all [installed,automatic]
make/jammy,now 4.3-4.1build1 amd64 [installed,automatic]
man-db/jammy,now 2.10.2-1 amd64 [installed]
manpages-dev/jammy,jammy,now 5.10-1ubuntu1 all [installed]
manpages/jammy,jammy,now 5.10-1ubuntu1 all [installed]
mawk/jammy,now 1.3.4.20200120-3 amd64 [installed]
mdadm/jammy,now 4.2-0ubuntu1 amd64 [installed,upgradable to: 4.2-0ubuntu2]
media-types/jammy,jammy,now 7.0.0 all [installed,automatic]
meld/jammy,jammy,now 3.20.4-2 all [installed]
mime-support/jammy,jammy,now 3.66 all [installed]
mokutil/jammy,now 0.4.0-1ubuntu2 amd64 [installed,upgradable to: 0.6.0-2~22=
.04.1]
monitoring-plugins-basic/jammy,now 2.3.1-1ubuntu4 amd64 [installed]
monitoring-plugins-common/jammy,now 2.3.1-1ubuntu4 amd64 [installed,automat=
ic]
mosh/jammy,now 1.3.2-2.1ubuntu1 amd64 [installed]
mount/jammy,now 2.37.2-4ubuntu3 amd64 [installed]
mtr-tiny/jammy,now 0.95-1 amd64 [installed]
multiarch-support/now 2.27-3ubuntu1.5 amd64 [installed,local]
mutt/jammy-security,jammy-updates,now 2.1.4-1ubuntu1.1 amd64 [installed]
nano/jammy,now 6.2-1 amd64 [installed]
ncal/jammy,now 12.1.7+nmu3ubuntu2 amd64 [installed,automatic]
ncdu/jammy,now 1.15.1-1 amd64 [installed]
ncurses-base/jammy-security,jammy-security,jammy-updates,jammy-updates,now =
6.3-2ubuntu0.1 all [installed]
ncurses-bin/jammy-security,jammy-updates,now 6.3-2ubuntu0.1 amd64 [installe=
d]
ncurses-term/jammy-security,jammy-security,jammy-updates,jammy-updates,now =
6.3-2ubuntu0.1 all [installed]
net-tools/jammy,now 1.60+git20181103.0eebece-1ubuntu5 amd64 [installed,auto=
matic]
netbase/jammy,jammy,now 6.3 all [installed]
netcat-openbsd/jammy,now 1.218-4ubuntu1 amd64 [installed]
netfilter-persistent/jammy,jammy,now 1.0.16 all [installed,automatic]
networkd-dispatcher/jammy-security,jammy-security,jammy-updates,jammy-updat=
es,now 2.1-2ubuntu0.22.04.2 all [installed]
nfs-common/jammy-updates,now 1:2.6.1-1ubuntu1.2 amd64 [installed]
nfs-kernel-server/jammy-updates,now 1:2.6.1-1ubuntu1.2 amd64 [installed]
nftables/jammy-updates,now 1.0.2-1ubuntu3 amd64 [installed,automatic]
ninja-build/jammy,now 1.10.1-1 amd64 [installed]
nis/jammy,jammy,now 4.4 all [installed]
ntfs-3g/jammy-security,jammy-updates,now 1:2021.8.22-3ubuntu1.2 amd64 [inst=
alled]
nx-x11-common/jammy,jammy,now 2:3.5.99.26-5 all [installed,automatic]
nxagent/jammy,now 2:3.5.99.26-5 amd64 [installed,automatic]
openjdk-11-jdk-headless/jammy-security,jammy-updates,now 11.0.19+7~us1-0ubu=
ntu1~22.04.1 amd64 [installed,automatic]
openjdk-11-jdk/jammy-security,jammy-updates,now 11.0.19+7~us1-0ubuntu1~22.0=
4.1 amd64 [installed]
openjdk-11-jre-headless/jammy-security,jammy-updates,now 11.0.19+7~us1-0ubu=
ntu1~22.04.1 amd64 [installed,automatic]
openjdk-11-jre/jammy-security,jammy-updates,now 11.0.19+7~us1-0ubuntu1~22.0=
4.1 amd64 [installed,automatic]
openjdk-17-jdk-headless/jammy-security,jammy-updates,now 17.0.7+7~us1-0ubun=
tu1~22.04.2 amd64 [installed]
openjdk-17-jre-headless/jammy-security,jammy-updates,now 17.0.7+7~us1-0ubun=
tu1~22.04.2 amd64 [installed,automatic]
openssh-client/jammy,now 1:8.9p1-3 amd64 [installed,upgradable to: 1:8.9p1-=
3ubuntu0.1]
openssh-server/jammy,now 1:8.9p1-3 amd64 [installed,upgradable to: 1:8.9p1-=
3ubuntu0.1]
openssh-sftp-server/jammy,now 1:8.9p1-3 amd64 [installed,upgradable to: 1:8=
.9p1-3ubuntu0.1]
openssl/jammy-security,jammy-updates,now 3.0.2-0ubuntu1.10 amd64 [installed=
]
openvpn/jammy-updates,now 2.5.5-1ubuntu3.1 amd64 [installed]
os-prober/jammy,now 1.79ubuntu2 amd64 [installed,automatic]
ovmf/jammy-updates,jammy-updates,now 2022.02-3ubuntu0.22.04.1 all [installe=
d]
pamtester/jammy,now 0.1.2-4 amd64 [installed]
parted/jammy,now 3.4-2build1 amd64 [installed]
passwd/jammy-security,jammy-updates,now 1:4.8.1-2ubuntu2.1 amd64 [installed=
]
patch/jammy,now 2.7.6-7build2 amd64 [installed,automatic]
pci.ids/jammy,jammy,now 0.0~2022.01.22-1 all [installed,automatic]
pciutils/jammy,now 1:3.7.0-6 amd64 [installed]
perl-base/jammy-security,jammy-updates,now 5.34.0-3ubuntu1.1 amd64 [install=
ed]
perl-modules-5.34/jammy-security,jammy-security,jammy-updates,jammy-updates=
,now 5.34.0-3ubuntu1.1 all [installed,automatic]
perl-openssl-defaults/jammy,now 5build2 amd64 [installed,automatic]
perl/jammy-security,jammy-updates,now 5.34.0-3ubuntu1.1 amd64 [installed,au=
tomatic]
pinentry-curses/jammy,now 1.1.1-1build2 amd64 [installed,automatic]
pkg-config/jammy,now 0.29.2-1ubuntu3 amd64 [installed,automatic]
plymouth-theme-ubuntu-text/jammy,now 0.9.5+git20211018-1ubuntu3 amd64 [inst=
alled]
plymouth/jammy,now 0.9.5+git20211018-1ubuntu3 amd64 [installed]
poppler-data/jammy,jammy,now 0.4.11-1 all [installed,automatic]
popularity-contest/jammy,jammy,now 1.71ubuntu3 all [installed]
postfix/jammy,now 3.6.4-1ubuntu1 amd64 [installed,upgradable to: 3.6.4-1ubu=
ntu1.1]
powermgmt-base/jammy,jammy,now 1.36 all [installed]
procps/jammy,now 2:3.3.17-6ubuntu2 amd64 [installed]
psmisc/jammy,now 23.4-2build3 amd64 [installed]
publicsuffix/jammy,jammy,now 20211207.1025-1 all [installed]
puppet-agent/jammy,now 7.24.0-1jammy amd64 [installed]
pwgen/jammy,now 2.08-2build1 amd64 [installed,automatic]
python-apt-common/now 2.3.0ubuntu2.1 all [installed,upgradable to: 2.4.0ubu=
ntu1]
python3-apt/now 2.3.0ubuntu2.1 amd64 [installed,upgradable to: 2.4.0ubuntu1=
]
python3-cairo/jammy,now 1.20.1-3build1 amd64 [installed,automatic]
python3-certifi/jammy,jammy,now 2020.6.20-1 all [installed]
python3-chardet/jammy,jammy,now 4.0.0-1 all [installed]
python3-commandnotfound/jammy,jammy,now 22.04.0 all [installed]
python3-dateutil/jammy,jammy,now 2.8.1-6 all [installed,automatic]
python3-dbus/jammy,now 1.2.18-3build1 amd64 [installed]
python3-dev/jammy-updates,now 3.10.6-1~22.04 amd64 [installed]
python3-distro-info/jammy,jammy,now 1.1build1 all [installed]
python3-distro/jammy,jammy,now 1.7.0-1 all [installed,automatic]
python3-distupgrade/now 1:22.04.15 all [installed,upgradable to: 1:22.04.16=
]
python3-distutils/jammy-updates,jammy-updates,now 3.10.6-1~22.04 all [insta=
lled,automatic]
python3-et-xmlfile/jammy,jammy,now 1.0.1-2.1 all [installed,automatic]
python3-extras/jammy,jammy,now 1.0.0-4build1 all [installed,automatic]
python3-fixtures/jammy,jammy,now 3.0.0-4 all [installed,automatic]
python3-gdbm/jammy-updates,now 3.10.6-1~22.04 amd64 [installed]
python3-gi-cairo/jammy-updates,now 3.42.1-0ubuntu1 amd64 [installed,automat=
ic]
python3-gi/jammy-updates,now 3.42.1-0ubuntu1 amd64 [installed]
python3-git/jammy,jammy,now 3.1.24-1 all [installed]
python3-gitdb/jammy,jammy,now 4.0.9-1 all [installed,automatic]
python3-idna/jammy,jammy,now 3.3-1 all [installed]
python3-jdcal/jammy,jammy,now 1.0-1.3 all [installed,automatic]
python3-lib2to3/jammy-updates,jammy-updates,now 3.10.6-1~22.04 all [install=
ed,automatic]
python3-lxml/jammy,now 4.8.0-1build1 amd64 [installed,automatic]
python3-minimal/jammy-updates,now 3.10.6-1~22.04 amd64 [installed]
python3-newt/jammy,now 0.52.21-5ubuntu2 amd64 [installed,automatic]
python3-numpy/jammy-security,jammy-updates,now 1:1.21.5-1ubuntu22.04.1 amd6=
4 [installed,automatic]
python3-openpyxl/jammy,jammy,now 3.0.9-1 all [installed]
python3-pandas-lib/jammy,now 1.3.5+dfsg-3 amd64 [installed,automatic]
python3-pandas/jammy,jammy,now 1.3.5+dfsg-3 all [installed]
python3-pbr/jammy,jammy,now 5.8.0-0ubuntu1 all [installed,automatic]
python3-pip-whl/jammy-security,jammy-security,jammy-updates,jammy-updates,n=
ow 22.0.2+dfsg-1ubuntu0.2 all [installed,automatic]
python3-pkg-resources/jammy-security,jammy-security,jammy-updates,jammy-upd=
ates,now 59.6.0-1.2ubuntu0.22.04.1 all [installed]
python3-requests/jammy,jammy,now 2.25.1+dfsg-2 all [installed]
python3-setuptools-whl/jammy-security,jammy-security,jammy-updates,jammy-up=
dates,now 59.6.0-1.2ubuntu0.22.04.1 all [installed,automatic]
python3-setuptools/jammy-security,jammy-security,jammy-updates,jammy-update=
s,now 59.6.0-1.2ubuntu0.22.04.1 all [installed,automatic]python3-six/jammy,=
jammy,now 1.16.0-3ubuntu1 all [installed]
python3-smmap/jammy,jammy,now 5.0.0-1 all [installed,automatic]
python3-subunit/jammy,jammy,now 1.4.0-3 all [installed]
python3-testtools/jammy,jammy,now 2.5.0-3ubuntu2 all [installed]
python3-tz/now 2022.1-1ubuntu0.22.04.0 all [installed,upgradable to: 2022.1=
-1ubuntu0.22.04.1]
python3-update-manager/jammy,jammy,now 1:22.04.9 all [installed,upgradable =
to: 1:22.04.10]
python3-urllib3/jammy,jammy,now 1.26.5-1~exp1 all [installed]
python3-venv/jammy-updates,now 3.10.6-1~22.04 amd64 [installed]
python3-yaml/jammy,now 5.4.1-1ubuntu1 amd64 [installed]
python3.10-dev/jammy-security,jammy-updates,now 3.10.6-1~22.04.2ubuntu1 amd=
64 [installed,automatic]
python3.10-minimal/jammy-security,jammy-updates,now 3.10.6-1~22.04.2ubuntu1=
 amd64 [installed,automatic]
python3.10-venv/jammy-security,jammy-updates,now 3.10.6-1~22.04.2ubuntu1 am=
d64 [installed,automatic]
python3.10/jammy-security,jammy-updates,now 3.10.6-1~22.04.2ubuntu1 amd64 [=
installed,automatic]
python3.6-minimal/now 3.6.9-1~18.04ubuntu1.8 amd64 [installed,local]
python3.6/now 3.6.9-1~18.04ubuntu1.8 amd64 [installed,local]
python3/jammy-updates,now 3.10.6-1~22.04 amd64 [installed]
qemu-block-extra/jammy-security,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,=
upgradable to: 1:6.2+dfsg-2ubuntu6.8]
qemu-system-arm/jammy-security,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,u=
pgradable to: 1:6.2+dfsg-2ubuntu6.8]
qemu-system-common/jammy-security,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installe=
d,upgradable to: 1:6.2+dfsg-2ubuntu6.8]
qemu-system-data/jammy-security,jammy-security,now 1:6.2+dfsg-2ubuntu6.6 al=
l [installed,upgradable to: 1:6.2+dfsg-2ubuntu6.8]
qemu-system-mips/jammy-security,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,=
upgradable to: 1:6.2+dfsg-2ubuntu6.8]
qemu-system-misc/jammy-security,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,=
upgradable to: 1:6.2+dfsg-2ubuntu6.8]
qemu-system-ppc/jammy-security,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,u=
pgradable to: 1:6.2+dfsg-2ubuntu6.8]
qemu-system-s390x/jammy-security,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed=
,upgradable to: 1:6.2+dfsg-2ubuntu6.8]
qemu-system-sparc/jammy-security,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed=
,upgradable to: 1:6.2+dfsg-2ubuntu6.8]
qemu-system-x86/jammy-security,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,u=
pgradable to: 1:6.2+dfsg-2ubuntu6.8]
qemu-system/jammy-security,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgra=
dable to: 1:6.2+dfsg-2ubuntu6.8]
qemu-utils/jammy-security,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgrad=
able to: 1:6.2+dfsg-2ubuntu6.8]
quilt/jammy,jammy,now 0.66-2.1 all [installed]
rake/jammy,jammy,now 13.0.6-2 all [installed,automatic]
readline-common/jammy,jammy,now 8.1.2-1 all [installed]
ripgrep/jammy-security,jammy-updates,now 13.0.0-2ubuntu0.1 amd64 [installed=
]
rpcbind/jammy,now 1.2.6-2build1 amd64 [installed,automatic]
rpcsvc-proto/jammy,now 1.4.2-0ubuntu6 amd64 [installed,automatic]
rpm-common/jammy,now 4.17.0+dfsg1-4build1 amd64 [installed,automatic]
rpm2cpio/jammy,now 4.17.0+dfsg1-4build1 amd64 [installed]
rsync/jammy-security,jammy-updates,now 3.2.7-0ubuntu0.22.04.2 amd64 [instal=
led]
rsyslog/jammy-security,jammy-updates,now 8.2112.0-2ubuntu2.2 amd64 [install=
ed]
ruby-minitest/jammy,jammy,now 5.13.0-1 all [installed,automatic]
ruby-net-telnet/jammy,jammy,now 0.1.1-2 all [installed,automatic]
ruby-power-assert/jammy,jammy,now 1.1.7-2 all [installed,automatic]
ruby-rubygems/jammy,jammy,now 3.3.5-2 all [installed,automatic]
ruby-test-unit/jammy,jammy,now 3.3.9-1 all [installed,automatic]
ruby-xmlrpc/jammy-updates,jammy-updates,now 0.3.2-1ubuntu0.1 all [installed=
,automatic]
ruby3.0/jammy-security,jammy-updates,now 3.0.2-7ubuntu2.3 amd64 [installed,=
automatic]
ruby/jammy,now 1:3.0~exp1 amd64 [installed,automatic]
rubygems-integration/jammy,jammy,now 1.18 all [installed,automatic]
rustc/jammy-security,jammy-updates,now 1.65.0+dfsg0ubuntu1-0ubuntu0.22.04.1=
 amd64 [installed,automatic]
sbsigntool/jammy,now 0.9.4-2ubuntu2 amd64 [installed,automatic]
screen/jammy,now 4.9.0-1 amd64 [installed]
seabios/jammy,jammy,now 1.15.0-1 all [installed,automatic]
secureboot-db/jammy,now 1.8 amd64 [installed,automatic]
sed/jammy,now 4.8-1ubuntu2 amd64 [installed]
sensible-utils/jammy,jammy,now 0.0.17 all [installed]
sensu-go-agent/jammy,now 6.10.0-7172 amd64 [installed]
session-migration/jammy,now 0.3.6 amd64 [installed,automatic]
shared-mime-info/jammy,now 2.1-2 amd64 [installed]
shim-signed/jammy,now 1.51+15.4-0ubuntu9 amd64 [installed,upgradable to: 1.=
51.3+15.7-0ubuntu1]
sloccount/jammy,now 2.26-5.2 amd64 [installed]
sqlite3-tools/jammy-security,jammy-updates,now 3.37.2-2ubuntu0.1 amd64 [ins=
talled]
sqlite3/jammy-security,jammy-updates,now 3.37.2-2ubuntu0.1 amd64 [installed=
]
ssh-import-id/jammy,jammy,now 5.11-0ubuntu1 all [installed]
ssl-cert/jammy,jammy,now 1.1.2 all [installed,automatic]
strace/jammy,now 5.16-0ubuntu3 amd64 [installed]
stress/jammy,now 1.0.5-1 amd64 [installed]
subversion/jammy-security,jammy-updates,now 1.14.1-3ubuntu0.22.04.1 amd64 [=
installed]
sudo/jammy-security,jammy-updates,now 1.9.9-1ubuntu2.4 amd64 [installed]
swaks/jammy,jammy,now 20201014.0-2 all [installed]
sysstat/jammy-security,jammy-updates,now 12.5.2-2ubuntu0.1 amd64 [installed=
]
systemd-sysv/jammy-security,now 249.11-0ubuntu3.7 amd64 [installed,upgradab=
le to: 249.11-0ubuntu3.9]
systemd-timesyncd/jammy-security,now 249.11-0ubuntu3.7 amd64 [installed,upg=
radable to: 249.11-0ubuntu3.9]
systemd/jammy-security,now 249.11-0ubuntu3.7 amd64 [installed,upgradable to=
: 249.11-0ubuntu3.9]
sysvinit-utils/jammy,now 3.01-1ubuntu1 amd64 [installed]
tar/jammy-security,jammy-updates,now 1.34+dfsg-1ubuntu0.1.22.04.1 amd64 [in=
stalled]
tasksel-data/jammy,jammy,now 3.68ubuntu2 all [installed,automatic]
tasksel/jammy,jammy,now 3.68ubuntu2 all [installed]
tcl-expect/jammy,now 5.45.4-2build1 amd64 [installed,automatic]
tcl8.6/jammy,now 8.6.12+dfsg-1build1 amd64 [installed,automatic]
tcpdump/jammy,now 4.99.1-3build2 amd64 [installed,upgradable to: 4.99.1-3ub=
untu0.1]
tcsh/jammy,now 6.21.00-1.1 amd64 [installed]
telnet/jammy,now 0.17-44build1 amd64 [installed]
tex-common/jammy,jammy,now 6.17 all [installed,automatic]
texi2html/jammy,jammy,now 1.82+dfsg1-6 all [installed]
texinfo/jammy,now 6.8-4build1 amd64 [installed]
thunar-data/jammy,jammy,now 4.16.10-1 all [installed,automatic]
thunar/jammy,now 4.16.10-1 amd64 [installed,automatic]
tig/jammy,now 2.5.1-1 amd64 [installed]
time/jammy,now 1.9-0.1build2 amd64 [installed]
tmux/jammy-security,jammy-updates,now 3.2a-4ubuntu0.2 amd64 [installed]
tnftp/jammy,now 20210827-4build1 amd64 [installed,automatic]
traceroute/jammy,now 1:2.1.0-2 amd64 [installed]
tree/jammy,now 2.0.2-1 amd64 [installed]
tzdata/jammy-security,jammy-security,now 2023c-0ubuntu0.22.04.0 all [instal=
led,upgradable to: 2023c-0ubuntu0.22.04.2]
ubuntu-keyring/jammy,jammy,now 2021.03.26 all [installed]
ubuntu-mono/jammy,jammy,now 20.10-0ubuntu2 all [installed,automatic]
ubuntu-release-upgrader-core/now 1:22.04.15 all [installed,upgradable to: 1=
:22.04.16]
ubuntu-standard/jammy,now 1.481 amd64 [installed]
ucf/jammy,jammy,now 3.0043 all [installed]
udev/jammy-security,now 249.11-0ubuntu3.7 amd64 [installed,upgradable to: 2=
49.11-0ubuntu3.9]
unattended-upgrades/jammy,jammy,now 2.8ubuntu1 all [installed]
unzip/jammy-security,jammy-updates,now 6.0-26ubuntu3.1 amd64 [installed]
ureadahead/now 0.100.0-21 amd64 [installed,local]
usb.ids/jammy,jammy,now 2022.04.02-1 all [installed,automatic]
usbutils/jammy,now 1:014-1build1 amd64 [installed]
util-linux/jammy,now 2.37.2-4ubuntu3 amd64 [installed]
uuid-dev/jammy,now 2.37.2-4ubuntu3 amd64 [installed]
uuid-runtime/jammy,now 2.37.2-4ubuntu3 amd64 [installed]
vim-common/jammy-security,jammy-security,jammy-updates,jammy-updates,now 2:=
8.2.3995-1ubuntu2.7 all [installed]
vim-nox/jammy-security,jammy-updates,now 2:8.2.3995-1ubuntu2.7 amd64 [insta=
lled]
vim-runtime/jammy-security,jammy-security,jammy-updates,jammy-updates,now 2=
:8.2.3995-1ubuntu2.7 all [installed,automatic]
vim-tiny/jammy-security,jammy-updates,now 2:8.2.3995-1ubuntu2.7 amd64 [inst=
alled]
vpnc-scripts/jammy,jammy,now 0.1~git20210402-1 all [installed]
w3m/jammy-security,jammy-updates,now 0.5.3+git20210102-6ubuntu0.1 amd64 [in=
stalled]
wamerican/jammy,jammy,now 2020.12.07-2 all [installed]
wbritish/jammy,jammy,now 2020.12.07-2 all [installed]
wget/jammy,now 1.21.2-2ubuntu1 amd64 [installed]
whiptail/jammy,now 0.52.21-5ubuntu2 amd64 [installed]
whois/jammy,now 5.5.13 amd64 [installed]
wiggle/jammy,now 1.1-1 amd64 [installed]
wireless-regdb/jammy-security,jammy-security,jammy-updates,jammy-updates,no=
w 2022.06.06-0ubuntu1~22.04.1 all [installed,automatic]
wpasupplicant/jammy-updates,now 2:2.10-6ubuntu2 amd64 [installed]
x11-common/jammy,jammy,now 1:7.7+23ubuntu2 all [installed,automatic]
x11-utils/jammy,now 7.7+5build2 amd64 [installed,automatic]
x11-xkb-utils/jammy,now 7.7+5build4 amd64 [installed,automatic]
x11-xserver-utils/jammy,now 7.7+9build1 amd64 [installed,automatic]
x11proto-core-dev/jammy,jammy,now 2021.5-1 all [installed,automatic]
x11proto-dev/jammy,jammy,now 2021.5-1 all [installed,automatic]
x2goserver-common/jammy,jammy,now 4.1.0.3-5 all [installed,automatic]
x2goserver-extensions/jammy,jammy,now 4.1.0.3-5 all [installed]
x2goserver-x2goagent/jammy,now 4.1.0.3-5 amd64 [installed,automatic]
x2goserver-xsession/jammy,jammy,now 4.1.0.3-5 all [installed,automatic]
x2goserver/jammy,now 4.1.0.3-5 amd64 [installed]
xauth/jammy,now 1:1.1-1build2 amd64 [installed]
xbitmaps/jammy,jammy,now 1.1.1-2.1ubuntu1 all [installed,automatic]
xdg-user-dirs/jammy,now 0.17-2ubuntu4 amd64 [installed]
xemacs21-basesupport/jammy,jammy,now 2009.02.17.dfsg.2-5 all [installed,aut=
omatic]
xemacs21-bin/jammy,now 21.4.24-9ubuntu2 amd64 [installed,automatic]
xemacs21-mule/jammy,now 21.4.24-9ubuntu2 amd64 [installed,automatic]
xemacs21-mulesupport/jammy,jammy,now 2009.02.17.dfsg.2-5 all [installed,aut=
omatic]
xemacs21-support/jammy,jammy,now 21.4.24-9ubuntu2 all [installed,automatic]
xemacs21/jammy,jammy,now 21.4.24-9ubuntu2 all [installed]
xfce4-appfinder/jammy,now 4.16.1-1 amd64 [installed,automatic]
xfce4-helpers/jammy,now 4.16.2-1ubuntu2 amd64 [installed,automatic]
xfce4-panel/jammy,now 4.16.3-1 amd64 [installed]
xfce4-pulseaudio-plugin/jammy,now 0.4.3-1 amd64 [installed,automatic]
xfce4-session/jammy,now 4.16.0-1ubuntu2 amd64 [installed]
xfce4-settings/jammy,now 4.16.2-1ubuntu2 amd64 [installed,automatic]
xfce4-terminal/jammy,now 0.8.10-1 amd64 [installed]
xfce4/jammy,jammy,now 4.16 all [installed]
xfconf/jammy,now 4.16.0-2 amd64 [installed,automatic]
xfdesktop4-data/jammy,jammy,now 4.16.0-1 all [installed,automatic]
xfdesktop4/jammy,now 4.16.0-1 amd64 [installed,automatic]
xfonts-base/jammy,jammy,now 1:1.0.5 all [installed]
xfonts-encodings/jammy,jammy,now 1:1.0.5-0ubuntu2 all [installed,automatic]
xfonts-utils/jammy,now 1:7.7+6build2 amd64 [installed,automatic]
xfsprogs/jammy,now 5.13.0-1ubuntu2 amd64 [installed]
xfwm4/jammy,now 4.16.1-1 amd64 [installed,automatic]
xkb-data/jammy,jammy,now 2.33-1 all [installed]
xorg-sgml-doctools/jammy,jammy,now 1:1.11-1.1 all [installed,automatic]
xsltproc/jammy-security,jammy-updates,now 1.1.34-4ubuntu0.22.04.1 amd64 [in=
stalled]
xterm/jammy,now 372-1ubuntu1 amd64 [installed]
xtrans-dev/jammy,jammy,now 1.4.0-1 all [installed,automatic]
xxd/jammy-security,jammy-updates,now 2:8.2.3995-1ubuntu2.7 amd64 [installed=
]
xz-utils/jammy,now 5.2.5-2ubuntu1 amd64 [installed]
yp-tools/jammy,now 4.2.3-3 amd64 [installed,automatic]
ypbind-mt/jammy,now 2.7.2-2 amd64 [installed,automatic]
ypserv/jammy,now 4.1-2 amd64 [installed,automatic]
zip/jammy,now 3.0-12build2 amd64 [installed]
zlib1g-dev/jammy-security,jammy-updates,now 1:1.2.11.dfsg-2ubuntu9.2 amd64 =
[installed,automatic]
zlib1g/jammy-security,jammy-updates,now 1:1.2.11.dfsg-2ubuntu9.2 amd64 [ins=
talled]
zlib1g/jammy-security,jammy-updates,now 1:1.2.11.dfsg-2ubuntu9.2 i386 [inst=
alled,automatic]
znc/jammy,now 1.8.2-2build5 amd64 [installed]
zstd/jammy,now 1.4.8+dfsg-3build1 amd64 [installed]

Regards,
Yash

From: Kokkonda, Sundeep<mailto:Sundeep.Kokkonda@windriver.com>
Sent: 31 May 2023 12:19
To: Richard Purdie<mailto:richard.purdie@linuxfoundation.org>; Yash Shinde<=
mailto:yashinde145@gmail.com>; openembedded-core@lists.openembedded.org<mai=
lto:openembedded-core@lists.openembedded.org>; MacLeod, Randy<mailto:Randy.=
MacLeod@windriver.com>
Cc: Kallapa, Umesh<mailto:Umesh.Kallapa@windriver.com>; Gowda, Naveen<mailt=
o:Naveen.Gowda@windriver.com>; Moodalappa, Shivaprasad<mailto:Shivaprasad.M=
oodalappa@windriver.com>; Shinde, Yash<mailto:Yash.Shinde@windriver.com>; M=
adhavan, Maya [US-ITAR]<mailto:maya.madhavan@windriver.com>
Subject: Re: [PATCH v14] Rust Oe-Selftest implementation

Hello Richard,

We've (re)tested and reviewed the results of this patch on our local setup =
and those are "PASSED".
We will discuss further with Randy and get back to community.



Thanks,
Sundeep K.



From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: 30 May 2023 19:29
To: Yash Shinde <yashinde145@gmail.com>; openembedded-core@lists.openembedd=
ed.org <openembedded-core@lists.openembedded.org>
Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>; Kallapa, Umesh <Umesh.Kal=
lapa@windriver.com>; Gowda, Naveen <Naveen.Gowda@windriver.com>; Kokkonda, =
Sundeep <Sundeep.Kokkonda@windriver.com>; Moodalappa, Shivaprasad <Shivapra=
sad.Moodalappa@windriver.com>; Shinde, Yash <Yash.Shinde@windriver.com>
Subject: Re: [PATCH v14] Rust Oe-Selftest implementation

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Tue, 2023-05-30 at 16:21 +0530, Yash Shinde wrote:
> The patch implements Rust testing framework similar to other selftest,
> specifically the gcc selftest in OE. It uses the client and server
> based method to test the binaries for cross-target on the image.
> The test framework is a wrapper around the Rust build system as ./x.py
> test. It tests many functionalities of Rust distribution like tools,
> documentation, libraries, packages, tools, Cargo, Crater etc.
> Please refer the following link for detailed description of Rust
> testing:-
> https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
>
> To support the rust tests in oe-core, the following functions were
> added:-
> setup_cargo_environment(): Build bootstrap and some early stage tools.
> do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> do_configure(): To generate config.toml
> do_compile(): To build "remote-test-server" for qemu target image.
>
> Approximate Number of Tests Run in the Rust Testsuite :- 18000
> Approximate Number of Tests that FAIL in bitbake environment :- 100-150
> Normally majority of the testcases are present in major folder "test/"
> It contributes to more than 80% of the testcases present in Rust test
> framework. These tests pass as expected on any Rust versions without
> much fuss. The tests that fail are of less important and contribute to
> less than 2% of the total testcases. These minor tests are observed to
> work on some versions and fail on others. They have to be added, ignored
> or excluded for different versions as per the behavior.
> These tests have been ignored or excluded in the Rust selftest
> environment to generate success of completing the testsuite.
>
> These tests work in parallel mode even in the skipped test mode as
> expected. Although the patch to disable tests is large, it is very simple
> in that it only disables tests. When updating to a newer version of Rust,
> the patch can usually be ported in a day.
>
> Tested for X86, X86-64, ARM, ARM64 and MIPS64 on CentOS release 6.10
>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> Signed-off-by: Yash Shinde <yashinde145@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/rust.py          |   86 +
>  .../rust/files/rust-oe-selftest.patch         | 2120 +++++++++++++++++
>  meta/recipes-devtools/rust/rust-source.inc    |    1 +
>  meta/recipes-devtools/rust/rust_1.69.0.bb     |    7 +
>  4 files changed, 2214 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>  create mode 100644 meta/recipes-devtools/rust/files/rust-oe-selftest.pat=
ch

I did put this into a build for testing on the autobuilder. It hasn't
been running long and I can already see build failures such as:

https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6077
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7200
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7190
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2923
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/7200
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/7217
https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6080
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7146
https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/7184

and there will likely be more.

I'm finding this rather frustrating and am not sure how this was
tested.

Cheers,

Richard


--_000_SJ1PR11MB61294CC48FD3D027E729C03CEB4EASJ1PR11MB6129namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Richard,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">As discussed in the meeting, I =
am sharing the steps followed and host configurations used for the testing-=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Steps followed for testing-<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">1. Clone a fresh poky from $ gi=
t clone git://git.yoctoproject.org/poky<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">2. source the build environment=
 setup script<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">3. add the meta-selftest layer =
in conf/bblayers.conf<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">4. add SANITY_TESTED_DISTROS=3D=
&quot;&quot; to local.conf<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">5. Apply the testing patch chan=
ges-<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; a. Add&nbsp; meta/=
lib/oeqa/selftest/cases/rust.py file containing testing code<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; b. Add meta/recipe=
s-devtools/rust/files/rust-oe-selftest.patch to exclude failing cases.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; c. Add rust-oe-sel=
ftest.patch in meta/recipes-devtools/rust/rust-source.inc to apply on rust =
sources.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; d. Add &quot;do_te=
st_compile ()&quot; for testing rust sources in meta/recipes-devtools/rust/=
rust_1.69.0.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; e. Run the oe-self=
test via &quot;oe-selftest -r rust.RustSelfTestBase.test_check&quot; comman=
d.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Host configurations-<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Linux ala-lpggp3 5.15.0-56-gene=
ric #62-Ubuntu SMP Tue Nov 22 19:54:14 UTC 2022 x86_64 x86_64 x86_64 GNU/Li=
nux<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Architecture:&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x86_64<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; CPU op-mode(s):&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32-bit, 64-bit<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; Address sizes:&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 46 bits physical, 48 bits virtual<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; Byte Order:&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Little Endian<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU(s):&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 192<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; On-line CPU(s) list:&nbs=
p;&nbsp; 0-191<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Vendor ID:&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GenuineInte=
l<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; Model name:&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Intel(R) Xeon(R) CPU =
E7-8890 v4 @ 2.20GHz<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; CPU family:&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Model:&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 79<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Thread(s) pe=
r core:&nbsp; 2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Core(s) per =
socket:&nbsp; 24<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Socket(s):&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Stepping:&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; CPU max MHz:=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3400.0000<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; CPU min MHz:=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1200.0000<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; BogoMIPS:&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4399.78<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Flags:&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36=
 clflush dts acpi mmx fxsr sse sse2
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ss ht tm pbe syscall nx pdpe1gb=
 rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonst=
o&nbsp;&nbsp;&nbsp;&nbsp; p_tsc cpuid aperfmperf pni pclmulqdq dtes64 monit=
or ds_cpl vmx smx est tm2 ssse3
 sdbg fma cx16 xtpr pdcm pc&nbsp;&nbsp;&nbsp;&nbsp; id dca sse4_1 sse4_2 x2=
apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm =
3dnowpref&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;etch cpuid_fault epb cat_l3 cdp_l3 =
invpcid_single intel_ppin ssbd ibrs ibpb stibp tpr_shadow vnmi flexprior&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
 ity ept vpid ept_ad fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpc=
id rtm cqm rdt_a rdseed adx smap
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intel_pt xsaveopt cqm_llc cqm_o=
ccup_llc cqm_mbm_total cqm_mbm_local dtherm ida arat pln pts md_clear flush=
_l1d<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Packages installed-<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc (Ubuntu 11.3.0-1ubuntu1~22.=
04.1) 11.3.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">g++ (Ubuntu 11.3.0-1ubuntu1~22.=
04.1) 11.3.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Python 3.10.6<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rustc 1.69.0 (84c898d65 2023-04=
-16)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">BitBake Build Tool Core version=
 2.4.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">OpenSSL 3.0.2 15 Mar 2022 (Libr=
ary: OpenSSL 3.0.2 15 Mar 2022)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">OpenSSH_8.9p1 Ubuntu-3, OpenSSL=
 3.0.2 15 Mar 2022<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">accountsservice/jammy-security,=
jammy-updates,now 22.07.5-2ubuntu1.3 amd64 [installed]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">acl/jammy,now 2.3.1-1 amd64 [in=
stalled,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">adduser/jammy,jammy,now 3.118ub=
untu5 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">adwaita-icon-theme/jammy,jammy,=
now 41.0-1ubuntu1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">amd64-microcode/jammy,now 3.201=
91218.1ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">apache2-bin/jammy-security,now =
2.4.52-1ubuntu4.4 amd64 [installed,upgradable to: 2.4.52-1ubuntu4.5]<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">apache2-data/jammy-security,jam=
my-security,now 2.4.52-1ubuntu4.4 all [installed,upgradable to: 2.4.52-1ubu=
ntu4.5]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">apache2-utils/jammy-security,no=
w 2.4.52-1ubuntu4.4 amd64 [installed,upgradable to: 2.4.52-1ubuntu4.5]<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">apache2/jammy-security,now 2.4.=
52-1ubuntu4.4 amd64 [installed,upgradable to: 2.4.52-1ubuntu4.5]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">apparmor/now 3.0.4-2ubuntu2.1 a=
md64 [installed,upgradable to: 3.0.4-2ubuntu2.2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">apt-transport-https/now 2.4.8 a=
ll [installed,upgradable to: 2.4.9]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">apt-utils/now 2.4.8 amd64 [inst=
alled,upgradable to: 2.4.9]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">apt/now 2.4.8 amd64 [installed,=
upgradable to: 2.4.9]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">aptitude-common/jammy,jammy,now=
 0.8.13-3ubuntu1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">aptitude/jammy,now 0.8.13-3ubun=
tu1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">arping/jammy,now 2.22-1 amd64 [=
installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">autoconf/jammy,jammy,now 2.71-2=
 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">autofs/jammy-updates,now 5.1.8-=
1ubuntu1.2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">automake/jammy,jammy,now 1:1.16=
.5-1.3 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">autopoint/jammy,jammy,now 0.21-=
4ubuntu4 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">autotools-dev/jammy,jammy,now 2=
0220109.1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">base-files/now 12ubuntu4.2 amd6=
4 [installed,upgradable to: 12ubuntu4.3]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">base-passwd/jammy,now 3.5.52bui=
ld1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">bash-completion/jammy,jammy,now=
 1:2.11-5ubuntu1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">bash/jammy,now 5.1-6ubuntu1 amd=
64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">bc/jammy,now 1.07.1-3build1 amd=
64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">bind9-dnsutils/jammy-security,n=
ow 1:9.18.1-1ubuntu1.3 amd64 [installed,upgradable to: 1:9.18.12-0ubuntu0.2=
2.04.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">bind9-host/jammy-security,now 1=
:9.18.1-1ubuntu1.3 amd64 [installed,upgradable to: 1:9.18.12-0ubuntu0.22.04=
.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">bind9-libs/jammy-security,now 1=
:9.18.1-1ubuntu1.3 amd64 [installed,upgradable to: 1:9.18.12-0ubuntu0.22.04=
.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">binutils-common/jammy-security,=
jammy-updates,now 2.38-4ubuntu2.2 amd64 [installed,automatic]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">binutils-x86-64-linux-gnu/jammy=
-security,jammy-updates,now 2.38-4ubuntu2.2 amd64 [installed,automatic]<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">binutils/jammy-security,jammy-u=
pdates,now 2.38-4ubuntu2.2 amd64 [installed,automatic]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">bison/jammy,now 2:3.8.2+dfsg-1b=
uild1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">bsdextrautils/jammy,now 2.37.2-=
4ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">bsdmainutils/jammy,jammy,now 12=
.1.7+nmu3ubuntu2 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">bsdutils/jammy,now 1:2.37.2-4ub=
untu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">btrfs-progs/jammy,now 5.16.2-1 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">bubblewrap/jammy,now 0.6.1-1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">busybox-initramfs/jammy,now 1:1=
.30.1-7ubuntu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">busybox-static/jammy,now 1:1.30=
.1-7ubuntu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">byobu/jammy,jammy,now 5.133-1 a=
ll [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">bzip2/jammy,now 1.0.8-5build1 a=
md64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ca-certificates-java/jammy-secu=
rity,jammy-security,jammy-updates,jammy-updates,now 20190909ubuntu1.2 all [=
installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ca-certificates/jammy-security,=
jammy-security,jammy-updates,jammy-updates,now 20230311ubuntu0.22.04.1 all =
[installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cargo/jammy-security,jammy-upda=
tes,now 0.66.0+ds0ubuntu0.libgit2-0ubuntu0.22.04 amd64 [installed]<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cgroup-lite/jammy,jammy,now 1.1=
5 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cgroup-tools/jammy,now 2.0-2 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">choria/ubuntu,now 0.27.0+jammy =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">chrpath/jammy,now 0.16-2 amd64 =
[installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cmake-data/jammy-updates,jammy-=
updates,now 3.22.1-1ubuntu1.22.04.1 all [installed,automatic]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cmake/jammy-updates,now 3.22.1-=
1ubuntu1.22.04.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">command-not-found-data/now 18.0=
4.6 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">command-not-found/jammy,jammy,n=
ow 22.04.0 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">console-setup-linux/jammy,jammy=
,now 1.205ubuntu3 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">console-setup/jammy,jammy,now 1=
.205ubuntu3 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">containerd.io/jammy,now 1.6.13-=
1 amd64 [installed,upgradable to: 1.6.21-1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">coreutils/jammy,now 8.32-4.1ubu=
ntu1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cpio/jammy,now 2.13+dfsg-7 amd6=
4 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cpp-11/jammy-security,jammy-upd=
ates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cpp-7/now 7.5.0-6ubuntu2 amd64 =
[installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cpp-9/jammy-security,jammy-upda=
tes,now 9.5.0-1ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cpp/jammy,now 4:11.2.0-1ubuntu1=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cpulimit/jammy,now 2.7-2 amd64 =
[installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cron/jammy,now 3.0pl1-137ubuntu=
3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cscope/jammy,now 15.9-1 amd64 [=
installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">csh/jammy,now 20110502-7 amd64 =
[installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">curl/jammy-security,jammy-updat=
es,now 7.81.0-1ubuntu1.10 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dash/jammy,now 0.5.11+git202109=
03+057cd650a4ed-3build1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dbus-user-session/jammy-securit=
y,jammy-updates,now 1.12.20-2ubuntu4.1 amd64 [installed,automatic]<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dbus/jammy-security,jammy-updat=
es,now 1.12.20-2ubuntu4.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dconf-gsettings-backend/jammy,n=
ow 0.40.0-3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dconf-service/jammy,now 0.40.0-=
3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">debconf-i18n/jammy,jammy,now 1.=
5.79ubuntu1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">debconf/jammy,jammy,now 1.5.79u=
buntu1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">debianutils/jammy,now 5.5-1ubun=
tu2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">desktop-file-utils/jammy,now 0.=
26-1ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dh-elpa-helper/jammy,jammy,now =
2.0.9ubuntu1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dictionaries-common/jammy,jammy=
,now 1.28.14 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diffstat/jammy,now 1.64-1build2=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diffutils/jammy,now 1:3.8-0ubun=
tu2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dirmngr/jammy-security,jammy-up=
dates,now 2.2.27-3ubuntu2.1 amd64 [installed,automatic]<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">distro-info-data/now 0.52ubuntu=
0.2 all [installed,upgradable to: 0.52ubuntu0.4]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dmidecode/jammy-updates,now 3.3=
-3ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dmsetup/jammy,now 2:1.02.175-2.=
1ubuntu4 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dnsutils/jammy-security,jammy-s=
ecurity,now 1:9.18.1-1ubuntu1.3 all [installed,upgradable to: 1:9.18.12-0ub=
untu0.22.04.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">docker-ce-cli/jammy,now 5:20.10=
.22~3-0~ubuntu-jammy amd64 [installed,upgradable to: 5:24.0.2-1~ubuntu.22.0=
4~jammy]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">docker-ce/jammy,now 5:20.10.22~=
3-0~ubuntu-jammy amd64 [installed,upgradable to: 5:24.0.2-1~ubuntu.22.04~ja=
mmy]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dosfstools/jammy,now 4.2-1build=
3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dpkg-dev/jammy-security,jammy-s=
ecurity,now 1.21.1ubuntu2.1 all [installed,upgradable to: 1.21.1ubuntu2.2]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dpkg/jammy-security,now 1.21.1u=
buntu2.1 amd64 [installed,upgradable to: 1.21.1ubuntu2.2]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">e2fsprogs/jammy-security,jammy-=
updates,now 1.46.5-2ubuntu1.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ed/jammy,now 1.18-1 amd64 [inst=
alled]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">efibootmgr/jammy,now 17-1ubuntu=
2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">eject/jammy,now 2.37.2-4ubuntu3=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">emacs-bin-common/jammy,now 1:27=
.1+1-3ubuntu5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">emacs-common/jammy,jammy,now 1:=
27.1+1-3ubuntu5 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">emacs-gtk/jammy,now 1:27.1+1-3u=
buntu5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">emacs/jammy,jammy,now 1:27.1+1-=
3ubuntu5 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">emacsen-common/jammy,jammy,now =
3.0.4 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">evince-common/now 42.3-0ubuntu2=
 all [installed,upgradable to: 42.3-0ubuntu3]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">evince/now 42.3-0ubuntu2 amd64 =
[installed,upgradable to: 42.3-0ubuntu3]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">exo-utils/jammy,now 4.16.3-1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">expect/jammy,now 5.45.4-2build1=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">exuberant-ctags/jammy-security,=
jammy-updates,now 1:5.9~svn20110310-16ubuntu0.22.04.1 amd64 [installed]<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">fdisk/jammy,now 2.37.2-4ubuntu3=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">file/jammy,now 1:5.41-3 amd64 [=
installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">findutils/jammy,now 4.8.0-1ubun=
tu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">finger/jammy,now 0.17-17 amd64 =
[installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">flex/jammy,now 2.6.4-8build2 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">fontconfig-config/jammy,jammy,n=
ow 2.13.1-4.2ubuntu5 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">fontconfig/jammy,now 2.13.1-4.2=
ubuntu5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">fonts-dejavu-core/jammy,jammy,n=
ow 2.37-2build1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">fonts-urw-base35/jammy,jammy,no=
w 20200910-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">friendly-recovery/jammy,jammy,n=
ow 0.2.42 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ftp/jammy,jammy,now 20210827-4b=
uild1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">fuse3/jammy,now 3.10.5-1build1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">g++-11/jammy-security,jammy-upd=
ates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">g++/jammy,now 4:11.2.0-1ubuntu1=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gawk/jammy,now 1:5.1.0-1build3 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-11-base/jammy-security,jamm=
y-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-11-multilib/jammy-security,=
jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-11/jammy-security,jammy-upd=
ates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-12-base/jammy-security,jamm=
y-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-12-base/jammy-security,jamm=
y-updates,now 12.1.0-2ubuntu1~22.04 i386 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-7-base/now 7.5.0-6ubuntu2 a=
md64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-7-multilib/now 7.5.0-6ubunt=
u2 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-7/now 7.5.0-6ubuntu2 amd64 =
[installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-8-base/now 8.4.0-3ubuntu2 a=
md64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-9-base/jammy-security,jammy=
-updates,now 9.5.0-1ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-9-multilib/jammy-security,j=
ammy-updates,now 9.5.0-1ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-9/jammy-security,jammy-upda=
tes,now 9.5.0-1ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc-multilib/jammy,now 4:11.2.0=
-1ubuntu1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gcc/jammy,now 4:11.2.0-1ubuntu1=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gdb/jammy-updates,now 12.1-0ubu=
ntu1~22.04 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gedit-common/jammy,jammy,now 41=
.0-3 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gedit/jammy,now 41.0-3 amd64 [i=
nstalled]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">geoip-database/jammy,jammy,now =
20191224-3 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gettext-base/jammy,now 0.21-4ub=
untu4 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gettext/jammy,now 0.21-4ubuntu4=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gh/jammy,now 2.4.0+dfsg1-2 amd6=
4 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gir1.2-atk-1.0/jammy,now 2.36.0=
-3build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gir1.2-freedesktop/jammy,now 1.=
72.0-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gir1.2-gdkpixbuf-2.0/jammy-upda=
tes,now 2.42.8+dfsg-1ubuntu0.2 amd64 [installed,automatic]<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gir1.2-glib-2.0/jammy,now 1.72.=
0-1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gir1.2-gtk-3.0/jammy-updates,no=
w 3.24.33-1ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gir1.2-gtksource-3.0/jammy,now =
3.24.11-2build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gir1.2-gtksource-4/jammy,now 4.=
8.3-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gir1.2-harfbuzz-0.0/jammy-secur=
ity,jammy-updates,now 2.7.4-1ubuntu3.1 amd64 [installed,automatic]<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gir1.2-pango-1.0/jammy,now 1.50=
.6+ds-2 amd64 [installed,upgradable to: 1.50.6+ds-2ubuntu1]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gir1.2-peas-1.0/jammy,now 1.32.=
0-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">git-email/now 1:2.39.0-0ppa1~ub=
untu22.04.1 all [installed,upgradable to: 1:2.40.1-0ppa1~ubuntu22.04.1]<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">git-man/now 1:2.39.0-0ppa1~ubun=
tu22.04.1 all [installed,upgradable to: 1:2.40.1-0ppa1~ubuntu22.04.1]<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">git-review/jammy,jammy,now 2.2.=
0-1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">git/now 1:2.39.0-0ppa1~ubuntu22=
.04.1 amd64 [installed,upgradable to: 1:2.40.1-0ppa1~ubuntu22.04.1]<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gnome-desktop3-data/jammy-updat=
es,jammy-updates,now 42.5-0ubuntu1 all [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gnome-terminal-data/jammy,jammy=
,now 3.44.0-1ubuntu1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gnome-terminal/jammy,now 3.44.0=
-1ubuntu1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gnupg-l10n/jammy-security,jammy=
-security,jammy-updates,jammy-updates,now 2.2.27-3ubuntu2.1 all [installed,=
automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gnupg-utils/jammy-security,jamm=
y-updates,now 2.2.27-3ubuntu2.1 amd64 [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gnupg/jammy-security,jammy-secu=
rity,jammy-updates,jammy-updates,now 2.2.27-3ubuntu2.1 all [installed]<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gpg-agent/jammy-security,jammy-=
updates,now 2.2.27-3ubuntu2.1 amd64 [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gpg-wks-client/jammy-security,j=
ammy-updates,now 2.2.27-3ubuntu2.1 amd64 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gpg-wks-server/jammy-security,j=
ammy-updates,now 2.2.27-3ubuntu2.1 amd64 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gpg/jammy-security,jammy-update=
s,now 2.2.27-3ubuntu2.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gpgconf/jammy-security,jammy-up=
dates,now 2.2.27-3ubuntu2.1 amd64 [installed,automatic]<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gpgsm/jammy-security,jammy-upda=
tes,now 2.2.27-3ubuntu2.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gpgv/jammy-security,jammy-updat=
es,now 2.2.27-3ubuntu2.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">grep/jammy,now 3.7-1build1 amd6=
4 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">groff-base/jammy,now 1.22.4-8bu=
ild1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">groff/jammy,now 1.22.4-8build1 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">grub-common/jammy,now 2.06-2ubu=
ntu7 amd64 [installed,upgradable to: 2.06-2ubuntu7.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">grub-efi-amd64-bin/jammy-securi=
ty,now 2.06-2ubuntu10 amd64 [installed,upgradable to: 2.06-2ubuntu14.1]<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">grub-efi-amd64-signed/jammy-sec=
urity,now 1.182~22.04.1+2.06-2ubuntu10 amd64 [installed,upgradable to: 1.18=
7.3~22.04.1+2.06-2ubuntu14.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">grub-efi-amd64/jammy-security,n=
ow 2.06-2ubuntu10 amd64 [installed,upgradable to: 2.06-2ubuntu14.1]<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">grub2-common/jammy,now 2.06-2ub=
untu7 amd64 [installed,upgradable to: 2.06-2ubuntu7.1]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gsettings-desktop-schemas/jammy=
,jammy,now 42.0-1ubuntu1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gstreamer1.0-plugins-base/jammy=
,now 1.20.1-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gtk-update-icon-cache/jammy-upd=
ates,now 3.24.33-1ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">gzip/jammy-updates,now 1.10-4ub=
untu4.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">haveged/jammy,now 1.9.14-1ubunt=
u1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">hdparm/jammy,now 9.60+ds-1build=
3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">help2man/jammy,now 1.49.1 amd64=
 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">hicolor-icon-theme/jammy,jammy,=
now 0.17-2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">hostname/jammy,now 3.23ubuntu2 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">htop/jammy,now 3.0.5-7build2 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">humanity-icon-theme/jammy,jammy=
,now 0.6.16 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">hyperfine/jammy-security,jammy-=
updates,now 1.12.0-3ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">iamerican/jammy,jammy,now 3.4.0=
2-2 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ienglish-common/jammy,jammy,now=
 3.4.02-2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ifupdown/jammy,now 0.8.36+nmu1u=
buntu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">info/jammy,now 6.8-4build1 amd6=
4 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">init-system-helpers/jammy,jammy=
,now 1.62 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">init/jammy,now 1.62 amd64 [inst=
alled]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">initramfs-tools-bin/jammy-updat=
es,now 0.140ubuntu13.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">initramfs-tools-core/jammy-upda=
tes,jammy-updates,now 0.140ubuntu13.1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">initramfs-tools/jammy-updates,j=
ammy-updates,now 0.140ubuntu13.1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">install-info/jammy,now 6.8-4bui=
ld1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">installation-report/now 2.62ubu=
ntu1 all [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">intel-microcode/jammy-security,=
jammy-updates,now 3.20230214.0ubuntu0.22.04.1 amd64 [installed,automatic]<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">iotop/jammy,now 0.6-24-g733f3f8=
-1.1build2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">iperf3/jammy,now 3.9-1build1 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">iproute2/jammy,now 5.15.0-1ubun=
tu2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">iptables-persistent/jammy,jammy=
,now 1.0.16 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">iptables/jammy,now 1.8.7-1ubunt=
u5 amd64 [installed,upgradable to: 1.8.7-1ubuntu5.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">iputils-ping/jammy,now 3:202112=
15-1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">iputils-tracepath/jammy,now 3:2=
0211215-1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ipxe-qemu-256k-compat-efi-roms/=
jammy,jammy,now 1.0.0+git-20150424.a25a16d-0ubuntu4 all [installed,automati=
c]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ipxe-qemu/jammy,jammy,now 1.21.=
1+git-20220113.fbbdc3926-0ubuntu1 all [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">irqbalance/jammy,now 1.8.0-1bui=
ld1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">isc-dhcp-client/jammy-security,=
now 4.4.1-2.3ubuntu2.3 amd64 [installed,upgradable to: 4.4.1-2.3ubuntu2.4]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">isc-dhcp-common/jammy-security,=
now 4.4.1-2.3ubuntu2.3 amd64 [installed,upgradable to: 4.4.1-2.3ubuntu2.4]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">iso-codes/jammy,jammy,now 4.9.0=
-1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ispell/jammy,now 3.4.02-2 amd64=
 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">iucode-tool/jammy,now 2.3.1-1bu=
ild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">iw/jammy,now 5.16-1build1 amd64=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">java-common/jammy,jammy,now 0.7=
2build2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">jq/jammy,now 1.6-2.1ubuntu3 amd=
64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">kbd/jammy,now 2.3.0-3ubuntu4 am=
d64 [installed,upgradable to: 2.3.0-3ubuntu4.22.04]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">keyboard-configuration/jammy,ja=
mmy,now 1.205ubuntu3 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">keyutils/jammy,now 1.6.1-2ubunt=
u3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">klibc-utils/jammy,now 2.0.10-4 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">kmod/jammy,now 29-1ubuntu1 amd6=
4 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">krb5-locales/jammy-security,jam=
my-security,now 1.19.2-2ubuntu0.1 all [installed,upgradable to: 1.19.2-2ubu=
ntu0.2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">language-pack-en-base/now 1:22.=
04+20220721 all [installed,upgradable to: 1:22.04+20230209]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">language-pack-en/now 1:22.04+20=
220721 all [installed,upgradable to: 1:22.04+20230209]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">language-pack-gnome-en-base/now=
 1:22.04+20220721 all [installed,upgradable to: 1:22.04+20230209]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">language-pack-gnome-en/now 1:22=
.04+20220721 all [installed,upgradable to: 1:22.04+20230209]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">language-selector-common/jammy,=
jammy,now 0.219 all [installed,upgradable to: 0.219.1]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">laptop-detect/jammy,jammy,now 0=
.16 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ldap-utils/now 2.5.13+dfsg-0ubu=
ntu0.22.04.1 amd64 [installed,upgradable to: 2.5.14+dfsg-0ubuntu0.22.04.2]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">less/jammy-security,jammy-updat=
es,now 590-1ubuntu0.22.04.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32asan4/now 7.5.0-6ubuntu2 a=
md64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32asan5/jammy-security,jammy=
-updates,now 9.5.0-1ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32asan6/jammy-security,jammy=
-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32atomic1/jammy-security,jam=
my-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32cilkrts5/now 7.5.0-6ubuntu=
2 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32gcc-11-dev/jammy-security,=
jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32gcc-7-dev/now 7.5.0-6ubunt=
u2 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32gcc-9-dev/jammy-security,j=
ammy-updates,now 9.5.0-1ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32gcc-s1/jammy-security,jamm=
y-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32gomp1/jammy-security,jammy=
-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32itm1/jammy-security,jammy-=
updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32mpx2/now 8.4.0-3ubuntu2 am=
d64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32quadmath0/jammy-security,j=
ammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32stdc++6/jammy-security,jam=
my-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32ubsan0/now 7.5.0-6ubuntu2 =
amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lib32ubsan1/jammy-security,jamm=
y-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libaccountsservice0/jammy-secur=
ity,jammy-updates,now 22.07.5-2ubuntu1.3 amd64 [installed]<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libacl1/jammy,now 2.3.1-1 amd64=
 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libaio1/jammy,now 0.3.112-13bui=
ld1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libapparmor1/now 3.0.4-2ubuntu2=
.1 amd64 [installed,upgradable to: 3.0.4-2ubuntu2.2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libapr1/jammy-security,jammy-up=
dates,now 1.7.0-8ubuntu0.22.04.1 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libaprutil1-dbd-sqlite3/jammy-s=
ecurity,jammy-updates,now 1.6.1-5ubuntu4.22.04.1 amd64 [installed,automatic=
]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libaprutil1-ldap/jammy-security=
,jammy-updates,now 1.6.1-5ubuntu4.22.04.1 amd64 [installed,automatic]<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libaprutil1/jammy-security,jamm=
y-updates,now 1.6.1-5ubuntu4.22.04.1 amd64 [installed,automatic]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libapt-pkg6.0/now 2.4.8 amd64 [=
installed,upgradable to: 2.4.9]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libarchive13/jammy,now 3.6.0-1u=
buntu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libargon2-0/jammy,now 0~2017122=
7-0.3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libargon2-1/jammy,now 0~2017122=
7-0.3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libasan4/now 7.5.0-6ubuntu2 amd=
64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libasan5/jammy-security,jammy-u=
pdates,now 9.5.0-1ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libasan6/jammy-security,jammy-u=
pdates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libasound2-data/jammy,jammy,now=
 1.2.6.1-1ubuntu1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libasound2-dev/jammy,now 1.2.6.=
1-1ubuntu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libasound2/jammy,now 1.2.6.1-1u=
buntu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libaspell15/jammy,now 0.60.8-4b=
uild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libassuan0/jammy,now 2.5.5-1bui=
ld1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libasyncns0/jammy,now 0.8-6buil=
d2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libatk-bridge2.0-0/jammy,now 2.=
38.0-3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libatk1.0-0/jammy,now 2.36.0-3b=
uild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libatk1.0-0/jammy,now 2.36.0-3b=
uild1 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libatk1.0-data/jammy,jammy,now =
2.36.0-3build1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libatm1/jammy,now 1:2.5.1-4buil=
d2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libatomic1/jammy-security,jammy=
-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libatspi2.0-0/jammy,now 2.44.0-=
3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libattr1/jammy,now 1:2.5.1-1bui=
ld1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libaudit-common/jammy,jammy,now=
 1:3.0.7-1build1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libaudit1/jammy,now 1:3.0.7-1bu=
ild1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libauthen-sasl-perl/jammy,jammy=
,now 2.1600-1.1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libavahi-client3/jammy,now 0.8-=
5ubuntu5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libavahi-client3/jammy,now 0.8-=
5ubuntu5 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libavahi-common-data/jammy,now =
0.8-5ubuntu5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libavahi-common-data/jammy,now =
0.8-5ubuntu5 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libavahi-common3/jammy,now 0.8-=
5ubuntu5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libavahi-common3/jammy,now 0.8-=
5ubuntu5 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libbabeltrace1/jammy,now 1.5.8-=
2build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libbind9-160/now 1:9.11.3+dfsg-=
1ubuntu1.18 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libbinutils/jammy-security,jamm=
y-updates,now 2.38-4ubuntu2.2 amd64 [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libblas3/jammy,now 3.10.0-2ubun=
tu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libblkid-dev/jammy,now 2.37.2-4=
ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libblkid1/jammy,now 2.37.2-4ubu=
ntu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libblkid1/jammy,now 2.37.2-4ubu=
ntu3 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libboost-iostreams1.74.0/jammy,=
now 1.74.0-14ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libboost-locale1.74.0/jammy,now=
 1.74.0-14ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libboost-regex1.74.0/jammy,now =
1.74.0-14ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libboost-thread1.74.0/jammy,now=
 1.74.0-14ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libbpf0/jammy-security,jammy-up=
dates,now 1:0.5.0-1ubuntu22.04.1 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libbrlapi0.8/jammy-updates,now =
6.4-4ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libbrotli1/jammy,now 1.0.9-2bui=
ld6 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libbrotli1/jammy,now 1.0.9-2bui=
ld6 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libbsd0/jammy,now 0.11.5-1 amd6=
4 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libbsd0/jammy,now 0.11.5-1 i386=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libbz2-1.0/jammy,now 1.0.8-5bui=
ld1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libc-bin/jammy-updates,now 2.35=
-0ubuntu3.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libc-dev-bin/jammy-updates,now =
2.35-0ubuntu3.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libc6-dev-i386/jammy-updates,no=
w 2.35-0ubuntu3.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libc6-dev-x32/jammy-updates,now=
 2.35-0ubuntu3.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libc6-dev/jammy-updates,now 2.3=
5-0ubuntu3.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libc6-i386/jammy-updates,now 2.=
35-0ubuntu3.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libc6-x32/jammy-updates,now 2.3=
5-0ubuntu3.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libc6/jammy-updates,now 2.35-0u=
buntu3.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libc6/jammy-updates,now 2.35-0u=
buntu3.1 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcaca-dev/jammy,now 0.99.beta=
19-2.2ubuntu4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcaca0/jammy,now 0.99.beta19-=
2.2ubuntu4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcacard0/jammy,now 1:2.8.0-3b=
uild2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcairo-gobject2/jammy,now 1.1=
6.0-5ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcairo2/jammy,now 1.16.0-5ubu=
ntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcairo2/jammy,now 1.16.0-5ubu=
ntu2 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcap-ng0/jammy,now 0.7.9-2.2b=
uild3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcap2-bin/jammy,now 1:2.44-1b=
uild3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcap2/jammy,now 1:2.44-1build=
3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcap2/jammy,now 1:2.44-1build=
3 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcapture-tiny-perl/jammy,jamm=
y,now 0.48-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcbor0.8/jammy,now 0.8.0-2ubu=
ntu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcc1-0/jammy-security,jammy-u=
pdates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcdparanoia0/jammy,now 3.10.2=
+debian-14build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcgroup1/jammy,now 2.0-2 amd6=
4 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcilkrts5/now 7.5.0-6ubuntu2 =
amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcolord2/jammy,now 1.4.6-1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcom-err2/jammy-security,jamm=
y-updates,now 1.46.5-2ubuntu1.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcom-err2/jammy-security,jamm=
y-updates,now 1.46.5-2ubuntu1.1 i386 [installed,automatic]<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcompfaceg1/jammy,now 1:1.5.2=
-5.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libconfig-dev/jammy,now 1.5-0.4=
build1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libconfig-simple-perl/jammy,jam=
my,now 4.59-6.1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libconfig9/jammy,now 1.5-0.4bui=
ld1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcrypt-dev/jammy,now 1:4.4.27=
-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcrypt1/jammy,now 1:4.4.27-1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcrypt1/jammy,now 1:4.4.27-1 =
i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcryptsetup12/jammy-updates,n=
ow 2:2.4.3-1ubuntu1.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libctf-nobfd0/jammy-security,ja=
mmy-updates,now 2.38-4ubuntu2.2 amd64 [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libctf0/jammy-security,jammy-up=
dates,now 2.38-4ubuntu2.2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcups2/jammy-security,jammy-u=
pdates,now 2.4.1op1-1ubuntu4.1 amd64 [installed,automatic]<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcups2/jammy-security,jammy-u=
pdates,now 2.4.1op1-1ubuntu4.1 i386 [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcurl3-gnutls/jammy-security,=
jammy-updates,now 7.81.0-1ubuntu1.10 amd64 [installed,automatic]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcurl4-openssl-dev/jammy-secu=
rity,jammy-updates,now 7.81.0-1ubuntu1.10 amd64 [installed]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcurl4/jammy-security,jammy-u=
pdates,now 7.81.0-1ubuntu1.10 amd64 [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libcwidget4/jammy,now 0.5.18-5b=
uild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdatrie1/jammy,now 0.2.13-2 a=
md64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdatrie1/jammy,now 0.2.13-2 i=
386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdaxctl1/jammy,now 72.1-1 amd=
64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdb5.3/jammy,now 5.3.28+dfsg1=
-0.8ubuntu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdbd-pg-perl/jammy,now 3.15.1=
-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdbd-sqlite3-perl/jammy,now 1=
.70-3build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdbi-perl/jammy,now 1.643-3bu=
ild3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdbus-1-3/jammy-security,jamm=
y-updates,now 1.12.20-2ubuntu4.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdbus-1-3/jammy-security,jamm=
y-updates,now 1.12.20-2ubuntu4.1 i386 [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdbusmenu-glib4/jammy,now 16.=
04.1+18.10.20180917-0ubuntu8 amd64 [installed,automatic]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdbusmenu-gtk3-4/jammy,now 16=
.04.1+18.10.20180917-0ubuntu8 amd64 [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdconf1/jammy,now 0.40.0-3 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdebconfclient0/jammy,now 0.2=
61ubuntu1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdebuginfod-common/jammy,jamm=
y,now 0.186-1build1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdebuginfod1/jammy,now 0.186-=
1build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdeflate0/jammy,now 1.10-2 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdeflate0/jammy,now 1.10-2 i3=
86 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdevmapper1.02.1/jammy,now 2:=
1.02.175-2.1ubuntu4 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdjvulibre-text/jammy,jammy,n=
ow 3.5.28-2build2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdjvulibre21/jammy,now 3.5.28=
-2build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdns-export1100/now 1:9.11.3+=
dfsg-1ubuntu1.18 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdns-export1110/jammy,now 1:9=
.11.19+dfsg-2.1ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdns1100/now 1:9.11.3+dfsg-1u=
buntu1.18 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdpkg-perl/jammy-security,jam=
my-security,now 1.21.1ubuntu2.1 all [installed,upgradable to: 1.21.1ubuntu2=
.2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdrm-amdgpu1/jammy,now 2.4.11=
0-1ubuntu1 amd64 [installed,upgradable to: 2.4.113-2~ubuntu0.22.04.1]<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdrm-common/jammy,jammy,now 2=
.4.110-1ubuntu1 all [installed,upgradable to: 2.4.113-2~ubuntu0.22.04.1]<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdrm-nouveau2/jammy,now 2.4.1=
10-1ubuntu1 amd64 [installed,upgradable to: 2.4.113-2~ubuntu0.22.04.1]<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdrm-radeon1/jammy,now 2.4.11=
0-1ubuntu1 amd64 [installed,upgradable to: 2.4.113-2~ubuntu0.22.04.1]<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdrm2/jammy,now 2.4.110-1ubun=
tu1 amd64 [installed,upgradable to: 2.4.113-2~ubuntu0.22.04.1]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libdw1/jammy,now 0.186-1build1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libedit2/jammy,now 3.1-20210910=
-1build1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libefiboot1/jammy,now 37-6ubunt=
u2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libefivar1/jammy,now 37-6ubuntu=
2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libegl-dev/jammy,now 1.4.0-1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libegl-mesa0/now 22.0.5-0ubuntu=
0.1 amd64 [installed,upgradable to: 22.2.5-0ubuntu0.1~22.04.1]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libegl1/jammy,now 1.4.0-1 amd64=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libelf-dev/jammy,now 0.186-1bui=
ld1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libelf1/jammy,now 0.186-1build1=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libenchant-2-2/jammy,now 2.3.2-=
1ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libepoxy0/jammy,now 1.5.10-1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liberror-perl/jammy,jammy,now 0=
.17029-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libestr0/jammy,now 0.1.10-2.1bu=
ild3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libevdocument3-4/now 42.3-0ubun=
tu2 amd64 [installed,upgradable to: 42.3-0ubuntu3]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libevent-core-2.1-7/jammy,now 2=
.1.12-stable-1build3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libevview3-3/now 42.3-0ubuntu2 =
amd64 [installed,upgradable to: 42.3-0ubuntu3]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libexif12/jammy,now 0.6.24-1bui=
ld1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libexo-2-0/jammy,now 4.16.3-1 a=
md64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libexo-common/jammy,jammy,now 4=
.16.3-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libexpat1-dev/jammy-security,ja=
mmy-updates,now 2.4.7-1ubuntu0.2 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libexpat1/jammy-security,jammy-=
updates,now 2.4.7-1ubuntu0.2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libexpat1/jammy-security,jammy-=
updates,now 2.4.7-1ubuntu0.2 i386 [installed,automatic]<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libext2fs2/jammy-security,jammy=
-updates,now 1.46.5-2ubuntu1.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfastjson4/jammy,now 0.99.9-1=
build2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfdisk1/jammy,now 2.37.2-4ubu=
ntu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfdt1/jammy,now 1.6.1-1 amd64=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libffi-dev/jammy,now 3.4.2-4 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libffi6/now 3.2.1-8 amd64 [inst=
alled,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libffi7/jammy,now 3.3-5ubuntu1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libffi8/jammy,now 3.4.2-4 amd64=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libffi8/jammy,now 3.4.2-4 i386 =
[installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfido2-1/jammy,now 1.10.0-1 a=
md64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfile-basedir-perl/jammy,jamm=
y,now 0.09-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfile-which-perl/jammy,jammy,=
now 1.23-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libflac8/jammy-security,jammy-u=
pdates,now 1.3.3-2ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfontconfig1/jammy,now 2.13.1=
-4.2ubuntu5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfontconfig1/jammy,now 2.13.1=
-4.2ubuntu5 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfontenc1/jammy,now 1:1.1.4-1=
build3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfreetype6/jammy-security,jam=
my-updates,now 2.11.1+dfsg-1ubuntu0.2 amd64 [installed,automatic]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfreetype6/jammy-security,jam=
my-updates,now 2.11.1+dfsg-1ubuntu0.2 i386 [installed,automatic]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfribidi0/jammy-security,jamm=
y-updates,now 1.0.8-2ubuntu3.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfribidi0/jammy-security,jamm=
y-updates,now 1.0.8-2ubuntu3.1 i386 [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfuse2/jammy,now 2.9.9-5ubunt=
u3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libfuse3-3/jammy,now 3.10.5-1bu=
ild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgarcon-1-0/jammy,now 4.16.1-=
1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgarcon-common/jammy,jammy,no=
w 4.16.1-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgarcon-gtk3-1-0/jammy,now 4.=
16.1-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgbm1/now 22.0.5-0ubuntu0.1 a=
md64 [installed,upgradable to: 22.2.5-0ubuntu0.1~22.04.1]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgc1/jammy,now 1:8.0.6-1.1bui=
ld1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgcc-11-dev/jammy-security,ja=
mmy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgcc-7-dev/now 7.5.0-6ubuntu2=
 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgcc-9-dev/jammy-security,jam=
my-updates,now 9.5.0-1ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgcc-s1/jammy-security,jammy-=
updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgcc-s1/jammy-security,jammy-=
updates,now 12.1.0-2ubuntu1~22.04 i386 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgcrypt20/jammy,now 1.9.4-3ub=
untu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgcrypt20/jammy,now 1.9.4-3ub=
untu3 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgd3/jammy,now 2.3.0-2ubuntu2=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgdbm-compat4/jammy,now 1.23-=
1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgdbm5/now 1.14.1-6 amd64 [in=
stalled,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgdbm6/jammy,now 1.23-1 amd64=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgdk-pixbuf-2.0-0/jammy-updat=
es,now 2.42.8+dfsg-1ubuntu0.2 amd64 [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgdk-pixbuf-2.0-0/jammy-updat=
es,now 2.42.8+dfsg-1ubuntu0.2 i386 [installed,automatic]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgdk-pixbuf-xlib-2.0-0/jammy,=
now 2.40.2-2build4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgdk-pixbuf2.0-0/jammy,now 2.=
40.2-2build4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgdk-pixbuf2.0-common/jammy-u=
pdates,jammy-updates,now 2.42.8+dfsg-1ubuntu0.2 all [installed,automatic]<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgeoip1/jammy,now 1.6.12-8 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgfapi0/jammy,now 10.1-1 amd6=
4 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgfortran5/jammy-security,jam=
my-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgfrpc0/jammy,now 10.1-1 amd6=
4 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgfxdr0/jammy,now 10.1-1 amd6=
4 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgif7/jammy,now 5.1.9-2build2=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgirepository-1.0-1/jammy,now=
 1.72.0-1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgl-dev/jammy,now 1.4.0-1 amd=
64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgl1-mesa-dev/now 22.0.5-0ubu=
ntu0.1 amd64 [installed,upgradable to: 22.2.5-0ubuntu0.1~22.04.1]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgl1-mesa-dri/now 22.0.5-0ubu=
ntu0.1 amd64 [installed,upgradable to: 22.2.5-0ubuntu0.1~22.04.1]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgl1/jammy,now 1.4.0-1 amd64 =
[installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglapi-mesa/now 22.0.5-0ubunt=
u0.1 amd64 [installed,upgradable to: 22.2.5-0ubuntu0.1~22.04.1]<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgles-dev/jammy,now 1.4.0-1 a=
md64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgles1/jammy,now 1.4.0-1 amd6=
4 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgles2/jammy,now 1.4.0-1 amd6=
4 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglib2.0-0/now 2.72.4-0ubuntu=
1 amd64 [installed,upgradable to: 2.72.4-0ubuntu2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglib2.0-0/now 2.72.4-0ubuntu=
1 i386 [installed,upgradable to: 2.72.4-0ubuntu2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglib2.0-bin/now 2.72.4-0ubun=
tu1 amd64 [installed,upgradable to: 2.72.4-0ubuntu2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglib2.0-data/now 2.72.4-0ubu=
ntu1 all [installed,upgradable to: 2.72.4-0ubuntu2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglib2.0-dev-bin/now 2.72.4-0=
ubuntu1 amd64 [installed,upgradable to: 2.72.4-0ubuntu2]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglib2.0-dev/now 2.72.4-0ubun=
tu1 amd64 [installed,upgradable to: 2.72.4-0ubuntu2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglu1-mesa-dev/jammy,now 9.0.=
2-1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglu1-mesa/jammy,now 9.0.2-1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglusterfs0/jammy,now 10.1-1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglvnd-core-dev/jammy,now 1.4=
.0-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglvnd-dev/jammy,now 1.4.0-1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglvnd0/jammy,now 1.4.0-1 amd=
64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglx-dev/jammy,now 1.4.0-1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglx-mesa0/now 22.0.5-0ubuntu=
0.1 amd64 [installed,upgradable to: 22.2.5-0ubuntu0.1~22.04.1]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libglx0/jammy,now 1.4.0-1 amd64=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgmp10/jammy,now 2:6.2.1+dfsg=
-3ubuntu1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgmp10/jammy,now 2:6.2.1+dfsg=
-3ubuntu1 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgnome-desktop-3-19/jammy-upd=
ates,now 42.5-0ubuntu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgnutls30/jammy-security,jamm=
y-updates,now 3.7.3-4ubuntu1.2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgnutls30/jammy-security,jamm=
y-updates,now 3.7.3-4ubuntu1.2 i386 [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgomp1/jammy-security,jammy-u=
pdates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgpg-error0/jammy,now 1.43-3 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgpg-error0/jammy,now 1.43-3 =
i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgpgme11/jammy,now 1.16.0-1.2=
ubuntu4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgpm2/jammy,now 1.20.7-10buil=
d1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgraphite2-3/jammy,now 1.3.14=
-1build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgraphite2-3/jammy,now 1.3.14=
-1build2 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgs9-common/jammy-security,ja=
mmy-security,jammy-updates,jammy-updates,now 9.55.0~dfsg1-0ubuntu5.2 all [i=
nstalled,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgs9/jammy-security,jammy-upd=
ates,now 9.55.0~dfsg1-0ubuntu5.2 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgspell-1-2/jammy,now 1.9.1-4=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgspell-1-common/jammy,jammy,=
now 1.9.1-4 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgssapi-krb5-2/jammy-security=
,now 1.19.2-2ubuntu0.1 amd64 [installed,upgradable to: 1.19.2-2ubuntu0.2]<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgssapi-krb5-2/jammy-security=
,now 1.19.2-2ubuntu0.1 i386 [installed,upgradable to: 1.19.2-2ubuntu0.2]<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgstreamer-plugins-base1.0-0/=
jammy,now 1.20.1-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgstreamer1.0-0/jammy-updates=
,now 1.20.3-0ubuntu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgtk-3-0/jammy-updates,now 3.=
24.33-1ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgtk-3-common/jammy-updates,j=
ammy-updates,now 3.24.33-1ubuntu2 all [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgtk2.0-0/jammy,now 2.24.33-2=
ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgtk2.0-0/jammy,now 2.24.33-2=
ubuntu2 i386 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgtk2.0-common/jammy,jammy,no=
w 2.24.33-2ubuntu2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgtksourceview-3.0-1/jammy,no=
w 3.24.11-2build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgtksourceview-3.0-common/jam=
my,jammy,now 3.24.11-2build1 all [installed,automatic]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgtksourceview-4-0/jammy,now =
4.8.3-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgtksourceview-4-common/jammy=
,jammy,now 4.8.3-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgtop-2.0-11/jammy,now 2.40.0=
-2build3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgtop2-common/jammy,jammy,now=
 2.40.0-2build3 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgudev-1.0-0/jammy,now 1:237-=
2build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libgxps2/jammy,now 0.3.2-2 amd6=
4 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libhandy-1-0/jammy,now 1.6.1-1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libharfbuzz0b/jammy-security,ja=
mmy-updates,now 2.7.4-1ubuntu3.1 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libharfbuzz0b/jammy-security,ja=
mmy-updates,now 2.7.4-1ubuntu3.1 i386 [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libhavege2/jammy,now 1.9.14-1ub=
untu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libhogweed4/now 3.4.1-0ubuntu0.=
18.04.1 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libhogweed6/jammy,now 3.7.3-1bu=
ild2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libhogweed6/jammy,now 3.7.3-1bu=
ild2 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libhunspell-1.7-0/jammy,now 1.7=
.0-4build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libibverbs1/jammy,now 39.0-1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libice6/jammy,now 2:1.0.10-1bui=
ld2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libicu60/now 60.2-3ubuntu3.2 am=
d64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libicu70/jammy,now 70.1-2 amd64=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libidn11/now 1.33-2.2ubuntu2 am=
d64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libidn12/jammy,now 1.38-4build1=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libidn2-0/jammy,now 2.3.2-2buil=
d1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libidn2-0/jammy,now 2.3.2-2buil=
d1 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libijs-0.35/jammy,now 0.35-15bu=
ild2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libinih1/jammy,now 53-1ubuntu3 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libio-socket-ssl-perl/jammy,jam=
my,now 2.074-2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libip4tc0/now 1.6.1-2ubuntu2 am=
d64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libip4tc2/jammy,now 1.8.7-1ubun=
tu5 amd64 [installed,upgradable to: 1.8.7-1ubuntu5.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libip6tc0/now 1.6.1-2ubuntu2 am=
d64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libip6tc2/jammy,now 1.8.7-1ubun=
tu5 amd64 [installed,upgradable to: 1.8.7-1ubuntu5.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libipc-system-simple-perl/jammy=
,jammy,now 1.30-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libiperf0/jammy,now 3.9-1build1=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libipt2/jammy,now 2.0.5-1 amd64=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libiptc0/jammy,now 1.8.7-1ubunt=
u5 amd64 [installed,upgradable to: 1.8.7-1ubuntu5.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libirs160/now 1:9.11.3+dfsg-1ub=
untu1.18 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libisc-export1105/jammy,now 1:9=
.11.19+dfsg-2.1ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libisc-export169/now 1:9.11.3+d=
fsg-1ubuntu1.18 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libisc169/now 1:9.11.3+dfsg-1ub=
untu1.18 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libisccc160/now 1:9.11.3+dfsg-1=
ubuntu1.18 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libisccfg160/now 1:9.11.3+dfsg-=
1ubuntu1.18 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libiscsi7/jammy,now 1.19.0-3bui=
ld2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libisl22/now 0.22.1-1 amd64 [in=
stalled,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libisl23/jammy,now 0.24-2build1=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libitm1/jammy-security,jammy-up=
dates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjansson4/jammy,now 2.13.1-1.=
1build3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjbig0/jammy-security,jammy-u=
pdates,now 2.1-3.1ubuntu0.22.04.1 amd64 [installed,automatic]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjbig0/jammy-security,jammy-u=
pdates,now 2.1-3.1ubuntu0.22.04.1 i386 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjbig2dec0/jammy,now 0.19-3bu=
ild2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjpeg-turbo8/jammy,now 2.1.2-=
0ubuntu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjpeg-turbo8/jammy,now 2.1.2-=
0ubuntu1 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjpeg8/jammy,now 8c-2ubuntu10=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjpeg8/jammy,now 8c-2ubuntu10=
 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjq1/jammy,now 1.6-2.1ubuntu3=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjs-jquery/jammy,jammy,now 3.=
6.0+dfsg+~3.5.13-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjs-sphinxdoc/jammy,jammy,now=
 4.3.2-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjs-underscore/jammy,jammy,no=
w 1.13.2~dfsg-2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjson-c3/now 0.12.1-1.3ubuntu=
0.3 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjson-c5/jammy-updates,now 0.=
15-3~ubuntu1.22.04.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libjsoncpp25/jammy,now 1.9.5-3 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libk5crypto3/jammy-security,now=
 1.19.2-2ubuntu0.1 amd64 [installed,upgradable to: 1.19.2-2ubuntu0.2]<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libk5crypto3/jammy-security,now=
 1.19.2-2ubuntu0.1 i386 [installed,upgradable to: 1.19.2-2ubuntu0.2]<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libkeybinder-3.0-0/jammy,now 0.=
3.2-1.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libkeyutils1/jammy,now 1.6.1-2u=
buntu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libkeyutils1/jammy,now 1.6.1-2u=
buntu3 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libklibc/jammy,now 2.0.10-4 amd=
64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libkmod2/jammy,now 29-1ubuntu1 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libkpathsea6/jammy-security,jam=
my-updates,now 2021.20210626.59705-1ubuntu0.1 amd64 [installed,automatic]<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libkrb5-3/jammy-security,now 1.=
19.2-2ubuntu0.1 amd64 [installed,upgradable to: 1.19.2-2ubuntu0.2]<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libkrb5-3/jammy-security,now 1.=
19.2-2ubuntu0.1 i386 [installed,upgradable to: 1.19.2-2ubuntu0.2]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libkrb5support0/jammy-security,=
now 1.19.2-2ubuntu0.1 amd64 [installed,upgradable to: 1.19.2-2ubuntu0.2]<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libkrb5support0/jammy-security,=
now 1.19.2-2ubuntu0.1 i386 [installed,upgradable to: 1.19.2-2ubuntu0.2]<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libksba8/jammy-security,jammy-u=
pdates,now 1.6.0-2ubuntu0.2 amd64 [installed,automatic]<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblapack3/jammy,now 3.10.0-2ub=
untu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblcms2-2/jammy,now 2.12~rc1-2=
build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libldap-2.5-0/now 2.5.13+dfsg-0=
ubuntu0.22.04.1 amd64 [installed,upgradable to: 2.5.14+dfsg-0ubuntu0.22.04.=
2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libldap-common/now 2.5.13+dfsg-=
0ubuntu0.22.04.1 all [installed,upgradable to: 2.5.14+dfsg-0ubuntu0.22.04.2=
]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libllvm13/jammy-security,jammy-=
updates,now 1:13.0.1-2ubuntu2.1 amd64 [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libllvm14/jammy,now 1:14.0.0-1u=
buntu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblmdb0/jammy,now 0.9.24-1buil=
d2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblocale-gettext-perl/jammy,no=
w 1.07-4build3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblsan0/jammy-security,jammy-u=
pdates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libltdl7/jammy,now 2.4.6-15buil=
d2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblua5.2-0/jammy,now 5.2.4-2 a=
md64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblua5.3-0/jammy,now 5.3.6-1bu=
ild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblwres160/now 1:9.11.3+dfsg-1=
ubuntu1.18 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblz4-1/jammy,now 1.9.3-2build=
2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblz4-1/jammy,now 1.9.3-2build=
2 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblz4-tool/jammy,jammy,now 1.9=
.3-2build2 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblzma5/jammy,now 5.2.5-2ubunt=
u1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblzma5/jammy,now 5.2.5-2ubunt=
u1 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liblzo2-2/jammy,now 2.10-2build=
3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libm17n-0/jammy,now 1.8.0-4 amd=
64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmagic-mgc/jammy,now 1:5.41-3=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmagic1/jammy,now 1:5.41-3 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmailtools-perl/jammy,jammy,n=
ow 2.21-1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmaxminddb0/jammy,now 1.5.2-1=
build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmd0/jammy,now 1.0.4-1build1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmd0/jammy,now 1.0.4-1build1 =
i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmnl0/jammy,now 1.0.4-3build2=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmount-dev/jammy,now 2.37.2-4=
ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmount1/jammy,now 2.37.2-4ubu=
ntu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmount1/jammy,now 2.37.2-4ubu=
ntu3 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmpc3/jammy,now 1.2.1-2build1=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmpdec2/now 2.4.2-3 amd64 [in=
stalled,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmpdec3/jammy,now 2.5.1-2buil=
d2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmpfr6/jammy,now 4.1.0-3build=
3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libmpx2/now 8.4.0-3ubuntu2 amd6=
4 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnautilus-extension1a/jammy-s=
ecurity,now 1:42.2-0ubuntu2.1 amd64 [installed,upgradable to: 1:42.6-0ubunt=
u1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libncurses-dev/jammy-security,j=
ammy-updates,now 6.3-2ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libncurses5-dev/jammy-security,=
jammy-updates,now 6.3-2ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libncurses5/jammy-security,jamm=
y-updates,now 6.3-2ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libncurses6/jammy-security,jamm=
y-updates,now 6.3-2ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libncursesw5/jammy-security,jam=
my-updates,now 6.3-2ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libncursesw6/jammy-security,jam=
my-updates,now 6.3-2ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libndctl6/jammy,now 72.1-1 amd6=
4 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnet-smtp-ssl-perl/jammy,jamm=
y,now 1.04-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnet-ssleay-perl/jammy,now 1.=
92-1build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnet1/jammy,now 1.1.6+dfsg-3.=
1build3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnetfilter-conntrack3/jammy,n=
ow 1.0.9-1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnettle6/now 3.4.1-0ubuntu0.1=
8.04.1 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnettle8/jammy,now 3.7.3-1bui=
ld2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnettle8/jammy,now 3.7.3-1bui=
ld2 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnewt0.52/jammy,now 0.52.21-5=
ubuntu2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnfnetlink0/jammy,now 1.0.1-3=
build3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnfsidmap1/jammy-updates,now =
1:2.6.1-1ubuntu1.2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnftables1/jammy-updates,now =
1.0.2-1ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnftnl11/jammy,now 1.2.1-1bui=
ld1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnghttp2-14/jammy,now 1.43.0-=
1build3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnih1/jammy,now 1.0.3-12build=
1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnl-3-200/jammy,now 3.5.0-0.1=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnl-genl-3-200/jammy,now 3.5.=
0-0.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnl-route-3-200/jammy,now 3.5=
.0-0.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnotify4/jammy-updates,now 0.=
7.9-3ubuntu5.22.04.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnpth0/jammy,now 1.6-3build2 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnsl-dev/jammy,now 1.3.0-2bui=
ld2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnsl2/jammy,now 1.3.0-2build2=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnspr4/jammy,now 2:4.32-3buil=
d1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnss-nis/jammy,now 3.1-0ubunt=
u6 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnss-systemd/jammy-security,n=
ow 249.11-0ubuntu3.7 amd64 [installed,upgradable to: 249.11-0ubuntu3.9]<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnss3/jammy-security,jammy-up=
dates,now 2:3.68.2-0ubuntu1.2 amd64 [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libntfs-3g88/now 1:2017.3.23-2u=
buntu0.18.04.5 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libntfs-3g89/jammy-security,jam=
my-updates,now 1:2021.8.22-3ubuntu1.2 amd64 [installed,automatic]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnuma1/jammy,now 2.0.14-3ubun=
tu2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libnx-x11-6/jammy,now 2:3.5.99.=
26-5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libogg0/jammy,now 1.3.5-0ubuntu=
3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libonig5/jammy,now 6.9.7.1-2bui=
ld1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libopengl-dev/jammy,now 1.4.0-1=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libopengl0/jammy,now 1.4.0-1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libopenjp2-7/jammy,now 2.4.0-6 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libopus0/jammy,now 1.3.1-0.1bui=
ld2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liborc-0.4-0/jammy,now 1:0.4.32=
-2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libotf1/jammy,now 0.9.16-3build=
1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libp11-kit0/jammy,now 0.24.0-6b=
uild1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libp11-kit0/jammy,now 0.24.0-6b=
uild1 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpam-cap/jammy,now 1:2.44-1bu=
ild3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpam-modules-bin/jammy-securi=
ty,jammy-updates,now 1.4.0-11ubuntu2.3 amd64 [installed]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpam-modules/jammy-security,j=
ammy-updates,now 1.4.0-11ubuntu2.3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpam-runtime/jammy-security,j=
ammy-security,jammy-updates,jammy-updates,now 1.4.0-11ubuntu2.3 all [instal=
led]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpam-systemd/jammy-security,n=
ow 249.11-0ubuntu3.7 amd64 [installed,upgradable to: 249.11-0ubuntu3.9]<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpam0g/jammy-security,jammy-u=
pdates,now 1.4.0-11ubuntu2.3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpango-1.0-0/jammy,now 1.50.6=
+ds-2 amd64 [installed,upgradable to: 1.50.6+ds-2ubuntu1]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpango-1.0-0/jammy,now 1.50.6=
+ds-2 i386 [installed,upgradable to: 1.50.6+ds-2ubuntu1]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpangocairo-1.0-0/jammy,now 1=
.50.6+ds-2 amd64 [installed,upgradable to: 1.50.6+ds-2ubuntu1]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpangocairo-1.0-0/jammy,now 1=
.50.6+ds-2 i386 [installed,upgradable to: 1.50.6+ds-2ubuntu1]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpangoft2-1.0-0/jammy,now 1.5=
0.6+ds-2 amd64 [installed,upgradable to: 1.50.6+ds-2ubuntu1]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpangoft2-1.0-0/jammy,now 1.5=
0.6+ds-2 i386 [installed,upgradable to: 1.50.6+ds-2ubuntu1]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpangoxft-1.0-0/jammy,now 1.5=
0.6+ds-2 amd64 [installed,upgradable to: 1.50.6+ds-2ubuntu1]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpaper1/jammy,now 1.1.28build=
2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libparted2/jammy,now 3.4-2build=
1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcap0.8/jammy,now 1.10.1-4bu=
ild1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpci3/jammy,now 1:3.7.0-6 amd=
64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcre16-3/jammy-security,jamm=
y-updates,now 2:8.39-13ubuntu0.22.04.1 amd64 [installed,automatic]<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcre2-16-0/jammy-security,ja=
mmy-updates,now 10.39-3ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcre2-32-0/jammy-security,ja=
mmy-updates,now 10.39-3ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcre2-8-0/jammy-security,jam=
my-updates,now 10.39-3ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcre2-8-0/jammy-security,jam=
my-updates,now 10.39-3ubuntu0.1 i386 [installed,automatic]<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcre2-dev/jammy-security,jam=
my-updates,now 10.39-3ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcre2-posix3/jammy-security,=
jammy-updates,now 10.39-3ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcre3-dev/jammy-security,jam=
my-updates,now 2:8.39-13ubuntu0.22.04.1 amd64 [installed,automatic]<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcre32-3/jammy-security,jamm=
y-updates,now 2:8.39-13ubuntu0.22.04.1 amd64 [installed,automatic]<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcre3/jammy-security,jammy-u=
pdates,now 2:8.39-13ubuntu0.22.04.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcre3/jammy-security,jammy-u=
pdates,now 2:8.39-13ubuntu0.22.04.1 i386 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcrecpp0v5/jammy-security,ja=
mmy-updates,now 2:8.39-13ubuntu0.22.04.1 amd64 [installed,automatic]<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpcsclite1/jammy,now 1.9.5-3 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpeas-1.0-0/jammy,now 1.32.0-=
1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpeas-common/jammy,jammy,now =
1.32.0-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libperl5.34/jammy-security,jamm=
y-updates,now 5.34.0-3ubuntu1.1 amd64 [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpipeline1/jammy,now 1.5.5-1 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpixman-1-0/jammy-security,ja=
mmy-updates,now 0.40.0-1ubuntu0.22.04.1 amd64 [installed,automatic]<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpixman-1-0/jammy-security,ja=
mmy-updates,now 0.40.0-1ubuntu0.22.04.1 i386 [installed,automatic]<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpixman-1-dev/jammy-security,=
jammy-updates,now 0.40.0-1ubuntu0.22.04.1 amd64 [installed]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpkcs11-helper1/jammy-updates=
,now 1.28-1ubuntu0.22.04.1 amd64 [installed,automatic]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libplymouth4/now 0.9.3-1ubuntu7=
.18.04.2 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libplymouth5/jammy,now 0.9.5+gi=
t20211018-1ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpmem1/jammy,now 1.11.1-3buil=
d1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpmemobj1/jammy,now 1.11.1-3b=
uild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpng-dev/jammy,now 1.6.37-3bu=
ild5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpng16-16/jammy,now 1.6.37-3b=
uild5 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpng16-16/jammy,now 1.6.37-3b=
uild5 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpolkit-gobject-1-0/jammy,now=
 0.105-33 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpoppler-glib8/jammy-security=
,jammy-updates,now 22.02.0-2ubuntu0.1 amd64 [installed,automatic]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpoppler118/jammy-security,ja=
mmy-updates,now 22.02.0-2ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpopt0/jammy,now 1.18-3build1=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpq5/jammy-security,jammy-upd=
ates,now 14.8-0ubuntu0.22.04.1 amd64 [installed,automatic]<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libprocps6/now 2:3.3.12-3ubuntu=
1.2 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libprocps8/jammy,now 2:3.3.17-6=
ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libprotobuf23/jammy-security,ja=
mmy-updates,now 3.12.4-1ubuntu7.22.04.1 amd64 [installed,automatic]<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpsl5/jammy,now 0.21.0-1.2bui=
ld2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpthread-stubs0-dev/jammy,now=
 0.4-1build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpulse-dev/now 1:15.99.1+dfsg=
1-1ubuntu2 amd64 [installed,upgradable to: 1:15.99.1+dfsg1-1ubuntu2.1]<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpulse-mainloop-glib0/now 1:1=
5.99.1+dfsg1-1ubuntu2 amd64 [installed,upgradable to: 1:15.99.1+dfsg1-1ubun=
tu2.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpulse0/now 1:15.99.1+dfsg1-1=
ubuntu2 amd64 [installed,upgradable to: 1:15.99.1+dfsg1-1ubuntu2.1]<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpython3-dev/jammy-updates,no=
w 3.10.6-1~22.04 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpython3-stdlib/jammy-updates=
,now 3.10.6-1~22.04 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpython3.10-dev/jammy-securit=
y,jammy-updates,now 3.10.6-1~22.04.2ubuntu1 amd64 [installed,automatic]<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpython3.10-minimal/jammy-sec=
urity,jammy-updates,now 3.10.6-1~22.04.2ubuntu1 amd64 [installed,automatic]=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpython3.10-stdlib/jammy-secu=
rity,jammy-updates,now 3.10.6-1~22.04.2ubuntu1 amd64 [installed,automatic]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpython3.10/jammy-security,ja=
mmy-updates,now 3.10.6-1~22.04.2ubuntu1 amd64 [installed,automatic]<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpython3.6-dev/now 3.6.9-1~18=
.04ubuntu1.8 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpython3.6-minimal/now 3.6.9-=
1~18.04ubuntu1.8 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpython3.6-stdlib/now 3.6.9-1=
~18.04ubuntu1.8 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libpython3.6/now 3.6.9-1~18.04u=
buntu1.8 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libquadmath0/jammy-security,jam=
my-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">librados2/jammy-security,jammy-=
updates,now 17.2.5-0ubuntu0.22.04.3 amd64 [installed,automatic]<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">librbd1/jammy-security,jammy-up=
dates,now 17.2.5-0ubuntu0.22.04.3 amd64 [installed,automatic]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">librdmacm1/jammy,now 39.0-1 amd=
64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libreadline7/now 7.0-3 amd64 [i=
nstalled,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libreadline8/jammy,now 8.1.2-1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">librhash0/jammy,now 1.4.2-1ubun=
tu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">librpm9/jammy,now 4.17.0+dfsg1-=
4build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">librpmio9/jammy,now 4.17.0+dfsg=
1-4build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">librsvg2-2/jammy,now 2.52.5+dfs=
g-3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">librsvg2-common/jammy,now 2.52.=
5+dfsg-3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">librtmp1/jammy,now 2.4+20151223=
.gitfa8646d.1-2build4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libruby2.7/now 2.7.0-5ubuntu1.7=
 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libruby3.0/jammy-security,jammy=
-updates,now 3.0.2-7ubuntu2.3 amd64 [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsasl2-2/jammy,now 2.1.27+dfs=
g2-3ubuntu1 amd64 [installed,upgradable to: 2.1.27+dfsg2-3ubuntu1.2]<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsasl2-modules-db/jammy,now 2=
.1.27+dfsg2-3ubuntu1 amd64 [installed,upgradable to: 2.1.27+dfsg2-3ubuntu1.=
2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsasl2-modules/jammy,now 2.1.=
27+dfsg2-3ubuntu1 amd64 [installed,upgradable to: 2.1.27+dfsg2-3ubuntu1.2]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsctp1/jammy,now 1.0.19+dfsg-=
1build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsdl1.2-dev/jammy,now 1.2.15+=
dfsg2-6 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsdl1.2debian/jammy,now 1.2.1=
5+dfsg2-6 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libseccomp2/jammy,now 2.5.3-2ub=
untu2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsecret-1-0/jammy,now 0.20.5-=
2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsecret-common/jammy,jammy,no=
w 0.20.5-2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libselinux1-dev/jammy,now 3.3-1=
build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libselinux1/jammy,now 3.3-1buil=
d2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libselinux1/jammy,now 3.3-1buil=
d2 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsemanage-common/jammy,jammy,=
now 3.3-1build2 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsemanage2/jammy,now 3.3-1bui=
ld2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsensors-config/jammy,jammy,n=
ow 1:3.6.0-7ubuntu1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsensors5/jammy,now 1:3.6.0-7=
ubuntu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsepol-dev/jammy,now 3.3-1bui=
ld1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsepol1/now 3.0-1ubuntu0.1 am=
d64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsepol2/jammy,now 3.3-1build1=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libserf-1-1/jammy,now 1.3.9-10u=
buntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsigc++-2.0-0v5/jammy,now 2.1=
0.4-2ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsigsegv2/jammy,now 2.13-1ubu=
ntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libslang2-dev/jammy,now 2.3.2-5=
build4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libslang2/jammy,now 2.3.2-5buil=
d4 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libslirp0/jammy,now 4.6.1-1buil=
d1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsm6/jammy,now 2:1.2.3-1build=
2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsmartcols1/jammy,now 2.37.2-=
4ubuntu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsndfile1/jammy,now 1.0.31-2b=
uild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsodium23/jammy,now 1.0.18-1b=
uild2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsource-highlight-common/jamm=
y,jammy,now 3.1.9-4.1build2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsource-highlight4v5/jammy,no=
w 3.1.9-4.1build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libspectre1/jammy,now 0.2.10-1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libspice-server1/jammy,now 0.15=
.0-2ubuntu4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsqlite3-0/jammy-security,jam=
my-updates,now 3.37.2-2ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsqlite3-dev/jammy-security,j=
ammy-updates,now 3.37.2-2ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libss2/jammy-security,jammy-upd=
ates,now 1.46.5-2ubuntu1.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libssh-4/jammy,now 0.9.6-2build=
1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libssh2-1/jammy,now 1.10.0-3 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libssl-dev/jammy-security,jammy=
-updates,now 3.0.2-0ubuntu1.10 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libssl1.0.0/now 1.0.2n-1ubuntu5=
.10 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libssl1.1/now 1.1.1f-1ubuntu2.1=
6 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libssl3/jammy-security,jammy-up=
dates,now 3.0.2-0ubuntu1.10 amd64 [installed,automatic]<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libssl3/jammy-security,jammy-up=
dates,now 3.0.2-0ubuntu1.10 i386 [installed,automatic]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libstartup-notification0/jammy,=
now 0.12-6build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libstd-rust-1.65/jammy-security=
,jammy-updates,now 1.65.0+dfsg0ubuntu1-0ubuntu0.22.04.1 amd64 [installed,au=
tomatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libstd-rust-dev/jammy-security,=
jammy-updates,now 1.65.0+dfsg0ubuntu1-0ubuntu0.22.04.1 amd64 [installed,aut=
omatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libstdc++-11-dev/jammy-security=
,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libstdc++6/jammy-security,jammy=
-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libstdc++6/jammy-security,jammy=
-updates,now 12.1.0-2ubuntu1~22.04 i386 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsvn1/jammy-security,jammy-up=
dates,now 1.14.1-3ubuntu0.22.04.1 amd64 [installed,automatic]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libswitch-perl/jammy,jammy,now =
2.17-2.1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsynctex2/jammy-security,jamm=
y-updates,now 2021.20210626.59705-1ubuntu0.1 amd64 [installed,automatic]<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsystemd0/jammy-security,now =
249.11-0ubuntu3.7 amd64 [installed,upgradable to: 249.11-0ubuntu3.9]<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libsystemd0/jammy-security,now =
249.11-0ubuntu3.7 i386 [installed,upgradable to: 249.11-0ubuntu3.9]<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtasn1-6/jammy,now 4.18.0-4bu=
ild1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtasn1-6/jammy,now 4.18.0-4bu=
ild1 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtcl8.6/jammy,now 8.6.12+dfsg=
-1build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtext-charwidth-perl/jammy,no=
w 0.04-10build3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtext-iconv-perl/jammy,now 1.=
7-7build3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtext-unidecode-perl/jammy,ja=
mmy,now 1.30-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtext-wrapi18n-perl/jammy,jam=
my,now 0.06-9 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libthai-data/jammy,jammy,now 0.=
1.29-1build1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libthai0/jammy,now 0.1.29-1buil=
d1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libthai0/jammy,now 0.1.29-1buil=
d1 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtheora0/jammy,now 1.1.1+dfsg=
.1-15ubuntu4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libthunarx-3-0/jammy,now 4.16.1=
0-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtiff5/jammy-security,jammy-u=
pdates,now 4.3.0-6ubuntu0.4 amd64 [installed,automatic]<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtiff5/jammy-security,jammy-u=
pdates,now 4.3.0-6ubuntu0.4 i386 [installed,automatic]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtimedate-perl/jammy,jammy,no=
w 2.3300-2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtinfo5/jammy-security,jammy-=
updates,now 6.3-2ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtinfo6/jammy-security,jammy-=
updates,now 6.3-2ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtirpc-common/jammy-security,=
jammy-security,jammy-updates,jammy-updates,now 1.3.2-2ubuntu0.1 all [instal=
led,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtirpc-dev/jammy-security,jam=
my-updates,now 1.3.2-2ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtirpc3/jammy-security,jammy-=
updates,now 1.3.2-2ubuntu0.1 amd64 [installed,automatic]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtokyocabinet9/jammy,now 1.4.=
48-14build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtool/jammy,jammy,now 2.4.6-1=
5build2 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtry-tiny-perl/jammy,jammy,no=
w 0.31-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libtsan0/jammy-security,jammy-u=
pdates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libubsan0/now 7.5.0-6ubuntu2 am=
d64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libubsan1/jammy-security,jammy-=
updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libuchardet0/jammy,now 0.0.7-1b=
uild2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libudev1/jammy-security,now 249=
.11-0ubuntu3.7 amd64 [installed,upgradable to: 249.11-0ubuntu3.9]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libunistring2/jammy,now 1.0-1 a=
md64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libunistring2/jammy,now 1.0-1 i=
386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libunwind8/jammy,now 1.3.2-2bui=
ld2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libupower-glib3/jammy,now 0.99.=
17-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">liburing2/jammy,now 2.1-2build1=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libusb-1.0-0/jammy-updates,now =
2:1.0.25-1ubuntu2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libusbredirparser1/jammy,now 0.=
11.0-2build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libutempter0/jammy,now 1.2.1-2b=
uild2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libutf8proc2/jammy,now 2.7.0-3 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libuuid1/jammy,now 2.37.2-4ubun=
tu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libuuid1/jammy,now 2.37.2-4ubun=
tu3 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libuv1/jammy,now 1.43.0-1 amd64=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libvisual-0.4-0/jammy,now 0.4.0=
-17build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libvorbis0a/jammy,now 1.3.7-1bu=
ild2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libvorbisenc2/jammy,now 1.3.7-1=
build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libvte-2.91-0/jammy,now 0.68.0-=
1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libvte-2.91-common/jammy,now 0.=
68.0-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libvulkan1/jammy,now 1.3.204.1-=
2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libwayland-client0/jammy-securi=
ty,jammy-updates,now 1.20.0-1ubuntu0.1 amd64 [installed,automatic]<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libwayland-cursor0/jammy-securi=
ty,jammy-updates,now 1.20.0-1ubuntu0.1 amd64 [installed,automatic]<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libwayland-egl1/jammy-security,=
jammy-updates,now 1.20.0-1ubuntu0.1 amd64 [installed,automatic]<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libwayland-server0/jammy-securi=
ty,jammy-updates,now 1.20.0-1ubuntu0.1 amd64 [installed,automatic]<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libwebp7/jammy-security,jammy-u=
pdates,now 1.2.2-2ubuntu0.22.04.1 amd64 [installed,automatic]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libwebp7/jammy-security,jammy-u=
pdates,now 1.2.2-2ubuntu0.22.04.1 i386 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libwnck-3-0/jammy,now 40.1-1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libwnck-3-common/jammy,jammy,no=
w 40.1-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libwrap0/jammy,now 7.6.q-31buil=
d2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx11-6/jammy,now 2:1.7.5-1 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx11-6/jammy,now 2:1.7.5-1 i3=
86 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx11-data/jammy,jammy,now 2:1=
.7.5-1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx11-dev/jammy,now 2:1.7.5-1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx11-xcb1/jammy,now 2:1.7.5-1=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx2go-config-perl/jammy,jammy=
,now 4.1.0.3-5 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx2go-log-perl/jammy,jammy,no=
w 4.1.0.3-5 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx2go-server-db-perl/jammy,no=
w 4.1.0.3-5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx2go-server-perl/jammy,jammy=
,now 4.1.0.3-5 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx2go-utils-perl/jammy,jammy,=
now 4.1.0.3-5 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32asan4/now 7.5.0-6ubuntu2 =
amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32asan5/jammy-security,jamm=
y-updates,now 9.5.0-1ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32asan6/jammy-security,jamm=
y-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32atomic1/jammy-security,ja=
mmy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32cilkrts5/now 7.5.0-6ubunt=
u2 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32gcc-11-dev/jammy-security=
,jammy-updates,now 11.3.0-1ubuntu1~22.04.1 amd64 [installed,automatic]<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32gcc-7-dev/now 7.5.0-6ubun=
tu2 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32gcc-9-dev/jammy-security,=
jammy-updates,now 9.5.0-1ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32gcc-s1/jammy-security,jam=
my-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32gomp1/jammy-security,jamm=
y-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32itm1/jammy-security,jammy=
-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32quadmath0/jammy-security,=
jammy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32stdc++6/jammy-security,ja=
mmy-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32ubsan0/now 7.5.0-6ubuntu2=
 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libx32ubsan1/jammy-security,jam=
my-updates,now 12.1.0-2ubuntu1~22.04 amd64 [installed,automatic]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxapian30/jammy,now 1.4.18-4 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxau-dev/jammy,now 1:1.0.9-1b=
uild5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxau6/jammy,now 1:1.0.9-1buil=
d5 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxau6/jammy,now 1:1.0.9-1buil=
d5 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxaw7/jammy,now 2:1.0.14-1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb-dri2-0/jammy,now 1.14-3u=
buntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb-dri3-0/jammy,now 1.14-3u=
buntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb-glx0/jammy,now 1.14-3ubu=
ntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb-present0/jammy,now 1.14-=
3ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb-render0/jammy,now 1.14-3=
ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb-render0/jammy,now 1.14-3=
ubuntu3 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb-shape0/jammy,now 1.14-3u=
buntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb-shm0/jammy,now 1.14-3ubu=
ntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb-shm0/jammy,now 1.14-3ubu=
ntu3 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb-sync1/jammy,now 1.14-3ub=
untu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb-util1/jammy,now 0.4.0-1b=
uild2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb-xfixes0/jammy,now 1.14-3=
ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb1-dev/jammy,now 1.14-3ubu=
ntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb1/jammy,now 1.14-3ubuntu3=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcb1/jammy,now 1.14-3ubuntu3=
 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcomp3/jammy,now 2:3.5.99.26=
-5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcomposite1/jammy,now 1:0.4.=
5-1build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcomposite1/jammy,now 1:0.4.=
5-1build2 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcompshad3/jammy,now 2:3.5.9=
9.26-5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcursor1/jammy,now 1:1.2.0-2=
build4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxcursor1/jammy,now 1:1.2.0-2=
build4 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxdamage1/jammy,now 1:1.1.5-2=
build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxdamage1/jammy,now 1:1.1.5-2=
build2 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxdmcp-dev/jammy,now 1:1.1.3-=
0ubuntu5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxdmcp6/jammy,now 1:1.1.3-0ub=
untu5 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxdmcp6/jammy,now 1:1.1.3-0ub=
untu5 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxext-dev/jammy,now 2:1.3.4-1=
build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxext6/jammy,now 2:1.3.4-1bui=
ld1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxext6/jammy,now 2:1.3.4-1bui=
ld1 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxfce4panel-2.0-4/jammy,now 4=
.16.3-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxfce4ui-1-0/now 4.14.1-1ubun=
tu1 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxfce4ui-2-0/jammy,now 4.16.1=
-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxfce4ui-common/jammy,jammy,n=
ow 4.16.1-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxfce4ui-utils/jammy,now 4.16=
.1-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxfce4util-common/jammy,jammy=
,now 4.16.0-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxfce4util7/jammy,now 4.16.0-=
1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxfconf-0-3/jammy,now 4.16.0-=
2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxfixes3/jammy,now 1:6.0.0-1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxfixes3/jammy,now 1:6.0.0-1 =
i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxfont2/jammy,now 1:2.0.5-1bu=
ild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxft2/jammy,now 2.3.4-1 amd64=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxi6/jammy,now 2:1.8-1build1 =
amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxi6/jammy,now 2:1.8-1build1 =
i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxinerama1/jammy,now 2:1.1.4-=
3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxinerama1/jammy,now 2:1.1.4-=
3 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxkbcommon0/jammy,now 1.4.0-1=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxkbfile1/jammy,now 1:1.1.0-1=
build3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxkbregistry0/jammy,now 1.4.0=
-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxklavier16/jammy,now 5.4-4bu=
ild2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxml-libxml-perl/jammy,now 2.=
0207+dfsg+really+2.0134-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxml-namespacesupport-perl/ja=
mmy,jammy,now 1.12-1.1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxml-sax-base-perl/jammy,jamm=
y,now 1.09-1.1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxml-sax-perl/jammy,jammy,now=
 1.02+dfsg-3 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxml2/jammy-security,jammy-up=
dates,now 2.9.13+dfsg-1ubuntu0.3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxmu6/jammy,now 2:1.1.3-3 amd=
64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxmuu1/jammy,now 2:1.1.3-3 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxpm4/jammy-security,jammy-up=
dates,now 1:3.5.12-1ubuntu0.22.04.1 amd64 [installed,automatic]<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxpresent1/jammy,now 1.0.0-2b=
uild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxrandr2/jammy,now 2:1.5.2-1b=
uild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxrandr2/jammy,now 2:1.5.2-1b=
uild1 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxrender1/jammy,now 1:0.9.10-=
1build4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxrender1/jammy,now 1:0.9.10-=
1build4 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxres1/jammy,now 2:1.2.1-1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxshmfence1/jammy,now 1.3-1bu=
ild4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxslt1.1/jammy-security,jammy=
-updates,now 1.1.34-4ubuntu0.22.04.1 amd64 [installed]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxt6/jammy,now 1:1.2.1-1 amd6=
4 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxtables12/jammy,now 1.8.7-1u=
buntu5 amd64 [installed,upgradable to: 1.8.7-1ubuntu5.1]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxtst6/jammy,now 2:1.2.3-1bui=
ld4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxtst6/jammy,now 2:1.2.3-1bui=
ld4 i386 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxv1/jammy,now 2:1.0.11-1buil=
d2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxxf86dga1/jammy,now 2:1.1.5-=
0ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxxf86vm1/jammy,now 1:1.1.4-1=
build3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libxxhash0/jammy,now 0.8.1-1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libyaml-0-2/jammy,now 0.2.2-1bu=
ild2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libzstd1/jammy,now 1.4.8+dfsg-3=
build1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">libzstd1/jammy,now 1.4.8+dfsg-3=
build1 i386 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-base/jammy,jammy,now 4.5u=
buntu9 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-firmware/jammy-security,j=
ammy-security,now 20220329.git681281e4-0ubuntu3.12 all [installed,upgradabl=
e to: 20220329.git681281e4-0ubuntu3.13]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-generic/jammy-security,ja=
mmy-updates,now 5.15.0.73.71 amd64 [installed,automatic]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-headers-5.15.0-56-generic=
/now 5.15.0-56.62 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-headers-5.15.0-56/now 5.1=
5.0-56.62 all [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-headers-5.15.0-73-generic=
/jammy-security,jammy-updates,now 5.15.0-73.80 amd64 [installed,automatic]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-headers-5.15.0-73/jammy-s=
ecurity,jammy-security,jammy-updates,jammy-updates,now 5.15.0-73.80 all [in=
stalled,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-headers-generic/jammy-sec=
urity,jammy-updates,now 5.15.0.73.71 amd64 [installed,automatic]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-image-5.15.0-56-generic/n=
ow 5.15.0-56.62 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-image-5.15.0-73-generic/j=
ammy-security,jammy-updates,now 5.15.0-73.80 amd64 [installed,automatic]<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-image-generic/jammy-secur=
ity,jammy-updates,now 5.15.0.73.71 amd64 [installed,automatic]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-libc-dev/jammy-security,j=
ammy-updates,now 5.15.0-73.80 amd64 [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-modules-5.15.0-56-generic=
/now 5.15.0-56.62 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-modules-5.15.0-73-generic=
/jammy-security,jammy-updates,now 5.15.0-73.80 amd64 [installed,automatic]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-modules-extra-5.15.0-56-g=
eneric/now 5.15.0-56.62 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-modules-extra-5.15.0-73-g=
eneric/jammy-security,jammy-updates,now 5.15.0-73.80 amd64 [installed,autom=
atic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux-signed-generic/now 4.15.0=
.197.182 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">locales/jammy-updates,jammy-upd=
ates,now 2.35-0ubuntu3.1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">login/jammy-security,jammy-upda=
tes,now 1:4.8.1-2ubuntu2.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">logrotate/jammy-security,jammy-=
updates,now 3.19.0-1ubuntu1.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">logsave/jammy-security,jammy-up=
dates,now 1.46.5-2ubuntu1.1 amd64 [installed,automatic]<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lsb-base/jammy,jammy,now 11.1.0=
ubuntu4 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lsb-release/jammy,jammy,now 11.=
1.0ubuntu4 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lshw/jammy,now 02.19.git.2021.0=
6.19.996aaad9c7-2build1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lsof/jammy,now 4.93.2+dfsg-1.1b=
uild2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lto-disabled-list/jammy,jammy,n=
ow 24 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ltrace/jammy,now 0.7.3-6.1ubunt=
u6 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lz4/jammy,now 1.9.3-2build2 amd=
64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">lzip/jammy,now 1.23-1 amd64 [in=
stalled]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">m17n-db/jammy,jammy,now 1.8.0-3=
 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">m4/jammy,now 1.4.18-5ubuntu2 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">mailcap/jammy,jammy,now 3.70+nm=
u1ubuntu1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">make/jammy,now 4.3-4.1build1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">man-db/jammy,now 2.10.2-1 amd64=
 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">manpages-dev/jammy,jammy,now 5.=
10-1ubuntu1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">manpages/jammy,jammy,now 5.10-1=
ubuntu1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">mawk/jammy,now 1.3.4.20200120-3=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">mdadm/jammy,now 4.2-0ubuntu1 am=
d64 [installed,upgradable to: 4.2-0ubuntu2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">media-types/jammy,jammy,now 7.0=
.0 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">meld/jammy,jammy,now 3.20.4-2 a=
ll [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">mime-support/jammy,jammy,now 3.=
66 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">mokutil/jammy,now 0.4.0-1ubuntu=
2 amd64 [installed,upgradable to: 0.6.0-2~22.04.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">monitoring-plugins-basic/jammy,=
now 2.3.1-1ubuntu4 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">monitoring-plugins-common/jammy=
,now 2.3.1-1ubuntu4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">mosh/jammy,now 1.3.2-2.1ubuntu1=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">mount/jammy,now 2.37.2-4ubuntu3=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">mtr-tiny/jammy,now 0.95-1 amd64=
 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">multiarch-support/now 2.27-3ubu=
ntu1.5 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">mutt/jammy-security,jammy-updat=
es,now 2.1.4-1ubuntu1.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">nano/jammy,now 6.2-1 amd64 [ins=
talled]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ncal/jammy,now 12.1.7+nmu3ubunt=
u2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ncdu/jammy,now 1.15.1-1 amd64 [=
installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ncurses-base/jammy-security,jam=
my-security,jammy-updates,jammy-updates,now 6.3-2ubuntu0.1 all [installed]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ncurses-bin/jammy-security,jamm=
y-updates,now 6.3-2ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ncurses-term/jammy-security,jam=
my-security,jammy-updates,jammy-updates,now 6.3-2ubuntu0.1 all [installed]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">net-tools/jammy,now 1.60+git201=
81103.0eebece-1ubuntu5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">netbase/jammy,jammy,now 6.3 all=
 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">netcat-openbsd/jammy,now 1.218-=
4ubuntu1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">netfilter-persistent/jammy,jamm=
y,now 1.0.16 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">networkd-dispatcher/jammy-secur=
ity,jammy-security,jammy-updates,jammy-updates,now 2.1-2ubuntu0.22.04.2 all=
 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">nfs-common/jammy-updates,now 1:=
2.6.1-1ubuntu1.2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">nfs-kernel-server/jammy-updates=
,now 1:2.6.1-1ubuntu1.2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">nftables/jammy-updates,now 1.0.=
2-1ubuntu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ninja-build/jammy,now 1.10.1-1 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">nis/jammy,jammy,now 4.4 all [in=
stalled]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ntfs-3g/jammy-security,jammy-up=
dates,now 1:2021.8.22-3ubuntu1.2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">nx-x11-common/jammy,jammy,now 2=
:3.5.99.26-5 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">nxagent/jammy,now 2:3.5.99.26-5=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">openjdk-11-jdk-headless/jammy-s=
ecurity,jammy-updates,now 11.0.19+7~us1-0ubuntu1~22.04.1 amd64 [installed,a=
utomatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">openjdk-11-jdk/jammy-security,j=
ammy-updates,now 11.0.19+7~us1-0ubuntu1~22.04.1 amd64 [installed]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">openjdk-11-jre-headless/jammy-s=
ecurity,jammy-updates,now 11.0.19+7~us1-0ubuntu1~22.04.1 amd64 [installed,a=
utomatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">openjdk-11-jre/jammy-security,j=
ammy-updates,now 11.0.19+7~us1-0ubuntu1~22.04.1 amd64 [installed,automatic]=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">openjdk-17-jdk-headless/jammy-s=
ecurity,jammy-updates,now 17.0.7+7~us1-0ubuntu1~22.04.2 amd64 [installed]<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">openjdk-17-jre-headless/jammy-s=
ecurity,jammy-updates,now 17.0.7+7~us1-0ubuntu1~22.04.2 amd64 [installed,au=
tomatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">openssh-client/jammy,now 1:8.9p=
1-3 amd64 [installed,upgradable to: 1:8.9p1-3ubuntu0.1]<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">openssh-server/jammy,now 1:8.9p=
1-3 amd64 [installed,upgradable to: 1:8.9p1-3ubuntu0.1]<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">openssh-sftp-server/jammy,now 1=
:8.9p1-3 amd64 [installed,upgradable to: 1:8.9p1-3ubuntu0.1]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">openssl/jammy-security,jammy-up=
dates,now 3.0.2-0ubuntu1.10 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">openvpn/jammy-updates,now 2.5.5=
-1ubuntu3.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">os-prober/jammy,now 1.79ubuntu2=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ovmf/jammy-updates,jammy-update=
s,now 2022.02-3ubuntu0.22.04.1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">pamtester/jammy,now 0.1.2-4 amd=
64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">parted/jammy,now 3.4-2build1 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">passwd/jammy-security,jammy-upd=
ates,now 1:4.8.1-2ubuntu2.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">patch/jammy,now 2.7.6-7build2 a=
md64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">pci.ids/jammy,jammy,now 0.0~202=
2.01.22-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">pciutils/jammy,now 1:3.7.0-6 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">perl-base/jammy-security,jammy-=
updates,now 5.34.0-3ubuntu1.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">perl-modules-5.34/jammy-securit=
y,jammy-security,jammy-updates,jammy-updates,now 5.34.0-3ubuntu1.1 all [ins=
talled,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">perl-openssl-defaults/jammy,now=
 5build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">perl/jammy-security,jammy-updat=
es,now 5.34.0-3ubuntu1.1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">pinentry-curses/jammy,now 1.1.1=
-1build2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">pkg-config/jammy,now 0.29.2-1ub=
untu3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">plymouth-theme-ubuntu-text/jamm=
y,now 0.9.5+git20211018-1ubuntu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">plymouth/jammy,now 0.9.5+git202=
11018-1ubuntu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">poppler-data/jammy,jammy,now 0.=
4.11-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">popularity-contest/jammy,jammy,=
now 1.71ubuntu3 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">postfix/jammy,now 3.6.4-1ubuntu=
1 amd64 [installed,upgradable to: 3.6.4-1ubuntu1.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">powermgmt-base/jammy,jammy,now =
1.36 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">procps/jammy,now 2:3.3.17-6ubun=
tu2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">psmisc/jammy,now 23.4-2build3 a=
md64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">publicsuffix/jammy,jammy,now 20=
211207.1025-1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">puppet-agent/jammy,now 7.24.0-1=
jammy amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">pwgen/jammy,now 2.08-2build1 am=
d64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python-apt-common/now 2.3.0ubun=
tu2.1 all [installed,upgradable to: 2.4.0ubuntu1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-apt/now 2.3.0ubuntu2.1 =
amd64 [installed,upgradable to: 2.4.0ubuntu1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-cairo/jammy,now 1.20.1-=
3build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-certifi/jammy,jammy,now=
 2020.6.20-1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-chardet/jammy,jammy,now=
 4.0.0-1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-commandnotfound/jammy,j=
ammy,now 22.04.0 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-dateutil/jammy,jammy,no=
w 2.8.1-6 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-dbus/jammy,now 1.2.18-3=
build1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-dev/jammy-updates,now 3=
.10.6-1~22.04 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-distro-info/jammy,jammy=
,now 1.1build1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-distro/jammy,jammy,now =
1.7.0-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-distupgrade/now 1:22.04=
.15 all [installed,upgradable to: 1:22.04.16]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-distutils/jammy-updates=
,jammy-updates,now 3.10.6-1~22.04 all [installed,automatic]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-et-xmlfile/jammy,jammy,=
now 1.0.1-2.1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-extras/jammy,jammy,now =
1.0.0-4build1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-fixtures/jammy,jammy,no=
w 3.0.0-4 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-gdbm/jammy-updates,now =
3.10.6-1~22.04 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-gi-cairo/jammy-updates,=
now 3.42.1-0ubuntu1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-gi/jammy-updates,now 3.=
42.1-0ubuntu1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-git/jammy,jammy,now 3.1=
.24-1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-gitdb/jammy,jammy,now 4=
.0.9-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-idna/jammy,jammy,now 3.=
3-1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-jdcal/jammy,jammy,now 1=
.0-1.3 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-lib2to3/jammy-updates,j=
ammy-updates,now 3.10.6-1~22.04 all [installed,automatic]<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-lxml/jammy,now 4.8.0-1b=
uild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-minimal/jammy-updates,n=
ow 3.10.6-1~22.04 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-newt/jammy,now 0.52.21-=
5ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-numpy/jammy-security,ja=
mmy-updates,now 1:1.21.5-1ubuntu22.04.1 amd64 [installed,automatic]<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-openpyxl/jammy,jammy,no=
w 3.0.9-1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-pandas-lib/jammy,now 1.=
3.5+dfsg-3 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-pandas/jammy,jammy,now =
1.3.5+dfsg-3 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-pbr/jammy,jammy,now 5.8=
.0-0ubuntu1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-pip-whl/jammy-security,=
jammy-security,jammy-updates,jammy-updates,now 22.0.2+dfsg-1ubuntu0.2 all [=
installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-pkg-resources/jammy-sec=
urity,jammy-security,jammy-updates,jammy-updates,now 59.6.0-1.2ubuntu0.22.0=
4.1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-requests/jammy,jammy,no=
w 2.25.1+dfsg-2 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-setuptools-whl/jammy-se=
curity,jammy-security,jammy-updates,jammy-updates,now 59.6.0-1.2ubuntu0.22.=
04.1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-setuptools/jammy-securi=
ty,jammy-security,jammy-updates,jammy-updates,now 59.6.0-1.2ubuntu0.22.04.1=
 all [installed,automatic]python3-six/jammy,jammy,now 1.16.0-3ubuntu1 all [=
installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-smmap/jammy,jammy,now 5=
.0.0-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-subunit/jammy,jammy,now=
 1.4.0-3 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-testtools/jammy,jammy,n=
ow 2.5.0-3ubuntu2 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-tz/now 2022.1-1ubuntu0.=
22.04.0 all [installed,upgradable to: 2022.1-1ubuntu0.22.04.1]<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-update-manager/jammy,ja=
mmy,now 1:22.04.9 all [installed,upgradable to: 1:22.04.10]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-urllib3/jammy,jammy,now=
 1.26.5-1~exp1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-venv/jammy-updates,now =
3.10.6-1~22.04 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-yaml/jammy,now 5.4.1-1u=
buntu1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3.10-dev/jammy-security,j=
ammy-updates,now 3.10.6-1~22.04.2ubuntu1 amd64 [installed,automatic]<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3.10-minimal/jammy-securi=
ty,jammy-updates,now 3.10.6-1~22.04.2ubuntu1 amd64 [installed,automatic]<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3.10-venv/jammy-security,=
jammy-updates,now 3.10.6-1~22.04.2ubuntu1 amd64 [installed,automatic]<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3.10/jammy-security,jammy=
-updates,now 3.10.6-1~22.04.2ubuntu1 amd64 [installed,automatic]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3.6-minimal/now 3.6.9-1~1=
8.04ubuntu1.8 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3.6/now 3.6.9-1~18.04ubun=
tu1.8 amd64 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3/jammy-updates,now 3.10.=
6-1~22.04 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-block-extra/jammy-security=
,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgradable to: 1:6.2+dfsg-2ubun=
tu6.8]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-system-arm/jammy-security,=
now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgradable to: 1:6.2+dfsg-2ubunt=
u6.8]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-system-common/jammy-securi=
ty,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgradable to: 1:6.2+dfsg-2ub=
untu6.8]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-system-data/jammy-security=
,jammy-security,now 1:6.2+dfsg-2ubuntu6.6 all [installed,upgradable to: 1:6=
.2+dfsg-2ubuntu6.8]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-system-mips/jammy-security=
,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgradable to: 1:6.2+dfsg-2ubun=
tu6.8]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-system-misc/jammy-security=
,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgradable to: 1:6.2+dfsg-2ubun=
tu6.8]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-system-ppc/jammy-security,=
now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgradable to: 1:6.2+dfsg-2ubunt=
u6.8]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-system-s390x/jammy-securit=
y,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgradable to: 1:6.2+dfsg-2ubu=
ntu6.8]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-system-sparc/jammy-securit=
y,now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgradable to: 1:6.2+dfsg-2ubu=
ntu6.8]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-system-x86/jammy-security,=
now 1:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgradable to: 1:6.2+dfsg-2ubunt=
u6.8]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-system/jammy-security,now =
1:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgradable to: 1:6.2+dfsg-2ubuntu6.8=
]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-utils/jammy-security,now 1=
:6.2+dfsg-2ubuntu6.6 amd64 [installed,upgradable to: 1:6.2+dfsg-2ubuntu6.8]=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">quilt/jammy,jammy,now 0.66-2.1 =
all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rake/jammy,jammy,now 13.0.6-2 a=
ll [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">readline-common/jammy,jammy,now=
 8.1.2-1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ripgrep/jammy-security,jammy-up=
dates,now 13.0.0-2ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rpcbind/jammy,now 1.2.6-2build1=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rpcsvc-proto/jammy,now 1.4.2-0u=
buntu6 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rpm-common/jammy,now 4.17.0+dfs=
g1-4build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rpm2cpio/jammy,now 4.17.0+dfsg1=
-4build1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rsync/jammy-security,jammy-upda=
tes,now 3.2.7-0ubuntu0.22.04.2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rsyslog/jammy-security,jammy-up=
dates,now 8.2112.0-2ubuntu2.2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ruby-minitest/jammy,jammy,now 5=
.13.0-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ruby-net-telnet/jammy,jammy,now=
 0.1.1-2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ruby-power-assert/jammy,jammy,n=
ow 1.1.7-2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ruby-rubygems/jammy,jammy,now 3=
.3.5-2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ruby-test-unit/jammy,jammy,now =
3.3.9-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ruby-xmlrpc/jammy-updates,jammy=
-updates,now 0.3.2-1ubuntu0.1 all [installed,automatic]<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ruby3.0/jammy-security,jammy-up=
dates,now 3.0.2-7ubuntu2.3 amd64 [installed,automatic]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ruby/jammy,now 1:3.0~exp1 amd64=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rubygems-integration/jammy,jamm=
y,now 1.18 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rustc/jammy-security,jammy-upda=
tes,now 1.65.0+dfsg0ubuntu1-0ubuntu0.22.04.1 amd64 [installed,automatic]<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">sbsigntool/jammy,now 0.9.4-2ubu=
ntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">screen/jammy,now 4.9.0-1 amd64 =
[installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">seabios/jammy,jammy,now 1.15.0-=
1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">secureboot-db/jammy,now 1.8 amd=
64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">sed/jammy,now 4.8-1ubuntu2 amd6=
4 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">sensible-utils/jammy,jammy,now =
0.0.17 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">sensu-go-agent/jammy,now 6.10.0=
-7172 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">session-migration/jammy,now 0.3=
.6 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">shared-mime-info/jammy,now 2.1-=
2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">shim-signed/jammy,now 1.51+15.4=
-0ubuntu9 amd64 [installed,upgradable to: 1.51.3+15.7-0ubuntu1]<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">sloccount/jammy,now 2.26-5.2 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">sqlite3-tools/jammy-security,ja=
mmy-updates,now 3.37.2-2ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">sqlite3/jammy-security,jammy-up=
dates,now 3.37.2-2ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ssh-import-id/jammy,jammy,now 5=
.11-0ubuntu1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ssl-cert/jammy,jammy,now 1.1.2 =
all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">strace/jammy,now 5.16-0ubuntu3 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">stress/jammy,now 1.0.5-1 amd64 =
[installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">subversion/jammy-security,jammy=
-updates,now 1.14.1-3ubuntu0.22.04.1 amd64 [installed]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">sudo/jammy-security,jammy-updat=
es,now 1.9.9-1ubuntu2.4 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">swaks/jammy,jammy,now 20201014.=
0-2 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">sysstat/jammy-security,jammy-up=
dates,now 12.5.2-2ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">systemd-sysv/jammy-security,now=
 249.11-0ubuntu3.7 amd64 [installed,upgradable to: 249.11-0ubuntu3.9]<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">systemd-timesyncd/jammy-securit=
y,now 249.11-0ubuntu3.7 amd64 [installed,upgradable to: 249.11-0ubuntu3.9]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">systemd/jammy-security,now 249.=
11-0ubuntu3.7 amd64 [installed,upgradable to: 249.11-0ubuntu3.9]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">sysvinit-utils/jammy,now 3.01-1=
ubuntu1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tar/jammy-security,jammy-update=
s,now 1.34+dfsg-1ubuntu0.1.22.04.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tasksel-data/jammy,jammy,now 3.=
68ubuntu2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tasksel/jammy,jammy,now 3.68ubu=
ntu2 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tcl-expect/jammy,now 5.45.4-2bu=
ild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tcl8.6/jammy,now 8.6.12+dfsg-1b=
uild1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tcpdump/jammy,now 4.99.1-3build=
2 amd64 [installed,upgradable to: 4.99.1-3ubuntu0.1]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tcsh/jammy,now 6.21.00-1.1 amd6=
4 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">telnet/jammy,now 0.17-44build1 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tex-common/jammy,jammy,now 6.17=
 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">texi2html/jammy,jammy,now 1.82+=
dfsg1-6 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">texinfo/jammy,now 6.8-4build1 a=
md64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">thunar-data/jammy,jammy,now 4.1=
6.10-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">thunar/jammy,now 4.16.10-1 amd6=
4 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tig/jammy,now 2.5.1-1 amd64 [in=
stalled]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">time/jammy,now 1.9-0.1build2 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tmux/jammy-security,jammy-updat=
es,now 3.2a-4ubuntu0.2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tnftp/jammy,now 20210827-4build=
1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">traceroute/jammy,now 1:2.1.0-2 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tree/jammy,now 2.0.2-1 amd64 [i=
nstalled]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">tzdata/jammy-security,jammy-sec=
urity,now 2023c-0ubuntu0.22.04.0 all [installed,upgradable to: 2023c-0ubunt=
u0.22.04.2]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ubuntu-keyring/jammy,jammy,now =
2021.03.26 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ubuntu-mono/jammy,jammy,now 20.=
10-0ubuntu2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ubuntu-release-upgrader-core/no=
w 1:22.04.15 all [installed,upgradable to: 1:22.04.16]<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ubuntu-standard/jammy,now 1.481=
 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ucf/jammy,jammy,now 3.0043 all =
[installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">udev/jammy-security,now 249.11-=
0ubuntu3.7 amd64 [installed,upgradable to: 249.11-0ubuntu3.9]<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">unattended-upgrades/jammy,jammy=
,now 2.8ubuntu1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">unzip/jammy-security,jammy-upda=
tes,now 6.0-26ubuntu3.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ureadahead/now 0.100.0-21 amd64=
 [installed,local]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">usb.ids/jammy,jammy,now 2022.04=
.02-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">usbutils/jammy,now 1:014-1build=
1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">util-linux/jammy,now 2.37.2-4ub=
untu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">uuid-dev/jammy,now 2.37.2-4ubun=
tu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">uuid-runtime/jammy,now 2.37.2-4=
ubuntu3 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">vim-common/jammy-security,jammy=
-security,jammy-updates,jammy-updates,now 2:8.2.3995-1ubuntu2.7 all [instal=
led]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">vim-nox/jammy-security,jammy-up=
dates,now 2:8.2.3995-1ubuntu2.7 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">vim-runtime/jammy-security,jamm=
y-security,jammy-updates,jammy-updates,now 2:8.2.3995-1ubuntu2.7 all [insta=
lled,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">vim-tiny/jammy-security,jammy-u=
pdates,now 2:8.2.3995-1ubuntu2.7 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">vpnc-scripts/jammy,jammy,now 0.=
1~git20210402-1 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">w3m/jammy-security,jammy-update=
s,now 0.5.3+git20210102-6ubuntu0.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">wamerican/jammy,jammy,now 2020.=
12.07-2 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">wbritish/jammy,jammy,now 2020.1=
2.07-2 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">wget/jammy,now 1.21.2-2ubuntu1 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">whiptail/jammy,now 0.52.21-5ubu=
ntu2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">whois/jammy,now 5.5.13 amd64 [i=
nstalled]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">wiggle/jammy,now 1.1-1 amd64 [i=
nstalled]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">wireless-regdb/jammy-security,j=
ammy-security,jammy-updates,jammy-updates,now 2022.06.06-0ubuntu1~22.04.1 a=
ll [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">wpasupplicant/jammy-updates,now=
 2:2.10-6ubuntu2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">x11-common/jammy,jammy,now 1:7.=
7+23ubuntu2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">x11-utils/jammy,now 7.7+5build2=
 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">x11-xkb-utils/jammy,now 7.7+5bu=
ild4 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">x11-xserver-utils/jammy,now 7.7=
+9build1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">x11proto-core-dev/jammy,jammy,n=
ow 2021.5-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">x11proto-dev/jammy,jammy,now 20=
21.5-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">x2goserver-common/jammy,jammy,n=
ow 4.1.0.3-5 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">x2goserver-extensions/jammy,jam=
my,now 4.1.0.3-5 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">x2goserver-x2goagent/jammy,now =
4.1.0.3-5 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">x2goserver-xsession/jammy,jammy=
,now 4.1.0.3-5 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">x2goserver/jammy,now 4.1.0.3-5 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xauth/jammy,now 1:1.1-1build2 a=
md64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xbitmaps/jammy,jammy,now 1.1.1-=
2.1ubuntu1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xdg-user-dirs/jammy,now 0.17-2u=
buntu4 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xemacs21-basesupport/jammy,jamm=
y,now 2009.02.17.dfsg.2-5 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xemacs21-bin/jammy,now 21.4.24-=
9ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xemacs21-mule/jammy,now 21.4.24=
-9ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xemacs21-mulesupport/jammy,jamm=
y,now 2009.02.17.dfsg.2-5 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xemacs21-support/jammy,jammy,no=
w 21.4.24-9ubuntu2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xemacs21/jammy,jammy,now 21.4.2=
4-9ubuntu2 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfce4-appfinder/jammy,now 4.16.=
1-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfce4-helpers/jammy,now 4.16.2-=
1ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfce4-panel/jammy,now 4.16.3-1 =
amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfce4-pulseaudio-plugin/jammy,n=
ow 0.4.3-1 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfce4-session/jammy,now 4.16.0-=
1ubuntu2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfce4-settings/jammy,now 4.16.2=
-1ubuntu2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfce4-terminal/jammy,now 0.8.10=
-1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfce4/jammy,jammy,now 4.16 all =
[installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfconf/jammy,now 4.16.0-2 amd64=
 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfdesktop4-data/jammy,jammy,now=
 4.16.0-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfdesktop4/jammy,now 4.16.0-1 a=
md64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfonts-base/jammy,jammy,now 1:1=
.0.5 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfonts-encodings/jammy,jammy,no=
w 1:1.0.5-0ubuntu2 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfonts-utils/jammy,now 1:7.7+6b=
uild2 amd64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfsprogs/jammy,now 5.13.0-1ubun=
tu2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xfwm4/jammy,now 4.16.1-1 amd64 =
[installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xkb-data/jammy,jammy,now 2.33-1=
 all [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xorg-sgml-doctools/jammy,jammy,=
now 1:1.11-1.1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xsltproc/jammy-security,jammy-u=
pdates,now 1.1.34-4ubuntu0.22.04.1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xterm/jammy,now 372-1ubuntu1 am=
d64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xtrans-dev/jammy,jammy,now 1.4.=
0-1 all [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xxd/jammy-security,jammy-update=
s,now 2:8.2.3995-1ubuntu2.7 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xz-utils/jammy,now 5.2.5-2ubunt=
u1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">yp-tools/jammy,now 4.2.3-3 amd6=
4 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ypbind-mt/jammy,now 2.7.2-2 amd=
64 [installed,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ypserv/jammy,now 4.1-2 amd64 [i=
nstalled,automatic]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">zip/jammy,now 3.0-12build2 amd6=
4 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">zlib1g-dev/jammy-security,jammy=
-updates,now 1:1.2.11.dfsg-2ubuntu9.2 amd64 [installed,automatic]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">zlib1g/jammy-security,jammy-upd=
ates,now 1:1.2.11.dfsg-2ubuntu9.2 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">zlib1g/jammy-security,jammy-upd=
ates,now 1:1.2.11.dfsg-2ubuntu9.2 i386 [installed,automatic]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">znc/jammy,now 1.8.2-2build5 amd=
64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">zstd/jammy,now 1.4.8+dfsg-3buil=
d1 amd64 [installed]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<br>
Yash<br>
<br>
<o:p></o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:Sundeep.Kokkonda@windriver.com">Kokkonda, Sundeep</a><br>
<b>Sent: </b>31 May 2023 12:19<br>
<b>To: </b><a href=3D"mailto:richard.purdie@linuxfoundation.org">Richard Pu=
rdie</a>;
<a href=3D"mailto:yashinde145@gmail.com">Yash Shinde</a>; <a href=3D"mailto=
:openembedded-core@lists.openembedded.org">
openembedded-core@lists.openembedded.org</a>; <a href=3D"mailto:Randy.MacLe=
od@windriver.com">
MacLeod, Randy</a><br>
<b>Cc: </b><a href=3D"mailto:Umesh.Kallapa@windriver.com">Kallapa, Umesh</a=
>; <a href=3D"mailto:Naveen.Gowda@windriver.com">
Gowda, Naveen</a>; <a href=3D"mailto:Shivaprasad.Moodalappa@windriver.com">=
Moodalappa, Shivaprasad</a>;
<a href=3D"mailto:Yash.Shinde@windriver.com">Shinde, Yash</a>; <a href=3D"m=
ailto:maya.madhavan@windriver.com">
Madhavan, Maya [US-ITAR]</a><br>
<b>Subject: </b>Re: [PATCH v14] Rust Oe-Selftest implementation</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Hello R=
ichard,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">We've (=
re)tested and reviewed the results of this patch on our local setup and tho=
se are &quot;PASSED&quot;.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">We will=
 discuss further with Randy and get back to community.<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Thanks,=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Sundeep=
 K.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<p class=3D"MsoNormal"><img border=3D"0" width=3D"463" height=3D"2" style=
=3D"width:4.8194in;height:.0208in" id=3D"Horizontal_x0020_Line_x0020_1" src=
=3D"cid:image002.png@01D99551.7542EC30"><o:p></o:p></p>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Richard Purdie &lt;richard.purdie@linuxfoundation.o=
rg&gt;<br>
<b>Sent:</b> 30 May 2023 19:29<br>
<b>To:</b> Yash Shinde &lt;yashinde145@gmail.com&gt;; openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> MacLeod, Randy &lt;Randy.MacLeod@windriver.com&gt;; Kallapa, Ume=
sh &lt;Umesh.Kallapa@windriver.com&gt;; Gowda, Naveen &lt;Naveen.Gowda@wind=
river.com&gt;; Kokkonda, Sundeep &lt;Sundeep.Kokkonda@windriver.com&gt;; Mo=
odalappa, Shivaprasad &lt;Shivaprasad.Moodalappa@windriver.com&gt;;
 Shinde, Yash &lt;Yash.Shinde@windriver.com&gt;<br>
<b>Subject:</b> Re: [PATCH v14] Rust Oe-Selftest implementation</span> <o:p=
></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal">CAUTION: This email comes from a non Wind River emai=
l account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Tue, 2023-05-30 at 16:21 +0530, Yash Shinde wrote:<br>
&gt; The patch implements Rust testing framework similar to other selftest,=
<br>
&gt; specifically the gcc selftest in OE. It uses the client and server<br>
&gt; based method to test the binaries for cross-target on the image.<br>
&gt; The test framework is a wrapper around the Rust build system as ./x.py=
<br>
&gt; test. It tests many functionalities of Rust distribution like tools,<b=
r>
&gt; documentation, libraries, packages, tools, Cargo, Crater etc.<br>
&gt; Please refer the following link for detailed description of Rust<br>
&gt; testing:-<br>
&gt; <a href=3D"https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool=
-tests">https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests</=
a><br>
&gt;<br>
&gt; To support the rust tests in oe-core, the following functions were<br>
&gt; added:-<br>
&gt; setup_cargo_environment(): Build bootstrap and some early stage tools.=
<br>
&gt; do_rust_setup_snapshot(): Install the snapshot version of rust binarie=
s.<br>
&gt; do_configure(): To generate config.toml<br>
&gt; do_compile(): To build &quot;remote-test-server&quot; for qemu target =
image.<br>
&gt;<br>
&gt; Approximate Number of Tests Run in the Rust Testsuite :- 18000<br>
&gt; Approximate Number of Tests that FAIL in bitbake environment :- 100-15=
0<br>
&gt; Normally majority of the testcases are present in major folder &quot;t=
est/&quot;<br>
&gt; It contributes to more than 80% of the testcases present in Rust test<=
br>
&gt; framework. These tests pass as expected on any Rust versions without<b=
r>
&gt; much fuss. The tests that fail are of less important and contribute to=
<br>
&gt; less than 2% of the total testcases. These minor tests are observed to=
<br>
&gt; work on some versions and fail on others. They have to be added, ignor=
ed<br>
&gt; or excluded for different versions as per the behavior.<br>
&gt; These tests have been ignored or excluded in the Rust selftest<br>
&gt; environment to generate success of completing the testsuite.<br>
&gt;<br>
&gt; These tests work in parallel mode even in the skipped test mode as<br>
&gt; expected. Although the patch to disable tests is large, it is very sim=
ple<br>
&gt; in that it only disables tests. When updating to a newer version of Ru=
st,<br>
&gt; the patch can usually be ported in a day.<br>
&gt;<br>
&gt; Tested for X86, X86-64, ARM, ARM64 and MIPS64 on CentOS release 6.10<b=
r>
&gt;<br>
&gt; Signed-off-by: pgowda &lt;pgowda.cve@gmail.com&gt;<br>
&gt; Signed-off-by: Vinay Kumar &lt;vinay.m.engg@gmail.com&gt;<br>
&gt; Signed-off-by: Yash Shinde &lt;yashinde145@gmail.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/lib/oeqa/selftest/cases/rust.py&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 86 +<br>
&gt;&nbsp; .../rust/files/rust-oe-selftest.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 2120 +++++++++++++++++<br>
&gt;&nbsp; meta/recipes-devtools/rust/rust-source.inc&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; meta/recipes-devtools/rust/rust_1.69.0.bb&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp;&nbsp; 7 +<br>
&gt;&nbsp; 4 files changed, 2214 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/lib/oeqa/selftest/cases/rust.py<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/rust/files/rust-oe-self=
test.patch<br>
<br>
I did put this into a build for testing on the autobuilder. It hasn't<br>
been running long and I can already see build failures such as:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/103/buil=
ds/6077">https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds=
/6077</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/build=
s/7200">https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7=
200</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40/build=
s/7190">https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7=
190</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/buil=
ds/2923">https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds=
/2923</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/37/build=
s/7200">https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/7=
200</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/48/build=
s/7217">https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/7=
217</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/104/buil=
ds/6080">https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds=
/6080</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/76/build=
s/7146">https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7=
146</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/61/build=
s/7184">https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/7=
184</a><br>
<br>
and there will likely be more.<br>
<br>
I'm finding this rather frustrating and am not sure how this was<br>
tested.<br>
<br>
Cheers,<br>
<br>
Richard<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ1PR11MB61294CC48FD3D027E729C03CEB4EASJ1PR11MB6129namp_--

--_004_SJ1PR11MB61294CC48FD3D027E729C03CEB4EASJ1PR11MB6129namp_
Content-Type: image/png; name="75FAF4736FEE453C986DA20FE5B14F0F.png"
Content-Description: 75FAF4736FEE453C986DA20FE5B14F0F.png
Content-Disposition: inline; filename="75FAF4736FEE453C986DA20FE5B14F0F.png";
	size=159; creation-date="Fri, 02 Jun 2023 07:25:11 GMT";
	modification-date="Fri, 02 Jun 2023 07:25:11 GMT"
Content-ID: <image002.png@01D99551.7542EC30>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAArYAAAADCAYAAABmm0wDAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAA0SURBVGhD7dZBCQAwDATB+DdVBVUQMSn0EQ8H
szAets7tAQCAdH9sS5IkSQpuxxYAALL1PDv4dOMlzxJLAAAAAElFTkSuQmCC

--_004_SJ1PR11MB61294CC48FD3D027E729C03CEB4EASJ1PR11MB6129namp_--

