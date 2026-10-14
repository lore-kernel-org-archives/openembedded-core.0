Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22792CC6B1F
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:43:19 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9550.1791970987802653737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=X4B2TwqC;
 spf=pass (domain: est.tech, ip: 52.101.83.60, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vw7k6jbAWEKY5PgAlPW4I08qkemm6o/+sJbvLDk/E7YXpJaPeEVuKYumCiMHDuI85vJpw44y54ZLauXtOBzKr2XKoXhgGLkkHIJkP9JpvungTHDcUXfpWfdfW0y6tdGCj6vRaJaSE7RCisKM0nT10T4QKugzXreNMINCTpKfJraoygMS+CMQTfMlT9JPONjOLheC5yFJwxURTlwGhj7XVUWM6u1hfd1vP5mR30mGczv3i6l/lvVbIsC4LJuP8gYOUr/ImBxPbz5Onrx1GjhnO/TZwopqUgNYheDppshl/Vtr7N5Fkawk88dDTmow8C11n8lzFxqtGHCDCg/pfDEwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVjmOBODaI33L4UthSs1xd4iMv0tlsHM3TEpUiJAG+w=;
 b=J92ZpNs8SDfHFSLZHCdK5FVknXSPVcr9CmMRtL9nowOWeLkvJKmQlLwMkN1RMHcRA3MJQpZNcw2chVIJOaq2eF5PeWoEDpQg21ETDvNFLcnqRh9GJhG521n5Unh5zPv981Y1o1pVGsG28WFbyhdlUomjcsTawediCNUU0y5e7vsfMYKzJADsyMvkA2XYxgFr5d8FiVkqF52FtFx30r3h6Poj0dR8BoxJQdGHphWSeYusfiUdpByZcWZgbMuyFcxpUKHVZuJj/3TgEBB6qKcRyEoBNv2KaAmd0O2C2XZNe9l+uyug8KJYPH7bk5tWCMLv/2CGiOIMjR+Da3VO1UVkZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVjmOBODaI33L4UthSs1xd4iMv0tlsHM3TEpUiJAG+w=;
 b=X4B2TwqCh/Q840wYSutbI6aolN8pG1u7JunVPg/9CM/CUEAcuXqX9OUgRw8nlm5NQSqkdilFn0xlB23nR/jvaBVkgVCl0UGIKbIEKrrQTja/Ca8XhOwWJTaB9eIiF1WDm2p3UyzmDEj4w3UgL8RyryRYDlpX7nxaXtb/1zpDhxF9f4VMZ0ia161OkE6hnt9iA8CVuXJBoyC2iGut00vQ1kVSqdq5WffIN5Byx4/7OGurd+kJ2Ec4kvhQQ6aEO9JjKuvW0nn40B2Jh6ue5JbFcFgxGahRzCjkBxY6fLkXUZFjZa/zECxy51E8NZY7E97pCxH8MlYH4DGPRwZBdIBEZw==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AS8P189MB2272.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:549::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 09:43:00 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 09:43:00 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH] libsoup: add ptest support
Thread-Topic: [OE-core][PATCH] libsoup: add ptest support
Thread-Index: AQHdWusevn2R0F7k2kmoAa/9Gkj9Yrb71I0AgAD2J4g=
Date: Wed, 14 Oct 2026 09:43:00 +0000
Message-ID: 
 <PA3P189MB3239C1C488407E284BA617C9FE9D2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20261013081611.10995-1-pratik.farkase@est.tech>
 <DM3XXUK2K2YS.1YF6BBJFAEVM4@bootlin.com>
In-Reply-To: <DM3XXUK2K2YS.1YF6BBJFAEVM4@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|AS8P189MB2272:EE_
x-ms-office365-filtering-correlation-id: c4498355-b321-41a7-c107-08df29d78904
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|22082099003|18002099003|11063799006|4143699003|261009221227099003|261009223327099003|261009223027099003|261009220027099003|261009221727099003|38070700021|56012099006;
x-microsoft-antispam-message-info: 
 Yy8hQW8FUNTZ9gYXmQZNoeZ0X6+93zHoUpMMss3/52lgpJ1CREMl0qMs2eFOBhOAsSIodngORlFw75cdGyUhhWxqV64JFq+mYG7B/DHzTUkr3ko2tGmody103E/94Gtnt4kchKsD8B/fYypu0S4X5VCViA057kGMuY7Mk9ymxgZ7faEtR/WIdc8eiiyOwsynPGHktvaEP9ghACQlJHDFv0TI3zAtjm3N9rWUIMS/YMIoMdRDRfTQj/nvPoAIUu9m9nIlMLAPgJaz1Wd8F6aRWcvuE/pReE3ABEErM832aYwSMhHI5EPtD51/Xmefkk4X/Gm+Eog/WcNc6A+t4CI8zcg49ZB08KbywwCXHu89Ow4t3fmnfXy7/GwqGdBdjcU5IZncufQKcMz8GxP5ijVSavh8cUpnle23/taSDqksSKM9sds+ZChuegFzpuwoYVK0RINml1H7I4hdsTzeGb9T4fI4DNmVb1iwzKRSmxS1DKc+mIoQ2FsxmTahup3cF8WmRLVxr+cO6jd3pRMpQ7d4dGJD6N/BbUK6yYsfP+G4mwyMWRbA2KW60Q5kvkeQSNQGOQgkSSRf3O+BreVsYFARcPw4yiSuLOeNzwSdcOhaeEz3O+aiWXI9uqt1+H1LDzB7dV1X3aTAOrzG5v9k1UfIGWWSGtRrhxw94yRYuxuDcyM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(261009221227099003)(261009223327099003)(261009223027099003)(261009220027099003)(261009221727099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MPxeFMCfa2+JNbf+DqEtomrVLK9ZQxlsSWFtixwGi5EjmOoQaeUHRH4oNIN9?=
 =?us-ascii?Q?slb3pcCHRNE31AIECv1JG4lOwJnwr6X/qxeeYadPhpN4D/tctKDZRyvaiTB9?=
 =?us-ascii?Q?V5aRC205JqkIwJBCPMZ7fUC+/xcNXAL6D/AvBeMPpRzLAWS71piKzk7KGUMG?=
 =?us-ascii?Q?EQOCq/AB28jFNo/nsO7B+o+Bem6Zla4sWeP2ZmZRT4b7COKVtHkUtQk3/D3y?=
 =?us-ascii?Q?wRjgN90EkrejxEkW//xgobYZf3ZaoDvWIIxP8UAklflPtR7aeSayw4DWNbS7?=
 =?us-ascii?Q?bdGnPpN4mWZw0DeGpTQggxfQcJXBvAYbd09YB+9x0C085yAsquMx5HItvMVK?=
 =?us-ascii?Q?4vK9AU+K2J3URoS38lP5SwAWM53QyKwFcfGeivAU5VlEVHyCKS2Ev7fx9aVf?=
 =?us-ascii?Q?BJ58JwuTlEq0WAqBvZc8wEBU+MW9yiUaWVVW55WBoyi3MCy4pgEoBhU148hJ?=
 =?us-ascii?Q?tiSO9Z8KUMOBIqYB9Nn5J1xPHS8uQhUhs72CPCF5qpZr64LpIrpHOuWu1ohN?=
 =?us-ascii?Q?Jh/nvlpuEhFfSkqkMzSqUMZtGoyGLgtHZyTKowxKTwaJGSbu+v6zmfdBecUy?=
 =?us-ascii?Q?76Of4ZCZAisUCv75FmxUi3+OVtDan+O1DzxBQmeWUyQwfVv2OrzNJ07Qlj0+?=
 =?us-ascii?Q?6UvWdOCO6XAdhzM6NUAOO16fGcijTeH0w9E0ayaiu4UWDbTowrxviajjEBN/?=
 =?us-ascii?Q?H5/SS3pG5Svt045fl6P8QeoPn/THWwSDoI3Js2q8Dx2N6L8k82WqmWf99oX0?=
 =?us-ascii?Q?0pCYNh6vp/aQOmrS9LfNNYiv+uDDLI1naxCZIht0VNxjHs0/yL7f1o4W7Izt?=
 =?us-ascii?Q?Z9+oxxTdCwgEIO13Cy3LJS9kc4ILi6YrZTGBtYgfZSLAKYWgq41yGg/RyMuS?=
 =?us-ascii?Q?gzBluQ6CVO08KEKASpRfiKnDmTlRRit6RCOmbY1/qWpih0eJoMW3Tiff0iTT?=
 =?us-ascii?Q?dffAF54CBxMLORZFYiYvU0qOoYqkpy4N3rZDjNF/WQlcr+Wm5eu5dhnxx7pd?=
 =?us-ascii?Q?ZCzK2v3NS0M7CpvOos0ZXCRx5JuCJ+c4KXWTJsSvmLjH5XNslz8qW67jHhmz?=
 =?us-ascii?Q?r6iAKCw7ADnLiSVwzA5xoeZit//LzATrjI8YQx4TDlre2Q97NPV1/yXdjPs4?=
 =?us-ascii?Q?z4ZeAVBtN6RruqjeaYgwwKPzxnFTHxsMp/nC663KbwJcRFNAQkYTmweju2wO?=
 =?us-ascii?Q?PkHEoumQFNneVhDQKyZoZ2/Ttq0IZHpYyPY4JF2XJ5rBQbaLpVadAzPkANoc?=
 =?us-ascii?Q?9I4lEj3TNwKOhTrDvVNoCvcnCNIk7dZIUeoAXicCQhkmyN07haYVcdEPi6Ba?=
 =?us-ascii?Q?2q/gvfyCDE7omKnDbysFOiAzMgguqKrC2d4kvW1yDDFUwT+dUq3fosredYgS?=
 =?us-ascii?Q?nV64G+B206MMd6iAL9Jvif9Y5ice48jnBibe1dsqeGUnEJ8+J2jnBL71RjLd?=
 =?us-ascii?Q?Sv44tH2GAPVJUf/2QImdfK8G5NY2L5rzzovM71q7KrcfAavB30lB+jgR5SLA?=
 =?us-ascii?Q?lUCVoLVBNUxiKYmS3MXGTqgMa+ol6U0B/DYtRoo2Hb7JbpAS+XEQaK22cT08?=
 =?us-ascii?Q?4htPmvtGnWlFwR97ll+A5p4RLUVSR+i8BaUQ1SLHg1ip6lCHxbV/MuVPzbn/?=
 =?us-ascii?Q?uS7T4Ua2Gi8Qn2IoA5ls0EbbsPGmDRVVCoqVh7gMN0KhKK30x2gzEla6C/wS?=
 =?us-ascii?Q?UYYet2nS50Mm7lDk+wLgv3IymsjEHAYOXQW7gyKBsZJs9PI2/MEpLhDj9oEb?=
 =?us-ascii?Q?KJOlpOVPmQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c4498355-b321-41a7-c107-08df29d78904
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 09:43:00.3041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DDj+wkWO8D7RIlhKN5mRidNuYms2x30MVLdFApFyPP3hOkF6g/n0j5Lwf9735MMUJxTL4okIrJVZUsvZaRCmig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2272
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 09:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247751

Hi Mathieu,

Saw these failures, these are OOM's. Sent a v2 to allocate more memory.

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Tuesday, October 13, 2026 9:01 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH] libsoup: add ptest support

On Tue Oct 13, 2026 at 10:16 AM CEST, Pratik Farkase wrote:
> Build the installed-tests via the meson tests/installed_tests options
> (enabled through a new 'tests' PACKAGECONFIG when ptest is in
> DISTRO_FEATURES) and run them under ptest with
> gnome-desktop-testing-runner.
>
> Tested on qemux86-64 with ptest-runner: 36 tests, all pass.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the rebase.

So not it looks like one of the tests is failing:

Failed ptests:
{'libsoup': ['libsoup-3.0/http2-body-stream-test.test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4711
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4739
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1374
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1361

Can you have a look at the issue?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


