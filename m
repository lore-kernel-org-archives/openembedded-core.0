Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CE4C41513
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 21:28:31 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.85])
 by mx.groups.io with SMTP id smtpd.web11.4933.1690838903335361995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 14:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=Ru3gg1/+;
 spf=pass (domain: welotec.com, ip: 40.107.20.85, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9EKg5MRo4RbmZaotsOL7V2BIwwtTKsCUU5CGcsuFDTDVya9xLpAz5Celrb4E1w0waVyvMUP5lkE4PB+Iv9T83LcUGn6qTyQI9Po9w3O1M2qg6mrkF4Eb+nw6e/paRD5M3JvMHKc/aEPXSuwDXBysKfaeQvKgh62ibkHkGWba2rOek9d7pojEKfzEQ5TQM4tskCfYsaZi+dRr7cItlCmEKFpf5zRBzm028xLOlGACBPhx05SFvBEwTOV3n0irPBrjDbOA/KfTG1Jk1yT+UxJheM+I1dYZfRxjgrjKsKmD6IHb/AoQSBZ2D808I6huK2kuuzvPmJf65397ngcWSXzIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KY/tXg/MWRhphgCuTiXl1zJhmqYg7NhM+t+8kL0YyFQ=;
 b=SPbVdZ7CvScXwbp4pziIkMNfxTn5G7V5nxOWCT6eoUy2aB8E7XKbz1+YevqVQF2jhSWDhLJ4WxBao1f74ipI/VkVg4r/dCWxR8VAHwogHZ85O6IA16tyHpHB+fHPALon6IpPD7X+iGrHvDlzlNVn9hlt0c9l9ozptXi+6JIZuz9yQx3tQD3YNFQoOpf/I6crL1yZFPW1LkHU55qa1Ru4Iv2zva9akDIX8/B3v8xTFtBa8eAyxK04MFwh42dlN2kdcRsSL7PpyMJJjpPfAypKP5eAFNWXSnRITKXOxLIOA5vIeqjs8KUtjNCxp40Y0tCQF735s5OjABiC8922hYZHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KY/tXg/MWRhphgCuTiXl1zJhmqYg7NhM+t+8kL0YyFQ=;
 b=Ru3gg1/+Y3R688FPmYMRggctCJ4EvqiRWi20pHllCxMVth1nDlYH+84CrWvq3m/IXbD2N0zRGRvwCQ9vdqUlmFOvvKDxEZWNSuCPIsRUWYo6/8WwlOyuV/6clWnjoIEL3ZoozLjYnpDFU6EHkzcl/dBKXfijM/dst+1nlieukdM=
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com (2603:10a6:20b:9c::17)
 by VI1PR04MB9979.eurprd04.prod.outlook.com (2603:10a6:800:1da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Mon, 31 Jul
 2023 21:28:20 +0000
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53]) by AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53%7]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 21:28:20 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Joshua Watt
	<JPEWhacker@gmail.com>, =?iso-8859-2?Q?Piotr_=A3obacz?=
	<p.lobacz@welotec.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alex Stewart
	<alex.stewart@ni.com>
Subject: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Topic: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Index: AQHZw+GoIkE0W6fK8k+8nz7vZaP5pK/UO6gAgAAW+ACAAA8KgIAAASbogAAAXL8=
Date: Mon, 31 Jul 2023 21:28:20 +0000
Message-ID: 
 <AM6PR04MB5368B2FF63E716221B740A029105A@AM6PR04MB5368.eurprd04.prod.outlook.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
	 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <20230727141809d2150cbd@mail.local>
	 <17762A3A069807A3.31298@lists.openembedded.org>
	 <VI1PR04MB537349F74CD4C3E13B272B879105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <VI1PR04MB5373AB9F0C887CF659E739439105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <CAJdd5GYifrOT_9-fct6TT95sw6tDe0L7etLxOcaEgTTGvWFPJg@mail.gmail.com>
 <972083f47f3513fada3dc64c233f2c229f952aca.camel@linuxfoundation.org>
 <177710C9CE043B33.12785@lists.openembedded.org>
In-Reply-To: <177710C9CE043B33.12785@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5368:EE_|VI1PR04MB9979:EE_
x-ms-office365-filtering-correlation-id: 8309c94c-bb9b-43da-9a09-08db920d101f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IUWKvu/6Oh9HgRVdX+4jzOuO5FYGcHC3ChbeH7O0Gj72tkUtL6fO65whUQ1iwimP4K0+BThp+EVwCbgpAx3UlrrDkQeCg98n4/UPBIkcD69tkSCyICOXXqzD+WmA5QgidWRc9iNpsh90/UEB6D/4ZaA6BP2NpDSfb0l2lSvPaSV9W6v4KJDgr+73IzQx+NpZzy+tsJSx8qCzRP3ci++txrX1AiqhGHXtXK1f7e53kZgkyuswMQc5WnNj2dhDycwO8S4CxYZbrtB6ts8rnq6AeTVlKhl+VQxGWdjI+cZSYsOwYknnzsrljlWoSFi/UatCbOU5M/MIZiAlA14nkWaLhwcYj5NwNFmgEu1vXZygqDjM/JWa66r7FAhJZMuayBcffYDYnWejDB4ULD+mmv4g49zpiHtuQQ4GMoE31H9WYo1UP+AWSiQUT1HvJzSIXYy4z//dlCTEwa5Rpb4+7iRAeGhUOeSdogGidUv+ZLYTbS3Ph/BIjfnLubVSkfE7SpJTAWLcLLQwvxQGbWtyMriqk7lQtWubmXmaFOoZG1zvelmIB3p84lMZCHS8+EwrHvyDMDmTEly79HFowE0IC8dm7kYVUaK8ov8ybLn0L5A6wPq7eKoLIuau8SDc3XV3ef2Mk8iTbVZvu1HufhED6ijJfi98lcjctaPPh2zSJnVmisc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5368.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(39830400003)(396003)(346002)(451199021)(9686003)(7696005)(55016003)(186003)(6506007)(26005)(76116006)(33656002)(91956017)(66946007)(66556008)(52536014)(38070700005)(122000001)(54906003)(110136005)(4326008)(86362001)(66476007)(316002)(8676002)(8936002)(5660300002)(64756008)(66446008)(41300700001)(38100700002)(2906002)(71200400001)(478600001)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?F+IREhU4fhGngTZvL/cIaC+zcpKDLF6W23yNt/BPiRCxnFbHa7XMrT9bYf?=
 =?iso-8859-2?Q?iIrUNJkowS2lPkZjPp897eTplYtYI7gQuY8EUtyVbNNVCVnr5TAdfy5N2T?=
 =?iso-8859-2?Q?C7Bf1OUNiYymGSBMhot/MymAoSvZ0QcdTKFyUDh5lWj+R9c9S7RswoVOCV?=
 =?iso-8859-2?Q?5jI6BGeZqV5j/mSV33qsFObmfd9+Lwa4GcUgweaeh9G5YkFe/AU1W+iNVf?=
 =?iso-8859-2?Q?uwisnYofWuC6B+853YmXy3+gUQXP2DtcXxZYTmHMbl0blUvBcpBPWedLD/?=
 =?iso-8859-2?Q?LCQvcgKcBOp8HmNk5VHvdEXwC8b1dnYZ8sK+MIj4+Mp21d/h+86M7u/jWU?=
 =?iso-8859-2?Q?l8ju/+KITbLLLMpvss5AH3Fp4v+V2Yb6CVFwvGk2LGVT8oVjwmTb+Gc++1?=
 =?iso-8859-2?Q?Xw3ppWd1Aix0RfGDajTmhQCtgJL6zpn6/nb4CXhGLCPWvL/0doDBiF6YWm?=
 =?iso-8859-2?Q?NHk6xkqxPHGECA42+JHB1Hq2sfNV4Yt79NAyI8HIfJiBi0yKDwUY2sQrNW?=
 =?iso-8859-2?Q?7lU9qHL1GrX94fvYcpN3dwFTfF9qntuHQXfvgRaC/yEe8NmTqJ1i2b280R?=
 =?iso-8859-2?Q?Y6rbpLtzP5d/se60mLDqnrwSmRrRupS041bHV79RD8hIkpxJHnTgvg4Jca?=
 =?iso-8859-2?Q?euUSTrMrQ9nZ/vwhL2WrhnEa+olnGGdZJ2eFwsC5K1DnrVc66HSxtXD/fI?=
 =?iso-8859-2?Q?WmH92qvwWbwN3wVlNvN0lBxEptDwEC0X3OcyY2mY/aLCdreCyDticwvx52?=
 =?iso-8859-2?Q?5zpJ3sTdf3p990BHqSP2Y4l6/zmJnAc9HdkGzLVaGPaqy9gI+aJzbuwr5U?=
 =?iso-8859-2?Q?mdqPUqb6cE4W+y+lIyy7urqnbjZyveGwJApf3wxf6piDmBJx/LKHlnVjTT?=
 =?iso-8859-2?Q?e3bVQFsDVPua6mthIR3/oKG0glfTWcaLbiD0TFKdKmLcEzlZuR7AURdeoG?=
 =?iso-8859-2?Q?OS3UmntlXq/LASMQxDp8wXDdm1u3MmNwNbL24ubQFIPZv2QUACPi3irssS?=
 =?iso-8859-2?Q?yBBLhs2IrU/YfM/8vkPvjWXs6Wk623obM+AcHy15XZQciBRcRkYCdH7pQe?=
 =?iso-8859-2?Q?c9xJUVrpcKCg3HthspeJ6SsICaxDCGp5uBwFvtHamMn0/HWLwxWWh3Uj9H?=
 =?iso-8859-2?Q?BvFBu+hUPE9awrhLLmitImTMETIZyJ52zMg7oID5bkOS3otDgssDjO280Z?=
 =?iso-8859-2?Q?STyHaUkdGmzncAR5GP0PjW1cpqD9BYcHYByFsQH6N84ivMWCqDyeH0vhPz?=
 =?iso-8859-2?Q?EL5avh0cM3VKarPLgQsJpc8hKkJhWTWXUvMrzppavKHAL3uoqeXCydBx37?=
 =?iso-8859-2?Q?K6UWln2ouMXcsTzz3ctiAjTNoNpG09WlxIwFLo291XsRxtM95qT3MgAGoW?=
 =?iso-8859-2?Q?/JaQPh9iw/8a0g0xibfoOuuFK8JHUHLGJF7P8MpLJ0QF1rLAeVr88lBMyA?=
 =?iso-8859-2?Q?PvPQEZ+SwLrDE0MC84ZpEQYBl9/IZfi4vXTjRnrKqAZuP3nK0+b2QeRFe1?=
 =?iso-8859-2?Q?hgw8UiDTKNTftTKFsPBcfXJrJYIimhKXcS80fUjN9TOBZmFaP2NRcFb4rB?=
 =?iso-8859-2?Q?HdMivYU84icrwM5CDLphMBN5ucIvoX5S+oXE9GuO+7mOddmcelo1FH2nxS?=
 =?iso-8859-2?Q?fvYNnr81h09hrLS3w8qJ+gnrRNgxDLiwTp?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5368.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8309c94c-bb9b-43da-9a09-08db920d101f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 21:28:20.5465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gIatFbPnWOv2BFXlLYRLYBKyJuUI2hBHRCPdB3fqODW3aqxSd0C3H7kjHVUszjhLHJa7pRStu8anXo1yI0K00A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9979
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 21:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185173

=0A=
=0A=
> I'd guess you need to make the sstate archives of do_package store the=0A=
> acl and extended attribute data and when that is done, the millisecond=0A=
> timestamp data will probably be saved too? I'm not sure this is going=0A=
> to be a generally useful thing in the general case though and zeroing=0A=
> the millisecond portion would really be easier in general if we could.=0A=
> Certainly, SOURCE_DATE_EPOCH doesn't have millisecond precision.=0A=
=0A=
This is what we were talking about on tar mailing list, to remove this prec=
ision for posix format.=0A=
Additionally in case of acl and extended attribute data they need to be als=
o added to this sstate=0A=
archives, which still means that it needs to be extended with posix format.=
=0A=
=0A=
BR=0A=
Piotr=0A=
=0A=
=0A=
=0A=

