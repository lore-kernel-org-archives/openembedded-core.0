Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EADCD5BA4
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 08:30:53 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32178.1779352245448280979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 01:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=WmZ981vl;
 spf=pass (domain: est.tech, ip: 52.101.83.57, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejqlbMx5ABh1fClkgrS/gBbFte7pKf3+XmQf3sk0B1ksbCGtzwx4URjog6qSPRRPTlrodUJjnbo2Ux6uvIqRh8/VTCJS+/vmukVeK6ppdsOX6j/cMPOY8BNKpMk/hpW092TfGAMvX+I8jF0VDWuYvgVYuo2aN+B7yFLX/u4Pz4rPI2MvaGu5xAx9JdRWCMDTxGF1wxHO7OQGUq58jt31oi0eLML0UR+mUdNH04S3pYeg29cZ01B9mYaO/4Otmy0+ILkTdfqdOzEat2N6h/IMFWgoSgIbUjil6saH8zOAbsl7D6sgKR4opVEvHE95syqibxqTc1At0Dojq++5VuuxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyJI5BY+FzBzINoFmAo/awAZjTS2vriGCmzzoighZa0=;
 b=GyhuwwURMY76CyDeVWuu3py/vdPHmlxYiBEceOjRkdGWBWWzsKEJ1quI6vUWsCMh+nkOMOkCkZt07NS7LsrZZPZEG8fhdGIi8gdQw5iVS8vYF8qbyLe7rNsgCUprOkKrzzgxDGOByHqJdKh9sVqDv+n6Hrqtd0Tl1wsEF+IL20j73nl9Wt8K5APxZWfck4j6F7QWNenZDY/+TI5dhrs0xzrADoawqje5NOfLCYpqUIWpTAO8emDtDtkBpIFuChYcg46BIkyPYi3eKGSUmEWuYnyyqrBzFS07gcIHKbcSpeBy/rDp2jxzelVoSLaakE1P7C6T/+3jxeTTdrrW+5l9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyJI5BY+FzBzINoFmAo/awAZjTS2vriGCmzzoighZa0=;
 b=WmZ981vlSGj8INnVtGRDcOlgrgYJz6z30PgqIAXGn0V0FHnz773mB2R4/+QtbuuIP/S3nikB0XpPpbmCl8kz9ohA57tHRqdvEaO9udOQ+E3lUu6A4tKl0ijIq7QCoLzm/dQvJ7/Ih+QFcfT2G/Jb7an7U2u2tuoC3NzPK6c+jTo9qI6FaF/ZwKSsi9IjXxQrJQkU1UOAlHuwkWdaPW0xm90JYgriIMgQaUs5WAakJzw1E11A1i9zn4gfcHmD8djoAzdyw9SaIE0/HHMAO8dZEbWx0F75pnetKTroZ4LU0lTeo12+0RqWoSNes2FABEWFU5jxhkLmw3J6oOyURuWIUQ==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DU4P189MB3449.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 08:30:40 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 08:30:40 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v4] libffi: add ptest support
Thread-Topic: [OE-core][PATCH v4] libffi: add ptest support
Thread-Index: AQHc4txRuuzUWrKZx0q48H1Z21DPzLYXHmCAgAESFjM=
Date: Thu, 21 May 2026 08:30:40 +0000
Message-ID: 
 <PA3P189MB323934667AF346812F21BEBFFE0E2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20260508102405.16791-1-pratik.farkase@est.tech>
 <20260513132756.27283-1-pratik.farkase@est.tech>
 <C60FBD30-1468-4A2C-BCA1-E4C713F253C5@arm.com>
In-Reply-To: <C60FBD30-1468-4A2C-BCA1-E4C713F253C5@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|DU4P189MB3449:EE_
x-ms-office365-filtering-correlation-id: 2a0e7135-c539-432e-d223-08deb7133e2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003|38070700021|3023799007|4143699003|11063799006;
x-microsoft-antispam-message-info: 
 ihf19sEWQR5lVxLGlNo8OaCUyB+5PIGawr/brkUldQpfZ7vT4AX1wTmOB2m58QIBC8KU/zrVww5f+B29q+lF2Gs5fxSNd5Vffy6iErCjOMLjL7nnlA6GTKZ+xv4Y2bodBFb3xXyolffLVSCHcFCunV6idkoaMjlFdK+6lfI/A45fVHz20p2gYxgy1c1TqZCWKFNLCQTJpq2Jqi4JjegnMnEq4gHAjJm8MRw7DU8SK0Ureoj+sfPhPpYHDjz6wHFiefqkS2t/P1QLNOJSiTNTZZLC1ap4niUjo1QUgG8I4ntCDgl+87zAZvALPWrmOaJwVEozs2fNGuAS83zPK9y3ElWjEi9dwX4FmZvDRIY5zqXyGYkWuX7qND9irwxiIAqS8fsFQungC9JzqD0YpUS4k8p/dsXcKNn2cp7C4rdUc+nBTz1TrOROefGA94gVLnnfFm03nRrnbNCMibUcpBhEcQDdy6h4XgPAvIvRB6RTbCBqiXk4Mku58IdIZQOomVbtrll5Xcyk4FTIecsDhxc8NUwaD/bJShiXVS7sZNBznJuAnsOGb4c1/WDYh6vYnvYL6aTHQt2wF8nr7C5vnfX6O2fL8OgqJeOpGu0CxFNLguH/qx1Hnwmllq6kMVUtUNRswdYB8MKv3EUeU65Nj0NmeBDJQswmB7jexXCFlJ131M56SqncOD78MeVCZMOQicaDcBf0zpBDgo8pzy1DhL4Te54/InkDJyH0wQU0ICHcavymUAUVQ85/UNRXdrwEIULR
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003)(38070700021)(3023799007)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?4U+orTYDsdDr+vUhwXbYt6vsGY/t+4P9F/bUvo+21AdOBWcn1ciCODV8?=
 =?Windows-1252?Q?EkFz2gPr7clyVUHqEFZ/TFUWatwKaASS+J1aV4CUe4bEvJX9pa+q83Ve?=
 =?Windows-1252?Q?mhSSAGb405bSfWnVbDtiN0nLuDzLouaai/fcojA0YB6sCmxYcOrjL5M9?=
 =?Windows-1252?Q?Hw+1x/L3VG1GUEqnKjikgmEfSy31SkuuT5mAVA3LT7R4GhoeDXliu4pe?=
 =?Windows-1252?Q?4nTkcXWAw1vU2HUW/Z38RUiUNueFaj4zpyhAHTbcjxeLfk7JdyO17Uza?=
 =?Windows-1252?Q?FZmVjqvcX+lW6qtpLdNQ8lhbYmsG2/Rn0kw/HhUKoIr2egqW+uH9JRHN?=
 =?Windows-1252?Q?8slBkzadV8sM0/g4/04xXD32vxfqvZOsellkbb8Dx3rGBpyn9esgPeIt?=
 =?Windows-1252?Q?iFsyfFTrPyaMYmO+LH9JplZcnXQ7fqrJiJIxjbYaxSe6utgKuqlNVVz5?=
 =?Windows-1252?Q?1LU7AHeMs4/9Y4ScdNhCQidYQsQWPayYN2/S8CKQs3pbhgE5+lD10TMX?=
 =?Windows-1252?Q?AJzxTBzFbOEac0AGZb/Nvx1bEO0n7SSxxAot6ANfmyrJxaixag1ag58g?=
 =?Windows-1252?Q?079Si5S5r7evu6/xjXCQaasNU1ilEFHi1KILhcm5JC3nzGOU2pxWQ3Hi?=
 =?Windows-1252?Q?4UPfOBQcMreZIqP74tj6EhmVVScVM+APKnaCd/I14gBvwNIGyO9v/aT7?=
 =?Windows-1252?Q?Vidu+/qBxQV3OmN9nk3l249HRTC7f/+tD49kNPit3OgU3KZ/OZhG7NAx?=
 =?Windows-1252?Q?pOKcEIz6Sgma1gDAat8QLTDYVJH7hpe10dCOPKkew3H8hXRKahxb1jvy?=
 =?Windows-1252?Q?HjiLTtmJLz46mQeaObjXGowCTqZjH/pj/6mFG4UZ30ltreYxflYYmTkL?=
 =?Windows-1252?Q?aKJ/FxTCXJ9aqTmEOioDrWfB+2nCNMphIdGbeL64/5THtK3we3vJheZ7?=
 =?Windows-1252?Q?dhyDfRcmTYWzOj7cRaUYZGqXJJht25xkcByRau9Gzzbc3PsIzZXKscOm?=
 =?Windows-1252?Q?BaTj/dIjtUVUbOJcquR/ZURKiewMKtNkmQJRc/YOA4guz3k4aqGcF4A6?=
 =?Windows-1252?Q?r26B/uMpS/HKRz117IqRydcTQiOBNS01H8rNtxfPKYI/EhCHwLI0c0aj?=
 =?Windows-1252?Q?PAluofJKEqpvlW/ge9k84sJNRaOKAapEf0wMDIwbJyh0bHMAsJIq3yuV?=
 =?Windows-1252?Q?mkUZ8g8NR+SG+IErbmfitOd0uBXk3rorX+nxT1hRWDzT0BCaNvMTbAtu?=
 =?Windows-1252?Q?f+1fuprqKPcxrCpHT13n9rzYmX3iPZ6vwrTI1BARxJBRheNZXQOV+spi?=
 =?Windows-1252?Q?5cuj5cvc5WZUK5PWGoJFQzIBDKZg8b/FbVVwQk+/aNQ7FtVF6KuLyFsh?=
 =?Windows-1252?Q?UR0paqm7Q2C/S/IsZHnbOgBGXpT3r4bYcj7VEdvdmC7NQMk/bCnhJClG?=
 =?Windows-1252?Q?kF+6/jmshxpRUPML55NOZRASSAGJI3qy1su+GUza2bffmeACcoLBItT7?=
 =?Windows-1252?Q?naO8NO+tHisFIHjBQhLmTuX3CJNuzLiMqjvdOCUIUS461PCvH8uXozKU?=
 =?Windows-1252?Q?GkEADymzi2UcdBgbT4ydV6kSswCO91cscQp6PSnARQMhZbQAxo80XYiX?=
 =?Windows-1252?Q?DZ79bXvq6sN2i8OzB7xXm7xyHU9USaMp8cUm3ozM+5n2KmD0rMd6/bvh?=
 =?Windows-1252?Q?0jnvIjjAbGLI8RPTL6bzMUYi3RR70468F3WpmEi7ne3BXqNYUIPpMqRc?=
 =?Windows-1252?Q?9rI+can01kbEQ9RsuCE/67eESmCRdMIE4+L2FJTOuLuXkZcpuW4yYgTx?=
 =?Windows-1252?Q?qstMmKJfg2mxpmEkKX6Wo6vojx6e1mzi8uQIMbjtXvj3qI85SnMB9H31?=
 =?Windows-1252?Q?TLiyrXRM4JYvyQ=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0e7135-c539-432e-d223-08deb7133e2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 08:30:40.8492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qCgdLFx5WBAlk4hmxUSdGlOkjBDNejclfN7kPTulu6CHwM/SyCs/tDrh5Bph034MjeBmbAP95Z8aHPJ749/ckA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3449
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 08:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237481

Hi Ross,

I initially compiled on target thinking it would better to test against the=
 installed library and headers as the user would see them. The tests just v=
alidate libffi's functionality, which works the same whether compiled at bu=
ild time or on target but yes it then does makes the code more complex and =
hard to maintain too i agree.
I'll rework this to compile the tests at build time in do_compile_ptest and=
 just install the binaries so that run-ptest has minimalistic work to do.

Will send v5 once I've simplified and tested it.

Best Regards,
Pratik

________________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Wednesday, May 20, 2026 6:02 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v4] libffi: add ptest support

On 13 May 2026, at 14:27, Pratik Farkase via lists.openembedded.org <pratik=
.farkase=3Dest.tech@lists.openembedded.org> wrote:
>
> Add ptest support for libffi using all upstream test suites: bhaible,
> call, closures, complex, go, and threads.
>
> Tests are compiled on-target against the installed libffi. Headers
> (including the generated fficonfig.h) and a linker symlink are installed
> in the ptest directory to avoid depending on libffi-dev.

The point of ptests is to do integration testing of what we build, which th=
is does not do.  As you=92re manually doing the compilation in run-ptest, w=
hy can=92t this be done at build time?

> +CC=3D"gcc"
> +CXX=3D"g++"
> +if ! command -v gcc >/dev/null 2>&1; then
> +    CC=3D$(find /usr/bin -name "*-gcc" | head -n 1)
> +    CXX=3D$(find /usr/bin -name "*-g++" | head -n 1)
> +fi

Please don=92t be so overly defensive. If you were to continue with compila=
tion on the target, then just RDEPEND on gcc-symlinks and then gcc is on PA=
TH.

> +CFLAGS=3D"-O2 -Wall -I$PTEST_DIR/include -L$PTEST_DIR/lib"
> +
> +# bhaible tests validate by comparing paired output lines
> +for t in test-call test-callback; do
> +    src=3D"$PTEST_DIR/testsuite/libffi.bhaible/$t.c"
> +    if $CC $CFLAGS -o "$PTEST_DIR/$t" "$src" -lffi 2>&1; then
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
> +
> + # complex_int uses non-standard _Complex int, fails on some arches (ris=
cv64)
> +        [ "$name" =3D "complex_int" ] && continue
> +        case "$src" in
> +            *.cc) cc=3D"$CXX";;
> +            *)    cc=3D"$CC";;
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

This is a _lot_ of logic that we have to maintain forever to run some integ=
ration tests=85

Ross

