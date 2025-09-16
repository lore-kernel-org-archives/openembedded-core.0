Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E46CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 20:32:17 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.38])
 by mx.groups.io with SMTP id smtpd.web10.6173.1758054734585381453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 13:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=RoJ/REd9;
 spf=pass (domain: axis.com, ip: 52.101.72.38, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehRNFVf+7sNUO+WGkb3eWglNQWSWm0eFyHyzgM/U/ZB+PFGPxS1QooRGEwtK6ybas848z7kzJMXuopBZM7U9fT2o9ewLlzeLdyKjI7dMmjWF5Ii7m2+PYVSJ2a/C7LVvw2VxByjw4NaEusUQ4uFQEX1I67CuFT9zk7O02OFpKPxscoOyKnoOy/ZLnUvlM+OeK/cXB+WrjJSjtx9H26fVC8wa9d7ZZX1+aQLnhDvHBlxkshR8DSMzi0M0vFbSEam5HY6vejiHcIYO/Ffkwn8NlIEcZlcbaFdRNyhgm8cFju4jyU19W5G74XmxflZRdabBgPJbGzBpiVYoZbHV1xToDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n91mcNCf5YipXLkwrMVcULLO6QjUqxgyi3A0I36hKfc=;
 b=rWiBKs/mz67mafeZyQGCd6qtTvvx5+JDdO+egWiyJoLT/ebfqmNXwc15IHNN0wctg2/2/Qj5POKUNUprqyLq2eHgDmt10TEAySYdNXe4EPJh923nl2pMf6QYVzimzdYTdvF6HkZ6QFjvRvylVFyO6qGScpcCD1F0ZfeuXuVudMMJyyNdof7KTIGKpJf9oSoP74my5kdw6Cn1dDtOwY3X0gTyY0qJbXnJcDW7/RKM9S9UigA5AbQYFHS2O+i6//Ig1B4deSqykfbEJk39ngjFOVKi4eCUrUT6kahBz1e2Dg4wXTVtbnNGMGeOvm/H61LDIgNxL0My3yYh4bKhZ2QlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n91mcNCf5YipXLkwrMVcULLO6QjUqxgyi3A0I36hKfc=;
 b=RoJ/REd9aSBB5T6oHHFi9mIXcpLJYkT0R5yTfQv9CTRoOWCRQ5U5Mk2Zp9gKyXjP4U/lST9CZePqgIisWu6ozApspi6fqKjuN1aHxvfUs+nRz6lJTqyCu8DhJOj9ifqcrJzE1mgojSN7y4mJf+OU6c/rAvsn8o/+fNwdtT0OcLw=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU5PR02MB10549.eurprd02.prod.outlook.com (2603:10a6:10:518::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 20:32:08 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 20:32:08 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/2] util-linux: remove 'which' from -ptest
 RDEPENDS
Thread-Topic: [OE-core] [PATCH 2/2] util-linux: remove 'which' from -ptest
 RDEPENDS
Thread-Index: AQHcJvh+YfeEv7CAlUqqJEEaiM3HXbSWQ2lg
Date: Tue, 16 Sep 2025 20:32:08 +0000
Message-ID: 
 <DB5PR02MB10213C8A9D1A1E398787824E4EF14A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250916105533.381404-1-ross.burton@arm.com>
 <20250916105533.381404-2-ross.burton@arm.com>
In-Reply-To: <20250916105533.381404-2-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU5PR02MB10549:EE_
x-ms-office365-filtering-correlation-id: 75a440b5-fef7-4cb4-bc7a-08ddf5601bac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?o2QEo7iQZ0E/sKX8jkNqID9ypZ84q0gjjYcu86VPgS6u51qgERyBzOixaBap?=
 =?us-ascii?Q?FxUP4uFK9Jcpz1Ys+4CoFwz/jlwjurM4g1SzJqEPI0v2lx7hTyFMcQKn2Dw6?=
 =?us-ascii?Q?W/aoyP9xQbACD2hUzgNT/t+sWcAZYu1IVUo2R+Cj5u3yja+Qlcc9MEj/NAQk?=
 =?us-ascii?Q?x8Qe6PzE8/OS8KJOx3wjpRYnywTpwbgWVW0xKD6P3xxFjAeqIRQb5f1fFWK+?=
 =?us-ascii?Q?rQXp5voi1kDZDNEvkBn9OtMfXeTUPl/hmWhlxn0qbcJatrdMGrXQjbJEfoPX?=
 =?us-ascii?Q?AvyIyoRnXVKP3Aiw5f6/LDbH3IPc5nm1Rcbu0tcNFpHzM+m1ltlr/htEBraS?=
 =?us-ascii?Q?D2IOgDQ8MHsVPGaI2JKuUm6ZHL7jEROxDe9mcgc10/GBgjys9prqopusdMlq?=
 =?us-ascii?Q?fp0hg40RCI/8qHWMphRMWzjbOJn0WdSiF1YJ6G/DDCNM5Qq2mvwEYcFLO/O6?=
 =?us-ascii?Q?erJbJ7faPqkWTl9XBg9z7jiRkqPpVkXQx4OcUTNeAI3MOwXmJ0zeL6i9kMwL?=
 =?us-ascii?Q?KSIiLsvazOCJr6KYXoGy5TPt4HqlnhVOmA50gWnH/ME7YVRz3ANNZqglASQM?=
 =?us-ascii?Q?WK3HRH/TPkY4qTyxNNmHuQGTZSuMCNZmWFt2bBVRqQMahgKsGtaTuKcaCiYc?=
 =?us-ascii?Q?BuYIsoeMq6UegWZhfrNr+rCsLKfodm2aMosCj7NQ9sWvO8U4ncATIFShENlw?=
 =?us-ascii?Q?VQU5ljqvcjPQxv02cBqilWIwQAY0vRw/LaT6W/AgVwAwUbD1RVZhQ9VfS1PK?=
 =?us-ascii?Q?urDFkEVLcBRpKQ0ZR64eQpEv2Vql1HjxwzGvTi+9IhbNZ4EW/NeJw+hvpYdg?=
 =?us-ascii?Q?nQvzBIqEq2/1qnimInhpVBBIF0th24AOPWut5fej7yBzplR5oPxUd/iipfww?=
 =?us-ascii?Q?fzbeLiSlnWWArDvdkArqmzV95SoSogUF6UDnx7B4+qQb5AkblL4o0AZr7sLU?=
 =?us-ascii?Q?D0VBGOQcMpURAM2agY+Rl5zd4rAP3txDi8RSoEmJu+iRsLSMQSWnBLD3+Idh?=
 =?us-ascii?Q?jAeJDjESlltNXnq8ORGQnXE1rcIt8aeM8tHM1tErDLXXPBYH5kg35OaZ76PI?=
 =?us-ascii?Q?IJidko9R/3oaWYAgAEAUTPSmk+UukxAtU381yIyrXdocEob2vZ6rrgYrnd2s?=
 =?us-ascii?Q?WYQc3vDAAt+G193Y+WzoD21a/WjWHjElC4cFxIvHSqh0ssdLYtpQxDTqvZTT?=
 =?us-ascii?Q?Nx0eDEZHU4gZ1vrEzQnAWqiqg3THTuxVGCkqzsUz1RBNyCnoSVczTaAg4Eh+?=
 =?us-ascii?Q?i5SnFdh/lSKhAvqAzKgwbyrZjD+7uRxJXmDa9A+K1na+vkxEbqahpjCaQ9Qa?=
 =?us-ascii?Q?pNNyCv6S8Da6kWvcVQs/8DS4E9R4ASwF9aUuK/w9e3XWg6BJjruix5HkaQV2?=
 =?us-ascii?Q?8zaYL7YQr1Yh5vJ5uLPypKFicIDZfKcufTdFmrvhcDIiPW10xqG2gDcZL6Aq?=
 =?us-ascii?Q?Ub9mtTv/Tp4s0LXy3wNPeDuknk0+M7Z9rtqWWU/z2ZLccYnYb4A5wA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZWhtmLJmf3E5mnCmERtlPLOZs9U7G36w0z7VQQGiG4D+wy8d9AuMEHOIuH5P?=
 =?us-ascii?Q?BdBbi8jEbRSUXeUxNBEYADr/0kkTtbjZ6sKGxvqZVxP/ndeJgpIMuVbl6Ep6?=
 =?us-ascii?Q?x9f4MHYYE4EFIcGtuas09NdaNUefflYaV/CVZ7J498jJ5jOD0Y/yZ6UZEkI0?=
 =?us-ascii?Q?KKKFI3SL0jY+aDe3ba3zcMIzjAX+FTZOdi+weRCRbu6aV6PR087ygkk72oDQ?=
 =?us-ascii?Q?ViW00eKaY4glCc9R41SHEjmrBoLRroyToXZCLYvQ0vC7o60T0p7oVwOJUVG6?=
 =?us-ascii?Q?yoCMcADJw+U7Bs9WNdqgHjlufEx7Y8KbuYs/yI49/A7zX1+2UpdBQJlaf49B?=
 =?us-ascii?Q?I0Ikk/nMF5QkTiRRe+o3JOe5VB2KrVVVVu1xt5wsNfpolUNvMBq48/0l4eQ6?=
 =?us-ascii?Q?Nyt2+b0O0tuc4sQNZVHuMQmIHgW5dcUi/X+dBateoc9Jak+D5HcWpzcUIbQw?=
 =?us-ascii?Q?GIufIJrhppW5ze12o+XDCAz55EvIBqStzGwYY4EspplKqZUigi5ch670fxod?=
 =?us-ascii?Q?fYxqhfJU0lNAJvrFy6kkH0pKbovHVRkyIEU0P8wI6Af5D+t352qJpko8E5DV?=
 =?us-ascii?Q?kvoL1bNY2Yxt5i35jituNoYRszqISw2gjgDND3fMunuK7NXFkSYCM+K656dd?=
 =?us-ascii?Q?ESUFJSWCuTyHxujJ9f4BlKsdhsb++eiTwcIP4c+oB8q7Q6uwMibbGdnzxQUm?=
 =?us-ascii?Q?VnjpEXwCuCIalRmuKwAmF/+C7S5CP9p9Og7NA9byxDMvzDbSdCXtr8Pjg1qp?=
 =?us-ascii?Q?S7zRiYUyCGFTvQCsbhwf1JDxEuOZfQy7ZUha0hbHYbccilfETjRZYSrUUJpw?=
 =?us-ascii?Q?CRKmqARI5ONLmWGVP3atd0XK7Pdr8MtKAX2UBp8xALSsI2Z+xnB1dm2n1ZbX?=
 =?us-ascii?Q?aQ1QTj/6IHL/5I9SDDGELaAJ2X9Rm95+3vTMgDpZADkrdw0oYSndBk+y3KzR?=
 =?us-ascii?Q?eOjTorLipBqn1Gp88v5OjVQqadcfaZWIfLAwqeTTd8NylhTz5+ANL/e/+lsC?=
 =?us-ascii?Q?otVSFBoz3u6+0v+HPQ+aTSTc0NGvfmtLYOwJ3LTy7nI/wgfXNGm/OI10M2Po?=
 =?us-ascii?Q?b/i2qHO1ibuSMy93H41XDdI8nAkWpJLXAr1B+0oQ76DC+zBWW5LbbStK27NS?=
 =?us-ascii?Q?GvNcCCtB98nx0tZWzTC8W+D772tbmUudBbeEuEVw7xQpnMZPDzv3+c/WLTIH?=
 =?us-ascii?Q?kRh6ikun6h+Q9B/DlPdMo7t6DtdlWiUqV+GS6IPzdUiXlzwLj2DvADXedhyJ?=
 =?us-ascii?Q?d9H/wec99zkfnkCzIcP4u1cHD0x41VbpF70Kmg9SY0EPS7gQGIYRxTMIIfp+?=
 =?us-ascii?Q?8GgjqT4sMkIqDEiICX7rwsApk4vr1G38sbYVWK0R5Si4qbya1rWeQ1a65Thx?=
 =?us-ascii?Q?s/gQfYrskGhwYe3VLMz4JJWNp6fNO/l1Az49Nq2yjXFpCxZmXiorLbPc4X5b?=
 =?us-ascii?Q?Vm2rU/krhVDbdF94VnaagVSyWAM0vLaoUkJhIAx0RxDvCNofjyM62aaBfNBE?=
 =?us-ascii?Q?MdswJxidXYWImN3zcSiJi2vHeCXUuiYdzUTe4YudKydwa2KXwBfsfV5J5Q?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a440b5-fef7-4cb4-bc7a-08ddf5601bac
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 20:32:08.6209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Okun+PnrEgkhBQEpQxKSzk8agaml1CISwq8eBv67K6e52S+SiU6OppiTIKYOT7B4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10549
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 20:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223581

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ross Burton via lists.openembedded.org
> Sent: den 16 september 2025 12:56
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/2] util-linux: remove 'which' from -ptest RDE=
PENDS
>=20
> The 'kill' test case which to find a kill binary (not built-in). The

I guess that was supposed to be "test case needs which".

> which implementation in busybox is perfectly sufficient for this purpose.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.41.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux_2.41.1.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.41.1.bb
> index 41fb3e59513..e9212ae554d 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.41.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.41.1.bb
> @@ -207,7 +207,7 @@ RDEPENDS:${PN}-dev +=3D " util-linux-libuuid-dev"
>  RPROVIDES:${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev"
>=20
>  RDEPENDS:${PN}-bash-completion +=3D "${PN}-lsblk ${PN}-findmnt"
> -RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs findu=
tils grep iproute2 kmod procps sed socat which xz diffutils"
> +RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs findu=
tils grep iproute2 kmod procps sed socat xz diffutils"
>  RRECOMMENDS:${PN}-ptest +=3D "kernel-module-scsi-debug kernel-module-sd-=
mod kernel-module-loop kernel-module-algif-hash"
>  RDEPENDS:${PN}-swaponoff =3D "${PN}-swapon ${PN}-swapoff"
>  ALLOW_EMPTY:${PN}-swaponoff =3D "1"
> --
> 2.43.0

//Peter


