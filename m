Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0BACD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:08:16 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45353.1781183804327721700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 06:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=k1Pv+HxT;
 spf=pass (domain: est.tech, ip: 40.107.130.45, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5ek3Tb0J6h59CFHw3xPsg4gcQ43AnEavo3nsnfSlVV4DxJW6cTW/GPEHjbtz0EtRshe6+a92CspOBcWxIkhAe4ba5v0vEP2DXOHCqagcwr08oc9xXir7idGnKh4H3MSKT+SEwP6xAONdLD2z9jAaumGORoa58Sb1j/MCRU2fkcZPJpF3cttmB56aqjAAQPm33e4aMdnsVjPTxv1rKYN+8mg66w+++8SC1eGFhOFSFNcoE90d3O7bwN/zUBzuD/AqfnO+9kbDg4T5q0E9qP96JCclsGK1mBiwU5DFWc4lcvua8bBR8kA1W4efReYHQcSfBAWxfHur1YAszNLJ8/82A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jImqKyiG1onaVQ7oojNemlzR3cKUlOPPm9H6+Uyro1g=;
 b=hkW71lwRsktXhGTyUnLjN102TL08wfkiqqNc1UVDArHFCBqLsBQc6LyD9ORYsumWaWoD8vrN7B+nLPRBqGV8EHf6BJsntfkpi2e0Cvk30+nZSc856mYbIXOf3SX8GOqd8kyxuK+JUstoKvANN9h15OZXWrhcpq1SI9SftdsOiKsAwFpOm4d/qbK1322dQ8xLwFiDQ4gmIGtmRq/tm0pE678xGZ3AOeF9xT93cN1PFj1PTeT8jTnT7bZ+4VUy1vdh2ksEgbUrrItpJjZ3Gj6QQ2D/2r9lWjwNO6DVTzEaexN8aygC7FvBNTKU5HcVwoMplO2SdHIUIadnTfdpnxPNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jImqKyiG1onaVQ7oojNemlzR3cKUlOPPm9H6+Uyro1g=;
 b=k1Pv+HxTevbaU9zpXfVYY1KKp/xBFaMeIA7FX8ym9o6S5ew9hAiuJ4Gj3HOMHgUxlRzAtRq2QNWXxsOa2ja6leZbZ5pcLkTgAcVszy3gJG+gh8FvUxVyEzF2VCXen2k3JiVD5O64JnxrKYB1EbykM/GEnLxjrcDMO+lIG84tD+g17wWd150GbEA/5LhF2+z7UimZFoa99fhRfjW6HWd32EGdQcflGbLMfnnutAJDy4T7dJuogSuUoHfehpcl90Ljy5NqQzRnEmg/mZvK+gP8eWiTTnsknR3mdPZV5sefeqQztkhYmHx+UpKpX6HRT8wbK1xSdTini23LtmMJ2inMiw==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AM4P189MB3487.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 13:16:38 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 13:16:38 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Jeremy Rosen <jeremy.rosen@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] openssh: fix CVE-2026-35386
Thread-Topic: [OE-core][scarthgap][PATCH] openssh: fix CVE-2026-35386
Thread-Index: AQHc6eajof3E5u7zs0m2PyizsWmTkbY5JikAgABLYPo=
Date: Thu, 11 Jun 2026 13:16:38 +0000
Message-ID: 
 <AS8P189MB167285B322B69732D91890CEB31B2@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260522122927.530024-1-adarsh.jagadish.kamini@est.tech>
 <DJ62XSGKYO25.UE3DCDH36ILV@smile.fr>
In-Reply-To: <DJ62XSGKYO25.UE3DCDH36ILV@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|AM4P189MB3487:EE_
x-ms-office365-filtering-correlation-id: 0a7bb0c8-8581-42be-a268-08dec7bbab74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|16056099006|4143699003|12006099003|6133799003|11063799006|8096899003|56012099006|25016099003|29003799003|3023799007|22082099003|38070700021|18002099003|13003099007;
x-microsoft-antispam-message-info: 
 RtJxEw3wawRCWSTGpAP/Toi7Mck7VMT8Q9I+CKn3Xh+ModcP1YSGl3XwMwQRytpFYVtBiEDsHtZ017pMk+FD56ozR70KuwpvdFVbQU2J9bWzJc94JrEgFld8k3eBeG06xiE0tkiXAnGIfeQ7GuB/tfRC3vwHnDHiw4JRFnZFO6OB6Xn5Rdz16NaQrc/UAPxVRz/tS9hGnY+xaLcBI7vc+hweGOA7g7BYrhhSjOC/boWU0DtSq39f6tinmSC+5T/8O2R8ajePWGtERHv7znzl7KYsBrlXjXc4t6UvfSlh2Oy9ujI0Qt+H9729yRyOY45hliHrPdkL8CaAf3ap9R8YosLwZPeOkhUfMyRz8bh0EUuB75C5ETuHcpLh0FRZiruoKgD5S40ZjO/Zf7xUtpz5VFHIkNw/cbmeuZcEH7kuve3D6Tji58MOq7letvfDPy630rGdrDiNEKq5GZToGJADezQwm7AygHm/lQkAVeKKs9WhWf6qgLeuHIQ8z/N9vepf+qH0lhQQbM8PqxYVSxYORgJWef9ch6LWIA5tYOBKgCzVn04p4TAob3i+erO4Wh2dUegaU2V8a4jiljMLCe16Ksu/vt3UmtNNJz8ZriilaLm5rjPXPw7+VmXGiPbaaZduQcXjHmDPsu2Pq8nq+dQuqPJ5gzDUReuWq1/nV3eE8H/ldmNrf+85DXvDscF3AQVNb4uQcSjADJ8kpp4R3JOgdA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(16056099006)(4143699003)(12006099003)(6133799003)(11063799006)(8096899003)(56012099006)(25016099003)(29003799003)(3023799007)(22082099003)(38070700021)(18002099003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3N6Or0AbgX3lwXfRLHx/jOpgb9VUgppHn+PbgZ4cctowSSPit9J2dRNR/Z?=
 =?iso-8859-1?Q?exdsMO8zzfmVfENRSPCnBaU96l/5Ut6GhP5obmnKUNDepT9fj1C5mrZrAF?=
 =?iso-8859-1?Q?nFZkjxpySv+oDnBUwJn3lTYV6VhD5xKYP+t459cUk98ZgV/qhHirgZjAz5?=
 =?iso-8859-1?Q?C3NGLP0Nuv8QyrvqbVKDafKIt5XKNfeHirnmRwnYKmY/weIoZQpq2UfF/L?=
 =?iso-8859-1?Q?tG9jbZrCoHxDmnClJzYYN6WjVsevjfkLnCm2pUvc9AhWtRPOQFWqTpqHhd?=
 =?iso-8859-1?Q?PkWw6VGVlbfKjeXEP74IGlS9l1Htt4inLzxC4l6yz2lEsEX4ikY2OIGNIJ?=
 =?iso-8859-1?Q?xHV6ZtydQtlKsmvZb0J6Aw5nCrd/s44mNim05WL3wYYvVwXf2xV5a+XSbT?=
 =?iso-8859-1?Q?GO9hp1tvbC5oCGle6J4lxswqGFtJIrJhSwkHnWVp2UoN04k0MsI2NRDbbw?=
 =?iso-8859-1?Q?OAakG226epdTVcQ02uBvr4mNhm3c4QyVS/Mm22MHqAtZLBXuPC9yl+mdSn?=
 =?iso-8859-1?Q?FICKlomMzUqAmll159ppMgMQubiYU6yOT02LkAW2MB6oKSH58suQ//1tvH?=
 =?iso-8859-1?Q?LmZbvlBSjQ8UNXyZzDDl9eWsph4xo8mlqEGPAvveuY6a52Y0Nloh8Dz8u1?=
 =?iso-8859-1?Q?cclNFB566hTCo4LpLUx9M8kHyAjRMJr57iYlVHzI7ynCaJg+iCubsg4kIf?=
 =?iso-8859-1?Q?eILSntCFMVfQc8IL9SlCCrx13OqQJcJo5SyIZFcjWlDy2mPbSFVQu7I9c6?=
 =?iso-8859-1?Q?3BycIJFEieFoVlqPKCuSjjPN+WJLpuVSBPez7+AYbwgW8mifawMLy3R5XX?=
 =?iso-8859-1?Q?6j5fAsnEwfYctau7dKEWLLljJwhSDnB4jRmY24hB1IDeJMHS07dTaC1Eea?=
 =?iso-8859-1?Q?95lqXgHt9Yvdj9o6wR/5Hpr/vF1UBFJI9vnCxUo/uB4zMOfukfB6Oey32N?=
 =?iso-8859-1?Q?GAB7QerVeJ1K17nRrIyAcFJQdnWkqQ8aLvAd/vj5N/0Str2cHaTVV2PPCT?=
 =?iso-8859-1?Q?5xtbpr1CEGnbGGwqFUc1lHioi9R7+bNVXop5v+z4kwjwVpkKH/eTqs43rd?=
 =?iso-8859-1?Q?daawxqogp5gml+Z4tgxxFoAXbvtpcu6jmlYdx28i5bdUSiU9l4Jix13nnO?=
 =?iso-8859-1?Q?Nd97F4sS6jAe8kzqBFPGERMlknr0aoCvP2w62+ddT94fGZ9TxSUtO4MFms?=
 =?iso-8859-1?Q?ICI3rOxJEY03Kg9kCdsPGZLnr84TRucHUGtTLHCeHK+0u3O6qC+F//m8FK?=
 =?iso-8859-1?Q?pBggQHWfTWCyv/irItnIwBqkALVVnxMAgeSpvb6SnWXgdsWXD1GL204CuG?=
 =?iso-8859-1?Q?K0cInrspftBN2O60is3GYYt8tRfQBQf9ol/lRzSAGUSMhn68W5kMpm0SQ0?=
 =?iso-8859-1?Q?1djpJDP6MCA0C+lGmRYP92CKC8bdk+6ipo/PwT5wLzAjJmjbhWO4uUL3gE?=
 =?iso-8859-1?Q?KuwsgMFl7bP+pjITzuo3ULzsNQ5HSqau3fIpsgaJMQlzkh14j0c0fsfXYt?=
 =?iso-8859-1?Q?BNwjcnc8pjl4CRF009wZR/ZRwyRVu3x5UpoC/CtatewLDLLK88ViSluuV0?=
 =?iso-8859-1?Q?WqAQwsc1EgQLRipfrubcin6B0+iZI6ipik/yy2YyQ+Mgyht8KLi0188ppS?=
 =?iso-8859-1?Q?RYREpTD8EK0lZVH52WFUJWSRbQ+lrW2OV3Ex3zrbHgR2ONQONTCwPWp5bJ?=
 =?iso-8859-1?Q?07wwpH0+d7qNE1BKga9TyTAYfJyW6LJZ3/dZJIXann5Ydyddh3JlNXuHXT?=
 =?iso-8859-1?Q?QTNDg5THA0Sfi425KoKs/ADgFS5wk57TeS7/oLSH1z7r+wLGBoWHRACEsn?=
 =?iso-8859-1?Q?xr/n6FoxVP0q8myEG29e/NBR6UAar0E=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7bb0c8-8581-42be-a268-08dec7bbab74
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 13:16:38.0673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSUWMC54a8tY2N7F/wmsbWW2o56P3RdhT1iipPoFrfaTs2V4g4rg7eIwYbQ6mTsvRr720xMJCFP8stk3MJpTMLlvm2nB5tD6N6aCkI4mU9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3487
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB167285B322B69732D91890CEB31B2AS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238451

--_000_AS8P189MB167285B322B69732D91890CEB31B2AS8P189MB1672EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jeremy,
Thanks for your comments.

I had a look again, and I see that CVE-2025-61984 patch already fixes this =
vulnerability too. So CVE-2026-35386 is effectively already covered.

I'll rename the patch to CVE-2025-61984_CVE-2026-35386.patch, add the secon=
d CVE tag, and drop the separate patch.

Thanks!
________________________________
From: Jeremy Rosen <jeremy.rosen@smile.fr>
Sent: Thursday, June 11, 2026 10:33
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] openssh: fix CVE-2026-35386

Hello Adarsh

This patch seems strange for various reasons

The only thing it does is move the check for valid_hostname, it does not
include the original fix (check for valid_ruser)

This is also strange since this particular fix seems to already be
included (in a slightly different form) in CVE-2025-61984.patch

(also your patch name includes a -1 in its name)

Please check what is going on here... if the above patch fixes two CVE,
please add the second CVE line to the correct patch and rename it to
CVE-2025-61984_CVE-2026-35386.patch

Thanks a lot
Jeremy

On Fri May 22, 2026 at 2:29 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Backport patch to fix CVE-2026-35386.
> https://nvd.nist.gov/vuln/detail/CVE-2026-35386
>
> Upstream fix:
>   https://github.com/openssh/openssh-portable/commit/76685c9b09a66435cd2a=
d8373246adf1c53976d3
>
> Tested with openssh ptest suite via do_testimage on core-image-minimal.
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../openssh/openssh/CVE-2026-35386-1.patch    | 65 +++++++++++++++++++
>  .../openssh/openssh_9.6p1.bb                  |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35=
386-1.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35386-1.p=
atch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35386-1.patch
> new file mode 100644
> index 0000000000..a4b81bf407
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35386-1.patch
> @@ -0,0 +1,65 @@
> +From 96968048d6bb9a3183882b7af0630895bd4e7059 Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Thu, 2 Apr 2026 07:50:55 +0000
> +Subject: [PATCH] upstream: move username validity check for usernames
> + specified on
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +the commandline to earlier in main(), specifically before some contexts =
where
> +a username with shell characters might be expanded by a %u directive in
> +ssh_config.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +We continue to recommend against using untrusted input on
> +the SSH commandline. Mitigations like this are not 100%
> +guarantees of safety because we can't control every
> +combination of user shell and configuration where they are
> +used.
> +
> +Reported by Florian Kohnh=E4user
> +
> +OpenBSD-Commit-ID: 25ef72223f5ccf1c38d307ae77c23c03f59acc55
> +
> +Backport notes: The upstream commit uses renamed functions
> +(ssh_valid_hostname, ssh_valid_ruser) that don't exist in 9.6p1.
> +Adapted to use the existing function names (valid_hostname, valid_ruser)=
.
> +
> +CVE: CVE-2026-35386
> +Upstream-Status: Backport [https://github.com/openssh/openssh-portable/c=
ommit/76685c9b09a66435cd2ad8373246adf1c53976d3]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + ssh.c | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/ssh.c b/ssh.c
> +index 9c49f98a8..951da74fa 100644
> +--- a/ssh.c
> ++++ b/ssh.c
> +@@ -1,4 +1,4 @@
> +-/* $OpenBSD: ssh.c,v 1.599 2023/12/18 14:47:44 djm Exp $ */
> ++/* $OpenBSD: ssh.c,v 1.630 2026/04/02 07:50:55 djm Exp $ */
> + /*
> +  * Author: Tatu Ylonen <ylo@cs.hut.fi>
> +  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
> +@@ -1160,10 +1160,14 @@ main(int ac, char **av)
> +      if (!host)
> +              usage();
> +
> +-    if (!valid_hostname(host))
> +-            fatal("hostname contains invalid characters");
> ++    /*
> ++     * Validate commandline-specified values that end up in %tokens
> ++     * before they are used in config parsing.
> ++     */
> +      if (options.user !=3D NULL && !valid_ruser(options.user))
> +              fatal("remote username contains invalid characters");
> ++    if (!valid_hostname(host))
> ++            fatal("hostname contains invalid characters");
> +      options.host_arg =3D xstrdup(host);
> +
> +      /* Initialize the command to execute on remote host. */
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.6p1.bb
> index 1cdd888ccb..98176a971b 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -34,6 +34,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
>             file://CVE-2025-32728.patch \
>             file://CVE-2025-61985.patch \
>             file://CVE-2025-61984.patch \
> +                file://CVE-2026-35386-1.patch \
>             "
>  SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd536=
2de09385aa7a777c"
>


--_000_AS8P189MB167285B322B69732D91890CEB31B2AS8P189MB1672EURP_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Jeremy,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for your comments.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif;">
<span style=3D"font-size: 12pt; color: rgb(0, 0, 0);">I had a look again, a=
nd I see that
</span><span style=3D"font-size: 11pt; color: rgb(0, 0, 0);">CVE-2025-61984=
 patch already fixes this vulnerability too. So CVE-2026-35386 is effective=
ly already covered.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I'll rename the patch to CVE-2025-61984_CVE-2026-35386.patch, add the secon=
d CVE tag, and drop the separate patch.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jeremy Rosen &lt;jere=
my.rosen@smile.fr&gt;<br>
<b>Sent:</b> Thursday, June 11, 2026 10:33<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH] openssh: fix CVE-2026-35386=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello Adarsh<br>
<br>
This patch seems strange for various reasons<br>
<br>
The only thing it does is move the check for valid_hostname, it does not<br=
>
include the original fix (check for valid_ruser)<br>
<br>
This is also strange since this particular fix seems to already be<br>
included (in a slightly different form) in CVE-2025-61984.patch<br>
<br>
(also your patch name includes a -1 in its name)<br>
<br>
Please check what is going on here... if the above patch fixes two CVE,<br>
please add the second CVE line to the correct patch and rename it to<br>
CVE-2025-61984_CVE-2026-35386.patch<br>
<br>
Thanks a lot<br>
Jeremy<br>
<br>
On Fri May 22, 2026 at 2:29 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; Backport patch to fix CVE-2026-35386.<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-35386">https://nv=
d.nist.gov/vuln/detail/CVE-2026-35386</a><br>
&gt;<br>
&gt; Upstream fix:<br>
&gt;&nbsp;&nbsp; <a href=3D"https://github.com/openssh/openssh-portable/com=
mit/76685c9b09a66435cd2ad8373246adf1c53976d3">
https://github.com/openssh/openssh-portable/commit/76685c9b09a66435cd2ad837=
3246adf1c53976d3</a><br>
&gt;<br>
&gt; Tested with openssh ptest suite via do_testimage on core-image-minimal=
.<br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../openssh/openssh/CVE-2026-35386-1.patch&nbsp;&nbsp;&nbsp; | 6=
5 +++++++++++++++++++<br>
&gt;&nbsp; .../openssh/openssh_9.6p1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
1 +<br>
&gt;&nbsp; 2 files changed, 66 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE=
-2026-35386-1.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35386-=
1.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35386-1.patch<=
br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a4b81bf407<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35386-1.patch=
<br>
&gt; @@ -0,0 +1,65 @@<br>
&gt; +From 96968048d6bb9a3183882b7af0630895bd4e7059 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: &quot;djm@openbsd.org&quot; &lt;djm@openbsd.org&gt;<br>
&gt; +Date: Thu, 2 Apr 2026 07:50:55 +0000<br>
&gt; +Subject: [PATCH] upstream: move username validity check for usernames=
<br>
&gt; + specified on<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +the commandline to earlier in main(), specifically before some contex=
ts where<br>
&gt; +a username with shell characters might be expanded by a %u directive =
in<br>
&gt; +ssh_config.<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +We continue to recommend against using untrusted input on<br>
&gt; +the SSH commandline. Mitigations like this are not 100%<br>
&gt; +guarantees of safety because we can't control every<br>
&gt; +combination of user shell and configuration where they are<br>
&gt; +used.<br>
&gt; +<br>
&gt; +Reported by Florian Kohnh=E4user<br>
&gt; +<br>
&gt; +OpenBSD-Commit-ID: 25ef72223f5ccf1c38d307ae77c23c03f59acc55<br>
&gt; +<br>
&gt; +Backport notes: The upstream commit uses renamed functions<br>
&gt; +(ssh_valid_hostname, ssh_valid_ruser) that don't exist in 9.6p1.<br>
&gt; +Adapted to use the existing function names (valid_hostname, valid_rus=
er).<br>
&gt; +<br>
&gt; +CVE: CVE-2026-35386<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/openssh/open=
ssh-portable/commit/76685c9b09a66435cd2ad8373246adf1c53976d3">https://githu=
b.com/openssh/openssh-portable/commit/76685c9b09a66435cd2ad8373246adf1c5397=
6d3</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.=
tech&gt;<br>
&gt; +---<br>
&gt; + ssh.c | 10 +++++++---<br>
&gt; + 1 file changed, 7 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/ssh.c b/ssh.c<br>
&gt; +index 9c49f98a8..951da74fa 100644<br>
&gt; +--- a/ssh.c<br>
&gt; ++++ b/ssh.c<br>
&gt; +@@ -1,4 +1,4 @@<br>
&gt; +-/* $OpenBSD: ssh.c,v 1.599 2023/12/18 14:47:44 djm Exp $ */<br>
&gt; ++/* $OpenBSD: ssh.c,v 1.630 2026/04/02 07:50:55 djm Exp $ */<br>
&gt; + /*<br>
&gt; +&nbsp; * Author: Tatu Ylonen &lt;ylo@cs.hut.fi&gt;<br>
&gt; +&nbsp; * Copyright (c) 1995 Tatu Ylonen &lt;ylo@cs.hut.fi&gt;, Espoo,=
 Finland<br>
&gt; +@@ -1160,10 +1160,14 @@ main(int ac, char **av)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!host)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; usage();<br>
&gt; + <br>
&gt; +-&nbsp;&nbsp;&nbsp; if (!valid_hostname(host))<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
atal(&quot;hostname contains invalid characters&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp; /*<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * Validate commandline-specified values tha=
t end up in %tokens<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * before they are used in config parsing.<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (options.user !=3D NULL &amp;&amp; =
!valid_ruser(options.user))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; fatal(&quot;remote username contains invalid characters&quot;);<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp; if (!valid_hostname(host))<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
atal(&quot;hostname contains invalid characters&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; options.host_arg =3D xstrdup(host);<br=
>
&gt; + <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Initialize the command to execute o=
n remote host. */<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta=
/recipes-connectivity/openssh/openssh_9.6p1.bb<br>
&gt; index 1cdd888ccb..98176a971b 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb<br>
&gt; @@ -34,6 +34,7 @@ SRC_URI =3D &quot;<a href=3D""></a>http://ftp.openbs=
d.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2025-32728.patch">file://CVE-2025-32728.patch</a> \=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2025-61985.patch">file://CVE-2025-61985.patch</a> \=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2025-61984.patch">file://CVE-2025-61984.patch</a> \=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-35386-1.patch">file://CVE-=
2026-35386-1.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;910211c07255a8c5ad654391b40ee598007=
10dd8119dd5362de09385aa7a777c&quot;<br>
&gt;&nbsp; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8P189MB167285B322B69732D91890CEB31B2AS8P189MB1672EURP_--

