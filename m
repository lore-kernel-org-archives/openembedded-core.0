Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA04CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 20:34:26 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.64])
 by mx.groups.io with SMTP id smtpd.web11.4873.1761165263571826626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 13:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=NX4ZUCUW;
 spf=pass (domain: est.tech, ip: 52.101.83.64, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClaVckd3HAzEu47my+HjJ0CEusA/t7vrofFI9WI+jFmZfGi1HIi1/6ZwblishW5YvIJ6S6ZHW+qtf8NeXO+TPblF6crsGISzQaH1l8L04vigiqExm8BFr4N4eD6/6aXipzRqYa+GqVR0J+l4QLAA0usqav0JvbLXSD63ZFK9a5gOMg7GZ1fhupVjI8IILoXt2WHdzYF6CuUApRaIFjw8ajh7ix9GXNaxvus6pPRStW18uFO34P0OtnFAYulphh1dOZHA7cuZNOgf9E1ynLmdp6voIjQfUXRJVJiezNUJCI/cpsYkU+TQ+VL/1LxPYTtEY74SGAsMFqCDe4YRa8LiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVI0qIo5EPPKAujD+tk6ODAZHdmVx5eHdQkYll/7rxQ=;
 b=gLGZHYtexeIMqmQmQ1ZjCr2FEsCj0FXCsRnr2YhYDcYyFkpkyms5slbi4Tf7ALO4na3PAzgHyz7ht607KRx+O/zLOb05mIzvkaZRko1eqg+D7egtGYL0ZO/UH7Lqm2z85hZwa5hpOWHlRheGdd3xUKfgFuuQlcUe7mJW9UjfP33pULZUH71p0sBPzdbHY2caKzTL7boC3Szdc7MYA1uJjbtyMsk5JWQIwvFL+cMj7sNLpXcFDbiCue7yURv9XCoDJ3UnwUXm7GSXUuwIjBxq/BtsRelgIn+zvPXBNebwW/Z0Qp4ll2zG+wbHnwRXH2GB6DI9OH8IcZ0gtiLPBSoMGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVI0qIo5EPPKAujD+tk6ODAZHdmVx5eHdQkYll/7rxQ=;
 b=NX4ZUCUWEjTnMTp+KQ54qwGyZbgyxIrLJforOesv3KF6dZvNnlXDr/JyAg2AvHUUVQ9yWfVJKbrEhIBx7XMi+fvCZfdYxhB9AOLUyIGJ7Ho41zl4P/AMSCwscbuKrFEi7SRt6eyQp+JZ44mvdeEuLF+Hn87bUK2WvcXKgjQ3YdcLrnpkKeEH5we5ENfeFTZzQW3BcsyYIExhjetkr8mvm+/H3TfInzeTI7P4Syf6KXj2VZjZrHe+Fidw2oqTADlxqr1t7UFdC4tx32CFq83f/v4V0nes2D5iMw5nxrjc2gWJGIqOzwG1phrb6kjjF+cAotm31XoH70JsC28/Gil5FQ==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PA4P189MB1295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 22 Oct
 2025 20:34:19 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 20:34:19 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libxslt: add ptest support
Thread-Topic: [OE-core] [PATCH] libxslt: add ptest support
Thread-Index: AQHcQ2ZZYk7gkftOokCdQMxLiYHWcbTOdpCAgAAo3Hk=
Date: Wed, 22 Oct 2025 20:34:19 +0000
Message-ID: 
 <GV2P189MB30059023A2E5F692FC6CB564FEF3A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
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
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|PA4P189MB1295:EE_
x-ms-office365-filtering-correlation-id: ffb39a3d-459a-48c7-f872-08de11aa60a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|7053199007|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?cdEEw7CwiLMyHm7Nndih+zMN/NGrgcLUHWHzvGB0EHDXJcTCbP+s1GhpVjmQ?=
 =?us-ascii?Q?rYk7OgYYYQa252teVY5pCy3OYru/ghxOsdP34NGbNJVGUl7udhZST4EWXLeQ?=
 =?us-ascii?Q?iShlfBNOlkPROg3yLSzZsbvaBdkuFTzUDf9k/315Wt14KNqOGlki2tqAHfDo?=
 =?us-ascii?Q?rhkL8E6MI2B4b7Ctm/8QAZQWbPPjIs0QRa3Pvsylgmn1wXaiQGLKgMaWTyYY?=
 =?us-ascii?Q?2wmJYUyKL6Ao5wkqOqsiWr2XaVtQLYGI74Fs2hCidb83iR/IaYYrxJUkYK1+?=
 =?us-ascii?Q?6LGW2+wrhNA2DAQv8DlDOBmKLdOw/TnAxrKnry9aCIfKcTUsOltCbC6C6p64?=
 =?us-ascii?Q?77vxTENNM+2bPG1RV6uoWpdCn7rGEdv8VVajb+LO/N/03ql0MpY7UIhOUbwT?=
 =?us-ascii?Q?ptuzGM/CqOKJ4zjWnCXT2JHOwizm3jldoNTdtK0UPc4818ORspvPhxqitCMx?=
 =?us-ascii?Q?IutDaJXkTaHgz5ufMgKhXymLZXdksP+x8iDtBEbroUzgCcLNntq3Vpxc3F07?=
 =?us-ascii?Q?15PKZVE1ntRADcDL15gm95orjLycCAR0KJET2wa1tkWuxZMU6eCZEs7kKlXW?=
 =?us-ascii?Q?dDzTOtyo9ibitIFhOZWTJliOFDodC3dB8Cka+aanB+9Np3vuMyL2gsIQ0ev+?=
 =?us-ascii?Q?RDWBDPv7te8jq54ONPldm0UcuZV9SQPL1MQxafr9hiysM8Q7/FHKo0ZK19Hk?=
 =?us-ascii?Q?a6w+rgQJlnuHzsT1VuUhi2LxZeUH9y/x7o6lVWyij0cKqcEvfL1u1HLoSt+b?=
 =?us-ascii?Q?MwbAHqZtxkgDta3Wiyhc7oNe0Of3AXGAglchG+OdudxJ6GjK3GL7tQFFevRb?=
 =?us-ascii?Q?GasD3xTog+86RVp+OffzPEgYDgMKebMH6pg+3yaE0MzPa+LFZDPwtUC/kYg4?=
 =?us-ascii?Q?cmBKwhmVSY5F2iEcCm8QaDBy7r+VttwBj+eRM0swb5OeYxZm+rLDYU6bCwap?=
 =?us-ascii?Q?EeCJOdIsvMeJtfLJC6pCcpuIkEh/N26MAIokbqCifr70a6GOBEvRQ8WrQts5?=
 =?us-ascii?Q?VgPazIjddfe4A4pcA9mjX78IkzAbOzidQ447o6wREBYdRmluqN/jBdB9dtrj?=
 =?us-ascii?Q?Wg5MXExYk18Vk2NigS5hYNZJ4KYVTzoh631YNb+qQkwkPX83Oopyj7FksnEp?=
 =?us-ascii?Q?ztca6QOSS7x1SDqoIYERU2nwIbv6k0SDr3fKBhamB+BPIJm3ns8mOf4bMfZI?=
 =?us-ascii?Q?6FV+clAoKyHGVYykldjp95jhXnUhX37HDRmRAHIn33w442iKcWhewzytuTDK?=
 =?us-ascii?Q?ko+mxRvBTAvPk/cK7ay3ITeO0cxIyWWOuPAf4PBACVBkcSvtdTnRseiVbudZ?=
 =?us-ascii?Q?ORo9xuyP8fpKhWp5Sunv3TczkOmDS2ZiKUf0/i+Cm3Tc6V7GcYt4uTnLPObA?=
 =?us-ascii?Q?iilGlhOAtmQAjBunemCati0hfOx4BJLSpIvKx4mxaQX7s07qrvUSs8jyyhY3?=
 =?us-ascii?Q?chRMPpu9BivunzAmHP7tc6YteopHWemnbUWg9WNXs3FYDe40IrG3jA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(7053199007)(38070700021)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?S/2Gexs+8B2haqHCnhZcFjlSmtUCDz2RwiY8oVsDixF59Fi8wgKdXvhD9ct7?=
 =?us-ascii?Q?v72Hof9zxpjNubnYaLRWAdWyMd9Qllx+cYgQ4BU18sGObsnXRxIdJumt9dUT?=
 =?us-ascii?Q?1QexYnWIX9+AJoUyEQwXIfFSDc7of4K4wxuA73L5EZooeD14LzOEK2bNnupW?=
 =?us-ascii?Q?3vG4o8/lACsK/uxIDDvRSKy8A9N7OPqcq2sUX+1Vq42OonQKBkBNP6iWicr7?=
 =?us-ascii?Q?ulfcgKAuxjGNzjlxvQjVvGeWhu7PI/hq8HWncryv5FVSZ/zV/oOEqlpOD/oM?=
 =?us-ascii?Q?2ktUQ+6dSj4vFcC8sV3TaMjyYQJKOs0SNIIatw+Q+ShUIoCitFF7+90XYjB+?=
 =?us-ascii?Q?bzMPH/qLKlDZJiRtK1wKPMUy6w08ewX0lZupembRta+xFuZTdHy50X2ABZ/k?=
 =?us-ascii?Q?m8JFBdl72e81M1C/lX8G62XinEZ3DghFZg9jKwU5Kgbt+wb6HAh6mxUDhNJq?=
 =?us-ascii?Q?fid7GV+HNLQUB2fqqQAGegwX7QLVP6uQ5Ew7kKucsrrnK2dULv4Ea0gEv6Cs?=
 =?us-ascii?Q?OaFjZRII3mPCvdWflF3oRhR3Nmqc3QWyhXFYUGzfTPW4vikYa49PHimG6MeT?=
 =?us-ascii?Q?P0L+zjJLybv1xITSt08j7/3Yt+KcPoFBxSli18QvovQuAzmMXdZZ0zm/YtTI?=
 =?us-ascii?Q?4sgWOtlJw0Xxa8VRF+1TjcpcM1T6gtgut6FlSKmuaXTf8+XnK67J3VDVGtRS?=
 =?us-ascii?Q?EAsLhkvrFObUUo8cbokV6bqQXuRDrX+WeeeA9za4KIvE5kTcXFHMXDxkiF0B?=
 =?us-ascii?Q?W38I3tCKHDLJ9cSLx5VXb1rMR5KxrC18Ns33f0CakQe6S1OcD7UoSzZPi4GM?=
 =?us-ascii?Q?F1ThwJ7c0ig11Cqs9piG7o3P95DkMda7bF0yXSsmAUYiPGrvBgI+aXGSQfnk?=
 =?us-ascii?Q?FRbG97o5n7hYqwM/SY3QoQyHU8Im6V1QpsCtvf0Su6t10EQZofTFgy376nV5?=
 =?us-ascii?Q?FfHV+v+wmx+MPU6hRW+Xw22GclYztc925jg+yPefI9By7J+hFfFXk3PPekF0?=
 =?us-ascii?Q?tzKyvCZGMTKNBsHvhhNvvtLQp3E7cAjTnncbo3z1B/+6PtECr6+Rvu9PtsGp?=
 =?us-ascii?Q?0u7kBsCMNI6jhWAx3+JZwxuY/HTaw/hnqRg3iieNbx2BxqCjDiQTPugM6r/2?=
 =?us-ascii?Q?Q45uI2macT3nO9TN9cwtL0BdGhpWgvoAbYsuKkVXiAiAreOkJGjCwQI2uRPT?=
 =?us-ascii?Q?VdU1LbDOtLDmFL2VP5sYeIR4ARvZ8apSoie8M9TTnfpK8bnTV5as8UxIqxB8?=
 =?us-ascii?Q?cHHeMCibtaegR7FT9GclsY1ln43ET4ZoHM1qOXqgfEjxQyZWeAs2zJh9HAQT?=
 =?us-ascii?Q?Kr8rFRESIsHECW2PoDlwvWEoCySOckKMpBvww2lBXGa7ZQEV2kol46amVQek?=
 =?us-ascii?Q?Go/4jlczUZ98xcJKSabQg8pvppyE0FPMdxWoCCd0FhAYkY+lEO+e0N/UhUPg?=
 =?us-ascii?Q?4h7ythX66/GpUPSpZW6Bd28GXHU3YXPf77tY5EIqMUEwWdi2NMun3maTCVxJ?=
 =?us-ascii?Q?NDWJ5DJeMP2ANVcj6dJJTU/K56qAcz5Hz1npilG8M+oFT9tOkZYXgbUpY1z9?=
 =?us-ascii?Q?cOi6OwDbsD0oQ4C6iqfZRd8mTDdxnXR37qVwcued?=
Content-Type: multipart/alternative;
	boundary="_000_GV2P189MB30059023A2E5F692FC6CB564FEF3AGV2P189MB3005EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb39a3d-459a-48c7-f872-08de11aa60a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 20:34:19.6340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8rbOfDWtqip5ryNxdr8LrOvMaJ9NMbOpCgBky9g2f8bAxpb7mPTf1qShnRLrsuPGSsyDKSOcEJszyop/PSGvYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 20:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225211

--_000_GV2P189MB30059023A2E5F692FC6CB564FEF3AGV2P189MB3005EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Gyorgy,

Thanks for the review!

I've updated the patch to make --with-plugins conditional on ptest being en=
abled,
following your feedback. Verified that both normal and ptest builds work as=
 expected.

v2:
- Enable --with-plugins only when ptest is enabled (per review feedback)

Signed-off-by: Your Name <pratik.farkase@est.tech>

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


--_000_GV2P189MB30059023A2E5F692FC6CB564FEF3AGV2P189MB3005EURP_
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
Hi Gyorgy,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for the review!</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I've updated the patch to make --with-plugins conditional on ptest being en=
abled,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
following your feedback. Verified that both normal and ptest builds work as=
 expected.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
v2:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
- Enable --with-plugins only when ptest is enabled (per review feedback)</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Signed-off-by: Your Name &lt;pratik.farkase@est.tech&gt;</div>
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

--_000_GV2P189MB30059023A2E5F692FC6CB564FEF3AGV2P189MB3005EURP_--

