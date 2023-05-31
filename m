Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC63EC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 06:50:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7954.1685515797160672814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 23:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Du0tgj1Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55152dde71=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34V5lYqY010246
	for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 23:49:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=RbHsvMKcs0lFWuTERMe9Ia7rVjQEST29nI+j4NcxcZ4=;
 b=Du0tgj1Qpn5NmjOthbontqLJ+EgxHmXOiz1CaNYqvxkPDVAZX84b5ZQ6CVHAufp1NDKp
 klLFM8+gLlfx/W9QjryasJ9Mokzq8v1Z/tOR0Q7tm8xJoVxjX6o9knxCVAhvB2KSPWz6
 wORVF5G0rFqhtakzQi1v9Qg+txEZOikchLg/VaRT2xiQBRUXgWh/CUAaYhc18zbFNHsm
 HnTAe5IzhsY5zzRZsgO0qsQULu3KKoItPOalSwSMK1v658Xwb/D93JvbwRYBxbUpbxtR
 H8OVblxJaZazsjRhplOKJG3X1+1VYf1qOQXe66xxjHQip/glZ2OBgrcQ29arkik/dmLJ ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjb2bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 23:49:56 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34V6nu8K032329
	for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 23:49:56 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjb2bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 23:49:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IETI/ou5APbiHapjgKinH3MlTCSSuTfrNqHDTM40lMY+F0SQHfxFH/qDzBryM5gFoLAjcIV65HG13i/qP3PIOiT3K+15ATN68NOl2CBokU/TYLdA3/yud6KEfiL2jLt5F8URT1Q7ucW+bkkayT2mjLHuLZDEnDOU4sJiojEW9xLKWleWHAOydqhS3VtMH/DHn4ZF+r9HrKvy6hjii55tCmaiyPj3ck8qHjFXClZfrGv4qxxqWZDsSkMdciJ+dAemMv1ccAOBW3OnqRwlh4y+OUpyhkQH3QhQ3Fk2TyJM2gMcr9orgVj2VYKVhtnFseH4ygmOr4bIHH+Y11nTEcNwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbHsvMKcs0lFWuTERMe9Ia7rVjQEST29nI+j4NcxcZ4=;
 b=YXwxnZMdsOd8ooCG0I4Y24odY0NZFES3oDbP348J/jz+HBgoJILC0SiTKRE9iqfhZGlvUd+mtQld0tsgiDkxKv8Yzo6CcdrwS9RyNYdBWFVROkq/ETFMH5bvHwmIkGM6kys/1WQXomIYUuuhqdCLsc/A6DXfjDFAiBTYLH0nrrLu9RO4pokE8Ix/s7xTGlC92c6Iz0yUQOGPxVkiAUbokQGSsU3NLOZ6K1Ak4OV3F8MTYaNMDiewqLifNUB7jdLFV+xG9OulcEWt2wN5xWmpkDaDxn70LXtzDXmSzMKd9fJtw6JbE1gqEr7RnuNlj4j3vs4Y9mHUGBUX0sLWbU5hDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 06:49:53 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::76ff:8b27:4b1f:a2bb]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::76ff:8b27:4b1f:a2bb%7]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 06:49:52 +0000
From: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Yash Shinde
	<yashinde145@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
CC: "Kallapa, Umesh" <Umesh.Kallapa@windriver.com>,
        "Gowda, Naveen"
	<Naveen.Gowda@windriver.com>,
        "Moodalappa, Shivaprasad"
	<Shivaprasad.Moodalappa@windriver.com>,
        "Shinde, Yash"
	<Yash.Shinde@windriver.com>,
        "Madhavan, Maya [US-ITAR]"
	<maya.madhavan@windriver.com>
Subject: Re: [PATCH v14] Rust Oe-Selftest implementation
Thread-Topic: [PATCH v14] Rust Oe-Selftest implementation
Thread-Index: AQHZkuTF5AlilvSSBU+FTRGvXiHjjK9y2A4AgAEYmSI=
Date: Wed, 31 May 2023 06:49:52 +0000
Message-ID: 
 <CH2PR11MB4470880E838BBC66386FA2A489489@CH2PR11MB4470.namprd11.prod.outlook.com>
References: <20230530105125.445622-1-yashinde145@gmail.com>
 <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
In-Reply-To: 
 <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR11MB4470:EE_|MW3PR11MB4524:EE_
x-ms-office365-filtering-correlation-id: 7a6ae823-73b0-4c77-388c-08db61a33c8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RRkqSbNIe90stJW97ugkt+gKEOHCev4pjy7IaKEIEwD6tqSzhSMrh05iTC3uz93q//GIkPkSCTbxRYmfpZwSbLLBoD4+M92LTEsxuucU2bhKyxQPoqyHMBHhFKJWrNqqWza/P9jBXtV3QeOpl91X+yYeq7pMXgDVX0djusvFHmTlxqfvnlNpfAE9A0szHFNuHVEyBllYccNdx3jcvoup264qW4fcpm15fVqJsKJhDrTDljHWr/PVLORYYIgBHU7kg1Ntyk08Ncxw1vdm36nj6grfi/pFFc4NMbl8h/EelzJ4PLaOcoB8KSJpvcbr0FMztAby/yrbyBcLJ4uB5ADKicgLtVlWOBeTLd6xIeJRYhKuVSs471aDUB8jf2dbu4qs+NVDyWiJcQVaspqkwJDGqtnrlbAxPobzjiyWAhlLw/oyKRVQ/2j5uCzBwog0WTE9QC9P7v3oYJPEAOmbXz83F2Zo9XOuOr6oMm8AOKWf6XLDZc4QimNwUs222keWf4fsJYpw+/EDO7q2z/PmjJYlTGziHvZZBIql6Jwua2+8lfXDGMbTOB4H5J1Xb7Bi57Z8iylpO/2+Uq8aF3banuix6W/A27ZxR+NJM35e1Y91ZX0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(366004)(39850400004)(451199021)(166002)(186003)(6506007)(9686003)(53546011)(2906002)(55016003)(83380400001)(38070700005)(4326008)(316002)(6636002)(71200400001)(66476007)(76116006)(66556008)(91956017)(66446008)(64756008)(66946007)(966005)(41300700001)(7696005)(478600001)(54906003)(122000001)(5660300002)(33656002)(19627405001)(38100700002)(110136005)(99936003)(107886003)(8676002)(86362001)(8936002)(26005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?+xSwdu5dCKUnOJ1Cs+Z/zedAczZDeg3/Y2Oa1MC8TMBrPJhPaH5H6P3ai0?=
 =?iso-8859-1?Q?bLeGV0qJg1WsIrOaKYh5yzmqIheMzZ1LJDNBeP2JRUmmCFnnexcbcDNkES?=
 =?iso-8859-1?Q?6l7Ht9gKVFPPW03/cRPjr6xgHFJF0ojcqjgsol0KPNP9GWZPqTpn2KpA0Y?=
 =?iso-8859-1?Q?EO7kPvYu8n4G7sPS2tiO73ycKAp9lo+3rHWGuBbDrqm/mq7C2/x7U22NR3?=
 =?iso-8859-1?Q?aL2mgfTMgZthIqlRvik6tzUx3b6N/sGQ/lUYtORpkTKxgkBdFujvOUfSr8?=
 =?iso-8859-1?Q?ie100Xn0h6OScQB9dWYzbhGHMrhs4/3c8+zkLHT1A5GdPUWr4EaxhCyGx4?=
 =?iso-8859-1?Q?mjmid1tjj2waxCcNALXMlMP6uugeCYI5MtXdoaTK8qbjlqAmP866C5tLH5?=
 =?iso-8859-1?Q?D9nGOoB48LhHYo5GQtMs73RwqkOTYGvg6LjkYP2LIX+JWCH6KxiciVfUKo?=
 =?iso-8859-1?Q?ssgGHWukhTH7xnAhTBlkI8ty/TY/1MGpd0IIWe6cVOo/CmlHK4pZYgv1/N?=
 =?iso-8859-1?Q?kUxkoLFqPbbMF5TeD2i5Ds1L0nFPyP1NpBAy9MqT7Y5f7jsRTIlHUwzcud?=
 =?iso-8859-1?Q?EF+4cxqiKFN8Xn8F9qMQoRjvuoqBQUJ+Ghv9MxFnBtJPdpUROuIjZqoTwt?=
 =?iso-8859-1?Q?s1S8ERbcgc5O81FFm82Vd26MyTsZt8JUh6Ykbu+6/9Q8wQ73Junrq05VrG?=
 =?iso-8859-1?Q?ao8/khrArf1o6dkGcD3EcvQVI1EaERcTe7ufEsWKBa1Tnxf7VMpZxDCQdv?=
 =?iso-8859-1?Q?nn+RhNDU//gtAf3ciURO8p4LZaKDfl2TFJIv5h6slfiEUJiWD9RWgQdlXk?=
 =?iso-8859-1?Q?T7mHVAOHB5fTkRCPYupezlu98goo7bwBuTFhvSeKDeTTs3VTzK3bRPVpu5?=
 =?iso-8859-1?Q?6ZyFGn5oRGMRWZB5boeBMIKAXIrbdVe07Q85X88odkIMmKVmz8R7fnd9cc?=
 =?iso-8859-1?Q?VXxpggHYy9nXAqjD+4qtis1B8W3qEaaxKyWhsTNMFTtN4Bs30ZVtCtI8Gd?=
 =?iso-8859-1?Q?EjvY9ACUpGBPylw8ZfZ64vmAhmE9Jr6Q3hGwGp/GUlSWpLDbcdo6y3yr0B?=
 =?iso-8859-1?Q?RBYGfooAvWyIXpugNj42wFcpd4OPIaz130YWAH1lWlAqa6jtLRafrt4M8p?=
 =?iso-8859-1?Q?7TeUXcTNdWRj5yO001cj/U2FZWqH8RQP509VUOGVCKDwBeQQ5CKzTqgMe9?=
 =?iso-8859-1?Q?IK7C364c47jDXHBk12nTt2U4CVuMVuY33D0x46p/y22Y/KveiHy6eWyBkI?=
 =?iso-8859-1?Q?VaqUWmMb+OZw5KGagLt6yLJ1aZQDuZEB2EKq0u3jByEEAi1/3ZQcKe0/Kp?=
 =?iso-8859-1?Q?j2SO3thGPBT4hb5IcAtsWcXlVIn6RoZJI9/OS1Of3Nnf2mwbt4Nwpp1vFZ?=
 =?iso-8859-1?Q?od46MdySmcEBlAsygxLfYVVbZ6rS7xsupmk1s9UEi93ctMluGi3H5vh8ZG?=
 =?iso-8859-1?Q?612TZKSLd7H2ijLVrGAm+7KX+ZU4VrGpS0EMtAHjF3Ori5j/Mgb/4O9KkD?=
 =?iso-8859-1?Q?vK3r5uzJE7WLa4AOh3oUTRFeqlzdqzB1rydYao213O2j2oJksrhK2zTSxT?=
 =?iso-8859-1?Q?cmuqj7R95rgL79DUSC01yNA1zMBN1tHfBrb2mwXlMtvXIbu65yECNQKAcs?=
 =?iso-8859-1?Q?ZSS0416xW1RV+oicwo36dXoI6dREZRtKVOdU4UGaZSxM3oBb2cmvB7qw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/mixed;
	boundary="_004_CH2PR11MB4470880E838BBC66386FA2A489489CH2PR11MB4470namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6ae823-73b0-4c77-388c-08db61a33c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 06:49:52.6150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QEckCIsPkBcXnmoo3uH2n3cEg+ELWLFV3jNwQW1S/87bqOcw5NhzbiAXXTHIm6a7w6Y+MtjIFKGCKaykVNIdLpd4gzMeGLONRhXl2/lYaOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
X-Proofpoint-GUID: pqwTFbEkSk4bmCBsGHaoXaBlGD2qviR7
X-Proofpoint-ORIG-GUID: PpxSPJ9c-B4h1MsWSAkGJGAk4eXgylR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_02,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 06:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181995

--_004_CH2PR11MB4470880E838BBC66386FA2A489489CH2PR11MB4470namp_
Content-Type: multipart/alternative;
	boundary="_000_CH2PR11MB4470880E838BBC66386FA2A489489CH2PR11MB4470namp_"

--_000_CH2PR11MB4470880E838BBC66386FA2A489489CH2PR11MB4470namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

We've (re)tested and reviewed the results of this patch on our local setup =
and those are "PASSED".
We will discuss further with Randy and get back to community.



Thanks,
Sundeep K.


________________________________
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

--_000_CH2PR11MB4470880E838BBC66386FA2A489489CH2PR11MB4470namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hello Richard,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
We've (re)tested and reviewed the results of this patch on our local setup =
and those are &quot;PASSED&quot;.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
We will discuss further with Randy and get back to community.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Sundeep K.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> Richard Purdie &=
lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> 30 May 2023 19:29<br>
<b>To:</b> Yash Shinde &lt;yashinde145@gmail.com&gt;; openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> MacLeod, Randy &lt;Randy.MacLeod@windriver.com&gt;; Kallapa, Ume=
sh &lt;Umesh.Kallapa@windriver.com&gt;; Gowda, Naveen &lt;Naveen.Gowda@wind=
river.com&gt;; Kokkonda, Sundeep &lt;Sundeep.Kokkonda@windriver.com&gt;; Mo=
odalappa, Shivaprasad &lt;Shivaprasad.Moodalappa@windriver.com&gt;;
 Shinde, Yash &lt;Yash.Shinde@windriver.com&gt;<br>
<b>Subject:</b> Re: [PATCH v14] Rust Oe-Selftest implementation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
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
-tests" data-auth=3D"NotApplicable">
https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests</a><br>
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
ds/6077" data-auth=3D"NotApplicable">https://autobuilder.yoctoproject.org/t=
yphoon/#/builders/103/builds/6077</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/build=
s/7200" data-auth=3D"NotApplicable">https://autobuilder.yoctoproject.org/ty=
phoon/#/builders/45/builds/7200</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40/build=
s/7190" data-auth=3D"NotApplicable">https://autobuilder.yoctoproject.org/ty=
phoon/#/builders/40/builds/7190</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/buil=
ds/2923" data-auth=3D"NotApplicable">https://autobuilder.yoctoproject.org/t=
yphoon/#/builders/117/builds/2923</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/37/build=
s/7200" data-auth=3D"NotApplicable">https://autobuilder.yoctoproject.org/ty=
phoon/#/builders/37/builds/7200</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/48/build=
s/7217" data-auth=3D"NotApplicable">https://autobuilder.yoctoproject.org/ty=
phoon/#/builders/48/builds/7217</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/104/buil=
ds/6080" data-auth=3D"NotApplicable">https://autobuilder.yoctoproject.org/t=
yphoon/#/builders/104/builds/6080</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/76/build=
s/7146" data-auth=3D"NotApplicable">https://autobuilder.yoctoproject.org/ty=
phoon/#/builders/76/builds/7146</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/61/build=
s/7184" data-auth=3D"NotApplicable">https://autobuilder.yoctoproject.org/ty=
phoon/#/builders/61/builds/7184</a><br>
<br>
and there will likely be more.<br>
<br>
I'm finding this rather frustrating and am not sure how this was<br>
tested.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH2PR11MB4470880E838BBC66386FA2A489489CH2PR11MB4470namp_--

--_004_CH2PR11MB4470880E838BBC66386FA2A489489CH2PR11MB4470namp_
Content-Type: application/octet-stream; name="oe-selftest-results.log"
Content-Description: oe-selftest-results.log
Content-Disposition: attachment; filename="oe-selftest-results.log";
	size=1658; creation-date="Wed, 31 May 2023 06:47:31 GMT";
	modification-date="Wed, 31 May 2023 06:47:36 GMT"
Content-Transfer-Encoding: base64

MjAyMy0wNS0zMCAyMDo1Mjo1NywyMDkgLSBvZS1zZWxmdGVzdCAtIElORk8gLSBDaGFuZ2luZyBj
d2QgdG8gL3dzL25ld190ZXN0XzEuNjkvYnVpbGQKMjAyMy0wNS0zMCAyMDo1Mjo1NywyMDkgLSBv
ZS1zZWxmdGVzdCAtIFdBUk5JTkcgLSBtZXRhLXNlbGZ0ZXN0IGxheWVyIG5vdCBmb3VuZCBpbiBC
QkxBWUVSUywgYWRkaW5nIGl0CjIwMjMtMDUtMzAgMjA6NTM6MDQsMDc5IC0gb2Utc2VsZnRlc3Qg
LSBJTkZPIC0gQWRkaW5nIGxheWVyIGxpYnJhcmllczoKMjAyMy0wNS0zMCAyMDo1MzowNCwwNzkg
LSBvZS1zZWxmdGVzdCAtIElORk8gLSAJL3dzL25ld190ZXN0XzEuNjkvbWV0YS9saWIKMjAyMy0w
NS0zMCAyMDo1MzowNCwwNzkgLSBvZS1zZWxmdGVzdCAtIElORk8gLSAJL3dzL25ld190ZXN0XzEu
NjkvbWV0YS15b2N0by1ic3AvbGliCjIwMjMtMDUtMzAgMjA6NTM6MDQsMDc5IC0gb2Utc2VsZnRl
c3QgLSBJTkZPIC0gCS93cy9uZXdfdGVzdF8xLjY5L21ldGEtc2VsZnRlc3QvbGliCjIwMjMtMDUt
MzAgMjA6NTM6MDQsMDgxIC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gUnVubmluZyBiaXRiYWtlIC1l
IHRvIHRlc3QgdGhlIGNvbmZpZ3VyYXRpb24gaXMgdmFsaWQvcGFyc2FibGUKMjAyMy0wNS0zMCAy
MDo1MzoxMCwzNDMgLSBvZS1zZWxmdGVzdCAtIElORk8gLSBBZGRpbmc6ICJpbmNsdWRlIHNlbGZ0
ZXN0LmluYyIgaW4gL3dzL25ld190ZXN0XzEuNjkvYnVpbGQtc3QvY29uZi9sb2NhbC5jb25mCjIw
MjMtMDUtMzAgMjA6NTM6MTAsMzQ0IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gQWRkaW5nOiAiaW5j
bHVkZSBiYmxheWVycy5pbmMiIGluIGJibGF5ZXJzLmNvbmYKMjAyMy0wNS0zMCAyMDo1MzoxMCwz
NDQgLSBvZS1zZWxmdGVzdCAtIElORk8gLSB0ZXN0X2NoZWNrIChydXN0LlJ1c3RTZWxmVGVzdEJh
c2UpCjIwMjMtMDUtMzAgMjI6MDI6MzUsMTMzIC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gIC4uLiBv
awoyMDIzLTA1LTMwIDIyOjA0OjQ5LDQ3MCAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KMjAyMy0wNS0zMCAyMjowNDo0OSw0NzAgLSBvZS1zZWxmdGVzdCAtIElORk8gLSBSYW4g
MSB0ZXN0IGluIDQzMDIuODY2cwoyMDIzLTA1LTMwIDIyOjA0OjQ5LDQ3MCAtIG9lLXNlbGZ0ZXN0
IC0gSU5GTyAtIE9LCjIwMjMtMDUtMzAgMjI6MDU6MDgsNzE4IC0gb2Utc2VsZnRlc3QgLSBJTkZP
IC0gUkVTVUxUUzoKMjAyMy0wNS0zMCAyMjowNTowOCw3MTggLSBvZS1zZWxmdGVzdCAtIElORk8g
LSBSRVNVTFRTIC0gcnVzdC5SdXN0U2VsZlRlc3RCYXNlLnRlc3RfY2hlY2s6IFBBU1NFRCAoNDE2
NC43OXMpCjIwMjMtMDUtMzAgMjI6MDU6MDgsODA5IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gU1VN
TUFSWToKMjAyMy0wNS0zMCAyMjowNTowOCw4MDkgLSBvZS1zZWxmdGVzdCAtIElORk8gLSBvZS1z
ZWxmdGVzdCAoKSAtIFJhbiAxIHRlc3QgaW4gNDMwMi44NjZzCjIwMjMtMDUtMzAgMjI6MDU6MDgs
ODA5IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gb2Utc2VsZnRlc3QgLSBPSyAtIEFsbCByZXF1aXJl
ZCB0ZXN0cyBwYXNzZWQgKHN1Y2Nlc3Nlcz0xLCBza2lwcGVkPTAsIGZhaWx1cmVzPTAsIGVycm9y
cz0wKQo=

--_004_CH2PR11MB4470880E838BBC66386FA2A489489CH2PR11MB4470namp_--

