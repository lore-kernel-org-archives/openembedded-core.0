Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B52BE81DFD
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 13:33:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web11.12808.1696599213843544886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 06:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=c9OpjbB5;
 spf=pass (domain: axis.com, ip: 40.107.20.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XH8ochqYHU0H5Wx+2ZS/4oP4GYgZjTu2mSjOSuVIT2u4vZJzv/LVDqYjSK3VECWzaKvsJzlU96IgMfs2Fyd+PCHXyvAnQnbTlPUJ9/oWuwt6ZfqO7nciCnBkcbmo+NhsZ0GObMt3GH1T0eiVruvvggxLAWZ4vlYq+0btFcwuAOGHEAOodmosQ434KPpbUsMk+ba8jdBnEgDBuU41Dp507HLbCAGGHpIj4o1R2C86kKKh2ySFGrkg7rxnnTo3KV783rDBB7DfERtqiLZSHjaGy5lB+oa7JBQYbbFDF0vtEivPIjeBlZa1zOsMHBRZbFuh9R7vBWKoc8QvA9cTPeHSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O87pcZb250mbzFs0uHqJxXRywppUYRytWjqG6VHcOvo=;
 b=h9QcmmY3BVLN7ZZ7ci0OQ1zeLKVoeD5lir4L+Korn6fpZTZ95gtZ/a+eEAPb9J7sr/eBp4sp/8mski/8W73Cf10lL8nb2X+qx2ZnAVXk5g5uQy9wmab/yeTD2RTfldT1L9XBUokjtU4vA1qcj/OAYgvr6KGDKFMW/YeocoI66QFH94GkZiYiRoodx1FDt3OD7+oqyL+fNzuO3blBKcPq//wPiyGqPwMfhf7vmRYeaYB1O4N0fWBrP4rr7/rM6KMg2ByagsWfM0fv/S4cYOcxKRqlo6hC8/MUhYLvJKLfK4okKwRGwZnccAG7as3VmHE7k5yeS2Du3mGXbX9CvtYh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O87pcZb250mbzFs0uHqJxXRywppUYRytWjqG6VHcOvo=;
 b=c9OpjbB5IBVXreY0IQfuhAbT97rhRAiX7q2BlWgqW8N+aTaKXrBDEHhYX2sF4UumavQ4DSjYMvkWFy7zFq4tKH7M6VN8bZyLTwEHyhDpvvqBJ57ojd5wDkG3V4TX3wyXPk5k+nHpLkH7jom/hQK/sFaToH4hIwhT2GprlXed960=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB10180.eurprd02.prod.outlook.com (2603:10a6:800:1bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Fri, 6 Oct
 2023 13:33:30 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::46e8:4a9e:ea9a:7861]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::46e8:4a9e:ea9a:7861%4]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 13:33:29 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/3] cmake.bbclass: Add *.cmake to
 CONFIGURE_FILES
Thread-Topic: [OE-core] [PATCH 2/3] cmake.bbclass: Add *.cmake to
 CONFIGURE_FILES
Thread-Index: AQHZ9ZXLNes4V9elL0yGP08o3Qgl77A8xxjg
Date: Fri, 6 Oct 2023 13:33:29 +0000
Message-ID: 
 <DB5PR02MB10213C932EF4CDCDD826DED0CEFC9A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231003010529.2892756-1-pkj@axis.com>
 <178A7370E964C79D.9230@lists.openembedded.org>
In-Reply-To: <178A7370E964C79D.9230@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB10180:EE_
x-ms-office365-filtering-correlation-id: a5fa418e-9aa7-48a9-fd80-08dbc670d40c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tGIk1AXpENG8m0XkCVleTqznvorGInH1eHS6Tk6OfwQoi7c/sWlGqG/EXDUU2KWtTmBow+6471SqC05Zoeb93+XT48kjFezbJLPwqBI63rgqXcfGvDPJv70yDcZLtgwLIZrNUnIUU9qdYDaNXL4WIKjjgvRv4jPa5CrLDeyxam+DB5KjRiZoIs0XH8QPacn+cmJGHnJFx5JQkGV/+ZuqXdFNot4PZ0xZ0yjFUItSFzJUT2rive/xolmPYIL3woFub89TBy+4G2Ewgqnl/oJI7OlsHKG41RzCpBJRg0kY32vMGZlRJJ059DNHc7r8xMCLXyltUyHY1oP1ymZic0vYtLS//y9eU2PVC3J6g3hDP/8oQWXFf9wdAqXXwwdiBqD+vJ4083i1U2AGt8FckxIuXhd6UykrH3cPWVtLofWNSQzqGGJfz4m+H8m36plaOxShc4p6QT0BVhKfberfcQL1jXh2iWrxGLEGDcpIChWWmYPvIL4hVNlGPb6WkLGlHE41tDXW8At4yLUlWw27EnlPPKLkpT3LUIzKC6193Sc7nkXjFLSpuZcEe3h3vpe7T3NTPVs5EtVr7hHMM1+p0dDAqEYvheYPNr8qxaUfJZ3YrVMkQ2m24dTC4gwQ3qqitRrU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39850400004)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(55016003)(38100700002)(38070700005)(122000001)(86362001)(33656002)(83380400001)(26005)(8936002)(66946007)(64756008)(316002)(6916009)(8676002)(66446008)(5660300002)(44832011)(41300700001)(52536014)(66476007)(66556008)(2906002)(76116006)(53546011)(71200400001)(478600001)(9686003)(7696005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?HJTRp1ZHeDWkxMaKIW1E7eZJixoJnc7HWQBFXY1BzWwrRRj4U9WCtstMpMFD?=
 =?us-ascii?Q?6GVaqiWBCL0TCCHdlKzXwH5C0wfF/hSrZGQZA9coZSqyv3mBKzqUATcY+ZQ3?=
 =?us-ascii?Q?S7dgfjldYQieKqpZhbbiJJiNBmt4NoVVFxOIk4s7uKoJXPeJCqOGB7U7jMEt?=
 =?us-ascii?Q?hlveeiWzeJhIKgw9zIakaVUJxf2fJ1HyXTY2ESo/Tp1whT7xAFoDa+cXOWqE?=
 =?us-ascii?Q?exI/mHbC63pEHI/PfMvHXV+88r+oJJte/gWjKD0eRxVkuNiMReOUeEyHJ64c?=
 =?us-ascii?Q?grMgWMlaQxhkFxIeK63XYnoDCDQMix5scJAK7cZ/w/+cBQQEo/mlbSGKIzT6?=
 =?us-ascii?Q?GzdzDmnnUcXMwbnVksMvneMWNvlwUkv8BGLWIBAayt97fE3aiFL+wdADh0Is?=
 =?us-ascii?Q?bU0geZR7TLCShVucwRlDIYwrmz3dlqWruj69rsVUIPRGopg7bS0z/9JXOXrq?=
 =?us-ascii?Q?rEhYMtKRBKygfKuALFnXvAdjTxUG8f9o6MJutor02wiHf3j+pXGNUDvC9/v1?=
 =?us-ascii?Q?w2B5hVC339fXQxq9oBR9oGH1RFl+d6wkVxhM2jVCdttWnH5M4i+N0lT5ZT2A?=
 =?us-ascii?Q?Lto7R+1Hf85KoQ9Bv5MV+TF/+afnBmbvjOjdfhtgWfOpeHlkRsBD89IyaK6V?=
 =?us-ascii?Q?rbKvuz8tE+9nW3XsoLqXEX/aU16Wv3Ke9o5aRcTSWbK3R78fcuaBfpY3W95+?=
 =?us-ascii?Q?G71AiOxbp6j33JNKQQWcxCvxCG1WWo6nMW96Rfy75h07HXnl1q40Jok6Yu5X?=
 =?us-ascii?Q?E6decJyobk+X4ePHHN2G4CvDlnmWcuYDDr08CLPP91LrKtT7tlfJjkblk3cM?=
 =?us-ascii?Q?UdzSQlX0/q96dE6olNEWG9DrKFUeFx6Ga4wgLTHYofvZ2HmsF/AQxV98Wftv?=
 =?us-ascii?Q?aBrXAohm/d7DU4hb0peV8hi6UWORzB2Jq6+lv9I+8g9lFNrRcYUSbs1wbkBb?=
 =?us-ascii?Q?L/EFqmyseC0c8+ydjzHH2gA7U3u7zOs7q5LqxaS/gCdP0wr+Sl7Z9AclbZLN?=
 =?us-ascii?Q?sz4MI4y7q1rg6VR6MGA+Qfir6PxFbSF/4sG/B9NTAUyclOvD3rGxhGQ9trpx?=
 =?us-ascii?Q?/r3htu66NgeqdsrBLuQOr3PORJsBwJ2cKKPPkFOOwKxAZAPDERRzRwxEVt7F?=
 =?us-ascii?Q?CN+NDW4sxFvT0P1j2ARLs4E0Sc/HCH6ejtxnJWo75C4yQ8QbWlt6StPRDgS6?=
 =?us-ascii?Q?JC7XlpOHnQgVsalc8zIouBxxxc/QdOcP1xbLye/W5UquL1XYQMAaGPHMdPrZ?=
 =?us-ascii?Q?G73TVMNxuaBYjUAJ4Kqrc2DMZ36usovRsVe9CgRXX7pQi22NfpWICVyU9ukJ?=
 =?us-ascii?Q?zFWp/JFB0ZpEwIAmpzZW8tH+JBENIIPhnl1evLqbK2rf77TwW6IW+q8QEy3/?=
 =?us-ascii?Q?sUvG9vAzpG0yFMqkCx9VZDf1DYtf8+E/GoIZLB3TXvrDRJ61hBbgm54RUxNw?=
 =?us-ascii?Q?X89YTi6u39NhOm7ubtYgyeG1sKoRB+1Wu8aeWCC/PuLuX/e0dfO6XCNxZr5t?=
 =?us-ascii?Q?rB/EUKCiOLHd0GOG/FXSIfyff/UgGP0cEWwqN2JluKdsZje3UooOnA4hIkqk?=
 =?us-ascii?Q?4oYtgK2nggIPNVFpers=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fa418e-9aa7-48a9-fd80-08dbc670d40c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 13:33:29.8817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8b5sGyeVVbrI/ZvoPzO4uFD6q+610pc8UgDBuX5qm3jMEZXYL1LrHxT8qMX7D1vI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB10180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 13:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188769

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 3 oktober 2023 03:05
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/3] cmake.bbclass: Add *.cmake to CONFIGURE_FI=
LES
>=20
> This makes do_configure depend on changes to any cmake file when
> externalsrc is active.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes-recipe/cmake.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmak=
e.bbclass
> index 41748b0820..d978b88944 100644
> --- a/meta/classes-recipe/cmake.bbclass
> +++ b/meta/classes-recipe/cmake.bbclass
> @@ -156,7 +156,7 @@ EOF
>=20
>  addtask generate_toolchain_file after do_patch before do_configure
>=20
> -CONFIGURE_FILES =3D "CMakeLists.txt"
> +CONFIGURE_FILES =3D "CMakeLists.txt *.cmake"
>=20
>  do_configure[cleandirs] =3D "${@d.getVar('B') if d.getVar('S') !=3D d.ge=
tVar('B') else ''}"
>=20

Any reason this was not integrated today together with the other two=20
patches in this series?=20

//Peter


