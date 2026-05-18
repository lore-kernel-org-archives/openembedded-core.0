Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D80CD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 12:27:30 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7173.1779107249080918945
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 05:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=DKl+lexz;
 spf=pass (domain: est.tech, ip: 52.101.65.64, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mc8jHg1Pwby6LU32OmQCMgV3DxSeyACG0lazWsv6gRCrT4L27epCxCAIEQxvDU5bYdRhPEAFIeCDDqsVuiDWlqq3a04irjEj5oIAnid+RRHagbg4BE49wC7qV2K/wKK3bl88IBIH8dgS8MXMKKNBUsDNFl/Ugf5U59og7gVHQV1rKlK0ba70nJmCiCIgzYHvApzVnfzOzMfM4vfc+XXhVWLfASzG3xOIt/vNsAaVe2OUoDWSt6qWlHweq9qBmzDpe770cDN6pJhWh5Zdu9phUHV93+X6CgIOthlfLmPRG0fXFXM8xiAkT6glO/Lk2T6oxrA/8vpAb1WJ1dy5BuUzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxOuwrFspeCrr2KWoPjY788hES4qD58eHlYW+0Fuf9w=;
 b=hcHeYdLZ1vTMziW7eKywCdhPuhf7SeI8JbLMJV81cIVdUIKhoq56es8wxBI0/daaVyFHNTFM4mHU1Y6Xw4FM2yVlt+ZInEZ0mAw8Vpw8ncJZbxXS0iiEHpL+8AxEo0Izp3HVwcdfh0nVMZxjKY/s7wbV9aflc+WjFhrvbYAF0eutpSrHVgxe/kmvRZs/w/8XhP64CRpl0rtSc7HnSkMKWlH99OoEsMvDXIpf4fnaGAtAqRkIJFZSlCA3OvNNI7uD2hOUcUezseLZe7R9QxTlharZxinyWdj9bDbkcSJbOKhttX6XRTjnGpa/qcWbua7QTOma7XDWOi8YGYO4/ftG3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxOuwrFspeCrr2KWoPjY788hES4qD58eHlYW+0Fuf9w=;
 b=DKl+lexzwgyilM2pKlclt2/C4qhhlNmA6wUjIg3NPwo2KKTHIvSsHIYvMv+ZFWknlCd4SNHqO1KOZctBfVj9PQWrFZrdTYTLcvB4G+38uvFtAZlmR8bl/aktuTpa/eVghI46EYO1IEo/y0XDKzbNI6ONAHGFMqBNT+3i+JyqndDolxBRTuoPO0qMm++kWaTNLw1CRRZA5I+BJ4jWpnDp4CzQOw1T+bm0JlxC6+kGMkNHQqy77IJatiXny328cAQrgvhk6ocUUv4LgKMkV/MbYp5OvPHGDHKOSFsKbPo0mKr4B+go7vQPW4crZ6LbjBor5lHgKRMBljxY3T/Fw2Wc2Q==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AM4P189MB3641.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.15; Mon, 18 May
 2026 12:27:25 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 12:27:25 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libxslt: add ptest support
Thread-Topic: [OE-core][PATCH v1] libxslt: add ptest support
Thread-Index: AQHc3TmohR+C1s9W9EacoxBIguT8irYTxdmAgAADAgs=
Date: Mon, 18 May 2026 12:27:25 +0000
Message-ID: 
 <GV2P189MB3005CF211986FF7B7DFCF15FFE032@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260506092057.27057-1-pratik.farkase@est.tech>
 <901B1CC5-1D3C-49F3-9BD3-BA18871B4D02@arm.com>
In-Reply-To: <901B1CC5-1D3C-49F3-9BD3-BA18871B4D02@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|AM4P189MB3641:EE_
x-ms-office365-filtering-correlation-id: fa132174-da86-47d1-d18f-08deb4d8d1cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003|3023799003|11063799003|38070700021|4143699003;
x-microsoft-antispam-message-info: 
 gPUTSdTCbnyAdk22UJoIgRRH4B5ZDyxyscdUsaRvlXV7mOB+WiC/lsucvPY8N+qYEB2sGHd5/nhsdCi2w//AJhs3IGcF72ZeBvtCxtojrIzp2idPtGBqZ3QylphNYhdHcpYXyEGc61Ju1EdSsSNeSxAOuFm9y8foXXabiSBHLJhKsVgm+CoER8r5+XJfwitqeWA6rkZ4hRIqhlPF+UJhbI2gcdh6+oSjQO4g2TUQ/eFfrMqNJXgUswDoQSVV/hakpmVpG3A3LiWFN39LIB5rJt+d9edkfL3sMrzDKcbQgYqJZH9dstnSAcXEpvO5YGaOMQTjrVD7jaKAapD9Af8OzSWUgSZ5Qv5jzn4Y/aAW+2rj9sFBpPB/09mxRl1+vYXCFO5w1szMKNCnQpsbQON/ezjzTj77pFCfZEInJH3dYtIB7kjflDU3RP5dnEslWmSxLUiJ/XCvd+X/xuc5p7syL8MZND0vg5lsScdIvqctBHBTYUvLQdAlqtv35MV/5uQ7HQnFaXKu2B3fEqTjEaFPA2z6sE1kU/Duyrx0DNqvqkYwVl7yRp9tGS4y4zB6mf4TU3UKI7uEBzeCPEuyI9d8N8K2YOekkKuPLjEeH8CTbtpGXRJO/JVBvLHDin9+4LfdwsnnEt2kE6cxlB9d+gLEce+dzRsVzXOuNE0oCeOg6k3an8ELjbPvHrbdSJzZufsZiX1w9QZ7UXsGMJYO91wyplX5G5UG6IUP7UPPWMI1dZqhcag5M8CfMTVFSPYLaiH0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(3023799003)(11063799003)(38070700021)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?g3DgX7M919iHEYAPQHkjjlxoQndxyNIFwW6ytTixTRytm513Hk8YctgE48cN?=
 =?us-ascii?Q?3Qh7lGQUhsk741VAiSE9UEkoKE9BWyw87mzqPomJBPAC+RkoZgAeXopMkDrp?=
 =?us-ascii?Q?6ZLrG5w+TIOX48ag096lijaUkM397hWNwMjSiE5AhhuXr91UwNCZsKDpu0SO?=
 =?us-ascii?Q?+oczxV4mGy3gtYZj94MmewRqN9YiVPnGEJAwflqvaXB/Unxi4l8g/zr4Bn6w?=
 =?us-ascii?Q?m9ykBjIYSZLV+i+x8jEVhl6G0G+sUngqDA4tJeCww2MpLTc6ON4+Lg6J/lax?=
 =?us-ascii?Q?T9xiRiMDkQ6FvYh9252sXShc8cpKuHNdHaI6QZfsF8mJTuD+lPa2PoNslvAV?=
 =?us-ascii?Q?Jj3j6l6ZIFmRM2H9uXaTePoDf7Xk/gTSHfdBn2pX0jBM1NeewfUNM0yZBHRx?=
 =?us-ascii?Q?R/9NcpBnKsirNRuJjBrLTCeoOSXV9NJ37Fjzxxm2lmb0nBIbx7OodKAu/CQG?=
 =?us-ascii?Q?bx6H4Ig7PfEjsSd+NdJ+/jp5XskFVTm0iQ+KQLDYh1o9sdpLQ9acHGJVjeph?=
 =?us-ascii?Q?S+BOHmY+97DN+mXf+k5050ml8fuIr/IYqlqIrdYjCldpDNsvFIk6BA5MI9ow?=
 =?us-ascii?Q?7w+jwa2q95rtVaLVK5ck5zqTnZ/WD/m5wnjDTMg+EE6EATHp8ujyjVjz0X38?=
 =?us-ascii?Q?aP3S5xk9dJYUhuNN6wdU+R0W01QCvBE2VH6AhkljwK9mCBwFfy6F1tujfwKk?=
 =?us-ascii?Q?i2um9a5+ornqH3hQAustBAhNQQnHEpJh7RnxsEYwej57QIu2D8MfTIK1/nvS?=
 =?us-ascii?Q?ewzEwhk/Wml21/ORsqN/e7NNETcN3V6Juv2yS8mwk/koSwbTiRqh9OkXdcOw?=
 =?us-ascii?Q?tJkexfBMcKkAkF1CHAIWNPo5LRfk+JXaI8euux4wJ1XuBdSUTFtwwX8orZ4P?=
 =?us-ascii?Q?rMekJd+Tp0QXlAvZjyGx/9ics9eMxsKCTcsfLblS0PnrSmbIi5HxncH75Fx3?=
 =?us-ascii?Q?42miRQNBzUPxyjBRW6Q2wDe5SR93/PoHom3vqQhKfh2D4QMHDRoIjyd5T0ru?=
 =?us-ascii?Q?0GW/JRqsIMdyxR1LxfJju5MrpOCgcObsM+dAHRzZNmQ0CpiTfS+ew3oNjntZ?=
 =?us-ascii?Q?ZwjEUY9dFJFzP9FKiH+uO+IOfkrYB/1ejsdJLweorJajsQENQi3rm5r+W4BS?=
 =?us-ascii?Q?V11TWiqynm/f1dql2JaRH5RqC0Qy8fGSJdT3s/IxmzVPpfparYapsJMG7VyU?=
 =?us-ascii?Q?1895xVYB6ThT3t+CpMgVfxp7dN3ecHx28H3Gm7/IV1XbgdwJ/gV0vr4oeS/o?=
 =?us-ascii?Q?PCBYSj0hDTy5WtgeLvMrFetqcJVSww8ZN/uNgS8GQKQ4ux3vy7P3FdP/ec5s?=
 =?us-ascii?Q?1h3yvZtGloxccORmCHK1urFs0APncQJEi8D0CpSAqXwtTqOzCO6wpy60rWFJ?=
 =?us-ascii?Q?2YN0WsXopXa8Kqsb+m1KC865kjCZ0ixsndMJ4R6IKj7Nc2h98lIU4xVjK+rY?=
 =?us-ascii?Q?Kw0i1lahp71arS7ECGgtNpi9NCpNqcBi7bl7aTIhhBGM0xH1i9MU5hQYwB7q?=
 =?us-ascii?Q?DyuqmFCsN4swn8EmkukwaU9JUJnxV1BWWkFt2faISnc1vWfDBnLKYqOd8wCg?=
 =?us-ascii?Q?A74uw9BJ1YAKv3iObNYMEMpZHMM4/TOk6UC0wYVUCNzWHOFwTuVuSRyvNaBs?=
 =?us-ascii?Q?a6vDr+Y3YKOlyyrU5AT+Wa/oAGN067Q6Ryjegpv0g5FkILx4ICx1wfD4AOiR?=
 =?us-ascii?Q?1ZEySeo91Evwh8nzaGCWQAm2GgERdX5815dfOS+zgobd3qQFRrONDQH+lptD?=
 =?us-ascii?Q?NOuE8novvQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fa132174-da86-47d1-d18f-08deb4d8d1cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 12:27:25.8481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TJ5aKxnEhRDMEOT+2loiXhvdHsKDtk6KS1p4tlUunTWWbIAjtF0VNq/rDUhcEtAEO26sqUPeVpkT5Cf6Xnz4qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 12:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237238

Hi Ross,

You're right, that's unnecessary. Simplified in v2.

Best Regards,
Pratik

________________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Monday, May 18, 2026 2:16 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] libxslt: add ptest support

On 6 May 2026, at 10:20, Pratik Farkase via lists.openembedded.org <pratik.=
farkase=3Dest.tech@lists.openembedded.org> wrote:
> +output=3D$(./runtest 2>&1)
> +ret=3D$?
> +
> +echo "$output" | while IFS=3D read -r line; do
> +    echo "$line"
> +done

Why capture the output just to print it all again?

Ross

