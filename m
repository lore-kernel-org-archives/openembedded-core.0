Return-Path: <frieder@konvera.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23BEC77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 09:00:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web11.2978.1685955637147212782
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 02:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: konvera.io, ip: 40.107.21.61, mailfrom: frieder@konvera.io)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtAaWZgSKMCiWaq4Kcz137xhOl74UCI8Z9Zeej7z/6WfID64ADf9Ck7Lup/YOddN5TrIUp6kcW3MGa7Cl9HYeQ+ElaIU+1verJExI8xWz1AJzp7tqDN3yaUerPh9jlZN1cNbog7LrIQt9PRhnGuHfwkj7RQHI65YWoRvqdmRo8Or4qTUXACJeUk7EY4bClzgbytavYAiXqNbCOZdlHJHY9xG0IeZAESMeO3QeSLOQOZka2mz/yXP3XG7p/EHByAK5C/i2YkCHoJ/l55bYG9ZF8qMqTsOihhokb7vNdIVcHqkPmVN6mGUd8Z4r010Xy1sRTVvPytULvYeT5zZaLLSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lc4I9Xv7UeHMomc0vjIRYeyCI6ho7YBVBKeI3gMh0g8=;
 b=IRPure7IHbQSJyqsyvfQZ4TtLtnywfAjjVhukrBqyS4r7FeB99HhmHZUtKt94CrNeqF2XrJuuSjC15Sh0OMxhVsd2zeJ8rGrynd7oKmlgulGx0v5LAb5DeaI0r8DvDGa4IkuLz1ApzzZPKHP8GjQ6drRJGX9Ir9g+XOGKit2GvlGlYTRsqpVIz+bHjjJ3BwIFiyXN43EiJVc7mC0ajJ8MeA2IcXhJJ/QrRL43sL0B0mbQVjuxCunoWCXKPKMBtz8EEpqoHxxbZHspL3f7GYkuZTsj2CVYds9w9UkX0IWRoN9jdwmwPJtjVqIa+f+yTY4P8XupI+/BmcvSG8EnxRhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=konvera.io; dmarc=pass action=none header.from=konvera.io;
 dkim=pass header.d=konvera.io; arc=none
Received: from DB7PR07MB4887.eurprd07.prod.outlook.com (2603:10a6:10:5b::12)
 by AS8PR07MB8153.eurprd07.prod.outlook.com (2603:10a6:20b:374::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 09:00:33 +0000
Received: from DB7PR07MB4887.eurprd07.prod.outlook.com
 ([fe80::5777:c83f:1378:171b]) by DB7PR07MB4887.eurprd07.prod.outlook.com
 ([fe80::5777:c83f:1378:171b%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 09:00:33 +0000
From: Frieder Paape <frieder@konvera.io>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] fix: reproducible builds for initramfs and UKI img
Thread-Topic: [PATCH] fix: reproducible builds for initramfs and UKI img
Thread-Index: AQHZl4wvFTe6tYQF3EG+Nare5lq6bg==
Date: Mon, 5 Jun 2023 09:00:33 +0000
Message-ID: 
 <DB7PR07MB4887C89CABD41DD04CDF9886D34DA@DB7PR07MB4887.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=konvera.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR07MB4887:EE_|AS8PR07MB8153:EE_
x-ms-office365-filtering-correlation-id: 59ca5ecf-b67c-4945-236b-08db65a35202
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NG7UObbD+JIQOE222e92Eq69bcMzB1JykEiG0hVSuUzqfOiSaAlkZjv0DfJOMD7jk5dZ/lxfA+NmxUN/43b9Sf/NxwFI5FcCoLtfHAEfkBhNlHHrlaXSJD5dWF4duEhN28DEMH7dyLXkoHSMD9kGIMSyBV0YUlIqxSo6aXwHqjBEMDN4xTp3GwxzdFWboW4Qa3NxR0pLfwuG9TbmQQIyMqFxDw0Rxm/4P9qK3i4hxdOrWTpRg38RxsA830ptz5qdsxq4dP3VfNBPhtt0r9AhrF0ZCKbKCcHr+ogzPp5O2Hmb1xKq2UlyCtKIfcELkyEDuHbo16qhTKd5s4yqXWhGTct6SF3LSO+ceK6c+k2+XhWAKoYUZhsP2muJq4Nj9dQzzS3mKkrhz4T5J8wTa0bCHIBSA52wxsgicGMb9/5UQ4ABX0/QY8MxjJCMpcvQsGYpVHTuGiuWou3U7p5kQR8tsUkOa2YVc0EWBZd38c5wnj/cYLl9b1tuS4L0IrbRuaFXZJIE54AWtLcb+0kar2MEipMZmmd3q7oXcrBLc/hQg9qZ0+MRdTU6+EDDkbv9YJUU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR07MB4887.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39830400003)(396003)(366004)(376002)(346002)(136003)(451199021)(9686003)(26005)(66446008)(6506007)(316002)(83380400001)(6916009)(66556008)(122000001)(76116006)(91956017)(64756008)(66476007)(66946007)(966005)(7696005)(186003)(38070700005)(478600001)(33656002)(71200400001)(2906002)(5660300002)(8936002)(8676002)(55016003)(86362001)(52536014)(41300700001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?As5S2klyCB9jy0OrW5X+yOPNrmKV0THpo5/F0+MSFlt1kdD1tUeqRbgmoU?=
 =?iso-8859-1?Q?Jim7p/+VaXeqImH7AGVeypndH3+AXpF1gnXffjoGCIPNs0xK52YB7L9mnL?=
 =?iso-8859-1?Q?hC20ZaFjN0UjuwvWc64WPH1tSPlxj7Ba8KG/Otvowd6k0oTrx9sjroRTge?=
 =?iso-8859-1?Q?aLmdtaPYr+rp0GfVilqIL1S+Cg+xXYhNQGwBzGLiVES5HY+1cCqjnWSm6E?=
 =?iso-8859-1?Q?aVLmxA20cNN0OCrSjadhOBalj0E68zg1DBn+F9bqf6ISKFUpZoWlzrzDTI?=
 =?iso-8859-1?Q?NOAfv71ZfarbuQbIby7AfQOq3oap0KpaQLQKguXeTnc+W/LBxii5yocZaR?=
 =?iso-8859-1?Q?ZICWENP9//nofP/Yyt//CInkIwOP4ilpJG1D8e4Yt03e4c6b4ZVWggiHIV?=
 =?iso-8859-1?Q?cJDINIcQTwo2gtpKjUGSdN9F1PvrJcWWD0ZRnz/EsyizkmOOHVyeKTJSW7?=
 =?iso-8859-1?Q?jxBL0THMXZfLutnaoB+qG+45IHxDxxGvZT/SYB5Qi1GBj6JknYcu/d5zoF?=
 =?iso-8859-1?Q?5RLwdExhR/YmKmKGh/f0gX9CctVjBHxkIJnXZSeai3mkUiqeCZJR1XkxlA?=
 =?iso-8859-1?Q?BJ0Cqs8xq38Inwzqj6Dzj6ATH40elg8fgu8tjnWy3vhYROtz6uAXPeBIvn?=
 =?iso-8859-1?Q?b1zi6zRxe64E4F6gKbT6njyPpaWSmCaf8StYEEleDxIEjvxgSOkzSPdcXO?=
 =?iso-8859-1?Q?XVkA+CysZf8IoqgUnPJBwGVKMKaayw7Xx4Dn0cP1IITXwQTROWj6zgec5d?=
 =?iso-8859-1?Q?r6VhUxhKGOQjQozbWIppnTEU8ZqIwUwfVfHPatRQ9tLmWF0VE07kzCmFCR?=
 =?iso-8859-1?Q?WU0MpntV2vERHFFI3m1ViqnL7Rm9EINQlYynBK5rLxCF9S353tp6GcyvLg?=
 =?iso-8859-1?Q?PVILSNRX9ozVhTCMpvBKpJZcIxjGtNGXJjAT8wb1P1uGZlDO9VXXlc6jY0?=
 =?iso-8859-1?Q?ak/+l3hsZXSxTusuhR7jit8K76PCRduX9VaMGkg5rjkkRoBxBDI33JedNA?=
 =?iso-8859-1?Q?6yuX6zOPtcyhOz03YQD6tOGJ4mks/UQ5KyUE86pQ9nzWNJ3J0J4nlY4yzD?=
 =?iso-8859-1?Q?6beI04mgFtuOU/EdhQL0zFvHkYD2E4dVf0TMcWvCJuR2mhUyUcdvKB0SMI?=
 =?iso-8859-1?Q?6IuJ4S1dPajOdB4iBxASeVON4zdB1bEhUTPm++IB6cQnUtkm2FgUYZcsWM?=
 =?iso-8859-1?Q?Bw5tqiHI8BQ4LIEi/rGiziLq2gT07czwvrD864xovhIw86acJpq/igGVPF?=
 =?iso-8859-1?Q?bnk39L4zWOqdaZ+AlcUuiEkqRd1Hq5eKCGdqvG68xdishjE3HXElqykVs/?=
 =?iso-8859-1?Q?JE2XMMChnhniQIDT5+BkrwT1MwX1NhA1zZqsjKhMFRlDGzs1L1nyJS75/p?=
 =?iso-8859-1?Q?jRO3Rt3OeQeImK796sS7kYf//gZm5kXtFg1neFE7Pf941858nRtktn8sc+?=
 =?iso-8859-1?Q?G8QfzG6GmdJIiZmjtdt+TEftqKlFElmyv5S8kYvyoYBcc+xtnZSYvIgGDJ?=
 =?iso-8859-1?Q?lMzb8XYJduYpJ3CbuEwy1vt2q1tRdNzqvSOwkusa4PxRRT9G+qS29qV2gI?=
 =?iso-8859-1?Q?hE58j0O5Aslfi+hpv1sd1Ry8f/AiGDng0UPVJ0X9Z5VuumIpaFL68Ut29Y?=
 =?iso-8859-1?Q?cO2PrCvM06Xks=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: konvera.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR07MB4887.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ca5ecf-b67c-4945-236b-08db65a35202
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 09:00:33.2539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b3d7d979-11f2-46c2-9645-f49075ec004b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMIyIjQbWZ+Le9ErqjSAdHOtSHBfMZE++zGR3JsCLiOgmBe40SklJXIWtZ+M4Q7qdGVXq5xXTw7DNImiX5G7Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 09:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182376

I've encountered issues reproducing initramfs and UKI image builds,=0A=
which will be fixed with this patch.=0A=
=0A=
1. initramfs=0A=
There's a symbolic link to /sbin/init, which is appended to the cpio archiv=
e after creation.=0A=
The links timestamp needs to be static and the cpio append command needs th=
e '--reproducible' flag to produce deterministic outcomes.=0A=
=0A=
2. Unified Kernel Image=0A=
'--preserve-dates' is required for a static 'Time/Date' entry.=0A=
I've added '--enable-deterministic-archives' although in my case this=0A=
didn't change anything.=0A=
=0A=
Signed-off-by: Frieder Paape <frieder@konvera.io>=0A=
---=0A=
 meta/classes-recipe/image_types.bbclass       | 5 +++--=0A=
 scripts/lib/wic/plugins/source/bootimg-efi.py | 2 ++=0A=
 2 files changed, 5 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass=0A=
index bbddfaf272..f73b4d965e 100644=0A=
--- a/meta/classes-recipe/image_types.bbclass=0A=
+++ b/meta/classes-recipe/image_types.bbclass=0A=
@@ -148,10 +148,11 @@ IMAGE_CMD:cpio () {=0A=
 		if [ ! -L ${IMAGE_ROOTFS}/init ] && [ ! -e ${IMAGE_ROOTFS}/init ]; then=
=0A=
 			if [ -L ${IMAGE_ROOTFS}/sbin/init ] || [ -e ${IMAGE_ROOTFS}/sbin/init ]=
; then=0A=
 				ln -sf /sbin/init ${WORKDIR}/cpio_append/init=0A=
+                                touch -h -r ${IMAGE_ROOTFS}/sbin/init ${WO=
RKDIR}/cpio_append/init=0A=
 			else=0A=
-				touch ${WORKDIR}/cpio_append/init=0A=
+                                touch -h -r ${IMAGE_ROOTFS} ${WORKDIR}/cpi=
o_append/init=0A=
 			fi=0A=
-			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${IMGD=
EPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)=0A=
+			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio --reproducible -oA -H=
 newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)=0A=
 		fi=0A=
 	fi=0A=
 }=0A=
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wi=
c/plugins/source/bootimg-efi.py=0A=
index 43c6fd94d9..2bf7375887 100644=0A=
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py=0A=
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py=0A=
@@ -351,6 +351,8 @@ class BootimgEFIPlugin(SourcePlugin):=0A=
 =0A=
                 # https://www.freedesktop.org/software/systemd/man/systemd=
-stub.html=0A=
                 objcopy_cmd =3D "%s-objcopy" % target_sys=0A=
+                objcopy_cmd +=3D " --enable-deterministic-archives"=0A=
+                objcopy_cmd +=3D " --preserve-dates"=0A=
                 objcopy_cmd +=3D " --add-section .osrel=3D%s/usr/lib/os-re=
lease" % staging_dir_host=0A=
                 objcopy_cmd +=3D " --change-section-vma .osrel=3D0x20000"=
=0A=
                 objcopy_cmd +=3D " --add-section .cmdline=3D%s" % cmdline.=
name=0A=
-- =0A=
2.39.2 (Apple Git-143)=

