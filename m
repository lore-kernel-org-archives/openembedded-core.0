Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EEDD2E03C
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 09:48:19 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.79])
 by mx.groups.io with SMTP id smtpd.web10.5000.1729676890961524364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 02:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=mYF91md0;
 spf=pass (domain: siemens.com, ip: 40.107.21.79, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYyWeo220mGUKqHCs0paH8VMp7CNWd3vquH8ZQt0LhSIHBXeEJxRaQgwjnTHcXrp3TH3dpwQ9+J0pEBRwMX1ER5jFxpVX3ZQM7qeI8tuN5yc3VrgCJwDPnmN3jXRYHZx6uoY4DW9gyeD1NoqOy2iOiOxnsG76qdaqhHf8bbyagZdX/4czeQZ5O8S1nNvL3nYlWdEsOkWhhcTshjblNc/trm3/VPG8LFbA7fVaN2FYgr6ZLTGCAdWb4ovxJh6sIcv1P9XsQ2hTaj2oD0Me2gKfRo4EQC1C9GZLZRkdiVs2FjV+eW/xi1rKek/F5k+pCvL1ct0S3YwFb6+ul2Oborebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CY1fziWmQYgYD289A6oMdrk/waY+2vwLxgUgAv3KuIw=;
 b=ScR5U3Gi1SoxFajBR3Aw3Bi6hvakuscxMActWOOdoUSu0Kjn5lVu+lqhxihq1cU9lal8FO1xbd39KM/lksgkJjGjme1UdH2xbF4SM054b271tcZ4a+4SdM3l73QPwRBDwh5O41kDwvC+KTm0QJCarFDt7aKHSOISuTUtQFuOPxD2QIceK7FvZo22fahjCL59MaBHcVwEs6Ku3/rkd6ARiwUVSvkE5Kx0i8ZZ4R2y6J7d1dGqOaVqilkZwEdqvzDvIrPdZ/N0fr5CXzafISDshq/hJfYQVUkSt3Pp7jLIQ23C5QSBBufMkRWYKjutr53OAKD7ht7ck/7zaA6x9G5Erw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CY1fziWmQYgYD289A6oMdrk/waY+2vwLxgUgAv3KuIw=;
 b=mYF91md0fIz9pyYl9wLprBnnFZz9sNIyvkYGqNQmyGot06uZiNbi10cvTYmVRvNa+HT82+PqW6D01z8Vs6pbtOMjJUQldXEmAnjlFQ/GtIXX6Om5mHuliSjtA+1pljaA63002ZdmB32r3QLVcSFwiEE/4po82BolNNESzZKWIn7p9TJu4LK+N35SUug0Oy+cSiiNUI8TAskGY0O4cVZ/KkH5LeiAYyBzYse5FUsJnAdzmN2/TlrkuoFlgTqF/E2o9SOp3dnPUPtD1SrUFoO6XM47reYLLoj2FokGFD4pXnE6TFJ1T52ef6Vs1SQbyAQFmyXFvPr9b+ek5DndP7va3w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PRAPR10MB5375.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:299::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.15; Wed, 23 Oct
 2024 09:48:07 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 09:48:07 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] cve-check: add support for cvss v4.0
Thread-Topic: [OE-core][PATCH] cve-check: add support for cvss v4.0
Thread-Index: AQHbJMld+a4MJXjHNkSs/oO99nRIyrKUEgOAgAAFdxA=
Date: Wed, 23 Oct 2024 09:48:07 +0000
Message-ID: 
 <AS1PR10MB569724F40D327EB012F8B0F1FD4D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241022212750.25402-1-peter.marko@siemens.com>
 <ZxjBh6d36lQ38iTI@bootlin-mathieu>
In-Reply-To: <ZxjBh6d36lQ38iTI@bootlin-mathieu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b9ee8f54-dba0-4507-893b-e6e5d24ab79c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-10-23T09:47:08Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PRAPR10MB5375:EE_
x-ms-office365-filtering-correlation-id: ead3f02f-8d8e-4cd6-a0d3-08dcf347cc13
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?50tdp4snS45GZTEifqbwckWHIf7IqSe8LJhybZ8KKFtItKyDoFHqQf6wMsFk?=
 =?us-ascii?Q?jJimnLN/xRFXNxfzLFbKU9+xApNs1T3RXzVecEBEwm+SxPqj9jnS6Mc3j0QN?=
 =?us-ascii?Q?t7FITka9xul+Coo6HZ9+kXeaeK7tpb0p7sCTxKo7FtLfCmCSbP8mI7ixIWui?=
 =?us-ascii?Q?zEmd2vH3zh/gqzfA/JMR2K7xSeuTAJfE9bGnU9hUdSj3jBR144qYDl/xxskr?=
 =?us-ascii?Q?QTGcZec0WgK4yZJ4HStNyB8ZP394QHe+JBvDzS8aSfNysKujk7NAVrKeb1jc?=
 =?us-ascii?Q?dR9fcGfYCmXgpHnMU4e9+6yfiC1IZKpDdu3K/lRigh5ungbJIejqfVp/oFyf?=
 =?us-ascii?Q?uyhzo0eRipqCi+rJr7YYhRfHNK+9Ghg7OCZrSEFsy9QVT2E+lR+zpGdQbzie?=
 =?us-ascii?Q?V10VKL8J8m0yF6kMCYq15Pdk+ThfbPj96d356p1tdaJvyIfLKCNcbk3KHvXT?=
 =?us-ascii?Q?GpiRYW4FXRPMyN6FuNh6wjmgjVF9q7Adm9hpE11AmBNl1gx/x42SfSCujfCJ?=
 =?us-ascii?Q?kTODM88drnS3VeBl8D1xyiPfWFAi+d52VFjztfxHmCwu8p/guueU5W+maKPM?=
 =?us-ascii?Q?1iMnVK044350R5Cw/t5szyOd4HpTdXT5HZg+A48JqKiYNQgVPXaFYy/9F3QI?=
 =?us-ascii?Q?ubIi9l0Z2uqqnEnUc/sKnT8sSz9cwXkmUv7RbB4CmsO1NLpGyu//7p/pTe9L?=
 =?us-ascii?Q?56JDHSdhpBWL9oIkiEIqGKkDTu4VrcBTZoivwtZE+teH1SqZpRIGz3CNQ3J1?=
 =?us-ascii?Q?0kpqaXnyczqsHoORRWfw8UeflIcD/51axIpdND3Au81us7YCM5n5MJvlsWfA?=
 =?us-ascii?Q?+BUHUgjIQ7F6qGyEzaGu+KrKdw//pup6pk/sWVeqO68kMjuQdyBF5mKvzXH3?=
 =?us-ascii?Q?kXV/RSluOq7jB+2ap+leU00Wo5jJ9SvBy8y4RS+9OONzdmhkf33/r8GZeCnc?=
 =?us-ascii?Q?3M0adh88Daw7BB5oIBWEnLF71GYoIg6lj/MLIdxj1cLHzHm2FVD/7Q1VzKCO?=
 =?us-ascii?Q?xLsLihDNu1+R5XJg60rg7VLXBG4gtJBXD5D5u7oLZRv7zNKGnCqVja2U7tTY?=
 =?us-ascii?Q?ozDC35icOdwXqhBbqIQC7C8epdReQ4UFNMA3tSCX1o/AZbkcj/c4wA3VkOzN?=
 =?us-ascii?Q?jeJ02dt5MzFcHQiwkPeMDh2O/XCxJfOH7UTh8hcR1JgZAPwUMhY5mqXB6Nv1?=
 =?us-ascii?Q?rn0yBXYK4troKtO8k9hG/ZMLV87swL5zUfR+fxx4TwIWxiNpgPE3cCoDHjRd?=
 =?us-ascii?Q?3ZcO2awz/H8nGEa9IvmdF6MEqBDvlrOdMzTxq9xQGyxX8KJCqAuuSNdBMAWh?=
 =?us-ascii?Q?uvczmg4w6UkWcV3LjnTLaDIT?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bBGxd9Am1xr/x/CJLer6mDF8eq0jDdEvxIXhvvt4yWrIVoI9KXA0sfSe6WYy?=
 =?us-ascii?Q?pX9BHjMCk5Ei7mBDlyLz1+T8lUwkjNaZ7qRsO0MEHlg233xcPd/nWVQrotSv?=
 =?us-ascii?Q?NB1o5ghsl5s4xDJ+hIEjyPekVr8d8wGbp5A6cRvAGq7qC5N0xApMPeKRvZP2?=
 =?us-ascii?Q?1Nli5l+rF1n+zTL2bNeoGtq894AQNMuGsmIg4Ggac0w+jTvxM0RcYKVDvn2h?=
 =?us-ascii?Q?EOl1SvOzk1wUNQjrw0EhSSmX33ref3qSNB3xijmCCDIlhJ9XG26YbKd2OFgY?=
 =?us-ascii?Q?NgFnL8b/m4vJqwMDpaMFtk/vzTX0ZcmcZXKndI1ygBbiuw61GxnzuLiMw1TN?=
 =?us-ascii?Q?GNQmE2acozSUOPtfgnhp7kwNpL3zpf0KzOMvOj+vhYU1K3/EWjg9waQKSLWh?=
 =?us-ascii?Q?slKd3SU6y+BW2kHLA7ETYIT73lW1NksAwIV0QSWVv8PU0amKb78v9/MeQEvf?=
 =?us-ascii?Q?ICeB/7D0yLJ5oIxUELPsKSWp+q7x3P60FmRkFhsII0538+3ZBsnasd71EceO?=
 =?us-ascii?Q?cc3oo9GZhJgpuCYKivVV2BHoQHm7n5kYp7eVyxHRdK/EIKz2s+pVpd8vf2Fq?=
 =?us-ascii?Q?nwn7/BDGdjHnAJIy+87Yq9qNnaA134iCws7bQO/qacEadrdJhH3kAeuPRvDl?=
 =?us-ascii?Q?OotGn/wKdG8UXMqkoDSf+8ewsln0R7WlDQ3q8TWrWO6L7ZAvE/+dPZDtetTE?=
 =?us-ascii?Q?p2o4Y9XVgKZ2y1u86guEb8Q/6I30pPuNck7hT/6Ow5SlD7TlASL/Zx1ujSrR?=
 =?us-ascii?Q?tDXUUsVVGrC19WmhWiE69W5dHKxbTnxyJaQdNb20oT2wPxwSzt4sM+eXvBJf?=
 =?us-ascii?Q?BXPezr1mnxaiHaASvOIQk1i27JoMQNVoDke2fYw72sHmrMj6ZiM2kANA3KnF?=
 =?us-ascii?Q?C0SiUudbjmf0M+gYoB/d/bePZrGxSfYgMfq0TNOFv1GG1tLJRWeEpWjRXYXR?=
 =?us-ascii?Q?QI0ZAoeZyAs2mE1Kw3ij242lMWlLCSaIxOYEOidoRXhvaEEEc+BmSF423J43?=
 =?us-ascii?Q?sPujNPWYoMMz4j2a3cNOVE/sf6NdfqP1v6SEhd7Faw06o9t5EOFgnjEAtjbQ?=
 =?us-ascii?Q?iONj1IpDP8atOqj009+mkT92WZDVuXgmhJf2Tp+XCORl2m+Vu2sU7/6r8aEZ?=
 =?us-ascii?Q?Mi6rZqJiITXcny+Oje1tDyuiK1/W+xqOKEfXEW9zmYCA5QMv1JjKCH1Fu8sA?=
 =?us-ascii?Q?KNE1EY1me6Ywo59TpFEM9z4TnSwf+s8MbFWIgv3BBiKwfvCmynBZ52+AFIcv?=
 =?us-ascii?Q?Q/YVB9dETK6uFwptjKsHBzIkEfOntzxEDQRr8To+9JoKLVk0/gIRSstMU/qo?=
 =?us-ascii?Q?xRQ6ntudYC0CAkVPtqBgh+mZjU9Qsx2PQT8lV+OVnjfft92vxl+WKzy8xPK9?=
 =?us-ascii?Q?HfGebQjRBm12koVYYzLlRO1GP2IwF4QHw4ZOVuWGfVphTXEQqQHIxncGFtM/?=
 =?us-ascii?Q?hQ2AC24ZsUauWfgBi70aYUhmNH6KtWQNXJFXSQ0DC+bJov2fB4l9ZeDGTlq4?=
 =?us-ascii?Q?sAf7EirxVUUennSSUocBNs2dL/8wIjY1JvnnK5uMkr4OIOCocUh6MzzmgTb3?=
 =?us-ascii?Q?1JpoMYU4B1ViOypayBu6+IR7QNqU7l7WZWcSsisn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ead3f02f-8d8e-4cd6-a0d3-08dcf347cc13
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 09:48:07.1660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JobKFTfvArSWqdkgAVeEIcLMeF5M7O1BsFvxdQObhJ9AGUrZgNR2G9BsfcRpwoHpGJQ/4pt7Sl62ZVuUxTJJLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5375
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 09:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206193


> -----Original Message-----
> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Sent: Wednesday, October 23, 2024 11:28
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] cve-check: add support for cvss v4.0
>=20
> On Tue, Oct 22, 2024 at 11:27:50PM +0200, Peter Marko via
> lists.openembedded.org wrote:
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > https://nvd.nist.gov/general/news/cvss-v4-0-official-support
> >
> > CVSS v4.0 was released in November 2023
> > NVD announced support for it in June 2024
> >
> > Current stats are:
> > * cvss v4 provided, but also v3, so cve-check showed a value
> > sqlite> select count(*) from nvd where scorev4 !=3D 0.0 and scorev3 !=
=3D 0.0;
> > 2069
> > * only cvss v4 provided, so cve-check did not show any
> > sqlite> select count(*) from nvd where scorev4 !=3D 0.0 and scorev3 =3D=
 0.0;
> > 260
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
>=20
> Hi Peter,
>=20
> Thanks for your patch, but it seems it does not apply cleanly on master.
> I got the following error:
>=20
> error: patch failed: meta/classes/cve-check.bbclass:534
>=20
> Could you rebase your patch on master please ?

Rebased and sent a v2, sorry for this inconvenience.
Peter

>=20
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

