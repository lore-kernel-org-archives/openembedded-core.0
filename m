Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DA5EB64DA
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 13:02:28 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web10.4818.1690030944048425247
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 06:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=kHi7gg8b;
 spf=pass (domain: welotec.com, ip: 40.107.6.74, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVPxDVbU+xO/oGtJGGG7XReqDKx9/23MxDe8mgoDAAi5onP+yCuIuinNXMYwb1ezcggLLfQadTcYhRk8wLvv5qBKbyvBx2SD9VSkHghfMkJEm2EE2mNQzgsU3LKxtUNF0Sa2L9rDbofwuz+V7wK0Cs2DtlKLikC1DbWLJ8ZcjIk+YZaHZODbX5cI4Tc2zNa55O/5jDAN4OgGjDQMOy7v524EmppmZ9KkK6E2UXk+mayrXdJaAIkUaq0IXPVZCj/oBglKpRk2rwUDwfuqw4kIvWCfpb0z5I+53Cyf3YwFerC2YqjtD4X7c04O9ReRCjK7nsYhZ5HLQ61k+griXuT6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dA0SDB5NhTeQ5GETSInHCenIo1+ZqYeEc97/3C7I8rk=;
 b=lJ28fdUT8/KXK1lERmSsV+dLwbgymYc9vPOjS0b1IuoV5SiQ/FKtgYha8PaYkoeqez4Zk2pJV0H9BMcAZ+nb+lZFshQaBhA4y+Qw/qA9lt5/olYBPmTx3RjreYkXLBMoZ8T/R6DoUD3GkrlgyHcDBkqaagT+jUOzvzPjLz6Txeuu1lGSs+UatB0iEiOs6fr21+YX8tfFi3PGGQXajo9yFxWFIJmyn/TlTQAfR0y9FngZlgx8eGaKioNaKiV2TbcY8CeLdA3kiKSIcDP28Jr4ecnmoHX14K66nvT7PZnKDNKcLHIX1yacSUvF1GGBO7vfO+2futWoxozb+OwTgrj6CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dA0SDB5NhTeQ5GETSInHCenIo1+ZqYeEc97/3C7I8rk=;
 b=kHi7gg8bBF9RRI7PE2aAXFA2LcrLtQImG0nIomFdrObbQ3f3BxKw0zeJOovvv0PGx4y+JIXnqk+of61aLh7GLb+0JO6gd7aUAKIT83f+pNnUw8oZnjbWKBCacC5vM6T0ZeyafL2Fv5PMtTatr3MHtLpDbNkU9G+cwW08nMitvwg=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB8200.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Sat, 22 Jul
 2023 13:02:19 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.026; Sat, 22 Jul 2023
 13:02:19 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: ODP: ODP: [OE-Core][PATCH v7][master-next 1/5]
 package_ipk.bbclass: add support for ACLs and xattr
Thread-Topic: ODP: ODP: [OE-Core][PATCH v7][master-next 1/5]
 package_ipk.bbclass: add support for ACLs and xattr
Thread-Index: 
 AQHZu8vv0VriTzoelE6+8icI0B6pl6/ExjEAgAAYcouAALXogIAAFaUSgAATBQCAAAMabA==
Date: Sat, 22 Jul 2023 13:02:19 +0000
Message-ID: 
 <VI1PR04MB5373C78D9B94E1D007F1AAE1913CA@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230721120723.4006443-1-p.lobacz@welotec.com>
 <20230721220126165c5136@mail.local>
 <VI1PR04MB5373A2654B4B36C498CEC43B913FA@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230722101959f26ff2ab@mail.local>
 <VI1PR04MB5373082EF3B9EB1759C9D154913CA@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <202307221245328c8261d2@mail.local>
In-Reply-To: <202307221245328c8261d2@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AS8PR04MB8200:EE_
x-ms-office365-filtering-correlation-id: d6037679-00b6-4e93-63a3-08db8ab3e1ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EJghKObDPLk+Q9qVyVXtnm7pccZrK4UM3R1yYAXn+/6K+HeSXa4twjtEEkDdxyePqwdkQ6rkrmsPsI3jVVyyVIN+W4kv8ePbSiGfTsed/6+Xy10GH3LmWxOCMHnY+3qXP306ieclxpCQL7jnJC7hp9qSeOCaZKdngQznm/HfntteHvuNpQT5Sat3CxVRPYwX2neAtkroRnx/wQbZV1LMRlhQeb2GGmZ9F5mx57q0gN4BC5D5YCw5/mQOf+SLGILu8NpwSXQG347evZtplATdWUhxjKr7rtnXwuJCDvJZ5nveGN6c8lFM/rqALv0+weNKMPtpbDhU9RyOHGz2m6w+UmhttvEb/UhPSI7C3R5lrrrKijavhumxwVAzLMAI6hTouijkfld0gUPpgDf0d48GfvHlKdYr7T1IMKOlLIpr+yaEIhDMR5kmxC9KIWjD/M2XH+7LvQEyA/ZjpIiduHQ/Wd2eTP4wPSKKMhfF+baz1YnpnYY48NfQrn2NzoJunAfMfN6R/dgdPCyZ6y0TQy6ANukUaIq4qYx0mF9keVpBEDXkRHPAr4ErJd6xRV1JnJOD2KUzSP4cZeo/4AVGGVSDfYUT/k9xeDgALa24cJf5oIo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39830400003)(136003)(366004)(451199021)(38100700002)(166002)(122000001)(55016003)(66899021)(66574015)(83380400001)(8936002)(8676002)(5660300002)(52536014)(478600001)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(316002)(91956017)(76116006)(66946007)(41300700001)(26005)(186003)(6506007)(71200400001)(45080400002)(966005)(7696005)(9686003)(30864003)(2906002)(33656002)(38070700005)(19627405001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?/t4WZjVMTCGKFXx5fzgkCq5Q6gFtAPS8NI0lflAY7x8fCuh50w/mlN1me/?=
 =?iso-8859-2?Q?j4Hqu+G5dff2NAQU6tm4UzLPZMb6lZ9ED7hxoXsRpN85en3p3lpO+Znb+N?=
 =?iso-8859-2?Q?Y/ZxQylUfCR08QA+wPtyiFp0KzmvMyfYM6y8voZAgy135F/Pf7Y3Z4mW4D?=
 =?iso-8859-2?Q?Gsj0XjYU/RXogPXfA0U1ecMMynqZlGFvt8TNKeL4zY38NTusjYajJa6k7z?=
 =?iso-8859-2?Q?X2Ci8+7lexjsIEfkgvEP80OtzncCst8Xx8cGrQFWgumpEjPeivoQqbHkWf?=
 =?iso-8859-2?Q?JMPg7piMsrfVtq8T/a6DZc+jUmTdikmuOLtztqPHE7ascV7LtMEFYiDyV+?=
 =?iso-8859-2?Q?vK2f9DU8MeqcsOWZrJeAkjLz3mWrugzfYZcquJw4lI4oEMR3u77GSfwvyR?=
 =?iso-8859-2?Q?Ls0L77VH0lpV74TQkwIZkDEPgJuipBxelUga1hPBJzqOIMWx2JNHeDwdCV?=
 =?iso-8859-2?Q?2ECxdydN3QB77AnK6A2QuZwm0jB2zCij65oRZvBTT5JeH6OiQcAbT6xukN?=
 =?iso-8859-2?Q?oJaRqQUXXTHewoOD0AT73Hp8OM/B9y6B6+D2OnlOPMNvxUAmO07kayqs6c?=
 =?iso-8859-2?Q?nZYz3fM6Qt0ZzbYZQJFNGLbhOoW02nt+aD/lIdlFfKn9i+A5mxQLVmEoky?=
 =?iso-8859-2?Q?CDeBAF2anftte22l7OyCSBH26UcSRukYfVhfru+XmBQzQZo4Laut4PFe4d?=
 =?iso-8859-2?Q?41v0K7GDCJFcaLnlFUF1CenDHZUiWltFMNuEuU+mdxz3BDngKjMdoNWIIu?=
 =?iso-8859-2?Q?EICr1+DuQl5ltcL5c+htug83pLtCA/63TgvULlmnTVMwhW/TOt5jPZhZKn?=
 =?iso-8859-2?Q?fBb7sCOpjn1YBDGCqk+TIMITYX7a5oRwzqVU8lsLpuRduD/47VXOZc37//?=
 =?iso-8859-2?Q?/suju2lpDd6opKEamb875UMOZhl40/WbQ2l+fezV4coATUgKDditjlVvz9?=
 =?iso-8859-2?Q?j030dHO1Md+QNZsl3uZnGI+3DvgqnRg7vEhJCBu96pDHi0e68b4BZ5Bb1j?=
 =?iso-8859-2?Q?+Hil7LFQVpHGalio3eQAUwqlgZRuijDnGvQMO2hhHPNF2tZKy1EoAnZFvB?=
 =?iso-8859-2?Q?Uni2lfyr4l2lvXDupFc5I0wFsM3Pl7L4YZPl0B6EkvSTsdMxeLY4ygWSx2?=
 =?iso-8859-2?Q?sl4vhP8pOLJdMk8wN3QuqcOlUe3oTfbIj30DpQpbjM4kD3W7Sh65EEjGpt?=
 =?iso-8859-2?Q?95qOMQgI7FHAfjVeO4uyYodFlnYV55nXSPU/+iizDRUEKzQqMBfEyDa3Cg?=
 =?iso-8859-2?Q?oN3zLGGZYlLq/5KLoi9KQr0996A7lsdvQ+nf3B+leAdOzyYsTMCBVhByHh?=
 =?iso-8859-2?Q?p9CY/w9oQKlxNRoG+utLaRB6Mit1HM2vMB5n1gbmh4cLMZ117oKT7tB83N?=
 =?iso-8859-2?Q?tbJD2tIylIRr2nY61ZC4UjzGqEHqg8vdK5MyZbqmwb2XuDjH2akclBmdCI?=
 =?iso-8859-2?Q?Eo7zNtlutl4p2Hj4D2Pds6A1giqTEX0QJ1oXqWTt1XHsae2nHZMoOrmGiP?=
 =?iso-8859-2?Q?EF2mRNdRfj8j823h9jWcrxsDMWD49iA3jC0ulhWKy7JuVnF3LzFtJg1+4Q?=
 =?iso-8859-2?Q?maqfSCyHaSeDQBojSscRlZgY4Aezm4hA+VAR2Yp3nUzc3fvtvWpFJEGbwM?=
 =?iso-8859-2?Q?bee0a9Aq+gAF4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373C78D9B94E1D007F1AAE1913CAVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6037679-00b6-4e93-63a3-08db8ab3e1ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2023 13:02:19.3622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7LBcTf7Xcp+oFUDijR5NO+j4KO9NvXS+DL4RyaA3bbpl0DAI2qak4ZPY2mYVR/YniEUP1piVWUyJ621IHTRFYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8200
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 13:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184721

--_000_VI1PR04MB5373C78D9B94E1D007F1AAE1913CAVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

It does not matter, the problem is due to this line:

OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DISTRO_=
FEATURES', 'xattr', '-X', '', d)}"'

For some reason these '' from both acl and xattr are being packed into "", =
but I wanted it to be threated as empty strings which would be actually not=
 being passed to this command.

I have finally reproduced the error on my side:

ERROR: run-postinsts-1.0-r10 do_package_write_ipk: Fatal errors occurred in=
 subprocesses:
Command 'PATH=3D"/work/build/yocto/openembedded-core/scripts:/work/build/tm=
p-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot-nat=
ive/usr/bin/allarch-WelotecGmbH-linux:/work/build/tmp-glibc/work/all-Welote=
cGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot/usr/bin/crossscripts:/work=
/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sy=
sroot-native/usr/sbin:/work/build/tmp-glibc/work/all-WelotecGmbH-linux/run-=
postinsts/1.0-r10/recipe-sysroot-native/usr/bin:/work/build/tmp-glibc/work/=
all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot-native/sbin:/wor=
k/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-s=
ysroot-native/bin:/work/build/yocto/bitbake/bin:/work/build/tmp-glibc/hostt=
ools" opkg-build -Z xz -a "--memlimit=3D50% --threads=3D16" "" "-X" run-pos=
tinsts /work/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r=
10/deploy-ipks/all' returned non-zero exit status 1.
Subprocess output:Usage: /work/build/tmp-glibc/work/all-WelotecGmbH-linux/r=
un-postinsts/1.0-r10/recipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c=
] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner] [-g group] <pkg=
_directory> [<destination_directory>]
Command 'PATH=3D"/work/build/yocto/openembedded-core/scripts:/work/build/tm=
p-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot-nat=
ive/usr/bin/allarch-WelotecGmbH-linux:/work/build/tmp-glibc/work/all-Welote=
cGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot/usr/bin/crossscripts:/work=
/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sy=
sroot-native/usr/sbin:/work/build/tmp-glibc/work/all-WelotecGmbH-linux/run-=
postinsts/1.0-r10/recipe-sysroot-native/usr/bin:/work/build/tmp-glibc/work/=
all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot-native/sbin:/wor=
k/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-s=
ysroot-native/bin:/work/build/yocto/bitbake/bin:/work/build/tmp-glibc/hostt=
ools" opkg-build -Z xz -a "--memlimit=3D50% --threads=3D16" "" "-X" run-pos=
tinsts-dbg /work/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1=
.0-r10/deploy-ipks/all' returned non-zero exit status 1.
Subprocess output:Usage: /work/build/tmp-glibc/work/all-WelotecGmbH-linux/r=
un-postinsts/1.0-r10/recipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c=
] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner] [-g group] <pkg=
_directory> [<destination_directory>]
Command 'PATH=3D"/work/build/yocto/openembedded-core/scripts:/work/build/tm=
p-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot-nat=
ive/usr/bin/allarch-WelotecGmbH-linux:/work/build/tmp-glibc/work/all-Welote=
cGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot/usr/bin/crossscripts:/work=
/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sy=
sroot-native/usr/sbin:/work/build/tmp-glibc/work/all-WelotecGmbH-linux/run-=
postinsts/1.0-r10/recipe-sysroot-native/usr/bin:/work/build/tmp-glibc/work/=
all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot-native/sbin:/wor=
k/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-s=
ysroot-native/bin:/work/build/yocto/bitbake/bin:/work/build/tmp-glibc/hostt=
ools" opkg-build -Z xz -a "--memlimit=3D50% --threads=3D16" "" "-X" run-pos=
tinsts-dev /work/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1=
.0-r10/deploy-ipks/all' returned non-zero exit status 1.
Subprocess output:Usage: /work/build/tmp-glibc/work/all-WelotecGmbH-linux/r=
un-postinsts/1.0-r10/recipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c=
] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner] [-g group] <pkg=
_directory> [<destination_directory>]

when I have just removed entirely acl from DISTRO_FEATURES.

So, in principle I just need to fix this command and that will be all, hope=
fully.
________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: sobota, 22 lipca 2023 14:45
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: ODP: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbcla=
ss: add support for ACLs and xattr

On 22/07/2023 11:42:39+0000, Piotr =A3obacz wrote:
> OK, finally discovered why in my case removing of acl from DISTRO_FEATURE=
S didn't work for me. We have our own DISTRO_FEATURES:append in which acl i=
s being appended and I just removed it from there.
>
> Unfortunately, there is this file:
> yocto/openembedded-core/meta/conf/distro/include/default-distrovars.inc:1=
9:DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth debuginfod ext2 ipv=
4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nf=
c x11 vfat seccomp"
> which I was not aware of....
>

Note that the failing packages are nativesdk- so I suspect
DISTRO_FEATURES_FILTER_NATIVESDK may have something to do with this.

> I will fix that today finally...
>
> BR
> Piotr
> ________________________________
> Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Wys=B3ane: sobota, 22 lipca 2023 12:19
> Do: Piotr =A3obacz <p.lobacz@welotec.com>
> DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Temat: Re: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass:=
 add support for ACLs and xattr
>
> On 21/07/2023 23:33:02+0000, Piotr =A3obacz wrote:
> > Alexandre, Is it possible for you to create a docker file or some image=
 etc. with all commands from autobuilder which will re-create the failure a=
nd pass it to me?
> >
>
> I don't have that but really, those are just bare installation of the
> distro with just what is necessary to start an OE build.
>
> How did you try to reproduce?
>
> The log says that you are trying to execute this:
>
> opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-glibc=
-binary-localedata-zu-za /home/pokybuild/yocto-worker/qemuarm-oecore/build/=
build/tmp-glibc/work/i686-nativesdk-oesdk-linux/nativesdk-glibc-locale/2.37=
-r1/deploy-ipks/i686-nativesdk'
>
> The error is there, in the logs since I tested v4:
>
> Usage: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/=
work/i686-nativesdk-oesdk-linux/nativesdk-glibc-locale/2.37-r1/recipe-sysro=
ot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] [-a compre=
ssor_args] [-O] [-o owner] [-g group] <pkg_directory> [<destination_directo=
ry>]
>
> It is because you changed OPKGBUILDCMD to be:
>
> OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.con=
tains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DISTR=
O_FEATURES', 'xattr', '-X', '', d)}"'
>
> Can you see the extra double quotes that create two extra string
> arguments?
>
> Did you test without acl and xattr in DISTRO_FEATURES?
>
> > Because can grope, find nothing and waste our time...
> >
>
> Now, I've spent part of my week-end looking at that, this is time I will
> never get back while you just had to read the errors I reported to you
> on v4 and v5.
> You are demanding this is urgently processed but your patch series is
> not ready.
>
> Also, you HAVE to fix the reproducibility issues, else this will not go
> in.
>
> > Cheers,
> > Piotr
> >
> > ________________________________
> > Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Wys=B3ane: sobota, 22 lipca 2023 00:01
> > Do: Piotr =A3obacz <p.lobacz@welotec.com>
> > DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org>
> > Temat: Re: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass: ad=
d support for ACLs and xattr
> >
> > I confirm this still fails on the autobuilders:
> >
> > This is a-full:
> > https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Faut=
obuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2F5631&d=
ata=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7=
C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C3000%7C%7C%7C&sdata=3D1uDyi%2FU59lOmIhLOGt%2F1H7UT3iWRJwBuyGtvSaaxOA8=
%3D&reserved=3D0<https://eur04.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbu=
ilds%2F5631&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba350=
8db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D1uDyi%2FU59lOmIhLOGt%2F1H7UT3iWRJw=
BuyGtvSaaxOA8%3D&reserved=3D0><https://eur04.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuil=
ders%2F83%2Fbuilds%2F5631&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e048=
2f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382=
56267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D1uDyi%2FU59lOmIhLOGt=
%2F1H7UT3iWRJwBuyGtvSaaxOA8%3D&reserved=3D0><https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/5631>
> >
> > On 21/07/2023 14:07:19+0200, Piotr =A3obacz wrote:
> > > Extend OPKGBUILDCMD variable, with additional parameters, depending
> > > on target distro features, in order to support ACLs and xattr.
> > >
> > > With fix pushed to the opkg-devel:
> > > https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
roups.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sd=
ata=3DVhf4D2Ov8fnMJQgVV4tf3q24O4Z6Hr3sUzvjo%2BocM4I%3D&reserved=3D0<https:/=
/eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.google.=
com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=3D05%7C01%7Cp.lobacz%40welotec.=
com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7=
C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DVhf4D2O=
v8fnMJQgVV4tf3q24O4Z6Hr3sUzvjo%2BocM4I%3D&reserved=3D0><https://eur04.safel=
inks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.google.com%2Fg%2Fop=
kg-devel%2Fc%2FdYNHrLjDwg8&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e04=
82f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638=
256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DVhf4D2Ov8fnMJQgVV4t=
f3q24O4Z6Hr3sUzvjo%2BocM4I%3D&reserved=3D0><https://groups.google.com/g/opk=
g-devel/c/dYNHrLjDwg8>
> > > opkg-build is able to create tar archives with ACLs and xattr.
> > >
> > > Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> > > ---
> > >  meta/classes-global/package_ipk.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-g=
lobal/package_ipk.bbclass
> > > index b4b7bc9ac2..5e151be3cd 100644
> > > --- a/meta/classes-global/package_ipk.bbclass
> > > +++ b/meta/classes-global/package_ipk.bbclass
> > > @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target=
.conf"
> > >  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
> > >
> > >  # Program to be used to build opkg packages
> > > -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> > > +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.util=
s.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('=
DISTRO_FEATURES', 'xattr', '-X', '', d)}"'
> > >
> > >  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
> > >  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECO=
MMENDATIONS") =3D=3D "1"]}"
> > > --
> > > 2.34.1
> > >
> >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#184688): https://eur04.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%=
2Fmessage%2F184688&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a=
4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C63825626736=
4321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DtlbCboG1%2Ff30ogE%2ByFHVYp9=
XCfzvUJhZeSNARy569JY%3D&reserved=3D0<https://eur04.safelinks.protection.out=
look.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-cor=
e%2Fmessage%2F184688&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa=
4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267=
364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DtlbCboG1%2Ff30ogE%2ByFHVY=
p9XCfzvUJhZeSNARy569JY%3D&reserved=3D0><https://eur04.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-=
core%2Fmessage%2F184688&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f=
5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256=
267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DtlbCboG1%2Ff30ogE%2ByF=
HVYp9XCfzvUJhZeSNARy569JY%3D&reserved=3D0><https://lists.openembedded.org/g=
/openembedded-core/message/184688>
> > > Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Flists.openembedded.org%2Fmt%2F100275318%2F3617179&data=3D0=
5%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a=
7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000%7C%7C%7C&sdata=3D5QIiE0inXC%2FckyuRCxYnbhstdybPsQ4yIXGnNA5yWlE%3D&reser=
ved=3D0<https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.openembedded.org%2Fmt%2F100275318%2F3617179&data=3D05%7C01%7Cp.lobac=
z%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f=
8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sda=
ta=3D5QIiE0inXC%2FckyuRCxYnbhstdybPsQ4yIXGnNA5yWlE%3D&reserved=3D0><https:/=
/eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.openembe=
dded.org%2Fmt%2F100275318%2F3617179&data=3D05%7C01%7Cp.lobacz%40welotec.com=
%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%=
7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D5QIiE0inXC=
%2FckyuRCxYnbhstdybPsQ4yIXGnNA5yWlE%3D&reserved=3D0><https://lists.openembe=
dded.org/mt/100275318/3617179>
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D0=
5%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a=
7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000%7C%7C%7C&sdata=3DU72%2BiRPCuJ%2B6zv5Xa8xCrKhW7nKXV0hlM%2BDTV2meB4c%3D&r=
eserved=3D0<https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C01%=
7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4=
c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%=
7C%7C&sdata=3DU72%2BiRPCuJ%2B6zv5Xa8xCrKhW7nKXV0hlM%2BDTV2meB4c%3D&reserved=
=3D0><https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C01%7Cp.lo=
bacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4c=
a7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&=
sdata=3DU72%2BiRPCuJ%2B6zv5Xa8xCrKhW7nKXV0hlM%2BDTV2meB4c%3D&reserved=3D0><=
https://lists.openembedded.org/g/openembedded-core/unsub> [alexandre.bellon=
i@bootlin.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fboo=
tlin.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba350=
8db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dfy1ewqziBFsp7Tr4YdBZ6RndkaUMe2mH2C=
lcjsK2ua0%3D&reserved=3D0<https://eur04.safelinks.protection.outlook.com/?u=
rl=3Dhttps%3A%2F%2Fbootlin.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7=
C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C=
0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dfy1ewqziBFsp=
7Tr4YdBZ6RndkaUMe2mH2ClcjsK2ua0%3D&reserved=3D0><https://eur04.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&data=3D05%7C01%7Cp=
.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51=
a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&sdata=3Dfy1ewqziBFsp7Tr4YdBZ6RndkaUMe2mH2ClcjsK2ua0%3D&reserved=3D0><htt=
ps://bootlin.com/>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508d=
b8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dfy1ewqziBFsp7Tr4YdBZ6RndkaUMe2mH2Clc=
jsK2ua0%3D&reserved=3D0<https://eur04.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fbootlin.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9=
c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%=
7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dfy1ewqziBFsp7T=
r4YdBZ6RndkaUMe2mH2ClcjsK2ua0%3D&reserved=3D0><https://bootlin.com/>

--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8=
ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364478020%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D2U1vCACo22kIwqtPm3jTzsM2te9i9csAbbM8%2=
FT%2Fp%2FVo%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB5373C78D9B94E1D007F1AAE1913CAVI1PR04MB5373eurp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
It does not matter, the problem is due to this line:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot; &quot;${=
@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}&quot; &quot;${@b=
b.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}&quot;'</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
For some reason these '' from both acl and xattr are being packed into &quo=
t;&quot;, but I wanted it to be threated as empty strings which would be ac=
tually not being passed to this command.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
I have finally reproduced the error on my side:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2">
ERROR: run-postinsts-1.0-r10 do_package_write_ipk: Fatal errors occurred in=
 subprocesses:
<div class=3D"ContentPasted2">Command 'PATH=3D&quot;/work/build/yocto/opene=
mbedded-core/scripts:/work/build/tmp-glibc/work/all-WelotecGmbH-linux/run-p=
ostinsts/1.0-r10/recipe-sysroot-native/usr/bin/allarch-WelotecGmbH-linux:/w=
ork/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe=
-sysroot/usr/bin/crossscripts:/work/build/tmp-glibc/work/all-WelotecGmbH-li=
nux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/sbin:/work/build/tmp-gl=
ibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot-native/=
usr/bin:/work/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-=
r10/recipe-sysroot-native/sbin:/work/build/tmp-glibc/work/all-WelotecGmbH-l=
inux/run-postinsts/1.0-r10/recipe-sysroot-native/bin:/work/build/yocto/bitb=
ake/bin:/work/build/tmp-glibc/hosttools&quot;
 opkg-build -Z xz -a &quot;--memlimit=3D50% --threads=3D16&quot; &quot;&quo=
t; &quot;-X&quot; run-postinsts /work/build/tmp-glibc/work/all-WelotecGmbH-=
linux/run-postinsts/1.0-r10/deploy-ipks/all' returned non-zero exit status =
1.</div>
<div class=3D"ContentPasted2">Subprocess output:Usage: /work/build/tmp-glib=
c/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot-native/us=
r/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] [-a compressor_args] [=
-O] [-o owner] [-g group] &lt;pkg_directory&gt;
 [&lt;destination_directory&gt;]</div>
<div class=3D"ContentPasted2">Command 'PATH=3D&quot;/work/build/yocto/opene=
mbedded-core/scripts:/work/build/tmp-glibc/work/all-WelotecGmbH-linux/run-p=
ostinsts/1.0-r10/recipe-sysroot-native/usr/bin/allarch-WelotecGmbH-linux:/w=
ork/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe=
-sysroot/usr/bin/crossscripts:/work/build/tmp-glibc/work/all-WelotecGmbH-li=
nux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/sbin:/work/build/tmp-gl=
ibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot-native/=
usr/bin:/work/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-=
r10/recipe-sysroot-native/sbin:/work/build/tmp-glibc/work/all-WelotecGmbH-l=
inux/run-postinsts/1.0-r10/recipe-sysroot-native/bin:/work/build/yocto/bitb=
ake/bin:/work/build/tmp-glibc/hosttools&quot;
 opkg-build -Z xz -a &quot;--memlimit=3D50% --threads=3D16&quot; &quot;&quo=
t; &quot;-X&quot; run-postinsts-dbg /work/build/tmp-glibc/work/all-WelotecG=
mbH-linux/run-postinsts/1.0-r10/deploy-ipks/all' returned non-zero exit sta=
tus 1.</div>
<div class=3D"ContentPasted2">Subprocess output:Usage: /work/build/tmp-glib=
c/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot-native/us=
r/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] [-a compressor_args] [=
-O] [-o owner] [-g group] &lt;pkg_directory&gt;
 [&lt;destination_directory&gt;]</div>
<div class=3D"ContentPasted2">Command 'PATH=3D&quot;/work/build/yocto/opene=
mbedded-core/scripts:/work/build/tmp-glibc/work/all-WelotecGmbH-linux/run-p=
ostinsts/1.0-r10/recipe-sysroot-native/usr/bin/allarch-WelotecGmbH-linux:/w=
ork/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe=
-sysroot/usr/bin/crossscripts:/work/build/tmp-glibc/work/all-WelotecGmbH-li=
nux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/sbin:/work/build/tmp-gl=
ibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot-native/=
usr/bin:/work/build/tmp-glibc/work/all-WelotecGmbH-linux/run-postinsts/1.0-=
r10/recipe-sysroot-native/sbin:/work/build/tmp-glibc/work/all-WelotecGmbH-l=
inux/run-postinsts/1.0-r10/recipe-sysroot-native/bin:/work/build/yocto/bitb=
ake/bin:/work/build/tmp-glibc/hosttools&quot;
 opkg-build -Z xz -a &quot;--memlimit=3D50% --threads=3D16&quot; &quot;&quo=
t; &quot;-X&quot; run-postinsts-dev /work/build/tmp-glibc/work/all-WelotecG=
mbH-linux/run-postinsts/1.0-r10/deploy-ipks/all' returned non-zero exit sta=
tus 1.</div>
<div class=3D"ContentPasted2">Subprocess output:Usage: /work/build/tmp-glib=
c/work/all-WelotecGmbH-linux/run-postinsts/1.0-r10/recipe-sysroot-native/us=
r/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] [-a compressor_args] [=
-O] [-o owner] [-g group] &lt;pkg_directory&gt;
 [&lt;destination_directory&gt;]</div>
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted3 ContentPasted4">
when I have just removed entirely acl from DISTRO_FEATURES.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted3 ContentPasted4">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted3 ContentPasted4">
So, in principle I just need to fix this command and that will be all, hope=
fully.<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Alexandre Belloni &lt;a=
lexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> sobota, 22 lipca 2023 14:45<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: ODP: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ip=
k.bbclass: add support for ACLs and xattr</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 22/07/2023 11:42:39+0000, Piotr =A3obacz wrote:=
<br>
&gt; OK, finally discovered why in my case removing of acl from DISTRO_FEAT=
URES didn't work for me. We have our own DISTRO_FEATURES:append in which ac=
l is being appended and I just removed it from there.<br>
&gt; <br>
&gt; Unfortunately, there is this file:<br>
&gt; yocto/openembedded-core/meta/conf/distro/include/default-distrovars.in=
c:19:DISTRO_FEATURES_DEFAULT ?=3D &quot;acl alsa argp bluetooth debuginfod =
ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf p=
ci 3g nfc x11 vfat seccomp&quot;<br>
&gt; which I was not aware of....<br>
&gt; <br>
<br>
Note that the failing packages are nativesdk- so I suspect<br>
DISTRO_FEATURES_FILTER_NATIVESDK may have something to do with this.<br>
<br>
&gt; I will fix that today finally...<br>
&gt; <br>
&gt; BR<br>
&gt; Piotr<br>
&gt; ________________________________<br>
&gt; Od: Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;<br>
&gt; Wys=B3ane: sobota, 22 lipca 2023 12:19<br>
&gt; Do: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; DW: openembedded-core@lists.openembedded.org &lt;openembedded-core@lis=
ts.openembedded.org&gt;<br>
&gt; Temat: Re: ODP: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbcla=
ss: add support for ACLs and xattr<br>
&gt; <br>
&gt; On 21/07/2023 23:33:02+0000, Piotr =A3obacz wrote:<br>
&gt; &gt; Alexandre, Is it possible for you to create a docker file or some=
 image etc. with all commands from autobuilder which will re-create the fai=
lure and pass it to me?<br>
&gt; &gt;<br>
&gt; <br>
&gt; I don't have that but really, those are just bare installation of the<=
br>
&gt; distro with just what is necessary to start an OE build.<br>
&gt; <br>
&gt; How did you try to reproduce?<br>
&gt; <br>
&gt; The log says that you are trying to execute this:<br>
&gt; <br>
&gt; opkg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &quot;&q=
uot; &quot;&quot; nativesdk-glibc-binary-localedata-zu-za /home/pokybuild/y=
octo-worker/qemuarm-oecore/build/build/tmp-glibc/work/i686-nativesdk-oesdk-=
linux/nativesdk-glibc-locale/2.37-r1/deploy-ipks/i686-nativesdk'<br>
&gt; <br>
&gt; The error is there, in the logs since I tested v4:<br>
&gt; <br>
&gt; Usage: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-gli=
bc/work/i686-nativesdk-oesdk-linux/nativesdk-glibc-locale/2.37-r1/recipe-sy=
sroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] [-a com=
pressor_args] [-O] [-o owner] [-g group]
 &lt;pkg_directory&gt; [&lt;destination_directory&gt;]<br>
&gt; <br>
&gt; It is because you changed OPKGBUILDCMD to be:<br>
&gt; <br>
&gt; OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS}&quot; &qu=
ot;${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}&quot; &quot=
;${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}&quot;'<br>
&gt; <br>
&gt; Can you see the extra double quotes that create two extra string<br>
&gt; arguments?<br>
&gt; <br>
&gt; Did you test without acl and xattr in DISTRO_FEATURES?<br>
&gt; <br>
&gt; &gt; Because can grope, find nothing and waste our time...<br>
&gt; &gt;<br>
&gt; <br>
&gt; Now, I've spent part of my week-end looking at that, this is time I wi=
ll<br>
&gt; never get back while you just had to read the errors I reported to you=
<br>
&gt; on v4 and v5.<br>
&gt; You are demanding this is urgently processed but your patch series is<=
br>
&gt; not ready.<br>
&gt; <br>
&gt; Also, you HAVE to fix the reproducibility issues, else this will not g=
o<br>
&gt; in.<br>
&gt; <br>
&gt; &gt; Cheers,<br>
&gt; &gt; Piotr<br>
&gt; &gt;<br>
&gt; &gt; ________________________________<br>
&gt; &gt; Od: Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;<br>
&gt; &gt; Wys=B3ane: sobota, 22 lipca 2023 00:01<br>
&gt; &gt; Do: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; &gt; DW: openembedded-core@lists.openembedded.org &lt;openembedded-cor=
e@lists.openembedded.org&gt;<br>
&gt; &gt; Temat: Re: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbcla=
ss: add support for ACLs and xattr<br>
&gt; &gt;<br>
&gt; &gt; I confirm this still fails on the autobuilders:<br>
&gt; &gt;<br>
&gt; &gt; This is a-full:<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/83/builds/5631">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2F5631&amp;d=
ata=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7=
C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C3000%7C%7C%7C&amp;sdata=3D1uDyi%2FU59lOmIhLOGt%2F1H7UT3iWRJwBuyGtvSaa=
xOA8%3D&amp;reserved=3D0&lt;https://eur04.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilder=
s%2F83%2Fbuilds%2F5631&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e04=
82f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638=
256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D1uDyi%2FU59lOmI=
hLOGt%2F1H7UT3iWRJwBuyGtvSaaxOA8%3D&amp;reserved=3D0&gt;&lt;https://eur04.s=
afelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproje=
ct.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2F5631&amp;data=3D05%7C01%7=
Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c=
51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7=
C%7C&amp;sdata=3D1uDyi%2FU59lOmIhLOGt%2F1H7UT3iWRJwBuyGtvSaaxOA8%3D&amp;res=
erved=3D0&gt;</a><br>
&gt; &gt;<br>
&gt; &gt; On 21/07/2023 14:07:19+0200, Piotr =A3obacz wrote:<br>
&gt; &gt; &gt; Extend OPKGBUILDCMD variable, with additional parameters, de=
pending<br>
&gt; &gt; &gt; on target distro features, in order to support ACLs and xatt=
r.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; With fix pushed to the opkg-devel:<br>
&gt; &gt; &gt; <a href=3D"https://groups.google.com/g/opkg-devel/c/dYNHrLjD=
wg8">https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgr=
oups.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&amp;data=3D05%7C01%7Cp.l=
obacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4=
ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C=
&amp;sdata=3DVhf4D2Ov8fnMJQgVV4tf3q24O4Z6Hr3sUzvjo%2BocM4I%3D&amp;reserved=
=3D0&lt;https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgroups.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&amp;data=3D05%7C01%7C=
p.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c5=
1a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C=
%7C&amp;sdata=3DVhf4D2Ov8fnMJQgVV4tf3q24O4Z6Hr3sUzvjo%2BocM4I%3D&amp;reserv=
ed=3D0&gt;&lt;https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fgroups.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&amp;data=3D05%7=
C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1=
d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000=
%7C%7C%7C&amp;sdata=3DVhf4D2Ov8fnMJQgVV4tf3q24O4Z6Hr3sUzvjo%2BocM4I%3D&amp;=
reserved=3D0&gt;</a><br>
&gt; &gt; &gt; opkg-build is able to create tar archives with ACLs and xatt=
r.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<b=
r>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;&nbsp; meta/classes-global/package_ipk.bbclass | 2 +-<br>
&gt; &gt; &gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/classes-global/package_ipk.bbclass b/meta/=
classes-global/package_ipk.bbclass<br>
&gt; &gt; &gt; index b4b7bc9ac2..5e151be3cd 100644<br>
&gt; &gt; &gt; --- a/meta/classes-global/package_ipk.bbclass<br>
&gt; &gt; &gt; +++ b/meta/classes-global/package_ipk.bbclass<br>
&gt; &gt; &gt; @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D &quot;${WORKDIR}/o=
pkg-sdk-target.conf&quot;<br>
&gt; &gt; &gt;&nbsp; PKGWRITEDIRIPK =3D &quot;${WORKDIR}/deploy-ipks&quot;<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp; # Program to be used to build opkg packages<br>
&gt; &gt; &gt; -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS=
}&quot;'<br>
&gt; &gt; &gt; +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a &quot;${XZ_DEFAULTS=
}&quot; &quot;${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}&=
quot; &quot;${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}&=
quot;'<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp; OPKG_ARGS +=3D &quot;--force_postinstall --prefer-arch=
-to-version&quot;<br>
&gt; &gt; &gt;&nbsp; OPKG_ARGS +=3D &quot;${@['', '--no-install-recommends'=
][d.getVar(&quot;NO_RECOMMENDATIONS&quot;) =3D=3D &quot;1&quot;]}&quot;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.34.1<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; &gt; View/Reply Online (#184688): <a href=3D"https://lists.openem=
bedded.org/g/openembedded-core/message/184688">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184688&amp;data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DtlbCboG1%2Ff30ogE%2ByFHVYp9XCfzvUJhZeSNARy569JY%3D&amp=
;reserved=3D0&lt;https://eur04.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184688=
&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab1=
8a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DtlbCboG1%2Ff30ogE%2ByFHVYp9XCfzvUJhZe=
SNARy569JY%3D&amp;reserved=3D0&gt;&lt;https://eur04.safelinks.protection.ou=
tlook.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-co=
re%2Fmessage%2F184688&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e048=
2f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382=
56267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DtlbCboG1%2Ff30og=
E%2ByFHVYp9XCfzvUJhZeSNARy569JY%3D&amp;reserved=3D0&gt;</a><br>
&gt; &gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/m=
t/100275318/3617179">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F100275318%2F3617179&amp;data=3D05%7C01%7Cp.lobacz%40=
welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44=
011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3D5QIiE0inXC%2FckyuRCxYnbhstdybPsQ4yIXGnNA5yWlE%3D&amp;reserved=3D0&lt;h=
ttps://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.op=
enembedded.org%2Fmt%2F100275318%2F3617179&amp;data=3D05%7C01%7Cp.lobacz%40w=
elotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e440=
11b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdat=
a=3D5QIiE0inXC%2FckyuRCxYnbhstdybPsQ4yIXGnNA5yWlE%3D&amp;reserved=3D0&gt;&l=
t;https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.openembedded.org%2Fmt%2F100275318%2F3617179&amp;data=3D05%7C01%7Cp.lobacz%=
40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e=
44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;s=
data=3D5QIiE0inXC%2FckyuRCxYnbhstdybPsQ4yIXGnNA5yWlE%3D&amp;reserved=3D0&gt=
;</a><br>
&gt; &gt; &gt; Group Owner: openembedded-core+owner@lists.openembedded.org<=
br>
&gt; &gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/unsub">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DU72%2BiRPCuJ%2B6zv5Xa8xCrKhW7nKXV0hlM%2BDTV2meB4c%3D&amp;reserved=
=3D0&lt;https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%=
7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4=
c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%=
7C%7C&amp;sdata=3DU72%2BiRPCuJ%2B6zv5Xa8xCrKhW7nKXV0hlM%2BDTV2meB4c%3D&amp;=
reserved=3D0&gt;&lt;https://eur04.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;dat=
a=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C2=
5111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000%7C%7C%7C&amp;sdata=3DU72%2BiRPCuJ%2B6zv5Xa8xCrKhW7nKXV0hlM%2BDTV2m=
eB4c%3D&amp;reserved=3D0&gt;</a>
 [alexandre.belloni@bootlin.com]<br>
&gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; &gt; Embedded Linux and Kernel engineering<br>
&gt; &gt; <a href=3D"https://bootlin.com/">https://eur04.safelinks.protecti=
on.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.l=
obacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4=
ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C=
&amp;sdata=3Dfy1ewqziBFsp7Tr4YdBZ6RndkaUMe2mH2ClcjsK2ua0%3D&amp;reserved=3D=
0&lt;https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbo=
otlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4a=
ba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382562673643=
21769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dfy1ewqziBFsp7Tr4YdBZ6Rndk=
aUMe2mH2ClcjsK2ua0%3D&amp;reserved=3D0&gt;&lt;https://eur04.safelinks.prote=
ction.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7C=
p.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c5=
1a4ca7f8e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C=
%7C&amp;sdata=3Dfy1ewqziBFsp7Tr4YdBZ6RndkaUMe2mH2ClcjsK2ua0%3D&amp;reserved=
=3D0&gt;</a><br>
&gt; <br>
&gt; --<br>
&gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com/">https://eur04.safelinks.protection.ou=
tlook.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz=
%40welotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8=
e44011b39%7C0%7C0%7C638256267364321769%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;=
sdata=3Dfy1ewqziBFsp7Tr4YdBZ6RndkaUMe2mH2ClcjsK2ua0%3D&amp;reserved=3D0&lt;=
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C9c0e0482f5aa4a4aba350=
8db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638256267364321769=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dfy1ewqziBFsp7Tr4YdBZ6RndkaUMe2=
mH2ClcjsK2ua0%3D&amp;reserved=3D0&gt;</a><br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur04.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7C9c0e0482f5aa4a4aba3508db8ab18a04%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638256267364478020%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D2U1vCACo22kIwqtPm3jTzsM2te9i9csAbbM8%2FT%2Fp%2FVo%3D&amp;reserved=3D0</a=
><br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373C78D9B94E1D007F1AAE1913CAVI1PR04MB5373eurp_--

