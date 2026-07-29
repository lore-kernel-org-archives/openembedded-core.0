Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FA5C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 16:31:44 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15762.1785342697296637039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 09:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=MXFOnKPm;
 spf=pass (domain: navimatix.de, ip: 52.101.83.95, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejnAUNww8ErF26JGlGrJ7LI1WCHS24N7tYDuh7KfxK5NtOMwcRtCPma4WtQQbDLAO58/iUI9UGHHj0dzl0Mtb5x6UJRCEqMZuLyu7Ho8wxEOQg2ohAHopL1C15yU6/qZfYCq8vsCvqVD98yn4Om7g95N2B/GVeZB+qH/1BxfWKsGF/lQS4hf2KnIgJGj5dgmOzrDYdevI7EtZrvAgUu1sE8KxlThGwlJCO67/rEGI28mfPi9ynKm3UQFcPxJzCnC51FBULiQlzQNgBmuNctc9wmTtyK2knPECWeAKc//RK0jPsebtfTcqjnapH2KtuRwHdNXDagnNlYziEnqJX8FvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beJ8dOyLWnJ63OxJlS3rnVcq+HbwLQTl22BozfVEt4g=;
 b=Z09HWxY5eIS9y9bIRD+/516rzBnGGOHF3l7csdZVp3K1d6fUl3jGAqZFFra31eFh3UI6tHqUhMTetqPqIp0ytgsEINrWp5nDFL2po+BTBYEaor24B6sNQC5DVV3YeEqPzKtUpe/asGWnjXbFmxCqVjbvMx7nWY57YxWqaezfrAnjrJT2FedqiTKfVW3b+ounocGbJ/bbw/yOE6MU8BlqeW6YsJUJ5KJb++4qfi/aW0PxthHbn23FkI5Wt2jF+FvNqStmwJHhSYKFl0kyWFlG2wAvAy6zdvi1NyJlqQa5dnlXFDhP9pCJRG8/PCemPq1z/3vsots/3PGEcEHPCzjOMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beJ8dOyLWnJ63OxJlS3rnVcq+HbwLQTl22BozfVEt4g=;
 b=MXFOnKPmVEhVZdFFs+dYf0/0zM7xCZ+jZa22iLba+8Vv573Sj5VM7GK11gU1B219c7DDAY0fZEZEra8nhPmacTjhuFVdqK9+gvWEtfXcC7JZvX69uMndysj+hWT/NGIa11dBAkRiW/SjMq5A59MIrlRwsRgftiNZJ2yqLr8qop8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI2PR01MB10927.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:279::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:31:30 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0245.012; Wed, 29 Jul 2026 16:31:29 +0000
Date: Wed, 29 Jul 2026 18:31:26 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] package_manager/ipk: skip checksums for
 unsigned local feeds
Message-ID: <amopCRlwZbvUiIAZ@navimatix.de>
References: <20260729152931.1347887-1-ecordonnier@snap.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="f5ojgnituwbj6a2u"
Content-Disposition: inline
In-Reply-To: <20260729152931.1347887-1-ecordonnier@snap.com>
X-ClientProxiedBy: BE1P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::10) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI2PR01MB10927:EE_
X-MS-Office365-Filtering-Correlation-Id: b2651f7a-e674-4365-50d1-08deed8ed793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|5023799004|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	RDG+RO/nGq3cntcrOa5cM7+unYabdFCqDtt3l6TLa9pzzhdepoxiCRI5V9Sk9ZNckCHwGEeJCavPO4fLpyt9go0Ky6+9L+9g18PpFMJbM6LLuKCx2TPtT99hEJOkpKR6JWCzBRr2uLRden6VGTcxEGaGGxVYoQd7+lnomIqZOzKLki7FTYMiVnGtIkTEcfUip3MtEnUo6vCCRWtG7hBqk4I+dM0hCZS/bgP5CLEopyc4YGyLg4tIn8ceBxVIBx4Pk+1HnOPw5BvgkjjPDcN/rmfOUMqGF5nEba8r3yuLIDhqOn6EqVvKZ/to/JCFurifCMT9JuDe6/1q9qHwb+4dkltXGlEwRuGoRRKLYTghW3fHgYmcaRHoo6NgVYWKijxdIIC7sJ508+NTnUSydunTUmfWYpL9YS6GAXMLSMk410bFYfpyS9iNFeo2X0QLFy+I8+cuEyhLP9HvGcRXPviCdHjSWMwta4I9dtVZLPq8Rn/dYmr+r96bLtT5sH6TYaWUmktrrAgf66TWp5QVgE4R31PGjVZomGq59ZhfH/RYRIcpMLUZTRmGLoq+BPCDtnDqWDcvQiP3w2XX1EmAtHp5IELuPOPQsWZIqbyXYDEz2+0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?i9P60pFVHyiqXi+RlrtFNaR4X7DlKKBXRzfrEIgT0PTqOxKQIBmXAmBEry?=
 =?iso-8859-1?Q?gwJozg2OKZgRzEnmcqVJhxlqqn5/KS7LAd56vHP5IwJTqyLgnhlpKeIoyz?=
 =?iso-8859-1?Q?4iUrOYma1asjvhhOS0CtqM2JiaJzYUGtJdRP9WJKvB7vwL0vNzii5DmMDQ?=
 =?iso-8859-1?Q?EvS7kEZ+EO8Rz+IydHpFcMOo7zDisO/afGO9oonebeVagFQ0XJTfKRQEBv?=
 =?iso-8859-1?Q?9I4/GI2PUJookPD5862sv8IiIz3NPt8SHt9uvdMOI4+HeYaPindWSsiwih?=
 =?iso-8859-1?Q?lns5a65E3CN7vDu7mN3J+cVml1xFCQZdHorgROK97XPpLybOAFzxKP3bCg?=
 =?iso-8859-1?Q?Q9H9C2VNpV1XTqPsRZMllTwZcDZtqsWdh0+FAGmBstQkjfM+EludfRgnil?=
 =?iso-8859-1?Q?oVgk4sdy4zr/DEKamWbqA9E727PZVrXZz9tOyg2teHBXxQpaIN3v1m8J5T?=
 =?iso-8859-1?Q?QEQxTAJU8l3Awm7M3z09FqayMAYXCp2Vvx9Va4hIQNFyIiTUsRbC8nYM/9?=
 =?iso-8859-1?Q?jbWOlynOHjUJzHS9mGRHY+PmSjneDoRqcs/DXKdY7xDnlHlP+AdKg5fNOU?=
 =?iso-8859-1?Q?fCzcH7Ug+kxiYWOXwX8pBgeIAiAphupSV1eJzexxBWl2FHzHSu7Fenfhxj?=
 =?iso-8859-1?Q?YE1MWoi3KwevM96+NXmdjyJO5QDQVmJsi7z627iJ67sDqOTH5Bf37u/FAX?=
 =?iso-8859-1?Q?bARPAz74FZ/g3nOJWq6B7Vo9Rqre/foASbht/oM77twKin3FAgW1Aph4g9?=
 =?iso-8859-1?Q?ZxOA/5aTxEmWhy6tBBlZH+ON2ItZp96ZHg+RaMQ9v/JeJKVRw/EXNbfY86?=
 =?iso-8859-1?Q?r/w+KdXyXFvtXEekA022FM0bD4a4lPNy8P2w/ocKUZesqAJv3xLjOCJ105?=
 =?iso-8859-1?Q?uo9KuWu1XsxaT4pAJexVuYf7iTPfVD59K67cs6fjRXAt2NS/sl+BFHYWTL?=
 =?iso-8859-1?Q?61O+YlUWj2KDw3007tMjihhaY22Zu+s1wzxLtfGYeUy2WMrRfiYyzKl7WH?=
 =?iso-8859-1?Q?0dsI3PJ76alnrzgK2SHgJ1XLb+396QQGlG/iNPWCiZe2rXwvk2ggnbnk1D?=
 =?iso-8859-1?Q?BJ8GORvhCzz6hcgkYg6jbQfcQqy8RMYOt5Qz/yl2Dp+/Qd0mx1p8o/M0PP?=
 =?iso-8859-1?Q?vIlWJkYG5ADwDt9hfKlKMKOc3/nA329TAVnkenVByLL0FbaSfLKBBP0sso?=
 =?iso-8859-1?Q?GyILEhZYjkEu6jKDfugzb6m92oKZd9qN7V+9tKoMLy4V+kmhOcxT8Cayh0?=
 =?iso-8859-1?Q?7zCp2HhByKEVHacA17q2Kba+cjMjupJYBwvLfGNcR6Or+oDK28yusifP3g?=
 =?iso-8859-1?Q?BMBRzzRW3N3b7KfGZUZsqi/cAOY2ymNHdnn3f4+fbBI9zHTsS0k4Cj/3Q4?=
 =?iso-8859-1?Q?XIIJUx4yFtY8NoPhiRk5USZMccPrGoilnBf2YRgOtzDaN0lkyvloolDCkz?=
 =?iso-8859-1?Q?ibHdR0wiV0FiWBSZZV56eu6JINVNAIkj/Vi9DwDHXK/kRAVn7+WYfC4uXM?=
 =?iso-8859-1?Q?KveRTFnVBXEl7RpjHomJ7smB45p9enejyfpX6mQiQwzcmcEADYyWx34aOt?=
 =?iso-8859-1?Q?YED9ojTbmKBx0uoHWcRTZSbUsL1G/caStVlGjyQr8H9CQfrnBBYw1T/Ll8?=
 =?iso-8859-1?Q?2pZrTqygf5+eCAQhL/8jJyTYta+Amkmo7jq7Hi9HQa+MC/unW0qomcwVjB?=
 =?iso-8859-1?Q?2h+VcEuXhQMqmSnj710mc1F5+p6VS6gN6fU+4V/5YoJaql9uNbD7MV69am?=
 =?iso-8859-1?Q?P5p39l/dpLSlUuCnUenvOtnUOGLEuLC3kGnP25zfmqLaTQPhIdbJ7uI+W1?=
 =?iso-8859-1?Q?w6qKNUDrZQE1ibyxE9vJEOOFnNU4ReE=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b2651f7a-e674-4365-50d1-08deed8ed793
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:31:29.2310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQPTag5LNWnH/ccMnLDtSEc9RXUeSKmSQZtqjeFhbpTJTDGUMEii6I1dWJYKS7BxwtktbAnHvIhoh/7vgGU6jKSdo6nknl6wS7Jl8GBkXN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR01MB10927
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 16:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242279

--f5ojgnituwbj6a2u
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH 1/2] package_manager/ipk: skip checksums for
 unsigned local feeds
MIME-Version: 1.0

Etienne Cordonnier via lists.openembedded.org schrieb am Mi 29. Jul, 17:29 =
(+0200):
> From: Etienne Cordonnier <ecordonnier@snap.com>
>=20
> Computing checksums in the opkg Packages index requires reading every
> .ipk file in full.  For a large image with 7000+ packages (including
> multi-gigabyte debug packages), this adds 150-300s to every do_rootfs run.
>=20
> Checksums in the Packages index are only meaningful for signed feeds
> (PACKAGE_FEED_SIGN=3D1): the GPG signature covers the Packages index
> which contains the SHA256Sum of each .ipk, forming a chain of trust
> that prevents tampered packages being swapped on a remote feed.
>=20
> For unsigned local file:// feeds the packages are installed directly
> from the build host filesystem where there is no tampering risk.  Skip
> all checksum generation in that case by passing no --checksum flags to
> opkg-make-index (the tool's default behaviour when given no flags).
> Pass --force-checksum to opkg so it does not error on the absent
> checksum fields.
>=20
> On a test image with 7000+ packages (including a 2.3 GB debug
> package): write_index time reduced from ~180s to ~22s (8x speedup)
> when opkg-make-index is configured to produce no checksums by default.
>=20
> See https://git.openembedded.org/openembedded-core/commit/?id=3De462f4748=
9f35902b6972f9837d9adfa542fc796
> ("Enable sha256 checksums in opkg indexer", 2019) for the original ration=
ale.
>=20
> AI-Generated: Claude Sonnet 4.6
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/lib/oe/package_manager/ipk/__init__.py | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/pa=
ckage_manager/ipk/__init__.py
> index 344e0852177..6c0b896a086 100644
> --- a/meta/lib/oe/package_manager/ipk/__init__.py
> +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> @@ -12,7 +12,7 @@ from oe.package_manager import *
>  from oe.package_manager.common_deb_ipk import OpkgDpkgPM
> =20
>  class OpkgIndexer(Indexer):
> -    def write_index(self):
> +    def write_index(self, skip_checksums=3DFalse):

Suggestion: I would use the positive case (like with_checksums or
use_checksums or build_checksums), because reasoning about/reading code with
the inverse is more difficult.

>          arch_vars =3D ["ALL_MULTILIB_PACKAGE_ARCHS",
>                       "SDK_PACKAGE_ARCHS",
>                       ]
> @@ -44,8 +44,9 @@ class OpkgIndexer(Indexer):
>                  if not os.path.exists(pkgs_file):
>                      open(pkgs_file, "w").close()
> =20
> -                index_cmds.add('%s --checksum md5 --checksum sha256 -r %=
s -p %s -m %s %s' %
> -                                  (opkg_index_cmd, pkgs_file, pkgs_file,=
 pkgs_dir, opkg_index_cmd_extra_params))
> +                checksum_args =3D '' if skip_checksums else '--checksum =
md5 --checksum sha256 '
> +                index_cmds.add('%s %s-r %s -p %s -m %s %s' %
> +                                  (opkg_index_cmd, checksum_args, pkgs_f=
ile, pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))
> =20
>                  index_sign_files.add(pkgs_file)
> =20
> @@ -103,8 +104,12 @@ class OpkgPM(OpkgDpkgPM):
>          self.deploy_dir =3D oe.path.join(self.d.getVar('WORKDIR'), ipk_r=
epo_workdir)
>          self.deploy_lock_file =3D os.path.join(self.deploy_dir, "deploy.=
lock")
>          self.opkg_cmd =3D bb.utils.which(os.getenv('PATH'), "opkg")
> +        self.from_feeds =3D (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or=
 "") =3D=3D "1"

Or: bb.utils.to_boolean(...)

> +        self._skip_checksums =3D self.d.getVar('PACKAGE_FEED_SIGN') !=3D=
 '1' and not self.from_feeds

I would swap them because evaluation of the second one is cheaper.

>          self.opkg_args =3D ['--volatile-cache', '-f', config_file, '-t',=
 self.d.expand('${T}/ipktemp/'), '-o', target_rootfs]
>          self.opkg_args.extend(shlex.split(self.d.getVar("OPKG_ARGS")))
> +        if self._skip_checksums:
> +            self.opkg_args.append('--force-checksum')
> =20
>          if prepare_index:
>              create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLO=
Y_DIR_IPK"), "package_write_ipk", filterbydependencies)
> @@ -116,7 +121,6 @@ class OpkgPM(OpkgDpkgPM):
>          if not os.path.exists(self.d.expand('${T}/saved')):
>              bb.utils.mkdirhier(self.d.expand('${T}/saved'))
> =20
> -        self.from_feeds =3D (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or=
 "") =3D=3D "1"
>          if self.from_feeds:
>              self._create_custom_config()
>          else:
> @@ -346,7 +350,7 @@ class OpkgPM(OpkgDpkgPM):
>      def write_index(self):
>          self.deploy_dir_lock()
> =20
> -        result =3D self.indexer.write_index()
> +        result =3D self.indexer.write_index(skip_checksums=3Dself._skip_=
checksums)
> =20
>          self.deploy_dir_unlock()


J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--f5ojgnituwbj6a2u
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIaGAYJKoZIhvcNAQcCoIIaCTCCGgUCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghehMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
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
jnZymQyd/teRCBaho1+VMIIGkDCCBHigAwIBAgIRAJNhG7GFaX1Mm3w/sd+ASzYwDQYJKoZI
hvcNAQEMBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQH
EwtKZXJzZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQD
EyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTIxMDMyMjAwMDAw
MFoXDTM4MDExODIzNTk1OVowWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJHlG/qqbTcrdccuXxSl2yyXtixG
j2nZ7JYt8x1avtMdI+ZoCf9KEXMarmefdprS5+y42V8r+SZWUa92nan8F+8yCtAjPLosT0eD
7J0FaEJeBuDV6CtoSJey+vOkcTV9NJsXi39NDdvcTwVMlGK/NfovyKccZtlxX+XmWlXKq/S4
dxlFUEVOSqvbnmbBGbc3QshWpUAS+TPoOEU6xoSjAo4vJLDDQYUHSZzP3NHyJm/tMxwzZypF
N9mFZSIasbUQUglrA8YfcD2RxH2QPe1m+JD/JeDtkqKLMSmtnBJmeGOdV+z7C96O3IvLOql3
9Lrl7DiMi+YTZqdpWMOCGhrN8Z/YU5JOSX2pRefxQyFatz5AzWOJz9m/x1AL4bzniJatntQX
2l3P4JH9phDUuQOBm2ms+4SogTXrG+tobHxgPsPfybSudB1Ird1uEYbhKmo2Fq7IzrzbWPxA
k0DYjlOXwqwiOOWIMbMuoe/s4EIN6v+TVkoGpJtMAmhkj1ZQwYEF/cvbxdcV8mu1dsOj+TLO
yrVKqRt9Gdx/x2p+ley2uI39lUqcoytti/Fw5UcrAFzkuZ7U+NlYKdDL4ChibK6cYuLMvDaT
QfXv/kZilbBXSnQsR1Ipnd2ioU9CwpLOLVBSXowKoffYncX4/TaHTlf9aKFfmYMc8LXd6JLT
ZUBVypaFAgMBAAGjggEgMIIBHDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA4dibwJ3ysgNmyzAd
BgNVHQ4EFgQUp9eVd+tKwyfNk743TCaEIRR9XZgwDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMBEGA1UdIAQKMAgwBgYE
VR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRy
dXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwNQYIKwYBBQUHAQEEKTAnMCUGCCsG
AQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQBw
pquT4ow8LyRHG6NgR4oUsFncHl+eWLMtEBwv90EpGCGGDDDjoO23j4Zw6tS+THzwgz4SyP0M
FQaMzHj40enm+z1Y29QIQCnJTeDOHWHKMRxeiFD8MBso+XgVM6z6MMDbbJ95btM/4eE3LyaB
uBbheiINaAVieIdxLq6+dVkm00kmvMdlARsTkEvr5a9nYhGAs8T5RBD1DozAv9r89WJcn+QY
X1M2l5vv0ws3Me1ziVSjC2cRhcae4seOFFjkRdJItzfk6H/Wm2FNv2XG8nE1nbgN8UCdhORO
lQGGQ9DN152RmSJ1A6KAJIldo3YrJNiO8J4JLAE5/Tl9CNUHtbdYTOZLCAZ95G1g2GELQ2DQ
1Xxo55iNojqUA4w1feORe86Dq2P08xzolHKepP1LGEw1gDGCkUYR0gVXLJExGd3dfEZDm0mm
U7vWb6vRyLso/GUawFD2MZS4kK8/igkPO2Pkjfd5HD7hknpPVhcuBaWxWj8Q7bjwVlxGwts6
sNZ+UJ5HC4c+11vVoV9cdbb93qpbWn/d+azhit6kRYdUmAUl8Bt5VRBMKCUnSaAAspxb9kFK
+cvm/MjErxN63YNEcMs2QKs3N862V8MQaoKqD+KsKnaLxF6pxRpOotenpfUTNE9GqxP9nI6i
9rSHf16VFwW4NnJ6yUgzHUMdIqtTge98VjCCBiowggQSoAMCAQICEHb3t/4teUvaYKSSf0s+
XMIwDQYJKoZIhvcNAQEMBQAwWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjAeFw0yMTAzMjIwMDAwMDBaFw0zNjAzMjEyMzU5NTlaMFgxCzAJBgNVBAYTAkdCMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxLzAtBgNVBAMTJlNlY3RpZ28gUHVibGljIEVtYWlsIFBy
b3RlY3Rpb24gQ0EgUjM2MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAk7qaEDRX
E35PMot8PAmiNaWYblItPHGyt1+H+DUs2GAYHofsdeURmjngaB0C3GcUcrVav1HsGjJuoh77
nRif3O0gxUJGnIzj4ppKxxTsMNau8qvL+FnEkK6VrnqqnKIL3myjhJRdghUlK8Lgetl/3Pdz
KQ7JO2xPZFklrLRm8EQSuUdyccvb+auvRdSnwrxsOvV+9n18ZdeahL/RBxM7R31DhVkMPO19
EiQMj4PBl99wuWzXWL7yLgYh2/TJvIpSOf7waFcHkVYvfAPivV/ulUVaN2ncpSvlE4/TjA8d
5NXKOY+C7RcyD3UZIi6XVg7T81gOfnvE/eEGsyHmgjzLFDYpgBwVOd7jLQ9jhLX4hdRbm959
FrXQQrozzfTbyxRIwMwDqgUoPxIQVU9A7qXKu3yRXsn7OvnjYkYve6X0ZifTbjZaf4Hi/KXW
fNn67zqCt0eNONM2QB5bNqg14qLooRQcgRpSNAEB4UsSyhwsJqEhXz4QwPFWn/wwvEJ0FgYD
AgMBAAGjggFsMIIBaDAfBgNVHSMEGDAWgBSn15V360rDJ82TvjdMJoQhFH1dmDAdBgNVHQ4E
FgQUHwSkfkz2MrEJ4pF84WzfUr/PLv0wDgYDVR0PAQH/BAQDAgGGMBIGA1UdEwEB/wQIMAYB
Af8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGA1UdIAQKMAgwBgYEVR0g
ADBPBgNVHR8ESDBGMESgQqBAhj5odHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJs
aWNFbWFpbFByb3RlY3Rpb25Sb290UjQ2LmNybDB/BggrBgEFBQcBAQRzMHEwSgYIKwYBBQUH
MAKGPmh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY0VtYWlsUHJvdGVjdGlv
blJvb3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTANBgkq
hkiG9w0BAQwFAAOCAgEAWooWgE/1j6esLJfOKB48VUcFaafH6wZcbEln7ls6BP7IvAP2GDRF
33LtQhuVpt7qIqm/RXxWQLaC0yA14LE/pZZdm6CkkoWlTRgzZln6rM9dm2JvqyX2TLS0Z7P1
E6o9EmPx53bRNrnauUu2lYYfpODYq/5LzDPWBjGNK5QW4+oKCykPzzfSveoF5KTuW1xxy+da
EmtXm3hgYwYvTrB/7jHZU2hVbj/8DUAf/JCa/+AdQCtUE5XzKl6o5gGtWahY1yh9smQ3b48/
cto1QW+ZwGCHk5CLr5bDhe2uh2ifn8BXxBOf33D6YHjnrOUyNxi43QD2wZRwyL8arpu/Ljl4
H9zwIM0Q4vfbZuDghYLDnRVC1fGYBArWxw+uvoEMvO7lcc9MTezGkonPmanHYAcGffaIXpIQ
rQWtWS9Pb22jEy6YZCUiqH4YcqkelJHqJD1HBLVMOPaCn2wXgBbv9jvZQsP9yFrD6tKX//ue
D1V12I+L8qjUj17/ZRuxLcPDCF6vb/Svnu38Ejni16jHUO9G/YWFBZOuRbutUEgEp8hMXEzJ
XO43NzBthf80VV86GaC83nNy3TETFF2yav+ioLIK7Qd5NRnI4DXNQYPq6j8qkEnODayXA1bR
7V/qy4BrdrLHJf9NHMiANvCNiDn02MuniTPmb+rp4syaXK409MSG4PYwggVWMIIDvqADAgEC
AhEAsFHj29zvfVPWA2FcnDeJlzANBgkqhkiG9w0BAQsFADBYMQswCQYDVQQGEwJHQjEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMS8wLQYDVQQDEyZTZWN0aWdvIFB1YmxpYyBFbWFpbCBQ
cm90ZWN0aW9uIENBIFIzNjAeFw0yNjA3MDIwMDAwMDBaFw0yODA3MDEyMzU5NTlaMCoxKDAm
BgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUpuQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wb
v4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AHQAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH
+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63whIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9
xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4NEMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK
6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPhvLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQd
xilvAgMBAAGjggHHMIIBwzAfBgNVHSMEGDAWgBQfBKR+TPYysQnikXzhbN9Sv88u/TAdBgNV
HQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQC
MAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGy
MQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYH
Z4EMAQUBAjBNBgNVHR8ERjBEMEKgQKA+hjxodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
Z29QdWJsaWNFbWFpbFByb3RlY3Rpb25DQVIzNi5jcmwwfQYIKwYBBQUHAQEEcTBvMEgGCCsG
AQUFBzAChjxodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNFbWFpbFByb3Rl
Y3Rpb25DQVIzNi5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggGB
AD6hnou447615g2A0y87bR6mtVI+C+wAFCqRqfrCgHu0dB29VPiVXIVYbPN7H6meSMNr2lFo
e81aZfbE7LMQj98hVKA/ljqWKJe6R5W1Tssv1568G9GJ0fvL1iGT74LuqcuYPt0LVH99Q1rH
MfCBKpsyFo7P3JwoqEkuIpbAhaQMYdTcOgeHMYOLrIdx/9wQ1BXjTa/Cajvc3QxJEb308wgJ
PBxhl8FWWm5MNOynBmRZPKeOeMF5113u6b03KTmXhBqSVeN2nZXEZ+B+wNcJv1dr4Sa0/k6p
tbjZcr9ZkK7QtCarYgLDbsSbcLRJMuXUSHf1yaLwihZWJ1asynbFEmv1SrRSQ+3Hv4megEeY
kYmW9Jiu9qh5z6S98F7JhsP4n6tGs24Xz7l2I/T+BmJMRglTeQnzBihH0kFPUanlApSKC99A
clKs/tfOX8HKHs79Bw3PjRjJDog4D4Pbkom8UwQ/m5sCuOf7v632pjK2jm3OErS3XZxIjnFV
4Gl+5jZ1zzGCAjswggI3AgEBMG0wWDELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28g
TGltaXRlZDEvMC0GA1UEAxMmU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBDQSBS
MzYCEQCwUePb3O99U9YDYVycN4mXMA0GCWCGSAFlAwQCAQUAoIGgMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDcyOTE2MzEyNVowLwYJKoZIhvcNAQkE
MSIEIIrGrY68BolNPG8e52i3nV/kYDi4ByKBHRJrLrdAl50LMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQAeMzpBnOFlYHwXUry1O8tggiVju45YNVtqQAkQN9/ALQIAcEsmj1a8vOSpKY/pUEMZ7Y7v
LN/qaQ621pX7Oyi7HkoLOub2bC/xrhHXeoL6RaEcZDzdyqIEe8uGEKyqFB9Sb4EMnoIAZ/Yp
vxmF7H3or92ZwRdAJa/Jh35uzEL+y3XfhWrxHOgavcgJ7XTKVc9bs2GG+Hf94BiTc4a7YYXL
T6OmmJd26ATqDom0PvdqYCzQ9IIC3aCPChfmQuv5k6tUtEUILn5aQfjk11exV4v0ljYEtlAB
OlSk25G6zSIShkqbkfR3ArCB0Z8boeTp3der5lkjzjnyyRQly2SL4t08

--f5ojgnituwbj6a2u--

