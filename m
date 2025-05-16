Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A308AC3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 10:43:24 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.24])
 by mx.groups.io with SMTP id smtpd.web10.10181.1747392203509009540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 03:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OGXt61ee;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OGXt61ee;
 spf=pass (domain: arm.com, ip: 52.101.71.24, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lzCn1/WT4F1xbxukHz5z4DBDchYDtYqNgtbJoWGSm/SMqdcZYzJWVY3uNqTgRvkEWFmhnUpR7izbCI51Tsnk91nkCVRaFFcNTCAxYbdzyCl/Lt4oUEficwVOFNyP1hNBUO6I+gPmS2gEe5FjUluBANXdnRc87IWnawEvckfJ1uTx4BtwIXTChNf6geTB9EVQRWkfBLOSxwGDn8uWLBxFM3z0ymG3FWY/6L/jgW+hTi95uWEUQFITIzdskJJZGQWmgj0odZuZtdltQJdBIU8X8Q4fJQA5pBwDoigSqiJ7yQolBcb6nRP+YeFjaJ3PqCXCl0MAn6KbwoySFPNYP/roLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VImbdR/7IZ+TjMzwDTNXhzSky0UhCIHK9GWlvOL4nc=;
 b=XujhsU9homnbBD3W6UPI7v1LJj0ZmBOxVGYNgtQbEQZoIo9C+y+QJnIxG/ntrL8NO5yrZY79HHpNIvRfTS5zaVpddXHdFpGSW/61mZ/W3Ti0k5aJkQgaCOiX/l2MXQzG4DxoYe63Jffx7BfZkHnCV3sYF7SZlEkWDzKArEw2uW59vH1tjaELrjtNYX/UtS1mooOrX4R1wihlpZvw8i27Um6Lre20zBq7MNxP33IXwnPL343p1ln7rZuFmIkIe9o5VmFA/rQwgvFAsNHLFXk43wtG0gkdA1i7N+v2a3VH62NAu3s3WU2Ifzs80enRSc1LUv0yftzEkvwaXA2GnOTYTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VImbdR/7IZ+TjMzwDTNXhzSky0UhCIHK9GWlvOL4nc=;
 b=OGXt61eekpj3UwV3WQq8/tLqHZJ7hTCLFcRCUGUgyStSmBHy6eRwJrzoSoZSQbp9k63MoE4CMHhntRTMeda/N70VxwK4XpJWa6CbdOCATR8OcX2iD2uQp/KHIcZJmCf3DzKdfrckB40LWsG9N5sv8R++0/AYBGQVDda9OpYbXks=
Received: from AM0PR01CA0114.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::19) by AS8PR08MB8160.eurprd08.prod.outlook.com
 (2603:10a6:20b:561::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 10:43:19 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:208:168:cafe::8b) by AM0PR01CA0114.outlook.office365.com
 (2603:10a6:208:168::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Fri,
 16 May 2025 10:43:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Fri, 16 May 2025 10:43:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYG3a6W+ecueIuPG53MI/lvbLwP1xChQ736U5oPJpLYeWPP6Sy6C307RZh2t6rMLaZmeGah99Vh4sIu4iIxXosyRDXZm9lTNlPGKgeqWOl7lfKVh5tAO4iE9h3LST6Wd0jBSSk9OATO9VLe8H1+Z1IE0tXAr4ycmHlf5wNvj3ER7Cf29bfeb8e1/rOJXEHKc1uAu+Mh6q1/bDTL2z2FXeE6hNzUkFe8mzx0Dw0WxkQdu3+24EYKsjo11Npblc1Th27Vq0LY51YlqknsiO0Yaqr9JIpp1GvPPDRUo5rQt68tVoZxyMDdLuqqjJDBSpGzUfYqVErz/EsGqAtqDxTFAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VImbdR/7IZ+TjMzwDTNXhzSky0UhCIHK9GWlvOL4nc=;
 b=wELqfCJ0ySIAGMX5zEJlsG8JPbFxgFKYC0zNyU6SMfgmftfTjmYT0Hp0u4XmlD1/MOCmG1xDiCqDyGgo3NmEX70+tIKFoldgYqI6cg0KnEuzipTRV/ah3weTVDNoU/ZDz+PhfTdXOWT+VdXKOWilAzI/zVnrJ/gPx4kN5NbtAi0PWnAVxVq0304as79UIWJO/z6Cufu3ETPM9TWBnBEF2A9Cnmr3Cas6S6hr0zGSVlEJcAweiFfDebijShcsH1TLYW7tESX7DJmseFkP+SaXOu0YRcqlRmLfZeY/bED5kajhMXaDnTwrnACSAu6plH22mV9hy8jFLUSEPlORtDMzwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VImbdR/7IZ+TjMzwDTNXhzSky0UhCIHK9GWlvOL4nc=;
 b=OGXt61eekpj3UwV3WQq8/tLqHZJ7hTCLFcRCUGUgyStSmBHy6eRwJrzoSoZSQbp9k63MoE4CMHhntRTMeda/N70VxwK4XpJWa6CbdOCATR8OcX2iD2uQp/KHIcZJmCf3DzKdfrckB40LWsG9N5sv8R++0/AYBGQVDda9OpYbXks=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7899.eurprd08.prod.outlook.com (2603:10a6:150:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 10:42:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 10:42:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] buildstats-diff: find last two buildstats files
 if none are specified
Thread-Topic: [OE-core] [PATCH] buildstats-diff: find last two buildstats
 files if none are specified
Thread-Index: AQHbxk3/tC31KZpg+EuPUG3cQpXT2LPVEIuAgAABToA=
Date: Fri, 16 May 2025 10:42:43 +0000
Message-ID: <AAA27BB8-AA80-4508-AAEE-E434C84D3584@arm.com>
References: <20250516103324.963974-1-ross.burton@arm.com>
 <d5e3fb23201564091c09882d018b098a315c37da.camel@linuxfoundation.org>
In-Reply-To: 
 <d5e3fb23201564091c09882d018b098a315c37da.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7899:EE_|AM4PEPF00027A60:EE_|AS8PR08MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 57932ba6-6287-4a99-b32a-08dd94667844
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?3gqcrO0uor1Wur7ByVB3OsQ8RoPXQcG1zI5al2jbRdKCZeUnzeDWATfBxFUC?=
 =?us-ascii?Q?b/Caf7J9Vi9nYS0OinJ9Q0NyTM5fyWrAiBHvGA/DDf0k1nlyRP2CYGNOJoXH?=
 =?us-ascii?Q?izoYfGpsUSZc4GLS/iY0q2f8+swkGQFr59/4bzmMvLCaP6COHfNGVzTjOKDg?=
 =?us-ascii?Q?ZsBnnu5Mx/72kQC9RkHhKuZbH3LH1rbi0lk+Qr2LJ59pIrqv2Hdeq1AleiRs?=
 =?us-ascii?Q?tHav7lgjyncrDKFxRIRxum7xDbGEcoY/nR/5n9duA1lPzYCT/Gwenj/bYUL6?=
 =?us-ascii?Q?1HE/oCJjFzKT1xSJDYftSWM8AGdRFPMy1xKNkK6ZigYPwoFpq3svzFOunD9b?=
 =?us-ascii?Q?FwHi2DZoR7XpdqmES48T5hii5Wqd350g1+FSmvnXp4748G6ZdMURkGJyLsmc?=
 =?us-ascii?Q?5nCtzhNWDaavU3ctrkWcD16mo5QijvF3nq5nthZJjq67o37eAZRyKlWqagCM?=
 =?us-ascii?Q?FWmwMp6vHmJeTxsFgbY9/UU/aVxg1cxMgr7YzpNE6Kl9jmlVTuQdv2PPMSPa?=
 =?us-ascii?Q?4zVh+Iu3FhjZxM2AjNpHCboWiDoDrShuzAXSufnMLjhBe4gZ1erDRlrh2Kl1?=
 =?us-ascii?Q?02OjrLCu5Xq1UvcjTkak7b8mp5C2Wmq7AHP73UCXOLpw+3BMiSE+PIdMTjYJ?=
 =?us-ascii?Q?SYJrDkZXS8RTCDfYbcPnz5A3G8Lu/BL2RZYhSrvBEz6KZt0y+AKuulcDTLay?=
 =?us-ascii?Q?vEgAJtdmk+YGDdtEWTtkrpR8jzUrq/nxeO0bCqCCn3GhpggRvUpF2/RjdiSd?=
 =?us-ascii?Q?R7kj4Je4nJkm6/t4LuNPW/5CCzCoADmHCB7sPrP9asGJCyXwEp1SsyiGJwqs?=
 =?us-ascii?Q?aLc0c0JkC442GLCPlPWeQPutPnN4ZZPu6Gjd36yfr3sIwPhQBLzid1TOGfOM?=
 =?us-ascii?Q?uSoJyfDhgK3qjyoap4ejIGx4KmW15sRBaoXho+7vSQJTZL2hoxYfVAmcVoLj?=
 =?us-ascii?Q?IJgsAnYdx2qcy+LhOXq/z/I/OoZ+ACpOL0AmlUddBkB6krLZRPLUYlUmTXYi?=
 =?us-ascii?Q?ajtfurHkbtejj90Hu2QL318/lPr23QqiGDhHinJwQrDcPABBoDkeBA9Jg9UQ?=
 =?us-ascii?Q?dHPUHDDRK6TmvbNpAHcqL8PkyX/wfqkFue3SPKd41aMZf/A/Zqetx00S2vCm?=
 =?us-ascii?Q?q8LFzT1GpoPeZa/g/vvj4f5rIOU+Cl8//1gVSZKjPlSHpGbnKXHC6mOWwFzr?=
 =?us-ascii?Q?ePno8lHDkoRgZtUuxXePxV3SWRyltWvpqOQtQjk5+dhA52EmAIunACiJzKP2?=
 =?us-ascii?Q?b/CQsTbaVO8SUynl4eEXmXmtd7dVHH75bqRZSLPIFYpeY+5Q3NyNJ+PUqOah?=
 =?us-ascii?Q?LGS38LjT0wqxnQX9bf77NLKiUom+SI0a4cvn5InA0FQxvL515Q+JRH+R0851?=
 =?us-ascii?Q?YuJ50ZlpTniExIroAcbyPt4RfWLaxssgWyZLdqvG26oeyjTzPJQC8rAEHoGq?=
 =?us-ascii?Q?HPxfiUvzNNGMqtRn5At48EBNZoqDrIQT2LWptNMqFF9vOYB060Qdcw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <897A25AB4392BA4B8024F051EE9A06A4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7899
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e5d81188-ef08-4712-e9cb-08dd94666386
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|1800799024|14060799003|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SSgeySHAN+mXFwMW+XINWobvEFqyRH98x8FLxMkJD4ZjZgnfIiaLvYwFuHGf?=
 =?us-ascii?Q?i5y6CcFp5aJeN4dqu3TVSUaW4me8WAOGqQnjqgnApBpYxGLckxBEOtNDlrrB?=
 =?us-ascii?Q?LEJuT/gxRfLtcs8Gi7npZWTKDx88YtBSVg8nAk0wUCsiNCKOIk5iedASOS07?=
 =?us-ascii?Q?X5W3+kwV5O9yyv7jGgZOSCM+5De3n8cVOyCH+WlP2o5RYC2G+57E70UuwXDv?=
 =?us-ascii?Q?TMqRJwFSe8bCjBpLyONCnHCgKpHWy4qzocFpf5geDgnlRNelt7U8LrOy42p1?=
 =?us-ascii?Q?gPOn/Lz06bdU2ZTvvuNmGHCeqi8JKguAUCqoaABVHk4+NsETMrMId3MkDtfA?=
 =?us-ascii?Q?Fnp25pFT8fw4Cq5OySBrsSrGKWlD7j5G+cNZ1OjzwN7wkF9a5eQ6DSMGk9zf?=
 =?us-ascii?Q?FWAHVC5qlXV/RRaB4t/pjX52j2STOhGhiLyobfHogDE+VN2vI4JQr4BMVV/d?=
 =?us-ascii?Q?tYmgyUgcKvJqZORc9EXBOmoR/j21rpYdVDUMAdJnqzeVNavPZ8yKwvln84f5?=
 =?us-ascii?Q?m7jKWqhk6NsmZQEuLs0YvI/YNXsOWBl2IKLsc++Y+34GdMlh8Yo5cYPSdqn5?=
 =?us-ascii?Q?iR69GFMJAKSHpd20VtRBex70Ewor9PIPcvtgmdEeGsYGn6dfcsyiczmZXN8l?=
 =?us-ascii?Q?P9ycEg5tx5CHSK8KRQtH7DQyrYrBGumD+tNUqXXqMFN+yH0AJWg92UmEY+sU?=
 =?us-ascii?Q?of6YvvzbpDpIeOX8PduOTu3Xkh5XFZuAnCLCb2RoJY2nljaijSXUIF++mzrg?=
 =?us-ascii?Q?E7qhibQsnGVtCnaDOApq6K3Db0ZH/UnbrsFKAHD3u2hSBBA/tUJ6s0TOI29V?=
 =?us-ascii?Q?+X37Qlx3s47isufYoKKB3eMEE5LsJbdqTPb4NnM3FpEmXszXBKKBFDT3wneV?=
 =?us-ascii?Q?Mplzo58rWUosFY4EE0AfarL8EwCWGi/VULV1BV25YSMTyM1xarqW5PsL+8dZ?=
 =?us-ascii?Q?OR8vOB3xaReI3Bjf+pmvB3Ld3qDwjKcWN2hV8OO98/Nn56FFdaqiw+wR+6mZ?=
 =?us-ascii?Q?/+wcq/Uagn7hG1lDJof4qTTv3rPKDK7N54s03KOWHxNoDxeYuWdm8mwPl78i?=
 =?us-ascii?Q?LguzCiqYkSGbfE6vkS9+DslFoQZ6ruD+Xu/wElH6vYSh2v+FtPRPAzy4mNDA?=
 =?us-ascii?Q?FIanxEnau+Pof601X5PWlVVneJJeucEEYt6Z6u6dm/vS4CwC9619CstVVaGP?=
 =?us-ascii?Q?denL1gB+/dAdHos2Rc3iD6Z00kHJP4v4PHe5j9zOWaBYIQedwrAe46Fjvpit?=
 =?us-ascii?Q?yW9DjKzwsTtu+4fiArwedovAv8GWenv3sATedif5KUcXxC20B6LNBybPhWoG?=
 =?us-ascii?Q?r9SBC2/ljoAUObl9NvHk2saZxpEMM0bqxVRbe/Qc6UGvLFeSWVDg0e2Z4wU5?=
 =?us-ascii?Q?KYY4VDwSloo+u7LjNPFDyzEhzkQnseDWSX8U1MgaUnV9gx7ds4xb0R9Q0+1i?=
 =?us-ascii?Q?zlVFdbOfrA4ShH9F9dCIiPK6VroV6DGUZxnejaCaZPVyN0o/45xGvwCLe9dm?=
 =?us-ascii?Q?ILAG6TM52Y4tlOmeXKJvZ92ATRFvPUvH8fRi?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(14060799003)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 10:43:18.1425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57932ba6-6287-4a99-b32a-08dd94667844
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 10:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216743



> On 16 May 2025, at 11:37, Richard Purdie <richard.purdie@linuxfoundation.=
org> wrote:
>=20
> Should this print something so the user knows which ones it picked?

Good point, v2 sent.

Ross=

