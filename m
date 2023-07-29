Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D988C0015E
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 19:19:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.54])
 by mx.groups.io with SMTP id smtpd.web11.60205.1690658348404732367
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jul 2023 12:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=mcHTXeFR;
 spf=pass (domain: siemens.com, ip: 40.107.22.54, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYF5l6HOonk0tb5mw4j1Awc60j/Pp1GQ0z2bPTm+AJPCnXptHOClYtrllUSLZV143qM7bZKGlf0nYf4QSvw/0fEPw9aOWuKP5CY8xh1lPno4yIXdA0qVOjGQSZ4d2062VZ95SjfvVssA+GbdH9WFmcUCQ4P8xDsa3v7tvr3ifIJA3R8IopXKu1TKFq9gmTqeADf+Qh+qvMMzsa4+4Qzwr0SUqeA8qM2t0RW4wA/aSyvcjYcFzF40R37oeMxOKQVT2vVVQJrcIPSopqfVB2vK7Pf92nMofJ+8sP49TA/833AjALriDnG/AVDj0KLqvNisvQYe+D2QpRLJWUYSvMQ20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMPjxurtm1mN9yGfBPZmZzsxZcte20F91mecoqWK1Ts=;
 b=JPNisY9hH4YJXgYDnV9D5cuTfDEqSLE3frKUtq1mivpG+H+Rl2Ymk6LnArLTeQdro+EGZckuHzsUYe3Nee8IFuxtvNpIDxzuNQeeZDhBd2q2Mq+V09+gBBXmxqXiQv5NYl9kRZ5GbXlspMmLTG+FCZ5QcXx7f8GIRPSD+tykwmHuM2L5dZ+w3xt4jNWjLutVN9V+iIutZHFTgDdxtgZ2iVRV4VGhGjCmW51WFox5txd7CNVtIvxkYUEi6B+hVAr7+9ODL6qmghUzQiLKEAzqNeohYCo/z3GhyHoWYylOi7EKb7R90Pp0lhBgrORE9+B6N8U5F6Ir8YteV7h2YITSjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMPjxurtm1mN9yGfBPZmZzsxZcte20F91mecoqWK1Ts=;
 b=mcHTXeFRNRfreRe3gq1gP+PyeCdo9Jpd1oMi1YFOQhEzh5AG/IGArRhEg4EtH9ZaSN0sezwfpwq6MMu+zRa1Y8+y0koO358sm/EVojBa+HlEYLltYGWvOWSSRiBglOQUs4E3g6QmUQKaFldZpLIJvCkBDiLCra6ZPjmBuEh6amoYg6YgyWKwFAwXmIizICOn8GIkGarVyqURTqzfdrugez2MeaOD5+4YcJ9sTnh0XUJTUL0sq4xcXjFif3dz89LqoN/ne4h98kKrU46HBjdTEwsuCEvkoPVpF+1w4roLqRfZh4xyV0rU6dd7kKxBmVlrtWtRNXckx5ZA0wwn1F7Y+g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB3PR10MB6905.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:428::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.41; Sat, 29 Jul
 2023 19:19:04 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6631.039; Sat, 29 Jul 2023
 19:19:04 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "quaresma.jose@gmail.com" <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yocto@lists.yoctoproject.org"
	<yocto@lists.yoctoproject.org>, "alex@linutronix.de" <alex@linutronix.de>
Subject: RE: [OE-core][PATCH] go: update 1.20.5 -> 1.20.6
Thread-Topic: [OE-core][PATCH] go: update 1.20.5 -> 1.20.6
Thread-Index: AQHZtlfntaLpn9Wv70ScQ5AvZDXVPK/RNS2Q
Date: Sat, 29 Jul 2023 19:19:04 +0000
Message-ID: 
 <AS1PR10MB56975B56CC9A0C107CD110A3FD07A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230714133400.3463291-1-jose.quaresma@foundries.io>
In-Reply-To: <20230714133400.3463291-1-jose.quaresma@foundries.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-07-29T19:19:03Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=6c518b68-6aa7-4a0c-acdf-c0dc59084b34;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB3PR10MB6905:EE_
x-ms-office365-filtering-correlation-id: f9eb7ff1-6735-4e36-63fb-08db9068ac26
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wCa19s8bMth0udpmrI/48YOrgTFvd0a610tDmBCQsr3YjWIMqyPEoFysD9gWeNato5WwTjz5pVj4YwYZyo5hZry4iUiffB/XjOkJicvZWgo4ddDdaR5AS4ST4WfSCcoghffDLgKC9kMbt1AAdr1XQp8urYruIsjYJ1abc+QMpgqavGGs3nv1w40sy/iGs2PHPnVtmaMwUQGXgqD0cnOsMBsS8rxAZLvXNPi1VqUvmCbbyvjWFl2ocaOmHJBU7fPNfnVTa1lmwrFbtN+Qz+8CLJ3w7gTVT0wGgMSyr2+FuDv1DktjuBtL5njc/6RwaMqEn8q88JiMj1cpChjK2o5uYHTKrVVhWsgzfJQsLvmkLQPmL4OEZoLEVxjQ1nvFRiKTPZxVy5tCv9+qV/1q7uKrBwptrni4hHAiC8n/w76X6/Z9q8kTqLmzjdsRS2c8bZ0HAF5ZZwUvAh6eFO4A2vKc7g3YhHbhrn4q6vCW5Bxj3+d8UDQVJGOyKtoKl4W+paMfio7Cn/XcaAmt+p1lPDnQwxSzQYSVKNe7kO6gL1cDsclen/hvUzeGzisqlqtv8TomnPKCJ1Qm0xzZL1bmaOnlifhg2/kAgDROgthm+oVkIxjnHVoAcaepymEV9koWG63B
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(9686003)(7696005)(55016003)(55236004)(6506007)(26005)(186003)(33656002)(76116006)(66946007)(52536014)(66556008)(38070700005)(122000001)(110136005)(82960400001)(558084003)(41300700001)(86362001)(66476007)(316002)(66446008)(64756008)(5660300002)(8936002)(8676002)(38100700002)(2906002)(71200400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4ftTF2R6xqJjIExi1yOVI/GyVmS2PJxFfX0a4E2KVp9Y83VbJjZZCZmN5t/D?=
 =?us-ascii?Q?KpsdwwBFDHPjKyX5/9TK63G5CqQd9IZaFaLPpuMzTpZY/fXiexrmqpmarOfq?=
 =?us-ascii?Q?+RRpaMIyTZka2H4Qh6/FFwp+cA7zjASu9xiQjHsYWpXddpFftvm1lixEjRIN?=
 =?us-ascii?Q?J6Spnkd7gK/K9NiDfRxXSJEktRO/qsPhF1K+uINSk7Fwz+xIcXQZi7wcT7W+?=
 =?us-ascii?Q?pMq7OJ5A7dZc/vL09AcOMUB79C9qefnKxYpwgunnqKmQ57fYD7EMHA7SAzsj?=
 =?us-ascii?Q?q5/kwS2yL8ISmj7QS+gOekPgaGkLEdHV1k1Bjk2EGoMF824Hqq53MG42e6+8?=
 =?us-ascii?Q?RMFJVeKfIIm0FzGk6ikyfKbpIGLp/6LaC2NFCUOBoX4nqtw06B+LAwlw7pdQ?=
 =?us-ascii?Q?0PSNnvJS5CodorYrJWDJMrnXO47wW9H4Ma4lu3+XKyJhzZ2wr2s48eJcWZHy?=
 =?us-ascii?Q?SThoSjNDrr9zu/X6fku5Vq0ZrA2JNx6JaZzs5dPHrYQAULYmWH5jpJY842kk?=
 =?us-ascii?Q?wKC07UVrIvcfyu3WgIpxqLyFwnJcwlq/txYoD8WXHaeO5gjGJZCfkvREbUqV?=
 =?us-ascii?Q?I4/0fGmSHvUMlafnXdYMQX5p1CYbMh5Of0qECCPR29pglkzQDuG7sEDCVFbb?=
 =?us-ascii?Q?xI5oLwTJS1NnNVQeEBX2ddl5xhPg3gRwhdKHe8HjGvC7f6aaktegUGCUVF4F?=
 =?us-ascii?Q?mk9mFrJBB6dZLBJPjb4MCDMrK5frm1jp4FZunE8Jd++EbdR5Vpw3Pe7WhkoM?=
 =?us-ascii?Q?r4eMP3MrRdVVYu45k2iyY+EuTwXW319Nl4zXd5itqM9Op2c6pTSGoY4OggPh?=
 =?us-ascii?Q?e1sKNuA5EsGmUIlL/bxzFUYp93z1nSlAJ0Prebq/wnPdwbIiRcT0FBFTj4NZ?=
 =?us-ascii?Q?wClkNDGXEAvKw2LFBVgE2W3uigQBvhlUlNJ0xm4PejRu5k8K/fPHu6SShfXi?=
 =?us-ascii?Q?MuIPxxuiZxeFsA7J80XBfeTrWz4dtxc4sEy0sa1zk6kQrSoNRGpEkFjqQMy5?=
 =?us-ascii?Q?fHuDzA+r8ktXKtDIuuq50mc8LpW9DHLWrJZs2/psO22BGq11omoeBejGFCZq?=
 =?us-ascii?Q?148cOp/pwXaeTZ/BGYg+s2eIyypgXDA4uP+Lg7mFDSHpn8kMyVYVzmSuyKc2?=
 =?us-ascii?Q?7OWSR+/jeq5l74PLBhL8LafeyUAQChMSN8s6O1K6SE/HwI8FeuhZjhBeuTIY?=
 =?us-ascii?Q?ME3eL+rP+XQj1EeJy7Dfd33sQeihhDUUAr9pVkLeBx6vaYp9YI6uu05ZWYPn?=
 =?us-ascii?Q?+NDPr6OJOCrHDpgb0KHTkzhguOKfkUsYme239EEtLdr6vuM7VCYkFZao6LS8?=
 =?us-ascii?Q?GNSGDSKlGaMTguDxmTnxYREbJ8FimzaEDGOwu+W+RjwIDzQ2X1tQP1SkygYb?=
 =?us-ascii?Q?2CcNfAj+QPRUu9cQLXfmBTsx4tCoa1gQbTNlLRehoGYiprPvhiguUs5GQyrr?=
 =?us-ascii?Q?84VDBsoYSom5QKxkVa+rDTQEb30qLC4TG0rBkVuXAlFWJu01OEl1A2pvMF3w?=
 =?us-ascii?Q?Xm2yX3/oJ8itb5i4c2NVy+pCFjg9TMq1PSw4KvmjuEmUBLXW/iyXNm3/5cFT?=
 =?us-ascii?Q?9hzkqFTQDNTWZ4m88est81R02BsU7FPgv+4Y/ax0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9eb7ff1-6735-4e36-63fb-08db9068ac26
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2023 19:19:04.1720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vhQkQ7wDeIzHDDmzWRXKZAgVaAfx7qqagWHj7OGEJts4rc3OR+7FZSzaPMClPfphbPCBU/+yohZaL6Hopvn5Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6905
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 19:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185059

Alex, Jose,

I could not find documentation how to handle mixins layer.
Could you please pick this to kirkstone/go meta-lts-mixins?
Or should I send a patch to yocto@lists.yoctoproject.org (or other mailing =
list) instead of asking for a cherry-pick?

Thanks,
  Peter

