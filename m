Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40C8CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 11:00:09 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.115])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17893.1762167603024010035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 03:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=lD8ahqwb;
 spf=pass (domain: navimatix.de, ip: 40.107.162.115, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNgTyIgjdH0SU2o8XwBNX30H/2693ZYgAlCVyNhwSFQWATMfiL9Rz3cvqNKQ3F9oJjSt+BuTH4zbMVIocjDkb4rOHNblR5yw5dkM1ptA1Nv+CW5E/3YIVexm0X9Xz+Lrl8A79EVQMcdCl89gL184ce+1P/jenl7LGT8MHilBYhB9jvyfr/G0ptO2vxu5CogSKNmv4kxRN3OcpLENjI6aIla1qHUzPKqEtsXLmZShtBRioUPoZ1WU28y/1LmEdO0sCzsKratCVTgZR/UjHq8pKXGj+yVfhttj5Ng7BsQ8kmempaGQax9slvI7TtfvN0+EDI/purYVjN+0crIQ9PzRRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAv5exqzErwlYoKIiCzpKgILvqj/8HCbFgDtxtladwQ=;
 b=FzRnSljbR1M2prHRzqNjTEbZFjjJ3W5bu4Pk/nU87sEUlFiAYG/Xma55WpypPGzFGxw91Ow/2Jikg0vTJ7dZ1wtJIM0xoq6cyxXNmFQ1840lZbXrIooP/I4fJYlhVc8nBRWZ0qmOqssHWFxCib2F+BTD/o7jbmHFpXsFhNjje0az9YcdEYQEPN7N03AqLzsoTCk6lN1iOC3i94bzLiODW8t6naxmcs1xG6hHvJPoAi0sYjS8otF7rHGHcJLwDKARLhwycz6tvN06kwh1epxRENyR6lFZDoTybLGUqrnTS1+C5D3vAMnQvo+F0J6frw+kOUbNltS13uPNGJyy0VHSqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAv5exqzErwlYoKIiCzpKgILvqj/8HCbFgDtxtladwQ=;
 b=lD8ahqwbtoweRj8dTMUSQGhVLAm+SPJKMX6pi+0cvLXxUYkbnLvBqUCrFTD6rCOWrNGHtwonxBdWj5q5nzog4X1nQGXSULzJ1QOr4GCGvKXrQt08JyMvlGW70nB4UDZWFJRq7fKjbBJMGNYRNe4HfrjxDKMYnJNI9B9lKlGe4iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI6PPF9778B9A8D.eurprd01.prod.exchangelabs.com
 (2603:10a6:808:1::35f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 10:59:57 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 10:59:57 +0000
Date: Mon, 3 Nov 2025 11:59:55 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org, f_l_k@t-online.de, 
	richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [kirkstone][PATCH 15/19] gtk+3: rename tracker
 dependencies
Message-ID: <j76kdjsr2gfjkcn2ouhaoy34kzyydmjzqdve52ttriip5tseah@xypzq6gqwcun>
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
 <c1641c15f747f70250ab3257edee3640d8cb916f.1762157680.git.joerg.sommer@navimatix.de>
 <fa662162-32b7-4be3-b93d-ca879b9219b4@gmail.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="xcn3ri4pxq4oyu34"
Content-Disposition: inline
In-Reply-To: <fa662162-32b7-4be3-b93d-ca879b9219b4@gmail.com>
X-ClientProxiedBy: BE1P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::13) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI6PPF9778B9A8D:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe1705e-449c-4b0a-7888-08de1ac82057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?+K0JinU+gSWz9S3BTkD/XIwezQSn6uYjaxuOQRNVNKiGOdxIuwsZxhj8uX?=
 =?iso-8859-1?Q?ZDfYPEcDNhz044owYOG7rx8xof9PkdMB87Zx3eoWpLljWUil/fbmpSKaQ0?=
 =?iso-8859-1?Q?EFOxkjY8WZ2wSYFQoXtCN9+tBmSdo9c7cMwo/f2drENf7NITZBt8RNQzdV?=
 =?iso-8859-1?Q?pWreCeODohNwcuG4kpDVJ4jK2EmideTPghlUAeXtHfoRjLc8nIqZCMIR/Z?=
 =?iso-8859-1?Q?DXvHisVLb3Q/mz3KvMpqG4ZjDLVVLalHD6CrGb9qX34Zq+TxIhbOlfWyOo?=
 =?iso-8859-1?Q?k3Faa78BDd/HO2nxcCPrs3n9Q99YguH/WG8Htze6z8yU+sVoJjFZ+TBgHb?=
 =?iso-8859-1?Q?ZxBVHpy+NQ8aGNjjtvJaBS3UEfwCLUqXHLEHspz+yyh+he6anJumqfv7mT?=
 =?iso-8859-1?Q?IBY2uIhRwygBWymLWxaAHcshMrRJtsREjt6dz2zB7E+BrTydmHfvAZJ69F?=
 =?iso-8859-1?Q?d6Jdkp93H7GFY+2gPYckCW/xVsNdx4jHlp1DecyXPH2jRKwfXzCKbMpWMn?=
 =?iso-8859-1?Q?BqOcAhvaqUm1OWpKR62t9DSzpdUXwaB1cR7lTo8kZJtRmjJ9j+EIXiC/nu?=
 =?iso-8859-1?Q?3nBXLqVGNEbeGOd3SYgElGIF0LLsCDa//oQKgiHtIuqQsPrEJKP28k8whJ?=
 =?iso-8859-1?Q?4j1aeFbrsgk9kwCMDQCD8B74I0PTPDH3BajjTKGpetsn2IYpJloZbBKHNn?=
 =?iso-8859-1?Q?dcSAaLm8uq0rgsvb+fikhiAnpWQEZSkV8CnHzIYyKoyRlACk5yuSF/KDDK?=
 =?iso-8859-1?Q?iS53VsHWAqjxojAmMeBwQqewQcK5C9OCQmkWmOIB1zA867SiTc/6oaceF5?=
 =?iso-8859-1?Q?pPVDq7L3i/ygKbzH7yEcqY4q5EF9zgJ8dWZhifYihRwnoWc3dzxpXS5e8n?=
 =?iso-8859-1?Q?d7NB9YmawyfxGEEXDeFEIvkcQg/QHZ1Uao/gl7BM5pOIP5MigZ35xCgxDT?=
 =?iso-8859-1?Q?0Hbdql/awjwqxNMVmXcq1c6YE2HzyyNlnk3ec/1j9//5oCvjtpIoALzWrD?=
 =?iso-8859-1?Q?lAWjEf4mbUUS8P4j06EMzhXgrHAOLO839QBzsNfKo4yjMHdPwOjw+HQljA?=
 =?iso-8859-1?Q?MI1iQqZq2z2kadeLqdgpR3TTO2dieNmteROjTMTc7s3JkbzgqQImvzGTDK?=
 =?iso-8859-1?Q?FnMQocrcLLvl97iDZm8P3KN4C+TFj928WKAVKLznts19bW1wx8zO/ut4IB?=
 =?iso-8859-1?Q?PfyTt92e18a67EQC+nAYQMq8g0C3Z24RWXeITgIB/zv7pQVrrB8rmoNk9O?=
 =?iso-8859-1?Q?BuPnNWt/FP9g9ayLz4ub8yyw80u0oQGR7jiaHfPnoiVr/6YjxAcSZTWqn+?=
 =?iso-8859-1?Q?hBUdidJTlnjjS0TJ82qE3YD3uGpJRklbMI0hw5BWgJq/BTB6eBIsP7uazW?=
 =?iso-8859-1?Q?2O3Vp2pX6AB5YqiIbNbzGnnd6npK8u/GIo9buTQLeh0pnohdj8jkN2LxVm?=
 =?iso-8859-1?Q?EjqiLxiYf3qVXi1mMxcaZKbh77sY2PngKmRYwA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?NfeMKx+CFmW+cZ92Pbg7K/ltX/uQjEsJwyRyewvZVEhCxr657jMr9E//dU?=
 =?iso-8859-1?Q?uN3zYRAYmOxFibdK1luDk3s9IoKBlN4Rza5LhHpffuAJpO7vI2XkmBmjTN?=
 =?iso-8859-1?Q?gdxI+v6rzwFh1C1fcmdBtzljOEqxiujd6c/o3b9zlsUPwvv0b5A9rBxZJm?=
 =?iso-8859-1?Q?lI4UZUgVIZN4wXCBOfQDK7xVBl/1kH8VTZRCUEtdwNaxZfBF4JDq6g+ohj?=
 =?iso-8859-1?Q?XFSHws3I221DLd/NBpicLdDtxLGRxQ0wsBhsYfiZWRhYC+FNbrBlp8svUA?=
 =?iso-8859-1?Q?Q3ntRFhY5DGkz/lI3MtY9OFEULm865K8+RkBuokPMAcgv06MPnIWAf/z4g?=
 =?iso-8859-1?Q?UYOhggZgPjGm8hP6d5c2S9LqXiRWNugwzH03RIQd4h3ev4uR61RbBU7Af2?=
 =?iso-8859-1?Q?Vsyxil5uRL9oTA4JQ0ytfQcTXwcDZxCV8guhLOo/CRujZPiSBohlp5GWhp?=
 =?iso-8859-1?Q?RhfpxV2qTe9w84B52/6L6EEnkgZDETIqifZn+UL8kC9Kl7r2xAjb7xeT1G?=
 =?iso-8859-1?Q?4DSEKTKsVz6hRoJcp+gZ/ManuardWB0NKlR1eQjhRwAyA5UBzkhQxv5U4A?=
 =?iso-8859-1?Q?pqBdoOimGYOuVSiG0ht9grFHd4ueYxYMwRVA58l/AM2+tSvaNfTn9Na0wW?=
 =?iso-8859-1?Q?/EYYacenBZkhRdFv4fiUdy4H1kwqF46QYMOwkZ3wooowtIfZbLYHLgPsHq?=
 =?iso-8859-1?Q?ET9Ogy1dVl5uQ+G68+ut6Ip3h5rip9U7k4x3WcOjfWb2I1XBt/uZTuzRqL?=
 =?iso-8859-1?Q?xqULvqDOUzzLjSzPjOMoedHGKIISFyDP1zrBRIwUv4oBGXgz9fknsaPt+R?=
 =?iso-8859-1?Q?cFofyuZX+XA2OKuhZrNH9MBgUphyY7WnhGWXsQXpy/iqJYF1u5jWhGImIl?=
 =?iso-8859-1?Q?tEHBIYejeRt1NydLRSXyKyJSWEZVf4ufL99EnqeCikwvZ+VEZnBkeGsxZk?=
 =?iso-8859-1?Q?rJQLVZqCXeUXd2OUh1FCNO4eUZyCPWtHXbgHK7BTt+n1VlsCmDGa5VMa35?=
 =?iso-8859-1?Q?5cwxAZCE/9zzVrLtv2GdvDdCpXzA/fCTvGFCqSS2tAQaYAd/Fug9/y0VFA?=
 =?iso-8859-1?Q?X+zG9VygH7bmLKnaThuwuH1zw7nlzUZFU3IQ5wr8pcHtDFoxEyIg43JtHG?=
 =?iso-8859-1?Q?iHcRD7+rE9w5w4XR1/F//xheOaVpeR/wEpLtOIR+gI7GIJPWpUV8QM+/Uq?=
 =?iso-8859-1?Q?KiXTCYFkI0/y9GE0clHF9ROiNq6kqFaBRL6z32dJ24ZyHxvKri2m426uk0?=
 =?iso-8859-1?Q?eJZr/ReK5kXhvAagDxNvYTXT58NGpYz3yIDPHMp6xABWyI6sF8dexZtNIJ?=
 =?iso-8859-1?Q?gttMyNqAcvYWMVAbOZcDDYAcH7+mD8gMT95RPMYwojUNInwCKmVQSZPh7J?=
 =?iso-8859-1?Q?76P49m+6INszgyUQTypgGSt2i1Mp2t+qKIpQfqVSa88K9gGKcEOcbfkfwQ?=
 =?iso-8859-1?Q?SGr/1lQ4pU2k06hniGqhjz07ovSuMoVgpCIU0vYIGF23VJdZRFnuvbUKW8?=
 =?iso-8859-1?Q?WJ8vNV30h01p6fQXyHsz/k+HgNxTUBpoIHMobKy7Ifr4IUp6JyzXRFUxxi?=
 =?iso-8859-1?Q?ZQccAf8sDeCyjXi3ShlC8/lMaxHWFGOIo6rj7++A21i6ozX5zIgGM5EPcH?=
 =?iso-8859-1?Q?w5pg75jbYBxRtWdTJqGLV/WuyLDF4B6vQ0L7VjBgTms0ukjUIk0HRsdw?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe1705e-449c-4b0a-7888-08de1ac82057
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 10:59:57.3071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybMUTJZlK+69xr/+0J54uMXbaGg9eScF54lKGCOE740Cpy4JdE+hpahvM9SQrPzYZyEUU/27RSImWwNOuMeomp78vfKTTTaCK9pDT3Q/WQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF9778B9A8D
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 11:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225642

--xcn3ri4pxq4oyu34
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [kirkstone][PATCH 15/19] gtk+3: rename tracker
 dependencies
MIME-Version: 1.0

Gyorgy Sarvari schrieb am Mo 03. Nov, 11:15 (+0100):
> I'm not sure if this patch can work. I believe tinysparql was added in
> Walnascar in meta-oe, and I'm sure that it's not in Kirkstone.

Yes, it fails to build. I would drop the following commits, because there
should be no user of/need for these PACKAGECONFIGs.

* gtk+3: add PACKAGECONFIG for libcloudservice and tracker; fix cups backend
* gtk: Add rdepend on printbackend for cups
* gtk+3: rename tracker dependencies


> On 11/3/25 09:22, J=F6rg Sommer via lists.openembedded.org wrote:
> > From: Markus Volk <f_l_k@t-online.de>
> >
> > This is required for gnome 47 update in meta-openembedded
> >
> > (From OE-Core rev: 51864b3494bd8fe456fffb2e0ccf70fee13cc013)
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cherry-pick-of: 07d2dc4c98f2fe1e2c8c0aae5ce863e7bc190b5f
> > Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> >  meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk=
+/gtk+3.inc
> > index e1603b43fc..03913768b1 100644
> > --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> > +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> > @@ -47,7 +47,7 @@ PACKAGECONFIG[wayland] =3D "-Dwayland_backend=3Dtrue,=
-Dwayland_backend=3Dfalse,wayland
> >  PACKAGECONFIG[cups] =3D ",,cups,cups gtk3-printbackend-cups"
> >  PACKAGECONFIG[colord] =3D "-Dcolord=3Dyes,-Dcolord=3Dno,colord"
> >  PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Dtrue,-Dcloudprov=
iders=3Dfalse,libcloudproviders"
> > -PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,trac=
ker,tracker-miners"
> > +PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,tiny=
sparql,localsearch"
> > =20
> >  prepare_gtk_scripts() {
> >      mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-ic=
on-cache-3.0

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--xcn3ri4pxq4oyu34
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIThAYJKoZIhvcNAQcCoIITdTCCE3ECAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG
9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMT
JVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAw
WhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4w
PAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBF
bWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY7
5tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHb
SuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfq
B6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC
0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz
6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5
v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNV
HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9j
cmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNy
bDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3Au
dXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfX
ehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2
f102qxxvM3TEoGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGW
MeK1w+vnKhav2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF
8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bw
c/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F
2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORds
NmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNK
cIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQR
EJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVv
JsmzNicwggUwMIIEGKADAgECAhEA/OH3TxzsxiYnBai43hD2fjANBgkqhkiG9w0BAQsFADCB
ljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0yNDA2MDQw
MDAwMDBaFw0yNjA3MDMyMzU5NTlaMCoxKDAmBgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBu
YXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUp
uQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wbv4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AH
QAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63w
hIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4N
EMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPh
vLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQdxilvAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIw
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggJ7MIICdwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggaAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjUxMTAzMTA1OTU0WjAvBgkqhkiG9w0BCQQxIgQgNAGWHf+o
jJLpHvcE7OtxY97WFxguc4rxfBBJE3hPSlUwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAL9hTk9fwr8k
YjHwezUyFbYMNP8R0QP20Q89pfpp0DcDtip7EIDXOnRDpaE9IZInZDDOuuTSCAZNiiQi90Bj
/66PObnpt+Ylse0m+XiLMX4nIQ4zrbvC3+VmgrhDqhVIT3hnqyRZf24cD4fneJzhOsmyIRYm
liROxmoLV+Z2aWaMaBHBlv1/SIrs2NjIIl7uq0bGp1Z1GrmcUiS3fnJgvkRXIwjd5alwFVhm
Mq+KjAT9PJQKmuYjPqY/dCbk/hLOm4hns70LUvN29RdHsG/H2gtOwaF0HcDypyINjAUUKmUy
6PPK+bkbau8MToY2KUDytwtiCQsXKWpoXjpbX9JPCBU=

--xcn3ri4pxq4oyu34--

