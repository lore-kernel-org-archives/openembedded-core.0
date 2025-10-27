Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A48CCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 19:14:37 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.71])
 by mx.groups.io with SMTP id smtpd.web10.41902.1761592471176454491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 12:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=r5GIzInZ;
 spf=pass (domain: siemens.com, ip: 52.101.69.71, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNy84f3xk7ye/VMUFQVURsXdYrUyuEehqVcYqZO6c+oBfbAF9Ov8s9X1akEacuvw89E47yleOcDMupknT12NP9w5LMN3WlVmbV0GVouGMu4Uwm9hrQzjH9E3JPATgzUNS/+8uRn5cDiy1bvNdXs1PeR6ZAsGoakRRyTUGCVYq87HGJ1JWNYOXPkZ4l9y5w6AsUf+PWfyt2SS+oqwpu2E/pKZrQKwjdSIyRBg5Pa/SqwkmVMOVS8hf3Mpx5oIwr5pJqCzYlvnW4nOHWuUFt7OCIp0XFN7A7ybeiS68nPOedNRzlKkg86rAeGs+r2u7eTzqtEAA7lI0UThVZaAue2kcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcZsFLfWh6NQ0lzjCUKllW306iuPIEiECLn+sGJJ1Qo=;
 b=FB+df/0RovS5ngssKZyLlHFnmcyWPNoUaRVCeb3dfxyupZX1tZvkq5aBlKPkJstes5IIWJftWFdbotUcRq+rF+01AI0xw9FZBiwvNRrHtlMhjegFwbr3qKBp0Pf34VtJjRlF/jTI2OzC0fWQOQWcKPUMyguT30CLZ4I4bdZsIP2kfuV8jQOV76vrRq0A+j6j83kO/mAu5QzNeJe9CwcMvJ3SMWGnTXSbUZ3i7Jr8QXpSoZ2bkvOjRlg+S6I1rThQfWg2SbmGHu7ZRTrn/9CtBTJCbEnY13YcMcgFkSwKx2tm2gYA/Vra4X2UZMlFtDCs9zt5HtoFaxjnYUwhxec8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcZsFLfWh6NQ0lzjCUKllW306iuPIEiECLn+sGJJ1Qo=;
 b=r5GIzInZ9gMMGxIfJnpR7rhR9Y+WihyohdqYM0UzCYSuhFhVrY5RYSbqM+FhisZfyYc+eCnn7pOdpqaVt4vVqVuZXor3SUvrLjPCm89FgxUwbxlAS7x2xGJnFEnrNkgvDNE18bYchi5TG8P87jxtIUs3nzzXuczb7H/pTpMFAcepHyBCyzSO1U3iam6L4FUtd/MsG9G4oaIGIa0to6yyMDVRj0hsZQG39QLp2M+OR+uCxVTMlB/1OrsQ7oALP9IlfI7tYsOfycLK0url6XtxtBYp/xAqTmrr1aLHHFxR5EVi0j5Qzxeaa4ucO4An9VqWhWyeK4Op9cnJ49qLqo925A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB6327.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:14:19 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 19:14:19 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] qemu: upgrade 10.0.2 -> 10.0.5
Thread-Topic: [OE-core][PATCH] qemu: upgrade 10.0.2 -> 10.0.5
Thread-Index: AQHcPT6IGhIKMD8zAEa9VVb/Z/6gdbTWVWyAgAAbrwA=
Date: Mon, 27 Oct 2025 19:14:19 +0000
Message-ID: 
 <AS1PR10MB5697D5AD87C6A4A685B71410FDFCA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251014191245.581962-1-peter.marko@siemens.com>
 <2E417004-B05C-47A6-AB28-4F4F218491C4@arm.com>
In-Reply-To: <2E417004-B05C-47A6-AB28-4F4F218491C4@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=71e364e5-3e45-4fe6-ad60-4d23f39c02ed;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-27T19:13:37Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB6327:EE_
x-ms-office365-filtering-correlation-id: 9862ada9-e043-4947-09e2-08de158d0769
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?OHLAmVU/Eje0WRVMtJSyFmCmaqp47fPT6mUH3hrZv3d3mUVAEKfHE3q/L3bM?=
 =?us-ascii?Q?UD9tB9GdPGzqRH7HGNf0KiI9CSwG4PdCQdZtXeCipQBKKq7F2aZkmX3PWr5Z?=
 =?us-ascii?Q?TKn9GphC8axwz/AQZj4dJszLCP5yKITsRvPIThY9VZWXt2Fz4nmswAUWrsGG?=
 =?us-ascii?Q?eJy7t1F8qkAZF5mvKGkfjsaeeZNW2/78IPwGV8MJaR2aKVclof4OS5PYFhwH?=
 =?us-ascii?Q?3RtF7PUSgl1AkthcdMgTYtAwJrgxFvK45vVeSf9MgBxEJs/1SauaI9JfGGph?=
 =?us-ascii?Q?v5TISDK8Rq2hk3kxPeWbgT4td6ozlw5WMunXyD+pDd8ts8R4eYvkJrkdgIBR?=
 =?us-ascii?Q?FzHkk8lK+RueZs8iqN697riRS6zgftm3aAvHMGjSy1WLnLwUEb8uz1XZX/F2?=
 =?us-ascii?Q?kvgaD8RvVNmnU1M3tER5zALON5N6rccl2tPoSuGdOBo5DYfUfDZetKMuKe0t?=
 =?us-ascii?Q?0+xYDm53zLxmbn8hBVNF82R3sAZBsOY3li3QGOUsLLLuCyGqVgp8YCl22fAx?=
 =?us-ascii?Q?8PQGvNbafpSZIs1mN2H/tUFg0liNGU8ZbXNyLZzNB/Ja5CyyaILw7WWG/hNw?=
 =?us-ascii?Q?t5i2vrKHtNgZA6E3GR+oWS0eIaeJaDGJNZimDE3czVPJ9OfotAqWLvxszrqk?=
 =?us-ascii?Q?xCjzMOs9Nbey2nPYcihnZwlrrcTaTiRV6LmhApfU3lSICRfFU8SIVCtc221A?=
 =?us-ascii?Q?Xg8BB3Rzr0L3SaB2SL5zSF9N1fjdP7najJk1E7mbXKHONWAjClKi0PX2NABN?=
 =?us-ascii?Q?gmb7jH4f/39Y5vBjYkk3M/FzSYMDPMZ5m9Y3sSsY/U1tfE7D0Ckc3053JN2e?=
 =?us-ascii?Q?tofOuKddpzdyNaPFTVbB9TJ/OdyIJMuQB5L3ywAYARrAvbe/RXNK0kdaFYtv?=
 =?us-ascii?Q?P6U0ZceG4+uoXMdf8Y6AjmQGWRduoIoao28xXvOiDeBfm+D2AacXbz0x/vH3?=
 =?us-ascii?Q?E91Ckbv41hXe6QnhWn7yAXgS4XLysHjFhOcL/Zj5SQXOhBTGd7+UIevKylVx?=
 =?us-ascii?Q?JhnoqnbTFWN0Jpt1uvf2/1U8PNr/f3wXjtQ4RfcQZoRe0w3+DPKhtuVyeAjB?=
 =?us-ascii?Q?PHxG7sY6YNFvyEdc6pHsU+wQ5cC9d61K12tfI89yXkmZBKlrRp8/OFJlrRrN?=
 =?us-ascii?Q?lyx+iXFBz5jwGz0aqi/YS+AHiSf7IHJpE+9c0YWoWwDspslfzHtRVoZNA4PV?=
 =?us-ascii?Q?PX4T5gA7vqL+SsFwBBLhWueB5wROpgZzjc2iSacgnmi4F99Yc4lBxVDDRW7K?=
 =?us-ascii?Q?bijaLdOJGigxc+DS//Pa+zMOHHLE6I8Nw4/lqaycvIS/evPEFjL12NUtJePs?=
 =?us-ascii?Q?10X4F6z6N/mFUnHXS85WHoHdJ4R/IIYwBkPe8hjWYaA5KG9qA2sq8VxGBM4d?=
 =?us-ascii?Q?41LDxfLxpEf5lKK7f0qoeDcyOGx5bdgf0+fzeBOVdn0Y9nR3wtJrv7hn9/fw?=
 =?us-ascii?Q?hPBcJfOFTVdNlTvT6dBBdFcsb3mynsAWRKB2GqqMsoJnrpKgeBEztA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4uLmonFF8dXsYbpCgNlPO3qpn4mbiAyr/tx4spZ0wgtX4K3FxPhBeJiKKquP?=
 =?us-ascii?Q?IDi2Nao2oR/R37MzgClBNDW8BljZsGew23/9TuStWfuHa0zydYlBRrK3wRVJ?=
 =?us-ascii?Q?mrSzxmQm8Ptskr/PJUqsgGzI4areuj2p2Ya5Q+OLpc7tN3F0rXGNuM13VQlu?=
 =?us-ascii?Q?i8v8h8p7x3FGm8A/8E8F1AdZm28aHRfYxBRP/ugdULvZ8lmpRFC5unD7+ROI?=
 =?us-ascii?Q?skw9oK/W1s8pJOzPz6MKZAhC9p5EDmXi2HkqHs+UBd9ELmoXC7pXVUhrORcT?=
 =?us-ascii?Q?Ia1CoiRIok+6CFo7Cuuv/su7EuYL8rhVkJn1FURTH1FO64/SYjAWRsprbpbe?=
 =?us-ascii?Q?rE5lARXaZHxFXS7EZ6xWslDqXJ/CsDuJnBXcyndIGMoVXOikahcvMDEe1UR/?=
 =?us-ascii?Q?t1ksagWYsBQU9u+G1PnXbsGyz0SPhbIeKdaG9xs76duSKoqdtETXJ1OS4Nih?=
 =?us-ascii?Q?nrDhBDTtFSY1UKYubAasQOK3eMpm2lsl3uNpc/nfH6qW4ZodysyWN9fZDd8f?=
 =?us-ascii?Q?MGpm2rIxQ0KnU4d7SuNlJ1tTtlc2rZhGzoL/ZFGPmvAKbS/OTru4Oya34pMF?=
 =?us-ascii?Q?RMVgFoLG9HYgCHs95sDB+eia2rxmiwqvHleHaESpc9ZgumxA6Ju4ZbQydjIx?=
 =?us-ascii?Q?8dCgraZ7PTFiglp2OGatCffW2QU7EIomyTRET9SFTXGt4MhklO/BH/jADrf3?=
 =?us-ascii?Q?U9EGTYjtCa871T137J20gOXF8OGPTXUyoQuQYKjSFFPSXKFLzRvdEtsOS0sX?=
 =?us-ascii?Q?gKwN75pNgtkQg9AchKdZQYgBvQ0WCQXh7e/e0acYIDKQxFzKwAqKUXG1LX4l?=
 =?us-ascii?Q?f7FgNiCm0dVKsG2VcnTyRcMmNJJDrGkJPVmicT/NMWGymApqa4zHWHdGym+B?=
 =?us-ascii?Q?b0RYiH7lsQ+EeJsplzt8DEQCTsJFK2M7a6MCOiQTgVeNgKWIY+M8NuAf4oQX?=
 =?us-ascii?Q?kT9PYKbX/Q8HE6qfX8fK3MRKWXWVeUwC/3bkUQZqFIy8Y1wxpcsnEjeFhU5e?=
 =?us-ascii?Q?/mlVMdcBM25RELw7tskutTk8XSHSGR3Tz6Uqq9h4CtOdXCIN+BThSTeNmhcs?=
 =?us-ascii?Q?O1c8ehdknH4++mCUFyySZu3J1McnzgOsBPsN4SdBquDle119NxbaQyXeFMa0?=
 =?us-ascii?Q?EiM6D6XbjEBKTCK2nb8rKyvnBdOVGIIewfCBM1nzs1U8QqpVfyCLlZ9gNKGR?=
 =?us-ascii?Q?g/rQX4IPXn0I+AY1MpeiPZC74vCeHBR555P0a9u3VkmIdVdJkmAd0GUOfsSS?=
 =?us-ascii?Q?Q+KOel1KTR88SgOzNTZDQmOWjJHSh+XX7aMpOwq0r44mGDNBvRqfrjoTUgl8?=
 =?us-ascii?Q?f+2CxvEFYR/sDDvgbMT5mxLf6mbFlmtzEnKr1mfTDViLOxwmJ4jVWhgF7wo1?=
 =?us-ascii?Q?AewcJN8tsKVuIN04Nz29a/vGFMvXTm4EbxgWmyL/vgK+Bw32RoIqZVfUoWyK?=
 =?us-ascii?Q?wAQQeVn+zw6EImACvzLjBT4ulK8k3tBgTIExOj5RSvYMOWqNQvaeLNv66zF2?=
 =?us-ascii?Q?BggfX+PfwoPjmVrnrE4wM35aGw/QvIsxiKEfZQCLlssS30N8xyrCkBtkrsIB?=
 =?us-ascii?Q?PaqWc86c02Bu9fFyZmX3Y61HXkj9rMj/4CdXvtXc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9862ada9-e043-4947-09e2-08de158d0769
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 19:14:19.2061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X5N4JyyK04t6RfTrzOJBqcM9u/HW8h9veR3q5kRP16QKsfP1/CJS/EzJDZNQVVgKH6ymQ+nwXxCG8xCcNjkiZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6327
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 19:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225350

Sure, I have done a quick test send sent-out upgrade to 10.0.6.
Peter

> -----Original Message-----
> From: Ross Burton <Ross.Burton@arm.com>
> Sent: Monday, October 27, 2025 18:35
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] qemu: upgrade 10.0.2 -> 10.0.5
>=20
> On 14 Oct 2025, at 20:12, Peter Marko via lists.openembedded.org
> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Handles CVE-2024-8354.
> > Drop patch included in (backported to) this release.
> >
> > Reference:
> > * https://security-tracker.debian.org/tracker/CVE-2024-8354
>=20
> 10.0.6 was released last week, with a number of potentially relevant chan=
ges
> given how this fared on the AB. Would you be able to upgrade to that rele=
ase
> instead?
>=20
> Thanks,
> Ross

