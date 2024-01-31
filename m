Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD3FC46CD2
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 02:14:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.47])
 by mx.groups.io with SMTP id smtpd.web10.5339.1706667236212767204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 18:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=FmXK3jGL;
 spf=pass (domain: axis.com, ip: 40.107.22.47, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0rszKUCM8SctaWOZizRfNr7WnzTRxtVnmvBMuPgjU1uVJNO5QIZQQH82g+1bu0Huf4duDhCXS8+aFiyxsTNfZ2LyFj5Z2UTYu8sHfgIoSYS71fR81NtAHiz+3e6ntZ+v48wr2N28AczyaqierlvwQP6BGASFvDp41phrUTAMzJ0fYJZ1Rwo3FSktXDEhXYkM+F19TOzDrJGGoMY+fEjVf5qWnf87KkemINcVahullxydox+y5KvPlULp2nigTlqIFK0GMHgvNLWX6BILTorRcOUkAY9bsxSasJ/vo00SGxBjoBA/GAQm5iWW9umzfdHNRntpBSQX6HyqnzNV/Wmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7UyTbiCI11AnhZntcGwXf4KttIHiegicZroI4Zg16k=;
 b=Xsd1I4f453OoEaDODxykoKz5JWc471+3ASuozNMExWI4lPldbcp8rn74NVwBXdLu4WwKv+mxhkKQ4iM8uJcZA++4uG8sr+YEIxfrPZp8ybG++l73+6qP0WHC45H/mMaI/iXArM0iTh5szLfL5sTlRR2bSaWil9BTvuoQ5zpiVI7/bcYK5Q0SjF8BMsmAM8Qf6ynY056HEofpjCA9jA39zaSTjRGWTnjU/YHZGMFG7rhbdx+puhawD6E40DemxFHx0UIKHS/7iH2FPRBx/0dOY6h0G3+RCWn5ZGi28GSZP17kvDkkJI6oidicuDvid0AjIzUclk5/vR/biOovYJmsHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7UyTbiCI11AnhZntcGwXf4KttIHiegicZroI4Zg16k=;
 b=FmXK3jGL0vWCeGM0AGioU2gomt2EMUCb6KD5x2QGzcpgPZ5WBKPV1F7GKvuz5lPP2e3Ha6FEkgwBXk6XFwnaicLV7FlSnSiT0CFsHfJWfkIm0SAvk/xkVzMFh7yfDVgDcbEsNxCk0Q58p0iQx58+7Z/IS3t7NejPnTBdUIViyIc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB10791.eurprd02.prod.outlook.com (2603:10a6:150:160::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 02:13:50 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 02:13:50 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "william.hauser@meraki.net" <william.hauser@meraki.net>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] native.bbclass: base_libdir unique from libdir
Thread-Topic: [OE-core] [PATCH] native.bbclass: base_libdir unique from libdir
Thread-Index: AQHaSWozsZHS8drNtk2EyRtKv7dbYrDy3CGA
Date: Wed, 31 Jan 2024 02:13:50 +0000
Message-ID: 
 <DB5PR02MB10213D59796AFD6F99B2A463FEF7C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240117163003.27667-1-william.hauser@meraki.net>
In-Reply-To: <20240117163003.27667-1-william.hauser@meraki.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB10791:EE_
x-ms-office365-filtering-correlation-id: bd7bf3fe-5182-472f-74ba-08dc220243e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 f8M1eIUyXlWhQlnXz/jVquqSESDUKbQA/YjmOOx0MsMmVFmmQIp7lZZhvJWdycHQSlJD53tq68zVD2BxfIWVqWLrSGu0dRLQXRBR2Ki0Pepsi3fdPddneNcR3LSPsWFGK3vz/rVMR8kMyvXNlEDnL7mKNrAIEEkxwx61wckjdRD7rM+gLYnMlBgpZvghP3LS8xcfhFIDi9y/Gk4kyaZF+frnX9QE+7x3/mk/g6oxDdPXcuWOEdAnbuXjdLQCxBlzJFN0WIyoikW3jeS+6XCJScVd4qJ0Zx4JT9ABUjB+CSe09rTmOA1WXUpEi7k5lfbmfGkE4+Yso895Nmm6giQhb8o2zh8rkpSFBO8pMAcd4TsTDCNtKnl+tm/Ylrta+/1gGgUXzvgk/Qb307Vtcvy4hZ8/g9sMqCM6+kAXnY/BhP0lmn0TBgYLN02UzX/g2ndXagq2I287926JVG7ZyCQuRMhidFifNOeVUI76QPOWZHUxw9fEGCr4A/TMHSbfJmBrFG0sopD4bdy20CRooBXRoFD/BFUcjjkA3o2HM5s19kz6HQ5XQ0FB5rKIugEYacyiPIX2Yb29vQ1FTnh96Sh1bTN1gR/LIDhbX270IFhHyPqMgTq3yk7L+V3CiKh5A8u6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(55016003)(83380400001)(9686003)(41300700001)(5660300002)(52536014)(33656002)(71200400001)(53546011)(6506007)(7696005)(38100700002)(122000001)(26005)(4326008)(8936002)(8676002)(6916009)(66446008)(76116006)(64756008)(66946007)(66556008)(66476007)(478600001)(38070700009)(86362001)(44832011)(316002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?tcw/bcH9+iyD/IxuSzl6xisgx7DekKmOKt4RjQGmxFVcYjqUEEuOsbJHMHxx?=
 =?us-ascii?Q?qHc5vL+DNJlFFjcsVezn2Qljp//hI6gbL7z/6RgcFZelmHjGtKDl2bTVNfsh?=
 =?us-ascii?Q?49x7uJMx90QKUyUa2zarCskzn687NFejINSMrSyMQddpwVuJWX+0LLE1Ju3U?=
 =?us-ascii?Q?hCtFhlOBkJl+seVj87EpWJDN90GUnjAUyPU7GnBq+A2tCRcZl4w2sAJciU23?=
 =?us-ascii?Q?OYnenke8WBgqsssYt8LbfmnoNdlxvNCstPIpf1FDgjFQDq3xC6DbJA54aliB?=
 =?us-ascii?Q?wVrDCoxIK2gB3wNDiQQoTAQSsQZjl05BsyDPemBJ8H6TtfK0Oc6FRPlQuUsx?=
 =?us-ascii?Q?h6mX4O5eGHWYUsJ39xp0Q3r1auhZrXJSIkSewxDEjhsMMv13H2dyXCAqC1Ek?=
 =?us-ascii?Q?wKhdGOefCcT/zck5cVmPW5BkrFwyb8V3jrAbWoMfeoxwmAgeiyV7Uy2fUac2?=
 =?us-ascii?Q?YCLl1xTpdiKOCelOk7+GunH8a6vuzPY8mnWoL3xnUK2T1rB900jKBycCfRlS?=
 =?us-ascii?Q?2adBTIQ7xkU30b0NCcD3etngNEb3376y1+hG9Lvd1psiqlogkQ5wsxbTyj/K?=
 =?us-ascii?Q?fQI1uXJKrZebaS1W/VanQqolymEytvp0Nx4oeCQOMkJGe+/57k916owTCXNY?=
 =?us-ascii?Q?xGF4ZzXAUL90FslfrpvQLBOpHTEcaz/IOreIRwz9Ycn0J2kPP6WOj3rMJY2Z?=
 =?us-ascii?Q?VosooUFBnwoFieppWvdBWU30iN99YCu/CQnSqgif0UT+xubDOoDw/+7ZV0tr?=
 =?us-ascii?Q?yD9ut38aSDjeuXPknrZsqllfO36uImIGcNlN3bxanVvTqNA/SWA2S1ggnyxs?=
 =?us-ascii?Q?KlnxNn+tK0wOMg0vmkN/pf2oqIQFEy4EssTy6JWRX0MwWC2VKLAQXKMmFjRv?=
 =?us-ascii?Q?d7bkPlVIRs8z/9g7pzabiHXM/enBXf5jLTn7K3WlHGVt4Vrc03dl3eWEzV9T?=
 =?us-ascii?Q?AWu91EJpejZMDHAB6UZhVAf5pu1UT7bfk/ULMGhyKwn/tmImhv2UBmnbAmKv?=
 =?us-ascii?Q?l8yyoSxEN5gCMwEjD3auXUxipoF7jkl8eXXGJlpIO3NBq+iadcWqL5UrDUfd?=
 =?us-ascii?Q?3GLx2P0iinB/AppR9GP4jF9EQpmccaZLyIpO0sYRdgVm72I7Yfq3TqK3j50p?=
 =?us-ascii?Q?F2O9cP9UHUY95FM5z0Q9OllnKWe3Fo3F0ayybc8okIdJi/noDIAbMUjUzdcR?=
 =?us-ascii?Q?GBetTxo1FoTRlmr4lqnkVCT3vlN96/tzum9PSvqo+WbOMTffB/Nl2GQfsYoS?=
 =?us-ascii?Q?bKCdJqLTZkJr/avwXW4lu6xCWpLSuZT0ROZDpv0uOhrhAJ/WFsYm67AQZvFy?=
 =?us-ascii?Q?kOl1WdkW2XkUrUriwMVE7jy2u9boOuLeiYMOWxK9nPlnOY1iQ2aRH83R6rG6?=
 =?us-ascii?Q?aUV37iLmazeNp9o97w+V20zyseUFckMBejYTUkKrL0zfCMZMwoWC7i2BnY3V?=
 =?us-ascii?Q?DU7+0cRPvE/nFHuSjiK/+6uvbWJ0DZ2nQvrNusM3Oets72YqAAidBtNyAuow?=
 =?us-ascii?Q?rNYdBglAJLpE9dTggP/VS9jKvOzHwBH6I/wy1lhcHRmhrdnRmyk3gAV2QkWa?=
 =?us-ascii?Q?RR6bZKbvmPgwHDmXg7I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7bf3fe-5182-472f-74ba-08dc220243e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 02:13:50.4154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ghU0LpBCSG7sbbeViRv8ECyPKLuFgpsQX1UL24ugvlC6+EBhSQabmy9XFvPp9am0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10791
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 02:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194507

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of William Hauser via lists.openembedded.org
> Sent: den 17 januari 2024 17:30
> To: openembedded-core@lists.openembedded.org
> Cc: William Hauser <william.hauser@meraki.net>
> Subject: [OE-core] [PATCH] native.bbclass: base_libdir unique from libdir
>=20
> Use STAGING_BASE_LIBDIR_NATIVE for the value of base_libdir instead of
> STAGING_LIBDIR_NATIVE. This will avoid conflicts between the two
> directories.
>=20
> Signed-off-by: William Hauser <william.hauser@meraki.net>
> ---
>  meta/classes-recipe/native.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/nat=
ive.bbclass
> index cfd299d0c8..84a3ec65da 100644
> --- a/meta/classes-recipe/native.bbclass
> +++ b/meta/classes-recipe/native.bbclass
> @@ -77,7 +77,7 @@ exec_prefix =3D "${STAGING_DIR_NATIVE}${prefix_native}"
>=20
>  bindir =3D "${STAGING_BINDIR_NATIVE}"
>  sbindir =3D "${STAGING_SBINDIR_NATIVE}"
> -base_libdir =3D "${STAGING_LIBDIR_NATIVE}"
> +base_libdir =3D "${STAGING_BASE_LIBDIR_NATIVE}"
>  libdir =3D "${STAGING_LIBDIR_NATIVE}"
>  includedir =3D "${STAGING_INCDIR_NATIVE}"
>  sysconfdir =3D "${STAGING_ETCDIR_NATIVE}"
> --
> 2.34.1

What was the actual motivation for this change? I cannot see a reason=20
for using /lib with native where it has always (for some definition of=20
always) used only /usr/lib. It seems odd to start using it now when=20
usrmerge is more or less standard these days.

In my book, any recipe that does not handle that base_libdir =3D=3D libdir=
=20
is faulty and should be corrected (rather than changing the global=20
configuration). This is because that is what happens when usrmerge is=20
set in DISTRO_FEATURES (which is perfectly valid to do also for native).

//Peter


