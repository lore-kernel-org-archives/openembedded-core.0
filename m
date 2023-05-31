Return-Path: <aplanas@suse.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B6DC7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 04:15:10 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.45])
 by mx.groups.io with SMTP id smtpd.web10.6195.1685506506384434321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 21:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@suse.com header.s=selector1 header.b=UGvqZzgX;
 spf=pass (domain: suse.com, ip: 40.107.104.45, mailfrom: aplanas@suse.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvS91byQNiXAwGZLb9VUOLRrM56DuPlZX9O3hjpx8+qqvHkR8eF0PYf+RzvkOMIceP2Px+bluCKpPsvzlg1/UshbxPa812VPPSnVOTIJnN+GWIXSXd+xSFDAUVgFMLLFGRvIO+8Piyg71s6JlQqfcnFRYMbHzgOD7RetGrbnU+Eb7xFBIiqcJHLyi8b7MSr/KEJvdEEUuMYrqyFnsGsMObKG9mUT8pQ7KISrwqYTKIQAzD3L6bOvCu0VH4u/YYHxiB9QJNy0xuCCydyQI6fPYgORwFWK6HjGAeeDNKRRUL0l9BFe4hVr4ycX0SrqbCV1sUlj/jskbqIp2chkP25I3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AuH0nBfN110gWmQZsAF4iOmUoAXgTDvMFZb8HxzbKA=;
 b=WCy+lia0YL4Z82LPTCH9Xb01jp6e27aOiEP6kBZPeJw8IQNGfO8tbdpbXZjzbUjewscbraC3cByZbQUPOzC6DLTAMgzy2WLNGxmTQ3enIeBqCJfZcitkQErS2L/oK22L4QVjD9Knb5df4QgpYrvoVIyn8a38B3g7455uC6UdiJSYZ0PqfWBrQYySa5jtaR9IcqciMoT8RvoKqr2SF/pYD243sm10CPu0C0qIp57kPOKr+/1BqT/1uqW/osUo/g3xIKV9Ck+XUwMtfFUI5Vs89jJ8e1yFTQFNDoMdYs3YZS44y9O2Wh2JemB7HbnS2Z7JXqlLPwx2TCkyfTdFRg7m0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AuH0nBfN110gWmQZsAF4iOmUoAXgTDvMFZb8HxzbKA=;
 b=UGvqZzgXs9yxhwV/4eX9PkfDfY+BCw/KXjaalGIS3R6+ikXKDh+uvyhGCPhwseZQOi3sj9u8yTnEOHNuyZVEJy41U1wPwM6Sep6Sz7ikLvka5h8mdlqtU9SCq2xCUVU3GfxuUZY1/lq+pdiy9NYef7/B/NngHkpajtt8PwMaKg27d4Cp06bpTpbdryecb2yKoSpvw9t37pGoOAgoGl3VVUfDMFyxdhTH7GEzx1Td78WjtuYEnThnICsjePbnwpe5xbUUQn8H2pD9ly5AAJsaWbWL6rU2shy4f4ArKjLAl/ZYz70i6KvVEO7tQjnrrxaykKcs8WK8ZQl4+28ydhQs4w==
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
 AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 04:15:02 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::abfb:9639:51fc:88ac]) by DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::abfb:9639:51fc:88ac%6]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 04:15:02 +0000
From: Alberto Planas Dominguez <aplanas@suse.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rpm2cpio.sh: update to the last 4.x version
Thread-Topic: [OE-core] [PATCH] rpm2cpio.sh: update to the last 4.x version
Thread-Index: AQHZkypdftusojIxYkuQ7jxLryNhPq9zxdAE
Date: Wed, 31 May 2023 04:15:02 +0000
Message-ID: 
 <DB7PR04MB4666DA90C9F510A3ECD9744BC5489@DB7PR04MB4666.eurprd04.prod.outlook.com>
References: <20230526140640.30724-1-aplanas@suse.com>
 <CAMKF1soCro49AtknXyBRPind0-i2vom7KEvKXdoY73mz7FFFtw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soCro49AtknXyBRPind0-i2vom7KEvKXdoY73mz7FFFtw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4666:EE_|AS8PR04MB8676:EE_
x-ms-office365-filtering-correlation-id: 97cd7cff-e715-45a0-2a09-08db618d9b10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 F85UKO0qLhNxQ3GcyLV1s+AXgAofRh0ZdD/6PHKmQ2UeU2NPyVCCiwO0ddTE2d7VbjCfpDVD+1PfyF51aK4kIKGUuMJ/aGbeIsb5zNoZOLcgeVIyqOlgvRTIwUlUG1X7TtpXMEbHcVvgdmIYW4iauv5th26iSy99jb0KnmUQokHwflrGXq0ixaCnMM3FD2LzgXM++pDivprRp1gehvpxgKHHj3CHrlVRO32PTUViDGx0hzk7zoDdl/rlr1UJuW/2vKHHmJ43n8Cydj2/+G2fg2Y1Px8TtmtDawbdA4YFLMAOwlbEJCQlWDkXhcOCrxEhw1uslSwJQn5pdxV4bo91jFm6jaX582RJf1hEnFtJtpSx7dIAZ3syHU9H6BZPe1fLcFb8dtoZ7nEAMGIvOxUf2T7i+0Lg6sFP5b/gWahXEmR/EvyWwF+6eARDT40hH9UCEr4TLnqgUhNf9aSjTLkA/oHWis8Y5IEeFv0lxV1vbEaSYUM+fCjXGllIJms3mxHh30OYVPH6u813BXnArzPBFg4Uhw2LBNKQOp4xchifvhbWiZyGrvDG1ZiZpZr6zWoVskyuQittrJrtsAT95RjX1PHut7KhGUAvJogjwiYRP6g=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4666.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199021)(966005)(316002)(7696005)(41300700001)(83380400001)(38070700005)(86362001)(186003)(33656002)(15650500001)(9686003)(6506007)(26005)(2906002)(4744005)(122000001)(38100700002)(55016003)(8936002)(8676002)(52536014)(5660300002)(4326008)(6916009)(66476007)(66446008)(66946007)(66556008)(64756008)(478600001)(91956017)(76116006)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?mSC+oDHEXEojr7b3/Vnd+L1bLLYurv8mb6IPDp8+xUw299W2NZXZgSfdgN?=
 =?iso-8859-1?Q?xqOAlA6+5bRIT29iwVvIW9lm/McOfDpEnoAS3cjOEBUxToEwOAQPL7rH3T?=
 =?iso-8859-1?Q?ruzYf/PR90qmcQblp57/FV8Uylgb1TEo9WRZ690CY5gkICzhe022SXTf/f?=
 =?iso-8859-1?Q?te0g3j0x2kh3fNOjkQ/YyBSGG2dT3HhICSBha8yVFZ3MKDREc9P+kUBBuk?=
 =?iso-8859-1?Q?gDJyqiykF+tbUG6hFdBHlIOZ84J6xOqXso4ePrkqDv0a45aczCJS+qKlNo?=
 =?iso-8859-1?Q?fFbGnpmiQDUpuzC+/eGh1YXNddTlvvZXLzL08GL8IBOERSLP/V8oifuNPw?=
 =?iso-8859-1?Q?tA8vDxjlmP3+u8x/c5e8W8DtxFrrkdy1CF+Khvf5DeFBtQvFJABBsCo9dG?=
 =?iso-8859-1?Q?EiRlwjF3b5Iy/4WAekO7HfpPQbZ3vnUhyl28JH3f/cofU0uJqsEKP8uLu1?=
 =?iso-8859-1?Q?6+DWVCOTTXntgwIWmLT5oqb51XdseAieKSHbPg0bdIXinYAycVhwYOGBrX?=
 =?iso-8859-1?Q?u2Fl1y2B5YyqZdSCLiHVimWnB4vK0r5op5kGeDjrIQ3y5z6dNm7w90LZjW?=
 =?iso-8859-1?Q?H9WNRxveGir20IBUSj5mY/Kl5w6OcgTd/N4As5DUT+q7vThR1nRF3+LgTB?=
 =?iso-8859-1?Q?9OnFW57Li5kIj+mtwIYHp+ygeMFGA5zGS/VpkKdqoG80rRZ2zbsxnit67f?=
 =?iso-8859-1?Q?SkWdG5O0q1abe74rV4QWGkrydEykwIJ7iqnNj6vd7U0pOt6/pdFQsBqdgB?=
 =?iso-8859-1?Q?OQvMz4HFT69XRafKo2a55N4nmQ1PSi98TzAwOoV1UTGhWPGztdzZh8bY3F?=
 =?iso-8859-1?Q?wrgtWdSAxfD1Drx2ckP/lFKGD57czI7QlbC+RjCwZcAgBUcvmB/aFb5T0p?=
 =?iso-8859-1?Q?aiFTEHUC3Issw4CgApC2zArrRadxSoLZUSs/m7qUxvU6mTb8yuIK0erkpo?=
 =?iso-8859-1?Q?yGxYcHXxS7RL8emfX5LZjAIq9QOfJUXc8z3QsiuNRLSuRMK3StCosHK42X?=
 =?iso-8859-1?Q?Idq7JzjFBs9BTat7hKZQubUp1IRFVp80PqWUrXFlfAAP3WwB5oHdVCP6KA?=
 =?iso-8859-1?Q?/G4+sJAicSc8c9c51cQ1NmbQK7piqWkRyIBa8JmiZRF+7ICPBujBcZPJBo?=
 =?iso-8859-1?Q?Vs4n8Ot3MPRdXHkjTamro3fXRWcWudg7j+g270gf4151tyxfsQ5MYdRQ2N?=
 =?iso-8859-1?Q?ZSfQbIN4ivFJ/ycbfwxPXXTmrt1EeqQTOsFMmAWPk58NvIMkM4pfp5l4gK?=
 =?iso-8859-1?Q?hv1wDVdUZUgXTInGd/0cBf3l6YvQRK6aeHxVkFnzC2g0VI39W+VaGCPD2c?=
 =?iso-8859-1?Q?0uiEIXK/5wGUusJyrRsKqnALQ1/xGbhnmh3dPP8PjpKVAszlZGFbaS3qPx?=
 =?iso-8859-1?Q?f2vpikKuqcQNy4o6Hq3vkkdqnV6I5tF0TOiRIgu5TA95hypxP9d4l76fvA?=
 =?iso-8859-1?Q?kjezZ+zYTtWXKuTiZ141nG9j6Jqu2AqNfsDe8tEePoCRG7hkO3P1OU6Bmd?=
 =?iso-8859-1?Q?UD5tn+rrg00YHoH/TU63Rwk1LpiWwHGB5dm0u05LsZfxHhds1Fen8FDQKy?=
 =?iso-8859-1?Q?FbKNFd3hPGVnJwBfhoJj4SXZioxFvFv9VqebjHcAOjtzGwWJWd3HehuHSV?=
 =?iso-8859-1?Q?b1xfXoEVuj810=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cd7cff-e715-45a0-2a09-08db618d9b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 04:15:02.2666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O4aAmcIokG6WQphdF3S6dbI5B8WVqy2/vY8TLFBIasFPRtWGCu5dqzgBLSw5KENdLozPZ1bHWZEp7Nx+9i4uCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8676
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 04:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181987

> From: Khem Raj <raj.khem@gmail.com>=0A=
=A0> This seems to regress building ctapi-common recipe from meta-oe=0A=
> https://errors.yoctoproject.org/Errors/Details/705227/=0A=
=0A=
/bin/sh: line 1: TOPDIR/sources/poky/scripts/rpm2cpio.sh: Permission denied=
=0A=
=0A=
>>=A0 mode change 100755 =3D> 100644 scripts/rpm2cpio.sh=0A=
=0A=
Indeed. Thanks, good catch. I will update it.=

