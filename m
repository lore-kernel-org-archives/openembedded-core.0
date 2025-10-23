Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AAACCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 07:46:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.40])
 by mx.groups.io with SMTP id smtpd.web10.14864.1761205600367972911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 00:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=stGC2XxR;
 spf=pass (domain: est.tech, ip: 40.107.130.40, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIYleGl8/ibgUS414X/Ns1keCedHKGZB0ENTMj9r5xN9TQD9ker0gr3YynrPfyEBZ5ViJDAfeD9/Uk5Eu+rwc668qT6mSKVTdbt/zI64d85+rGTgk1i162UvoJOMlYrsG2pD1Y2Hn6HnbO1vI2ZUHP5fZsdUIXDynHPSe9HXkxPbJYt93uC/Hm6JNrByYuTKJ2lCEAqb3N0svSZO6sgaGTY3WxbPnYvsDO3moAvPZW65ah6GGjUXS4MlMb0ZKbQrBhVWybpffQvb/dRg1b4aJlVkPSVc+V4e9upiMUeNMdZt7aCpScmRnRpGMPpISevvgL/nUOsxmpfkrbJWSHuS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bl0Ga6lBpEdVORbEowRLPjL2ES5kRwNEBudGDTkQ9s=;
 b=lZfv9EESqOcEW2J33dVbzmLnPRJPJzhzugmNu2rAk7R1F1iwuRpRpPKJrbhkEcbgOz9qif1WPuL39JrMZSl1ZYBFStI8Zz3Fn6Ab7lawPDTPn3lDDP4jMFBuUCCQIiO50QhjBTHJA1nZ/jUPs45Cp5C+Kr7Chy2h2pNdYYMaEYizXYTuvz8JV3iwJ6RKajNJ2oxsi7GN30wxWOdWHEVCNdVP52/icPbvAOH+7/un3EWTcWkJKbSEZDWhZyFiGaKTw8biAsfnatoLrhNM9vqVa+UhMVvY8z3CSL8NBst/fa5g8ug+I0aZksJBCwb9hpN30NKrojp9mWsT8nj8f2auTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bl0Ga6lBpEdVORbEowRLPjL2ES5kRwNEBudGDTkQ9s=;
 b=stGC2XxRzK4/T0pIltPoRNctm7HANKgND/4ROZBNWWjCAIJJCFCvP5kSxiLW2fVlEahog1PnLZs7QB2aZBawXKZT6ub8me2fsuvSFu503DAEddSc47oSUD8bAAOZCgkBN8q1tIV1hNtg+Er/vCQEgvZgb2jAPaOBh8BS88MBa85GzZcLhsXGvQWc1GiiqK7yasGxlvWfYPCojgSu5iqJj8JUKKcIezZzRo2kyXMByFjgKU2KjzQgQUNCdqEeGhuitCa8sMkkUhtSpcj3+Bl6DJ8hDQCoKI2qGfEzyIZEO0xsxYwh68n9fzbsxupSUstqqlO7fCxVe9vG86n7lBFpWQ==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AM0P189MB0706.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 07:46:34 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9228.015; Thu, 23 Oct 2025
 07:46:33 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] libxslt: add ptest support
Thread-Topic: [OE-core] [PATCH v3] libxslt: add ptest support
Thread-Index: AQHcQ5RHyskhnlKf70aUoKugbGYRxbTPUrCAgAAH3+4=
Date: Thu, 23 Oct 2025 07:46:33 +0000
Message-ID: 
 <GV2P189MB3005D2AB777AA143172738F5FEF0A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20251022203158.7806-1-pratik.farkase@est.tech>
 <20251022204136.8276-1-pratik.farkase@est.tech>
 <1d258375-6779-4854-a02f-7e8df122a6c7@gmail.com>
In-Reply-To: <1d258375-6779-4854-a02f-7e8df122a6c7@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|AM0P189MB0706:EE_
x-ms-office365-filtering-correlation-id: 31596c47-204f-4740-1392-08de12084982
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|8096899003|13003099007|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?RIchsA1tdMHWu7kHPHHeq1HeSuWs8uVg9lwgzaAA9Xs/HZsulkcIFHWw?=
 =?Windows-1252?Q?2tOKPfV1y1A1C6KkUN046TnsCQS8P7gr2R/lfnRYCGogFwihF7KpbxwQ?=
 =?Windows-1252?Q?zVXj8Bss6CjH9MpVU5X5JPMDzRNovL8+gJ/oARcnM/RN5pr1QKUhXY15?=
 =?Windows-1252?Q?q93DG5S27YWPhqm8CWIi/ysR5E19OZ857wABjgRws75bfEUy9h/s9Wg0?=
 =?Windows-1252?Q?9MzyYeZUPX9uW8yAcFfXcJKGCXkfB9kXiktSJ7cDwbSFzre+gTFiXHyZ?=
 =?Windows-1252?Q?FRDU7jxd9P3kN2izWy2ll5WRevaxs0SDtdjm6fBsaBvvpWqFfv/l8n54?=
 =?Windows-1252?Q?Nk5/8+jHwyr4qADUVcexEJPWDR1IeeWJNv2vvITmXf6spT3LGpyh6nra?=
 =?Windows-1252?Q?G5Iqwzw8nBD5QOyQyTpinx8jpgGiGJiNbFBsJG5WJwg+7o4b5iqYay7c?=
 =?Windows-1252?Q?ka8ut8+J2/hCGZK2sBA0jv2n/9OYKweGr4ycoi9kRMsx5DE16x5HmrHa?=
 =?Windows-1252?Q?tmRFLaEQBg71UYoy01RlZCchIIvWihc/nRODJaarFcx9dWUYcKvmQfZ2?=
 =?Windows-1252?Q?46+66N3SY+2NYFTtXkc+2Z5MV4ZK+fwEx4RtYAcKMMs8dIV2p53ZJ60E?=
 =?Windows-1252?Q?0oIyuc+HOo8uACE3ZhN2A+h+KC51MVVB44PbEFa9RQ7p64P+w7UaSxz4?=
 =?Windows-1252?Q?UtLexGLV+ett6vWK4DcNyEDV44+tWzjaXTEaRmBXe1F0YfUZe7Z4K4qB?=
 =?Windows-1252?Q?AqeWp4NuiAZw5bfkc2sqfMBxcmO0eqWh5PDco2C1UxEM8ILD2nWXodUQ?=
 =?Windows-1252?Q?PWyb9DysRvuKAMoC5RY4+sqGnGvwDpgIpxYfwaDjkTuwwES/TOSLOP5s?=
 =?Windows-1252?Q?SSQzpXY9brzqBEfU3a8BF1Ymi7LRrDPH4Wua/q1JPhO7aK2avRiYg3El?=
 =?Windows-1252?Q?vrmhgip0CScCXGXrnKQGqIy2JI6BcXKdQg7u+oxIFD863/KbbQcyhuA8?=
 =?Windows-1252?Q?LLmjv5NvVbtkIjDT7PGrHFsuaUwixHeGRk1hzJWQ3rLkU1R9JBX/8KQo?=
 =?Windows-1252?Q?qKo/XRshffDMLYqdIhE/NdAOxEh9cn4tBygPd3hchaeUYcJvImiL0hax?=
 =?Windows-1252?Q?YF3jOlqrAVc4XprV+xspAcr51z0SaW3zsNjSXP5vqrbB0A5eBq9uipSx?=
 =?Windows-1252?Q?OLsNpbHbEQIGKyX//ozE1Ca2I9s5SQjZ9V0ohW/D1Zl3WMh/Bd0rZxJ1?=
 =?Windows-1252?Q?ApX3QMY3tvTNTrFhSLg+ArXbfEiR9WwMuAhcZpf4nBQI9ZPRjCJFOCJd?=
 =?Windows-1252?Q?8KyKz13HYjwXChNo5ianFuBM6dAz7NcStARb44ree0Tarer8m38aRRWo?=
 =?Windows-1252?Q?w/AbZJEc4G6eaWm+5OdWEwBh0lQaZdG0V12LPfIp6oCtfntb4D0IjljH?=
 =?Windows-1252?Q?WWUScma4z8lkLMuNSsFtL7aYcc8BidyBbl0yK+Wk6JQ8nQwUnvH7vrrO?=
 =?Windows-1252?Q?dyQPDRa35yQSBxjxu2bVUCZOXHaKmwr6IIzQeNzZ1NGApCIAdq4A3d4e?=
 =?Windows-1252?Q?C79FTsSGGxivShz7zegRu6I+O/KJGwbqi0YYLQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(8096899003)(13003099007)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?uNmc6YHO9EilUCjnC4RLgOVFCW5YxJfEoUw6HJf7HLx+yij4azMfb5Eh?=
 =?Windows-1252?Q?JwQEjxzeLbdsM8n/EoMgHd+9vsToKeqDUVZ0uU2UNeeUq8E3B4mT+Mb5?=
 =?Windows-1252?Q?F9PN2PUx915+HXjDjK5QPZEv1NpZF/mBwrwBLYIuSm6dsFTYFUsokCBP?=
 =?Windows-1252?Q?FfvrADfGlq9ZlC6TmCpPoFhYtfToynopvwI295hCLWen4iY35Rcaag/p?=
 =?Windows-1252?Q?Xts1hIFuuNrTrr1f2gfp0qHhgySI6E4l1L0tkwh7TUIImUIF8mnPrP3a?=
 =?Windows-1252?Q?FWx3fgsz9W52YqF10Ee7CG58Oxe/yTFUR2n3rFjVT4+13VovSZeC/H0+?=
 =?Windows-1252?Q?jwS8OM8+88fiow1C73JfwcBzvyAW6nD98MToO104kfcTV8rdq++METKZ?=
 =?Windows-1252?Q?2zubXfHsEKTPuPGEkJZRPyY/w44U3DF+kR3lsNJqH09g/VEW02Q/OUu5?=
 =?Windows-1252?Q?lLTNJv8Tds7BeI2e1X7p1g5MVl/303XrEgPPt3DWy6r82KVN9khWSO7v?=
 =?Windows-1252?Q?3ATY/JOq5YKRcYklvHEzle8f9/yij+pxjbE6e7ksrozvqYp6EYblGwPk?=
 =?Windows-1252?Q?I0kvu244ul3vcvkldnKKm4hF7neaayFgYD4tCw115wpTxzs2DjmZuIFZ?=
 =?Windows-1252?Q?WW+/eOrcmyZwwm2TPMfeeWsCwYJTu00kNr2K7glQsNK2LnXbRiOKIsTh?=
 =?Windows-1252?Q?wJY6QGv+LZEz/Trr+p9TTrbWDXIws6VoPq83/XdcckLIW2lSew3vLQIv?=
 =?Windows-1252?Q?dok3h8rY19pDh6VTPO1GvOh3zcVsNKfBM01NGZZV7sgVi5GMi65SaRu1?=
 =?Windows-1252?Q?XhC1R+7jQA763MRUkKrg8aZeMgTi+n0PqJ+UizOijlN/l5nYuMyaQejb?=
 =?Windows-1252?Q?x0POasajK1VRTgvGOcowDza9aIKZS+vUc/syANv6TQhCuYRer+g42Uul?=
 =?Windows-1252?Q?mHd0T6Y2MQnFArERxo/Cv7UbmXLftCSLicJU5BCKTxGw6A4TVj3OGoAn?=
 =?Windows-1252?Q?vFsp2pwadfguj+GPXKR7bVJtEa4IMcu5GGq9F7yvY/WUJZI/jC6dSfEL?=
 =?Windows-1252?Q?sCOLzYj/Z3Y329lQvNW134T+9n+EmR8G0SD6ZPnphl4IRu7nXxASuCB0?=
 =?Windows-1252?Q?Mk5MqRDGRhn6BJdQlSKSWk+oi6OZggKvso1f5dmIJqtv1c6rymPwCKp0?=
 =?Windows-1252?Q?ZJq5ZOi+mRUN4s2f5x5DPYvjNZ7nXXXtJg1hHRTD67un++9L+UO1xEVN?=
 =?Windows-1252?Q?OZ+W0GMJwbYjgv3peaD0HWPwHjbsqknOnrDRTjBWl5OaaDjmAiPprN2l?=
 =?Windows-1252?Q?y2e8vSaHFqEz6wGVjGsz5uOB08X0b311WvNxwItqznSTlN46pC+WoU6i?=
 =?Windows-1252?Q?jXnCe1DsM0CneyQPDgOaV+opnW5UqUkOswObOF0KaK+aHvM8JiuGS5Og?=
 =?Windows-1252?Q?vlKkFKc02nrMx1xG2RRAHgWWdV6CQ0TXjMXrVaz2vGBRtXCemwDxIsuD?=
 =?Windows-1252?Q?HahqtpJF69onzmVSo0a8y1iGxbJ8VAK6wXlSZEQabrC65aROlDprXdmD?=
 =?Windows-1252?Q?2XJrca/QmzXEWLeY7pwkMZK4twFYkCUcRJr7t9afIQFveYHsS5wrY97I?=
 =?Windows-1252?Q?CwIz8lnjJFQfg31mpbPVOeSxseolJbcPyzpIAl+Zl8zdoGb2zAYuBsSs?=
 =?Windows-1252?Q?5Wd5lJxpTS1Ok+jj7j7PVQHjImYpwn+W?=
Content-Type: multipart/alternative;
	boundary="_000_GV2P189MB3005D2AB777AA143172738F5FEF0AGV2P189MB3005EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 31596c47-204f-4740-1392-08de12084982
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 07:46:33.5229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K6RBWT+CYxn5VPDXgUSLn9moP7DlMRzZWgabNNPzxEvVmGjTWBtKv39ePTADtuv3/QXDeAphKH/9PjdhBI9J3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0706
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 07:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225223

--_000_GV2P189MB3005D2AB777AA143172738F5FEF0AGV2P189MB3005EURP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Gyorgy,

Yes, the ":append:ptest" syntax works as intended here =97 it's functionall=
y
equivalent to using bb.utils.contains('PTEST_ENABLED', '1', ...), but is th=
e
newer override-style form that's been adopted widely in OE-Core recipes.

I verified that EXTRA_OECONF includes "--with-plugins" only when ptest is
enabled (DISTRO_FEATURES contains "ptest"). I tested both of these override=
s
and the result seems to be same.

So the existing form behaves correctly, but I can switch to the older
conditional form if preferred.

Thanks for this good suggestion!

Best Regards,
Pratik
________________________________
From: Gyorgy Sarvari <skandigraun@gmail.com>
Sent: 23 October 2025 9:16 AM
To: Pratik Farkase <pratik.farkase@est.tech>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] libxslt: add ptest support

On 10/22/25 22:41, Pratik Farkase via lists.openembedded.org wrote:
> Add ptest support for libxslt 1.1.43 including:
> - do_compile_ptest and do_install_ptest
> - test data installation
> - cleanup of buildpath references
> - added run-ptest installation
>
> Enable --with-plugins only when ptest is enabled, per review feedback.
>
> v3:
> - Remove unconditional --with-plugins (leftover from v2)
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/libxslt/files/run-ptest  | 25 ++++++++++++
>  .../recipes-support/libxslt/libxslt_1.1.43.bb | 40 +++++++++++++++++--
>  3 files changed, 63 insertions(+), 3 deletions(-)
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
> index e08e92085d..c1793710e5 100644
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
> @@ -26,7 +27,39 @@ S =3D "${WORKDIR}/libxslt-${PV}"
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
>
>  do_configure:prepend () {
>        # We don't DEPEND on binutils for ansidecl.h so ensure we don't us=
e the header.
> @@ -39,6 +72,7 @@ do_configure:prepend () {
>  }
>
>  EXTRA_OECONF =3D "--without-python --without-debug --without-crypto"
> +EXTRA_OECONF:append:ptest =3D " --with-plugins"

Hmmmm... does this work as intended? Just trying to confirm. It might
work, override logic have surprised me before, but I'm not familiar with
this syntax... I was thinking for more along the lines of
EXTRA_OECCONF +=3D "${@bb.utils.contains('PTEST_ENABLED, '1',
'--with-plugins', '')}"

But if this works too, then there is no need to change.

>  # older versions of this recipe had ${PN}-utils
>  RPROVIDES:${PN}-bin +=3D "${PN}-utils"
>  RCONFLICTS:${PN}-bin +=3D "${PN}-utils"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225212): https://lists.openembedded.org/g/openembedde=
d-core/message/225212
> Mute This Topic: https://lists.openembedded.org/mt/115899975/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sk=
andigraun@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_GV2P189MB3005D2AB777AA143172738F5FEF0AGV2P189MB3005EURP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
Yes, the &quot;:append:ptest&quot; syntax works as intended here =97 it's f=
unctionally</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
equivalent to using bb.utils.contains('PTEST_ENABLED', '1', ...), but is th=
e</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
newer override-style form that's been adopted widely in OE-Core recipes.</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I verified that EXTRA_OECONF includes &quot;--with-plugins&quot; only when =
ptest is</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
enabled (DISTRO_FEATURES contains &quot;ptest&quot;). I tested both of thes=
e overrides</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
and the result seems to be same.&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
So the existing form behaves correctly, but I can switch to the older</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
conditional form if preferred.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for this good suggestion!</div>
<div id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Pratik</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Gyorgy Sarvari &lt;sk=
andigraun@gmail.com&gt;<br>
<b>Sent:</b> 23 October 2025 9:16 AM<br>
<b>To:</b> Pratik Farkase &lt;pratik.farkase@est.tech&gt;; openembedded-cor=
e@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<b=
r>
<b>Subject:</b> Re: [OE-core] [PATCH v3] libxslt: add ptest support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 10/22/25 22:41, Pratik Farkase via lists.openem=
bedded.org wrote:<br>
&gt; Add ptest support for libxslt 1.1.43 including:<br>
&gt; - do_compile_ptest and do_install_ptest<br>
&gt; - test data installation<br>
&gt; - cleanup of buildpath references<br>
&gt; - added run-ptest installation<br>
&gt;<br>
&gt; Enable --with-plugins only when ptest is enabled, per review feedback.=
<br>
&gt;<br>
&gt; v3:<br>
&gt; - Remove unconditional --with-plugins (leftover from v2)<br>
&gt;<br>
&gt; Signed-off-by: Pratik Farkase &lt;pratik.farkase@est.tech&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../distro/include/ptest-packagelists.inc&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 1 +<br>
&gt;&nbsp; meta/recipes-support/libxslt/files/run-ptest&nbsp; | 25 ++++++++=
++++<br>
&gt;&nbsp; .../recipes-support/libxslt/libxslt_1.1.43.bb | 40 +++++++++++++=
++++--<br>
&gt;&nbsp; 3 files changed, 63 insertions(+), 3 deletions(-)<br>
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
&gt; index e08e92085d..c1793710e5 100644<br>
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
&gt; @@ -26,7 +27,39 @@ S =3D &quot;${WORKDIR}/libxslt-${PV}&quot;<br>
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
&gt;&nbsp; <br>
&gt;&nbsp; do_configure:prepend () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # We don't DEPEND on binutil=
s for ansidecl.h so ensure we don't use the header.<br>
&gt; @@ -39,6 +72,7 @@ do_configure:prepend () {<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp; EXTRA_OECONF =3D &quot;--without-python --without-debug --withou=
t-crypto&quot;<br>
&gt; +EXTRA_OECONF:append:ptest =3D &quot; --with-plugins&quot;<br>
<br>
Hmmmm... does this work as intended? Just trying to confirm. It might<br>
work, override logic have surprised me before, but I'm not familiar with<br=
>
this syntax... I was thinking for more along the lines of<br>
EXTRA_OECCONF +=3D &quot;${@bb.utils.contains('PTEST_ENABLED, '1',<br>
'--with-plugins', '')}&quot;<br>
<br>
But if this works too, then there is no need to change.<br>
<br>
&gt;&nbsp; # older versions of this recipe had ${PN}-utils<br>
&gt;&nbsp; RPROVIDES:${PN}-bin +=3D &quot;${PN}-utils&quot;<br>
&gt;&nbsp; RCONFLICTS:${PN}-bin +=3D &quot;${PN}-utils&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#225212): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/225212">
https://lists.openembedded.org/g/openembedded-core/message/225212</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11589997=
5/6084445">
https://lists.openembedded.org/mt/115899975/6084445</a><br>
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

--_000_GV2P189MB3005D2AB777AA143172738F5FEF0AGV2P189MB3005EURP_--

