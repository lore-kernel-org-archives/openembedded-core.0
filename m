Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D1EC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 11:18:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.89])
 by mx.groups.io with SMTP id smtpd.web11.11787.1707995932802861828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 03:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=J0Zxvst9;
 spf=pass (domain: axis.com, ip: 40.107.21.89, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAcJSWs4mmCtFhRNnNSDxjvNVmYYVEohVEj799UCqpaeALRAJaSBO6O3WQJz6l6CSveqT6CCDkkCegTh48KdUgARJCt7E/+++FWgGey8VERtjAvjcmfrOudtABGDVIaWCesS/4KbijZX1dZ++HO8tduJkIK+xiA5unTS7GlfJBqHyOajAwop6s+psBdsGWFHRQsanmDaD4rNefe0NVknKV7wsTYzu8Uk2qOrhdcu6F0VJXKBRu9n21iVF2AyCCXC0qGgpsCW9AaFdAlgG1pqQYWcf+DGw7LeOHIcsHSUpv2syfFepP9U4MxtKSDus56xZMxKE8O5hkZBI7Y0rFA0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqSevvBncPs+SiIPZA0OL3VPpxS2MUh9kvgzWv1MA3U=;
 b=ko6zXpd4UHfex40ZGiPsFYa0mCfLnloB0uCsHTFpZOwsodRmfNzE8buK6n4045HQ8bJf8JFhcvmaOcOiB9ZkfFpd1HkdsDdQ1yXMv9117CrdhrWXABzv2bIxReQFS/4aeD5+d+k8iKrCrsMc+ru/9JupzpjFHXxg9/lJ+3XCojImxoEitPmN/MfBnUxdNg8ByQTPf1CqsxbxIQ3H/J4IQ0IybnVXqk2A6qtu3kjff6BZODYbgUSbd62oKQI675Q/QsoQsYrRZ48XGa8brdINxemKdEnIy8mXJJggxszY+gXlgdeZmgYwnDsyYoz1RMgMoPhjxkQuBgZW+ANd57PZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqSevvBncPs+SiIPZA0OL3VPpxS2MUh9kvgzWv1MA3U=;
 b=J0Zxvst9+wYhiZj0qm8gQLOJddVNpT9EoYcJyUcxVe0msLM4QgaECIXu9FUUc6pjF0HiUuIJ626z2evKvb9CO3je96EkD3NtQQReuv8fj7UTtE4Pryl1rLs1JuufokBQID9xohk7zOs74cu5XSQWfINZMnBRwLx8RUQzNGaTC18=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DBAPR02MB6343.eurprd02.prod.outlook.com (2603:10a6:10:19d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 11:18:49 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7%7]) with mapi id 15.20.7292.029; Thu, 15 Feb 2024
 11:18:49 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"belouargamohamed@gmail.com" <belouargamohamed@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"f.lahoudere@technologyandstrategy.com"
	<f.lahoudere@technologyandstrategy.com>, BELOUARGA Mohamed
	<m.belouarga@technologyandstrategy.com>
Subject: RE: [OE-core] [PATCH 1/2] create-spdx-2.2: Correct the default value
 of SPDX_NAMESPACE_PREFIX
Thread-Topic: [OE-core] [PATCH 1/2] create-spdx-2.2: Correct the default value
 of SPDX_NAMESPACE_PREFIX
Thread-Index: AQHaX4+uJiajqXa0tkChYVM9devvPrELIviAgAAfBEA=
Date: Thu, 15 Feb 2024 11:18:30 +0000
Message-ID: 
 <DB5PR02MB10213369DB897E82D681DA4E8EF4D2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240214214905.149929-1-m.belouarga@technologyandstrategy.com>
 <202402150926250c40134a@mail.local>
In-Reply-To: <202402150926250c40134a@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DBAPR02MB6343:EE_
x-ms-office365-filtering-correlation-id: f0fee6d7-4bc9-49a9-c4b7-08dc2e17d6ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QY5CwYf1PhXmOSf5WfNQGb0Vny2sTNyWpOqHCywuKrd/QVia6ytAfQKzw1yEAjpXpeconHbiamqoS2CnUO/+zMq4zxhHZalaa59d7wPeGA5BSWCoPVLS5mG6M9vDgt/1sitV8URfHWxoGRrWM1bGJa//kTlf466O32ReXDxQ8FwPmvHtrUBp0QLSjJwjtI2SuFiRahbXl/0L0OoWMKTkxef7iDBlbDrRuSjS9hqzd3uC/391ohuk0/wzW76FWZh0W881u9FLUJeTK0crkMBrmQtDHtzb7h1HU4KNPSl3X7GEs/sKEpAkgKkbmFUBDCxorti+k9yBQJtnIz2DsYdxz8nZI6R9Jj9H09Ub0png+uKclDmQEeJrr2jonmdRTJEYwsIc0RFOwWLrANyY2y7EC69yie/aDjPRQg62A8LwskrADUvf7Razs35rrfaz/CC3VrwFLdXEctoVm3NuAToDje1fSfOmgyfBMarXvemcjC1PCw+JIbj44VQC8WlfqHVnjbryHVHQjntsjSAT6JJEu5eHXbLa9IL7d67KDICmnyI2TreGbQBSIK2Oc8Qs+XlasAEQaPRHOgNNcwdIjPOr6e2QNhsM57fJya1OCMxCGHQlWaW8DiMo+heAhLnA0CQn
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(136003)(366004)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(44832011)(2906002)(86362001)(6506007)(54906003)(9686003)(7696005)(316002)(110136005)(53546011)(6666004)(71200400001)(38070700009)(41300700001)(26005)(4744005)(478600001)(33656002)(8936002)(66556008)(66446008)(64756008)(66946007)(8676002)(66476007)(4326008)(76116006)(52536014)(5660300002)(83380400001)(55016003)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?u4afRmCSJm1t+Nh8sMuFS28drCf8GIU4UevMq4CjuwZk6twpoUrYwt58Ff9L?=
 =?us-ascii?Q?16wwhaymxHSB3W6sYkAZQX5/D58ats6vG7WpMK+Rg8SQaUa1uEmcVCxPCykX?=
 =?us-ascii?Q?HxLs4nlcMQQQ1J3enDHKCdtpwBG2HYMFYO7VkVhvIvkJakXM+cZE0u+3v7Af?=
 =?us-ascii?Q?cH1FriAehglaa1ehOI6iZyYAFOJsCdzw1x2r20ld/ErnPgAAwDwnNuP2l+yE?=
 =?us-ascii?Q?+DBEwy8MB2FAXnyf8pBQzbHpph52XDrrDo9QoXMqL3tiMbXzRDZRSYbCUbLE?=
 =?us-ascii?Q?SwVk2CRaeNEvw//RK2o/g0ubyUyCYAhDhNysYJOkvWeCRQ1vLmbWqv8kQDfn?=
 =?us-ascii?Q?rkXXbaQGSzCO3tFuqbWi0oCzt02Uhgo5e7AehhsoN3CDkYNv5lZxlDBpLRid?=
 =?us-ascii?Q?2XCbMb/WhHOIZoLp+V69kTZTR3O75Tu8yjKBdcABntTz2E7go7xJ/anqfSbU?=
 =?us-ascii?Q?WhrPbikc72bUjAXs9DibZOMCwIHZ3rHPr9YVVe0bt2k8EWAwY0pIet8XRsnU?=
 =?us-ascii?Q?ldT37jgA9ySkD+h2Tz/uklbwa8s/weLCS3wzxF2lRKvKTVZoihxq0LNsW23U?=
 =?us-ascii?Q?2fv9r5MZUp7TBk2CLoke0BqjAacSHbMMFE+9ksPn4UKeQijyDscsi4gqOvwe?=
 =?us-ascii?Q?x4uJqycN3M2xlHMbKKzJEIVO9RUFaaVCtWqUuePpVeURf6NLrim4m4LrwTpP?=
 =?us-ascii?Q?oezfASClbCPRUIjcL1oS7SxIbtVizFUXBkD1lF3FbeY3wcdY0Ufow3O37hZl?=
 =?us-ascii?Q?X4jYus8TKOHYj462QVPgnB7//4EQnb7zmRc9G34GkraiE9J56xtwqd0JKL8J?=
 =?us-ascii?Q?+2fL6W7bFAoassunrdx9JwqCxCiRRUu9Cq6SzAGJtR6o/JFUnU/TjCMRlHxA?=
 =?us-ascii?Q?l1KIueasZNf5UmQQ51jCs7cSsHSgj5ioq1eXDLu6AhTdT/cBOS030VPfLZqR?=
 =?us-ascii?Q?eWqF3mwQ8kym2mkV7kgVOoaRSm4C6ZjTezMyrR1KUnfHFVe+CYcGSa+52zIv?=
 =?us-ascii?Q?6AJJmxLHIeCGfwcqdnLU2y9WHd76d4PSVP5WzVbx8U8SWg7FlYOEOWNic+zy?=
 =?us-ascii?Q?lfL2WVYKWR2FjQbbez1OUN8o7TG2oSXSMDptHmXnwAkVU05YHrDPm534KM63?=
 =?us-ascii?Q?wdNkZsByUOo7OVwckK35M6VFj0ot/TjP1GSlgs/2evPcvTkNuqiNv9OdGTdv?=
 =?us-ascii?Q?sJ04HUkFm/P+eiuTdZNVIYfPLt4SHhi+RWBVCET28jnO1vZzT2jE196eJ+cF?=
 =?us-ascii?Q?b2VMDGIaMndzMCe1BEgFdOnHqXJdb9goVy0QKJMG0tQ1AinbQFrTXldCSBPx?=
 =?us-ascii?Q?73ITchv87EMnktVT7MEoBlu7gmJCeo7QN1aAvWc1QqCXWI1X+pNhp6rkpUVX?=
 =?us-ascii?Q?luQCO4hNgrOqqM1LRIopSvskd8TkUrld5kUEcGPSbngg5LeTwOPKsV5ofpjm?=
 =?us-ascii?Q?TPae2DhbUhJ1V72s3bLNvBoXFdyEIR1enZhasLeQMZO7fKF1MKWnRJUfvEqt?=
 =?us-ascii?Q?V7LlHvza+JYQkkPSiWObxCke79icU5FZzMMGoSmZUdQcje/+ydm2ehAZHuZj?=
 =?us-ascii?Q?JKKwNHRxNlTvYWO9bbE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fee6d7-4bc9-49a9-c4b7-08dc2e17d6ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 11:18:30.4161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: onWkyMODK/g88GKHDkESydL3tVE650OHsUk5FNhIjWVcWD/OXNQfpSznbwlVbeLb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6343
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 11:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195509

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexandre Belloni via
> lists.openembedded.org
> Sent: den 15 februari 2024 10:26
> To: belouargamohamed@gmail.com
> Cc: openembedded-core@lists.openembedded.org;
> f.lahoudere@technologyandstrategy.com; BELOUARGA Mohamed
> <m.belouarga@technologyandstrategy.com>
> Subject: Re: [OE-core] [PATCH 1/2] create-spdx-2.2: Correct the default
> value of SPDX_NAMESPACE_PREFIX
>=20
> Hello,
>=20
> This is 1/2, but I couldn't find a 2/2.

The 2/2 patch was sent to docs@lists.yoctoproject.org.

//Peter


