Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC4EEB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:50:59 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.66])
 by mx.groups.io with SMTP id smtpd.web11.5707.1690231853085906941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=fYGraTzw;
 spf=pass (domain: welotec.com, ip: 40.107.6.66, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7uFlXd50En7+HnTmVB++Hnb045GLfcHXT6VFu7yT3qZI3Lxd2bvwCNpyJXUwXkoVUfFYHTIswKjYtCFcfQ+fUZwk5JaeX0AnZU94AepAGx7+fxWfn0ECULi9CU8vdMyMoLShd0o1qaNDbMNf6j0VuMIqR4Fe2k9guhR65UPwUWlhiarDOgSkjrckZT67qoHjROslmmFvCG29oiP0Mss7u5Lh55rFimUicjkuhOgwFYEdpx6OojyvB3CwX+BtUNauFv+Mfoxid1P5Cvh4fHMQTliGoufPRQraG0NLKoxASaP/o17iCrUC1F7qsapLPZgxgu5oe6Lan0gSyo4+1lmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tikZdqZjJmSbFxWgCUm18FziRvaitlIrMF8zUw4SnXo=;
 b=GrYe01eJaztH1Y8L7SDfpZIEGrRz6VMvHLgbtSE0cVmn7CtuQRaXhkxFywjPNT8y4z9z+jlFtZKyfvCcaWYFFt7XE2/YEH5DTOxJioAZDGDnijyUT7vhLNKTwNdB3/SZy15NBkcqUoJ8n4IuwQRRyAOHZ8kO+nlrO3HBVq49EQ76ElS6xi6sJLnHveq47BwE1KEGnXH9qnC0DSYYv9vDhfQN/jgldngRhv7k+KGx4nQCqzfsAKwCZ93GREkfkdM429fQBBuZzqLKHMH+DP5coz9EaBQ6YKoZgwVxqX8qyJOgt7AnVG9uXKCl3DkIMxsy1lWS+Z0BL8S2RyZQbGD0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tikZdqZjJmSbFxWgCUm18FziRvaitlIrMF8zUw4SnXo=;
 b=fYGraTzwKzO4EZHD7XZxjDMCsDYUZ+BbXW7+KmcpdiYIgn+VKNAg8ON7H5DtjJG1jS6OPFdnYRJsnmKDH7vV5YPJVUk8eYYstJHS4QEoQaNVUMGCHOIPoFr6rO/NH4nGbfa/jjW+IryV/Nmid8Fo6Y8mT1dzlho4g2Jy0ffVvvc=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS1PR04MB9262.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 20:50:50 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 20:50:50 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Topic: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Index: AQHZvm/8VSlpWTizu02GvmSsctoHdK/JY0qh
Date: Mon, 24 Jul 2023 20:50:50 +0000
Message-ID: 
 <VI1PR04MB537371C2BED481FEDB533DB89102A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230724204639.353571-1-p.lobacz@welotec.com>
In-Reply-To: <20230724204639.353571-1-p.lobacz@welotec.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AS1PR04MB9262:EE_
x-ms-office365-filtering-correlation-id: da9f9ec6-76ea-4260-e220-08db8c87a9e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XnPDAMdmAg1fZ2MRwm914buehUFO/DX/dEMG14ESb55f+hGKrSXyItVEtZr0ThrzV0vktENxzwjDbV1B9Z3odqBqz1knQAiLv6JamZi/ozXeO4o8NXKrfLT3XtfHrQ0tZJHEzM5g/Q9F4UIqFbYJ/KYrKKYHXVHaZIlXtlNF8CYDMPToUReBmv+dqPHLepwQ+Yl1B/Q0Jqz7/AzJ33fnS3/T94xs9Nrmni6Ka1Xrx2PfSC96QuIDWaCLBkdElVqrvJg66bcitXviHdasU1tQUbvYDzNt8amAfooPTOckj9XmPHouo+T1vib7va1goQdS/k3vHG6MVdI+EzpCTrSe0B1YluPNtvfuRR3qQHEDnSgsCQPBIcZ8h9Ok86kuPMsUQPN2ceGzowC9pC3toN7NA0e7ZpcAuD0tMm3qIbI7n6URUHc0CncDor1mVaVjpEFlM7TXyLWLoEZjrBrwtp9pzybu3HFeMeaStqB/zOdQlfL2g4/kCoK3gZgjDJpoC9ZGzq+DnMdy/PdPCTebqxp8CnIEANyaYJQR15YtSFBL+llpuXTqXsymvygntHlUMizk2+To520X32084C53HHqG0fBY61s3fUg084l/o9Hf+KM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39840400004)(346002)(396003)(451199021)(186003)(26005)(6506007)(52536014)(5660300002)(8676002)(8936002)(2906002)(66574015)(122000001)(86362001)(55016003)(38100700002)(83380400001)(966005)(9686003)(7696005)(316002)(66556008)(6916009)(4326008)(66946007)(66476007)(66446008)(64756008)(33656002)(38070700005)(76116006)(91956017)(478600001)(71200400001)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?GdlbBbnHYpDxZlgMFlB5GoQKr/oqTjxL/3dgrFxy+xJV2MTyqrUcMdU2O8?=
 =?iso-8859-2?Q?C4YA1eUmEIA+zYa73j1QnXXJVWSdroQQWKbZc9uW8mUTJ+vxb/9efFzgl/?=
 =?iso-8859-2?Q?mFffhzkd/a4XggXPwgwO4t6J2HqEbZeoQm7kNPVlgXIkyM9bPFM9vzQvzT?=
 =?iso-8859-2?Q?kU5K/vIpSrummAuM+5Ro1JEmkOEHcxwjpxopAawTJrCpYzQlPHutv+T3qj?=
 =?iso-8859-2?Q?kp/bSOmCK+SjaV0D70MtaifeoUetHD/uIcQn3MWP3556vCQGWNm1QWwnIa?=
 =?iso-8859-2?Q?+eCX7Z5zmCJGy2KZwKG8rHcFw0G3I2mbsLysWmtEnzSkKWtqFWnDzcfMyW?=
 =?iso-8859-2?Q?LsI8SdVyqfl8CsWXUqlkFrrODDUP9RbEpYHi6jQLZaZMQKtPedRRY5Xl0s?=
 =?iso-8859-2?Q?kpiBtVyWyxgM6x3Tl8CgUP/AgmGqjIR8qtgaIKcvpoHtHnnilEOxNBBlrS?=
 =?iso-8859-2?Q?bSwosY+D4bCVV/havaHcVlkEELdpoiQokXXoN12cyTn92PY68TqDnVGFr+?=
 =?iso-8859-2?Q?mdtnZWaraLCs/6NTLjp7tggmqwKrSL3MXNZrvobMbXuhn8sUcq/xnyOadc?=
 =?iso-8859-2?Q?G9FfdL0jzvSQ2bUqqQictA6F2tPF6lp2YghIjjA11ZSfh7QJpkDFl42w14?=
 =?iso-8859-2?Q?1Wn89tmWp67lQAC/SFv1Ot9S+lh7WGjuR5oFEhSYI4vKokRTLV4Kq4lxPg?=
 =?iso-8859-2?Q?4LdB8Er/vaOfsc5Df/w9fn1XO0CkOfryNhJrcw1gaXY+WO4CbrIir4qhw0?=
 =?iso-8859-2?Q?+A91x46r49YKZ5WtJGtNBmUza1V+hjB+Xo+PYUWPkXRL/91pUfy8doeez/?=
 =?iso-8859-2?Q?AsZopFtc05rEidgIqRQDcuA7MPTGGegu0+quxQX/eGj/c2UuDnWBemPrVD?=
 =?iso-8859-2?Q?2b+xsGEz4mRpx8ki2Xvr5v9pvDiyvLW7iG1jN9/MkFgiHhQAiGCLZ9O2Eh?=
 =?iso-8859-2?Q?kyjJ64MA1R6H4GqXVnTunpi/MchQaJUEYblMoSq40FTz7zS36gVZet5qcy?=
 =?iso-8859-2?Q?0wyRzXCLBpvUF2mbw7dn4vqC6j8qK3/1Jf/rQTrfDMz1vqYnJNBN7FVM4o?=
 =?iso-8859-2?Q?Yt0oQcvghYCinvnqsrVSaJCHAhO2+s9lMTC9RbwvTkQSal2NvabKfUv7d2?=
 =?iso-8859-2?Q?FySDv5qq6uMBCeGqCxF9yQdY/u4KcqoMKPJ72XnCf+H83SmtUzZ9IU81Lf?=
 =?iso-8859-2?Q?+lpubrxMvcHnF6LW7quYPPt0S6KrWS6qu2OXvGTxPkgIbDCUTi8N/lc7Vx?=
 =?iso-8859-2?Q?/BiUMCYnfV5P5pEm/v9qx4/f7pSd28VEvR6T48XnxMT6wVLnBgUQF4RBR6?=
 =?iso-8859-2?Q?l8/xIMDqGahXFG8buPjgCed9x9oSHrQTQ1j9tr5BshrgMFJSB6J6h2YLiE?=
 =?iso-8859-2?Q?J2esV5LwGxP8kettGAUrN4ty/3Hn9pbA/LmEYwbAdIbKDtveIXyFKAu2vQ?=
 =?iso-8859-2?Q?G4sqV1Arewv+oQFyls+1MVNSOaGB+Dc6GjUUSwb6sG3AyqQ1lawUnSZxy6?=
 =?iso-8859-2?Q?R/vch9RrXrMENiu2Vm2+i7artTblkAQ6XR4uUUO8l/GEvpNrnggGZndeAv?=
 =?iso-8859-2?Q?J3fvTESxFZtvsNYD2FIktZZrkuj/8VfdAsekZKE2ME3p+TBuQBGzBtJhAo?=
 =?iso-8859-2?Q?KM7/OE/HS/6YJlpIT3bLYYqBK+i0j6pWY7?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9f9ec6-76ea-4260-e220-08db8c87a9e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 20:50:50.1258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6tqCWnYSDeBXXwyS8h8BGZNBLRZ5iMKW/gtiDktR5Kywnabi6T+Mc7OrszNGnXMzLL8iwJ+VaQVKCOT8DL7ddQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184818

=0A=
Hello Alexandre,=0A=
this is a final patchest which works for me, even with reproducible builds,=
 but additionally, with posix format of tar archives.=0A=
=0A=
I hope that this time it will work for autobuild as well.=0A=
=0A=
BR=0A=
Piotr=0A=
=0A=
Od: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
Wys=B3ane: poniedzia=B3ek, 24 lipca 2023 22:46=0A=
Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>=0A=
DW: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
Temat: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass: add suppo=
rt for ACLs and xattr =0A=
=A0=0A=
Extend OPKGBUILDCMD variable, with additional parameters, depending=0A=
on target distro features, in order to support ACLs and xattr.=0A=
=0A=
With fix pushed to the opkg-devel:=0A=
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8=0A=
opkg-build is able to create tar archives with ACLs and xattr.=0A=
=0A=
Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
---=0A=
=A0meta/classes-global/package_ipk.bbclass | 2 +-=0A=
=A01 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass=0A=
index b4b7bc9ac2..a0f106e4ad 100644=0A=
--- a/meta/classes-global/package_ipk.bbclass=0A=
+++ b/meta/classes-global/package_ipk.bbclass=0A=
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"=
=0A=
=A0PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"=0A=
=A0=0A=
=A0# Program to be used to build opkg packages=0A=
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'=0A=
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FE=
ATURES', 'xattr', '-X', '', d)}'=0A=
=A0=0A=
=A0OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"=0A=
=A0OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS") =3D=3D "1"]}"=0A=
-- =0A=
2.34.1=0A=

