Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB8EC83F10
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 21:23:54 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.716.1693171429283234620
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 14:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=hxP2YGTx;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=VoBAndFu;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1693171430;
  x=1724707430;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=v6OLK4dZ+TpAJIS6QXizC7MtWun+zbRc9MOJtt90Qgk=;
  b=hxP2YGTxCf9BZC3lT1Px5YjgSgyieQQady15f3H+LO6IqEi9RqAKxx84
   5a8F/sGmkTeXpLrB13dXhw0hOmGo3FfdvOuc0f+t7UYzLNBxcdlbz327S
   oWr+YLTVuNH2vBF2LCuAKFMmx72Od9I2j79KApxhJsUhr/lK3OCwmo3hz
   uKiplNuTfPjeuNEKbg1jZpm463ztoT1Z8HOCT8YmzWFmyUH74oBuHz0VJ
   FElo32NzaM2HGBeAas3TSGdN2G+WwLD5Ema3SD4WbCTZ4g3nzexApw8Y4
   mWtaouP6a29buP/R/HqIhVhhX3vBuwXEE1AJZ0u4DDmELehZmuFwVZkHv
   A==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqDcbpKd6RtxCKe5Bw5VMfDU/RppsgA60yZ1rGi/uM/AFUxf29TvAr8xijJGPnrtm/TI+fB5F92GxqG4Tau9iuyxs3UHSZvDE8cLE+7oc6VPP77di6nwBZyqxZXB/Mo2UDJ0nOoYjRD4p/jIucyHoEU+OzHSL6brYOPJ1mOwgsHyqfCdulQlsi4znj60nJI4NSq6SL3and6J13NNuo+WMjAzNDgF4T/TC6wrm20K8yMOG11TCijfq7EOGlD0h8LXOjmKXhqkf84B9LCXQZ5ZSdgaeRXwsPIFvgiS7nl1lozqT7cZYvO6j9x3TFxsyave+ngLEr7RtqIiuKJNtM3gzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6OLK4dZ+TpAJIS6QXizC7MtWun+zbRc9MOJtt90Qgk=;
 b=brQfMXHgy+gb/kwWc29/oNM0pECN4wtapIhrcyCHOBqdzoY3qbeiiQ/PSSRbYJrrYaJs3DiLof2DkQ+VWLjzLBhDUnY6opfgwMkRe7XZNFv11BN1IMn1YJeudRKhAR/AgsOCfowAFl7p06Mp/SROWQ75cU4sjYeKNFTVKp1q8YQEUXubi+4vOd5upCsxTAX1hhW3De16leXuqamXOto7jE/C4793ze4l1q45/8VYCFQlx9sVLjW4K62zHzz064xVt55whw3QzEhduEp6RR54YEJOJEjMF1p4UhtdTy3Rb1fEWLn3AC3pj+rXrRsVkJyZ8W85GhDitCDuyT3ELt1LkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6OLK4dZ+TpAJIS6QXizC7MtWun+zbRc9MOJtt90Qgk=;
 b=VoBAndFukSc/8RjowHe2VupJZqzbsgduhyzy1dZA2xl+ilass6Qi5GN0I2ejB/aIuDGWg3QbDZJpG2+fb5fvTGe5LSFBKi61LLgYFZDv/FIIOIvmYfEYKLDKooktr1oxy3JAIdUsac92rmRQRy+7vO6/hiXRwFw1+m5sdqmv6Uk=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Max Krummenacher <max.oss.09@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Max Krummenacher <max.krummenacher@toradex.com>, Randolph Sapp <rs@ti.com>
Subject: RE: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit the
 default dependencies"
Thread-Topic: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit
 the default dependencies"
Thread-Index: AQHZ2L4oPF6GUCcjNkC8EKy0eC4xga/+p5iA
Date: Sun, 27 Aug 2023 21:23:46 +0000
Message-ID: <DB5PR02MB1021304FFF37BA67288997ADDEFE1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230827080953.2005190-1-max.oss.09@gmail.com>
In-Reply-To: <20230827080953.2005190-1-max.oss.09@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAWPR02MB10168:EE_
x-ms-office365-filtering-correlation-id: 14cdd50d-0a88-4a26-61d7-08dba743e5bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DNROg1kQ5c/AgXV6AOtznVMpbkD2aYx92ztPY9ANenQNHOl54EHXK2XcBSSmMEIUJBceYFDx+9qQrXBP8nwbACgrEtyMR1hEgW7aWc32M9ehzFmAozzAXp2MJVs8K+mgE79T+nuS+JCSXhsyn0D+7QONsoZzo14chYuFoWMBne24jjqLujF3w/uuaK9MatSw8qKdEziqqLwa0OB9M7Qw0EiAHNxzBA0CHCuyk5jB0tpFcnT3rnYlApWBQv2Mm5v4he1E0924tfR6AcmYMmZBQHolqIMNLNtOdBM+lpgfn1qjjx9dMDQF+ToLctCV38w1rBQv7bHh4/OUzLQ+8E/8ReYLTijMiohQy36rmeXeOUXiaE2Tj/49FPDKm7eULNDqX8tcxsE13jy6ivtQWIVQqxPvzynh4oS7E4LCKnXFbImx3XB1KYgEYZ+G1B/Q7Y8FjcHLm5X0faV+MKiIEG/1tZ510j6VEl+3gUaoyc4piPomJ3ofMDsNjogjr8B/KLk2M028O3LK0vQRVs/9+VEMau90myU2tmG+3c3WgA2WqRi9tdRgEKM3i2CoHzlDrCQz1Enl7XUiLKPYG4CUD9Kyx7Gq0P2DD3C8wJuGulPWobmMj5e3lj+RELMTx1Litf2y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39850400004)(376002)(366004)(1800799009)(186009)(451199024)(41300700001)(71200400001)(122000001)(86362001)(38100700002)(38070700005)(478600001)(83380400001)(26005)(53546011)(9686003)(6506007)(7696005)(33656002)(55016003)(76116006)(66946007)(316002)(66556008)(64756008)(66476007)(54906003)(110136005)(2906002)(66446008)(8936002)(8676002)(4326008)(5660300002)(52536014)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ziibCJtqn8WauzgK054RDZkli1IRgyBuDO4dtALUVck6V2FcRYUDS1B16tt9?=
 =?us-ascii?Q?bED9GQ1pSDM7PwH8MG29SpPIU6oEm2AFMMzgm2aedhY666DBMn8sFGPyV6uh?=
 =?us-ascii?Q?xoJ9YeDmvEYnNFKD0Jwk9f8WLOBjHmxqe13KSZ32wgy3T1gkoLSmT/KzZeau?=
 =?us-ascii?Q?USNzCcCvo+u+L3r4XmmA3CyFsXwEItbAeaEk1gtdzzhC0wXM37BIkTBPYdEj?=
 =?us-ascii?Q?V+G8X+69GOFHCGd8gy/wjsXxTJ+Wc18oOeEu8RTEhotYNp6aoTtZlkEm2U1W?=
 =?us-ascii?Q?sgGDHOZPSShyUBuIV9iZ7A/eQ/PgDXE4iEj+f858B97VWzG1+DRXa/pO9Cbe?=
 =?us-ascii?Q?lKse1G9ht+spBiMGGxCf1hwYHekaZ86tGwGVqyWwQVFcbpMwnWeHVmXLxRZ/?=
 =?us-ascii?Q?Y99tFPWyr3Y1LduyTxMoX31oNEsK2pbcHiz5ta4DtmQBcP4FPUhQrVDfuL6O?=
 =?us-ascii?Q?2GwF92uyBMFm8zEDeZtCnnOBdwZEGPXpADaYW5lAbkwiev5SRNyw4FjRpgwI?=
 =?us-ascii?Q?bA8OT17Yf6MxndDAOOyX+6rpvQ4f/3AMcSmoYyRiDh9YKzU18VUFAVNGGyQe?=
 =?us-ascii?Q?PycojZFahLyIUESxzmrtaOF0mVNlycvPdosAYJfg7cCIoSdUYaPx6x8ABReL?=
 =?us-ascii?Q?3NdqoZv5sSsVZO7XmNLreldVd5jlOI3bbkMtAhuTScBMKXxMXOj30eiqbcR8?=
 =?us-ascii?Q?WgG6osWdHbhhVD3ED6tOo5JZSASoqShHRakUgY6LsSvWH/Jo7Ta8WIJVx6Z5?=
 =?us-ascii?Q?AVDmrxaY9ftoTjimk5nlhKNMQSpMLZCdxX+RzNGgpD1nqHrZ0xlwvX4qKWRs?=
 =?us-ascii?Q?M5SC6EkTtNrXXN3J8oNqtXXoa7NUyX5+RTJs0g0VdXhcJOjSAXwYbH7nr4qI?=
 =?us-ascii?Q?gVbcCAqw+AGwwGw6JXpec1RtTQxEvNutw/NFbdoTJyoR9FoLGsR1qsk88SId?=
 =?us-ascii?Q?yK1Acidi5CMsIwDwicON4CVik7WsDV0SPgNJ7RY1WU+FAEwPLVyHY2zGaSd5?=
 =?us-ascii?Q?FlBv8RBKNwtSijE1zEa9lQwfC0VE4eaap0sB/YwpfpxyvjLsAicLrT99X4Tq?=
 =?us-ascii?Q?ls7X83MLdCB/ne15Yc5panwSrPF5ie/nUZm1NX+JDw7KV3iY3y1+r4QrAqfc?=
 =?us-ascii?Q?g8FQcSNP6zexZZ0d2/3u2nEdtje0S/T2A5isgP+wcL/dlbSlmMDfGscJdEJA?=
 =?us-ascii?Q?m9NXac2u7gMKfZejCEf+Ob0WbehebX/wyANbdSLBV3mf9rFn9wRKZrKGowDl?=
 =?us-ascii?Q?qHPq9SRFlhusKu+/Dj4LTUfLZw8OHsWVALF9cc87xJwQjg8+BXyl6yWUpttU?=
 =?us-ascii?Q?a3Qjee8KOsZML5yNXOLNmPp4t4Z6x/lJiILjUlfZYoVFqPbfDP7XduZ2C4zI?=
 =?us-ascii?Q?ilgPfZ+w+IEvzuHgMm7czIfawkNf/j6rWLSsS29ddET3NFtCY0Hu+M8Gx5EE?=
 =?us-ascii?Q?H0GGqrqcKRm5pgYKaeNKE9IdmFkMp84Nbbmq+whlGq+DcHSHAWUO+EBHzD5+?=
 =?us-ascii?Q?sDZBVRTcId7pVwH9ZG+zHlj0ajRcxu+dqqI/xxfyO1MZIl6hg9atPM2kwJL7?=
 =?us-ascii?Q?UT5aEfHZZmOYXQTZnv4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cdd50d-0a88-4a26-61d7-08dba743e5bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2023 21:23:46.1869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JZMlZV/VZsCmxTSkVufpSSwsPxjN2fUkynLmFz+x00WNnQoa6EW5rtutwozAiQIj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 21:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186807

> -----Original Message-----
> From: Max Krummenacher <max.oss.09@gmail.com>
> Sent: den 27 augusti 2023 10:10
> To: openembedded-core@lists.openembedded.org; Peter Kjellerstedt
> <peter.kjellerstedt@axis.com>
> Cc: Max Krummenacher <max.krummenacher@toradex.com>; Randolph Sapp
> <rs@ti.com>
> Subject: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit th=
e
> default dependencies"
>=20
> From: Max Krummenacher <max.krummenacher@toradex.com>
>=20
> Hi
>=20
> With commit d1d09bd4d7 ("bin_package.bbclass: Inhibit the default
> dependencies") applied I'm getting a lot of these errors, i.e. qa
> does miss libc and compiler provided libs:
>=20
> ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
> /usr/lib/libusc.so.23.1.6404501 contained in package ti-img-rogue-umlibs
> requires ld-linux-aarch64.so.1(GLIBC_2.17)(64bit), but no providers found
> in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
> ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
> /usr/lib/libusc.so.23.1.6404501 contained in package ti-img-rogue-umlibs
> requires libc.so.6(GLIBC_2.17)(64bit), but no providers found in
> RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
> ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
> /usr/lib/libufwriter.so.23.1.6404501 contained in package ti-img-rogue-
> umlibs requires libstdc++.so.6(GLIBCXX_3.4.14)(64bit), but no providers
> found in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
>=20
> Reverting the commit makes the build pass, alternatively adding
> to depends in the recipe which is using the bin_package class
> fixes it too:
>=20
> DEPENDS +=3D " virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
>=20
> I'd prefer reverting removing the default dependencies over fixing
> each of the recipes which do use the bin_package class to actually
> install binaries running in the target user space.
>=20
> Any opinions?

Bummer. I guess we will have to update our recipes individually=20
instead. :(

>=20
> Max
>=20
> Max Krummenacher (1):
>   Revert "bin_package.bbclass: Inhibit the default dependencies"
>=20
>  meta/classes-recipe/bin_package.bbclass | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> --
> 2.35.3

//Peter


