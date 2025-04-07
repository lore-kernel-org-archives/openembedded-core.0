Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0494C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:45:39 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.65])
 by mx.groups.io with SMTP id smtpd.web10.43354.1744019132503652061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=fYuNuEkX;
 spf=pass (domain: siemens.com, ip: 40.107.241.65, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEVPKXV2Csy8jgqxSuY26VIvOO/DTi9Qaaf0oUeJucMZQOV8GS8/ZCMOv/H7YuAPUnc5RK4AD7RzmvRqvPBSpSy5eXn3yTYLV8jmDjqLwORR90pwlrloUaR3JAel011zsF3bc3li7NGyGp9NlQCzbeAlnjFc0GZ/2TZLl1J503T8a9ig/vvmp6dInqxRtVcsuPeGNt9dP/qklkL+93PGxjf/Ye+8uni3kp9S6nFoNg1YjpQR2V51wwnb2cRE+5U9hNxFdds6mOE8uvg/NqVnI2+nY++eiZoU3FFTZEqpEbBc0dN4lHFWxZ/53Eo85xlvQVeDifOx19aen4T+3U8zaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ws8NVzxAHWySUyXNupCBMa6n4eMs2+JIbo30dF50EGo=;
 b=WZlpGtpmzSSdv2Tr9hXvAFyPqBoC9h2j5vGkUe6GylzseFffUksq5dVWyDc1th2lSUZY94lCvZFjBLJ/RtgYar4kFTGE5AwqbqIhBTGMAHaNeKbl33FqxbfKUu+54FjR0rLsPE6aFn6nkniwP6HxbT5hjtAT1Y0O5pgno7d+QPLMXBQ/X5HgwUZ+wotTg5eg/dgiHSYo/XsxQLOkEZDpImMcQz8ydOHb0qZRGvK4Q1f4QyjCG0eltPLpN+Xr1xFjuGvVR7C3+H6/WBpyorUAqZzFeJbygTbWfR12FxwY4iyovGMIIJPcMZPXdlInDiChOStW1UbtnVWo6nth5vF8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ws8NVzxAHWySUyXNupCBMa6n4eMs2+JIbo30dF50EGo=;
 b=fYuNuEkXgWOuMzxa3RYo2y784rUsg0xi2ou+uzmD3Ba/wAtNksqYyynCIm4IQbxNmg0Awk6wlWi+JVYWGmIB8E9A8lZKUcCgQnAZg5BBdcvj7hBMud4LwwmY5vL2WBl+PQX3ky6YeaOtJszaGjfTHB+rLvJV3UqwiO/Wrrj9LPTB1gPC9d/w5gtQ6uW4M7LJEPCOy1hEhp/mxE4EaIJAaYGdLB/bOevNlnSPU5L072yVKlzFTYgJ6eUq+sP/te2O+IUwreJSGbF4voMWjMhdFsErdkgg4e2AD7Qv6tgc8xbDFKgnK3vr0AqlsViWMRTIGnIn21GzqQ+hOp4+esLBdQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB7236.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 09:45:28 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 09:45:27 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	Marta Rybczynska <rybczynska@gmail.com>, Steve Sakoman <steve@sakoman.com>,
	Ross Burton <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] cve-update-nvd2-native: add workaround for json5
 style list
Thread-Topic: [OE-core][PATCH] cve-update-nvd2-native: add workaround for
 json5 style list
Thread-Index: AQHbp6CaKw76zbcUFUGk++zQo9Uc1rOX8mmA
Date: Mon, 7 Apr 2025 09:45:27 +0000
Message-ID: 
 <AS1PR10MB5697B414A3E675C3F69476A5FDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250407093557.50424-1-peter.marko@siemens.com>
In-Reply-To: <20250407093557.50424-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=5ffafe40-4948-493d-bc17-126464f24c17;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-04-07T09:38:35Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB7236:EE_
x-ms-office365-filtering-correlation-id: 407c7a54-b16c-498f-f28c-08dd75b8ed8d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?pJPNId30O5IupqI7KR0k5atC/OwXdSzDXFE0cVAxS9+P4+7gTw2S6za2q0SY?=
 =?us-ascii?Q?rDGMlgyeMGMWi/BOqNzU0iI/IfPc8QPl0y49Qdp1xiXLvQWUeGsJhkABvoWu?=
 =?us-ascii?Q?MK9hYg+gbsHAJ0NDFtWlZzyZZJZQ1ToEq6pjE6PtLTND2vuoeITLqzJ/3tsb?=
 =?us-ascii?Q?G7fL0DxYDC8MHj8S7/6OMAI22rYUYQIYuC9SautA1xQdNNWargWot/7jNa64?=
 =?us-ascii?Q?Frv+VQqTM2ufjCrsW/U2no1apIeu1siVSiFR9iZo8AFmavgfHfzTUEt6KiOW?=
 =?us-ascii?Q?TEKP+dc35+uq43xVsdQPNYNNTIqxb/vHEi5AvmdvhfKa9/u8FPgSxUf1HjGV?=
 =?us-ascii?Q?/OzAXvqCIja0V550CaL2QjWgPWKYDnCbwUk4fBwTOFY9+jcfJHUmCl5/F6+j?=
 =?us-ascii?Q?RNLP7IF5p6z1dkcRCmNvIAkmPRLiK1MTa/mNo+3tVbzzC9jiaQkvgwKMP5R9?=
 =?us-ascii?Q?6yO5ogS6yr5b9VsL5Flt0oVicPoCjc1mPLn2zPGwOVL2ijn9PEazqkQwZB6/?=
 =?us-ascii?Q?lE7KJ3OjeybzwEJ3GAHtORQGs9dHs7x9EMxiYKila6cGAXFVpWDhLvZyodFZ?=
 =?us-ascii?Q?9Bpbk4PcBotvyqU+br2mRjXA5qYa/T0lM0mRGrFq5PVpPPHeR0Db+Es/T1hh?=
 =?us-ascii?Q?CYMuiX2LNXslergPn1wjWG9R0lPMmucJVAArX60UPuFiWz1M4AtdZpXW2r9z?=
 =?us-ascii?Q?OppqAU0DTWTXeLhD5RT4pSp79CQMVF9DxwH67o7hg4lHO3Gy9ekI9FhK3CPt?=
 =?us-ascii?Q?SF8ghIqMao31uFca2nz5ifpr4KPxGFGFbOzHxBf17bgCRTn+92jrHyDZVUau?=
 =?us-ascii?Q?mc5nix5zVfK0rovZASsTa5mR8AU4CJnzL5ZHZUkZgt1gA3LsV4VWbgguj9P7?=
 =?us-ascii?Q?zG6b1Dju97ilDc7/9t/VVx8xA2t4OdHmh3R2BPIMMJmvQQoBLImmaTIjLa9j?=
 =?us-ascii?Q?wABkMflpojTtczYUJSwiPeItGqWKZqF3EAmxiATd55jKd/I6AM+ExjiEod1E?=
 =?us-ascii?Q?6ATNYwHrHXs1jitLaqwOfTaXLAtjdq9LoEV4f70B9XEMjFk3kaqW/KkbyfdG?=
 =?us-ascii?Q?hZ4A6ZGMs1zKVoIGSiB/LEGqLmWi++GUY4bDqAhtDfbjLVLsLteM49qn58eQ?=
 =?us-ascii?Q?TaF1fsps+FOiHcANnoJ44+5iSOjtbbagKiI2OVdLWGaBZh1MMAyj6h85rhvT?=
 =?us-ascii?Q?IBSI+fxyoEQa9/DuASjI93gShafL70olEqwkUkxAwKCv3PkhGGGT017tqnPN?=
 =?us-ascii?Q?VIimlMWFZSIGfPVCKHqSfM+pLCUbn+NHtslPplbh49L89PD6ukdDBn6S35IA?=
 =?us-ascii?Q?YY2YW91UvU0R/UjmcO7VOQesPGNoYZrfm1Yne6UsrKFv71jsQVXo4em83iPq?=
 =?us-ascii?Q?0g8BOnbf3Uh+S8DuqBkcjQTs9hdD?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?l9tdoRBxc5AVDKpsK95wkD2gqg9zTusUbhkvgM4VzmChMWegCVhQ2BdtJ3BB?=
 =?us-ascii?Q?Me9KhGUUKA2CQqX9WXVvYMFfKEnfzEgPt5a8Q2lBZ6i9XXS7sfFuY8cCqFTq?=
 =?us-ascii?Q?0P6+k75MFQtEjFeChnZKimC63+vaxygXuIXaez0pIoSoljP7nNMH7bQXAzvv?=
 =?us-ascii?Q?vJoGQS83xv931/cUcs+jKnM5n3xbHt3kgkTQqY1GNxveMOWeACnIfHeg5rwO?=
 =?us-ascii?Q?PVzyJ1V5oVOsxjsiLECXN+pMqSC7KLLxvWb4BsPINetb1Ls4G9bz2vMfh/lm?=
 =?us-ascii?Q?XmeX21n1v61cMzoe6AKj5doPz2bE/LOZTOHaJMUeAN9N5Hgk+8g2FOdZluL0?=
 =?us-ascii?Q?TxFKH785rBM6purJNffxHjMxLZHetL9I0H72GLXmoT07tWxuDPpLaPxWrV5j?=
 =?us-ascii?Q?PQOwVvfk+Rvt+fDH/WwBFa3OMZG+nZxRO5wUQahsnCk9yF14btoUOif7yFzW?=
 =?us-ascii?Q?xLG3vYNiqtqeiXqzQAJVEmAtQYuBkYa3g7Bzv42z2bpd8YyjbziHpttoqrLF?=
 =?us-ascii?Q?1Sz8rSlzp3P5mRKz2QsiIqxASDeyyUMoUz1yPnwzTlwu3NmO3wrE2M8RcurA?=
 =?us-ascii?Q?OuNr/wC/Qi7XK0l9Lp+ajBbvBGcHPAMrhH7hYDD3kl/unYvCNt1pCfJmI7LI?=
 =?us-ascii?Q?pb7/m1XSJ5NQujNyuxjpJvkO3BPqcZyUYBxrVJeHTypXBM9ygMx4yOK2AwNA?=
 =?us-ascii?Q?SY+VLyDRCJgxNpEjg2dkSFnurw3motqIyssN/tbhk4VC+RUWvuA5XqaIWgDT?=
 =?us-ascii?Q?zaEwZ+BGrWKJGryTwDzWXgzPzqfMLX4oIHTmaTG4a5wjVGsXEfO0/C4m1Mp1?=
 =?us-ascii?Q?Pyq+JIisRBsxEaPApqJAGnloHH//nkuo4cN2ZCrD67zJO3ZwQ2+dp11JmDCi?=
 =?us-ascii?Q?CZGz02/TqB9/fGMqleoGO9lV6eXrhitBatOi2MqKTY9dLQzFST1VKBg6stFQ?=
 =?us-ascii?Q?wIZMLiYX4j8JMS6fiMHJ31Ng5gbTG/ERsjrKcco1ZvV+KG7KoPtz+2hTVRaB?=
 =?us-ascii?Q?CtC3IuqNM7QrgzD83UhAcXUpENJkqQIP9CcikmC5CDl/OVIAPgzGKsIDJBqh?=
 =?us-ascii?Q?AQQsniCA/3lUCuDjDmOObGZyZ2qNUu8879Mr0cF5cTdRWtCNIx8r4A5lX2pG?=
 =?us-ascii?Q?my6cv2WZgDPCKVGDp9jPxAttZKUmQwXxP5KQRsolw1g0c8G5A+lOMsgTHvnn?=
 =?us-ascii?Q?Z69vOzSOQr5BpkEc0ruaB5DB8C3hx0Ccg+MUNmeQ71lQCj0bUONL1W3wxnON?=
 =?us-ascii?Q?NI0u9qUcU0Mkk3mB0Qg8M8okUOWU0jvpu9g8SEZIMfjVChaWF8xtPGzvcbBk?=
 =?us-ascii?Q?NuKR62/ijjqqWpT/Y5UDVlQxol2ZyPFTBNmqh4ZuBIojORgjnQNxR9MWzBkW?=
 =?us-ascii?Q?6VHXZQ+qaU+fElqe+7fLqV5zHh4cqLcSy8n5LhVa0dhlyDPII82ocoRRrjoi?=
 =?us-ascii?Q?6Tb8NknkO7UJyV43J+KhPnIdrAc/8GzM5E1pidkNkIx7zw7963gfkeXVF3zP?=
 =?us-ascii?Q?9oFqlobJPJvzWMb+HQ/V/W0s9d3iHas30D2DUKHvZoWHwXEAmYPpVq43dTjX?=
 =?us-ascii?Q?4/XYqiDhqMLvwIzLOdZfZcYjTAeoXpMhDeYcGFi1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 407c7a54-b16c-498f-f28c-08dd75b8ed8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 09:45:27.6063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qh/SR/onk2z3qhOC0JabyyAF4ynD5h/5oDpaqPtghQBo8M+5WtOtCjTKyCKQRZ+O+sewjtci9zJIGFrGfDf6xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7236
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214428

Dear community,

It looks like NVD introduces new bug in their API 2.0 responses every week.
(e.g. last week https://git.openembedded.org/openembedded-core/commit/?id=
=3D8ce06538c9cde0f09909a5a2e61ec10b0d35df49)

I know that this is an ugly patch, but I propose it anyway.
We probably don't want to invest large effort in redesigning to json5 witho=
ut official statement from NVD.

For master this is a minor issue as it has already switched to FKIE as the =
default source.
But scarthgap/kirkstone this is currently the only source for cve-check fea=
ture.
Shall we consider backporting the FKIE to LTS branches?
And meanwhile backport this patch so that cve-check works again?

Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Monday, April 7, 2025 11:36
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][PATCH] cve-update-nvd2-native: add workaround for json=
5
> style list
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> NVD responses changed to an invalid json between:
> * April 5, 2025 at 3:03:44 AM GMT+2
> * April 5, 2025 at 4:19:48 AM GMT+2
>=20
> The last response is since then in format
> {
>   "resultsPerPage": 625,
>   "startIndex": 288000,
>   "totalResults": 288625,
>   "format": "NVD_CVE",
>   "version": "2.0",
>   "timestamp": "2025-04-07T07:17:17.534",
>   "vulnerabilities": [
>     {...},
>     ...
>     {...},
>   ]
> }
>=20
> Json does not allow trailing , in responses, that is json5 format.
> So cve-update-nvd2-native do_Fetch task fails with log backtrace ending:
>=20
> ...
> File: '/builds/ccp/meta-siemens/projects/ccp/../../poky/meta/recipes-core=
/meta/cve-
> update-nvd2-native.bb', lineno: 234, function: update_db_file
>      0230:            if raw_data is None:
>      0231:                # We haven't managed to download data
>      0232:                return False
>      0233:
>  *** 0234:            data =3D json.loads(raw_data)
>      0235:
>      0236:            index =3D data["startIndex"]
>      0237:            total =3D data["totalResults"]
>      0238:            per_page =3D data["resultsPerPage"]
> ...
> File: '/usr/lib/python3.11/json/decoder.py', lineno: 355, function: raw_d=
ecode
>      0351:        """
>      0352:        try:
>      0353:            obj, end =3D self.scan_once(s, idx)
>      0354:        except StopIteration as err:
>  *** 0355:            raise JSONDecodeError("Expecting value", s, err.val=
ue) from
> None
>      0356:        return obj, end
> Exception: json.decoder.JSONDecodeError: Expecting value: line 1 column
> 1442633 (char 1442632)
> ...
>=20
> There was no announcement about json format of API v2.0 by nvd.
> Also this happens only if whole database is queried (database update is
> fine, even when multiple pages as queried).
> And lastly it's only the cve list, all other lists inside are fine.
> So this looks like a bug in NVD 2.0 introduced with some update.
>=20
> Patch this with simple character deletion for now and let's monitor the
> situation and possibly switch to json5 in the future.
> Note that there is no native json5 support in python, we'd have to use
> one of external libraries for it.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-
> core/meta/cve-update-nvd2-native.bb
> index b9c18bf6b6..32a14a932b 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -229,6 +229,11 @@ def update_db_file(db_tmp_file, d, database_time):
>                  # We haven't managed to download data
>                  return False
>=20
> +            # hack for json5 style responses
> +            if raw_data[-3:] =3D=3D ',]}':
> +                bb.note("Removing trailing ',' from nvd response")
> +                raw_data =3D raw_data[:-3] + ']}'
> +
>              data =3D json.loads(raw_data)
>=20
>              index =3D data["startIndex"]

