Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A345C25B77
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 12:07:08 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.69])
 by mx.groups.io with SMTP id smtpd.web11.11950.1715861224098098829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 05:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=mIj6pORS;
 spf=pass (domain: axis.com, ip: 40.107.6.69, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4ki9yM04nwdlxD7MR1ctbN3JLTdbpttsqYwFnbLrWtWe/h5y1IM3m38T/mh39vUlttO+ANXyg+jtcQanXzn/j1DO2VFk1VvvLEyA9nkJGnmEmJnWDMGmT+0lh3e6kHFhWqxrmw3qqmzMvDnKdF+X7juaywHTEll/i1lLGXgpdyyEB3KNQmt9TlfNh+bOhmyu1DcD023ejYUBxN0gmQ/FLfCWpU4VFiVWQnKSd+uNNomDKqSZo/shbKdC+YQdc7CyXyzxVE9vfS6nLIe5HddMlMpDhLn9ZtpTMhNrr1fCGFvPCL+tYpGCQx+Lyl9r6UKU2grn6g1FFdlCVZmghC/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpSjaMyLF+0iFD2vwIUNVP+KUOsAIvT7JUTRo/VwHfk=;
 b=XpwNfsvjsn9dNLQwEC8JeosW/VsTrp7Trn1QtghpsGgDX0jc2bJersW367K8YYVVzDHcaaKIUWM8mPZLUCzEhRY2104Qo1DCUCbXbUEjCD6VHWSvJJRoqAIWahR2e3ktcpHtxPdzlmJC9mAmek1A716kgeM9wi0GSPVNooAQeG5E1YUveN+JEijOMMBzhxP8DWSxoXd0+Q9ZzwsTtvkZTMLJVhBnsEwcUZHdjNHLjbw1gqiIk8lSX757vRTwDHFs8SGCfUoer+VW3lQWW5f454PKSRprQRCcaqna4tCfn2FfVp8DO/eS9drD3kx9FQ5jxCnl1zQ8zKIFtV61dMmq4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpSjaMyLF+0iFD2vwIUNVP+KUOsAIvT7JUTRo/VwHfk=;
 b=mIj6pORSrQ1sKjbTSCdbvTtK88MrqaTN/oPM2nCY4ZuaDfhGUD2mhTSbKYFuBsQLOuMw20bImqMX9dYssoorLsp70SjqZrjzAF+ryHUsDH4BhEjN/r3rj+lafoZQZw8Wcnx9OynGgfuh+z98FjYzkgkskd9m5rQnHQfGTD9AXIc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB5984.eurprd02.prod.outlook.com (2603:10a6:800:18c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 12:06:59 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996%3]) with mapi id 15.20.7587.026; Thu, 16 May 2024
 12:06:59 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Seungkyun Kim <seungkyun.kim@lge.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v4] ipk/rootfs: run sanity test of multilib in
 parallel
Thread-Topic: [OE-core] [PATCH v4] ipk/rootfs: run sanity test of multilib in
 parallel
Thread-Index: AQHapyW9BUjV4QMR5E60oDXaaXHAT7GZwlLg
Date: Thu, 16 May 2024 12:06:59 +0000
Message-ID: 
 <DB5PR02MB10213005C89F299DADF6D2079EFED2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240516001212.1607584-1-seungkyun.kim@lge.com>
In-Reply-To: <20240516001212.1607584-1-seungkyun.kim@lge.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB5984:EE_
x-ms-office365-filtering-correlation-id: d84b2ca9-1d8d-4151-5325-08dc75a0b063
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?pRTuefg6rRK3HjNlEuhN5HpqX3X6tjkqbvfqQo6Kw/+JARoo40tWHh7puzXQ?=
 =?us-ascii?Q?itDJvo3gUZojnB3BrVO6byggZEzp8zK51ZE9nvMKgZeSPVuE8XqfDDtZVxDg?=
 =?us-ascii?Q?SYuO6kEB7yX8sEqiKdX8/MXwlXgTZ7GPieIjYigVxvFjZWe+g3nLj1KAplo8?=
 =?us-ascii?Q?iuo3qNfRg5M9IZ0qJp8z5Xzz17AvzLQ61iJsbwYWXK/OCyreMrYA+omWLsjy?=
 =?us-ascii?Q?OwAjdhwgeIjuN9rbYa/VnEEe72Hykx08iBxAAz3UgD0RCCS4y3QiRlRYMFuA?=
 =?us-ascii?Q?lknoBj5nNNYYI7pWzOULmbkSBvvPpWgUyiyJt451cQ6NE1LIzNCRwRA78yDu?=
 =?us-ascii?Q?Ui3BIWL+IwMeUlD49wUdkdUFVNUfPmI7eF1uNJ3bYPovAq0MUDYi18WCO8Qj?=
 =?us-ascii?Q?dnyf+Q4C+K37BhmrM7CgNUizzrmazMd0xjeV2jWHeIx0ktCvE4Ihw++lNrDS?=
 =?us-ascii?Q?OvZ5Ik5XrRp9DuHMLqWO7PVvFaXikgSZ9kWYlrkY1bDoc46XNFWhFkJiHOUb?=
 =?us-ascii?Q?qhjru47Pm52xNNGAS6PLpIZm/9X7Sm8J1YJ/XjHttJrHVgo3PkU7b47qsDa5?=
 =?us-ascii?Q?EouR0F8gP5bDOriY9n0ysHfWK4iNA0a/aIo0tKtZu7eY1IMUdqFGGa+knr15?=
 =?us-ascii?Q?wFtGBgWLam2zInOahgXivljrKTpEM69fqYls8z5DE5MOiI++e8UJ58zkb5I7?=
 =?us-ascii?Q?K9SrbmWBUyoCwqiAyiayg0ieaOFPt1xnFtrNKYGL5725hZ81RhyrYtrpnYKz?=
 =?us-ascii?Q?yBQO05AhKPQgFf7qbR4Tob6bSzUtKN1/Go4JxIYbaJklf1ypo/BtyahDfI4h?=
 =?us-ascii?Q?9ActDq2nqKpWS/f3ZuvfRinPbq1ogg2HT5QwCrCqGVBtHR18gQZNyVAj4t7J?=
 =?us-ascii?Q?iE2NsEH0NwXvIrjjwHuFQipThfYE46rYOg8dmvXUKAII+KkVBDiNZx04EWvA?=
 =?us-ascii?Q?/39/xsA801JNEDB8Cn3Q7qKEo+T29hSHtlykogdXTEFfEjg02mIWjOrGu23r?=
 =?us-ascii?Q?HlHkJWJMIwoSP7v+w3lTUcCRY2H1Hu9d6yRPu+suPN+kjn0wKRNB9eHk+lC7?=
 =?us-ascii?Q?2j9fBpQ+fZm2lDTBj0SWYrPSoFdRuTgENAvPW2Y4a61rBziMJ06yPaDUpzEO?=
 =?us-ascii?Q?WF9ebBAUq0cqnUQFVdipwoqy8IYZBJQ/CMoh/8MJZypzLe9f8afDKtXheQB0?=
 =?us-ascii?Q?lB5usRX+WfIrSk5L9JBT617udpl9pFpWMTdCd7uLg8d3NwIZLxl8H3PRZPYs?=
 =?us-ascii?Q?MXLREmAy/mWWEaH0YeVfXbQgoV8YjR/7pLn722hucJj/ukUyjBFGDaXXqj2X?=
 =?us-ascii?Q?OlBrvhYfoENYPGnm1kj9DqXc5sj5S+J5vgiSnw7sOH8ICg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bFahXT/Lhv4ooIu08JwtHD/EfV39PFO/fqgFHKc7J0jRrKFCA5Wrwxhkuzst?=
 =?us-ascii?Q?jYxw/RJNeCnhXVgcUvPvbiQuf1NQkgl8Ie9lrVMBpUIvD+f/eWUurUMJziGt?=
 =?us-ascii?Q?kGSNvDw9w93AXNIcdBbwIlQIh2xjYzbA3SDKRDx8DYu8wE8BjM1OA57cGMVv?=
 =?us-ascii?Q?tg3dVhtFPdvrn8+bCEumX32YWyLbuxfH2b4xytaFnGF4yUJXflXi3vdk5W3N?=
 =?us-ascii?Q?wyoVW44dVal5ZYzCA6g3r3YUBDST7VM3mVjXgpU943L4zSPvMrQYfvrF8KBL?=
 =?us-ascii?Q?XlZltq5Xi0ExzXW0ZjK1+JLGQWMEIjfkeYVC/Hysbl66tE4CZ5Rz4hEtns7s?=
 =?us-ascii?Q?CXT50x8yE9H9GWYQk8Mzs5g643yJUZCkV9mS5anQryO0z/zToaPnzKMZP4j7?=
 =?us-ascii?Q?7m6tH1OUThScH7VCiQ9VnZuWE6ZKBeTz2g7wciN5JTD1pE5DEFAMANqdiYMI?=
 =?us-ascii?Q?5rbvdTqLQAoM6JgGefDUpqGION53iK7+jpglNLkqmG3/WZLjVDjN9YEYEBw6?=
 =?us-ascii?Q?8sP8Ew+H1Qe7Ekh1hsINoiV9WGUmVU09XAFH5LOO9beMZ1YNtYb/fAjP2OTu?=
 =?us-ascii?Q?P431++k9mtpPE1GAMmVFmAEWLIPlpTjZM7TGGmQ+462ftrROXl9FaA/7ZGwB?=
 =?us-ascii?Q?RE4bBxAdYztq7MYM8ioU8iTaEjDXS90KuayrsOQUPhieC6V81G/+pKMY9psq?=
 =?us-ascii?Q?OHGqlNeeprSyAXRrBam4+46elCHcC5+ISdCmFJxk2wRslN42s4mOcSTNC2wK?=
 =?us-ascii?Q?k/O1jGJsGLRpfTInQuW78OyqBdD1qVc6ezbH30OdNAeSSw76VmnzuzCcyLHS?=
 =?us-ascii?Q?KL3rK5TTCWfI2q3lrr3MzUpEeXPCryPigdoYJ/ysWbyooGfzVqHelNQ8E1Jb?=
 =?us-ascii?Q?qa+pE3qDR0p2DP2FTWEXpr02kxX5cDudpox6mQ2KL4EX2E81n8asRvp5jbAT?=
 =?us-ascii?Q?GaBlWAJrdUOrdyfV4E4MHB1vkHsfAfLIrwziZ4ZrvSxnWXDPZubo9O6HYdqd?=
 =?us-ascii?Q?05fVWY6QK3rh/r4/5EDUYUefq+XSp9zsdY0RQTKiXzk4Ly7enGZ8/bhCRGap?=
 =?us-ascii?Q?Yzzg3LFQLRewGURyfZNNh0WLs2NV5xk0PaKx8H//7MzM5o/Xf5gQtoJpSLAt?=
 =?us-ascii?Q?trrRwGW7GCj1kH3XkHDj0XA8iVI6XE7opl+jqSiyyH98L7TDQjo/a4udGRdQ?=
 =?us-ascii?Q?4bgLjBs96kHif5LymfJ/BJ4HALarEgZiCNOPqtlh2gNAJO+DwNDqAKAk67O+?=
 =?us-ascii?Q?kto54LHM0Ip41ENh6sJzgfQmPj+u2HN/ACn4aPkat+seWiLEdKMyXLNuazzN?=
 =?us-ascii?Q?6dw8RX0mAfDkODj0JqRYeJ1m1/rvoeu8ZUw3fa3spjIbkeRlMlTh4A3Iq+6f?=
 =?us-ascii?Q?lOW/BrWlC+p5Z/u3Bad221PZQ6aHlxg6PxLor4vImgyhKZmU0oIerE7R1eQL?=
 =?us-ascii?Q?G4t5DWjeb/NvERw2n8/fQjTaG/XdKxmsGh7gLcC1AnIUBlorf8XU2c1XHbA5?=
 =?us-ascii?Q?Kr++oj3z7O96Y2OS5WWxkKRf+yslQUrjMp0hc8Be1v9VV8fLg3P85WJJ75xX?=
 =?us-ascii?Q?f2kBnoC6Xenk5/u1iLI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84b2ca9-1d8d-4151-5325-08dc75a0b063
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 12:06:59.4191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgWsa2ncP7x9b0nlweY7oU//3AIj2pHHJIIqq3WDzsz5qYj6PxPEiLWaKrYGEzs4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5984
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 12:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199485

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Seungkyun Kim
> Sent: den 16 maj 2024 02:12
> To: openembedded-core@lists.openembedded.org
> Cc: seungkyun.kim <seungkyun.kim@lge.com>
> Subject: [OE-core] [PATCH v4] ipk/rootfs: run sanity test of multilib in =
parallel
>=20
> From: "seungkyun.kim" <seungkyun.kim@lge.com>
>=20
> For multilib type packages, there is an additional temporary
> installation before the actual installation. It makes almost doubles
> the do_rootfs time if having many multilib type packages.
> To avoid this overhead, run sanity test in parallel.
> Installing package groups through opkg takes much more time than
> copying directory.
>=20
> - Changes in V2:
>     Fix FileNotFoundError exception when copying rootfs
> - Changes in V3:
>     Removed unnecessary test call
> - Changes in V4:
>     Fix invalid argument when create Process
>     Keep the temporary rootfs directory after sanity check

The above list of changes related to the review process should be moved to=
=20
after the --- line below as they should not be part of the actual commit=20
message.

>=20
> Signed-off-by: seungkyun.kim <seungkyun.kim@lge.com>
> ---
>  meta/lib/oe/package_manager/ipk/rootfs.py | 34 +++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/pack=
age_manager/ipk/rootfs.py
> index ba93eb62ea..a3842a6264 100644
> --- a/meta/lib/oe/package_manager/ipk/rootfs.py
> +++ b/meta/lib/oe/package_manager/ipk/rootfs.py
> @@ -6,7 +6,9 @@
>=20
>  import re
>  import filecmp
> +import multiprocessing
>  import shutil
> +import stat
>  from oe.rootfs import Rootfs
>  from oe.manifest import Manifest
>  from oe.utils import execute_pre_post_process
> @@ -197,11 +199,34 @@ class PkgRootfs(DpkgOpkgRootfs):
>                          files[key] =3D item
>=20
>      def _multilib_test_install(self, pkgs):
> +        def _copy_rootfs(src, dst):
> +            if os.path.islink(src):
> +                linkto =3D os.readlink(src)
> +                if os.path.isabs(linkto):
> +                    linkto =3D os.path.normpath(os.path.join(os.path.dir=
name(dst),
> +                                              os.path.relpath(linkto, sr=
c)))
> +                os.symlink(linkto, dst)
> +            elif os.path.isfile(src):
> +                shutil.copy2(src, dst)
> +            elif stat.S_ISFIFO(os.stat(src).st_mode):
> +                os.mkfifo(dst)
> +            else:
> +                bb.warn("Skip unsupported file type: %s" % src)
> +
>          ml_temp =3D self.d.getVar("MULTILIB_TEMP_ROOTFS")
> +        rootfs_temp =3D os.path.join(ml_temp, "rootfs")
>          bb.utils.mkdirhier(ml_temp)
> +        bb.utils.remove(rootfs_temp, True)
>=20
> -        dirs =3D [self.image_rootfs]
> +        if os.path.exists(self.image_rootfs):
> +            shutil.copytree(self.image_rootfs, rootfs_temp, copy_functio=
n=3D_copy_rootfs)
> +        else:
> +            bb.utils.mkdirhier(rootfs_temp)
> +        dirs =3D [rootfs_temp]
> +        return multiprocessing.Process(target=3Dself._multilib_test_pkg_=
install,
> +                                       args=3D(pkgs, ml_temp, dirs,))
>=20
> +    def _multilib_test_pkg_install(self, pkgs, ml_temp, dirs):
>          for variant in self.d.getVar("MULTILIB_VARIANTS").split():
>              ml_target_rootfs =3D os.path.join(ml_temp, variant)
>=20
> @@ -300,15 +325,20 @@ class PkgRootfs(DpkgOpkgRootfs):
>=20
>          for pkg_type in self.install_order:
>              if pkg_type in pkgs_to_install:
> +                sanity_test =3D None
>                  # For multilib, we perform a sanity test before final in=
stall
>                  # If sanity test fails, it will automatically do a bb.fa=
tal()
>                  # and the installation will stop
>                  if pkg_type =3D=3D Manifest.PKG_TYPE_MULTILIB:
> -                    self._multilib_test_install(pkgs_to_install[pkg_type=
])
> +                    sanity_test=3D self._multilib_test_install(pkgs_to_i=
nstall[pkg_type])

Add a space before the equal sign.

> +                    sanity_test.start()
>=20
>                  self.pm.install(pkgs_to_install[pkg_type],
>                                  [False, True][pkg_type =3D=3D Manifest.P=
KG_TYPE_ATTEMPT_ONLY])
>=20
> +                if sanity_test is not None:
> +                    sanity_test.join()
> +
>          if self.progress_reporter:
>              self.progress_reporter.next_stage()
>=20
> --
> 2.34.1

//Peter


