Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B2BC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 10:38:57 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8421.1785234031294993351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 03:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=urvNndTi;
 spf=pass (domain: est.tech, ip: 40.107.130.27, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6QfuIb2YZvu55EMr60DWHD5JfY6//GH2PczvfTWMc2cH90kymfEfWzJ2oAjtqw0YCJd6exk9AUEO+/ik7t/Et50yd+6fuoRiiGy1Gww7A/UC0qTGix0McUn0Yax5ZMVCk9FwtwbMCGU89AHLrsI3a9XHf8CzEko3DH0/0/9gMDU+TtFIoRaPZOtv56lc16fo1m4YquUDc7hKXHaunLOUkLNxYGPqVdqJmRqdIthxQRhaRHrDeiVR1UDR6rvPDFZf82IB9bR6OHiDbKUvqozlMl4jwIL2mHtfEQCcSaO4Bc+Shi6xsp1A7+D2RxPXe0MNU7ZTUVIvf/Bwy3zclXKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgvtfKjZkzyZtULlREtrnLOrqydneeYqwDQC7+vXbio=;
 b=KVEnHbkJ2nhUfIuCMyTS/+SEkFluEXtKaQ7GbO+Ijo89o14xBvcGj1YulEkmb2t2QtspriZRSiSQuLn4j2T5lhuZfFGPpMlRhgKL3CKD8btc3OePZMU99i4EXjQ9K3HujoZhVhKkOI6Jp43WhD+Q1V10OFkdsbZiOYTMVyEWodzBngsnLpWYERPBN8loTJIwKA7MXZnBIiLJrPufgG/yzWWojnIMzILLttLNLPyJExy4EyJw5iIW23UsHV6v/fDbiNH/FtIPfslUhC4df6pf8W807ZQPCmitYmEB2MTJ0iDUv3jyff/2wSM5Qyj232mi9+1WhxjaIPvYdQkgmcq2Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgvtfKjZkzyZtULlREtrnLOrqydneeYqwDQC7+vXbio=;
 b=urvNndTid14tMV9olJcembrO5ScvX5LOKUGv6n8PcVCzmhooaafD8xnWOiEje3xjTrPGwGVW/W+qoVg9wFjPc/3H91Qh/Gh4dB9v1JMHv94XnDPlHIpAgzTQSxwfUvmZQyqjWaS2Mgy+viD+8Vm9Iv0TT1xhem+XWVH6aNHGNg+OqgfbFqpW1fPDFn06QdCkmAo9okf+gTI5qIyzGXy+7nuWbBOrF2KvhTSn5ILnBN9F+cnmxFuJDEQWLg+wz1HHLrz3ygC4RSriwFWMNheQe5eFOFcAKHGnVCOJxswzSrgd3b1+jQTPj4UQLFY0m0MFUmhL9Tezy18mqefkljC5nA==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by VI1P18901MB0814.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:123::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 10:20:26 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 10:20:25 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] glibc: stable 2.43 branch updates
Thread-Topic: [OE-core][wrynose][PATCH] glibc: stable 2.43 branch updates
Thread-Index: AQHdGeFQ7kSA/gpSMkqfW+gdGJOil7aBGrYAgAGmpt4=
Date: Tue, 28 Jul 2026 10:20:25 +0000
Message-ID: 
 <AS8P189MB16729B3C00DAD3E261B4D978B3CB2@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260722135216.1276081-1-adarsh.jagadish.kamini@est.tech>
 <DK98G8WF8V76.3D478P4216I9Y@smile.fr>
In-Reply-To: <DK98G8WF8V76.3D478P4216I9Y@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|VI1P18901MB0814:EE_
x-ms-office365-filtering-correlation-id: cec2167c-4359-47d2-c585-08deec91d738
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10070799003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 KQeEKQCY+04+dYEghyZE5QrsQUivOvMZnU6apieGkbDQPvZ4lZcSwA8LPEll6b9J5HxCCooiHWJCtPCjHVz7XslUbo8sSOo90dvHqCvdb8qIFKtc8mH0jRLZ3gaIRWqm6XlM/W/4uOCRCG3M5jqkjIB4RVWVsgOtK2Z8H4lcnBv3q0c2XPgX42wX5hTsA3SkHAwRPHziw/nonOk3jESSlh3iFiGiFhSE6EMmFj61/CG/NwYggTRFaR96BzxRaKpIDeTV1tP283Q0nciM9QLeyPdK8DufxP3HbBRZjvglJ3Trx55p+lj2gBMXR+c0ZzoNLFJPCyhKWTKyIKfon+PteUQ6r3luh/p4JIlkwOrJ4+FfVKZg174Oi5LOehjPS9Q3n+SxOBAu9QHIHwgmtZ9zcIjQWjZw7i62SOzSxCv1Czsj4Um2PttGSl3G4AWr0s800ND7S4GVPGM0CQC/CuvNOWzur5BFALwzzvvJGWZZZk0FrC58Ri2QAoP0CnQqmjaBCEY+jvQJe4jTXCZK4kFqBZPOX6iHp2ZUJCv15Az5HM1PQoDKO3Kbu7Kht7STb3mjBZu7HpHYYp9Dfv2ENCMEPTacFRtZX3TZi2Z98G7Ws8X15wNLdptUT6m3cVYqeJ20cakYYE4L829M+W9PrAyDHSTZkIk+rdX5y63xeNvoUBYOxIs1nEthrJZMqCX93xQvozsrK36eLH0Jt9n5SI5KhY1+UsFb88OtszIh/z+e4hk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10070799003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?RxAQP7+2JDAygvSxraxwBe9mmOEkj7ButZAyfZcDn2uFoCBWn8ErZ03OMR?=
 =?iso-8859-1?Q?ggPyN18LpYYvfkubrvkJHMY5QKic2T7MEw9kPjYHlUo9gwBcuKacNWSOu2?=
 =?iso-8859-1?Q?dUfeVm3G8u/eQUfKne+JIq+VvnZ41J9Mq/FX30OwVrvs8MbXsw6hrjrVgf?=
 =?iso-8859-1?Q?8ziY1liEBVk+fxp2Qlx94mX1cF+lkQKZvSh8lfmdec+F7B3Glv1i5VgQU3?=
 =?iso-8859-1?Q?yZA2c4LXfNu7lmAd0D/vCD7nF5fLprck3XQ635e2fdh1mOfYLyx7vVgckD?=
 =?iso-8859-1?Q?v7jnU0BpNNck4YOdr4luCqnlKtKKI+0iQ9PIxxeXtmmkR4QH46VmMUjRd2?=
 =?iso-8859-1?Q?Svtuzxlh1k6+cMKU+WyM7jCVdL6JvkE2zcfEq8fNhNjypRw0Rsq/Lc+l6T?=
 =?iso-8859-1?Q?nb3BGTcIACHnyviYlbeNyLAGgj7CgarOJfoqmMP1+P5fOz/GL7GNIUNiyw?=
 =?iso-8859-1?Q?oMYw6Ll59Pv24WrtjVo7wi12MelW75z/W8MudgLJJCU604pR8odHl/Xy5+?=
 =?iso-8859-1?Q?MKd1ilVGtCw7lo+qO0GYSK+PDRd0tUQsiIIulkxITum5gbuK3ae0x6iGQo?=
 =?iso-8859-1?Q?xdqFAFPrkQlwKHIKgsf56kZqItOSYjncGByDOO9Zx7RoG916eU0bhq8ZUo?=
 =?iso-8859-1?Q?8TVy9pE60wwRHNFX+9csoNDMO/KQ+qcJDkjOUlOLWg3yilKJJn8hIg9hlK?=
 =?iso-8859-1?Q?wBc3BhmI3xH2GVBuirymimkoLV+N5M+3a+oyhkXtc5qObNIZjnS77BoCZ7?=
 =?iso-8859-1?Q?K4I48EzuHnq5hSEDVPypphhLhfLeozoyxfercuI9a9sN8b6kgI4kc7KZyL?=
 =?iso-8859-1?Q?Dv0Ua4KVD6zOqxF5w9NLXE2cXsFWkV/mz5SGmQ3+vBgFR7Xp26wNEkkUDZ?=
 =?iso-8859-1?Q?B+j3k77FKH6Whz19hE6Ysfe7yPmPpDSbMby6Ru9TNAHT8xltDDdlzyJEEO?=
 =?iso-8859-1?Q?kO7uYiChT2DoKujnYcSfycHHEwQ+iWlImfVB7+UBbhD9hHgLKXHO6fbIeO?=
 =?iso-8859-1?Q?PRqY6B2DhlB4mV00BfbDfb+bjiKaNk8GNytJrgBATUfMsLYBf7jLBZ1Ajx?=
 =?iso-8859-1?Q?7wPHaWlXiJ7EHJrvv/zdbvYG+qdfMzXRyQcnV315G0It5id6cPPFCpUrSM?=
 =?iso-8859-1?Q?X+7FSjKi2BZGBKd0YvL/s+S/RX7MgxuZ0sdgYJdDi8JIbjo7qY1S2yhQF4?=
 =?iso-8859-1?Q?PKrJ37EQG78HBvmGs09CPpIP9x8eyv66L2ePIfanMvKvYmuUcVkuNPHeKm?=
 =?iso-8859-1?Q?u6M7GQ06/xvjaadvlYQgj/5K+1R4NEBG2G0dKxUzVsuyo2n8X+sFJf7e24?=
 =?iso-8859-1?Q?wWiVAE9WxWLQPVbAbP92f69WlkTUu5fQVswteQcsh1PwcsRQQkQWAS3N1u?=
 =?iso-8859-1?Q?pTLKmmxtZ+iXskgi5bq4cuKyZOkDdQoxtZwSL6nJg9K0uZuY3+I4qkOohi?=
 =?iso-8859-1?Q?E6lQsFHYGpEc+ES+gV9L3x0RE5u1g+tB215JSyAjM6X5YvO7+Tf7BFbHhN?=
 =?iso-8859-1?Q?Cd9wg4DTzfR/Xe1rr4X6nK4Wn1X5vSXuSfkzofH5NTHbDGJaDasOR5pwGj?=
 =?iso-8859-1?Q?XpTWJl819QWc8IGZhOqAQVyX4zFoLOL41EMj8GxV/jNaRAFOQ96aBo4LeD?=
 =?iso-8859-1?Q?la00uORLcvAdlJBIYrybioUPnwOAGGDjtmBU1GlwSYVROa06ehEec1Q91T?=
 =?iso-8859-1?Q?5bMddkeWzDMWPAX//jCvAD/T31ONoE5DYcsMs47BaKToXwRr2VNm7FMqak?=
 =?iso-8859-1?Q?U1HS0UtkppZATopfoQeV6C+gQS6pkSYS2HRG6WpE4zTHlNo3TxNQiE0yVj?=
 =?iso-8859-1?Q?tsBZOMApiyS7/Qb/KqiOJODt/AneDiW4UNr1g2fkOFq0/PgL07XmhTkexM?=
 =?iso-8859-1?Q?Zb?=
x-ms-exchange-antispam-messagedata-1: j93Wwcxm3h3/OIeVGJikYV0OVFn/wajiqmE=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cec2167c-4359-47d2-c585-08deec91d738
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 10:20:25.8249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aChN4GPey4ggH7U0Ay1sv1SiQgQUnV3nS/vB9ur45h7lMXiCJZtVWBzDVYJsb+F3rv00vXFwEeQspbsmspl0vOT9EI2slMpNfTEeqHTYQk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0814
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 10:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242179

=0A=
=0A=
=0A=
________________________________________=0A=
From: Yoann Congal <yoann.congal@smile.fr>=0A=
Sent: Monday, July 27, 2026 11:06=0A=
To: Adarsh Jagadish Kamini; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core][wrynose][PATCH] glibc: stable 2.43 branch updates=0A=
=0A=
On Wed Jul 22, 2026 at 3:52 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:=0A=
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>=0A=
>=0A=
> Update SRCREV to pull the latest fixes from the upstream=0A=
> release/2.43/master branch, including fixes for the following CVEs:=0A=
>=0A=
>   CVE-2026-5435  resolv: More types as unknown in ns_sprintrrf=0A=
>   CVE-2026-5450  stdio-common: Fix buffer overflow in scanf %mc [BZ #3400=
8]=0A=
>   CVE-2026-5928  libio: Fix ungetwc operating on byte stream [BZ #33998]=
=0A=
>   CVE-2026-6238  resolv: Fix buffer overreads in ns_sprintrrf=0A=
>   CVE-2026-6791  posix: Fix stack overflow in wordexp tilde expansion (BZ=
 34091)=0A=
>=0A=
> Commits between the old SRCREV (e9517114ac) and the new SRCREV (1c9988e52=
5):=0A=
>=0A=
> 1c9988e525 rtld: cache cpuid results on the stack for intel=0A=
> dae425b554 posix: Fix stack overflow in wordexp tilde expansion (BZ 34091=
, CVE-2026-6791)=0A=
> 8759917de5 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)=
=0A=
> 3a418da6a3 resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)=
=0A=
> e64ae5a591 resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)=
=0A=
> c9225a3e73 resolv: Check for inet_ntop failure in ns_sprintrrf=0A=
> c46f7b2fd6 resolv: Improve formatting of unknown records in ns_sprintrrf=
=0A=
> 1d7d1a16b0 resolv: Fix ns_sprintrrf formatting of class, type values (bug=
 34289)=0A=
> 349297a4eb resolv: Declare __p_class_syms, __p_type_syms for internal use=
=0A=
> fdf10644d6 hppa: Fix missing call to __feraiseexcept (BZ 34306)=0A=
> a6fa9a9594 arm: Save/restore VFP registers in PLT trampolines (BZ 34144, =
BZ 15792)=0A=
> fe0ccc9564 iconv: Suppress intermediate errors with //TRANSLIT (bug 34236=
)=0A=
> 22f3d24a6b Hurd: restore some SIOC ioctls=0A=
> a13ebdbc7e Hurd: comment ioctls which cannot currently compile=0A=
> 446f708e4c Hurd: comment PF_ROUTE/AF_ROUTE defines=0A=
> ced45fd472 Hurd: comment PF_LINK/AF_LINK defines=0A=
> 89cbf46693 elf: don't clobber ld.so.conf in tst-glibc-hwcaps-prepend-cach=
e [BZ #34210]=0A=
> 18b97b03b7 Rename __unused fields to __glibc_reserved.=0A=
> a47b5b2b3e math: Fix fma alignment when exponent difference is exactly 64=
 (BZ 34183)=0A=
> 4070d808be stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]=0A=
> 2890b35cd3 libio: Fix ungetwc operating on byte stream [BZ #33998]=0A=
>=0A=
> Testing Results:=0A=
>              Before    After    Diff=0A=
> PASS         6609      6611      +2=0A=
> XPASS        4         4          0=0A=
> FAIL         131       132       +1=0A=
> XFAIL        16        16         0=0A=
> UNSUPPORTED  554       555       +1=0A=
>=0A=
> Changes in testcases:=0A=
>=0A=
> testcase-name                                before  after=0A=
> resolv/tst-ns_sprintrr(new)                    -     PASS=0A=
> nptl/tst-robustpi7                            PASS    FAIL=0A=
>=0A=
> [Note: The uplift adds new testcases including resolv/tst-ns_sprintrr=0A=
> from commit 8759917de5, which passes, accounting for the PASS and=0A=
> UNSUPPORTED increases.=0A=
>=0A=
> nptl/tst-robustpi7 shows as PASS->FAIL, but it is a flaky test under=0A=
> QEMU user-mode emulation (PI robust-mutex handling). No nptl code was=0A=
> changed in the SRCREV range.]=0A=
>=0A=
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>=
=0A=
> ---=0A=
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-=0A=
>  meta/recipes-core/glibc/glibc_2.43.bb     | 1 +=0A=
>  2 files changed, 2 insertions(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc=0A=
> index af3db54cee..cf5a444095 100644=0A=
> --- a/meta/recipes-core/glibc/glibc-version.inc=0A=
> +++ b/meta/recipes-core/glibc/glibc-version.inc=0A=
> @@ -1,6 +1,6 @@=0A=
>  SRCBRANCH ?=3D "release/2.43/master"=0A=
>  PV =3D "2.43+git"=0A=
> -SRCREV_glibc ?=3D "e9517114acc77c0b8af9da6700107df16882b701"=0A=
> +SRCREV_glibc ?=3D "1c9988e52540c844928c6d93ff45305adc2c24a0"=0A=
=0A=
Hello,=0A=
=0A=
That would put wrynose ahead of master. Can you send a similar patch for=0A=
master so I can take it here as well?=0A=
=0A=
Thanks!=0A=
--=0A=
Yoann Congal=0A=
Smile ECS=0A=
=0A=
=0A=
=0A=
Hi,=0A=
I see that a patch was submitted to uplift master to 2.44 today.=0A=
=0A=
Thanks!=

