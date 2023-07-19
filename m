Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C71C0015E
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:03:36 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.59])
 by mx.groups.io with SMTP id smtpd.web10.5226.1689797006841252838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.104.59, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYcxH5NYf2u++DSAg6tQoh84YQe3JCGPa9cFELTeaVKjJfMruYOlAskdUhTrfzLU5AhuRQ/QOqk9hsk0qL1w6Uz7ozZDr6iVksKjeS7SQxx8Zv+G1p/pPOxHhpqHcSKQkcCdf5QSpPgsAm7hhzeQCM5jH+eOL6sbD0zMOgZWEd9BwQ0GTbvVtWj/UTP6yV2UyR2A3HqIr80bRH4loKnXmbAXwEnxrBsZDqk9ZogLQp1CEcshVbL9+tSnoQe6ji28sRO0XWtS7g6vB3wa3zyMm7sF92iA0KIpxJvCmspHEat38LB/GyuyXthMiWpx+RZM3jMOBlJ552BfTA+ZiDTsfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BI+xPfDHXy6TTtSjGj1ar0O0lczEyGG8uWTV5CcZZB8=;
 b=Kdeh+wzDshZ4Ig+fNvsRxekckIfJsjn5WzXY8KKUsPnuYTWV6Ut/hu5m8bzLJYWUCrFL6gVfISiH8fJbXOdYgAyVR5pSw7NuoURdEMzzWIQ616FIWJE3J+vICx/n76cKytF7dF1uGifVawQcmxlEl5YcLZ1bMRCZ/+cDpRdbQCxT6K+Qpg9Vo/8mPXIE6/3MgLJYc+Y2InVmrPRXso0jAG0M2ggYefVI649Cmw5E8zR+ARpXOyi0nhP4+PUzDsX74nDnP+GGptWsM16DVUesR/kzLIzy9j2SQqiHO6iLtVjtVtZtQYciCVXLLNvFLJu0Kg6bIoU8YLYkD1PS93wrEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BI+xPfDHXy6TTtSjGj1ar0O0lczEyGG8uWTV5CcZZB8=;
 b=aOWeKwm1xHAme35oI5ZKhZZ+1aXLZuEvV6RyGnChdUPASnLgJb2PB7WJSHGMUPmlIGkWhRhzcqsriSwZpDd4wwsPk7AZ1j+nGbwIek1O7HhIQvs/FGGALIxYu5DQ2XXwZCcvi2Gjcy8ztrJ/XK+mO19VWjO7CJFSqslK7IZxLdY=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB8393.eurprd04.prod.outlook.com (2603:10a6:10:25f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 20:03:23 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 20:03:23 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZunoNTkOY0WCPRUi2xV/KPhZ5b6/Bf+zC
Date: Wed, 19 Jul 2023 20:03:23 +0000
Message-ID: 
 <VI1PR04MB53733EEEE763D8697F7767D49139A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230719194843.330741-1-p.lobacz@welotec.com>
In-Reply-To: <20230719194843.330741-1-p.lobacz@welotec.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DB9PR04MB8393:EE_
x-ms-office365-filtering-correlation-id: 4362541a-9047-4143-7100-08db88933521
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0W/C0i2bznBMZ+IhGvSmHX7HE6vzJCOlBWAuIXiJYynXlYjbsEGbDDuAjvBTD0hiGskEBtHvVr0P+lWoWjGIiPgEi1fI/VC4QvDNh64fVWjmzY443ei/WHpmbwKLFlblwM9uyIc2NpFcQ9LoOCk41B6VMxnDM0oP0UXp34U+nQCk8qGC00KkqI+UAB0cB+Cb6lNOhKYBFJLtSx2gGnRf1j1H97HieQidsgSEXMjslGSeI+uRQJAHFS+sLVNRojnlyMCIVFOxTfJpaFoyGIPrfrPdhoO5NRYVSe2oNaNZc8QK17r46Aa+bH0OeqAqlwk2b6gJ08K7dbdv89VKpuH5511MYR7F9eoPuLLBXtFW4QYazsH1sZYrTawHAicVJ8rICqp8GeROLFRhJJioFKkTYrJ5/fv3B6lkJHK+6CvEF8V4gRiAtQHRcl/Ywa6X6c494EGCGBRJIxnB8qnB39/he143p8NGW1GnEAdi8MXD3cY61yt0A4xV6kRM9KuubEkbwVGNijNagiRu/wTLpEEYM9O8IkulWTiRGtpJkNZDktD+J+6hgs6p4cZEfwqpIkkvxJfmnlOt6AsPeK0MScQO8IOM0oOKlgwsGUe37HWNS7OVCl1z/cw312DohtZwLZsB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(376002)(346002)(39840400004)(451199021)(38070700005)(86362001)(122000001)(33656002)(55016003)(2906002)(478600001)(38100700002)(9686003)(26005)(66574015)(186003)(71200400001)(6506007)(41300700001)(5660300002)(8936002)(8676002)(7696005)(52536014)(66446008)(66946007)(76116006)(66556008)(64756008)(66476007)(83380400001)(91956017)(6916009)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?3PRyAna6y71oxISK8TxdBmpO9kLE9hVfCmXCAaBu35hKG7cxSbs6o02Neo?=
 =?iso-8859-2?Q?gb0zAACb8LLodCqRrvW+pM9BrgQZySTDjhY13HtRV506G0I/GRtXp+QmTC?=
 =?iso-8859-2?Q?N78WZvzN5ernxOsfLB8lwgjZ0CGdkVZ26edNvy8FxP7QeLEZB1o6LVXt3s?=
 =?iso-8859-2?Q?IX4UbZZ2sxMUhIb70QCn7IdzC00RzJkOjK5PAQlMkzsqQ5XKtqHkv41vdG?=
 =?iso-8859-2?Q?7Ljgc+qz+dGsfWD+J86kD2JtP7423Yf7+3/4EoG6P3FAjTzZtJGWkj7amD?=
 =?iso-8859-2?Q?XJ8uVziLv9ht3wPjAG6LV9JYR4/phe8ydRK3N1cs5LY2e5R8cl6GhCBBZk?=
 =?iso-8859-2?Q?ypzK/sjoqResfG0SZpyTsJ48fsMfQEYMn9SnGOS5zhJrnZdPtP6Fvt1qQr?=
 =?iso-8859-2?Q?wYgjNP1KzrruI3QUA9Y9lAYkbSfkKwsUD0SuCc3UP4ynUytib00JrKCTYM?=
 =?iso-8859-2?Q?IWTBEOEgetAxjYAgbAJIT0FQW1oKO1DkuKIcGm2G5nbbpKfuDyls8TcR25?=
 =?iso-8859-2?Q?uBK5za3VRPmgFRkNjaBlGGBW/ojLr07fvPZg7N9WopTnJrfKNwvUh5kz4C?=
 =?iso-8859-2?Q?GWCk+AxDpUoHvIi3TgOoKH072OT53oBznPhyp2D33OkWzlLeJgJ8mLF+oK?=
 =?iso-8859-2?Q?J3O7b4yq87GHwawcWqakpwuOVLU1jQebBfcRDGiyQloeSJ9lVOsWLBi/Dy?=
 =?iso-8859-2?Q?VQV5qOSaYhdPDHOOyLl9vgZrY0mwNHu7lMXXH82xWpYGKHzn5SBOKv62nc?=
 =?iso-8859-2?Q?Ss0T2RUkBsuUy2QyFjvGdDmFNCuLxOyCm6sMnQnZzQLmJbe9Cc6ZNGwFda?=
 =?iso-8859-2?Q?hLm+nl+DJbVBmCCcvSx2YlZQM6Sd+lRU7RQrz1qUTK3TDY6zlYEVlz5Jpw?=
 =?iso-8859-2?Q?wbcazJedTwLHWEMAC8Q6evBz7C2Kv2F3sgUzwzuvdXrYdNYijFC74RYq+5?=
 =?iso-8859-2?Q?ql/0oZgt+OAhYUSFGpvoGJElLNvXw7sOzLifUjoPgmENQq1is9AZFggTRJ?=
 =?iso-8859-2?Q?d8nt7jgz428mPphOv2yx3lfcTUS1VDlPD4nu6gUT6ajQG9iDeDjhnErecr?=
 =?iso-8859-2?Q?uoabit/RvsSD95sGxzedd/oFGi1N2Ps/Dzaaxk0EeVGJEpI+IGLkuGIr9t?=
 =?iso-8859-2?Q?lGzPv/t58BVVsEa/sxGwTjta0P3Ut0sMB2b9G5pt13NKyYvQqcKlBhIPik?=
 =?iso-8859-2?Q?+KQCFdqrGWGoWyBPb70PhNl3PfgUlPsRKyNrEZYDFCFXoQ92VwnxuorVFf?=
 =?iso-8859-2?Q?cVaR5zG9Va3V9r7Fp9E31novHJ3l30/qlwniH/qRDH9GDl35LDnmNJYU+K?=
 =?iso-8859-2?Q?fMB0Z3oDzjOYHM8pnsBsQ31WkcknigSVbSrw5IdcM4H0AK00cYGlZ0HIyQ?=
 =?iso-8859-2?Q?Ki8DHXNWyjEzFmPUnuOFHJB0xGlsxCjbCgUj59s0/l8tgsznnAp9dxK+rQ?=
 =?iso-8859-2?Q?4/tr5EG8JMafoezf2++IdsNp8v9/PMUhkYX1FEHNfoYhehe0VLvr9trlIO?=
 =?iso-8859-2?Q?hfdFBgS8UyL0KLRQWgygFBNK41W7j1Ckpnr1LBtyNHNk16S/XeGQ2zBATj?=
 =?iso-8859-2?Q?OxhRUkWn7wz35J2xUCa2Vy0FrprQv7xSsrCSqu0wREIOHJNkZwh2OSHBDv?=
 =?iso-8859-2?Q?JPy1QS0uoUJBwGS+OgZ27LTyTSL1xV6nI2?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4362541a-9047-4143-7100-08db88933521
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 20:03:23.5486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YrcN9KvS+vecO3KWFZPbIiRRKgF4YvHh6iJ1zNQ6RYz3ivcMVrmHok6gJ51ZEA+KNwYqLdynyOzKIfKTcmN0AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8393
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184605

Dear Richard, Alexandre, Alex and all,=0A=
this patchset fixes has additional patch which actually fixes these warning=
 message:=0A=
=0A=
[log_check] Warning when reading ar archive header: Pathname can't be conve=
rted from UTF-8 to current locale. (errno=3D84)=0A=
=0A=
I do not know if it fixes this error:=0A=
=0A=
opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-xcb-pro=
to-dbg /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686=
-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-nat=
ivesdk' returned non-zero exit status 1=0A=
=0A=
because I was not able to reproduce it... I'm testing it all with our distr=
o configuration files and I do not know what may be the differences between=
 our distros.=0A=
Maybe next autobuild will tell us something more hopefully.=0A=
=0A=
BR=0A=
Piotr=0A=
=0A=
Od: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
Wys=B3ane: =B6roda, 19 lipca 2023 21:48=0A=
Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>=0A=
DW: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
Temat: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro nativ=
e features support =0A=
=A0=0A=
Include support for ACLs and extended file attributes for native=0A=
builds, by default.=0A=
=0A=
Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
---=0A=
=A0meta/conf/bitbake.conf | 2 +-=0A=
=A01 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf=0A=
index 9625a6fef4..8daaaad615 100644=0A=
--- a/meta/conf/bitbake.conf=0A=
+++ b/meta/conf/bitbake.conf=0A=
@@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"=0A=
=A0=0A=
=A0# Native distro features (will always be used for -native, even if they=
=0A=
=A0# are not enabled for target)=0A=
-DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"=0A=
+DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"=0A=
=A0DISTRO_FEATURES_NATIVESDK ?=3D "x11"=0A=
=A0=0A=
=A0# Normally target distro features will not be applied to native builds:=
=0A=
-- =0A=
2.34.1=0A=

