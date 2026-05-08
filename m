Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC39CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 11:25:18 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11422.1778239516999911101
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 04:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=x5kjiSyU;
 spf=pass (domain: siemens.com, ip: 52.101.70.28, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtW5M9l3YdMLJbDHmhuQF6XIhyHPmvAKZNOzJ6bxHXnG3nyQDvnlztfas8263q7egmrQjg2m18czxOhoc5zGoqPjc+QeHxcx6ypT0fnQeElixy54IOa5L2l0/s51LPo32606tV44VlKyDRcSYJcc3wtwaZqrYlCK6AOH6bMYDsaJZ34h2b3m0VSXqp4PWSiQn7HhN6tEVMf0Pj9zexsdhXyNrHOLpy73CKC0t5AWKJovmZ0MJtiaHAPMM49+h2J5zpkwWY46AhEPc5DHwxK2yHjTtj+UIEpf4js2yjayI6Blw+3B8H1dURL7KqTTXA2NmCdiymfRUyfpHGVrqOxKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeX+nkzClzzB9YBcRhZ8UsD7KIz85SZSIX7qI4bjjDk=;
 b=KsyXlbcSlPB5JjgIjK+I3lzIdQu7fHrmmtBkzRQXyHBKWzSDfl5fCtiFE5GvomnZ6Dxr5vcRoV3lkiuCiSUzqZe/k2K2yMkkAc1f04WNBGZIRxiNes0YFXM30U687aRwi0i+GGUS5SPe06KbuPLcoTb8oraoV+lUGNa0KDKwWicuim6wpgWVFlJ4iK0/GqTrO0/0v7QTacE1odomXxC8BBeTlQyQ0P3Xdl3kzKUqdki8q8sF301hrTIuwNlKf/pm5wVvcvTkm8bQ/HSU/KrcK4Pb2Q68lIf9ID27tiNOSSC+rdGkj9ygCspA9MWZKK99TF3lkkhVupKwfQVqgLMYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeX+nkzClzzB9YBcRhZ8UsD7KIz85SZSIX7qI4bjjDk=;
 b=x5kjiSyUD5l3YYNggWmy8ftaETM1NFksShHjdW9eKWh8YUwXHH7qEAPH+lhwhFcAZbiPF3aNElmjrFAuqKpnW5pKpOLlVii2a3rqJ7aA+pywSSMOuHEIiO3X+dQDO0UKjTuHATzD0fcR35xEZ5AwTKR3sMkcqM1QtNKEnhZccUzrb5JmAfAB3ILG26W7t9IkpGxstwSPVnv8zC2U8bsoY9KSM56fs3RYRP6S2lZfb6RP+P6dMsIahcpgtvTHI7E7FzXGUjrLRYvvMcwymYaXUoMrOUj98Fa26Ka1ng04Uz02gV1Oetz04B1rgXUkwHPYZHNlufcqRTKxlVE4LlEZJg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AMBPR10MB9881.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:75f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 11:25:14 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 11:25:14 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Pratik Farkase <pratik.farkase@est.tech>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: RE: [OE-core][PATCH v2] libffi: add ptest support
Thread-Topic: [OE-core][PATCH v2] libffi: add ptest support
Thread-Index: AQHc3tTc1FPWa/y/3kKU7PJ46tha5rYD++tg
Date: Fri, 8 May 2026 11:25:13 +0000
Message-ID: 
 <AS1PR10MB569736F5603EF1B021A44724FD3D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260507085242.39646-1-pratik.farkase@est.tech>
 <20260508102405.16791-1-pratik.farkase@est.tech>
In-Reply-To: <20260508102405.16791-1-pratik.farkase@est.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3241ba59-a33e-4ed1-a2fc-5f89e211fdc3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-05-08T11:21:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AMBPR10MB9881:EE_
x-ms-office365-filtering-correlation-id: 3d021285-0c88-44fc-ef04-08deacf47953
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|55112099003|38070700021|56012099003|3023799003|22082099003;
x-microsoft-antispam-message-info: 
 2hapTjvWZxrlWVdPz3A1134obN/GNDWSnE1nZjacajzX2zo3TZNsbk+mu440EB79PZ0TqK0omPWbG1b4aGYCtliLfwzDqts6vfnSawiPp6fat1Osy0Otc3z01KIKHuBAGvlRN9pB9npLIkufUSic6wtzGnwJSx9eIcFAHoUxE7UcKt/0gukl9YF8xz0Q9nPl3W3sk2Au3rM1WWcND9QHFBZu8VebQ6vZILc3F+ctpIvUwkMPR0TtwMXp6zRH7EgtSTyVtrVNTI+Y8RhDlTlU+9j/YswUzNDshu9JcKRm0j/anCfo4wAJMJkNnhaP/c0PPCwjGLVL+AEyYwy6GqpkB5AgutXVGGjybCUHf+j9syTB+VG3F1xImg4YqShipWG9z7G6q1G0+FBNDbKuU03BSw4t6/IQp/X78awgKdmGJw5wXFIYvs3gyFpqiLgWq3QASETgKpywgPDVmXOCF48tw6Lh9r/OiHYv4DIBgeFfxQHrpHq7qgdMt6hLFnSv45B7dCFJlv1LAfaGVxnDsxj+pbpSJY1ZVGw32hpEsfOyFCz2gVY4/WTuSN2Sz+vIKYD4zTBkQvSG8F4DDPlI9SCBzZCtdEjwMU6OTJbnZF5i9jwzkDPaq+OO9QbWlRZvvA8OkF5v6gECNX7mZRtSsUVbC41lXCuDG0yYcor4QsJFph7Lx26WKJCn2JaTlvmhRgDm9hYL2KDHYdIpkyu1uf4Mwyl5zen/9MymbGI3LXSjIRMw6rqqVXpTwPMJFUQkaiwV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(55112099003)(38070700021)(56012099003)(3023799003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xGoDO2wLIoUhO28TITcTShwXgDkdtYivgpPUR4wkiiaPGjLy+sNCK28ewPfd?=
 =?us-ascii?Q?7w9g7A53zPgpVr8xHaHYreVnXIoJruombmgot37FNWvxDZRD6N+wqmVhjYe0?=
 =?us-ascii?Q?Y3dwN3ujFYL3SnkFQCeTiSoRphLnqrXv17RpHV516vLPqrjXm2rPiugFEQ27?=
 =?us-ascii?Q?JVCYueMRKoZcGgmf7p0372ywm8OP1aa8khp5x3ykKH3adGLjlx6MJKMfibMS?=
 =?us-ascii?Q?KmVJ4fYPuRJBQ+WOZyoIO71hZfcXCHHuA13CwLeMxvXuCYoaIz2k1QIPN9BK?=
 =?us-ascii?Q?ilag+qJP1ZdZDkKfB8KVUcjZTzlEYtWzC5X+UaouMpSQmvF6TNjx8v0si3pI?=
 =?us-ascii?Q?LPxOMWB1bVbQNlUCtuRgIwSBHo7t+dO4ZcH79NW4s71nIQywgabKrClYz9wc?=
 =?us-ascii?Q?rAHDQZhcgsu85QQt7UNDY0wuts+z5RdrTW5tPE86j/0TbewBC3DVcEBWukz0?=
 =?us-ascii?Q?iIEo3UYtsxtEUvUEMB5aVLchoHD7WQG/+nK80pT61ptjAAXG17r0useibrfO?=
 =?us-ascii?Q?c+86oNSzXKo/tEknEuS3UO0EZP8T/GE8OdnIatUyAK2cKSzrtA1+WEIboeDA?=
 =?us-ascii?Q?qT9epXPJLY85w+/oGqMevuZT1tModyZuAnjOSm6lei1R9QycOJMaAjt1Dm62?=
 =?us-ascii?Q?CYG9rTx4c3W0mKR6DP8mSqVnSjA1OLiwi+Ppgg3gckDctItricy8hk4cfQ0H?=
 =?us-ascii?Q?pINZFR0iK2vxRLXrXbq7q8ZIujg3U4zAtkW2nKscJyTUNF9nfgl7K/mrExOz?=
 =?us-ascii?Q?FQgqryHU67fwPqVMaGy7qJnurQAoK3RQs0Z9kfaK7GmhqP4yXSyAwlhgcO7N?=
 =?us-ascii?Q?433oDk8Z3k4LuF29MxVlHSOtxOwrbzkMiSu/33Z6JVQ1D3tJhXmvWZ4yqTwB?=
 =?us-ascii?Q?pwM/eY353sLWCh82cafhhJw9/mmEa5Za1HMLa3U71tFXEGEio4hC/6jylrgw?=
 =?us-ascii?Q?6FqOdEFsQYh2YgB1SKMkFlWOvrDZ7UaT0l9p25+lkBhfOmXp8A8FAPEqQfN+?=
 =?us-ascii?Q?2/yFt5sFjFOGlQMNolG1GF35GpQVC4t1DsBXpBqbZwKv6i2Tvdl2j1rgyHig?=
 =?us-ascii?Q?J2Xm3v5e3hihQdWOlrYWI3xg/DhMiOujrdlvTGEZuAeKHAhcPYI37qriDsd7?=
 =?us-ascii?Q?0N+ev2bvMNZeQWz4gdeo1OVPzU4YFrzBhdHNH6E4DgAuIT8SQZC4NCPTCQ7F?=
 =?us-ascii?Q?qQ4xuJXi+tNCR8iZi8s6iwTtk3c+LXQX66fHeRIOgcaX89AN8i6yGNY7sqsO?=
 =?us-ascii?Q?Y+FecJlKlD0bitI2ePM8S05Gyhiy8otDYzsHo8WPPYZT2evMvkOfhjeibLG4?=
 =?us-ascii?Q?bSLaasbXbcWitmkrXTg6nW3mldMmasqysYd6GPoaAHacOWutwqh0+HBisv3E?=
 =?us-ascii?Q?EnW420FSsJuYfx2AyxqcKNGmiab1J1gtF99emAoeWhYLWLjJylRAx4j9HxB8?=
 =?us-ascii?Q?ktCbD+SjkHK8Cp1drdSS4eomaoQ8+f0hBBvwEFpTNpja221FYZppuDAxg+Mg?=
 =?us-ascii?Q?g+COUwpocCis2slSD5AzMZ/3Zo0cI3xjKQ/jMgk2c8ZMpkJyZReP7989BorV?=
 =?us-ascii?Q?hRluunveAB8+BuDvao4vAFaG53HjF0BrxqlxvcjU9jeCFNJ4AW9xEOSFBiLc?=
 =?us-ascii?Q?kMdSRtKtKSPqI6V15JuZPHwPz27hW8h+oqJ9XoQxj7sKcSRm2XiMB5v9ccCs?=
 =?us-ascii?Q?cav0+XGBGgmAcaa6cP/QHA3J3ndx1gORl8fNEB8FLgSliuA+drlut2Ov9Byl?=
 =?us-ascii?Q?OgeL2CHWtQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d021285-0c88-44fc-ef04-08deacf47953
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 11:25:14.0203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n7Toimoab2pgVlPJp6rUzvUzZk0UQQ1Uta7F0KR6vzdZ22VAA2dj9vOmhZRq51pAomqhi+exA2G1jYkReMf+0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9881
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 11:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236705



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Pratik Farkase
> Sent: Friday, May 8, 2026 12:24 PM
> To: openembedded-core@lists.openembedded.org
> Cc: pratik.farkase@ericsson.com; Pratik Farkase <pratik.farkase@est.tech>
> Subject: [OE-core][PATCH v2] libffi: add ptest support
>=20
> Add ptest support for libffi using all upstream test suites: bhaible,
> call, closures, complex, go, and threads.
>=20
> Tests are compiled on-target against the installed libffi. Headers
> (including the generated fficonfig.h) and a linker symlink are installed
> in the ptest directory to avoid depending on libffi-dev.
>=20
> Tested on qemux86-64 with ptest-runner: 199 PASS, 0 FAIL, 2 SKIP (349s).
>=20
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
>=20
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
>=20
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
>             file://not-win32.patch \
> +           file://run-ptest \
>             "
>  SRC_URI[sha256sum] =3D
> "f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc"
>=20
> @@ -19,7 +20,7 @@ EXTRA_OECONF =3D "--disable-builddir"
>  EXTRA_OECONF:class-native +=3D "--with-gcc-arch=3Dgeneric"
>  EXTRA_OEMAKE:class-target =3D "LIBTOOLFLAGS=3D'--tag=3DCC'"
>=20
> -inherit autotools texinfo multilib_header github-releases
> +inherit autotools texinfo multilib_header github-releases ptest
>=20
>  do_install:append() {
>  	oe_multilib_header ffi.h ffitarget.h
> @@ -30,3 +31,21 @@ do_install:append() {
>  MIPS_INSTRUCTION_SET =3D "mips"
>=20
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


