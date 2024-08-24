Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37398C52D6F
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 23:49:19 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web11.23302.1724543357544457672
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Aug 2024 16:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=oEZnM2DZ;
 spf=pass (domain: axis.com, ip: 40.107.20.50, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDx3UQkoP5+TKFs2GmHwpdh0Xcjmoi5JOgC57hwfFCMtKUwInQm+uvCrhmY/MjEM01F9AKryXS5scfJfPAMrjAAv4xwzNc0FVEZmjan9bj70Vegkj+nlpt+5gCy3EBlsKv/FKQXfWKpS/j9g8fYkcQfuNk09aplNS8blUYgMg7W0z03/fZLDyD7PsjnzbCMlaOBZ2c4WRqqJY+3CFY0UfiFcMMS4vrQEFIZj4oGy1rQQg6fIEkstwetB0I35zIpyOqfuevkjA08yEVJQLbGXdi2313phvTqmJZkGiujzQiv8nXw0ql020fH+lMojvzqmtrLKQ8QMYgKTqLXZV/WoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1sZm9cUJJGVKoKmMYooo46fu9a4WavXX2F3y17ZWIM=;
 b=EUjyCbvr+gTVZV2tfJJsOWxvpCGklqnPIbT0wPBLYJdw7+JL5TOAxiDVBpVjYFWgLSwYrSTpOVBKY1bBnALxPSmp3nve338BCmUVxqMLkbUVdcr44nNcOOCYA+vSwFerDdgUuI9ww5rVxYwJ9uwGlk9hRpqAzte8tZ/CWEr6JKmIGO+cCW7+l6pL6qc1MQHOIfYGHTfDOfpVPuuPBpMUtS3gssfyjkUkeE+b+03/GkPj+nInLW1o6GRw26qWsz34qMrYHwkxJrl4VXW2og0o0V1EGPM1kdYh/YyvVjMEwJs1Nx63D1giTMY1MlynBrZBRvLYhMlY+IckaBxCCdfWyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1sZm9cUJJGVKoKmMYooo46fu9a4WavXX2F3y17ZWIM=;
 b=oEZnM2DZmRxqyT1mRfH+sThfzh+4y2QdCnrK3S3vZwmNE7dk5nOjrKvTZj7LA8bbXti/PAwsMwq8fAY84QU93zwxcUGUJW/gCcM3pWgbwPpiCJwos2+K9IoPcz16YB+N4bY219TeHCp/7HVGWApeLUdrkBiKS6mIutxa7r1EEPM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAVPR02MB9675.eurprd02.prod.outlook.com (2603:10a6:102:317::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Sat, 24 Aug
 2024 23:49:13 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7875.019; Sat, 24 Aug 2024
 23:49:13 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCHv2 2/2] oeqa/selftest/bbclasses: Add tests for
 systemd and update-rc.d interaction
Thread-Topic: [OE-core] [PATCHv2 2/2] oeqa/selftest/bbclasses: Add tests for
 systemd and update-rc.d interaction
Thread-Index: AQHa9iTQkghjaBe31Uyd/PqgpnfOTrI3BdtA
Date: Sat, 24 Aug 2024 23:49:13 +0000
Message-ID: 
 <DB5PR02MB10213C0025D0ED3D4CF850503EF892@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240823170633.2776886-1-pkj@axis.com>
 <20240823170633.2776886-2-pkj@axis.com> <202408241254541c6af4cb@mail.local>
In-Reply-To: <202408241254541c6af4cb@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB9675:EE_
x-ms-office365-filtering-correlation-id: 43d453bf-d8b5-4b9b-0376-08dcc4975b5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?s8XeeAeChP+tk7kJJjWYaEpoZ6XPglD8UKrWBUjM4Ewu2ZcHonfLZmrIH4sR?=
 =?us-ascii?Q?WL/Uxguvl2W8hE4iYL3mTuBCpIjlwmutMmSod0jonJGjS/LfY9+iCLqyjyHx?=
 =?us-ascii?Q?UAg9Dmf+/ZUq6H3YVoEWTyJlfvzBd74aggTa1yd1GT9XNMI3UbHcA50/+fSX?=
 =?us-ascii?Q?TBWpN/rI7lsDmTfv4YqCde55aPrAEtV9I6Tn/6J4TeaKgT7Tlq9vNjy2P8hn?=
 =?us-ascii?Q?rTHpH0WEdArNm6KTtn98HIw1j1oeZTV9QNXoYz78hcM7UCcaOUbXPC2t6MIE?=
 =?us-ascii?Q?CSfDBKxR/XyQRW68oN4Sk0zhvVWwtDF6TLVhgb4DxEzJ1raOYw7mwoug5AvI?=
 =?us-ascii?Q?KMRhWWuvhTCiGRA1VII5aOpTMwsZUiaa5VLPkF8ZKNnENsuao+c0fvcKfW7v?=
 =?us-ascii?Q?pcKS8661ByuTaR3c2oUJqx1+Gu7X5WtO3VwecxKFYJ7D6T+jusYAwlxxT+hn?=
 =?us-ascii?Q?cfF6abBgW+H1RXe7e9YKxwPRDL8CZwda+ehiNowc0VFEKNQxISaoKWMp1nUk?=
 =?us-ascii?Q?xlpNTE+COGLQqTrnHmuZWU7hNb6uJwYXsERA8niLP9lcIi/+pdxI0pRm8W88?=
 =?us-ascii?Q?/EAMNd98Z87l8BlYn2FBIT4DexeLw0lK78C4d3XtyHO5UE/rkoPMSweeYko+?=
 =?us-ascii?Q?JmOBAh4FUDu/FFLe4rEn1hBR2Nz5hg2tf0sYvzf5K6oXMZU3DL2HEWLTAaZw?=
 =?us-ascii?Q?8zfo0QuxfSTyCoVEeHqjDOinFHGrT2FgcCMr8wjC6QzbVy/DYLqI9SUIZGMM?=
 =?us-ascii?Q?8FlAv7ig4erNn7sPNxEPqusaairCXzRJk/9y1hOOWX4gTjnL5cloHQ1xodpR?=
 =?us-ascii?Q?76gcRGqaJ/zEcThGUCJ2qzqWZWARhUwWTZj+t/XFEJlYn2t3QMiRp93Az0mc?=
 =?us-ascii?Q?1jIFHRbDyAEBgMZ3BD5JxnlEcKeDOQ2X1XOiON5Ggw9c/puycbELDOjl7O39?=
 =?us-ascii?Q?cNRcNSG4R6E1jfFhsqN7BJ4o9t6oc8Unobs9MMEMsOHc6rGYb3StGV8EqS2q?=
 =?us-ascii?Q?blOSieTsZdKol9mHWXGiltpGs7MKSlfrAGQxKDwQmkRTVFZr0ukVkfH40vWi?=
 =?us-ascii?Q?pz+DCsAZ7nQYIiQm1xB+MBxGkkSI9AW3YQ7Tr2n4Rn7VkHXiTpv60GmL48FY?=
 =?us-ascii?Q?+ilDYAhq5zie27+KeRvE3OmCMC/98PvDGRwn5r1tWmwttjd3AkjL20kKYHCK?=
 =?us-ascii?Q?o4/QSq7rhj5afLuleMwJhcyqy3tFxockaStgg45xc7ElWrcrbBqz7X6SKaUv?=
 =?us-ascii?Q?YLRGbnW4MYP89Ci81IAdpixvDfF6QIYQg6Fmzt4Zk88DxMnaku0fdwdhMc71?=
 =?us-ascii?Q?ogSGpp6+tmAu+CpuTlZDlcgeAq4HNxBe2dp7M862K14OVSilGAN7hkaCryEm?=
 =?us-ascii?Q?ekYOyoQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gFIDjIQPLga6pGxTbKbCTqdQFwr+NRajfCnsKQTx1yf6QXj2haLlqXckAHg1?=
 =?us-ascii?Q?oMiajL6iVL3uLwQ9XYam6j5JQQhCD0Tz0bGl9QSDe5jTU1fb9f34ff8Fq4Tg?=
 =?us-ascii?Q?ut2fLxMsoItEygBmdOP6UzMMHMtJZq0ESvOM+SdWCuw2QjhMXviCaACbWQ2/?=
 =?us-ascii?Q?rCc+bk1hy2ibsyquUhMJZVOV8xmI73pzCcJ5qzXl+CLS4GKe22T7rgwnTSK8?=
 =?us-ascii?Q?0wIcJBZ9BV06O18wwVNdr50PXEbskNcSM6MdUQXSeK2yTPeLwzfGoUPpF6NY?=
 =?us-ascii?Q?Ogtck3HgAfMbYjn0VS/AxzQHv7v3cwSrD2I5/v+CpPTP6wQfkD0z24nwc1xU?=
 =?us-ascii?Q?9R7l8Mb0qmoH/KhRp8nLtVdfwbtD2daobXvpiYRDhTMKR09w9FjhFq3IIXBM?=
 =?us-ascii?Q?DbM3v9Ix7Nqdp819xDINjZ7PdJ7oCM0nldXBq1CJANKC6Wkn1teVQu74YX/7?=
 =?us-ascii?Q?TBZCnG8pjIfPwkWqKs63oXkutF7bXmFjzgmcH+7iZ99JRdeFRyzsWbD8R8eQ?=
 =?us-ascii?Q?km1MoplW9dk+7gJ47qsdjR7FK0hPxTZuUeJ26O+MFFkY07WujlQuJI/8gtNI?=
 =?us-ascii?Q?l67JiiUXJ0OHNK1HkKbIx64uziHx6zgN6EHqSsCMkDjJhSAytVVvFZjujEiC?=
 =?us-ascii?Q?V1MkEg9NjjiY87jylLgvbQUsVFjgLMZb3cAb2eTpAAgnfsdUReGdp3WgGkAt?=
 =?us-ascii?Q?N5mhrgZKlKPwGghNlgNohKesrhMtHcRIM46r4+2tgMp8SWmvh+Hp5bUluOzJ?=
 =?us-ascii?Q?ihvc8TV8DTFNGaKWTS3Al7mCuMHekWfRpIvhKtWLSLfXoRrflemT0TZzB4m1?=
 =?us-ascii?Q?InpJOKymL2G2xgN9nlV3PA+5FQfvzkxzZLUKXdSTZelQdZaaCLcBOpNdG3Au?=
 =?us-ascii?Q?m6feLEs8nR5LjtKW71Ui5w4P9/3rsqEPVyMJ2qpytZXG7SLPwdvxblqexGCx?=
 =?us-ascii?Q?8AjWaiv7L6Wknr2RTJ+xi0jf9VnUJ0vQj3j5niwxMHVyy2Px5NYWa/Fhuz5C?=
 =?us-ascii?Q?61vEmPmiMqZQVSzGW7GCZtWKG8pI+VAgrW01OFw13cfNv2M5J2SCFADl384W?=
 =?us-ascii?Q?IDkG3zGIG+PfTHf75DUdekcjSgmltV5W6nsiZZxvyjEwt0CbeveswTcqcBr6?=
 =?us-ascii?Q?RAVPuQOYZd0jz6r34CXvNwETzS/6w1Kq23JiAJlhwUjxR9L1zcI20ay2HRpR?=
 =?us-ascii?Q?Lp23f7beyiJt66LCe+maIxraz/Xu8bMyNwayqCojPqkFJKf688fDe61pMdRY?=
 =?us-ascii?Q?Eo2TsyYv6evdxbrI7JNmo6HQRE6KgJ37fn5xtBgbuYsn8bTW8HcjO9Vr640z?=
 =?us-ascii?Q?sIwscSA21QOUfiR6FxcgK8MKBIKsRkkNxBSClMnhuERxdBXzAV/Fmy8ukCAe?=
 =?us-ascii?Q?qAdhX2VThp/feDRgFGs/cy8kxDZ0RuAkeNY0u06TsaCl51p0shyE+B89DVI7?=
 =?us-ascii?Q?OSBpMFbTspqDNDohpuoNvEK0FQb9abPzVJP7TTE8BBTjsqYGmZOWU2syQvbq?=
 =?us-ascii?Q?qVGPTRapvAWqq+hlc2B72tiimYjppRy1VNnsAn1u0xP93iYZIMtumZSF2nRV?=
 =?us-ascii?Q?EuYnKurQB2Mk6H9LUhc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d453bf-d8b5-4b9b-0376-08dcc4975b5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2024 23:49:13.1782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oh4/osDl3fod8FaOjZ87MFJEUskAmh/G2vstmB4d8veYlnZknK61y6GMfRnUkHdx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Aug 2024 23:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203716

> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: den 24 augusti 2024 14:55
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCHv2 2/2] oeqa/selftest/bbclasses: Add tests
> for systemd and update-rc.d interaction
>=20
> Hello,
>=20
> This causes the following failures on the AB:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/4746/s=
teps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/6435/s=
teps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/6486/s=
teps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/8223/s=
teps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/8110/s=
teps/14/logs/stdio
>=20
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/core=
/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/home/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/core=
/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/home/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/core=
/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   [Previous line repeated 1 more time]
>   File "/home/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/runt=
ime/cases/opkg.py", line 59, in test_opkg_install_from_repo
>     self.pkg('install run-postinsts-dev')
>   File "/home/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/runt=
ime/cases/opkg.py", line 19, in pkg
>     self.assertEqual(status, expected, message)
> AssertionError: 255 !=3D 0 : opkg install run-postinsts-dev
> Synchronizing state of run-postinsts.service with SysV service script wit=
h /usr/lib/systemd/systemd-sysv-install.
> Executing: /usr/lib/systemd/systemd-sysv-install enable run-postinsts
> Failed to execute /usr/lib/systemd/systemd-sysv-install: No such file or =
directory
> error: pkg_run_script: package "run-postinsts" postinst script returned s=
tatus 1.
> error: opkg_configure: run-postinsts.postinst returned 1.

Ok, that was unexpected. Because that is the exact error that I fixed=20
between v1 and v2 (and obviously do not see in my own testing anymore)...
=20
//Peter

> On 23/08/2024 19:06:33+0200, Peter Kjellerstedt wrote:
> > These tests verify that the correct files are left behind when systemd
> > is inherited and depending on whether the systemd and/or sysvinit distr=
o
> > features are enabled.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >
> > PATCHv2:
> > * Change LICENSE to MIT for the test recipes.
> > * Add EXCLUDE_FROM_WORLD to the test recipes.
> >
> >  .../bbclasses/systemd-and-sysvinit.bb         |  17 +++
> >  .../recipes-test/bbclasses/systemd-only.bb    |  12 ++
> >  meta/lib/oeqa/selftest/cases/bbclasses.py     | 106 ++++++++++++++++++
> >  3 files changed, 135 insertions(+)
> >  create mode 100644 meta-selftest/recipes-test/bbclasses/systemd-and-
> sysvinit.bb
> >  create mode 100644 meta-selftest/recipes-test/bbclasses/systemd-only.b=
b
> >  create mode 100644 meta/lib/oeqa/selftest/cases/bbclasses.py
> >
> > diff --git a/meta-selftest/recipes-test/bbclasses/systemd-and-
> sysvinit.bb b/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.b=
b
> > new file mode 100644
> > index 0000000000..f9fc59a494
> > --- /dev/null
> > +++ b/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
> > @@ -0,0 +1,17 @@
> > +LICENSE =3D "MIT"
> > +
> > +inherit allarch systemd update-rc.d
> > +
> > +do_install() {
> > +	install -d ${D}${systemd_system_unitdir}
> > +	touch ${D}${systemd_system_unitdir}/${BPN}.service
> > +
> > +	install -d ${D}${INIT_D_DIR}
> > +	touch ${D}${INIT_D_DIR}/${BPN}
> > +}
> > +
> > +INITSCRIPT_NAME =3D "${BPN}"
> > +
> > +SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
> > +
> > +EXCLUDE_FROM_WORLD=3D"1"
> > diff --git a/meta-selftest/recipes-test/bbclasses/systemd-only.bb
> b/meta-selftest/recipes-test/bbclasses/systemd-only.bb
> > new file mode 100644
> > index 0000000000..590a27b9cb
> > --- /dev/null
> > +++ b/meta-selftest/recipes-test/bbclasses/systemd-only.bb
> > @@ -0,0 +1,12 @@
> > +LICENSE =3D "MIT"
> > +
> > +inherit allarch systemd
> > +
> > +do_install() {
> > +	install -d ${D}${systemd_system_unitdir}
> > +	touch ${D}${systemd_system_unitdir}/${BPN}.service
> > +}
> > +
> > +SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
> > +
> > +EXCLUDE_FROM_WORLD=3D"1"
> > diff --git a/meta/lib/oeqa/selftest/cases/bbclasses.py
> b/meta/lib/oeqa/selftest/cases/bbclasses.py
> > new file mode 100644
> > index 0000000000..10545ebe65
> > --- /dev/null
> > +++ b/meta/lib/oeqa/selftest/cases/bbclasses.py
> > @@ -0,0 +1,106 @@
> > +#
> > +# Copyright OpenEmbedded Contributors
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +from oeqa.selftest.case import OESelftestTestCase
> > +from oeqa.utils.commands import get_bb_vars, bitbake
> > +
> > +class Systemd(OESelftestTestCase):
> > +    """
> > +    Tests related to the systemd bbclass.
> > +    """
> > +
> > +    def getVars(self, recipe):
> > +        self.bb_vars =3D get_bb_vars(
> > +            [
> > +                'BPN',
> > +                'D',
> > +                'INIT_D_DIR',
> > +                'prefix',
> > +                'systemd_system_unitdir',
> > +                'sysconfdir',
> > +            ],
> > +            recipe,
> > +        )
> > +
> > +    def fileExists(self, filename):
> > +        self.assertExists(filename.format(**self.bb_vars))
> > +
> > +    def fileNotExists(self, filename):
> > +        self.assertNotExists(filename.format(**self.bb_vars))
> > +
> > +    def test_systemd_in_distro(self):
> > +        """
> > +        Summary:    Verify that no sysvinit files are installed when
> the
> > +                    systemd distro feature is enabled, but sysvinit is
> not.
> > +        Expected:   Systemd service file exists, but /etc does not.
> > +        Product:    OE-Core
> > +        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > +        """
> > +
> > +        self.write_config("""
> > +DISTRO_FEATURES:append =3D " systemd usrmerge"
> > +DISTRO_FEATURES:remove =3D "sysvinit"
> > +VIRTUAL-RUNTIME_init_manager =3D "systemd"
> > +""")
> > +        bitbake("systemd-only systemd-and-sysvinit -c install")
> > +
> > +        self.getVars("systemd-only")
> > +        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
> > +
> > +        self.getVars("systemd-and-sysvinit")
> > +        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
> > +        self.fileNotExists("{D}{sysconfdir}")
> > +
> > +    def test_systemd_and_sysvinit_in_distro(self):
> > +        """
> > +        Summary:    Verify that both systemd and sysvinit files are
> installed
> > +                    when both the systemd and sysvinit distro features
> are
> > +                    enabled.
> > +        Expected:   Systemd service file and sysvinit initscript exist=
.
> > +        Product:    OE-Core
> > +        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > +        """
> > +
> > +        self.write_config("""
> > +DISTRO_FEATURES:append =3D " systemd sysvinit usrmerge"
> > +VIRTUAL-RUNTIME_init_manager =3D "systemd"
> > +""")
> > +        bitbake("systemd-only systemd-and-sysvinit -c install")
> > +
> > +        self.getVars("systemd-only")
> > +        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
> > +
> > +        self.getVars("systemd-and-sysvinit")
> > +        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
> > +        self.fileExists("{D}{INIT_D_DIR}/{BPN}")
> > +
> > +    def test_sysvinit_in_distro(self):
> > +        """
> > +        Summary:    Verify that no systemd service files are installed
> when the
> > +                    sysvinit distro feature is enabled, but systemd is
> not.
> > +        Expected:   The systemd  service file does not exist, nor does
> /usr.
> > +                    The sysvinit initscript exists.
> > +        Product:    OE-Core
> > +        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > +        """
> > +
> > +        self.write_config("""
> > +DISTRO_FEATURES:remove =3D "systemd"
> > +DISTRO_FEATURES:append =3D " sysvinit usrmerge"
> > +VIRTUAL-RUNTIME_init_manager =3D "sysvinit"
> > +""")
> > +        bitbake("systemd-only systemd-and-sysvinit -c install")
> > +
> > +        self.getVars("systemd-only")
> > +        self.fileNotExists("{D}{systemd_system_unitdir}/{BPN}.service"=
)
> > +        self.fileNotExists("{D}{prefix}")
> > +        self.fileNotExists("{D}{sysconfdir}")
> > +        self.fileExists("{D}")
> > +
> > +        self.getVars("systemd-and-sysvinit")
> > +        self.fileNotExists("{D}{systemd_system_unitdir}/{BPN}.service"=
)
> > +        self.fileNotExists("{D}{prefix}")
> > +        self.fileExists("{D}{INIT_D_DIR}/{BPN}")
>=20
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#203702):
> https://lists.openembedded.org/g/openembedded-core/message/203702
> > Mute This Topic: https://lists.openembedded.org/mt/108059587/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>=20
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

