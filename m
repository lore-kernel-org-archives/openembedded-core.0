Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E42C36001
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 12:58:40 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.8])
 by mx.groups.io with SMTP id smtpd.web10.20469.1742561911318436823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 05:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qVXPECv1;
 spf=pass (domain: siemens.com, ip: 40.107.159.8, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acJKofsgTMhEwDFSwqLPBrUCWLOqUxtttsQk5AkjxNps1Qd29DyKalFPKdvpDyo7LMYBUJGSCD95crIb6jxvrE74+7DinHKmt3dnC4aY5ofTsZQAacVB6f3T5yFmNkJbROQwUrqdieTNcow/Tsjv30rcMbatyGur1poizoi8vNif+wmcSP+YrbSalyXGdaXPcVhKSHwIzRJEPKQ5qSSrcKn3UkSDIdpBdJZvIxmf34EgN/U1Isikl3Zy1pjIjXGaeiEZk5QBiQ6jSjm0Nir1uQOD7ZHJ1l3oaSwMetaZ6J1ZXS8dVvR+2S2lHSw/SaURYFbzlUsAtOMKtW2iyUp1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znVZL5MddJWUYsQXx3JfKGaTERPQt/QrqDA4f+GzLtA=;
 b=JdnRSCCaU/mwRvL6J8bGALwsZZXqOfR0JyGUZllPVZf6Zpwau1M8UlPKf81S2M9MzyLQrs+gOep+qnnF4q2lKGKNWuvoxUNVKLty8+FddimSree9oI0sgIgupCUUkEh+BbumkBw1p1ge/AMfReYozaPKcT9E5LcDwhSn3TH5tJrXF4xR6M41Dj1i1GVCe0Xir/6jJpdFSegNK60ntqAwSt1M4EshvwuBw77nZYZZtpN1Tzn+0v9rZtwSjDcU2FL46GHB5AYpJXYHwrAoypdHvs86Bxw1KeR8dDDuIje8xLneV1Ze1HHCMJBMGpKrVj7Zy2C2mb9mp32A9KLa4C0uAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znVZL5MddJWUYsQXx3JfKGaTERPQt/QrqDA4f+GzLtA=;
 b=qVXPECv1ZAuGZbkY8tXSq0PN5f1r908NTZrKKU6VFTBTo+tMpBBiyqSr8WQCQfmoeMRZxvLr84Z2P7wVIcfV1rmFAiHoc57Qsoy9eOgq0VJbg871vIHAb53mcICw7nVq24z6gon/URklfP9MQfi5bYid30fb+RurmzPAw+Mj55/VqBW2wRkrqaE5j9WvVXHIj0xJNxl83h894raVwrwc/AAFAe4474iHsgexE3z8byfbz0yyzfC2BYrCpHV4iNGOG6z3YybGr/EZqozhNSpsQqUEI7l6cMYODCnOCNjwfCPHewFoHijZtRAM8USH6qjSVN7KtS0f9Cal6tENF1IzWw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6306.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:74::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 12:58:26 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 12:58:26 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] spdx30: handle links to inaccessible locations
Thread-Topic: [OE-core][PATCH] spdx30: handle links to inaccessible locations
Thread-Index: AQHbmZHtnOLt7tZsxUeiBjYBLQkRd7N9iPQAgAAE2aA=
Date: Fri, 21 Mar 2025 12:58:26 +0000
Message-ID: 
 <AS1PR10MB56971AE062D6D2F26A6BFA7BFDDB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250320121533.39356-1-peter.marko@siemens.com>
 <exidjcjvhfkvob7yns4tubsqeuajetel5ezaa3gu7aezbksvp3@fuknr23vph64>
In-Reply-To: <exidjcjvhfkvob7yns4tubsqeuajetel5ezaa3gu7aezbksvp3@fuknr23vph64>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=030e79b1-84a0-4395-8650-32c9ba179416;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-21T12:55:07Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6306:EE_
x-ms-office365-filtering-correlation-id: 5d48a0d0-b5af-401d-5888-08dd6878124a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?RfRcZ1OV9CUwE43xIjvQqG1nckOkj4d3eNEa4ojUDIsZ8hQPOp/Xq9IhS1dP?=
 =?us-ascii?Q?No8XFB8APctPcCCkSFcbVxpLwrcwlC9J8ehYwEEvao1grJA3eYK6lp/Zvkxi?=
 =?us-ascii?Q?mGmEeUEDLE3YlHdsxiXAqOl1G/hz3AddvAFHaO2UxZZ5okfwTK96bo8e/8Mg?=
 =?us-ascii?Q?XHjyLQkAytj87+sMa8g3MKn93CmPMVuzAjAwiSWQeUitQYGP/H1Jz1tSfDUm?=
 =?us-ascii?Q?cCVGJ8L8PS0QAvBTdk2Jqj9VmVj/4u/FTXjVOXGkXQj3RqnjiQAR9BVhJAkX?=
 =?us-ascii?Q?YvMmxffVrKWk5kIBJBjNLmCg1oqlszd73bxxEbAtrboCtJPb+KlN2cdr3Pc9?=
 =?us-ascii?Q?/OPD8VSGWWGyWjaH7tbq/AH01y6Na4irNriyJrPBTQHkCuoAUnIoJDPXDUcw?=
 =?us-ascii?Q?lKxIuqi6JbAeJM6GjEavWHhe5unAxN/iqd6QB3WKMa7sBR/99kSDy/9PhLg4?=
 =?us-ascii?Q?NOgGg7AJodfw/mXEY5VwNj2eIvY8ck8KfD6ObcK/yg6+Sq6LUQqxB19/hhNm?=
 =?us-ascii?Q?JklUTowdLqo8E5beUXSigzb08gRSF/qraDdJxB+VnQN5OB0XP1y7MWFR2Xpj?=
 =?us-ascii?Q?r3OtoAM/NC9t6A9GuGXKoGKJT3GosIyIdDZiLIi/ycRhGn4muu7h66jPJgPl?=
 =?us-ascii?Q?IUcH2rDrtO72BClftTOM7VF+oGiuJbQZRJ2iUco2I+eO7B2Add2lwyAydlDz?=
 =?us-ascii?Q?oDF4et608jC2kESsre0CavhPHJqItOTHzEGQw1wuS4AbmNiX4tojH31CcbVc?=
 =?us-ascii?Q?xzIlpW9JXV+G7gkBplqmKol8xWjuDjE17Z2L/9oYJbuJJytdJJ50k7iLZxpk?=
 =?us-ascii?Q?b1j0WirkazoLlXyV3WbocMvOqJ3MhcF6GUqVwUgKL7wOSja0j917FS7NLVcQ?=
 =?us-ascii?Q?VqC/kiPKb73kBCfIq1pay5HgbRaRDAV1Cr1zj42PasR7cXCpP0iqZ59SYovh?=
 =?us-ascii?Q?UiNotCOTCshLLYfG/yaSyJMu5uSEJ+8ALslBbbaWJqtPHc0NSBzytE6/qLBN?=
 =?us-ascii?Q?1Q0zOUQ7mK95depVP61yWpv5s0zeFSyu2/aDzenjJh+UkXZUsYjSC2ZU+H0C?=
 =?us-ascii?Q?rHNmJWmWuqpXqv4fIX/XBUyPOeAjPfj9Ju6oT1qbDMpn8oX44qFZm8SyH24I?=
 =?us-ascii?Q?UaQiG/dxYyQ76l3JpKmIO62uoaffe7IzL/hmqjcAZCrp640sNt3J1UfItWf5?=
 =?us-ascii?Q?E8nrtQr1VIanCd7TYzl6z3j7syNBqWWtHaNHxhAof865vscaZ1/w004wf+r1?=
 =?us-ascii?Q?MymSIGs3WMglpPc23H5SWXOHgWLVLbN6zUznYYB8qyhWX/MgIakkoVT5dbOu?=
 =?us-ascii?Q?MDUfC5nzBr/VPfMqULlaOJ/a6bRuJgC+gj424zGHhMIkaj5+ix3Gr/dr25+7?=
 =?us-ascii?Q?j7Wvl90f8hslomfU548ujP1EQKsWLo6j9KuaL0eJF3XzR6+dseOI62KWGsHV?=
 =?us-ascii?Q?aKhxJLD/7cra5zpR6bFYlSbeMmo8LVT1?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?zEJFx0yZG/xd3UdfHOejujV2ePJsZkN3CrAmsfjulWTgNLXjBp7elGLpzWny?=
 =?us-ascii?Q?ilGlQetf1PsCrvAYbnLZUnZZNt+IlofrSbfGOtfvIHmLvdEdEnK2fktXgExF?=
 =?us-ascii?Q?lG5AqlKtDCPmo79g4hJG6nMqyyfL/eIBa6VcJP96GclnHVh1JqMxIzdnlENa?=
 =?us-ascii?Q?x7h447NQ4tdy4PAseAhYkgvnrkK4tzeje0Xk06SfeqWNHlbDQrFBwXQ369JI?=
 =?us-ascii?Q?LpmVpjnWa+0Q677H/DJ2CnjsYxzc2UGw3dIU0ovUH7C0S4HaN1YREKc5u8F0?=
 =?us-ascii?Q?IASslA5Ifq1EC6LtTZokgsG+sZL+DiJaQjKeLc/2002QydtyESNOb7OMc2pe?=
 =?us-ascii?Q?ftbW4u1b/SCONUjy6Kz0fhjMEJFiR5l+BhCZt9h4uYUfqdMo9kC4gyhyGBuc?=
 =?us-ascii?Q?TJHxU6yw+PocRFWvNsuTF9tHcV2fkWqq2Ik6Hv20ej8JE+lbxqGvomGNeS1C?=
 =?us-ascii?Q?vodE69CcnyxUDETZWCMuyJG2IIwSqOGdlbMJhjtDH4Q3zuLntYl+kJqTxfJc?=
 =?us-ascii?Q?h4m2z0ZrujkqcArC9e80NfIBqsLNfoGyOGxHzqauBTf3SHKwELXEifyO6upW?=
 =?us-ascii?Q?q8yGequwVhvzlcZZY069CHEn5YmlrmrDP+UbEqHdxBsC3tQJ9mC+GdfId33T?=
 =?us-ascii?Q?vDjC8XWf6Mib8CbCHE4juj6zHIF3E5J8OwRwV4MrA6xEz+c43Bou0yjrNXcP?=
 =?us-ascii?Q?PfIiX2Ut4XHUpPoEf6gNFiqKRAi2MuFODPBs9YLmgv5+ApRRLmsFkj0Jf0n6?=
 =?us-ascii?Q?oAm9r2nDXaWzbLg5GL+xf2WlQHZ8FggvRf5Ye0u+K9SXU58ZE2YF59qxzzjb?=
 =?us-ascii?Q?2rFmYXjB1FN4GFc7ZA1uCoiyvHfodznOsm3RPQoUpTr+15U1B20vx3zBHmZO?=
 =?us-ascii?Q?HhE6jeF+rR6aj2N3wDbmgYTLKIp2XecLc6772UXivwYs7j7MnHkXD/chK8Re?=
 =?us-ascii?Q?0N5v4rIDtvH0eG6lIMleO3caWwyr7BiJiEtpI0LODkmr4p+rjz971zT5WCzZ?=
 =?us-ascii?Q?yH5ZdJp+MKYs1PfBDyl7FAGUoGs0ZorE7016escpt34wseaLWJMw7B7rjNXk?=
 =?us-ascii?Q?SgV+j+T0M4qEX5DbsnWCvDv0oa+9GJGiNEuxLSIx9OvX+CK4g1i/yCdcTVLR?=
 =?us-ascii?Q?OAeG6fUiwt+kvXCjX4WHAxT8JtWx8Sxse3tJl+djyGN27eblxnohEmypO5qJ?=
 =?us-ascii?Q?/m1CwV7CFkjzJF/rzmdal7AsM77czFFf2R7MlwfezaYxGO17X8tze5zlFRZy?=
 =?us-ascii?Q?athxi2t1YU1r5t3V1KWmVRQpSWZWK/Az7RGO/NZn/YrpUE6Zt+c4NKpTh+N1?=
 =?us-ascii?Q?yOQSg9lVFhZauKg8+DRTsaODhNnXAnJXIVF4gxdaC0YS2zFGes3JWjxdQ3uO?=
 =?us-ascii?Q?anBm7DD6RSOraMO/oxeGygAe6UmfkGxDg4TleQXJkNNlS9+CFslfkGGQ+w+I?=
 =?us-ascii?Q?yun7zO3JkqXOjl1MT6C0zqunKb9l8IjQHfmIO2EVp4AUGpIc0NQGCUIUJHnW?=
 =?us-ascii?Q?iACl0/4nPdX5IPcwjJkiu8mdGEx2Ty4Qq83PUNB4JDM7ZtLwb+rYwRnWGiP/?=
 =?us-ascii?Q?5XZyMwI9ks/rQirZGUHHf/XIawU+AN10SHbCz2pK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d48a0d0-b5af-401d-5888-08dd6878124a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 12:58:26.8363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zYtPDobh6ntC9QXwoLfhWM+jQBPA7z9dMhLB8F75qikuuzQG95omQS3IGbNvkBN6DlUBhyXQX9CzRHN3/Esqfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6306
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 12:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213450

I think there is something else breaking your build.

My commit changed function create_rootfs_spdx.
That should not influence recipe spdx code...
Did you try a build with my commit reverted?

Peter

> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Sent: Friday, March 21, 2025 13:38
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] spdx30: handle links to inaccessible locati=
ons
>=20
> On Thu, Mar 20, 2025 at 01:15:33PM +0100, Peter Marko wrote:
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > This is the same as e105befbe4ee0d85e94c2048a744f0373e2dbcdf on
> > additional place in the code.
> >
> > When a link is pointing to location inaccessible to build user (e.g.
> "/root/something"),
> > filepath.is_file() throws "PermissionError: [Errno 13] Permission denie=
d".
> > Fix this by first checking if it is a link.
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta/lib/oe/spdx30_tasks.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> This commit breaks building recipes here:
>=20
> ERROR: quilt-native-0.68-r0 do_create_spdx: Error executing a python func=
tion in
> exec_func_python() autogenerated:
>=20
> The stack trace of python calls that resulted in this exception/failure w=
as:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:do_create_spdx(d)
>      0003:
> File: '/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-
> core/meta/classes/create-spdx-3.0.bbclass', lineno: 135, function: do_cre=
ate_spdx
>      0131:    "
>      0132:
>      0133:python do_create_spdx() {
>      0134:    import oe.spdx30_tasks
>  *** 0135:    oe.spdx30_tasks.create_spdx(d)
>      0136:}
>      0137:do_create_spdx[vardeps] +=3D "\
>      0138:    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
>      0139:    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
> File: '/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-
> core/meta/lib/oe/spdx30_tasks.py', lineno: 537, function: create_spdx
>      0533:            )
>      0534:
>      0535:    cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"=
),
> d.getVar("CVE_VERSION"))
>      0536:
>  *** 0537:    source_files =3D add_download_files(d, build_objset)
>      0538:    build_inputs |=3D source_files
>      0539:
>      0540:    recipe_spdx_license =3D add_license_expression(
>      0541:        d, build_objset, d.getVar("LICENSE"), license_data
> File: '/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-
> core/meta/lib/oe/spdx30_tasks.py', lineno: 408, function: add_download_fi=
les
>      0404:                    creationInfo=3Dobjset.doc.creationInfo,
>      0405:                    name=3Dfile_name,
>      0406:                    software_primaryPurpose=3Dprimary_purpose,
>      0407:
> software_downloadLocation=3Doe.spdx_common.fetch_data_to_uri(
>  *** 0408:                        fd, fd.name
>      0409:                    ),
>      0410:                )
>      0411:            )
>      0412:
> Exception: AttributeError: 'FetchData' object has no attribute 'name'
>=20
> ERROR: Logfile of failure stored in: /home/lumag/Projects/RPB/build-rpb/t=
mp-
> nodistro/work/x86_64-linux/quilt-native/0.68/temp/log.do_create_spdx.3116=
916
> ERROR: Task (/home/lumag/Projects/RPB/build-
> rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt=
-
> native_0.68.bb:do_create_spdx) failed with exit code '1'
>=20
> Reverting this commit makes the error disappear.
>=20
> >
> > diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> > index 0618f2f139..bba11ae930 100644
> > --- a/meta/lib/oe/spdx30_tasks.py
> > +++ b/meta/lib/oe/spdx30_tasks.py
> > @@ -1068,7 +1068,7 @@ def create_rootfs_spdx(d):
> >          filenames.sort()
> >          for fn in filenames:
> >              fpath =3D Path(dirpath) / fn
> > -            if not fpath.is_file() or fpath.is_symlink():
> > +            if fpath.is_symlink() or not fpath.is_file():
> >                  continue
> >
> >              relpath =3D str(fpath.relative_to(image_rootfs))
> >
>=20
> --
> With best wishes
> Dmitry

