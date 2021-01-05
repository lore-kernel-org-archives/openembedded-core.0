Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.50])
 by mx.groups.io with SMTP id smtpd.web08.739.1609817472371450265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 19:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XV0b9X9b;
 spf=pass (domain: windriver.com, ip: 40.107.94.50, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5YMXJkYUiUxL6qvTmvUXoKMAVEcSSIAthUXooXGaaSKCvJKKjCOGSPpLPkSz//1LYYm6BuQA+ByVQFvykmCa4qzfUQIiJKoSGFlZijl/+DZTX3PbEcm8NQkNhsJw6TyKF6KoLhTeh3rpmhNsK9snDfhRfzgKHho3Fc4+uXVVGLwL9tGganXLh9Hnt2WI53QUKwW+KQ8ZS+q1lUs7RSpMQWaevNxO1Tm37BiFbN6oNguOHHdNiAEFKiQjYHIaueDl3Vkqfv/693+KKqcYSQfOfGC2J4tSvVj0LN4GWd42yxIhHRfe2gogB6qfDsgYSSNuJLBQF4EMiiUgjQ/ihksxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+qa+9750Uh8MjGsAzuxz3+JPUNrxyPaz2m+NUlyV+Q=;
 b=LobjZw/PBRA4cyzyBoLr/B+abyX1IhQOEjLBXtvj9kexPHTo30dlokYxMtHRba9Y8i1klYWcnqmFBrNyg8tWEyZ3nbDJriR7Rmj8hJUOGHXqSaT3MiM8fwBpJzmh8ste5cnKlCyF9robBErUSqeVEn/QP6Q9TlTGz69Mgvus09ReIPWXWj2FyUnExRsMb2TZz1ZOsuUPbK2+DWm3Vtf0sL8fP6ZFLhSuhR4cw/lek1WI5q1L8xgn+DbcbqB+GqLoHwU1aYXbHKJBLljm82AkLzhQIsG9zLqEoAOr7JG/pUB05yj1Lq0OwCFia5mN3d1cLFtJAUdemcMYDrGWmNCOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+qa+9750Uh8MjGsAzuxz3+JPUNrxyPaz2m+NUlyV+Q=;
 b=XV0b9X9brfKOwXUdAvcwzoEPk7qYjuTh+bLrb9D3+iOKOjYKq2O59jNN7D+cqQ/ZzwsKs9Xioacqkp2h/sTf8FoVir6YL+3NW74DLnMpkjqNU61jgiqueWjyf+UOK4TsUB2oTRcW00giBSTBhfKXxGwojGjM2ONa+Gds3wxyq8k=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 03:31:10 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781%7]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 03:31:10 +0000
Subject: Re: [OE-core] [PATCH] openssl: support for building nativesdk of mingw
To: Joshua Watt <jpewhacker@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
CC: Joshua Watt <JPEW.hacker@gmail.com>
References: <20210104081324.32745-1-changqing.li@windriver.com>
 <121a341052f289cb7d3233dcdcb1e62fc0473284.camel@linuxfoundation.org>
 <4388e191-88a1-dd64-beb3-06b1abefd4e9@gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <06e7c18b-3436-a842-e900-b6fb9a20e052@windriver.com>
Date: Tue, 5 Jan 2021 11:31:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <4388e191-88a1-dd64-beb3-06b1abefd4e9@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::8) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by SJ0PR05CA0033.namprd05.prod.outlook.com (2603:10b6:a03:33f::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.2 via Frontend Transport; Tue, 5 Jan 2021 03:31:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 508afadc-116f-4020-b846-08d8b12a585b
X-MS-TrafficTypeDiagnostic: SA2PR11MB4876:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB4876083C9194DA5A80385AE882D10@SA2PR11MB4876.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wlbmgB4eaCVk6bLEtRt8REOagccXtAeyC2mqHmGRYi0hiVs/S2TfAuAeSZdGMixFb+kK1d+kML53e9ENnmiE5ZquzBuPNGas1EoE5693i7+9MOb8m4AkyEM+5GSdHZy8tWfIRCONmtcvlIFZ4Q/hEhFMjiy91MhZX4bxBGBCtCbdeV8+vBueEG8vz+Bt9YKgoCD4X+OOIWgFXLEc2oGtSaFKhlxvxZQ5UH7B9vGhTkU80OCo2kwbRzmFSbzOuZ4NXAKphZ8rDKOD2hsojVr4a0LLaeDVX1tt/e4M9hGpAVVQrkFCZ1y5l7CO9TNd7EPOakGZFUJ63PAXtjmUl5ScAgEJqDOjq+sqQ2wt/Oh3fEIUigDtIzjTohdI7+YMP/JrzcqBNpF30JajLaRg3UkAoCGD9LmEABj3WPW/VYum8vM9g/GZVFFy1vHObZ9ZQIw07lgKsO+CYd0I8s1FiTkK2Cue2wo9kPHSTgWTlAYg9tDe0v+SRkBcn2h3CN5SC59YdY1E6rgbi1DytcI2laMtSHrh87aAesAGNZA7etONtBSlg+XcF4K+xn9Cv2dRElwr8zyRbfAUV2FComyXBHzp1A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39850400004)(136003)(6706004)(66946007)(26005)(36756003)(16526019)(4326008)(83380400001)(16576012)(316002)(478600001)(110136005)(6486002)(53546011)(66476007)(186003)(66556008)(5660300002)(6666004)(2616005)(31686004)(44832011)(956004)(31696002)(86362001)(8676002)(8936002)(52116002)(2906002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?7PaGRfZG5ubFClUEqjeipaz9Zj1klE68Q7e0JSOkiOcf6sSLPuFx99zoQtMK?=
 =?us-ascii?Q?QJREToXh0jDjI9N3f9hELzs5cYEwbfb5XyE7X8HfLZOXWOf8jykQ6rxZ9UEg?=
 =?us-ascii?Q?rwvjz9eFV4BdTSQ5EM1DOFrZ92/OnoItfbOfVdNGLCbdZtlXbnvtaKmZMGID?=
 =?us-ascii?Q?IjiEuQxyQTvAQ3VurWLUGbtKCFU9j1s8ft5KvoNGHPAonmwT7BoPROz1En79?=
 =?us-ascii?Q?5Qw3+J5YgMLn3D6AGccQE0MPNeiuyL+coOZradIui0b1ZBawHZjUrsQdy0KI?=
 =?us-ascii?Q?kux7XI+E8+nFaRsLQljwxQ0Osu4BGksLyU4qQRZsYWXG383L4rx1HhJyzUta?=
 =?us-ascii?Q?c3AwspqUnB/ZT40qIlr2s26X7sqq5gJjgyiG8vb4fHyF1k7ozDG1LY0Km6LH?=
 =?us-ascii?Q?prCs1yZ/7L/EbWCO6uigxoecPLc+IXGEId9QiRlpPbzpd+VpbDE8iQxMAUlZ?=
 =?us-ascii?Q?Mr6qoYVoAx+lwBYidaHgPAqvnSmYDYxuAMx1dXdF0Q3LEv04+F3yw6DmrgO9?=
 =?us-ascii?Q?/yfWnNiRwSUSFIXR41VWtWR67A8J6+j8fNry+2UsbNR/k4/art1xpYjkS/W2?=
 =?us-ascii?Q?AKiAH+xc2NryC2IL0cr16Pdl/cPjIRvShswPSptM3c2CKRIuhL9PG4kOSPs6?=
 =?us-ascii?Q?Q6oQuPF6Wkm0sDemaDAAVASq5Ihea65WtdlVu64g5xrXPS6NhNi96MbsJG6q?=
 =?us-ascii?Q?MQCes/I+A9DbhBv1HPQ2OiIq9x+9oVy67+GnwIsHCeWFfkEsp/o+hJwc20pM?=
 =?us-ascii?Q?OfkY1jPd0y7GC6Rh2VjuHVAiobVOy8UTegJZECLf5Qmwarm6KNy2NGQCWwsE?=
 =?us-ascii?Q?v7d11UbedH+2zDfPRYm45AYQyFRrqvCkLYda9k/jIGNWS97sTawPc94UGpQJ?=
 =?us-ascii?Q?W5JyKwwHsbrqL8Qm7BHK8I4nH3Yz8pg2SQu/etYyQ5aKJ58glkK9GCl22B0J?=
 =?us-ascii?Q?2GvHDRImqUysyHqf2VTsaIOPY+FmZJIvItEYWCBXow2yYIz8QgDy0x7S9yt1?=
 =?us-ascii?Q?vteB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 03:31:10.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 508afadc-116f-4020-b846-08d8b12a585b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vA+4+tylT9UXy/K9dl+6gkpXFOSgH2vGszK/IhEL5UHAUVfbd6PK//AbvPL82UtP4G2spXT6+GT2pDJu8TtTOgDtrbiScKWJpsv/YBfSCpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 1/4/21 10:07 PM, Joshua Watt wrote:
>
> On 1/4/21 5:40 AM, Richard Purdie wrote:
>> On Mon, 2021-01-04 at 16:13 +0800, Changqing Li wrote:
>> * add support for mingw32
>> * Engines are installed in a slightly different path, which is
>> =C2=A0=C2=A0 urgly, patch it to make the path shorter
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>> =C2=A0=C2=A0...ile.tmpl-don-t-add-prefix-for-libdir.patch | 32 +++++++++=
++++++++++
>> =C2=A0=C2=A0.../openssl/openssl_1.1.1i.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
9 ++++--
>> =C2=A0=C2=A02 files changed, 39 insertions(+), 2 deletions(-)
>> =C2=A0=C2=A0create mode 100644 meta/recipes-connectivity/openssl/files/0=
001-unix-
>> Makefile.tmpl-don-t-add-prefix-for-libdir.patch
>>
>> diff --git a/meta/recipes-connectivity/openssl/files/0001-unix-
>> Makefile.tmpl-don-t-add-prefix-for-libdir.patch b/meta/recipes-
>> connectivity/openssl/files/0001-unix-Makefile.tmpl-don-t-add-prefix-
>> for-libdir.patch
>> new file mode 100644
>> index 0000000000..028431b1b2
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssl/files/0001-unix-Makefile.tmpl-
>> don-t-add-prefix-for-libdir.patch
>> @@ -0,0 +1,32 @@
>> +From 8fe5c9421acfaff35b637e7ad55d1df598bb7081 Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Tue, 22 Dec 2020 09:22:10 +0800
>> +Subject: [PATCH] unix-Makefile.tmpl: don't add prefix for libdir
>> +
>> +we pass libdir to Configure, don't use prefix again to
>> +avoid engineer dir set to:
>> +/opt/poky/3.2+snapshot/sysroots/x86_64-w64-
>> mingw32/usr/opt/poky/3.2+snapshot/sysroots/x86_64-w64-
>> mingw32/usr/lib/engines-1_1
>> +
>> +Upstream-Status: Inappropriate[oe-specific]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + Configurations/unix-Makefile.tmpl | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-
>> Makefile.tmpl
>> +index bbafb98..eecb63e 100644
>> +--- a/Configurations/unix-Makefile.tmpl
>> ++++ b/Configurations/unix-Makefile.tmpl
>> +@@ -244,7 +244,7 @@ LIBDIR=3D{- our $libdir =3D $config{libdir} || "lib=
";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 File::Spec=
::Win32->file_name_is_absolute($libdir) ? "" :
>> $libdir -}
>> + ENGINESDIR_dev=3D{- use File::Spec::Win32;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 our $enginesdir =3D
>> +- File::Spec::Win32->catdir($prefix,$libdir,
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 File::Spec::Win32=
->catdir($libdir,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "engi=
nes-
>> $sover_dirname");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 our ($enginesdir_dev, $enginesdir_d=
ir,
>> $enginesdir_file) =3D
>> + File::Spec::Win32->splitpath($enginesdir, 1);
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
>> b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
>> index c63ba3c8e7..9465166ab1 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
>> @@ -22,6 +22,9 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-
>> ${PV}.tar.gz=C2=A0\
>> =C2=A0=C2=A0SRC_URI_append_class-nativesdk =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://environment.d-openssl.sh=C2=A0\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> +SRC_URI_append_mingw32_class-nativesdk =3D " \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://000=
1-unix-Makefile.tmpl-don-t-add-prefix-for-
>> libdir.patch=C2=A0\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 =C2=A0=C2=A0SRC_URI[sha256sum] =3D
>> "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
>> =C2=A0 @@ -116,6 +119,9 @@ do_configure () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mingw32-x86_64)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0target=3Dmingw64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0;;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mingw32-i686)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0target=3Dmingw
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0;;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0esac
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0useprefix=
=3D${prefix}
>> @@ -198,8 +204,7 @@ FILES_openssl-conf =3D "${sysconfdir}/ssl/openssl.cn=
f
>> \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir=
}/ssl-1.1/openssl.cnf* \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0=C2=A0FILES_${PN}-engines =3D "${libdir}/engines-1.1"
>> -# ${prefix} comes from what we pass into --prefix at configure time
>> (which is used for INSTALLTOP)
>> -FILES_${PN}-engines_append_mingw32_class-nativesdk =3D "
>> ${prefix}${libdir}/engines-1_1"
>> +FILES_${PN}-engines_mingw32_class-nativesdk =3D "${libdir}/engines-1_1"
>> =C2=A0=C2=A0FILES_${PN}-misc =3D "${libdir}/ssl-1.1/misc ${bindir}/c_reh=
ash"
>> =C2=A0=C2=A0FILES_${PN} =3D+ "${libdir}/ssl-1.1/*"
>> =C2=A0=C2=A0FILES_${PN}_append_class-nativesdk =3D " ${SDKPATHNATIVE}/en=
vironment-
>> setup.d/openssl.sh
>>
>> I'm not really sure we want this kind of patch in OE-Core, it might be
>> more suited to meta-mingw. I suspect it will be a bit of a maintenance
>> nightmare there too though. Adding Joshua to cc to see if he has any
>> thoughts...
>
> Can you provide some background on why openSSL is needed in the SDK?=20
> It would help with making a decision.

Actually,=C2=A0 I don't have special background. Just know should be a=20
request from some customer that bitbake nativesdk-openssl cannot build=20
success.

Joshua,=C2=A0 I have send a patch to meta-mingw layer,=C2=A0 please review =
it=20
there if we need this patch. Thanks.

>
>
>>
>> Cheers,
>>
>> Richard
>>
>>
