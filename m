Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00876CAC592
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 00:25:40 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.31])
 by mx.groups.io with SMTP id smtpd.web11.8106.1757982337716518031
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 17:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=XcFijIhJ;
 spf=pass (domain: axis.com, ip: 52.101.84.31, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6XMZ9SBYXB+erXnPNAuRoF3nYsYpFHFLNTeTerc/hQUS9Kd6yPHa+9bxv2exARc7MqjaeLwwwVwtml+8DpBEDqmfTFUYgR5P5SKKw/WgqwKsaucGl9SvIfm4yN6g2CnfLk9sIVeVg5P7elHKLJiDwI5PZjwHE1BbTnLn8vNPdhkiUDhcX3FCVDoeM2Czgj1r2GFzFoLGFXBN9bOfneO5Hx4tzRi3yTI2FPwbid1/57E1kP2kaOm24Ao+kjKJPbi3XFggl1qga73zNJz+4ex/ffgDm9y6a0o0hG3KQRvVlBJRoMZPGjwPTzzdCA5SSsBnom3DqzHPQRCzrnAAviM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+6vsmf8aA6+BAi1i4QlAmq08Bv/zw98DwZ8DweF1II=;
 b=O/WvG9sSa9fTbQwDYhctr/ubg6pX0+X4Q2RzWVcuyvaa4p8adCvqfpbnPksgzDFRXcWjal6vzmZZvaQa3kLxgnfH7+9JnJfeYqMHDv5cbeKyghNsPavd1hyWQRW6QmZJcGtAOuDGsu8f1JBKGnArYlnP/Ma62AIN8GBNQpEiHvAalmj/osJNzAkrpkR6NO9FF33LBAceMTlyixzzgRDIygh4HvIn+bi0LjCppQl+e66NgynMeLqYRpfdDQqnm+/NazOjt2NsAjpLjNPVr2vmYf6O1D3OfFsd96htu8gXOi4/PwuNnevE9Cg+zgHy+cyIlYehUqAh8lA/M+c0S+Y20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+6vsmf8aA6+BAi1i4QlAmq08Bv/zw98DwZ8DweF1II=;
 b=XcFijIhJFkJpZbVkrzGXDqkBdDHabFWNmlPw7lvKktuiaOiQvXk4eqjEkFHKLc7hpFn6ziULXgAUOH/7T+mZLJ9SLxLosnWYZjV3BdIyWukQY8riECHJeh6p1Hqvgx85pO3C4FgwJx+Rj7V7EaWYcC1aJ+7DMclt8slGAGm24XQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB8403.eurprd02.prod.outlook.com (2603:10a6:150:5a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 00:25:35 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 00:25:35 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "randy.macleod@windriver.com" <randy.macleod@windriver.com>
Subject: RE: [OE-core] [PATCH v2 5/8] debug_build.inc: allow other layers to
 add their own debug build configurations
Thread-Topic: [OE-core] [PATCH v2 5/8] debug_build.inc: allow other layers to
 add their own debug build configurations
Thread-Index: AQHcJghn5HeDG1nALkeKv9e1oTLHMLSU9MRQ
Date: Tue, 16 Sep 2025 00:25:35 +0000
Message-ID: 
 <DB5PR02MB102130BB32912B2554180F776EF14A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250915061743.313230-1-hongxu.jia@windriver.com>
 <20250915061743.313230-5-hongxu.jia@windriver.com>
In-Reply-To: <20250915061743.313230-5-hongxu.jia@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB8403:EE_
x-ms-office365-filtering-correlation-id: dc4b4fe9-4b50-44fe-ec84-08ddf4b78dff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?u6DiYyTPu/KZdPa0eJhq0BerQKvkWwTbfrY5/KtbnfoD9K16R9ZYy1hCaJ7u?=
 =?us-ascii?Q?UINBpOuCDxdhGbhktCkxf+vjbJyB/o2j9yCG/aJ3nd/UXMMghzcsB6iDirJE?=
 =?us-ascii?Q?JH8DueLh93zQW1Hm/+8qUy+FobOiqRD9hEPBnEkpGv8eZNgXWT9XkUTAXiXK?=
 =?us-ascii?Q?PvyYWtyDYL6BlOe0xIQnSKS4cnSzIyiM1IPI7emwX7aaGB39yQZ/Z3JyE8CK?=
 =?us-ascii?Q?ZVR8YNRRs7F1vrPjZva4lhLYCwRfoy+dT40e5Iq0MOvMgmL2CH5UbUI7xM4/?=
 =?us-ascii?Q?/pQxS9LjSPlhqqD2dL7u5U7OkQtp7Ec1E57n8e/Yg4V2NoSPQhzYKcx1x7Gk?=
 =?us-ascii?Q?7Lp66pSAMdkK1ueBiCmmkGSVpGiNAokbBXZb5LcH1Ti5vzKGsZ+TEKxAHnIS?=
 =?us-ascii?Q?J1pJJnhZuDLo4OKVegGzQF656jIJFgFitHyt+GjxQKZp3gSsNtZAfRZwEorQ?=
 =?us-ascii?Q?8tOZM/fvHNTe67kqEZ6wmGOBzjwCEgjMYJWXCXMAkR9qubBIL7flOEs07tyC?=
 =?us-ascii?Q?HTrXV7/gjqzbd8kal6gcXoOSsFjDrsfUDIuZDbNgE+cLYECe1IOHdT5xabK5?=
 =?us-ascii?Q?rAB712lLDNNKggM73JpWJVKoyGc9SdCNj2TpR6UUc3rp3JPl7kWzv3AU2+5E?=
 =?us-ascii?Q?qinmliM270Vn/R6BiQ25YWcb0b0x1N9ELsusKwuttv8WgGRxr0jKYyKz3/hs?=
 =?us-ascii?Q?PaO2xChgj79rAOTSBiHEL/bGxuEInxpJxbl5TzbXghrX7meH9KfjK/gG8sio?=
 =?us-ascii?Q?qiwhCENIRnhyaEklstpGnxXuNGrCsF2fdpGCVStwlZnFq47YrCfroQUkm3kH?=
 =?us-ascii?Q?s0mt/26E/L0TrxY6cn+CTbc+/a4kM1trMzvEAYl2xnVcUj+lL1PymyA5yet0?=
 =?us-ascii?Q?+CDKVgNy0IDWoNYJ9yHQ7wbZexdR43GstWQVVqGPo2ql5zC3dzWRqJWqmZ6l?=
 =?us-ascii?Q?Si7Hn+1U2ceRYcwuzkNUTjJuhAJVKIJ6909TLeIK0I/yzKwqLEL5o/FvtwbA?=
 =?us-ascii?Q?okSWY4zqRVhC59FKOvBLZn37xRMRMKTQlQXgZkowuWTxxALqiumgBJKbcJyJ?=
 =?us-ascii?Q?dyvagkUSp5v59/Bsu/gxcGFz7emQAiyOCZ9mGu9y24N8rmCNSCakPWROxp5F?=
 =?us-ascii?Q?Tfu+fVGjR+PzSPHZ2ZFV0Q9MnEhO8xH8Pm/9sQz/EPHBvVMGsbMbfPY6l2g3?=
 =?us-ascii?Q?4lP7RflRk6UvYZwEjr/8J3rgV8op0zx6nNOvSKTS9heVkXQDjCEs9+9VxGVG?=
 =?us-ascii?Q?//fkF3y7NWsHKOXPgZUVhBxMyzAuEiJ9nl/rOmHbP6yV/TTXuON1kDonmXfT?=
 =?us-ascii?Q?QJab2iw6JTjAAhFDGmgXkS9x+1V48tPOjaZCXcATF9V/H+Ai3VPgmREjFTeU?=
 =?us-ascii?Q?TYDB9dUKqhk7e4xVl4jLRW9RCySq7KFUARs1GwLEOR7Zp00zJhZksvOS/67L?=
 =?us-ascii?Q?7SbUW49x+Rcpm5QLVN7XP7aabakL4/XA5uaygtM7xtj4hpBzgbqGPQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4K5LrV1Dw8zUT4uPQrhT1WBD3pxBXixDho1jHIkYNXaZfKxDse82hkN93qCt?=
 =?us-ascii?Q?yq++6ozgAwz+l3Di/aIRnLeYP4mpIIcLUlFOCP+ch4aGJS2ttajUs7tYKeoR?=
 =?us-ascii?Q?0WaQ43ilIiT0wQvw4MyHI88m/VpkmI2PmhEvw7n0d/HXrfCtgJ1kpJun39iK?=
 =?us-ascii?Q?GmFHU7yvKKGzbTOHlIuxhyYnmPaOiZOrmw45qGWSuxxS6o7Dq4CIipUnfEwq?=
 =?us-ascii?Q?NSf7BQutz3uTzn78rYk1H3WEdsoisaZI/gtUQZcwSUEdDgAQe019N7Vn2wZs?=
 =?us-ascii?Q?JKM7HefqLJ8mSkmaCyxVz8hKJMc42p1lycbV57SrvhjF/6/YyJN8JcYHcNLs?=
 =?us-ascii?Q?pBlKzRUrvlg3Rq1h+jR86pEwX48Sn48jWfQlJLT4fUj0RY0gkOCGXZwA6gQb?=
 =?us-ascii?Q?gRrPgsp/zuLn9269tnwa55pg1iVY6FKVX38XE2ZTuhGLAAegZSLsvRuTtMgd?=
 =?us-ascii?Q?tvaz/NysKVoB2V5ArwwAjWKgvTLXaREGQDqkdAEinNTL/iMK2MJXOn9ssWBJ?=
 =?us-ascii?Q?iFE5cruKah+XSP+dtY2QGATNxp39wMafmwPy98PcL6AJsJ8Qxgl3zZiox2lM?=
 =?us-ascii?Q?q6B3N2Z+LfbAJ3VeWKDc9ZjVfWQTrLhlzwQhlHyQ3DKGHWWsgrzNS6BkBeNz?=
 =?us-ascii?Q?Bv80E/5itLklQSGCzODF9ixWAUcAuTcYhUvAXhQZLN+9wH/mouXvUO9E6GKO?=
 =?us-ascii?Q?sVw61AXVT7Xrh6O+JoQJWEMjo+FDamU//3UZK/BlOef/JpiYFtvqMI2bg8C1?=
 =?us-ascii?Q?hmt267IBCm4CMQmL2DLUlGxZf0qj/tBxyGmfhZsASiQ6mb0quUKYzXzTOReo?=
 =?us-ascii?Q?s3G2VD34qxVhlqs6vICVuT94p4BFz4pg1ZLVOkUyodIZohHyxZL0Y3+8edH+?=
 =?us-ascii?Q?zfOvblsUY9dqwsjNfE5yt3YULUCmeAHp4ChdxpsYSEaLAls/fjGZrwwU9qZ8?=
 =?us-ascii?Q?ZqcNDP077OmKwuJJyS3sKXRKWUq1n0+aZ+72MVNWitGhFVrFdZcigLtP8VsX?=
 =?us-ascii?Q?+LD2aaeLigy9rdsqFV7/03tnJ1OR3MNYRlRbWEXtc+/eqG1PWwz7/uoJhhqW?=
 =?us-ascii?Q?zAdt4qda0WFOsHhXhvAoI2EYTUks+t+wMdbIGt5SOso8uK2ToHOqXHnQRQH1?=
 =?us-ascii?Q?Z/7w9xEJrA/yIZtS56ILeQ86CiDjMuski63Un1tcX4tmEBaYrf8KJPl1ZBmn?=
 =?us-ascii?Q?9WeSETbyJ7WKK4BNHptIaShZvc0XvOO98VINyy7JHZrDsVMNEtB33A8fp3vR?=
 =?us-ascii?Q?MmDyFFAKR8zhh4E1bVBvk56rbxVYwWGqVz7S2Bo5T253Buvcge67xfVOBXdh?=
 =?us-ascii?Q?AVsayYRY4IYTi997UE90kT0UNdAJoxKeG7D/aiaY+hI1a6N20ulVIHN+oe/H?=
 =?us-ascii?Q?UxD6T+jygZQi/yeMRo03gJXxZAQ3h7GSB3MUx9OpnZ8nAPaPkCB9igZOy90W?=
 =?us-ascii?Q?nhzQXLJX/KnQ/2Ls3NFIOBoI5vdq8kgHgToeEfvhd9Sz3AKIhtodEjhMQXK5?=
 =?us-ascii?Q?tWZFiwoqbLNRFIIx1N20HyhOcDleLXCVgwWrB+ahj2dWXI/th4GwOJbLKA?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4b4fe9-4b50-44fe-ec84-08ddf4b78dff
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 00:25:35.4867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uej065xD9Sg+UennHtqreYQM5cIs78Hu4mO6cME+pnsQ0ZrWFcOgtF1qsZ4+xDih
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8403
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 00:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223512

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of hongxu via lists.openembedded.org
> Sent: den 15 september 2025 08:17
> To: openembedded-core@lists.openembedded.org
> Cc: randy.macleod@windriver.com; Peter Kjellerstedt <peter.kjellerstedt@a=
xis.com>
> Subject: [OE-core] [PATCH v2 5/8] debug_build.inc: allow other layers to =
add their own debug build configurations
>=20
> When DEBUG_BUILD is enabled, allow other layers to add their own
> debug build configurations
>=20
> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/conf/distro/include/debug_build.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/=
include/debug_build.inc
> index 43d5ae59d53..f594df4b107 100644
> --- a/meta/conf/distro/include/debug_build.inc
> +++ b/meta/conf/distro/include/debug_build.inc
> @@ -43,3 +43,6 @@ EXTRA_OECONF:append:pn-nativesdk-debugedit =3D " --disa=
ble-inlined-xxhash"
>  lcl_maybe_fortify:pn-vim =3D ""
>=20
>  CXXFLAGS:append:pn-vulkan-validation-layers =3D " -DXXH_NO_INLINE_HINTS=
=3D1"
> +
> +# Allow other layers to add their own debug build configurations
> +include_all conf/include/debug_build.inc

I think it is a bad idea to have this file in conf/distro/include/debug_bui=
ld.inc
and then expect other layers to have it in conf/include/debug_build.inc. Th=
at is=20
bound to result in confusing mistakes. However, since you said that you cou=
ld not=20
use the include_all in bitbake.conf as you got an error due to the conditio=
nal=20
include, I took a look at it. From what I can tell, the fact that you get a=
n=20
error is due to a bug in include_all, where it does not behave like include=
 and=20
require do when it comes to empty variable expansions.=20

I have sent a stack of changes to the bitbake list that corrects the behavi=
or for=20
include_all so it works like include and require do. With that applied, you=
 should=20
be able to use the include_all directly in bitbake.conf instead.

> --
> 2.34.1

//Peter


