Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4476CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 20:45:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.60])
 by mx.groups.io with SMTP id smtpd.web11.5179.1761165954151880750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 13:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=hF6hrag7;
 spf=pass (domain: est.tech, ip: 52.101.83.60, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+mAOc52KHF1SlWyqVO7Q80cheIK9azHzUT+3/90zOTwWDCfvxzHDtfPfsgevpY/lMuL36b4ctOJN+KFqCN3tpPQf8hRJLJ+9XIWwcP9lAXYx7TY2xdoVazgWf2HYwNMuzGOjwceZa5ZJdV6GR8c240eVKSqQeJWDd4jlzFFMdMqGig+0QxrDUxtl4qnNpXqnO802YtR6CKgn2XHCwgsE4fmOyGSGhwHomFjQsjUh/VDLikN5D6t7wNbzzIj9S4/y3+6zoYH803iFlXbNHxol0NnhBPwsaPAQGzjP7xu0f9JpL2yqk+NtQd3poPtZz4jUt7c15BJjWqFCpGJJVN57A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J67x0p/ee2REvCtxEiku71edct3j1NRbc8lvCGPOKqc=;
 b=Hm9u39NWP7hKB45uw/bYW9R2lGdEzKeHAUQ0VZ2NbFiBxzyGdg42MhPbBRrPs1+4oX+lq22sVrjXmB/yZShhgW9QEnKby7QCR4ietfpKZ1P6KXavrsKylYz+oSI/58mM/zL/RzSbKa5K40LHTTpUgF24d6lMEw1sr2YKHlxcNz5/5zYPAbqeUXxb8O/QV66K3ZTayowTTu8QW9A4tPYf9NGqLYnOzXrKfftpYP+nIZLi26pfjc5/aZwWK6pq66WBnwZUEoUPjhQdEiIEPCanOccnK3aAOTsrz6GXc/xK8/jxLINPERCC9IawIq84LeqLFXu1xYJRouT4SRQ86dWoyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J67x0p/ee2REvCtxEiku71edct3j1NRbc8lvCGPOKqc=;
 b=hF6hrag7MPqY+yld4qP3GqMJT01ADZYYqr9sALexyO7axpSy+5dvlAIvGhINVWgKCRLOYWmfvwppcP4na4haEosq1hMV1V6avJOJI/l4OUgixUuyAGP/H15FhlDQw7guSaWdkDqROmb/OcZRbwBx2ZkNUpna3aeW+JiEM2maktGKQ2ntF97CsQQuhN5jYR03Qql424Y/tV0bRTectLKMneRpebp5n1C90NLPNqN4lUv8UWz30KYVJcKm90pp8VBxf0tQ3cPVFYY/cqG3RZZysLQsNeyex9SxkX6V5wz229olPeqAUhhG9ioilUjebIp65mzmh4Ytokzxd5/fq5kKwg==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AM4P189MB3714.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ea::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 20:45:50 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 20:45:50 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libxslt: add ptest support
Thread-Topic: [OE-core] [PATCH] libxslt: add ptest support
Thread-Index: AQHcQ2ZZYk7gkftOokCdQMxLiYHWcbTOdpCAgAArXSY=
Date: Wed, 22 Oct 2025 20:45:50 +0000
Message-ID: 
 <GV2P189MB300593868E4B0CB8E60D6C89FEF3A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20251022151239.87981-1-pratik.farkase@est.tech>
 <a3a88a2f-11f2-4158-b4a9-a7ba36520a95@gmail.com>
In-Reply-To: <a3a88a2f-11f2-4158-b4a9-a7ba36520a95@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|AM4P189MB3714:EE_
x-ms-office365-filtering-correlation-id: 425aecb1-1169-4d1f-d5c3-08de11abfc28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|8096899003|7053199007|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Hr4SqOGQsmAqi0E0tyHq6i01Z7IAzMESephtRXFg3eUmzVv9zr+pzu5bMLjQ?=
 =?us-ascii?Q?BlTNEIikCJ9djoXKBq/m7HEMu34gLZ0jf9w2M0OzaxoOmh9WTL6cbNf2as0b?=
 =?us-ascii?Q?RLhyahSpt4BBCiew7OIUKMcCGUWkkb3/iNZ0cyWYq/q5yXIc59sKJCUpCW4g?=
 =?us-ascii?Q?5j84QuynbPbSmWx/AGkm7qe8fChr6iCj9dKOv/Jx3KfwfxkIIJUE2pTCZJBi?=
 =?us-ascii?Q?rckZNyd+BA17FExDhdekv2XK8LUCoZnosbSluVK55Rjh4aizUlJifH94hxMW?=
 =?us-ascii?Q?TH8bAJbP5LHJJ2GdvdHZtG3miW/G2bN87Bv+H8t1qxJ+3Zl9DygA30QWiQ8l?=
 =?us-ascii?Q?ANtqdfAHa/jgC7SbHmC020NEYvD7cqotfr7g9ZuwAPbXmlyMyKCnFiRR1/xM?=
 =?us-ascii?Q?9ETXN72/j/z5rX945ZqKWB3gQUc1iaW2UDfEl5umH8Id5HcFHBzlD5RsqKyR?=
 =?us-ascii?Q?E6AB3b4XC2QGxB8oM4h9Am/Lnc6HB+cPyx0s+oIzQoMdZVcu/QDyOKx6C/0O?=
 =?us-ascii?Q?IjLxsPzZY9N8MIwRf9sj+jM0jyn0xTfHE1LrVSeYZUWVpBuQ/dbGLB8Xlb/Z?=
 =?us-ascii?Q?57yOc4XN5vOlnClVlOGtEZvl0c2epK0YXswSRya9b2zybxoNfOfl/a6B5TNh?=
 =?us-ascii?Q?XLkQI6yvoHNYxerh1nMfiQcEyJuoKI0qXA1slqfNKaqkJzaTVnA/kWWZYZQq?=
 =?us-ascii?Q?IbXB3RInG8jLS0PbEKtnMBEhXSx1FglCI4jzJxpy2zQbunO/4NgqgDuxFz+E?=
 =?us-ascii?Q?KL+I63sbt5mpmqHrWO31/Sfq1WSeSIzYjFdVUapcftVkccDxLRpdQqWK0gcf?=
 =?us-ascii?Q?mXN2QdW9Hhde18TinogBkjPdLyt3ZNIjpx+4WUg9kiWAfCsqcaNPEARhzJ1B?=
 =?us-ascii?Q?at+Sqh3DJWjqAFZz+tvj/aY3Xix+1VwQBscnovpeZaTsp/qzOMMvLX8XmTej?=
 =?us-ascii?Q?aVCHCpkRqrg26pGe5vvUXQtTH7rlThmx4FeZRIMG/VjJYlj4E20rLtByeTpI?=
 =?us-ascii?Q?+T97K8ypxUZXdlWXDuN7nAg06+2fpklt6l+ymV1I93qTKg3GfNOD3T9Ayu1p?=
 =?us-ascii?Q?PuDCrn+OjSlmcCW5TdQOLHI7k2nus36MYH0mV4IAK5J3TxZQvdhPdk29JMae?=
 =?us-ascii?Q?da6oJRZH0+VE9Fv3KzTkuBfwT2Ven7krPcum7U/D/Rae43qeHyPiNba6hUfq?=
 =?us-ascii?Q?LXDmOrS1sjGp92ENFMDv7WTztaBdLrza31BXG+aQwidNbf8PQqI3qRyldtXF?=
 =?us-ascii?Q?vndZe8f0hQJq0d2ttl2+ucjid8+N0ncm6+hNpBpR1t1y4KleuWGiV/+AMDCI?=
 =?us-ascii?Q?msCUdEDcikM2prum5i2NKOatF9bYLOUlvOWUQVBqH6cnP3nZas+yVnDcXYOa?=
 =?us-ascii?Q?cHHmBzFlVdpv00G9YJMgb0CcsJhDPsYPgjLZLjj2b27MDzXVw8SCg/lZk3y8?=
 =?us-ascii?Q?9NO/z2RTDBjP/Phe+Q7CQF2Akwcb9rkS8At/eS7m4UO2qPusOy9QjQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(8096899003)(7053199007)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+yRq9gc9tK5DCNdq5nsRCqFFqFsutW4evAN2GxRoeandeEKKMnOAizWPJTp/?=
 =?us-ascii?Q?h997D/OC21lN3l18QWXGNY1lsDpLWJW9yRFBRKjx37Yh1OnCEwNGC4EJeJ22?=
 =?us-ascii?Q?stLd1JQcjnMNUUhMlJVK5FzDX8UW4p3q6yDrXQjH+gHeibOC7maqDRNN+oua?=
 =?us-ascii?Q?xTi2imDK09zpICyk68/0SgYeotKxnoFAa6hVeQXeTJpKplmPwmtukgtGvZW1?=
 =?us-ascii?Q?cyvYxAZAscCHSJw4FtZ1NU39DsQv8oDucIOrz7DYITy9UuqwIaaf0+eoQi0r?=
 =?us-ascii?Q?kRd3qa6ridEOVvKJEgT0uo4oS/hBVfL4dyu42odNmmlmUc81VXYCr4BFUKWb?=
 =?us-ascii?Q?MIlBbtHp00XeEYFV6tvoC4e/MLLUVJwpRbkBtPqYz9MZGoAvFbXzzj6EV4fS?=
 =?us-ascii?Q?pE2OxZR9U75wxuRC+yg4A/8CdgEXYrdrPyuzc0ztFljzgwg9o85XCNZIH4v5?=
 =?us-ascii?Q?R/Ze6GNysG4ZQX5W/GFxtvHIEnrVcJnUgckjF1kRy3Kv5LppMzepkmCnpXxf?=
 =?us-ascii?Q?K5yfMJ1NgG3UOIn/0lCX9OxzsHPolVC/WdjxAJYaVVW1ISgFFC522WTV343K?=
 =?us-ascii?Q?Nlqpl/b2IXB7k5wVUbILUBbpqf72VVM7e/puZk5w2ol+PDO9FP6S2kbrK7D3?=
 =?us-ascii?Q?kH3scBEBMfhNWC1NiDbi3oeW8MLbIkqyg1Fp40mk/B3KnFBqxCJwJ5/DKIzk?=
 =?us-ascii?Q?PTEaZ0oU1FgMBrb9eCi0Sei9IMDjUVXasnEnCCPEbDiVSLIN6D948gS3T0Wx?=
 =?us-ascii?Q?0X8pxd7tihyNEBjhDve0WO8duphaXYS9/2yefRstf/8SOPP/3hUdCD9JHUoE?=
 =?us-ascii?Q?htT/nF3xGYu7ARL3NAHKqxTDP4wqBy0LMSSWLeJqQyIo9KVACG6aDHyAInLf?=
 =?us-ascii?Q?Rn8P++Mh98wEQy9vLkqzsehgJ3DilRsXrG2PkfvRdkiYd+9sBXtzrEfz/nuU?=
 =?us-ascii?Q?SAvAqW3rzvyX8Dt2cutWpYo84LpgG0HSf1bYtwOsB0ij2VkupU1I2bwOvPmV?=
 =?us-ascii?Q?rPcqAbYBU1W/KfSZ8d6ZQRwyfrLTUqt4mT1MrPsB7jg+kDTUR6x0bOE87qOa?=
 =?us-ascii?Q?HENFWQGNj6fprWqbl/d1LEe+aGo4C2qTgmjD6Gc7j57eyTunqfn5fq38YRyl?=
 =?us-ascii?Q?+EMsrLT0mic0InmVynLk3x8yWChga0zDPrCH7AulLjamwmvM90SnG79z7iwq?=
 =?us-ascii?Q?OJp43uOYXbQTik37DzJd7zCntf9AD7sbtYYfS9kIXCjJJ4pEgKOGN/PCEVeT?=
 =?us-ascii?Q?XXaGNL/Y2vp8bOYu4ZPB81a9F/Pq1W8/q/R2GMcIQFn96YV8izGqZ/k+v299?=
 =?us-ascii?Q?yKRRrQ0hMFSACPpuF03BOrjsMV8eWnPy65lCMHKslM/LUv1JMGzc0s3ri+RW?=
 =?us-ascii?Q?fq5Y+qHk+PSgfSyLQ5nEu2/GaXbGA39ev5rqQR0bovL7B5LQLmTr95HFWJ9Y?=
 =?us-ascii?Q?MLGuj+vWRI7hLIjk60YofJLAxdhoBrbFB1RVvJGE2AAGOZwwrmkF/K4b6q1M?=
 =?us-ascii?Q?B83xWzgV3GU8Np09rSvdWFB9D2tL+kNTFWKtxnO+uRBTJXIIy76M0KE1do1i?=
 =?us-ascii?Q?KIVmHpny6NwdW9ZSd00nuuHILnpuGpul2MNr8CRQ?=
Content-Type: multipart/alternative;
	boundary="_000_GV2P189MB300593868E4B0CB8E60D6C89FEF3AGV2P189MB3005EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 425aecb1-1169-4d1f-d5c3-08de11abfc28
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 20:45:50.0370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqzZWm+vljvvuTSM4RR17EpJGplpXNOECD0VBUjkqB/a1Dfqsfzqx0jnuOvwH3PO9DxbkWoklkYDJSrVstTMSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3714
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 20:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225213

--_000_GV2P189MB300593868E4B0CB8E60D6C89FEF3AGV2P189MB3005EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

This is v3 of the libxslt ptest support patch, replacing v2:
https://lists.openembedded.org/g/openembedded-core/message/225210

v3:
- Remove unconditional --with-plugins (leftover from v2)

Thanks,
Your Name

Best Regards,
Pratik
________________________________
From: Gyorgy Sarvari <skandigraun@gmail.com>
Sent: 22 October 2025 8:07 PM
To: Pratik Farkase <pratik.farkase@est.tech>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libxslt: add ptest support

On 10/22/25 17:12, Pratik Farkase via lists.openembedded.org wrote:
> Add ptest support for libxslt 1.1.43 including:
> - do_compile_ptest and do_install_ptest
> - test data installation
> - cleanup of buildpath references
> - added run-ptest installation
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/libxslt/files/run-ptest  | 25 +++++++++++
>  .../recipes-support/libxslt/libxslt_1.1.43.bb | 45 +++++++++++++++++--
>  3 files changed, 67 insertions(+), 4 deletions(-)
>  create mode 100755 meta/recipes-support/libxslt/files/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 9950e46776..b295e0049f 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -47,6 +47,7 @@ PTESTS_FAST =3D "\
>      libxml-simple-perl \
>      libxml2 \
>      libxmlb \
> +    libxslt \
>      logrotate \
>      lua \
>      lzo \
> diff --git a/meta/recipes-support/libxslt/files/run-ptest b/meta/recipes-=
support/libxslt/files/run-ptest
> new file mode 100755
> index 0000000000..a2b28e6a75
> --- /dev/null
> +++ b/meta/recipes-support/libxslt/files/run-ptest
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +set -eu
> +PT_DIR=3D"$(dirname "$0")"
> +cd "$PT_DIR/tests"
> +
> +echo "=3D=3D=3D Running libxslt ptests (verbose) =3D=3D=3D"
> +
> +if [ -x .libs/runtest ]; then
> +    echo "Running .libs/runtest --verbose --timing"
> +    ./.libs/runtest --verbose --timing 2>&1 | tee runtest.log
> +elif [ -x ./runtest ]; then
> +    echo "Running runtest --verbose --timing"
> +    ./runtest --verbose --timing 2>&1 | tee runtest.log
> +else
> +    echo "ERROR: runtest not found"
> +    exit 1
> +fi
> +
> +if [ -x .libs/run-threads ]; then
> +    echo "Running .libs/run-threads --verbose"
> +    ./.libs/run-threads --verbose 2>&1 | tee -a runtest.log
> +fi
> +
> +echo "=3D=3D=3D Finished libxslt ptests =3D=3D=3D"
> +
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipe=
s-support/libxslt/libxslt_1.1.43.bb
> index e08e92085d..0f6ec4ba02 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
> @@ -11,10 +11,11 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D0cd9a07afbeb24026c9b03aecfe=
ba458"
>
>  SECTION =3D "libs"
> -DEPENDS =3D "libxml2"
> +DEPENDS =3D "libxml2 libxslt-native"
>
>  SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV=
}.tar.xz \
> -           file://gnome-libxslt-bug-139-apple-fix.diff"
> +           file://gnome-libxslt-bug-139-apple-fix.diff \
> +         file://run-ptest"
>
>  SRC_URI[sha256sum] =3D "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea330306=
5231a6d403f0183a"
>
> @@ -26,7 +27,43 @@ S =3D "${WORKDIR}/libxslt-${PV}"
>
>  BINCONFIG =3D "${bindir}/xslt-config"
>
> -inherit autotools pkgconfig binconfig-disabled lib_package multilib_head=
er
> +inherit autotools pkgconfig binconfig-disabled lib_package multilib_head=
er ptest
> +
> +RDEPENDS:${PN}-ptest +=3D "${PN}-bin make libxslt-utils libxml2-utils xm=
lto coreutils sed grep diffutils bash libxml2-utils perl"
> +
> +do_compile_ptest() {
> +    cp -r ${S}/tests ${B}/
> +    oe_runmake -C ${B}/tests runtest || true
> +    if grep -q "run-threads" ${B}/tests/Makefile; then
> +        oe_runmake -C ${B}/tests run-threads || true
> +    fi
> +}
> +
> +addtask compile_ptest after do_compile before do_install

This addtask is not needed - do_compile_ptest() is implicitly executed
when ptest is enabled.

> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +
> +    if [ -d ${B}/tests/.libs ]; then
> +        cp -a ${B}/tests/.libs ${D}${PTEST_PATH}/tests/
> +    fi
> +
> +    for f in runtest run-threads; do
> +        if [ -f ${B}/tests/$f ]; then
> +            install -m 0755 ${B}/tests/$f ${D}${PTEST_PATH}/tests/
> +            sed -i -e "s#${TMPDIR}##g" \
> +                   -e "s#${B}##g" \
> +                   -e "s#${S}##g" \
> +                   ${D}${PTEST_PATH}/tests/$f || true
> +        fi
> +    done
> +
> +    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/ || true
> +    find ${D}${PTEST_PATH}/tests -name 'Makefile*' -delete || true
> +    find ${D}${PTEST_PATH}/tests -name '.deps' -type d -exec rm -rf {} +=
 || true
> +}
> +
> +FILES:${PN}-ptest +=3D "${PTEST_PATH}/*"

This line is also unnecessary, it is already included in the ptest.bbclass

>
>  do_configure:prepend () {
>        # We don't DEPEND on binutils for ansidecl.h so ensure we don't us=
e the header.
> @@ -38,7 +75,7 @@ do_configure:prepend () {
>        touch ${S}/doc/xsltproc.1
>  }
>
> -EXTRA_OECONF =3D "--without-python --without-debug --without-crypto"
> +EXTRA_OECONF =3D "--without-python --without-debug --without-crypto --wi=
th-plugins"

Is this --with-plugins only needed for the test? If yes, could it be
added conditionally, only in case ptest is enabled? (You can find
examples if you grep for "PTEST_ENABLED" in the meta folder)

>  # older versions of this recipe had ${PN}-utils
>  RPROVIDES:${PN}-bin +=3D "${PN}-utils"
>  RCONFLICTS:${PN}-bin +=3D "${PN}-utils"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225200): https://lists.openembedded.org/g/openembedde=
d-core/message/225200
> Mute This Topic: https://lists.openembedded.org/mt/115894161/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sk=
andigraun@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_GV2P189MB300593868E4B0CB8E60D6C89FEF3AGV2P189MB3005EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
This is v3 of the libxslt ptest support patch, replacing v2:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
https://lists.openembedded.org/g/openembedded-core/message/225210</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
v3:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
- Remove unconditional --with-plugins (leftover from v2)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Your Name</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Best Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Pratik</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Gyorgy Sarvari &lt;sk=
andigraun@gmail.com&gt;<br>
<b>Sent:</b> 22 October 2025 8:07 PM<br>
<b>To:</b> Pratik Farkase &lt;pratik.farkase@est.tech&gt;; openembedded-cor=
e@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<b=
r>
<b>Subject:</b> Re: [OE-core] [PATCH] libxslt: add ptest support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 10/22/25 17:12, Pratik Farkase via lists.openem=
bedded.org wrote:<br>
&gt; Add ptest support for libxslt 1.1.43 including:<br>
&gt; - do_compile_ptest and do_install_ptest<br>
&gt; - test data installation<br>
&gt; - cleanup of buildpath references<br>
&gt; - added run-ptest installation<br>
&gt;<br>
&gt; Signed-off-by: Pratik Farkase &lt;pratik.farkase@est.tech&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../distro/include/ptest-packagelists.inc&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 1 +<br>
&gt;&nbsp; meta/recipes-support/libxslt/files/run-ptest&nbsp; | 25 ++++++++=
+++<br>
&gt;&nbsp; .../recipes-support/libxslt/libxslt_1.1.43.bb | 45 +++++++++++++=
++++--<br>
&gt;&nbsp; 3 files changed, 67 insertions(+), 4 deletions(-)<br>
&gt;&nbsp; create mode 100755 meta/recipes-support/libxslt/files/run-ptest<=
br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/co=
nf/distro/include/ptest-packagelists.inc<br>
&gt; index 9950e46776..b295e0049f 100644<br>
&gt; --- a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; +++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; @@ -47,6 +47,7 @@ PTESTS_FAST =3D &quot;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libxml-simple-perl \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libxml2 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libxmlb \<br>
&gt; +&nbsp;&nbsp;&nbsp; libxslt \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logrotate \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lua \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lzo \<br>
&gt; diff --git a/meta/recipes-support/libxslt/files/run-ptest b/meta/recip=
es-support/libxslt/files/run-ptest<br>
&gt; new file mode 100755<br>
&gt; index 0000000000..a2b28e6a75<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libxslt/files/run-ptest<br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +#!/bin/sh<br>
&gt; +set -eu<br>
&gt; +PT_DIR=3D&quot;$(dirname &quot;$0&quot;)&quot;<br>
&gt; +cd &quot;$PT_DIR/tests&quot;<br>
&gt; +<br>
&gt; +echo &quot;=3D=3D=3D Running libxslt ptests (verbose) =3D=3D=3D&quot;=
<br>
&gt; +<br>
&gt; +if [ -x .libs/runtest ]; then<br>
&gt; +&nbsp;&nbsp;&nbsp; echo &quot;Running .libs/runtest --verbose --timin=
g&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; ./.libs/runtest --verbose --timing 2&gt;&amp;1 | t=
ee runtest.log<br>
&gt; +elif [ -x ./runtest ]; then<br>
&gt; +&nbsp;&nbsp;&nbsp; echo &quot;Running runtest --verbose --timing&quot=
;<br>
&gt; +&nbsp;&nbsp;&nbsp; ./runtest --verbose --timing 2&gt;&amp;1 | tee run=
test.log<br>
&gt; +else<br>
&gt; +&nbsp;&nbsp;&nbsp; echo &quot;ERROR: runtest not found&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; exit 1<br>
&gt; +fi<br>
&gt; +<br>
&gt; +if [ -x .libs/run-threads ]; then<br>
&gt; +&nbsp;&nbsp;&nbsp; echo &quot;Running .libs/run-threads --verbose&quo=
t;<br>
&gt; +&nbsp;&nbsp;&nbsp; ./.libs/run-threads --verbose 2&gt;&amp;1 | tee -a=
 runtest.log<br>
&gt; +fi<br>
&gt; +<br>
&gt; +echo &quot;=3D=3D=3D Finished libxslt ptests =3D=3D=3D&quot;<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/rec=
ipes-support/libxslt/libxslt_1.1.43.bb<br>
&gt; index e08e92085d..0f6ec4ba02 100644<br>
&gt; --- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb<br>
&gt; +++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb<br>
&gt; @@ -11,10 +11,11 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://Copyright;md5=3D0cd=
9a07afbeb24026c9b03aecfeba458">file://Copyright;md5=3D0cd9a07afbeb24026c9b0=
3aecfeba458</a>&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; SECTION =3D &quot;libs&quot;<br>
&gt; -DEPENDS =3D &quot;libxml2&quot;<br>
&gt; +DEPENDS =3D &quot;libxml2 libxslt-native&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; SRC_URI =3D &quot;<a href=3D""></a>https://download.gnome.org/so=
urces/libxslt/1.1/libxslt-${PV}.tar.xz \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://gnome-libxslt-bug-139-apple-fix.diff&quot;">file://gnome-libxslt=
-bug-139-apple-fix.diff&quot;</a><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://gnome-libxslt-bug-139-apple-fix.diff">file://gnome-libxslt-bug-1=
39-apple-fix.diff</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://ru=
n-ptest&quot;">file://run-ptest&quot;</a><br>
&gt;&nbsp; <br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;5a3d6b383ca5afc235b171118e90f5ff6aa=
27e9fea3303065231a6d403f0183a&quot;<br>
&gt;&nbsp; <br>
&gt; @@ -26,7 +27,43 @@ S =3D &quot;${WORKDIR}/libxslt-${PV}&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; BINCONFIG =3D &quot;${bindir}/xslt-config&quot;<br>
&gt;&nbsp; <br>
&gt; -inherit autotools pkgconfig binconfig-disabled lib_package multilib_h=
eader<br>
&gt; +inherit autotools pkgconfig binconfig-disabled lib_package multilib_h=
eader ptest<br>
&gt; +<br>
&gt; +RDEPENDS:${PN}-ptest +=3D &quot;${PN}-bin make libxslt-utils libxml2-=
utils xmlto coreutils sed grep diffutils bash libxml2-utils perl&quot;<br>
&gt; +<br>
&gt; +do_compile_ptest() {<br>
&gt; +&nbsp;&nbsp;&nbsp; cp -r ${S}/tests ${B}/<br>
&gt; +&nbsp;&nbsp;&nbsp; oe_runmake -C ${B}/tests runtest || true<br>
&gt; +&nbsp;&nbsp;&nbsp; if grep -q &quot;run-threads&quot; ${B}/tests/Make=
file; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake -C ${B}/tests r=
un-threads || true<br>
&gt; +&nbsp;&nbsp;&nbsp; fi<br>
&gt; +}<br>
&gt; +<br>
&gt; +addtask compile_ptest after do_compile before do_install<br>
<br>
This addtask is not needed - do_compile_ptest() is implicitly executed<br>
when ptest is enabled.<br>
<br>
&gt; +<br>
&gt; +do_install_ptest() {<br>
&gt; +&nbsp;&nbsp;&nbsp; install -d ${D}${PTEST_PATH}/tests<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; if [ -d ${B}/tests/.libs ]; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -a ${B}/tests/.libs ${D=
}${PTEST_PATH}/tests/<br>
&gt; +&nbsp;&nbsp;&nbsp; fi<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; for f in runtest run-threads; do<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -f ${B}/tests/$f ]; t=
hen<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
stall -m 0755 ${B}/tests/$f ${D}${PTEST_PATH}/tests/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; se=
d -i -e &quot;s#${TMPDIR}##g&quot; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -e &quot;s#${B}##g&quot; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -e &quot;s#${S}##g&quot; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}${PTEST_PATH}/tests/$f || true<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt; +&nbsp;&nbsp;&nbsp; done<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/ || tru=
e<br>
&gt; +&nbsp;&nbsp;&nbsp; find ${D}${PTEST_PATH}/tests -name 'Makefile*' -de=
lete || true<br>
&gt; +&nbsp;&nbsp;&nbsp; find ${D}${PTEST_PATH}/tests -name '.deps' -type d=
 -exec rm -rf {} + || true<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES:${PN}-ptest +=3D &quot;${PTEST_PATH}/*&quot;<br>
<br>
This line is also unnecessary, it is already included in the ptest.bbclass<=
br>
<br>
&gt;&nbsp; <br>
&gt;&nbsp; do_configure:prepend () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # We don't DEPEND on binutil=
s for ansidecl.h so ensure we don't use the header.<br>
&gt; @@ -38,7 +75,7 @@ do_configure:prepend () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; touch ${S}/doc/xsltproc.1<br=
>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -EXTRA_OECONF =3D &quot;--without-python --without-debug --without-cry=
pto&quot;<br>
&gt; +EXTRA_OECONF =3D &quot;--without-python --without-debug --without-cry=
pto --with-plugins&quot;<br>
<br>
Is this --with-plugins only needed for the test? If yes, could it be<br>
added conditionally, only in case ptest is enabled? (You can find<br>
examples if you grep for &quot;PTEST_ENABLED&quot; in the meta folder)<br>
<br>
&gt;&nbsp; # older versions of this recipe had ${PN}-utils<br>
&gt;&nbsp; RPROVIDES:${PN}-bin +=3D &quot;${PN}-utils&quot;<br>
&gt;&nbsp; RCONFLICTS:${PN}-bin +=3D &quot;${PN}-utils&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#225200): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/225200">
https://lists.openembedded.org/g/openembedded-core/message/225200</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11589416=
1/6084445">
https://lists.openembedded.org/mt/115894161/6084445</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [skandigraun@g=
mail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_GV2P189MB300593868E4B0CB8E60D6C89FEF3AGV2P189MB3005EURP_--

