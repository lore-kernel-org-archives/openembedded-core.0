Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5C9C47DDF
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 01:07:54 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.48])
 by mx.groups.io with SMTP id smtpd.web10.4101.1706663270075103022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 17:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Jj7stmow;
 spf=pass (domain: axis.com, ip: 40.107.241.48, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQS2CfN+59W21jpL8UKaH6NVsz1DR1m7+CuyYHiiVhyQo5FI+MF5WbeDloP/53Lg+9rwbWiN73Yw+uyXSpxv8DZh0asqsPPFZ7Mr5JsPOHqAbCoJP/0A//XpHExlhUdv9fnoimDBp45WE5MyWHaIIh8EEKxwZ57ilWPXp3ruLp3xHzv/R1J8rnUOlrbxueoTFLfutoEDTtBE3VMWfDig4zR55Ije5eOQNN225Hf8S0aVlTFNO8x4VYoywToaagQoUuKXsqkG0m/yW0m6wAqKcLQnKJyd7AlyFSLC8XyaNz7SkVLiSZmJHFO2oYeIin9y1JNbCwQwLQkfllHBGhMweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1wTVCEeQdBoCwQt0Bs8cfOziDafPML48KVYTLLx6JU=;
 b=Ke+oWCkT2LV0mviBgVbcp/TwhWpzODxjUOraLB0Jkb2oWo2++DUaXKJ7LXkwYcM5KknTCJNPEm79SiruI2AhwHt36FhKv5RpXDf8aOOUcrd0aCt9un2KdfLlsqyGjLATwp82L263qyRgtaXEOtG1qsC14nol9GX5EGvJENy6N/SLFnhEiPlhe8CbEmxmBSA+7+Oi4XO0h5vOiw7KT3dy5721fZOytY3l545u8keBCu52v4ECafzcmzOdGYUPRWdiaSNeDDGC/MbDX6tpCJ0+3PdEm50u4FBgQxMcXLz/61wh9di5vIF6A1JuvAvTMbDoRMkxlHtDOKG4gTbh9Bl18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1wTVCEeQdBoCwQt0Bs8cfOziDafPML48KVYTLLx6JU=;
 b=Jj7stmowPFMOmqGc8cZNvDNZ+VL97AAZVI+4O8WQ9fjygNWcK4hdNY6NXgK0kSnW1eQIbDjDvf7LcUocIqy46qkgiXtQg2diX+E6q6X1DjPGI9frimiq31rzJxmHPjIi+s06kALPjiHeQcK3ol1rAiOTkQXxdGjtIJelsxv+MFo=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB8273.eurprd02.prod.outlook.com (2603:10a6:10:37d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Wed, 31 Jan
 2024 01:07:45 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 01:07:45 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH] classes/package_rpm: correctly escape percent
 characters
Thread-Topic: [OE-core] [PATCH] classes/package_rpm: correctly escape percent
 characters
Thread-Index: AQHaUt3tpYmhapfGF0atjP7Lzhw9grDzGlJg
Date: Wed, 31 Jan 2024 01:07:45 +0000
Message-ID: 
 <DB5PR02MB102136F693D00ED0CC4681D6CEF7C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240129180629.1631473-1-alex@linutronix.de>
In-Reply-To: <20240129180629.1631473-1-alex@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB8273:EE_
x-ms-office365-filtering-correlation-id: 202ec633-5bc5-45d0-d5c9-08dc21f90894
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 D4vGbLQ9gmNGUfA/2fQbqt4w+wDMi7EJ01zxjS2ZVchOEKLh+KN7wx6gcatzfNK3lbWwJyru96rsYnq58rRTfqH1HuuQyZw9ihdhPk+wIUlMqIZmKiZEvJJD6qyID2ViZzwnwgSs1DzZmiDIf3mSwbUokkFt3JbzMbM0Xp4FdpZZpAreITg2X3zQ8LyZL/ONId9mNXtgx4Pu4dCL9ai7zAbJV4OQ65H4HpJ/HmBER0p46CIq0OLYh+mco5qbivSuKRz+0x+7lg1ZkEF7Nzb5YchF3AD6PKoSHiRiFXQQhSy+Nex51I6sjvPfNsL9f801CWupLbEZt9K5WMK7ROvIbxIlpMp4a8gkLNcZcULldjEA8gYUDcldLy3iicJcOWrHuBQiLhdVLhq2BrPJy0FM20LEooZ9ratLAIpIVV990qJV0AJWPFzU7rut55Of25y/GkSQt5FlLlJiviziq9c0uZ/t7Tl2mlkWVp22kD/oABTiAX3jP3XM+FOelXxSyVj9slvibawmXNTxjqc+rxMKUEV+0mPtLm6YSIAx/WckpLyLuT0/f3Pqwov09G3W/ZylAl3/R/p9hskq9+4SALtvaP2vvVaTHpbcRbgIP39QNoU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(346002)(366004)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(7696005)(26005)(53546011)(6506007)(38100700002)(66556008)(9686003)(52536014)(4326008)(41300700001)(8676002)(44832011)(8936002)(5660300002)(478600001)(2906002)(66476007)(316002)(66446008)(64756008)(966005)(110136005)(71200400001)(66946007)(76116006)(86362001)(122000001)(33656002)(55016003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lQZXnXInjOt6UNhuV81k+g4vakwdjLJlnlDQDcdIaTCA79phDUUuQwicVHPJ?=
 =?us-ascii?Q?bgT1GdaPwkfjWMuLZjPx3ga2jHgpm99jUFnEuAsqpMRzeswvCOxedwfbIdL5?=
 =?us-ascii?Q?nNc2VG7m4mH2yAtQ8C2w7elA9Dh+nBdJcHxcOk1QbLHUFQ3FOH2yDqsGHW9d?=
 =?us-ascii?Q?snetN7t0k0K6G6u0CHZYdfp9hzN/9F9yXQNPr+rwT/SOAcVeEX8/eKRfxcx/?=
 =?us-ascii?Q?3a1QtHunt8dl+8xuweUUB7tLwSqUQ/7/AM6F65Q8S6ajnMW0gpi1iIYsNxN5?=
 =?us-ascii?Q?Copdmy2jgniiVBz0qiNSSJ8WClHCnn9N/Z1j9UufFSaO8Snm2THgP2OK64Mc?=
 =?us-ascii?Q?hewQaNauGdRYk5eCV4lFELBMYks1u6Ur8+J62WYIlGSRXI2hGmDWGn8Cbbre?=
 =?us-ascii?Q?n7UdVgPSmebAxJ7Hb1yKVzAdGwqOzMTmtUHuniuIHND0vGZGy003F+Sj6fKO?=
 =?us-ascii?Q?zZw4c/x80MHD18ASpi4cdUsS+Mb0c/gvbxb+AgSnKBETs7qcFhYmnw+PysSE?=
 =?us-ascii?Q?9PqbxahUnhHgllH4H7A1WHPCTWHG6AhJTaEECQRCUowskiEgY1O1QOGNwE+d?=
 =?us-ascii?Q?xZuWRokZEEZbpvnacv3Fxy7R5GHE8EbrDKdtWpvll5s673M6xrJKccxCvr2t?=
 =?us-ascii?Q?GwRG/7qP48zQ9zPEmuoDohzOIlhHSYpClhwstXHjUL14bMvjOZoRHd47PKOa?=
 =?us-ascii?Q?Y6uUwY/eEE8VvYXnjEQavWc6UWUmboP5Iv8rLqxX/9nGBc0UkSjEJP51VZVo?=
 =?us-ascii?Q?Yf9JixAZiLm4CIBHoBZEJqWtSzi741vzuTaikF1cvH4CNmq14+FQeCqk5hOu?=
 =?us-ascii?Q?g9yoBdMuK5exhVTzKd6YUZj7bqzSw0XeeMFfC0kMpm1a70A+LQtb6aRW/qp/?=
 =?us-ascii?Q?/c8e+As9ymgahs/DLXWF4Se8KB2UdTAxKnrIgMHyx/DSx9VlN3hthAQd5ZVR?=
 =?us-ascii?Q?1z9qs/Mt7J4b+eJvCWJmQ47s+a4NsC2VUBSlBDJjy7lPhk4T9E+1z6yZyIvR?=
 =?us-ascii?Q?IaK2y+FeU80r8pXOc0mY3k8AqglIPtRXAjJiUfiNFOSSv4ftTama7V6b4uVC?=
 =?us-ascii?Q?Pkaj6fKTkwTOx7mQIkBvVfS8XJVKPF+rT7TpSZr5NlUlXVy1vOOB94l57AtA?=
 =?us-ascii?Q?eNvCrbg7SalhlxS4sYD2iJ2ubYklTdTQ1obN6I7JjtKZTZE1oVWE3MGV1aXt?=
 =?us-ascii?Q?y/j1oZjBEY5t2GYUHKsdiRvCoiGIxlaGB15DHrlORg6wVulaV4gsRlu+2Bby?=
 =?us-ascii?Q?Kuw5njjVnZugQr+ThQCOItiTIRVKpykssnqLznIFA6qi0CAELJR6uOlkryov?=
 =?us-ascii?Q?KI9VnzvZqsJ0BPP4mgDGGz+ziR0JPEKFj750se8cOsHjfX9JbY+DZXKrGcKp?=
 =?us-ascii?Q?1z7piXKL+/jVeKg4jG203nptbwon/OlAd7Vq6ZACPX7bFZDONDuHzArEW6I+?=
 =?us-ascii?Q?tVhBIzweAd64klpkkUMjosG7yQ9E8RAqu5LKresLSesPYoNEGVQifFFgJAEE?=
 =?us-ascii?Q?PJANXADVZg9W6G1Gr3jndlJtIERw6EYt6YhnFSFWruFRItjec9o/92aH7sSu?=
 =?us-ascii?Q?BSfJ1QhTxXxJtySCTug=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202ec633-5bc5-45d0-d5c9-08dc21f90894
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 01:07:45.4167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vg1D1CuZpVXIBH2Nz2UsUsPXy7ly94f24ovH0xbyWroOWIzCqCf76qmmcyMUxVTA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8273
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 01:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194505

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 29 januari 2024 19:06
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH] classes/package_rpm: correctly escape percent =
characters
>=20
> This many characters doesn't work with rpm 4.19 packaging
> (as shown by nodejs recipes), and per documentation a single escape
> is enough:
>=20
> https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/docs/manua=
l/spec.md#shell-globbing
>=20
> It also should be done in a function, and just before writing out the
> corrected filename to .spec, not earlier where the path may still
> be needed for file operations (such as gettings file attributes).
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-global/package_rpm.bbclass | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-globa=
l/package_rpm.bbclass
> index e0f4de42a15..819ee502783 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -216,10 +216,12 @@ python write_specfile () {
>                      raise e
>                  return "%attr({:o},{},{}) ".format(mode, owner, group)
>=20
> +            def escape_chars(p):
> +                return p.replace("%", "%%")


Based on the documentation linked to above, wouldn't it be a good idea to=20
handle \ and " as well? E.g.:

                return p.replace("%", "%%").replace("\\", "\\\\").replace('=
"', '\\"'))

> +
>              path =3D rootpath.replace(walkpath, "")
>              if path.endswith("DEBIAN") or path.endswith("CONTROL"):
>                  continue
> -            path =3D path.replace("%", "%%%%%%%%")
>=20
>              # Treat all symlinks to directories as normal files.
>              # os.walk() lists them as directories.
> @@ -238,29 +240,27 @@ python write_specfile () {
>                  for dir in dirs:
>                      if dir =3D=3D "CONTROL" or dir =3D=3D "DEBIAN":
>                          continue
> -                    dir =3D dir.replace("%", "%%%%%%%%")
>                      p =3D path + '/' + dir
>                      # All packages own the directories their files are i=
n...
> -                    target.append(get_attr(dir) + '%dir "' + p + '"')
> +                    target.append(get_attr(dir) + '%dir "' + escape_char=
s(p) + '"')
>              else:
>                  # packages own only empty directories or explict directo=
ry.
>                  # This will prevent the overlapping of security permissi=
on.
>                  attr =3D get_attr(path)
>                  if path and not files and not dirs:
> -                    target.append(attr + '%dir "' + path + '"')
> +                    target.append(attr + '%dir "' + escape_chars(path) +=
 '"')
>                  elif path and path in dirfiles:
> -                    target.append(attr + '%dir "' + path + '"')
> +                    target.append(attr + '%dir "' + escape_chars(path) +=
 '"')

The above can be simplified to:

            elif path:
                # packages own only empty directories or explict directory.
                # This will prevent the overlapping of security permission.
                attr =3D get_attr(path)
                if (not files and not dirs) or path in dirfiles:
                    target.append(attr + '%dir "' + escape_chars(path) + '"=
')

>=20
>              for file in files:
>                  if file =3D=3D "CONTROL" or file =3D=3D "DEBIAN":
>                      continue
> -                file =3D file.replace("%", "%%%%%%%%")
>                  attr =3D get_attr(file)
>                  p =3D path + '/' + file
>                  if conffiles.count(p):
> -                    target.append(attr + '%config "' + p + '"')
> +                    target.append(attr + '%config "' + escape_chars(p) +=
 '"')
>                  else:
> -                    target.append(attr + '"' + p + '"')
> +                    target.append(attr + '"' + escape_chars(p) + '"')
>=20
>      # Prevent the prerm/postrm scripts from being run during an upgrade
>      def wrap_uninstall(scriptvar):
> --
> 2.39.2

//Peter


