Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD82CD3447
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 11:39:08 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11632.1778240343497827039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 04:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=wlntxB3N;
 spf=pass (domain: est.tech, ip: 52.101.72.31, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPDQEPTuTgTESmqPWaiUciKTthHg1Jl6qsxK6oSC8bohyfmBT9co6/Hx0AzPA4SwsnlULn/T7TVLvZ62EjzvFBjfSEmYvXU/1B/N8ElMmi9VaKPJ9tMgzZmcRGM2+nJoVLS4O1mP6PeLX9xKsCpK8gcBTdpI3HkSGHY8z1klJlg5LgIAYaipxKCdwe6cGhsqfm0zmgTRLueJtOYuR7TyaQ3cBr2l8TqSCKZDiHp+heIsnaTFwyN/vEE3s3kuDCMCvV6elk1EsHmxQTlu2X2X2mqAlSWcfZkI6/lUN4gqSjvzp3NMusgp/TQ8kcgW8TOJZ5yJYIqJ71OklStq+8IfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cs2QA7pjiWeDSQ8yU9TC3hTHzvZorrbA252W00KJz7Q=;
 b=GRueO2crBLsMt8r7GMI9NIcEGWc7CKnrSP+aJuQMl+x62zoHAqJeTcH6ME44y0qB8+rFqc4HWWAIx+j6dw8lXwGFDZXpKZBePq0bl8CVw5DRmjwVOrLgqStmnCLYH7ZEARX6pnT7ok5A8mRQCr1uT8fPeHqHxrhUz9SdkvFxufmCU+21oAIZ0EBKr61P2cmITfD8asI4YT9f9xJuc4tEOfIdAQxWg1j7WiQ/3PAC85tNshu3Xap7HBfoyeiq71PKUR/EcaORsstl1L9I+E7suuZk+O8YhsjZfg4galBa0OlIJ28dKeyqkDdMA7+d9dTu4aZVNVDyDwKU0LJheMmH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cs2QA7pjiWeDSQ8yU9TC3hTHzvZorrbA252W00KJz7Q=;
 b=wlntxB3Nb5LAt1HOYaf/mHu6GZHWJmIW96/bQP9XD1ft2DPuCXVk1J4fB1RhN8En1JsPGAaQcvsfUFlQNpasAVZ9L6LHOqaoLpSVaM4wXAgrvMgvhhqvpNdKKKZqCKCwkD+Nj1BCWqo/meHIQIULiUQ5JQSMTZjTQJ9pTBSnQHp/98Z5GhXhCsDtGbvkH+0uW8mES/bKPBn1JU50iZkkWgI/ksffxUq6tLBV/mlfvDsT1Q5dgEyv3VRTL+eCUcWfM8gs+K0lO0QBycyJKSi23ksMQmSAIC6YsK7I0zmRXsAcSS4mDOwO4lENt/abj3ZsrrgNCR4DflgN2UtLLacB1Q==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PA1P189MB3419.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 11:38:58 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 11:38:58 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v2] libffi: add ptest support
Thread-Topic: [OE-core][PATCH v2] libffi: add ptest support
Thread-Index: AQHc3tTPooixy4Mp9kKxfi8YNOqX9LYD/QKAgAADnNI=
Date: Fri, 8 May 2026 11:38:58 +0000
Message-ID: 
 <GV2P189MB30056B6C051DCA22E9F005FBFE3D2@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260507085242.39646-1-pratik.farkase@est.tech>
 <20260508102405.16791-1-pratik.farkase@est.tech>
 <AS1PR10MB569736F5603EF1B021A44724FD3D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB569736F5603EF1B021A44724FD3D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|PA1P189MB3419:EE_
x-ms-office365-filtering-correlation-id: bb6f7de7-a4d8-4be1-0f04-08deacf664e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|3023799003|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: 
 WrW6yKpvHhXVN5n64b3XtGzm2ZaBwexSaXcFeA/8ALX/g3qYpcMLakaHGslwmaF7W49RK4BnwDVQv7X1mwPKynbszYcaTMk+qfp/ywfmIwzWT/cHnRZMnHwQky3p0JpW6+8l0Mxj2IdtykV/OWxXBGiKYtgvqcbEqIIkJoMEbm8FL5bGcU0qrVQ47ATYq3CuWZv8Th5+CRWY3lGbzN9MqR2ektGsBPolYXfSLrxYdYbtDmlsoXR7os7S2HzohfKTuJXKsp9zbAFD7BiEZqU/vF9obVTUMa/CQJViQ5qV0ivx7ev0LBWJhSj+9CFc4zLx/Tm4HSTEOjMlzuQrUb38OMF+Im528z3ox142l56YEY2jifpKOaksTZ/B/WwbLCCCiGcFPHvF79NZ1FMeGzMdFP1cRWA7rmGKG7zZCE5MOI3XGJyFZLs8KZFX9Jbr9V/+0ZfPzZ1M4MYNRS0N6V3esrn5dZNeDoe5YaG4F8fQPDWq79SmhyCbRZFnHE8uZjjdytkrEndd0sGt2x819FAqNBhUS8t6v6YvBtweYDGt0KqujHy3VmSsN1nIBXtj7xdbcJKrkcFzCDUNNP0AQnKpg28m4mIRDwhARQY902oInWOaSM5kFmFOTHGjqvlVzF1IfXicIMF6VcJ7bfhLhb8Zn7hbQaAMdwzPcnL5hhFAGaWEHPhacdlgubQRegGCIpwlprwebCUCLA2XE5kIXqK3RmXHysh2NYGFZmdKlPQm7Q7YNBIaaOahsCshWp9vurlB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(3023799003)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?frag5hNf+zLVKBZ8lFemj5lZWnBpsovNrRma9mStn7hjuVVPDdgJQA5sDCcR?=
 =?us-ascii?Q?35BmO9GYRNQ5EtHAmqAB9yvqKLEsTuQYRPg2adLXy+GXV+ypt4j9rhWe+P6u?=
 =?us-ascii?Q?uf2U2hJvAaw7UYYGCsGBJXKaNHWBpXdnrCRmZ51s1yOCrCyLoYi7TncVEGuG?=
 =?us-ascii?Q?njWnCsfZxGrqDk89bOeAtpLvvvKRv378AmAyQ9kSDVPbIZyvI8chptQPz7AD?=
 =?us-ascii?Q?/hB1hZwRDYRaPiu6MZyaM0ZhoHZ8s/pElnqhYFA34I1nzCqEGRbDuzf4QEFY?=
 =?us-ascii?Q?TxXrQUoFFGd+M2jc034ntsZ8yYtU0NL5WBybGNyuFDVFyonRPxaOonTw4gbv?=
 =?us-ascii?Q?wHP+WD1xp9lnw5yEf9JErpC0hDeGj0wr4YbWlw6EScFan3EkNTUpkCdXlKjj?=
 =?us-ascii?Q?MlN8VEmt12dRup45ayOrPtI9KqS8pss/u+RcNVou9tMqfbyqWc69r6D6KlPV?=
 =?us-ascii?Q?sVC/bI+pxGfcywdlCBf8ZaZU4P6cqLKNeOOWYL0CTON34qDoQ1+bpJOE6JHk?=
 =?us-ascii?Q?/XcP1jG102Jpw1tOZnXUY6CefNJ4PceCZB7CLFJO6qNrl3ShBXdzxQoau56N?=
 =?us-ascii?Q?6CT4wee5GJgLHsDt7jJo2W+wLj39ptDb1TjV1DlwVz+hZCOMoVI46LkE+SY/?=
 =?us-ascii?Q?Xqe4J2FlCIJ/5xO9GTKR3ae6DB+miDUc2QTFUe7+95U9P7Ocbg3X+g8IlvqM?=
 =?us-ascii?Q?bT1lDwkXPQWn04Ja3CdUegYNFtPtvNsIqQu1Y8elhBNpgDYgyR4mBOvOaNv7?=
 =?us-ascii?Q?i71XZETVpm2vwx1ZgUe1P9QRL0p9EnOk3V+zzm1ArKHzrOO4kU7+miAwmSux?=
 =?us-ascii?Q?AVindtuHQ1wXvtPO/fDwU+vHQh5xwUNKGkJ2bU1p+tzMHMKzHu96l+3Lhzv5?=
 =?us-ascii?Q?5ZMU/73HXvYrsdBmE28mZpwE3JBg382iK5jHtm0QeUkjMjJVCKqLKEsOFnoC?=
 =?us-ascii?Q?eokwKpxDlO4dIvREMII/lIAlGRIl7m9kxNQ2QRKqa+xTae+BW/PIwFI56A5e?=
 =?us-ascii?Q?B/KVr29yz5tCyLlz6mB7FBh3IFiUdlhlOmPBRIjEic82hE0Shgc2s7dyLRss?=
 =?us-ascii?Q?/7bda6UWeVcB2M4svgUv7DMHTEhh+qqqggLOx7LVVJeT3/bQhKikYP/BERHK?=
 =?us-ascii?Q?CTeomhgcP2KhGV7yYm1egMMajn0WxUfX3nyjfwefX5yVAPD3b92u5E9uzhnO?=
 =?us-ascii?Q?DpFyW6F/hTzK7w5trlGnVzSXFpFO8ISGlpL3JFQRcRn0sSNV9Vz7hl/2/POs?=
 =?us-ascii?Q?sqcWwhCIIh+iYxN8VgOG0fVVz2S/wXYZsWZr2DYGv1K4vDMCF+uYjAZ2Ymsd?=
 =?us-ascii?Q?ODaGGsL5XoW2bnGINJBaF7xpzvbFNQpxr9u14AxlIUvTNNQjLvTlLZ+p2/VU?=
 =?us-ascii?Q?oaANOwfy9vrxIzdDfViC8XO+mpFnteVcDOCHzGXaEDRmJOptOPgFwLWX2uZW?=
 =?us-ascii?Q?T4BpFQk8UpNx/nD/PRA4r66ohKEwIE5Mn0aQ++R9P7T5/g9eJxoTIrzz5KNs?=
 =?us-ascii?Q?hrdORca7KVWTGMmwDQfrdG/NbrFXabgNZx5k6/bGV8QPmjUElP8h22wnKf0C?=
 =?us-ascii?Q?tACALIVH0Jrl55cQ+liRwk21eAo5B9tsxmzQNvJ+rf+YxB9y7ONehStJBM16?=
 =?us-ascii?Q?TL31J5p3PFXBIZvv6eECcnAM1zKF6G/6+qSogna6pDCHRiaWGAXDn2lBuRys?=
 =?us-ascii?Q?b4VdYJGk35LanRBAIHv0Dt2VeJuMp5MNJiVky/Fb1NucuJsido13Mj0cSpdm?=
 =?us-ascii?Q?RvYcWGhOpw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6f7de7-a4d8-4be1-0f04-08deacf664e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 11:38:58.6949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tGIlwxd13CgceH5iD4Q7xEvnxmxddjHmpKHJ7WhN6nYROyEOufRNdDS8M2Efizt5vLt+Sh5gUnh6luTmbwZAtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3419
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 11:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236707

Hi Peter,

Good catch, thanks. v1 only had 2 tests (bhaible suite) which ran in ~29s,
but v2 added all upstream test suites (199 tests) pushing it to 349s.
I've moved libffi to PTESTS_SLOW in v3.

Best Regards,
Pratik

________________________________________
From: Marko, Peter <Peter.Marko@siemens.com>
Sent: Friday, May 8, 2026 1:25 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: RE: [OE-core][PATCH v2] libffi: add ptest support



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Pratik Farkase
> Sent: Friday, May 8, 2026 12:24 PM
> To: openembedded-core@lists.openembedded.org
> Cc: pratik.farkase@ericsson.com; Pratik Farkase <pratik.farkase@est.tech>
> Subject: [OE-core][PATCH v2] libffi: add ptest support
>
> Add ptest support for libffi using all upstream test suites: bhaible,
> call, closures, complex, go, and threads.
>
> Tests are compiled on-target against the installed libffi. Headers
> (including the generated fficonfig.h) and a linker symlink are installed
> in the ptest directory to avoid depending on libffi-dev.
>
> Tested on qemux86-64 with ptest-runner: 199 PASS, 0 FAIL, 2 SKIP (349s).
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
> Changes in v2 :
> - Include all upstream test suites instead of only bhaible
> - Install fficonfig.h required by ffitest.h
> - Add support for C++ tests (closures/unwindtest*.cc)
> - Add -lpthread for threads suite
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/libffi/libffi/run-ptest  | 53 +++++++++++++++++++
>  meta/recipes-support/libffi/libffi_3.5.2.bb   | 21 +++++++-
>  3 files changed, 74 insertions(+), 1 deletion(-)
>  create mode 100755 meta/recipes-support/libffi/libffi/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index 50b6a8a41e..79b541a199 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -34,6 +34,7 @@ PTESTS_FAST =3D "\

Comment for PTESTS_FASTS is: "ptests which take less than ~30s each",
While commit message suggests this takes 10x more (349s)

>      libconfig \
>      libconvert-asn1-perl \
>      libexif \
> +    libffi \
>      libgpg-error\
>      libksba \
>      libmd \
> diff --git a/meta/recipes-support/libffi/libffi/run-ptest b/meta/recipes-
> support/libffi/libffi/run-ptest
> new file mode 100755
> index 0000000000..9f72becda1
> --- /dev/null
> +++ b/meta/recipes-support/libffi/libffi/run-ptest
> @@ -0,0 +1,53 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: MIT
> +
> +PTEST_DIR=3D$(cd "$(dirname "$0")" && pwd)
> +CFLAGS=3D"-O2 -Wall -I$PTEST_DIR/include -L$PTEST_DIR/lib"
> +
> +# bhaible tests validate by comparing paired output lines
> +for t in test-call test-callback; do
> +    src=3D"$PTEST_DIR/testsuite/libffi.bhaible/$t.c"
> +    if gcc $CFLAGS -o "$PTEST_DIR/$t" "$src" -lffi 2>&1; then
> +        "$PTEST_DIR/$t" > "$PTEST_DIR/$t.out" 2>&1
> +        if ! LC_ALL=3DC uniq -u < "$PTEST_DIR/$t.out" | grep -q .; then
> +            echo "PASS: libffi.bhaible/$t"
> +        else
> +            echo "FAIL: libffi.bhaible/$t"
> +            cat "$PTEST_DIR/$t.out"
> +        fi
> +    else
> +        echo "SKIP: libffi.bhaible/$t"
> +    fi
> +    rm -f "$PTEST_DIR/$t" "$PTEST_DIR/$t.out"
> +done
> +
> +# Individual test programs from upstream dejagnu suites
> +for suite in libffi.call libffi.closures libffi.complex libffi.go libffi=
.threads; do
> +    dir=3D"$PTEST_DIR/testsuite/$suite"
> +    [ -d "$dir" ] || continue
> +
> +    extra=3D""
> +    [ "$suite" =3D "libffi.threads" ] && extra=3D"-lpthread"
> +
> +    for src in "$dir"/*.c "$dir"/*.cc; do
> +        [ -f "$src" ] || continue
> +        grep -q "dg-do run" "$src" || continue
> +
> +        name=3D$(basename "${src%.*}")
> +        case "$src" in
> +            *.cc) cc=3D"g++";;
> +            *)    cc=3D"gcc";;
> +        esac
> +
> +        if $cc $CFLAGS -o "$PTEST_DIR/$name" "$src" -lffi $extra 2>&1; t=
hen
> +            if "$PTEST_DIR/$name" 2>&1; then
> +                echo "PASS: $suite/$name"
> +            else
> +                echo "FAIL: $suite/$name"
> +            fi
> +        else
> +            echo "SKIP: $suite/$name"
> +        fi
> +        rm -f "$PTEST_DIR/$name"
> +    done
> +done
> diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb b/meta/recipes-
> support/libffi/libffi_3.5.2.bb
> index d3aa90d429..ec2b8032d3 100644
> --- a/meta/recipes-support/libffi/libffi_3.5.2.bb
> +++ b/meta/recipes-support/libffi/libffi_3.5.2.bb
> @@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dce4763670c5b7756000561f9af1ab178"
>
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
>             file://not-win32.patch \
> +           file://run-ptest \
>             "
>  SRC_URI[sha256sum] =3D
> "f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc"
>
> @@ -19,7 +20,7 @@ EXTRA_OECONF =3D "--disable-builddir"
>  EXTRA_OECONF:class-native +=3D "--with-gcc-arch=3Dgeneric"
>  EXTRA_OEMAKE:class-target =3D "LIBTOOLFLAGS=3D'--tag=3DCC'"
>
> -inherit autotools texinfo multilib_header github-releases
> +inherit autotools texinfo multilib_header github-releases ptest
>
>  do_install:append() {
>       oe_multilib_header ffi.h ffitarget.h
> @@ -30,3 +31,21 @@ do_install:append() {
>  MIPS_INSTRUCTION_SET =3D "mips"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +RDEPENDS:${PN}-ptest +=3D "packagegroup-core-buildessential"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/testsuite
> +    for suite in libffi.bhaible libffi.call libffi.closures libffi.compl=
ex \
> +                 libffi.go libffi.threads; do
> +        cp -r ${S}/testsuite/$suite ${D}${PTEST_PATH}/testsuite/
> +    done
> +
> +    install -d ${D}${PTEST_PATH}/include
> +    install -m 0644 ${B}/fficonfig.h ${D}${PTEST_PATH}/include/
> +    install -m 0644 ${B}/include/ffi.h ${D}${PTEST_PATH}/include/
> +    install -m 0644 ${B}/include/ffitarget.h ${D}${PTEST_PATH}/include/
> +
> +    install -d ${D}${PTEST_PATH}/lib
> +    ln -sf ${libdir}/libffi.so.8 ${D}${PTEST_PATH}/lib/libffi.so
> +}
> --
> 2.43.0


