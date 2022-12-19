Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A2DC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 17:04:37 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.47])
 by mx.groups.io with SMTP id smtpd.web10.27608.1671469471962395817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 09:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=XV+09mGo;
 spf=pass (domain: siemens.com, ip: 40.107.247.47, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRQ6zpSGKK5kKw352satHw3K2Nj1bEKxQluuciErsstzur/FjcRhsdWkXbRK9J94AJNe/75ooym6lmGf5Kl4GWVtNDc4LZLCoqbHdFnU02F0no5oh9PBzdH+jBi4Eg9VFTW7S0/HdZbeW9iiUHCGEhUlHsDBTg41OrIqcVerVpxYg+IGFt4aUMohN2i0272JumcNdyBV8YLWi0rigOHOhYm/1QgSJCPRjs4F/4bg8PtIuOlUgUE9KRwu5BYrGRmFw9brhvx3jOEE2asqPoVSjhoinFBmgINlYjAM0HIvXadQk+zIFK4in8rNGTB5yi5TGSye0kzQfB4FQVL1jIpVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjxalLxUG8g3F0YL5PHVfKqZMya9y4xkUuSUi7VU5Gg=;
 b=nrTgwy2jpFPUEkMrhujhOo9xRGwoDUw+OY/CyP7f1KhMqxlheechMGookIuo6sSZgu/g8MzaWeQVVPI2sSRkf5SVG1g5LKbgRNAJuzXMOYjWfzgPCjxOMZv5UGQZHHGivviDSS2VpMdRubp12iGMlNIacou2PEiSC/1e7bgc44iU6h7Ga2x/9S4jMl0EKBs6T/kfX7SYnNytuy4/MK2jzD4kFOzyUqOW/ZMJhBDoHeUaatTLjF0IJaVRVz7wxuXUnDn7Imf4ubwx1I0HPoqzyTITNEWsMdU+shrjsgVKMIxtniFJc2SPCRt1GR0/DIAumhhN76tQucUDaneuP/oEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjxalLxUG8g3F0YL5PHVfKqZMya9y4xkUuSUi7VU5Gg=;
 b=XV+09mGoR6Jomt6nVRCmyF6kukRmjoqAvsTmiKS/Tb2obfxOR+VL8iFe5taZhr/txyJhibZ/F2+gMRf/GWN/lD66FZZoasbetyYqb8EdzN4n/WNSaG2a+pd9h9+0KM91WPgydT+oN3PmoVg2Mhj9FWFtezF/VVzbzho6yYakE0v7AXYB3vTR/Flp8Fm74+flq1RXUcTvqzAFQKTt/+1/W2xDIls/p/saQoaAUWO4NHVnjTnOsCYv/WmfdbtJWppssj0UxSn80jXbXLtmfzo2SFcZ49XQ248L7KKBJh+wSuELpc1CN83VGBNiw64coRkCJ0P1mQ8eqSSDMccShmY//Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6921.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 17:04:29 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4a66:8183:5d7d:eed7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4a66:8183:5d7d:eed7%5]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 17:04:29 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] sanity: Update minimum python version to 3.8
Thread-Topic: [OE-core] [PATCH] sanity: Update minimum python version to 3.8
Thread-Index: AQHZDYdNReXcfdEEnEa/1kAa82EWs651d1Sw
Date: Mon, 19 Dec 2022 17:04:29 +0000
Message-ID: 
 <AS1PR10MB5697400B344F5549E1232DC0FDE59@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20221211173746.22513-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20221211173746.22513-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2022-12-19T17:04:28Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7b97c3f3-c81c-4c7f-9158-4302eaf85fee;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6921:EE_
x-ms-office365-filtering-correlation-id: 0289b93c-b435-4c30-cb71-08dae1e3175b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JoNosXq1xzuIkDhBxLNlH9eUOcxZFdQfcwRn67gqT9JY34XNl5VRgPCeAst6Nv+AvVZ75BLvAN07f87ChAo03FNGbCT7o1/0q6MmA+ZbsMpZFN2Cay9BSXmdG8ug9Cx2s0Lbr9vZ9kbW1jNCLD++4YzjPDpOd0nWLvsaK0ZXlehuXC/6Lm+EyKOIDNDrz6Jmr993I1Rofc/JQ+FnUEkHfVQQIzt9tU74R5Kjz2kYcFwa9QaGy0Zk4KI3A2PIaSDdnzVI/QA06+x9RHEMeux3i7EE63B1sXa6OI2++CH4YZs++2/jvjgYI6HE7D1No50CYoxLSWXoYVpw7y46l5d0MF8VCKNGPb81IUgXDCzCEdmbdEDL45uPHdWPgoEJIYjRhLmyl8+ITsiqv9JUfISmiPJA0sW0Mk2rzZOWVAJ2T9BKmferm5kUIuATntPB6GqytXttS07gjg3p5gKHcEe8Dtc3RfJFQ+/v/Fuzb+05S53XPxaHTtlLgwz7LGOC4KxCsI7xyZXMeJcHaarImsBOxbd4F4fpm3GZd/AODp1h2foM38is0LvBNBlIdAVYOqAmeqMJwukofjp5hA19OogknRE+FhrVURmVHtSW/AggHGFbxG2DXwqZKHcBFt4oZbG5aQIB5AJWjCpZG+GYOdVmMxzTrSn5/PyzoxA9ovxpPWWk2t4N3OOTngdfWLLaSwCyoq2cSloVhthFCatOHQIgHw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(6916009)(2906002)(38070700005)(316002)(478600001)(55236004)(7696005)(6506007)(86362001)(55016003)(9686003)(186003)(33656002)(71200400001)(26005)(52536014)(8936002)(122000001)(38100700002)(82960400001)(41300700001)(4744005)(76116006)(66946007)(64756008)(5660300002)(66446008)(66476007)(66556008)(8676002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8etQs5rwq901RVIas5zT5G30EU9bp3BQEY5ccVrdZ0TKf7/jIaNGqnpj7rKa?=
 =?us-ascii?Q?NEe2K+DEKFZEk2vASOkCXgN3Ah0Np2HMe4iwAYdQUVtJ1g/edx0EG73oG47q?=
 =?us-ascii?Q?NqEEOpDO6IY/7SWRjEXVb1lt2OwSbMToTIdNoRjbFbKXH09Wj99937q7E5ZA?=
 =?us-ascii?Q?bM5JhWD21/OrId43uZmG849TtoYN+BbHP9qUH73iL5UUWmclKPzEbfUpwG0N?=
 =?us-ascii?Q?6igzYSLcClE/FFVygBmmB9KQIPcMzCG32+bvNC4V5oZ3B+s/Ofhdi8cJ1FwM?=
 =?us-ascii?Q?0lKvPLcCEndLsAYo0iGVlX76hG/yN6I8udUQsHUGqh8k5ym/OuAArjBsMCPl?=
 =?us-ascii?Q?viw5sc+Q4x0vrHRstvd1+FDyqnYqmCq8/E+giDqf6VJGoAO8hQq95ktQuZXc?=
 =?us-ascii?Q?GjbMFgGnXRbqtTu9AZ5O3Jxy/nWMdRa2d+En8yU5VDBRoocyg9FpGGTDRF24?=
 =?us-ascii?Q?Qp0QsZYMhWuZQ48+W09QgEHyAxVO5rNunmIbaRo2OZBfA9q5PntFphJUrK+/?=
 =?us-ascii?Q?U5isBF/qY3DImvqF9nJvHdYLvXY76gKDTzqd9dolDp0+xDmugnqzYaBcSmjV?=
 =?us-ascii?Q?0YhzcFjGv0Vvx7ir2n9aH0hnAraxqOmJoshmPH4mij4JusouDPqyhlFBM8qm?=
 =?us-ascii?Q?asHxLXqleq46dFYLSylj759tbIdN0Fqsx/DXfWyW3ydHNzqx4ZSkFlnL+mrQ?=
 =?us-ascii?Q?PHjIXo6OpvTIaHvpRLOxHHZcI+mMdWlXey0L31yjYSmV6GRdSqr6s1CdULP7?=
 =?us-ascii?Q?ufiw6x30cGi/3l63p4WUmqrOZoqa+6vnu15lo9sGSxz3RZGs3c+NPgW5Yw87?=
 =?us-ascii?Q?c3ND7JaHD8jnK3ol/sI5fy5kqUteYJ/IrR5qecDP0qryiBEFrKcpnUctRACW?=
 =?us-ascii?Q?Q5Ac1bK1hccHUQfcIxwotaUIeolXpC9EHD0OFQZ93f8lY0p0Vhtrs1bNquBW?=
 =?us-ascii?Q?+AoHY25hpILL7a29NDj5ty01AehBQ7MdVl+0QJyaEpdS/e6QlOKmOFdT4uz1?=
 =?us-ascii?Q?P9Y4YyU5cwknNKj5smsgqTXuL169n74djvZLIHrnnxl0xKG52qcbcvuB1u8w?=
 =?us-ascii?Q?d+h2l2fjaGnTlBm/LU2g6t/vuu0Fn63HkoiytiOon8Uo3YRfIA2ifA9pfF4E?=
 =?us-ascii?Q?U36fslMSYNUn5r6HJWmfsaHDY/RY4Zgttk8C8JlHlRXpHcUzs6xowg1OV1T7?=
 =?us-ascii?Q?jBd5sBz8RSsmKUHgwW5Zlhu9likEuKmbVu2GVij1wUSarFRm4Ou4KlytLung?=
 =?us-ascii?Q?HU173KkbkYRP2Gb9HAevBbvpltKc2aNuLmXqs6T/uGpEYh/CD3EX0P3+VJwF?=
 =?us-ascii?Q?NBoAd2OMMyL1N1bTtgG9SyWP98WUme/inY39PF2j7Q6Igg6Y6CLoDYH/OeX/?=
 =?us-ascii?Q?+3uSaWnTCXoTxAOmCYIaUQQGYHBrfpK1M8LatHIUr5W3OcfpMfjj3DVqoLpD?=
 =?us-ascii?Q?EZmTA62iPZ9P5f/GknUzTiLQXBdBHLohy9fhAke3P0nqxRvCOKQzDNZSJ/lb?=
 =?us-ascii?Q?1sqJfPVag+T0ThSVzd7ndhzHKfTo2nUQSgh+F7RIbWK2H8cIMSChfWTImJRj?=
 =?us-ascii?Q?AUTuVcCSRdU+NM/Mg7zLEcnvOpADNjSulQuZZYmu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0289b93c-b435-4c30-cb71-08dae1e3175b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 17:04:29.1907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kaD0sczoBOJgRExEu3kjnc7V5ruHs9bQXep1VwTm72Azys12rfUVpDj43EQtnPG4lUCKAh8XBghXEzGbrvCshQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6921
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 17:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174821

Hi Richard,

this disqualifies at least debian-10 and ubuntu-18.04 which are still liste=
d in SANITY_TESTED_DISTROS.

How is the SANITY_TESTED_DISTROS list maintained and tested?
Are there some autobuilder jobs with these distros (should be failing now)?
I was wondering about this for some time already because I had to discard D=
ebian-9 when migrating our layer to kirkstone but poky still lists it as sa=
nity tested on that branch.

Peter

