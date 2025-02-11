Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B36C0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 19:17:37 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.14])
 by mx.groups.io with SMTP id smtpd.web10.1814.1739301451475036268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 11:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=QZ+SEnFG;
 spf=pass (domain: axis.com, ip: 52.101.71.14, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vh8ktWHzN3aL72ZNMMFyXWGdIXmYE127DyqRrYWdFDW9pivNQmunNcdbK6IWXz6vmuwQtCsCOA9gmsIN8JjngxRLZ4KeD8rgtN77zBLAgZCaSqJhiKPOuadRH/C/htThp56JrjAceFmo7/z7TLrX0dCv+7dr2pCe0j1769DO2W9ve6chkqapBw/5CRFSW6TtH5/Y2OjTARWVXF3ife2ud3SXHkwW+wObepkCrfDovkpubgy4KbOlbAfSjlwdFb43O3lpYqUvxsfZc6h6r75Ubqaunpt9F24d71w+L/spIK7l/ElYCwXqucQyT7u0yzjU3SynDaWRAkzuIfE0uYIXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGvw3vIN7uJuZBQyq292FUc/ZV+NnegaWKt9sQ3y8ZI=;
 b=wqhFh+IUc2B2cvObYpwx7q3H/lrEnf4g37btnortwoh0RaZiFl4ME8PwqqCjxHrHPLuqje1QLjQdP7CzuDHSQgkSsChdaZpzbMFNn+CZyi2FZQyuAzXj0StjUk0MNO7nD7AeWLLUOkdoRTCLT2Vy+wX0AC9fVz9zKogzRiKcIpOl6WzoW0h0Qu0hIP8ACc8jdWKQZdSzJrpZYd0Q/QEvb2aMkqQKhumbJkgZGvoJRIFzmpQ/rPeoEMzz3Ci91vQpEpG8+y6JxeXYwqVADd4tUDvXLo2Z8qBxziIOXOsL7BfRc4WkDif498ZuK3a2PaNlGz0AXXISTlXBrs1xTLcqug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGvw3vIN7uJuZBQyq292FUc/ZV+NnegaWKt9sQ3y8ZI=;
 b=QZ+SEnFGQXR7EOI1UjIRmaxPtMuQByrbtokv9/YAz5E2Nk5uqD81lptvafdAB+eJS0jAAQZyK8OJftUe4nPLJpHuezT3rDX1PGigxRPMtnFT0WXY5vpH7SV/ha/N3pPoJUlEhvyg1xsHER1CNz4u09jZp63hEaOdnvGFLT/gf70=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB8160.eurprd02.prod.outlook.com (2603:10a6:10:30b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Tue, 11 Feb
 2025 19:17:28 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%6]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 19:17:28 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "stefan.herbrechtsmeier-oss@weidmueller.com"
	<stefan.herbrechtsmeier-oss@weidmueller.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: RE: [OE-core] [RFC PATCH 16/30] classes: add vendor class
Thread-Topic: [OE-core] [RFC PATCH 16/30] classes: add vendor class
Thread-Index: AQHbfJZHDzXhRHobkUCI7zXdFvF6E7NCd1HA
Date: Tue, 11 Feb 2025 19:17:27 +0000
Message-ID: 
 <DB5PR02MB10213A31C599BAAF5DBDE0930EFFD2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211155958.RFC.16.a23c043b-97fa-49d9-a050-be7ae8efbe51@changeid>
In-Reply-To: 
 <20250211155958.RFC.16.a23c043b-97fa-49d9-a050-be7ae8efbe51@changeid>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB8160:EE_
x-ms-office365-filtering-correlation-id: 92e6b412-4ed4-491a-4709-08dd4ad0b962
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?zJnjnCxJGHgvrYUooK++LTB0DRn4CXcbjPnJjnr6gW8d5UO9aIrH8+fktz+Z?=
 =?us-ascii?Q?NXW832ceWFtMKXUiA0N7TtsVqCCtiLPquWs+p2oiCQhKtYG7JKqW8shxC1Pe?=
 =?us-ascii?Q?FOksLIKNI134i4wk+6NS7XCkkgiHzIaOu6XTl6mzMZIks+lV/S+YM52Ep5+3?=
 =?us-ascii?Q?KjoptmWHme0ELy9xehBGNkYZOXgwk5uEj/e+KtBF0DRf7GrCnEaBHvKnmwBh?=
 =?us-ascii?Q?0O0+fSV8896QsAHnOam2sXwIqE6sP7eCqk7DG5IWQLqPbctNSGkjWUG/0d4q?=
 =?us-ascii?Q?X98YOfB+oAgKvdoHFRXtaDqFawIUBpe+9Y/FK0bUd8ZkERfncQ1yHjZQOrYr?=
 =?us-ascii?Q?xpixMhhhTBrnZxJ+FwErPzF+BYV+2fW4jGmHhkH7niyagBNdqE6OuEf5tSiV?=
 =?us-ascii?Q?05Vy1MCBOmxoll4KmwINI5OxWRv50wmEYX7vZvGIvJOpE2SOdHeUZnoT5emY?=
 =?us-ascii?Q?ZXhSRWRP4LRyCfsu3VeOZiU4Uu1nbaTeppzhEo8TCcgRHDHdL86Hi5FfLmvW?=
 =?us-ascii?Q?HcNoHPhSqIQ3rSPiK07P0Tfey+Dqix2MXO2cSFiBDf7SdxQmkxhQbsNpa/Xb?=
 =?us-ascii?Q?90Neez/4SUgzjoCqcq1e1z5pJbPg10i5Lt9nEv9tXZFQVvGpea7RrN9FWxD1?=
 =?us-ascii?Q?ky2Xxu3ru5to+b3ob9/fCNpAcl6KKfngYtYW9sLwCjV5Eb0mw7uymP/rAhZG?=
 =?us-ascii?Q?jJBUvvFyYua/CFQIlRmhBs8ZaITavpRyDTHxpSDw/QkHbtxohlqQIdo6p9TY?=
 =?us-ascii?Q?7qvEPl1uqB80U8ytIxvsrJj8xHsaes+lpRNPLJUanKXPxiexi1D4w9frviK9?=
 =?us-ascii?Q?P8bev/v+xOiZnXnnvachahni0q79Yhkzh5apJKvMvvr7akUh3/CmI4QGK1sg?=
 =?us-ascii?Q?7uOX8Yk5tmAEQqV9AoAxmvyw8/+2uWmeBQxT2OKXWwsbrhxugC0R0tFBpcu2?=
 =?us-ascii?Q?NuRj6EFFdRR+NnW/aK++GZSa9cLEabTmlHkrcpRw40KeLggK2Bvz4zwBqE3M?=
 =?us-ascii?Q?qxtz6wRkTl/qQDgMUxF6LftbGKvCXMjz6j1oQNvEaIXQkGqREHEX4Oou8+fK?=
 =?us-ascii?Q?/TfDVLZ7xinE7VcjJXVyHgEHNULIam9zXMUudbCjAFWo/VBuAmcmEIePg3J9?=
 =?us-ascii?Q?XNi8PBMHmp9zUxOMI+KLkCWZH82OoNRm1YyyD890KEgMqwDqsFrW9QeoY8F1?=
 =?us-ascii?Q?i8zbUPSQsB5Bxf5jZVfYqlH6/rOXz2W5T3WYK8hPCtYOGolX5Dp8Xw8agBCi?=
 =?us-ascii?Q?jOSiLdA0ku2JlyapCaf3AFGnEPVwdGe7XFDhGNGHB5yQZnTDERqbDCehM7n6?=
 =?us-ascii?Q?uzhK6vU12OqimVSYW5W6t2LuHKV3Ws6es7InzgR2UsFkoaB4DZ6cT0dD5tIC?=
 =?us-ascii?Q?o4ieNx2bBh8ugNOBMrivMxM+tyETuCeJtRECerlbq5ZG5WnalNkH6hlZsYs+?=
 =?us-ascii?Q?lxQ9pF9bYDn+gW7jChyP/QaycVULk/7+?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?9C7lKAXpg7uL1m12bIezf+jur5oVo6Us0RgJlMkXCN/jnAIt6lUy2z5cRi7d?=
 =?us-ascii?Q?L8ieKUipfSkJJZnLS0VzEftJdb2WYxiP3FJ10M6iv4rv3xHfWWLLMWl5QSY3?=
 =?us-ascii?Q?rbhclL2rzSEPCITuks5mRxMXdFw0A4O26dGlLAbDMurVr3j6oMwY6wpjJKpb?=
 =?us-ascii?Q?zYq//K8iLhjHs7+BWsGoN8UKpRzu47vz1NYz5QbOhEnK8DOeFOZopCnV7Us4?=
 =?us-ascii?Q?LaZ3f6/2+6UxnVw16wAYfkPlYRET+zeYBfD/t2xibUfNGGepRZgjdNyTt63+?=
 =?us-ascii?Q?ySRl6WnDsOQ1ka/6Hqi2d88Dt/6Cg3n4UQAKG7XSoJHiWdlRFOfBRoZJfLGk?=
 =?us-ascii?Q?XtMVLMT6qsVCyxbjfOv80qWOCdmyNgH9l5btJUe7g3TPh6W8z4LaC3v3VIqG?=
 =?us-ascii?Q?tHtn4hF9Ldp/jE7J1g5KZw9Wq66JSoPQOXKw9ZftLkFBax5vazUEKWQmp3xC?=
 =?us-ascii?Q?ZfsbWTO51FIPMlWu+1aqA7o9VAgCyaLdlfF1O5bcIYRAQeD7grr+G1E/9tAA?=
 =?us-ascii?Q?bkmBNWc5awRP+/prtdV/cF/63NJxd234NeNYFLG5zU38H+j5C1eaPeSWP/Zw?=
 =?us-ascii?Q?Dc/W5kTHPblCC09UcKXDK8oZtv83q28vsCNfoqrkVy+xx+Jb0CuTZJPvAg+G?=
 =?us-ascii?Q?UQdCMfrTrXR4FnoX0PBYNJh9v4JXoY6Kwfb0ZjNpBYEPjUGiyeBBZJbB5RcC?=
 =?us-ascii?Q?ntLG2Xq2onw/oG/FW88x/OxePpZyy7lbFmESK11DquBPXH5ouLOsZEbTzjwk?=
 =?us-ascii?Q?7OT3+K9J+QQNFzAwyf1Sl/ubyrlzGKDL8JBg0Yq4VStKy3Gyp3oozT19ICie?=
 =?us-ascii?Q?6P50vFbzGN1RIMbSfG8boO88zvh+ifJaTrSJs/8T37aanvWDSwFbMcNSGbyP?=
 =?us-ascii?Q?QiBGgld50RcpCtNJxir7vPbC/mUnPWCTODlHg3KCuwK4Iab3QMB8g1SIL3rr?=
 =?us-ascii?Q?37BuD7ytBtQWQYW4B+jhbnyd0ts2kErEivaGaqm/qD8XEiIyHHRVpfnYscSi?=
 =?us-ascii?Q?+tNk22muhfC8kTcrknOf+tf1QCTzYnekzfAkkPKSuvo2B/FQ4gbkrxImQLqG?=
 =?us-ascii?Q?WM2+p3NHoGf0PJjf5FAz1RgpbVTJzr0aPmTaZevPC6dFrPYylFfh/shukHme?=
 =?us-ascii?Q?dKqN3rZeNsZm3Rlz3vDJpgNSc7JZvvtExTJwPZJNyFeq2w9K/wAW8GERBCgf?=
 =?us-ascii?Q?1b+Pmslp6bPRChtJPdGDePVmK5PEBn7D+TorSJOJbabohxhy8d0LMIekxYmZ?=
 =?us-ascii?Q?cbchE7E0mVR5pevGsywK/3SINI57BL2ftEWHaZm8bPIAc+fxU6xPtkUloqel?=
 =?us-ascii?Q?Z2bIN69pXOdjmIQjvMPF7RwQ9SDmpua4j1/XD0wLSER7NaWCkCh0jJw3jFro?=
 =?us-ascii?Q?qj912Mm9CYnC+k3/HabzpSVUqSPc01PT0gw+zpN0Z7vzYGis9v/odrxVT2ro?=
 =?us-ascii?Q?f1YZbHRUZTedH9xIQ2KUSNj9P1aFYW48oItXqbHhojxAHOZ6NAP3GGGRn7te?=
 =?us-ascii?Q?Zj7Ph60C/uNZKNH0HWSI3zAjR7D81It764vqVV0bmQtKrTHTz0V4mJicbOWu?=
 =?us-ascii?Q?9CFdT4Lxx5MIniJ4ORI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e6b412-4ed4-491a-4709-08dd4ad0b962
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 19:17:27.9909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QKSzTV6BVyMWE/7pmpsoV9kEUzstDt9W76BwkwKDe3Pz6GgeUOMNNraN6H3Reb68
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 19:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211168

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Stefan Herbrechtsmeier via lists.openembedded=
.org
> Sent: den 11 februari 2025 16:00
> To: openembedded-core@lists.openembedded.org
> Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> Subject: [OE-core] [RFC PATCH 16/30] classes: add vendor class

I suggest using "vendor.bbclass: Add bbclass" as subject instead.
And similar for the other commits that add new classes or updates=20
existing ones. Using the actual file name as prefix makes it easier=20
to see what is actually added/modified.

//Peter

>=20
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>=20
> Add a common vendor class with a prototype for the do_vendor_resolve
> task and common dump and load SRC_URI_FILES function.
>=20
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller=
.com>
> ---
>=20
>  meta/classes-recipe/vendor.bbclass | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta/classes-recipe/vendor.bbclass
>=20
> diff --git a/meta/classes-recipe/vendor.bbclass b/meta/classes-
> recipe/vendor.bbclass
> new file mode 100644
> index 0000000000..a99c9a3121
> --- /dev/null
> +++ b/meta/classes-recipe/vendor.bbclass
> @@ -0,0 +1,28 @@
> +# Copyright (C) 2025 Weidmueller Interface GmbH & Co. KG
> +# Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +VENDOR_DIR =3D "${WORKDIR}/vendor"
> +
> +inherit early
> +
> +def vendor_dump_uris(filepath, uris, d):
> +    import oe.vendor
> +    with open(filepath, "w") as f:
> +        oe.vendor.dump(f, uris)
> +
> +def vendor_load_uris(filepath, d):
> +    import oe.vendor
> +    with open(filepath, "r") as f:
> +        return oe.vendor.load(f)
> +
> +
> +python vendor_do_vendor_resolve() {
> +    vendor_dump_uris([], d)
> +}
> +addtask vendor_resolve after do_patch_early before do_fetch
> +do_vendor_resolve[cleandirs] +=3D "${VENDOR_DIR}"
> +
> +EXPORT_FUNCTIONS do_vendor_resolve
> --
> 2.39.5


