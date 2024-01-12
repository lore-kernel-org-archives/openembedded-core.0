Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B840FC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 09:15:02 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.82])
 by mx.groups.io with SMTP id smtpd.web10.3645.1705050898857276350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 01:14:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Ockn3pkQ;
 spf=pass (domain: siemens.com, ip: 40.107.13.82, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAEYI8n1lP3mQzeNutVwWr2nSyCRtCsBqHNDkz7n/RAffiISDujrqd8864OKWqloOSMuLbY4c3pxnndb/+wfAbIK+CGz/uySsdgiDDAXuK6rE4quDHdG1phAkI/BfJZFCguyNSKBdZehlX6rrKZqWTwnlgGhmoEQDR4k5kVck0NVEMHiAtnQ6mnHDqEtD9rjGr3qwk2/AX1aBOSsHiP8sGKD2hvg5XqoXTsxeJRikztz4qBkL0weZ2Kmf0u4/imEcSrbyy1b4NoBnnCLnmUVVbztmTR/1BTtKG4mtxkVt0zjTK3yYJq4X+8YztSbrahYEduUOfwY460VoCgqsbmVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jasPYPstX0Vi2XW118lNdt9mUG6jK6/A3uKnLQA1M7c=;
 b=dlvldRNLolRywXAgw5Y02EA5IdMlKz77hOo3Nmvf+vrx1U87V481d5oPTGxDDW6KhTwYngu32KOfez2nA2O6tZ3CxdQdbnk35ikfEiNQ0JJISBgHQGaGYgyU66lMiH5zlyk3kVPKrakBSeSmKlFhke1Gz0oZY4u9jRMAB0RC2FldtqAryoh7bntXYHw600+Kzf342oBG3+6+tsyUgxGY+UJt/65/OI5Q6wyGiQ1iPrgJMz4XQy2ZaM32l5b9wrjI/R3PCxM3UL+JPe8YoL72kxYkzpHBDX3EZNOGqd/DEffyXrtqDkaMGkPxVBl12MQJ0NJCOkIFUeB8nVXZSHKSYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jasPYPstX0Vi2XW118lNdt9mUG6jK6/A3uKnLQA1M7c=;
 b=Ockn3pkQz04KVz+I4emx+/2Qkqk/4THdlfjCZBLDjQgOln4EQKqDWSLoyt6wXUFSQZl/XxZxEcfmHAd1+IX0ihDwXJr6B/CySd3suTh1gqoSwak0tUcEOjFx6r9/6PaE/goaOJqWjWBIJLPyF88rhdxZzAj5wDPT8g4xmVFax+V4yu4wYDh1zyhA8PMV+0lG+9L2mkpZzcPX7Of76xjG45g0agrmEAxfg8PrKafrkfrqrj5nPSEgDYZXt0+q+MCyiKlBx6nxt+mCKlu2PkJJx2msYC4NDO0GFk5hhvTqEpIgwufdwaZAC7//z3xt+T+MDFmv5dAXTNaR+SWXh75Fug==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6650.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:564::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 09:14:55 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e%7]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 09:14:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex@linutronix.de" <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 13/21] alsa-utils-scripts: merge into alsa-utils
Thread-Topic: [OE-core] [PATCH 13/21] alsa-utils-scripts: merge into
 alsa-utils
Thread-Index: AQHYeZ1yOxhz1lU00EuBq3SkjFsvELDZeouw
Date: Fri, 12 Jan 2024 09:14:55 +0000
Message-ID: 
 <AS1PR10MB5697FF2BB1A0A5CA22E34C68FD6F2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20220606120126.3381438-1-alex@linutronix.de>
 <20220606120126.3381438-13-alex@linutronix.de>
In-Reply-To: <20220606120126.3381438-13-alex@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ca0c1776-41f7-4301-a787-d33442350b50;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-01-12T09:08:20Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6650:EE_
x-ms-office365-filtering-correlation-id: 58a7df1d-4704-4009-9d0b-08dc134ef0fc
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uYjNv9ZgdX6EiY5EFw1tUXbnxKem0pA0UW2fNlNz/4DEkzErEcyrstbV+1SdCuKLucyTpNcvLCkFAfIwlW9mabJwH13vINs6n3W2m1bcr244D8bzTcPnW+40sVbvCYFS0Eu913u244ENPT+6yAEj00bX59qUoZhf5BmqBolWwQaonn5SzWVI6wKBiLRak+ccfqbUBtqAFdaNW+nsnUNr4jXO8U182V9+rwqdLGKRQzLFQXUlsUAM9r6A+QNQmXr81WSGJ/T5Prh3AITmoBV7hcOJ/rNUFdQxtOjPbTxog3XacvmjYx+dKvlfS6lO2cw4mQ+/lK6dfeIIzFkBB5MlakiLilu/ymroqZhWXpo36kiOt0eFy4vs8QYyPAWsmU0PRHXIlC53jhnr9s6miW23ZMRjPDkW8psv9Oo9i8YpDD8QHe540F0Env6czo/Re4hdkpdcRE/Sq+Lkiv3UVdfZPQqv1yASxGAtjFk8n8zEo2ZgRclBcWeoqkxahFFH1+l7Vv+QUyHfvcJmC8/Y8m1u9JMOOeeeHD5sZQ5+anFvAnssgA/9j4G+nq5O+1dCDHfyekrK0QqHivbC5NiCevAMklt2v0X1ba+/vEB7abBolsLdaxiyz3SrF08rFZ8jV1Q7
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(396003)(376002)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(55016003)(7696005)(71200400001)(478600001)(6506007)(53546011)(9686003)(26005)(86362001)(38070700009)(38100700002)(33656002)(122000001)(82960400001)(41300700001)(4326008)(5660300002)(316002)(83380400001)(2906002)(76116006)(52536014)(8676002)(66556008)(64756008)(66446008)(66946007)(110136005)(8936002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QelwLwIqkenlFcQUH0iKzOxTWAXwdop6LVPW0Xpm1jlNY0R/KA6DkinzD6SU?=
 =?us-ascii?Q?nk5U+nv2ou8iySgPlOyTrbrXp+jCqEI5CrecKh4BSoekhTW0yeeaLrQPg46b?=
 =?us-ascii?Q?yv7ifuXVTF21lFEBACNTPSQMNYiA6Nnz5YIhgK+ltjrEpBQJU+B9LauVAgTi?=
 =?us-ascii?Q?cPcom8AZsoBXilva2z+5hoHWU0Y5oJk6FbaTYVyCBs3oZA3n3gBezab/CL75?=
 =?us-ascii?Q?QYJSTahT0oDNgiB+zshbkNZha69wgYnY1Y56rJ4DydrSLQS5Ivlz3z0k7Ktb?=
 =?us-ascii?Q?OxzvqcztVYiLzg1hGR1nd7XB+HbYVUUEC+Zwgl/madAaQEat0ucHFCvszyTK?=
 =?us-ascii?Q?I8NOfMPgO314DPdjXTLNL7MwWXpUcUd3dkuCGCecdR/GSXDLWckwHL6NAOQy?=
 =?us-ascii?Q?Es7I7FtcTBcga7nRUG3Icm8eWtu0O4hjj2bEQS9t+nrEkD7hahMdeWzNapOe?=
 =?us-ascii?Q?/ylfKMp7gZsML0IEcojp1kEsLqUoida0kpkiZIUXLcrKmefkbyWAxn3xsOK8?=
 =?us-ascii?Q?sI+lk33zo6SrMww3SPYRLfqj7rzUEmnMzk8HF098Ze2aTnM7ineJB10uO32J?=
 =?us-ascii?Q?x5Mah7SzPkPOzhmZB4obYYgRBUth4lDVgePiAUZvoaLPXfbjChA7tH7T6kFz?=
 =?us-ascii?Q?rt4MwnB7r+7ow6ZDCxebJzMHT7AS7jVdLrBIWpvWJDyE0smhXlkCs0FB9w8h?=
 =?us-ascii?Q?usVeGIFyXYSdNUTUpklDLlhg+WCBi6OZl9SQImc9w/et3PPZZfRkByM+W6Nt?=
 =?us-ascii?Q?4OQn9LFqlX2B8cBaITFP5Le1l4CJeBrY471ugpqhKJyjfdAXGZU039eqXcpU?=
 =?us-ascii?Q?lXUxbi4E90hapiqrp6/6FEu+qJJwhKQR12fahledmu2M+j9HurXKOojZPs60?=
 =?us-ascii?Q?ezBjMZ26VrhQNr/qG4ImxowQt+6m0Xoor63wO9ed/fcaYMGnLaPNwIT0s3s8?=
 =?us-ascii?Q?mNIKSyzRgd26ZjFISMgjDMOFQEGjozPJIQikVbBJpZzjsfxzK8xdIZgNIhqm?=
 =?us-ascii?Q?TWGoFCgXZ9BDfvOLDlXOzoZ/wExscsp1W1LPkvah8ScSGt1Dd3DOfJm+VmGL?=
 =?us-ascii?Q?1rj6jUJp7nN/NLEWjjS0ofiAT6G5b8cTm4VJpDAA0tIaO6n3tbu4f8g8koR9?=
 =?us-ascii?Q?2CRZYsPxXh0qdGziCX7mm0JQ6WKkGFKdjXSGF+sk4JRzlOx3aID6m2an/ty5?=
 =?us-ascii?Q?yAkZuQ+CkPD4A6w2UilGtRrOLcltUjvRwZlLdyx0T9GpkQajVSeXrLfjYv5Q?=
 =?us-ascii?Q?9HTZYu+oxCse7FNpLq4VPZB2RYPiBVN7sb/tWtg25jeGwQof0iKN3ueH+2OM?=
 =?us-ascii?Q?0trjvWjDpSEf5OnjB87PYD3A9RiNRoONsRvpYTgJedHfUVG/B3Fx5vmpHBnz?=
 =?us-ascii?Q?qR1sMBDVtIp6+a0bF7S9nZ/TVPpzWdhd/xW/qjBUYXfkFcC+iIy26MqYUnNj?=
 =?us-ascii?Q?/nHblr5nFUD7fHj2n+UKVRKp0nhDene7BB1Y9LIkJKMNUB9k8yb0koqbafaO?=
 =?us-ascii?Q?88seF4lx9j9cXTA3R4pO6nEEn0ISeatnOV7TLPTg6VvjBQEiaIhycZsVN6t4?=
 =?us-ascii?Q?UD9dMPJkczzTQPRIEf9nA4VIJAp5La82UUqhgx0o?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a7df1d-4704-4009-9d0b-08dc134ef0fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2024 09:14:55.0864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5T1DF+qoURniPKiiqeqf12Z848kCYzU2zXVJJIaDolMcmJtxEkWxFZseNJ8yYeyfZdQo4r02cfQ9af0RUxWPCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6650
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 09:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193573

Hi Alex,

I'm upgrading my layer from kirkstone to scarthgap and observed that my ima=
ge failed due to gpl3 license.

I want to conveniently install whole alsa-utils except for parts where lice=
nse forbids me to do it.
After your path I would need to list all alsa-utils subpackages except the =
scripts.
And on top of that during every core layer update I'd have to check if ther=
e is not a new one.

So from this point of view, your statement
"There is no reason to keep the recipe separate: bash dependency is not a p=
roblem until the alsa-utils-scripts package is explicitly installed into a =
target image."
Is not true, it's a problem for maintenance.

Would something like this be accepted when I'd submit it?
This would return alsa-utils package installation to status before your com=
mit, while still keeping alsa-utils single recipe.

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb b/meta/recip=
es-multimedia/alsa/alsa-utils_1.2.10.bb
index 4e5ed8dfa0..5f4048938f 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb
@@ -56,10 +56,10 @@ ALSA_UTILS_PKGS =3D "\
              alsa-utils-alsactl \
              alsa-utils-alsaloop \
              alsa-utils-alsaucm \
-             alsa-utils-scripts \
              alsa-utils-nhltdmicinfo \
             "
=20
+PACKAGES +=3D "alsa-utils-scripts"
 PACKAGES +=3D "${ALSA_UTILS_PKGS}"
 RDEPENDS:${PN} +=3D "${ALSA_UTILS_PKGS}"

Thanks,
  Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Alexander Kanavin via lists.openembedded.org
Sent: Monday, June 6, 2022 14:01
To: openembedded-core@lists.openembedded.org
Cc: Kanavin, Alexander (EXT) (Linutronix GmbH) <alex@linutronix.de>
Subject: [OE-core] [PATCH 13/21] alsa-utils-scripts: merge into alsa-utils

> There is no reason to keep the recipe separate: bash dependency is not a =
problem until the alsa-utils-scripts package is explicitly installed into a=
 target image.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---

