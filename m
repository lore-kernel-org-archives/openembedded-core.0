Return-Path: <Arturo.Buzarra@digi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722B7CF9C70
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:33:54 +0000 (UTC)
Received: from outbound-ip8b.ess.barracuda.com (outbound-ip8b.ess.barracuda.com [209.222.82.190])
 by mx.groups.io with SMTP id smtpd.web11.36625.1727098426309110360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=ftvT/Yes;
 spf=pass (domain: digi.com, ip: 209.222.82.190, mailfrom: arturo.buzarra@digi.com)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43]) by mx-outbound43-111.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 23 Sep 2024 13:33:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCG+DiVaJT833Rc3mcRvxz0XKKqbG31lzOGZ9iBNPuy1v0fghonZ0Fe4MwjGq39F+wu8c1vjT0oHJqdOOcM0pJmGyBm3TQEYzUqWYs8JX6Gs4Vie8s0OwvmcDpB9XDaXPdzSByqoa7WFxUkg6xE5M5BpG/7oqe3uFLFRQkNjVq/z/ZewZ3SCyDDLndLZWjLQ8aZEvd3CKUCTKMqLieVAfLUpjyXYc1xQw7ybTb8Q+gIz9PgS++xX/FTe8l/wHMI9QZOrmRyqdJxToyR3OfIgBF4oqOaJa8FVIBvTAbX33bFQaFeQLHBzw3WxXA3LtZ9MMeWF5ersxtq8crQKlGRxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDs06pzq5DfPR8DFyG/9f8KNzNhwnw0ToR/3s/Z8GUA=;
 b=UJghmp9tsIVkgGkoHDs3yRCeEsbxwrvgC1omUcNiDV0TOXrpN0a8wYQfcnh2lSa4LpI8xRx2nM4ONNqQ8p/kBLq8/p6psgaWW3KWVmuRDJE+gB47BeholDjHGFtKu/ISiBdXxKiFPr2smEXRlEdqvJv44GFTICgQVL5BpE+QvYKDGABAguy8x9zDmQxop20xH2zwtrb3wzdKsCRgtrGpU/HqRQUMKZ3dpMGmXaogu8uanY/a+dWYMmTJPLbHxlYMrDa3e0rHmTwxB0ubQsAYroWn9SWS29tP9E1bDj5w1zfcyU1fz5GnIqvBt8Mg0ktBwmXhjeaYQfFGVT0RWzguZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDs06pzq5DfPR8DFyG/9f8KNzNhwnw0ToR/3s/Z8GUA=;
 b=ftvT/YesyMR98TqqGfrlDp49uGd6Ul8D5vm1lvLEfGSQNfFT6FWqIF5UzJk4touYapdKLxItv4rdQP2aMqPjaXwXv1UhyBRcFagD1LZyke++XOn/3j8mGjzayYg2gN9nCOftnQXFe5OzKmb90ahEVJak4v7OMRgUKfkbXcG6oXQ6oQQl2o1bCoeukoMQ6hCapsyfMgud1Y9cUMYupERiF9REKuD69ZK0PJLunl3EdJSXHxO/gm1sJ838sNflXvr89rJCyq3mGZ7bYltYr+QevUdJLF5TRC3KF9SyXDZxt71wvQG5mxOv+viVd8CkdUURWDMFgBEIaVH7cVwudAvqhQ==
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by CO1PR10MB4513.namprd10.prod.outlook.com (2603:10b6:303:93::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Mon, 23 Sep
 2024 13:33:40 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::c6f6:7414:fae7:2402]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::c6f6:7414:fae7:2402%4]) with mapi id 15.20.8005.010; Mon, 23 Sep 2024
 13:33:40 +0000
From: "Buzarra, Arturo" <Arturo.Buzarra@digi.com>
To: Steve Sakoman <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone 10/11] orc: upgrade 0.4.32 -> 0.4.39
Thread-Topic: [OE-core][kirkstone 10/11] orc: upgrade 0.4.32 -> 0.4.39
Thread-Index: AQHa7Xq/P57C0MnXG0WFZ4q5+jZ3VbJll/JA
Date: Mon, 23 Sep 2024 13:33:40 +0000
Message-ID: 
 <DS7PR10MB4926DCB745BE2CB39CA0A994FA6F2@DS7PR10MB4926.namprd10.prod.outlook.com>
References: <cover.1723551231.git.steve@sakoman.com>
 <092d2a6df6eae6f93a35a0429d2cdfc9b246cecf.1723551231.git.steve@sakoman.com>
In-Reply-To: 
 <092d2a6df6eae6f93a35a0429d2cdfc9b246cecf.1723551231.git.steve@sakoman.com>
Accept-Language: es-ES, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB4926:EE_|CO1PR10MB4513:EE_
x-ms-office365-filtering-correlation-id: 6658dcf8-5578-4708-b7f6-08dcdbd45608
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?RiLz5T6KpvLEyrleqioIoQdiSWhL9cWeyfi8ENgmclcT5qDd28e+AR+xKkXc?=
 =?us-ascii?Q?XMlcKuDODM7Nf4+5a/dTwwtloCVbzga+dm8ZeS0p792vEAnVU9Bng6bva+h1?=
 =?us-ascii?Q?D8Ie6CbuQw/EqdA2gIjgWXE3/hFGajLB+CZnyRJNtwUlloy+UP2WUsJ5GV49?=
 =?us-ascii?Q?eKu+F3Y984gHjF6M1PrBesbyiZJGEsKdUXQ8jq9bmFj1PQNUc6spwQQm0Bcc?=
 =?us-ascii?Q?eoz9KOIO9O5h+Eq9NawDw8pN/HKvkW2zP7dlgT67MEmLUd+9BeAJCzw5Z2zQ?=
 =?us-ascii?Q?spVfheYOO3cn5HlLgd3RQVqsNgPhbHtze09ZGUvxYUDIKdZ6/R63zZ3zV3Ms?=
 =?us-ascii?Q?xd+eINmtWxEBDG2FGcuTaHl9fbERP0Y1HpLx613CzDSdTYURhgMizwn6rfOn?=
 =?us-ascii?Q?1Nbxv6BLXFx9vwmhv0Uyfw9n0KsD6eixvsnf3c4JHMVAtqGAvWy0xGSU0scU?=
 =?us-ascii?Q?6B4jXRw9uWQEyfmIsqWKx1foThJJK3WQ1cI9dX4jGk86Q5z17GbTuDXSYKO6?=
 =?us-ascii?Q?Y0VG44K2WIwlQt77e/B8uBM04/IllzLgNtriIhj+McEVPpYGcG6XuX8MsmOD?=
 =?us-ascii?Q?ZmF0Z+yCwHpNvHTzm6W1r807Ccnb0HnhL6E2g1Q/cATeKRFVNqwpXgJ6kdYx?=
 =?us-ascii?Q?6WPuIkS3MZeY7cq9U86xYCFXluXxw1wW65iOksNIQr8cQVadwaIyfRWZN7VR?=
 =?us-ascii?Q?i/Cje7R4C+W3kv920UhaNl8fWCuqxT9+13sx6F3CxQ5mRuy5aMvzz5eHUNW1?=
 =?us-ascii?Q?pSj5ShhGW+6pD92GI8MBTyIGIhrLoqDu8YrU+MwsAP2Xzpr6ffMUKKI3xiDc?=
 =?us-ascii?Q?vTCwNFk4Ki++2OSdzFAu+7vMkagH7le1PTtxOnfsyaurQZGzM3owdQpf6CkB?=
 =?us-ascii?Q?nGROgNBO0XLVsSN4OXaWyVXg5xwXMEI7DepBqhBlaZHaIM3mQqrUeGArtYTT?=
 =?us-ascii?Q?9rmpnPCjaukdsvEE+Wmee3B4q4VIQzl/x651vLbfYF4bmrDMZvQ0X34BZ8ME?=
 =?us-ascii?Q?6MILOLh+EalmboFRx2UmVL+3luP9z8jfVzxrOjfpWZBJF1S3m8pmZzlJakjX?=
 =?us-ascii?Q?GpuzFxlzUajLGZO2H1izWbNPaW86OurN2jbgyCx6RkDURSU72yJmVFjhxwTM?=
 =?us-ascii?Q?yNmsNMJHnME6e7ssZi7YekwlVKNBHnAAHRObY06xl0jH+hpY0wY2DxkCmSfz?=
 =?us-ascii?Q?GYkUo7YHjDmr6iXOBGp4cDlGprNLPdYGNskm3Ii90C1KIccxy8RMQSjCsGve?=
 =?us-ascii?Q?x9+CoASXLIiWf8Q2for14lBWz0hToqvYojywA/c9Ac3G3GiLgN3k2pge5A6a?=
 =?us-ascii?Q?Pb95d8cfYP0XgFPfnrTQ753J9Ii/+Vnbl1zczcXRO71vqvOALtu9dCNH7/QC?=
 =?us-ascii?Q?Rp3r0xQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+bEPfGwHkWzTJTNAncoGH03XnRqsEfcKAZStoz8ocDu7GjOsjqU7wl81TAD1?=
 =?us-ascii?Q?ypfJnNZA/5zwxGkaEkj38d1JUDQXHAS8hlLK9fManURzL4R0qh3pGLBDPYdz?=
 =?us-ascii?Q?50CD7hS1IqfknNPyHgW31B+2JmbAUW0FDdHFDCdlc3AWDKNcdvE+tGFAWSsY?=
 =?us-ascii?Q?ibAAv4Zh1t72O+DgWv3WTnQ20AVw2Om5/fPIbtA7PfNUcFW/rHMxYQiOBCvh?=
 =?us-ascii?Q?uGVjIlQ581qRU3O3JPGWv92JgA4OjL3gm6LzEBxZY4qAilBQDPvHRftdv9iv?=
 =?us-ascii?Q?L1lvbXwat2CcNUQWRNgS4rMqet9ScJiJTq6TpNZLRzbcjcyyB9Qtncfdk2XF?=
 =?us-ascii?Q?rxN53RpIp3EGQi5uGFyM1SutEdNV/Jt6c+Do1zOGYdOi0C9UdoMrcelqj+hH?=
 =?us-ascii?Q?+GrtL+oX3i9I4EEZh3RKBfl8kkKgmTw5AWPalFV7y3GNvInAk28WCrbOtvO1?=
 =?us-ascii?Q?Z79S/nW2ic5/eOqC0Al8cNq6WMBuFgtJ8UwC1sOc6viAjInOaPY1W7fMZJEg?=
 =?us-ascii?Q?F1nn9zRtNmopFntqmDF9gX3aGj3fVW4X6Op/oSmIitwJD2bRry9MRKiGqy/m?=
 =?us-ascii?Q?PIwkzkB340n7EhEdJW78bzCzY9HGY5Nql7IRt8X8QzUi1IW7muL7dVEyY8Ql?=
 =?us-ascii?Q?IGZ9QYwAFRhUk9vp+Wqalh2n/aolMajOI7l5b1MRQ39LRyUWBkOPuPoRFg99?=
 =?us-ascii?Q?A6vlLln9+f8zHKWiN6wuhg+l6KXV3YIF7Xv3r6crwW7fa83nIEsJkmRpP7Gr?=
 =?us-ascii?Q?qACjfoFxltheB/by3YKrOTMIvXM/Yww0zITPIUKAqDGRndP3Tg33eqnhg1Ow?=
 =?us-ascii?Q?uGO8rSXq51A+cyds68r7IA46Uj189fJIxI06Pf+WfRaaorGrNqCbbnPxIDuw?=
 =?us-ascii?Q?jqhMGXU0QOFui7BGGXQLgUc2oNz0z/iFwW/DLPBeJnP8jeZRXnKv6qzpWpiK?=
 =?us-ascii?Q?SDkMT2/7K/Eji8TFUXIzyxLUe95XW9UZDJxQh5cZA149CzgELhPZMg7MXE+8?=
 =?us-ascii?Q?fjhjpgiGn//gFkkLDNv9FcLI0PQSuSJTSmVqlOGbePmWIjkQzc/yt3LClZAf?=
 =?us-ascii?Q?qwHqpKs537GyF+rkHsnTAScUO97KRkmMcd8Hy2ZE3eUUBKvbFZCXZsW/VAbE?=
 =?us-ascii?Q?v4FaCYWRLnrDS64YZXqoidRsSyPzOIQ+4NbhU6cC0wXPYltJqHG5iT1mrzPq?=
 =?us-ascii?Q?B3l4e1qPT5DQkpVt03NgwwKv23IJNvQqkS+6SbnVKbUZKxYdcVNc7kTWpqD4?=
 =?us-ascii?Q?tcjN4OqIcgX8mnoKGxQDZhsyC1spIsh3ojMyzy6WTyw3ZMZ+bfLdbvVFTILN?=
 =?us-ascii?Q?CJ9Q2RMxjoGL6sgJ1gLtIMmGyIkcKH5g25yeC0BmGEJBn2GAnZHvhT9Bp//d?=
 =?us-ascii?Q?yeezhuLE3TDcqM5coLxcNnTwD4tqSs6SRoKClGY7WiUZ7heuGJ6e+qFb8R9q?=
 =?us-ascii?Q?lfkya7kV3xr37KoDoRyx+zEaX3unaB/KENjvpL2L4dZYzUl0YnnlVJGB/1H+?=
 =?us-ascii?Q?XRmGaBJ4FkdoOSw+ui9yB1g95xNL3hR+EUxDecdwbbh+TP/yQdQmfoeCmYpx?=
 =?us-ascii?Q?h6FluMQno03j+OLiCjw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6658dcf8-5578-4708-b7f6-08dcdbd45608
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 13:33:40.2210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uy4J7Xo3MOx0pib6eyFzfDzhIt3UTgCDAV8MK+Y7501bDM7ONwnQDZuKb4sHqaXant48W+WbmyVwaXrFbbQ1bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4513
X-BESS-ID: 1727098422-111119-12869-7646-1
X-BESS-VER: 2019.1_20240917.2338
X-BESS-Apparent-Source-IP: 104.47.66.43
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVkaGZkZAVgZQ0NIsxSLVPCXJwi
	QtJcXA3NLCwDDJ1NzYwtzA3CLFwMJQqTYWAF2+MztBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.259245 [from 
	cloudscan14-130.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204822

Hi all,

After this update of the ORC recipe for the kirkstone branch the build is b=
roken with Ubuntu 18.04 due to an issue with the GCC version supported on t=
hat version ( GCC < 8 ).

The build throws an unexpected error related with a missing _xgetbv intrins=
ic function that apparently was introduced in GCC > 8

I notice that there is a new version ORC v0.4.40 that fixes the build issue=
s, is there a plan to backport this ORC version to kirkstone branch?

Thanks in advance,

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Steve Sakoman
Sent: martes, 13 de agosto de 2024 14:17
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/11] orc: upgrade 0.4.32 -> 0.4.39

[EXTERNAL E-MAIL] Warning! This email originated outside of the organizatio=
n! Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.



From: Vijay Anusuri <vanusuri@mvista.com>

Include security fix CVE-2024-40897

Ref: https://github.com/GStreamer/orc/blob/0.4.39/RELEASE

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/orc/{orc_0.4.32.bb =3D> orc_0.4.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)  rename meta/recipes-devtool=
s/orc/{orc_0.4.32.bb =3D> orc_0.4.39.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.32.bb b/meta/recipes-devtool=
s/orc/orc_0.4.39.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.32.bb
rename to meta/recipes-devtools/orc/orc_0.4.39.bb
index 829255f110..320abf536a 100644
--- a/meta/recipes-devtools/orc/orc_0.4.32.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.39.bb
@@ -5,7 +5,7 @@ LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1400bd9d09e8af56b9ec982b3d85797=
e"

 SRC_URI =3D "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce13=
4ba73da4af18f0"
+SRC_URI[sha256sum] =3D "33ed2387f49b825fa1b9c3b0072e05f259141b895474ad085a=
e51143d3040cc0"

 inherit meson pkgconfig gtk-doc

--
2.34.1


