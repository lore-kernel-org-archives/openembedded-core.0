Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.41])
 by mx.groups.io with SMTP id smtpd.web10.15116.1631122043908460261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 10:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=r9AFPzAR;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.92.41, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPzYME2bg6r+feFIC2+aIePhKNkner2Bgx44uxI+zVG1cNSu4Mxc6i30B1y7RYyqSRLAq0hUMcg3Ci5ECGApQ7h6GVEGKW9PkH2tCmXmkpdpkSjoHczg8L61C+hRwVPunDr67cQoNwZWz43HbTzxbJp603DNK0ajZfgM78Yy6yR7CRaH7RaU9sFBpdqtJvDQfLz4AX2EfoSAcPR5ZZ+/1Clevs/Kn3BQ5hakfDRZyssnXmVcpIhYbKkHkVNrOOKfXl0EPLXsVb/RNx6J3hERomKizFGcQ6cCAgb2saSIpJEIZpNhFHQOb1UMZxkudPKnrfQJjWUisiYxwH29uyMl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=R0SWVFK6LlessiJKVkItyTu9iWPwNtFG4BBFjHuoJEM=;
 b=WrQhfxqKe/SHIReM+xudfBCKT5CHwZamhmES+9aeMfmftKbq1NAxEclnO67sbXZChF+Yse/YVBbGIWCNQpZvgqP4YHoB/MhCVtVU8VWEUmSKBoTOcW4nsNjuhzVtFzf337Cr6Zbedv3dfjVf1DkbnIaO9GlL3oXEHGbIns06GD4wHIpdlDAeCo9mn65DLSGwmmov92sTU3C5IzOs+yHMTOq9g863q3Ip+6OV1XxD7o6+mnfSYAr3F5AkWhQMTApY2VvAfM20PpVLM8OLNgzYZs9kvilBJqgcXUa0rKcq9A4TmpHVBwLw/R+lcrsldm9rrSV3YBcvOtACYGHuBGM+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0SWVFK6LlessiJKVkItyTu9iWPwNtFG4BBFjHuoJEM=;
 b=r9AFPzARrh67N2E0oHH5L73t7Rs/f6cLMVE7sy8QDL9CqTbZ12VGCb8QJTv/LZkatFowuUHA+9ovjh0yybx6e4wNGMm6PSb+pdYTkL2ZokZb3kx/JWZ6bqSXp5ctXYnw83P8dtqp/IrozKuGeCg7nhihynxB5UbZpBm6NLDaL9C2c2Sy2X3hodnKB8+wUbFroDNOaBlK+q/FqD7Vw8uRy9harHEEc5GDQ6LkwgdD5kd3sbQvLvZ6PDTr1nOukI6PopFD9zNuJqfwdB95HyhCR73KJryFnKIZhndWg4UnaT9Jdc6+qkb4nn6DdcfqrKPut4j3cEd8joREaoR6D4COog==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 DM4PR12MB5213.namprd12.prod.outlook.com (2603:10b6:5:394::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Wed, 8 Sep 2021 17:27:22 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::90a6:948:7427:ff12]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::90a6:948:7427:ff12%9]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 17:27:22 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Joshua Watt <JPEWhacker@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [hardknott][PATCH] bitbake: server: Fix early parsing errors preventing zombie bitbake
Thread-Topic: [OE-core] [hardknott][PATCH] bitbake: server: Fix early parsing
 errors preventing zombie bitbake
Thread-Index: AQHXnbcbeGibdJcGcUmBl4RSKZFfAauacc6w
Date: Wed, 8 Sep 2021 17:27:22 +0000
Message-ID: 
 <DM8PR12MB543089FBA26942E145A386568BD49@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <16A0207AC2905018.25648@lists.openembedded.org>
In-Reply-To: <16A0207AC2905018.25648@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 633effbd-e657-47ad-0b4d-08d972edeb11
x-ms-traffictypediagnostic: DM4PR12MB5213:
x-microsoft-antispam-prvs: 
 <DM4PR12MB52132E941A41D700539880CE8BD49@DM4PR12MB5213.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 G2mNsx+cFaFE4444IeZA5RfftQEEREVq2ThX1PE3DdTtUD1NoxPkdeoGn5m67E9vEng8R/4NQtGy96gn2nNHRYrQ8Ugfj5+7gwn2uXCfLh009fsgIMQddOYRW9Ty5sXCTsgbrZlvkHVLYx4wATOw9V9xzLKjihqRmVdBIqsTwI8xidiIdX0YuFG5wLDGdmk+K15s2oDvk6EkjL6Bt6GlSpE8BEu2dJ85xCyug0oNXLq3tHvGOKLLNlRA8XlYO4RnBtnGYiekEKaedltpD8fqhHj3dQlQh7iWdoHuD7t3Wl9l1AR9fCIge7fJ55Q/KtBsSO/vF5KDlUR9Tyx52PAjifctcYWxfYi9QUqTea45jc1USv41X9Ad9OAQZYG3+pflFeK5ZbeUFQsNm+ZgCI6uGBTLRLtqJlt18dCYj1gnY05MtBP7wxwicnWywqyYS7aZUOJeuq+VldT+8RQZBaQBQdS7D9rXfbewO0iSKBJiXRKdtfm+UOx40q05ySuQQIRgkOR36/sh645ELd8rfMG9TKIiusPFYvi3EAyjy1qGYcRgIgVlWBuQMEZPBtVGUh/H7Hvgf+m/p3OnxhRFjyNwODtmYg09fTzBgffkiBDHvPUZjWfeeDOq5VFuKhuSVkcaLXTcX+YAAOh5Xzt7fFU+U05y5BkkOzfj1puO8AvtdBbdmKwTQg5Cc+aUxg2feEKGTI4/Jd/CkSe0969NK00kQPki3tQ5aJ1VU20DGLSTPjOszhVC3fd25hhBomZA0uFd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(29502001)(55016002)(2906002)(54906003)(8936002)(316002)(508600001)(6506007)(4326008)(4744005)(38070700005)(86362001)(9686003)(7696005)(66476007)(52536014)(66446008)(5660300002)(33656002)(66946007)(64756008)(66556008)(71200400001)(26005)(8676002)(6916009)(186003)(83380400001)(38100700002)(76116006)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RxJi8/vvTRarfb8cZfXotQMzHuONaJQ86yY+5AzmcNRmz3JXfIyBsLhIhnPi?=
 =?us-ascii?Q?aztMfeXjQz87zeei1eYpkoVtXAHlUPbHA1/V3YpmODcL8H5zGHrQDY9svXqS?=
 =?us-ascii?Q?MJUrzzjJWMa6CJKYnXdj/S0Qb84iRarMsOjSt3NcuhaqUzEYxATgTrBIxIc7?=
 =?us-ascii?Q?bPwq5c7w59eO3OS/u2knBTZQ77bxBGeDBNAT3lQOP/R9z29ZCuMp0P+HY+yB?=
 =?us-ascii?Q?oeg0A5BXab8AVOBofEmMI++RqFzxXDWIfS0Qpd4l09fxuK68ld9ZSmSRnbHT?=
 =?us-ascii?Q?zDgB8J22iZJ9O/oPyXKQ1qnVDyHw7fo6+k47EuUGkGA+tsDDQ18ZAZNkDLLo?=
 =?us-ascii?Q?5qdtKO8iIjkx3bq8NJ20jB3o+j3sJwgRmHelXRZUY0ODcgSKRSRDvKB3hRlF?=
 =?us-ascii?Q?dG7eB6rIcidZ3uL00x7BgCMIAdAqsNvlsJx7wSWu6oXiRheKH7CkZQUWhbuZ?=
 =?us-ascii?Q?nabUlPPyikJMtUuUgv3cioTW/7plv2WYjbTQFnNF9OVgD/C9FVaJ+d4GPA+K?=
 =?us-ascii?Q?JTmAcROIrCBJjtTmECDk3kBwVNIZLPUV+EvJebmPYLy2KAu3nlIoc42roami?=
 =?us-ascii?Q?Kfgf0IBpxZfXlKhrSfhSjb67MhffcPOPkBOmjJr/NTqhe8tw3vt257+rrDBO?=
 =?us-ascii?Q?jXPIXn3MJHj+CjM6fgtgc+1ilxhRYYLU0ANlxDkKAmL520yCWhwwHTY7jQ7e?=
 =?us-ascii?Q?jSsMaE1t2+/xJ+hxxs1uf9UJVllJHZmvaaMoNgnF5Zi1DNpXzno/ZNRE0QCg?=
 =?us-ascii?Q?/1MKa4w2ZCHmqK8FGBsYCqe7oLBgfNxTqVnpYNPWc0l9wniTTvLfd9H9K/Fq?=
 =?us-ascii?Q?fSAugjzspi6b29iFGnbn7LFshq+6f0Lr5rG/erQrgxR8Wmuw0W8a4VD2ReyN?=
 =?us-ascii?Q?8Ns9hifqL/digMoDpD+OR3GxFm2T6MayoXAw54OmR+1ZCyV95in2gqhLy1sN?=
 =?us-ascii?Q?GFeAD7kt/G3TxF7boSMJeTdvsQmsrpmGD40UBzzO5chnJ7vJp59w1Ho1RD24?=
 =?us-ascii?Q?2pNSsPa2V0LE/iyNY09ipImJvLXkx4fv5OS+/BSsUeTCvccV2fIzxbxSMfmO?=
 =?us-ascii?Q?KSt7KOBqQ6m9TZtmDhRHUnNi62F5MAaNO0bfHQMqtbWrTGC4ST0dWh8ZAYK4?=
 =?us-ascii?Q?VSH20Nqc5m8SsoMHefdOxbSGnd93SrZY271TSKkQm6giX4q2dB5XszAqk4hr?=
 =?us-ascii?Q?1fZkoWNUoXCL0HPrHCXI7paQKMgWyypgIzj5jEtGuuGgSCRWcWxiiNC+MA6Z?=
 =?us-ascii?Q?G9YAXVHx1rVIH9A6iKP1ZPR7RJOucY6cnTI8/p3mtj7MrPjcZYN684n9r5wa?=
 =?us-ascii?Q?reim+Kq8aGhq5pEA9CdId5Ln?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633effbd-e657-47ad-0b4d-08d972edeb11
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 17:27:22.5447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +qux2lGaGRW/8eiuL6xdT0KKRWiBofUy/AvrPNcXnwPvAvQVGLKQ3oWuG48CC9pBxSsekzPZuL9LfUMux1pqkRjvjecSDpyKCWBiCfrMZJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5213
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

> If the client process never sends cooker data, the server timeout will be=
 0.0,
> not None. This will prevent the server from exiting, as it is waiting for=
 a new
> client. In particular, the client will disconnect with a bad "INHERIT" li=
ne, such
> as:
>=20
>     INHERIT +=3D "this-class-does-not-exist"
>=20
> Instead of checking explicitly for None, check for a false value, which m=
eans
> either 0.0 or None.
>=20
> (Bitbake rev: 7668057f8565655611de23d143432d1c05dae3ce)
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 881005ec405f26b8f7f4b41505d69579e83b69c4)

Was this the correct for me to request application of this patch to hardkno=
tt branch? I've never tried to submit a patch to something other than maste=
r.

No rush obviously, just wanted to check that I was doing it right.

Thanks,
Chris=20
