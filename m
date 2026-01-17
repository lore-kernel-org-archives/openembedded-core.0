Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B337C98329
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 13:36:30 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8158.1768656980797094536
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jan 2026 05:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=JvX1azf7;
 spf=pass (domain: axis.com, ip: 52.101.66.32, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQOhEFXwmoVGZQ0yY1KxGX11I2Jxv/AgsT7hzZB1P1D+yveV44kpKqIXbI9wypXjbXa+R5zqUuyIk2fISjjjCMEwOjgxV1fb2NvG+wNb07sz5EnHIQjUbvCk3tgeagpnW57/ovcNKN+V8u5BG3Z4PVbuDVmmq3WJeDPl4w9/xi5q12e2RncvMSbSEsO/e7RPAZW7t8JGEZDYbYLiCqinMlJoOCNzCwrdBvl4RI5SpbLDLd+oKTjvgDII7dwrmX2TYrTpzISM1APco1LIgY1wfOYcUsvYYFWcP8nHVM+DBdUVcO9H0gPJ4VfUMtgyaIWtCWHmM6KdsOkfHL3q83TEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U26IYwGCDVrdK9p1e7a4OJN3Il9SllXI5wcrKotrB0Y=;
 b=F199HqlbTpdP6JSIoJVMCjcEyZD4AvTDwwMG5NRarIWICcSa6SlGLGBnSt6XWJ7OTiEgkWl238vOW7/vCHDcRgrmTQ8cBrbItQz///s8NiMYd6j+pKiPUPtx3hAMRCpZ2zhu0F5QRG89na33Fp7NfF681sMUl/dQTsM80g3eNV2YsjTXza2dOlLuLaPQpP6KGoukaeb8C0dqvJ2KGjutnog4mh/G2CzauivWp7rtOWK2qRu63HJb+QN1KivOyxcwTlkvWeHVYcno5O0bgBvLNwOpoCGVMemjGo9iBLbsDO+eOoNx5/eDtLRmKP+Di9A5H2aCaRhh0tltuVJvyaWfhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U26IYwGCDVrdK9p1e7a4OJN3Il9SllXI5wcrKotrB0Y=;
 b=JvX1azf7p8TtOaunWPH7hZpcS8AzqKFhbY31pL5VuHIEyKhM6ZJeFHJUDc6f5fSeOFyd3/IiKuX7DhR/uutvjRzBHKbrXPQvwlnVs1V6hwdmHdYHtdOeK2CnqnL9OKadMuKsmU2Uw9c99dio58x+9OQ/k1iuhezC9sxuijjCgvY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB8PR02MB5868.eurprd02.prod.outlook.com (2603:10a6:10:116::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Sat, 17 Jan
 2026 13:36:16 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9520.003; Sat, 17 Jan 2026
 13:36:16 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "valentin.boudevin@gmail.com" <valentin.boudevin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "daniel.turull@ericsson.com" <daniel.turull@ericsson.com>,
	"jerome.oufella@savoirfairelinux.com" <jerome.oufella@savoirfairelinux.com>,
	"antonin.godard@bootlin.com" <antonin.godard@bootlin.com>
Subject: RE: [OE-core] [PATCH v5 2/4] generate-cve-exclusions: Add a .bbclass
Thread-Topic: [OE-core] [PATCH v5 2/4] generate-cve-exclusions: Add a .bbclass
Thread-Index: AQHchxw9pDuZGpscJEWCPdJiJ9f0prVWXQMA
Date: Sat, 17 Jan 2026 13:36:16 +0000
Message-ID: 
 <DB5PR02MB102136612472AF32CE794B59BEF8AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260116190520.118714-1-valentin.boudevin@gmail.com>
 <20260116190520.118714-4-valentin.boudevin@gmail.com>
In-Reply-To: <20260116190520.118714-4-valentin.boudevin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB8PR02MB5868:EE_
x-ms-office365-filtering-correlation-id: 40b3ffae-2967-47e3-12e3-08de55cd63a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?4Dr43BeKq/q87i5fxRMZqZ6QNfVh1hDSrKGqz5k9kT9S2l+EivPhST/jtiZ3?=
 =?us-ascii?Q?q83Sf+ANzJ7WwPWFUrLreC8JttcqLRyr7yOVc5DTBaNSaAkt5W94/2jeb+b8?=
 =?us-ascii?Q?87JfRkOrxrjHijnN7+UwVhaMUVDqrCxU8mTmeUHevoF5SCtNW1eBgw2VIeab?=
 =?us-ascii?Q?vRSHfMI23SyfU4f/vdGO/HwjxVFhaL+8fpBCijqdVkVvsO/GLUJY6gZzxAjp?=
 =?us-ascii?Q?f3r3jJOmqZH1RVFxzy4sMowcKN0noDJrFRaT+lc9tS4h87B/UzAeiS4eisJy?=
 =?us-ascii?Q?tMUKdi0s2MOqQY0NzjTr0hZ8dKEvBjxeXoH7vasRqW6JPTFB7kv5/BuVyF70?=
 =?us-ascii?Q?rH4R7VrOy+aI8d/GHQz6deUrWP7DtWaGvgmbv3IAHSCgnkwl4KM/TkJkuV/m?=
 =?us-ascii?Q?44P7EeCuvGe44/0xg50ZHgEZ58yfkfm5ks1QcB0XSKeat1B/6Mf5PdKmfUlV?=
 =?us-ascii?Q?qj5rfhu0ZfZuqrpcN94v7hYrBgERTpVWk7eZrxzfQjo4TXhIpBeldb50Fpej?=
 =?us-ascii?Q?kHCEcta8ewVpUM1Rga+d55tFXnuYr5LnEs8rb426xCoW9qqaV7m0u7Vnff8S?=
 =?us-ascii?Q?jE1Sj60YNftpDPwG2tKCvLpSljjfsBiKkQTJbhKWdLU/ErlLdH3xOahKU7Ok?=
 =?us-ascii?Q?LveQpYm7W2ooq9YKld7qHZ+GpUd//l+tkMrj+xMd9nWt9z95OAuwCFUL+d7f?=
 =?us-ascii?Q?UNlNGdf8IP4q4DS61J5ga+cfeXWPsjCNE6ASEY1wy+J6cwpYVPwpKYbFdUXl?=
 =?us-ascii?Q?dRc5exHlsQzBJ39Bapy13EP4DuGSHUYWKij+N/GJr1MDnUISQjSZ1LqDRPWv?=
 =?us-ascii?Q?53TYmSXwVVScMykW2vNPY1FaXC7Wie4pmKb6KOL/iZ+a/7tJ8Fe2bP46jKnR?=
 =?us-ascii?Q?XAgCITBR918va3zvLPIIXGgAGqJSfxFVxGbQ8fi8XMdnaFeBwQoxzgtCnPIm?=
 =?us-ascii?Q?AIG4aUeTiS01IXS9om5m+KaboaJ6MlePQa5/dihylvlto6zi2jkT5ae3jNyE?=
 =?us-ascii?Q?hNV7hDzRbdcliAo/XfIjdvsSdDgofbYuyaEmy/p11hf1R+n56kKYb9xvKeqF?=
 =?us-ascii?Q?qJCWi7AGIxc0KdX+aXjs7PMwqQmtKgtnDMGmTyLl2wjEOAwvKsU1lo6yH0RZ?=
 =?us-ascii?Q?fd3tysIws8aWSOAHNb3vPBHELzRqVBAsKFvtmKaMi5gI1biZ7aSQr+jrDQNE?=
 =?us-ascii?Q?WT8GmfaLfKSE5qIuBvYYS7MPVY7bfQIkzjnTKW6BG2M6AmJnBlllEjf3uOJN?=
 =?us-ascii?Q?bnl9VHJdp2bHxyM1uLqoiIZ00sjGTnKuCYsl0qH09hMSRLZ8kURiheT6FIqQ?=
 =?us-ascii?Q?ltPpi8ITO/IlnQOPrE3H0Hui9Knl+oUwH15F4NIWL85yDraL2/T4wuye9czy?=
 =?us-ascii?Q?O4GKUG47OXChvFmudtgVy1FFXHUGxVQSt9ZiuWPoMeei1+ylG7rRveR5imeO?=
 =?us-ascii?Q?/GcnG9Z2r6YKr//uUbiA5pYkalPO85S0fHi2ds8dTYDATN5RZzaSy1NbYNOn?=
 =?us-ascii?Q?gr2zMsAEaGMLSmlmETvHUwdwtkHZ7O/pNdFltny8kee6WSuH5fAkS8SCbdfT?=
 =?us-ascii?Q?7S7Qa1rGPR6W6PozajETnU78l1qPOQ+XiyzJzhB7jHidj7v9D2aecyrsZ+Ei?=
 =?us-ascii?Q?p89sDbu+sYL76OGTtpLhkQM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Jjw1gzMsArq5bdsd1KILzgvDnw+hL97Dg655wNECj3pSxDuFc3CpSZnHmm18?=
 =?us-ascii?Q?ahEVL3oPmNgsPzACWVcwbc+eBdGZ7rcHwVM9nU3qWIr5DGV3tiAJOYAgJofW?=
 =?us-ascii?Q?XSfoNCkwlKmZ3BfIjsJ3W7o0r9Lw6G9e3GvCyqT7YjKqB4H1jM3dspaPnFf1?=
 =?us-ascii?Q?1KP7SWb0QcjC0hqthJc0lES/3op3TBRLEk2eymODdUO6wQGofoZsTDdQpERU?=
 =?us-ascii?Q?QgH90EWHaDhuLUWQyFDFG0xVSqsrOfbrAwMuvLrJju7H9vXntp0AYzn/qYkM?=
 =?us-ascii?Q?MBk9rZGWh5/bXSxpRS44nUQ4BQUqk/75G6j1NKjbinu4WwMw4pBpzSJCAJt5?=
 =?us-ascii?Q?c0UH7QjDeGovgjS+Zbz5vIvDSivlXtsOhxwQxl0Q8cb7jRa0i/HTwzE1YdYj?=
 =?us-ascii?Q?FxPPRr7hZewBpsOiQkfj2rWQhoP8MtYgmw1VUwcppAbP59cPd9RdoC+dXSoU?=
 =?us-ascii?Q?BYvHo4tMnhRffV6F0W8+YhHyW5lYQAuSGU+0kee8qhXxvFjPcd2AuWpt+Faz?=
 =?us-ascii?Q?zv+DvoSSP9MuKhF0Culdh7m5yU546KRRZOIkVs51EohCO6HTI66odLxWbyvY?=
 =?us-ascii?Q?bd+KciiD+qq6ucttHNriWyFxefBKbG+lros92VoXYpeT3rNLyiN4q0BCrRzt?=
 =?us-ascii?Q?7wt2wT8bJ7zBqEXo7sy8OiIO2z78XBGeIroGw2lyUKRSZLiu+dOTrI9yVKMW?=
 =?us-ascii?Q?g/v+hVX5gsO6X4kILKs42jVA2kU9MF83a4MYgfeTkHJSFU8RIGVYEwUAAWFn?=
 =?us-ascii?Q?Ri8vim1LjYt1NILxVQ9iX8XR/wIeSYJI47usgYdzuqLUxJh12LA6EEasicSV?=
 =?us-ascii?Q?HLk4usQmgyHsP+cxfgbz4stIa4EKy/xKGIJPYeoEqwv7kjq9TVOBAZFENUhF?=
 =?us-ascii?Q?KFk4nzRm+q5S+0lRSIfKTpDQS679dpIKee08ggpMm+gHC88fCoLbwigLGdB6?=
 =?us-ascii?Q?HZdVufCrSi8l+awgLTSTlK6U3/1HWZe3cU/ITsXyTrVRSego/Ie9qgqjzRVH?=
 =?us-ascii?Q?IMCOwEz/LpZyozxbfKfKF4i4Iz30O+cMw97dKPp18t3yteLbax5/Z9xrJ7T0?=
 =?us-ascii?Q?AYNVeuFsZfTPkcyZExUTUPyACwrXQzfJwsdqm6/bkgrZ9h2NPL50VQeIsbnT?=
 =?us-ascii?Q?fTLlo0p5DVlYotjBSJTnTLkR09bEG0uGNsw+k42akRJ8BIcwL2IBuxUXX9Ut?=
 =?us-ascii?Q?aow580bzbF4n3oQjlRFuBluZf0TB1Bzn+l6kHHbMuOlOXmhK0OnYcPEmhUW8?=
 =?us-ascii?Q?tB/+rZFtbY6eTzTlrVUPgXfHp0/1L7T+bYghgZ3F0idDYgPICJxK5T59ER6C?=
 =?us-ascii?Q?pFEuoqdEWkCHYlJcedP09KfaHg/sLtbYYhhuz9qdqneMq+Xwy0X+g0VcczSI?=
 =?us-ascii?Q?IBBT3jgPpietv1QOjIeRyVTxgdwGRGskhmLdb9JIi/a0YFC9x3NBSzigIN8w?=
 =?us-ascii?Q?2tsFNxo+W3wuD+myK88U4+tNCE+IUJy6/DwsUvBeQ2Yt4m6vrMmvIO/ca9Zv?=
 =?us-ascii?Q?s3lxW1KMU/r8p7fmfyXTiM4grMxWeM2WebNCDYFwTjTZvPiPTG27UDHa/AKu?=
 =?us-ascii?Q?aurWe8UCrOLxOzcHVJIpZUy6Aos7TwGDVbTP9iP+JCcd5gOLcZ9/yBa9U4m4?=
 =?us-ascii?Q?RFgy3tp1PhOXClsX2pIngrJ5ACratarswvPwhXxREHYH0RxisofBnheF04lz?=
 =?us-ascii?Q?Vvc36YQadowgTzLFP0NBWDBPMvM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b3ffae-2967-47e3-12e3-08de55cd63a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2026 13:36:16.1152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SrAaUOWPCUFthefEX9+InyTfd7c6HDmw4AnvfKsaIdp72kB/d5nk1rXkHOKVwKIk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5868
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Jan 2026 13:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229573

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of vboudevin via lists.openembedded.org
> Sent: den 16 januari 2026 20:05
> To: openembedded-core@lists.openembedded.org
> Cc: daniel.turull@ericsson.com; jerome.oufella@savoirfairelinux.com; anto=
nin.godard@bootlin.com; ValentinBoudevin <valentin.boudevin@gmail.com>
> Subject: [OE-core] [PATCH v5 2/4] generate-cve-exclusions: Add a .bbclass

The prefix should match the class name.

>=20
> Add a new class named kernel-generate-cve-exclusions.bbclass to
> generate-cve-exclusions to use this script at every run.
>=20
> Two steps for testing:
> 1) Inherit this class in the kernel recipe with "inherit
>    kernel-generate-cve-exclusions.bbclass"
> 2) Turn the variable ENABLE_KERNEL_CVE_EXCLUSIONS to "1".
> 3) Use the following command to generate a cvelistV5 entry with a JSON
>    file in in ${WORKDIR}/cvelistV5/ :
>    "bitbake linux-yocto -c generate-cve-exclusions"
>=20
> The JSON file can then be parsed in the following run by cve-check.
>=20
> This class contains several methods:
>=20
> *do_clone_cvelistV5: Clone the cvelistV5 repo in
> ${WORKDIR}/cvelistV5/git
>=20
> (e.g. bitbake-builds/poky-master/build/tmp/work/qemux86_64-poky-linux/
> linux-yocto/6.18.1+git/cvelistV5/git)
>=20
> *do_generate_cve_exclusions: Use the script generate-cve-exclusions.py.
> It uses the new "--output-json" argument to generate a JSON file as an
> output stored in ${WORKDIR}/cvelistV5//cve-exclusion_${LINUX_VERSION}.jso=
n
>=20
> *do_cve_check:prepend: Parse the previously generated JSON file to set
> the variable CVE_STATUS corretly
>=20
> The class also provides some variables:
> *ENABLE_KERNEL_CVE_EXCLUSIONS: Enable/Disable this class (off by default
> to not affect linux-yocto OE example)
> *GENERATE_CVE_EXCLUSIONS_SRC_URI and GENERATE_CVE_EXCLUSIONS_SRCREV can
> be used to change the source repository or fix a commit with SRCREV
> (usefull for deterministic testing)
> *GENERATE_CVE_EXCLUSIONS_NETWORK can be set to 0 to provide an offline
> mode based on DL_DIR directory.
> *GENERATE_CVE_EXCLUSIONS_WORKDIR path used as a working directory for
> this class
> *GENERATE_CVE_EXCLUSIONS_DESTSUFFIX suffix used for the git unpack
> *GENERATE_CVE_EXCLUSIONS_UNPACK_DIR path of the unpack for the git
> repository
>=20
> Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
> ---
>  .../kernel-generate-cve-exclusions.bbclass    | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 meta/classes/kernel-generate-cve-exclusions.bbclass
>=20
> diff --git a/meta/classes/kernel-generate-cve-exclusions.bbclass b/meta/c=
lasses/kernel-generate-cve-exclusions.bbclass
> new file mode 100644
> index 0000000000..cd81cc5899
> --- /dev/null
> +++ b/meta/classes/kernel-generate-cve-exclusions.bbclass
> @@ -0,0 +1,135 @@
> +# Generate CVE exclusions for the kernel build (set to "1" to enable)
> +ENABLE_KERNEL_CVE_EXCLUSIONS ?=3D "0"
> +
> +# CVE exclusions source repository settings
> +GENERATE_CVE_EXCLUSIONS_SRC_URI ?=3D "git://github.com/CVEProject/cvelis=
tV5.git;branch=3Dmain;protocol=3Dhttps"
> +GENERATE_CVE_EXCLUSIONS_SRCREV ?=3D "${@bb.fetch2.get_autorev(d)}"
> +GENERATE_CVE_EXCLUSIONS_NETWORK ?=3D "1"
> +GENERATE_CVE_EXCLUSIONS_WORKDIR ?=3D "${WORKDIR}/cvelistV5"
> +GENERATE_CVE_EXCLUSIONS_DESTSUFFIX ?=3D "git"
> +GENERATE_CVE_EXCLUSIONS_UNPACK_DIR ?=3D "${GENERATE_CVE_EXCLUSIONS_WORKD=
IR}/${GENERATE_CVE_EXCLUSIONS_DESTSUFFIX}"
> +
> +python __anonymous() {
> +    # Only run if CVE exclusions are enabled
> +    if d.getVar("ENABLE_KERNEL_CVE_EXCLUSIONS", True) =3D=3D "1":
> +        srcrev =3D d.getVar("GENERATE_CVE_EXCLUSIONS_SRCREV", True) or "=
"
> +        network =3D d.getVar("GENERATE_CVE_EXCLUSIONS_NETWORK", True) or=
 "0"
> +        # Check offline mode with AUTOREV-like SRCREV
> +        if network =3D=3D "0" and srcrev.strip() in ("${AUTOREV}", "AUTO=
INC", "INVALID"):
> +            bb.fatal("generate-cve-exclusions: Offline mode but SRCREV i=
s set to AUTOREV/AUTOINC/INVALID. "
> +                     "Cannot proceed without network access or use a fix=
ed SRCREV.")
> +        d.appendVar("SRC_URI", " ${GENERATE_CVE_EXCLUSIONS_SRC_URI};name=
=3Dgenerate-cve-exclusions;destsuffix=3D${GENERATE_CVE_EXCLUSIONS_DESTSUFFI=
X}")
> +        d.setVar("SRCREV_generate-cve-exclusions", d.getVar("GENERATE_CV=
E_EXCLUSIONS_SRCREV"))
> +}
> +
> +python do_clone_cvelistV5() {
> +    import subprocess
> +    import shutil, os
> +    # Only run if CVE exclusions are enabled
> +    if not d.getVar("ENABLE_KERNEL_CVE_EXCLUSIONS") =3D=3D "1":
> +        return
> +    network_allowed =3D d.getVar("GENERATE_CVE_EXCLUSIONS_NETWORK") =3D=
=3D "1"
> +    workdir =3D d.getVar("GENERATE_CVE_EXCLUSIONS_WORKDIR")
> +    unpack_dir =3D d.getVar("GENERATE_CVE_EXCLUSIONS_UNPACK_DIR")
> +    # Remove existing unpacked directory if any
> +    if os.path.exists(workdir):
> +        shutil.rmtree(workdir)
> +    # Prepare fetcher
> +    src_uri_list =3D (d.getVar('SRC_URI') or "").split()
> +    cve_uris =3D []
> +    for uri in src_uri_list:
> +        if "name=3Dgenerate-cve-exclusions" in uri:
> +            cve_uris.append(uri)
> +    if not cve_uris:
> +        bb.note("No CVE exclusions SRC_URI found, skipping fetch")
> +        return
> +    fetcher =3D bb.fetch2.Fetch(cve_uris, d)
> +    # Clone only if network is allowed
> +    if network_allowed:
> +        fetcher.download()
> +    else:
> +        # Offline mode without network access
> +        bb.note("GENERATE_CVE_EXCLUSIONS_NETWORK=3D0: Skipping online fe=
tch. Checking local downloads in DL_DIR...")
> +        have_sources =3D False
> +        dl_dir =3D d.getVar("DL_DIR")
> +        srcrev =3D d.getVar("SRCREV_generate-cve-exclusions")
> +        bb.note(f"Checking for sources for SRCREV: {srcrev}")
> +        # Check SRCREV is NOT set to AUTOREV
> +        if srcrev.strip() in ("${AUTOREV}", "AUTOINC", "INVALID"):
> +            bb.fatal("generate-cve-exclusions: Offline mode but SRCREV i=
s set to AUTOREV/AUTOINC/INVALID. Cannot proceed without network access or =
use a fixed SRCREV.")
> +            return
> +        # Loop through the fetcher's expanded URL data
> +        for ud in fetcher.expanded_urldata():
> +            ud.setup_localpath(d)
> +            # Check mirror tarballs first
> +            for mirror_fname in ud.mirrortarballs:
> +                mirror_path =3D os.path.join(dl_dir, mirror_fname)
> +                if os.path.exists(mirror_path):
> +                    bb.note(f"Found mirror tarball: {mirror_path}")
> +                    have_sources =3D True
> +                    break
> +            # If no mirror, check original download path
> +            if not have_sources and ud.localpath and os.path.exists(ud.l=
ocalpath):
> +                bb.note(f"Found local download: {ud.localpath}")
> +                have_sources =3D True
> +            if not have_sources:
> +                bb.fatal("generate-cve-exclusions: Offline mode but requ=
ired source is missing.\n"f"SRC_URI =3D {ud.url}")
> +                return
> +    # Unpack into the standard work directory
> +    fetcher.unpack(unpack_dir)
> +    # Remove the folder ${PN} set by unpack
> +    subdirs =3D [d for d in os.listdir(unpack_dir) if os.path.isdir(os.p=
ath.join(unpack_dir, d))]
> +    if len(subdirs) =3D=3D 1:
> +        srcdir =3D os.path.join(unpack_dir, subdirs[0])
> +        for f in os.listdir(srcdir):
> +            shutil.move(os.path.join(srcdir, f), unpack_dir)
> +        shutil.rmtree(srcdir)
> +    bb.note("Vulnerabilities repo unpacked into: %s" % unpack_dir)
> +}
> +do_clone_cvelistV5[network] =3D "${GENERATE_CVE_EXCLUSIONS_NETWORK}"
> +do_clone_cvelistV5[nostamp] =3D "1"
> +do_clone_cvelistV5[doc] =3D "Clone CVE information from the CVE Project:=
 https://github.com/CVEProject/cvelistV5.git"
> +addtask clone_cvelistV5 before do_generate_cve_exclusions
> +
> +do_generate_cve_exclusions() {
> +    # Only run if CVE exclusions are enabled
> +    if [ "${ENABLE_KERNEL_CVE_EXCLUSIONS}" !=3D "1" ]; then
> +        return 0
> +    fi
> +    generate_cve_exclusions_script=3D${COREBASE}/scripts/contrib/generat=
e-cve-exclusions.py
> +    if [ ! -f "${generate_cve_exclusions_script}" ]; then
> +        bbwarn "generate-cve-exclusions.py not found in ${COREBASE}."
> +        return 0
> +    fi
> +    if [ ! -d "${GENERATE_CVE_EXCLUSIONS_UNPACK_DIR}" ]; then
> +        bbwarn "CVE exclusions source directory not found in ${GENERATE_=
CVE_EXCLUSIONS_UNPACK_DIR}."
> +        return 0
> +    fi
> +    python3 "${generate_cve_exclusions_script}" \
> +        "${GENERATE_CVE_EXCLUSIONS_UNPACK_DIR}" \
> +        ${LINUX_VERSION} \
> +        --output-json > ${GENERATE_CVE_EXCLUSIONS_WORKDIR}/cve-exclusion=
_${LINUX_VERSION}.json
> +    bbplain "CVE exclusions generated for kernel version ${LINUX_VERSION=
} at ${GENERATE_CVE_EXCLUSIONS_WORKDIR}/cve-exclusion_${LINUX_VERSION}.json=
."
> +}
> +do_generate_cve_exclusions[nostamp] =3D "1"
> +do_generate_cve_exclusions[doc] =3D "Generate CVE exclusions for the ker=
nel build. (e.g., cve-exclusion_6.12.inc)"
> +addtask generate_cve_exclusions after do_clone_cvelistV5 before do_cve_c=
heck
> +
> +python do_cve_check:prepend() {
> +    import os
> +    import json
> +    workdir =3D d.getVar("GENERATE_CVE_EXCLUSIONS_WORKDIR")
> +    kernel_version =3D d.getVar("LINUX_VERSION")
> +    json_input_file =3D os.path.join(workdir, "cve-exclusion_%s.json" % =
kernel_version)
> +    if os.path.exists(json_input_file):
> +        with open(json_input_file, 'r', encoding=3D'utf-8') as f:
> +            cve_data =3D json.load(f)
> +        cve_status_dict =3D cve_data.get("cve_status", {})
> +        count =3D 0
> +        for cve_id, info in cve_status_dict.items():
> +            if info.get("active", True):
> +                continue
> +            d.setVarFlag("CVE_STATUS", cve_id, info.get("message", ""))
> +            count +=3D 1
> +        bb.note("Loaded %d CVE_STATUS entries from JSON output for kerne=
l %s" % (count, kernel_version))
> +}
> \ No newline at end of file

Please add a newline at the end.

//Peter


