Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801C8C88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 21:25:40 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7221.1789334739264925859
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 14:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=PMawqiwN;
 spf=pass (domain: siemens.com, ip: 52.101.65.7, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJ6vZaFP8IL5mUpi3hmEku9sp5RAYcUEUFIXeBiSBnODG1MvEAYlv7pniMW9SwwyVyy6nprHUfktPytTreu/Gz4BXXZXCHIHhcdycncSgbKa1u9YE7s9u/gD/HvgjX0kWh02V1t+5vInpN66/SdMWtvSdOALK9Z5HDMYtC86BVZKv+Kniw+rVrLMKhmP8L1O12HluwI3aY0/ik0UwKXh3b7vFxpJdQCVOgJx4im0hbdmyad9ptGegnkSVyNNlMsqy2fuIFUBpC3OlOlE/Zp0F4OCDIuqACb2S9Qu+aGYHnjhXyao0UyzV6eRJRWJz+73i154TNnwyXphHT6oQNib/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykSzhY6qSnTT7WDnZOwb0Kp+ePstpdCcEnUDsMRONMw=;
 b=hcIfvRYJwTRwiwXMX3wXTjIeoNz1DSzg869tXxFibU65dkdzXSx1LCc/eeu9BHBAnZ8I6+QVdo0iPLZ7+hmeHqGtmp2B12+giz83SW2/GankE8f3LbQR5p3ncZU1dMis9ti+OJMKeB5AwUCP3nkQC3DN5OdvkhrPHRJYTZ0OBIdYxgRkZfMucCIWyBFkWfDcqEYGfD8bKD1m+dgBPrfWBogtmR5sBHL++VZhw5TZL2wIHBTtfbJKKBStkQBxgDZap+gNc2v1RwhBdOvFG0U1ADICAVSXtfTrpQ09o7Qbr6XFmJ7Sr/euUe7ALZw/0JtiH3fF3rj0BSA5AIyhv0yUfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykSzhY6qSnTT7WDnZOwb0Kp+ePstpdCcEnUDsMRONMw=;
 b=PMawqiwN+DOlU/TOK94JpTCLPox74VaZfAbCx2drk8YmLdWeEFLNmO1t2EpvurtkKD///WJZSZT1amnalg+CzGK6rjYbNUDYRu7x4aaJQV4SFulpz37miy7csgStI64KDw5rHAhWKw0KWwnYPW6cAFlxky/yHJmTbtK7DFzo0aqeOj9yW8jrtaNrx1eLBY7FENp09isVbtwtdTQ5tpmE1E+T0hq1NJ/0tWnXnj+EV152Tz8Dxq8WhxZnaQnVpD6tDXEThVSOzNZVaWNqCDGarBCS3KVTLhMRdKJNpqb1l4Khwv7hptkj6e+GTzlrtUDvSkd8X5lxSGtfekAOVOpSwQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by VI1PR10MB3565.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 21:25:33 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 21:25:33 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] libpwquality: import recipe from meta-oe
Thread-Topic: [OE-core] [PATCH 1/2] libpwquality: import recipe from meta-oe
Thread-Index: AQHdQcrLiUL5+Up6hky5m1JA5uiGirbNCJrA
Date: Sun, 13 Sep 2026 21:25:33 +0000
Message-ID: 
 <AS8PR10MB5073BA08B6580E8F89299182FDBC2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1789116540.git.jaipaul.cheernam@est.tech>
 <e1d67ecc9f9f0acf2c15207475576d8cb192ad01.1789116540.git.jaipaul.cheernam@est.tech>
In-Reply-To: 
 <e1d67ecc9f9f0acf2c15207475576d8cb192ad01.1789116540.git.jaipaul.cheernam@est.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2785ae35-41fd-46bb-b05e-467dbd4c090b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-13T21:23:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|VI1PR10MB3565:EE_
x-ms-office365-filtering-correlation-id: bfb9c8fb-8d11-448e-4eba-08df11dd8ba4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|3023799007|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003|55112099003;
x-microsoft-antispam-message-info: 
 tvrKV/KF0NLdj/xLZ7TpnZ5q0+tj7jgF+VhG87SU1w2Ea9nEF7FQ0y2vhOc6Z1qcwKb6ezgOwvWcdGXB8sIj/t+n+s1+MpWRJiVZi2atbEwI8MD7rgCoDP1w3ptWs8SJtvN8L6/EbP1RVsDwYNiSRpV1IFxa41xQFqpsFefuCUfgx64G4w14YKT9qXcXWSn3M9Dw2qpO0/YDdI82Jm7ib7Qkels6lHdfKf74ozrQAYY9vvZ0TPg20jb/SwYyheA/9AIda15xLs3R0AgZW2UTj/5z+sF0XHn1E3fevLYC7JnA8Z3LwNrEt0Uiqb1haqEmiD6jPuIHi71vEHSDqeF/0L/G22AdAAYmQB8NJvDPATvmP0/4SVsjMIJIuScQLxumnVI8PojqMeHh5kA2jhI3pGArr6EW6FDAI+BGJ6gxGAbr66AllxlC8dLJ/bd1ORjf8LwvQjhCRu/VOe6v4wPwdvaWAx5EEQhB4s0+4Z65m8FcMCvSUxWajFJKNCkZh9YQqBVTbdL6FnDPs8xXf2tRUKGiczhdRRYRQ92n2mNgVee+bMXnMztWc6w+HXVgwGED4JIILR164wrQsDGWHTrHW5YMqXKN8v97f+d0lCYq2Azou7enu+7OkjHmp88/7AMC2P6pqmsr7u5raD/rYQrXjQhdMXBeeGt+Op6b0pq5TltHui89XO2QXfYImQchRdyalPj9nnqRp8JrGYaXh850ztaFxnq6bXrwT6FBH3PZtJU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QcCvwfjA0kwKRWDTUgtpdV6GJIJzL0khESuOaKRmB5ltRt9Kb+8/DwMOvv8E?=
 =?us-ascii?Q?llMhYrxjx5dM8/2k9NjAdHq0lWSrH+1xhWJBG5Ds/guMG4Ed6nZtBoCCAm+7?=
 =?us-ascii?Q?h7F8AlgCVraQVIjzK4i6psGyXJDUa4hj+B8lAu5tBJ1sKUqyRadGXRSKV6tf?=
 =?us-ascii?Q?D/jokbvTo5PzQUr0q0/UggZinPlpKMRzEo+RCnLzop2Ni8NHfCbgkAFncjR+?=
 =?us-ascii?Q?iCOwiahG3vUsp7R441MIQ2DcAI+zJkK8pHs20RsTEcp65bfrG9paIzEpfLXc?=
 =?us-ascii?Q?6p6VqCUPY6NoOTekIR5CBjACs0ckiwbpy/vWMnTLXihQdOKQewURNiFLGDG/?=
 =?us-ascii?Q?VQ8xaFC2wcO+MhjTCveGhCy0SPskd3+aVXiHWMSMpF0R59fqEY1RamkQfdZE?=
 =?us-ascii?Q?vh2SmPIyvmLvAqDFQGh9jYKKWm6pUeAE2BxpZ88qMHDBPc3pw/131SEjqFKR?=
 =?us-ascii?Q?q9ODcYVRY9X/JNrvVZz2OOonrC55zixBgdsPjHL2DW0MjJraS9JIapLXezwf?=
 =?us-ascii?Q?VrWwMtC+deI9OV8Br0jltoj/RZ1uAv3lllRfnFuvGURf0cFb7HAlJ/o/RYqJ?=
 =?us-ascii?Q?urjgkVd5RNixoMxZ872+v30odI+o2hvAF+9qNraevPicgz5nVtDxnNZzdpvZ?=
 =?us-ascii?Q?qzrXBQ+ILJC72PmFipO4cID4dv9HQhJnmPJJrhtnbr2QhetsSET9e5QYVwp9?=
 =?us-ascii?Q?7BvD28dsNRG7qzsYZUCK7oAfOoKcB5WVOPjIIddWB2tfNZ7Uc8sJK+O1Zw78?=
 =?us-ascii?Q?DELnEQj7r1oqhpGpT7TFGgJTuAKlaD7o3hN010lrquQ4j89wfQYIKc4GPsJn?=
 =?us-ascii?Q?AyYm2lEh5JZuuDiHnQgBSv3Tg+HU7v8nNaBjrEMvPJiu3GC6bdnm+a7enqsR?=
 =?us-ascii?Q?i5JGtW8wQfN+n7DGaMn5pIfaLP1Rr5fs3L4kyGlI42Cr5/rYiQFxGoZfE0Ds?=
 =?us-ascii?Q?8kK1jj2dGjFN3rSQgAbeCVTM5bWm8lf3EIQJcyE7ebJg4TRi5Wjerbmv5kQx?=
 =?us-ascii?Q?ufaF5C3oyGEBQYWkNsPiZU5NauPOeQeNSlEuoIU6u+3k0AYmyp/EMWhV279A?=
 =?us-ascii?Q?bxtMxECiYlm8wGMw1/2sK3mE3F/5EgHFn7b/mNRkzjnqFqRzQQa52vcdjHoJ?=
 =?us-ascii?Q?4BMPpiGl8o3JV2XDL40wW68ryd8sf29/oBkhxUDamefvRgqcocud13vUPW3v?=
 =?us-ascii?Q?qFiaoYoKK+zbmrS73eodhSOdfLWlLnDCNC4ieEjpi15ErViPjWjEAd77qVWh?=
 =?us-ascii?Q?MJWQVUx8FkF74QESzvy3ENxw5AonLa5E9F+uBQGhlA8xVZ6LzhvHMhC3DHVy?=
 =?us-ascii?Q?b3fvRu8iE7PoLEtc1qI6La1gwjrJA0uLCuOo0l7G/HF7G00/RIb9ah2mXUI+?=
 =?us-ascii?Q?pzRFVltVlsWG9PII5nkyt49VRxLZxZe8llwRSpNpNWLv2k11s19lDEgTne+A?=
 =?us-ascii?Q?8a3BaDNL4dfrnkwCnc9iz6ussv0hc9FUZf+WF7Tzl8LXfpxVhqnd8els++4Q?=
 =?us-ascii?Q?uJHZeijB0NtdoYQrEKDiJEzRqCWBB7wBl3PUWqX4eS4gTdlehMnYosRkQbm9?=
 =?us-ascii?Q?3yB5Sqdh0fNbW/ca8jJAz0YPyekSGRsZOAgdC/LY/bXgQp3TyiDyoU53twpO?=
 =?us-ascii?Q?NhsqV6AW6+kduziMmRZUZBlPklxTl1nOSTnhUPO/f+jiO+MU3prdJ14Frvbk?=
 =?us-ascii?Q?QgA/DWFScLvibZHhBl8H7v4avJUB87aRFeodlNF+ZmXdf6mILKClWB/tpyqR?=
 =?us-ascii?Q?+U2A9qya2w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb9c8fb-8d11-448e-4eba-08df11dd8ba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2026 21:25:33.7953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yx/NG2ld1OnHwH2zgVZcZfLHQewzxhdESiBUwprcui8URARB/deDJJqMTVr+h1s0YfOA3MSFAK4KPpYO8VT/5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3565
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 21:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245743



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Jaipaul Cheernam
> Sent: Friday, September 11, 2026 10:51 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] libpwquality: import recipe from meta-oe
>=20
> epiphany 51.0 adds an unconditional dependency on pwquality [1]
>=20
> Changes from the meta-oe version:
> - add SUMMARY (required by recipe QA in OE-Core)
> - add maintainer entry
>=20
> [1] https://github.com/GNOME/epiphany/commit/683e9a076fa3
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
<snip>
> +SRC_URI =3D "git://github.com/libpwquality/libpwquality;branch=3Dmaster;=
protocol=3Dhttps \

Please add ";tag=3D${BPN}-${PV}" to this SRC_URI entry.

