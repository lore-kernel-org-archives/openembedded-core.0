Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BA6E77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 12:33:39 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.89])
 by mx.groups.io with SMTP id smtpd.web11.9306.1733834016292053808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 04:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Zu7f/nTv;
 spf=pass (domain: siemens.com, ip: 40.107.103.89, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=at0Te796OaA+LYUNzGc4uWeuxhwBd1TGEWbzoP1y/UuDYECr2DgC3lP+sMt19GUZC0oDPSNGwtb76tiXeO1LK7BgRaC+m7UejYNv775aITYkv8Mkjm3XKlBHJ/gloHifIwSj988XibCTj3KXIFctfDn+SIuNtZnzbAfOXW+MZErtLJR/ELHD8sHvbkVBd8qALzY6p7E41t0NAYbbNrK4qxEp/pB1G4Fi/8O2/8H87eUMAlIyWQ+lZ97BuMQ43kgzfj+GqA34y5v/EmjvTZwIXkWSw0bI3tbrXkZsbDkax7ok8xFYo5eQ8zsLsJWBSh7OV+XoQItqYldb6Z2v8FnFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BuahICf8P8uv1pbvSTe45I7RyZU6DTACzTbEAVFcLo=;
 b=bxTjgjUadpE0nYwiv/cu6W84s0HEQxyeCTsEinKOkuPqc4Hwop3maFetMvtrbR0+ScTNbN3+hFeFHWXOtUSDVrpBD651aS6PxYY24oqZHahagom+bn85HHij0P+iK29Al3g4HxggBhLK9bBq5Wj0GbnaDILO5FY2jQf3ImEDeP29l/YtxTvRWnmZizP1EQdiM0LfFARVQeCybWwoAR/RRsrdMHKG7TFnHiQnsXZum3BDXhubaQ3XZdAgApGNQ+fHuRjbTgIAKZJzfxt9qjAxQg/00cwHQ3hhmTNNNseOc0uGSThTIJAZamhIlINf+XmQ6B42XrZHu9gowZMrgNNr6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BuahICf8P8uv1pbvSTe45I7RyZU6DTACzTbEAVFcLo=;
 b=Zu7f/nTvFxGGui5MVT9vBQKktE/A0egpEwMTAn9hfngAR+sKdd5IdrUMwXxkIYbjl2VWGs79Hv7Vebl1m5TDd3oLUJXrWW4bfPw4Ow+AjRb3pFh0N9zg4KZG5H8Hqan9NZk1UT++13xJStQH38V1eliKVR9xeed5TM8cvqWaz04saENZnJHcJAFLdTKokb+tP8AePsrWdySSV7t+2UxVvQwgeIZ+n0WKwVBlZIVUSuqQqh1eG3R3P+NivQVVrKdmFLvDFxEi0IdbAN+X6FB+e50tyiZmzCxQVlfBmCUFKmDN4QCsUAhlmFhREMSw0SWPpHj4HujIB0wOR0bDm6VK1g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB8443.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.12; Tue, 10 Dec
 2024 12:33:32 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8251.008; Tue, 10 Dec 2024
 12:33:32 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: RE: [OE-core] [RFC 3/3] cve-check: revert to old NVD feed
Thread-Topic: [OE-core] [RFC 3/3] cve-check: revert to old NVD feed
Thread-Index: AQHbSvmYNhHmZBhLb0eKEtp6/qwKyLLfZ6qw
Date: Tue, 10 Dec 2024 12:33:32 +0000
Message-ID: 
 <AS1PR10MB5697826BEDC05432727D5678FD3D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241210114839.1579228-1-marta.rybczynska@ygreky.com>
 <20241210114839.1579228-4-marta.rybczynska@ygreky.com>
In-Reply-To: <20241210114839.1579228-4-marta.rybczynska@ygreky.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d5c6232d-6569-4e53-adfb-26d6d1d9c7d4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-10T12:26:58Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB8443:EE_
x-ms-office365-filtering-correlation-id: 0d86cd32-0683-462b-06fc-08dd1916dbee
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?pkKx47q98ptZC1ZylOk2/owRONzJbpUz/AbqXESpjNLnqA5RCkNeE6FrpJGI?=
 =?us-ascii?Q?wYwp07LUqBCSrvg851aoIyQmaS1zBVMMu3ak1RlMjGXXgXjmiYllNFVkg5bb?=
 =?us-ascii?Q?4UwqTT3Mbo2qXnf5pAasIp6N8SklZb6IzdpVDWRO1Lnb9zFDJqwYWpvT2tR0?=
 =?us-ascii?Q?I4tPtSgKZzWemvJxDvHithr/WiyFR0oypz7/xdcKRL5Q+//1jUMcUp57k+ST?=
 =?us-ascii?Q?NpPO3RjVgIAfQSyLDUVS5+pPG3ZvlXkchoUerIuJYypSVoijRwX5p9brnv5W?=
 =?us-ascii?Q?IxAHIO2XD31DHK7LAYB2Ne0XVnlWC/B/S8Od37EyiDE1bwz9BAJbMzQuVArF?=
 =?us-ascii?Q?wbyGYsSTaITlMBQl9WIBF3RBiW8iNIqP31YW8lhd9UCVDCcKpTUyK9jc3m6v?=
 =?us-ascii?Q?AzGCnmWQHK4wleX3aJOh0KPw69JUU8+C4O6yqUpd6fjEuOVo8aZCMA4eUioR?=
 =?us-ascii?Q?4ySYUGhRR5LSqYlZpRZart5uEqr5M+j8RKRQtxROKRmHfdsXr6Z+kyIITPoe?=
 =?us-ascii?Q?b1vgZCOzT1/wIKiCHHoOrZ6SL41kwboq84g+ENVxchKBvwBUpyr7W6wOSBrT?=
 =?us-ascii?Q?YhNDMhXAsCsKYAyL1SqnxIInhza0So/5hQZq9v1kQmEndzGpLCSYG1BfjWjH?=
 =?us-ascii?Q?kO2hJ7rTtoPtQOuDe06nI0uf0RtomvYGagyGN2I9HovBdWR7pjPg3iHYeMDK?=
 =?us-ascii?Q?lGpEHUI/aRM5ZSO+l8MabqHmcAzitx6youAlY8A0CMPBI6ZRGVIf/qj/6Vb+?=
 =?us-ascii?Q?HfyDTO7pFuR95bNJQ9mv2FT6gyxxOZy10os+D/vB2rKOrW+1xDusD0NbPFkz?=
 =?us-ascii?Q?Nj33k/rqaom8b0dSzhCNNIu5MHncPQzyP537I19KEsyxOAnjJLZ+ZZsEegnu?=
 =?us-ascii?Q?4Qm+tCRJwVN298X6m503ZLOqJEav4+dBD1259pjSpulaiLqSLUPtkfxLBnNo?=
 =?us-ascii?Q?0ecl9xwwdcuFyT9uq50td8Ho4aLR+aLpMLs60wSkTifBgV7rLjSMbDQ+IFOP?=
 =?us-ascii?Q?l0DXD9y+16Wj6xDWzGI17DvnhGMGkocu7EtdopZtUODPVkz5WvcTl3qERoEu?=
 =?us-ascii?Q?TK7JdwvuLcT+Qaa5+3mvTLgjchIPmRYdms+fgbuire8BlDGGzOD3hXt6WrJ1?=
 =?us-ascii?Q?FpEg9HEk9L6lYJPwtquj/b+eyMpN1qJq6bBwrFThuybpLYllCgeDJKhzqj1J?=
 =?us-ascii?Q?Q0m3AZx6BZpupbYXm47tP6EaL1KHVMz3chaMGx5gxHgSXRcXy5OeL6o9wSqV?=
 =?us-ascii?Q?lLQXq4nPZUu7NqX+Yf0iDuXlo5FK4GRMyCH4q3lUcvU9+orOplZDB1uTCiqg?=
 =?us-ascii?Q?MGIGRxOp7imUsz6B73a0M+YsKfn8CWlz3Q6FqAjNFFw20G0V/iU8YM3UHkYb?=
 =?us-ascii?Q?nNAv/rqAi0zWo0pFeyTlXQhZfGf3xrf+J0q8XUE/HWdmsIfrNw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?q7SzZdh7He4ER5vukMcE091FXT6myKqFbxszuXH5/MO/pmJ6Q41cHCLWz8V4?=
 =?us-ascii?Q?Zo8vvaQCb5Tf9NxM6nbsAcak8+dlhBkwXYRccL3XaHpM8cx7sIdXV4j7oNSQ?=
 =?us-ascii?Q?ccKx4n3aUnaEvBbZHmyBuI6Yc187bzrbtp3gSM3ZT//GpdVGp0109EpJ3Y/l?=
 =?us-ascii?Q?uudjG8NRPpRsP+KDybvQyjUiS+TM+kyvGcZU8rjJ2dwGvJSMt+cKIQVrPTxA?=
 =?us-ascii?Q?fFB/JdDvSE8ED+uM+dPObIrK6TciJts8BFFeNpgF+LfuM0YQP+7RGH47FL8R?=
 =?us-ascii?Q?tZCSLZw4D7B/clLw3c8hw6Ak/vCMLY5zAUoqbJTQAzq/rA9R+DmxH+a7ZbDU?=
 =?us-ascii?Q?bRDw8Mk51O5jf87rNB7Vk6Dyok7oE+nrJ9bAJAZXxffklJYtmwth4pIKi8vC?=
 =?us-ascii?Q?tQ317nMdQUtywj+ypV+yTqqS8FsufwbKLESgqc2i+RK9y1gbwmyWjGYGLTKo?=
 =?us-ascii?Q?jxasSmFhTxbIko8Vi50epW+8byrIJmDs5+EO10sEh6zl9NKbwuJMBKtaxdAu?=
 =?us-ascii?Q?kUki1gdcVVWYEgo7CBn4+sD9MwNic7Rm4xcy2Rz0WHWboNIdC5lqsZqoGBih?=
 =?us-ascii?Q?RLZPrC4A4dyBKlOhuFM32y9rXo5LNLtEPuNWNyAV01jCuJfQZfe2+BUmndrU?=
 =?us-ascii?Q?9+cge6FBNg/LetwxRmoIiQvFIB/b93EKJaD8lFH4B4wliIGsgxBsfJqI2mov?=
 =?us-ascii?Q?2zjGjYYRo2yYNU8VfkjAE9xzqbMEuwSG8tInzJ9tflCYU+zDBFJE7uZtCwPZ?=
 =?us-ascii?Q?/65Rq86zzVhJxPLxZWJTYQjNQMVIYZr1pVtVPJa9cHsQRdto9FRgPR/RB+6z?=
 =?us-ascii?Q?xcSP7MY5PeXciCfmwSPeiHk0wO/18M7R8hP51kK3xhFk3ZTxdRH6W29tgg5G?=
 =?us-ascii?Q?HIFT5mW31frfoCTS044Vale9vwdd5EVQXhmawjVHfyIQmCGMuzUKE4IKW0+z?=
 =?us-ascii?Q?9zBDxnNyubhWWAstwdybRqiSOAHzKVcum3MGCSYD3QUEs0RKmyVx286//Xoj?=
 =?us-ascii?Q?6zOwT2V2Z8AmUv2hNyAIcZZx3lu/2MJgnl+DVMYT8oYK4CNqeCy5RZr+OXcX?=
 =?us-ascii?Q?sNyr1GHFuY75rEMBMW6fB5XwhXATz+Od/pRPXWDjZuopEC6j6nNunJda/AE1?=
 =?us-ascii?Q?HgqEOU/sABocLyQyHGl3HOloXj53NlQnoBV96rWq+4xlYz6EGymqwmO4Qmz7?=
 =?us-ascii?Q?KnKCio0fUSLKxXE2T29guNtnSuupxhejz6qjKH8gRWxoeVIOEWOra1EuOwYc?=
 =?us-ascii?Q?Soj54rmoINIib3D13HZ7H74gaYJdX79ORnt5WvtbJTdD3vN9tEc7fLpId8qt?=
 =?us-ascii?Q?1FLmUIjwGkAqTMYR7ak52weCY3F4nsHPEBPP8EdceCkKDgCbZ2Za40sm92cM?=
 =?us-ascii?Q?cPyuZb29HSXqlxoBThCg9+znmyoL6G5JGSKdaJsTiMZTAd3UD5ZAn93yIlP1?=
 =?us-ascii?Q?wT8dKiyRT1SQbPjCeI/HM5qO39UCA9Rz3FutJhHf56lAvBsKl3B8MWi1Pj/X?=
 =?us-ascii?Q?Vf24Jz/WFDkhBDcXqZy+JU5ubkmiJ98Ux4YTHmREfcMeZXbDFhZv5bza4hKI?=
 =?us-ascii?Q?9Pp10yGfkOlzP5iFWj3spbZJXsJyNEiurrM1I+gB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d86cd32-0683-462b-06fc-08dd1916dbee
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 12:33:32.6136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1KG5JzkmrqtglX9SVMXm2vSuXtRLG+G83nBk0c9tb6S5cSiIK8nJdyfRgrcXGG9qZCF4/S/CcQB0HWQ9o0dCCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8443
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208530

This should probably be made configurable so we can switch to a source whic=
h is reliable/available/up-to-date at time of build.

Maybe something like
CVE_CHECK_DB_FETCHER ?=3D "cve-update-db-native2"
CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if d.getVar('CVE_CHECK_DB_FE=
TCHER') =3D=3D 'cve-update-nvd2-native' else 'nvdcve_1-3.db'}"
do_cve_check[depends] =3D "${CVE_CHECK_DB_FETCHER}:do_unpack"

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Marta Rybczynska via
> lists.openembedded.org
> Sent: Tuesday, December 10, 2024 12:48
> To: openembedded-core@lists.openembedded.org
> Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
> Subject: [OE-core] [RFC 3/3] cve-check: revert to old NVD feed
>=20
> Use the old NVD feed
>=20
> Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
> ---
>  meta/classes/cve-check.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index 6e10dd915a..7cc2248faf 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -31,7 +31,7 @@
>  CVE_PRODUCT ??=3D "${BPN}"
>  CVE_VERSION ??=3D "${PV}"
>=20
> -CVE_CHECK_DB_FILENAME ?=3D "nvdcve_2-2.db"
> +CVE_CHECK_DB_FILENAME ?=3D "nvdcve_1-3.db"
>  CVE_CHECK_DB_DIR ?=3D "${STAGING_DIR}/CVE_CHECK"
>  CVE_CHECK_DB_FILE ?=3D
> "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
>  CVE_CHECK_DB_FILE_LOCK ?=3D "${CVE_CHECK_DB_FILE}.lock"
> @@ -182,7 +182,7 @@ python do_cve_check () {
>  }
>=20
>  addtask cve_check before do_build
> -do_cve_check[depends] =3D "cve-update-nvd2-native:do_unpack"
> +do_cve_check[depends] =3D "cve-update-db-native2:do_unpack"
>  do_cve_check[nostamp] =3D "1"
>=20
>  python cve_check_cleanup () {
> --
> 2.45.2


