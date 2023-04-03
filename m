Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFC9C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 11:17:14 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.76])
 by mx.groups.io with SMTP id smtpd.web10.67315.1680520624724039629
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 04:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.241.76, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORdKXG7U3Z96B49CfdJ3yKQtcMq8iQeO4xm0VLU02mBeNYrdHIhJJ20KFRbHgroQYMmxlqCs975dbOt7KxuU0Ks+bbl/HD3hcpEAo5ElBlMfkWnVRg6G1rpe3xjuu7iS8+HPrt10xxDl5YFs4UBAYHc1T3ppnCWmJNBgqIgOanHLDmNoK0pVha6aGYfRY+IrrYbNb8np+EjxoeWL16e0fo7aAR4/YoFwDVwwfj4Ynx9kZli6QQ5Qzze6/lRxYWuTjKroBxCWJ9ynQ6ajkLs6J/ktrw4SspSOJ5MwZbautU4/kvxzYs6l6VZGEdDUWy+bW+szZsiqnmkLEr2veU2Lag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dk847hcUhWO+Te3Mrc8tRe5KDKBkl5k8ECft2sSPklk=;
 b=LXN2Vi+P697ZCTYmBcDuUW5Q3pRcSsl4UntPYuQRj1JX9H5Yd3PZ14rBBYXl2iVU/8eYQFSKigI9UwD10fDgPFeYs0WGcKfNLcQ+gXkKgoMYJPsZVfbnyp5+65bs3RqHPlERDBk3gSJOEcJ3L65/lnRxvPtJvhUggfWtkOW0D0B1CdePF1JBSGARPz421qdEK5AbnQr05Bjy49ht9GjZS/P3ky/fUgoHhisv5yscnak2K+osgbjpe5H19OlyNYc8m8eEkK/Hz/TZTIleEwaVFQdBBvjeikMwSBXFG2P19dJXFzaISl4uM/SyLInI+cDyiLQUnY7IlfDoEEtDeT0dQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dk847hcUhWO+Te3Mrc8tRe5KDKBkl5k8ECft2sSPklk=;
 b=JLp1CdygYume8LUIH5OzMW4vXfAw7+J9wKULAVjYbO6c4W3CBFc/zbJC9BUEi/nt8Fy6P8QMNkPBraIdltM8Tp8pqL1VZWaKHVei80KNQqVN2iz5Txw1m/xp1dzi2qHDeUUMZWt0WwBxXyZlEXm/1H1qOxePIKvl2kNnD/aUxUQ=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB9305.eurprd04.prod.outlook.com (2603:10a6:10:36f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 11:17:00 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c%5]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 11:17:00 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-core] [PATCH] package.bbclase: Add ACLs and xattrs to
 perform_packagecopy
Thread-Topic: [OE-core] [PATCH] package.bbclase: Add ACLs and xattrs to
 perform_packagecopy
Thread-Index: AQHZZhj+U4uZGLi9+E6SON8BfQHKTq8ZaY2AgAADXLM=
Date: Mon, 3 Apr 2023 11:16:59 +0000
Message-ID: 
 <VI1PR04MB53733065B53023A2623FB91391929@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230403104216.3058652-1-p.lobacz@welotec.com>
 <c7232464074cb0c09b290262955b88b52578c5aa.camel@linuxfoundation.org>
In-Reply-To: 
 <c7232464074cb0c09b290262955b88b52578c5aa.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DB9PR04MB9305:EE_
x-ms-office365-filtering-correlation-id: c18ad77d-72a6-485c-3588-08db3434f1a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eWJ2LJ0uO6Fpbi601rEMmAe9OlXo28L3bMlSzPIK5nZnz5TK4faSHquAm8POWUT8QxP4utQWtrNkzOsN/yjY2/qYtLjG8mpJfVrCDKLNChgxAXlrpLszIlGYemzDQEQYaZgoDbP4+9UPdGeLS+TG8Q3fbImhg2oyby3PX5XzogAfkTo7XKehCaIDaFHew9o9rUVchH8IGClQDlr/qSY1Pc4eXS/3IyuswOXpUCiA+raWm8KPiI0QXyV09HEycF5SJNYVXTOQr/4QkaJjfNPBtK9OzqBCITlr8Xu0Mema+uUnHLjDgLsH8Xv13wUE5Cyf/hGKB3hj50zdIImasF895KffpOxqJZ9fdUOPMNlwzUCQBAnV07iyMjyau1X9wBG4fNnqLdKN1Ew0cqChkd6MmbXpiG++3uYMJSA6B4vpRr4EOb1wEZ84Fhb8TPPxTbo5idCTptV5eRZQUMsWc4SEYfrJHJ/7vrGZ5X/8M+rJuTufIb8G1X2h/bNOYBYOoF1KONG1O+HLt0k/CXdtafVYOAiQrOSc05dTM4PoAC/Gu9AEGTtv735c/6ww+F52AWDcBhFq/UA27l9eBW6XiiYiNPZ3V8Osh4wGevciKPMZQnCf+Q75ucBy6OYQjtUZPaOw
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39840400004)(376002)(396003)(136003)(346002)(451199021)(41300700001)(66446008)(64756008)(122000001)(38070700005)(38100700002)(86362001)(83380400001)(9686003)(66574015)(186003)(6506007)(26005)(5660300002)(8936002)(316002)(478600001)(110136005)(8676002)(52536014)(76116006)(66556008)(66476007)(91956017)(66946007)(33656002)(55016003)(7696005)(71200400001)(2906002)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?Ksgno6tQ3FcmuaGKeMTLU/yZzh/Dt63aXTfjAJeol8rkLsfJ544PFCX8y8?=
 =?iso-8859-2?Q?SeWpI9zAZ0FSkP2bJpYb+zA1zqlWiX+YikBNGr9sBn+nloXnzhNkuwSrZY?=
 =?iso-8859-2?Q?wpxDwxkuXb58RApfqFuYsYVnwOsAWbatRWZaEbjeZTEfyAKhumWrswqiRe?=
 =?iso-8859-2?Q?PWoft/+0dcCCA9C7L80MJA2I4zfqArQ420Jno9pbyO+rsBKuTWOfeMADg/?=
 =?iso-8859-2?Q?Jn0+xZaRGZvjieyNcAhOteD51v9OQxP3RgH4IoCvLlvFpWKWxmwGze/McU?=
 =?iso-8859-2?Q?iR9+K93uLQggNow43c9G/KJdS9BmmQTdN1pTVcM3YOolhHjH1SUSKOAPHm?=
 =?iso-8859-2?Q?6d3vDd7CN1PdnLY4KxlzgHYMqJmPA/5l6fxhDhaLSu1yiGo2zIpTn7jHPa?=
 =?iso-8859-2?Q?Wml/73ShF3y/WTO2YntMdFRcdlxUaTxOWAeGVcz1CW5DMTLRipRw2s7hXb?=
 =?iso-8859-2?Q?GD7r9yVU+9Ea/esWp6AvxUgbRhd834PUPQDcnqOSJjgIZSVdtP/bjbi0/n?=
 =?iso-8859-2?Q?u/RLD7aVFCiCPPsZd5Jf3gwEKenuIFZzTXlefghruFj9mtLnH9YAq+VGzQ?=
 =?iso-8859-2?Q?NL4hmZLrYsh4OTZxWaNb9gtTPyFu+DXWjliNLG/9KHJlL/4DDfsGGqdf58?=
 =?iso-8859-2?Q?Xr/rBRZLzQD5FD/KFKSpeTV6fplciXGDuuZYMqbugkA/7W8ZVZZcNjUBaW?=
 =?iso-8859-2?Q?K/ff2EQ3msqob99vabean5dDKMVqwDIImE5y2gOODdIag1+I7P4Zeytr+0?=
 =?iso-8859-2?Q?IrzMExny5h2+wgs/2IwuaCHEeiTz5ylyjor3hOX0USuHq/6tb+cYXges6w?=
 =?iso-8859-2?Q?b/9+oablMv4L6JiOJ1OkRFiYk1TWWOLySoWFEoSN/iZnk4L6Sx+c0Ar6tq?=
 =?iso-8859-2?Q?jCLn0LUJ3984ins0Nyff2nRyRcg60GcC/khBEQmnhVk9NEZvR8kk936BmJ?=
 =?iso-8859-2?Q?VHpZ+o8NKNwg+pLPmV7gvCaMqKgJwL9tzG1DjYah3suezQd+nZLuWt29RG?=
 =?iso-8859-2?Q?yOwXTYpLPLiF1Qa0CzCt2LBepIV9SlEfGHFLPEjRb55+exdaPjthrDl899?=
 =?iso-8859-2?Q?IeM3lWPN8mKsuwaiXZKjboDLhDE788jLkQyLuS84spzxpvqMxmgn/ZzKOp?=
 =?iso-8859-2?Q?gCBj7O9QigY8G9/IUXwhwokinwogpMllSLXbvzo7HOGTBZvIQ9hCZbks+Y?=
 =?iso-8859-2?Q?auHRXRFVnJm8hbNWb9uGwHofXTCF+AC1Y67f+OqUV0NZpB572UY9CS+3zq?=
 =?iso-8859-2?Q?pD3E2hhhh4f7TiDzxZRoFObJyKJxYjsZpkQj8hys1MsJPRh01X/f2cfOvf?=
 =?iso-8859-2?Q?7fB7xyaMBygAgCIp5Ag5O/06XSiknOa3RrOt9eIXqA/dTDEaBKrUjf4g4v?=
 =?iso-8859-2?Q?H2GZvQqlqCDTTr3+D532CUZrBLdd5k5kOA6cjqSGnG/HUbDjs79G86ACkW?=
 =?iso-8859-2?Q?mQTCPAhRUn88URqk3epHK4/Tc06Os64fxY6QDPKYURuwDX96LArK4b3NE6?=
 =?iso-8859-2?Q?T/rkAlZGk6I/ZLodheIMQWWY8sITC2Pki2lyWgn6Vdf5Mu8rSdJz0QDe4s?=
 =?iso-8859-2?Q?Q8n/7DAbcIi32PMX6bFpTi+CX/bjboXVUWuLAGoyAJ/Hqe1h5GsNZtdTZH?=
 =?iso-8859-2?Q?bApBVg0Fc50LU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB53733065B53023A2623FB91391929VI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c18ad77d-72a6-485c-3588-08db3434f1a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 11:16:59.9744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vk5g2OBXtLdOh1n9ZomnLueQT+pEDaQBcw+0mLEXvWt2I3Csi1qktrbX6w5n6t6dCaHUBBclUFI2iKLzGzz32A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9305
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 11:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179623

--_000_VI1PR04MB53733065B53023A2623FB91391929VI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

This is for the kikrstone release only as I'm currently working on it.

I have switched from debs to ipks as from what I have read they have the ab=
bility to support this ACLs and xattrs.
There was already a commented part of the code in libopkg for supporting th=
em.

Regarding seeing some xattrs I do not know.

Hmmm it fixes 9858 as the ACLs are preserved in package and packages-split =
directories. The additional issue
is with packages itself.

I think that we could add here some verification what packages we are creat=
ing but I haven't investigated it.
Maybe somebody of you have any ideas?

BR,
Piotr
________________________________
Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: poniedzia=B3ek, 3 kwietnia 2023 12:55
Do: Piotr =A3obacz <p.lobacz@welotec.com>; openembedded-core@lists.openembe=
dded.org <openembedded-core@lists.openembedded.org>
Temat: Re: [OE-core] [PATCH] package.bbclase: Add ACLs and xattrs to perfor=
m_packagecopy

On Mon, 2023-04-03 at 12:42 +0200, Piotr =A3obacz wrote:
> This is necessary in order to preserve all the extended attributes
> set in do_install also in PKGD directory, otherwise they are
> dropped and not stored in created package(s).
>
> For the momemnt it is only supported by OPKG package manager
> as it has support for libarchive and tar implementations, which
> supports ACLs and xattrs.
>
> Fixes: [YOCTO #9858]
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>  meta/classes/package.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 2950218145..b0334d9190 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -863,8 +863,8 @@ python perform_packagecopy () {
>
>      # Start by package population by taking a copy of the installed
>      # files to operate on
> -    # Preserve sparse files and hard links
> -    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -x=
f - -C %s' % (dest, dvar)
> +    # Preserve sparse files, hard links, ACLs and extended attributes
> +    cmd =3D 'tar --acls --xattrs --exclude=3D./sysroot-only -cf - -C %s =
-p -S . | tar --acls --xattrs -xf - -C %s' % (dest, dvar)
>      subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOU=
T)
>
>      # replace RPATHs for the nativesdk binaries, to make them relocatabl=
e

This patch looks to be against an older release as much of the
package.bbclass code is now in package.py. I'd definitely be interested
in this incremental improvement to the support of xattrs.

I also wondered if it causes any issues with existing recipes? I'm not
sure if any set xattrs which we'd now suddenly "see"?

I'm not sure we can claim it entirely fixes #9858 since it sounds like
it works for opkg but not deb or rpm packages? It is still great to
see the progress though!

The final question I had was around testing - should we add some
automated tests for this to ensure it doesn't regress again?

Cheers,

Richard

--_000_VI1PR04MB53733065B53023A2623FB91391929VI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
This is for the kikrstone release only as I'm currently working on it.</div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
I have switched from debs to ipks as from what I have read they have the ab=
bility to support this ACLs and xattrs.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
There was already a commented part of the code in libopkg for supporting th=
em.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Regarding seeing some xattrs I do not know.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hmmm it fixes 9858 as the ACLs are preserved in package and packages-split =
directories. The additional issue</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
is with packages itself.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
I think that we could add here some verification what packages we are creat=
ing but I haven't investigated it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Maybe somebody of you have any ideas?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
BR,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Richard Purdie &lt;rich=
ard.purdie@linuxfoundation.org&gt;<br>
<b>Wys=B3ane:</b> poniedzia=B3ek, 3 kwietnia 2023 12:55<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-core] [PATCH] package.bbclase: Add ACLs and xattrs to=
 perform_packagecopy</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, 2023-04-03 at 12:42 +0200, Piotr =A3obacz =
wrote:<br>
&gt; This is necessary in order to preserve all the extended attributes<br>
&gt; set in do_install also in PKGD directory, otherwise they are<br>
&gt; dropped and not stored in created package(s).<br>
&gt; <br>
&gt; For the momemnt it is only supported by OPKG package manager<br>
&gt; as it has support for libarchive and tar implementations, which<br>
&gt; supports ACLs and xattrs.<br>
&gt; <br>
&gt; Fixes: [YOCTO #9858]<br>
&gt; <br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes/package.bbclass | 4 ++--<br>
&gt;&nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbcla=
ss<br>
&gt; index 2950218145..b0334d9190 100644<br>
&gt; --- a/meta/classes/package.bbclass<br>
&gt; +++ b/meta/classes/package.bbclass<br>
&gt; @@ -863,8 +863,8 @@ python perform_packagecopy () {<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Start by package population by taking =
a copy of the installed<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # files to operate on<br>
&gt; -&nbsp;&nbsp;&nbsp; # Preserve sparse files and hard links<br>
&gt; -&nbsp;&nbsp;&nbsp; cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %=
s -p -S . | tar -xf - -C %s' % (dest, dvar)<br>
&gt; +&nbsp;&nbsp;&nbsp; # Preserve sparse files, hard links, ACLs and exte=
nded attributes<br>
&gt; +&nbsp;&nbsp;&nbsp; cmd =3D 'tar --acls --xattrs --exclude=3D./sysroot=
-only -cf - -C %s -p -S . | tar --acls --xattrs -xf - -C %s' % (dest, dvar)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subprocess.check_output(cmd, shell=3DTru=
e, stderr=3Dsubprocess.STDOUT)<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # replace RPATHs for the nativesdk binar=
ies, to make them relocatable<br>
<br>
This patch looks to be against an older release as much of the<br>
package.bbclass code is now in package.py. I'd definitely be interested<br>
in this incremental improvement to the support of xattrs.&nbsp;<br>
<br>
I also wondered if it causes any issues with existing recipes? I'm not<br>
sure if any set xattrs which we'd now suddenly &quot;see&quot;?<br>
<br>
I'm not sure we can claim it entirely fixes #9858 since it sounds like<br>
it works for opkg but not deb or rpm packages? It is still great to<br>
see&nbsp;the progress though!<br>
<br>
The final question I had was around testing - should we add some<br>
automated tests for this to ensure it doesn't regress again?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB53733065B53023A2623FB91391929VI1PR04MB5373eurp_--

