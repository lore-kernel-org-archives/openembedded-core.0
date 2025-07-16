Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB4DC83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 13:54:26 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.62])
 by mx.groups.io with SMTP id smtpd.web11.22651.1752674062965233862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 06:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=CgZsWuyZ;
 spf=pass (domain: siemens.com, ip: 52.101.65.62, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdVvAskDdMygNrDiOsOMT4om0BUWnCn7U1fAssHvxmp6YITge0SQ0bYEyGB0JrrII3/8+RNS6IBdpKYI6YDnmiZuDxvrg9CvSWYJby1ClbnVPROh4BJWameEzHR3jgg8pqyiMnUsazgb6fw417Rer7bL4XQOZJJCjgFyFUeGpeHcc4mc44D3iTWaQbGK/JlJQKRweSYGY4FGkQUQpmVUx21On0o8hRnJd7Un39zj9xH2PmpKoAENiuj24hRop6PgxOiD7b/Rbzk6/F+9V/4toU8Xv14UljDBcvq3XAg6h10l/VrpcAyBqMOBOCo00QnAcTFdEA9iBNCh/nXVMkU4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYL6BssyJhRzw8dJBlKX0b+7K+bEhzLszpOUH+aW8Vc=;
 b=MykmNHi0zOO2h0L3QzMJ8g1I88/V6Ke2KVIzuYACx/ox36HVLlpauGcDTy82ZBAMmMfne9bxfN/WiH4IK+hsIatf38smDxbBvx47Tl8LUsF95ZMdGGfuBcL7vTkRJT7xnUfH4K01lSRtqAVYFok1Sgo0cFmAWku71GaPGJcGehWfal6LUL+SrcWrNGCRz3PpUir+yXjZcCL2+EOrB3Vc2IVi36zbbW3uwfejLbhiZqXnGQUNxujtEFvTjnQ8eOCg4iaJOTXC6ZPP1nk/sdPHABvkTY1av3acL328urxxivgp7KEuj07CdfqA2chQgdh+KpMpEByX/5HOaNEIexMFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYL6BssyJhRzw8dJBlKX0b+7K+bEhzLszpOUH+aW8Vc=;
 b=CgZsWuyZx7eWzcgPQqqnvRjHqV0PyIHCDOXC9g+s3a2KWirampbxPsZJib3sgpvGrSP5YV/BdA0Ibh46dJes73Wkf/OfCR6QVU6JOMextTel9nw8KUT04quSkjjYpOh6dI1lpSZdIzA4y4Rqg3AS10pexz/apeQvENwVb7aUIEKWzQEP+GVQVzz1WKmqsYO92WDHb07E+DOaOH82FGPpsoTMVOAyt7tq0dW4mx9OyvikstlxP7KWgFyr68l/8eLzx19+wfRVErm8uhmufJ6hkCao61Da1Yk7Ot7b4VV9ScNmoCOR1jg+0o5YXey2adr9bn6kg4LL03gewWHnPUtXBg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA3PR10MB9271.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 13:54:20 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8901.024; Wed, 16 Jul 2025
 13:54:20 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 08/23] oeqa/sdk: add helpers to check for and
 install packages
Thread-Topic: [OE-core] [PATCH 08/23] oeqa/sdk: add helpers to check for and
 install packages
Thread-Index: AQHbwYfcTu4nt2aojkCYFO9m3WWvf7Q1KqxA
Date: Wed, 16 Jul 2025 13:54:20 +0000
Message-ID: 
 <AS1PR10MB5697CDCCFB1F944F706B775BFD56A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250510084400.269726-1-ross.burton@arm.com>
 <20250510084400.269726-8-ross.burton@arm.com>
In-Reply-To: <20250510084400.269726-8-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4f735346-8fcd-41b9-8380-f092e9b65944;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-07-16T13:38:09Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA3PR10MB9271:EE_
x-ms-office365-filtering-correlation-id: 861814fc-71f9-45e4-85cf-08ddc470436d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?eOnCaztMK0ze1w/mP34MNd1PfIWYW6ued/asV06nkXfwBezOrq1REW5vYso9?=
 =?us-ascii?Q?td8E67/U/RsWOBMXfN/p1mwF4cIbewf9PU6PJKrD9zPIWtflIp6DmM7csIkx?=
 =?us-ascii?Q?TprEVFgf0eoHhQPkrjr5/R4i7zPyxy6G2rQ2wUxRn1mTHx1/XiQ8qt3/1uuG?=
 =?us-ascii?Q?fnUWs0zqVHJvyDtrETaJUBdeR4vYll4K8pThnBBqAXtmH6X4NxeF9fSjN0H+?=
 =?us-ascii?Q?BivVUntKiyreokUmvFI6IzvguyowC0RTmwFeCvT3yDigtv2cL0g4ikJc+Bx4?=
 =?us-ascii?Q?puA4GDSA3+M3OiqCktoWEdhQ1Ls/f+6/OahVZgwAt7Na419KEbt1qA35lBui?=
 =?us-ascii?Q?sxxC+KgFUGvyHMc8csY4YRSbQIE4a70z4n1JgWCYRooCOjC9sGU5llbkNOBL?=
 =?us-ascii?Q?T04jFPdUnkbiFBQz3ViauU0SeRgiU/pF+7SODX73U2oyezSakyMSwegL88D6?=
 =?us-ascii?Q?QIdf0dO6u1bZ+0Ulk0qM9PJEBSLsW88RsSrUjKXHDngLzFDyJAfGbGkeAuWb?=
 =?us-ascii?Q?WNYaJcmLtuWqXdLBvCj6ARfxHqYkGypyUFioUjeVxC8nelj8U6CDQ5pBVhHr?=
 =?us-ascii?Q?feIX/IB9d7vhid90h10isdH1yaUtYLt9yWgCdIfUptGbA5SGSL60ClwbPvma?=
 =?us-ascii?Q?nsjeDq2rPiCx762gfiZ6BbLIxaQ6c1W2o+KydWZ3C7H1ZtdcGdThaFLsxV/X?=
 =?us-ascii?Q?KrvsyxpWFcuJNxnJskKMkGoBTpG95+7wtXlFDO3g8xFvj/7POtkbB7Qlr581?=
 =?us-ascii?Q?E7raN4cSwjeYun938zFEbXkk/ddZuavdX7EoVqHJR5SSy90UShXlogz0omxV?=
 =?us-ascii?Q?78iYQKyNtqgpkzTxtpj93A7rafiuyj0SThC+8ttAtarpAUokgta2C+LGKPIU?=
 =?us-ascii?Q?dI22Qt0XqwQZMYF9t0EyK3EBhmD3ud7aa5EUald7z1Icof8YUmK1JOO+TJNS?=
 =?us-ascii?Q?ilsd0nf4fk7jfMYuQscfWwlhvIBBd6Gvw1qYOuHG5w2mJVGUa7lH+jypWF/X?=
 =?us-ascii?Q?8drlpceF8T3xkkZhQdI7Rh+lhGEZqSVfUWJCYMFI04ANTrbruVuqr9YoB1WL?=
 =?us-ascii?Q?XzdnBqxNHgrNYZZGoLNUDZMrGb8zJGs1NbcSXPgToqEfhuuz16HpCeMtAyat?=
 =?us-ascii?Q?NAS56zqpDIfAfnnrvCzKTNJlOB4hUzTIUpjNjAU+sKRzQ6B38mHP4PcZCDmX?=
 =?us-ascii?Q?Zp3oIcWaNvylkp8fbQa/rWGgjtyENA5LVqK9sDoqXcnjpW9KFrs0+HRUAmy8?=
 =?us-ascii?Q?wm6qb74D0LTt/ZYOh/K8faZj8D3pGuu0Ixou99tN7e6jYeBPD2jYxN0D1t+5?=
 =?us-ascii?Q?mek/W/5Eh8BmANgoK0OQxrGxH0UvunN7ggyLZhrJVtxJMQMPUDixTU8TVhRg?=
 =?us-ascii?Q?iNU7ipG4IC0aru5LOlf69NEeMEypoxa8vNxhqfaDTvYXpPYwq2My0A8+UEmG?=
 =?us-ascii?Q?NjW41AmAFhU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?AjNPrYo7ibdqr7bOM3IpvMmCE1+ImeiVIxZT9aAafAZnJCosHk2TbdS3IUn/?=
 =?us-ascii?Q?rWuVIRSxO3+LOHAmtEcrzY9TLFXfBQ3Sb3kZ40Oq9Hg1MZR4LD42tolK89DA?=
 =?us-ascii?Q?C+ygrfMLLrsJ0riNEhYSrkRL0WP4AG10yU+AQf2P2mBGWkSJS43cb0TqOq3H?=
 =?us-ascii?Q?QvQk+05OHIVjR4RluY1Ep+SZNQ26G7wB84dLuVpNJrJLbZLksb3beHtBwNpe?=
 =?us-ascii?Q?klyt737dnlTMC6OrDiRKUOoltF6B76he4RkgIE0pbfyw202v+7NG7TcSGkD6?=
 =?us-ascii?Q?zy0YnQt/R0bqMBzIB5ObRWEqcZ0qJeRTUvTEGgfwyj2tHyarHx+3qSbLQccf?=
 =?us-ascii?Q?v578xCgkT1dm4KTCMihoR+c6xaHECa4pe6Jp2X35d/ROfsV9C8P//yNQDGbV?=
 =?us-ascii?Q?B6PYOHr7z+DZ1NVHshDCwTYFjr+/GYLARgialSFYDliwauxnrF1R6gPuV5t4?=
 =?us-ascii?Q?fMmaxX0SAmd1xBLzSdpmb79EZacLrbUFvKYBMVLSaYoPSYivNk7MOsMAfoSb?=
 =?us-ascii?Q?W2G4iQIvedtWavE4CqMDyA/WfORk6VfDlto2+WHJgaelDRiHIbG53mI4qSIb?=
 =?us-ascii?Q?zYVfH3gcrB0nCQPrQ7ESHvf/7Z/GoSGsWgnEaHRqBg6fkNDLQPbRIjmW9ksI?=
 =?us-ascii?Q?wfGr8ACYUXZ6qzyqTQ0feZ/mJ7TpRp/QiQoUCi3ZqLr+Pt7FN3kjNjJYniFv?=
 =?us-ascii?Q?PT9ajKx9j/O6/RrQWZPYEX/M1HOak0W4bLeg2y/l6eUkU409aYoUmjk5rxAJ?=
 =?us-ascii?Q?oC5lEWswmrp/I0kyJhVqXWIeWWUnrwqJRirTUQ/Z/GDkQUtpLmBjbkC8v5GJ?=
 =?us-ascii?Q?U3ZxDA5o0f7ZpXvynEdyy6NLceY5kIIkXGa637z13CahR0uU6GEBnYmUgCE/?=
 =?us-ascii?Q?Ts8HC7UqEV7E0NX+5AuSIyQXAatgjgoIM8bR7bykPrAaNxR+yge3sSXavKVc?=
 =?us-ascii?Q?tN4lGYfEWv4+IDSjzGKsoMBLclTvozgnqobd0L+9UjnLEJcK8H7tlb4aUWgR?=
 =?us-ascii?Q?sO63I7T8V86koq3G6bbzEVVJLcC3Dk5rITk145IGIhBxrL7hXD7wYz3ZUiRn?=
 =?us-ascii?Q?6pzC4BVzV3/PSxqmcga9PVzz9WF9SiJ1OvUNxKEJ6/ozSYgtdC3Uj/kHQZrk?=
 =?us-ascii?Q?CwIwyusFbNubuHjZqYin8v2Oe6Q4AYRM8gDz/KzSIEBdCn6mH+NwS/HBfOQW?=
 =?us-ascii?Q?aBgW5GEO/L7lgPWGq58N60Bwk1Y8GMqc5gfjorgLrSc98ZR1/OsY9PzeXyMJ?=
 =?us-ascii?Q?ZgtbRKn9I6SZgToFiyHEs8ZKD8iXDRMSMZqEND+B8Grd144q4mxOdrNgLIpV?=
 =?us-ascii?Q?nQ8Z85A7+jinZLbb6GpujFZrdFz9IOVCgadySjRNVzISuFUuCeoStANTBkiO?=
 =?us-ascii?Q?F1k4GJ47HkURieZ6Vkua+R0CqasMiCQiNGi9LWGXMsYgAXTC5tHJQHLYsdcK?=
 =?us-ascii?Q?mpk/gT3Y/uTgua+bC37GG3+sWYGo3f+QpCIiwNbZI3OAIQ+exVYVlV1fda1S?=
 =?us-ascii?Q?vEh/DmFfOqLI+9WCik4QxB/QgiFfOH1lrvp/PBhGxKHc+/GctLKUvq3a0J1D?=
 =?us-ascii?Q?tpn5SckyRKWp1JA5IUDDHi0UKoykkWcV0ZXdDDBZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 861814fc-71f9-45e4-85cf-08ddc470436d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 13:54:20.2706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ok5bg4fCuOTmvkPw80+AXk+3gnOV3S5fHA7G+Co19lJ8i2NH+X8Ko9JV01SXcKUqEKLXViQJ0e0n1lMbrgP+oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9271
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 13:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220460

Hi Ross,

I have a problem when running oe-selftest after this commit.
When I updated past this commit and commit which uses it:
https://git.openembedded.org/openembedded-core/commit/?id=3D11277efd0576855=
58a744e98082b5709e849dd2a

I get following failure (on Debian12 VM):
=3D=3D=3D
Traceback (most recent call last):
  File "/home/projects/builds/poky-build/poky/meta/lib/oeqa/core/case.py", =
line 54, in _oeSetUp
    self.setUpMethod()
  File "/home/projects/builds/poky-build/poky/meta/lib/oeqa/sdk/cases/matur=
in.py", line 35, in setUp
    self.ensure_host_package("python3-maturin")
  File "/home/projects/builds/poky-build/poky/meta/lib/oeqa/sdk/case.py", l=
ine 47, in ensure_host_package
    self._run('devtool sdk-install %s' % recipe)
  File "/home/projects/builds/poky-build/poky/meta/lib/oeqa/sdk/case.py", l=
ine 17, in _run
    return subprocess.check_output(". %s > /dev/null; %s;" % \
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/subprocess.py", line 466, in check_output
    return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/subprocess.py", line 571, in run
    raise CalledProcessError(retcode, process.args,
oeqa.utils.subprocesstweak.OETestCalledProcessError: <exception str() faile=
d>

Stdout:
Trying to install python3-maturin-native...
=3D=3D=3D

See below for comment in code which I see as problematic.

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ross Burton via
> lists.openembedded.org
> Sent: Saturday, May 10, 2025 10:44
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 08/23] oeqa/sdk: add helpers to check for and i=
nstall
> packages
>=20
> The existing tests simply look at the manifest to determine if a test
> should be ran or not based on dependencies. Whilst this works for
> Traditional SDKs, it fails for Extensible SDKs if they've been built in
> minimal mode, where the manifest will be empty.  However, minimal eSDKs
> might well have available sstate to install the missing dependencies.
>=20
> Add a pair of helper functions to ensure that a package is available, or
> skip the test.  This handles nativesdk- vs -native (SDK vs eSDK) and
> will try to sdk-install missing dependencies into an eSDK if they're not
> already installed.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oeqa/sdk/case.py | 58
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
> index 46a3789f572..1fd3b3b5695 100644
> --- a/meta/lib/oeqa/sdk/case.py
> +++ b/meta/lib/oeqa/sdk/case.py
> @@ -7,8 +7,10 @@
>  import os
>  import subprocess
>  import shutil
> +import unittest
>=20
>  from oeqa.core.case import OETestCase
> +from oeqa.sdkext.context import OESDKExtTestContext
>=20
>  class OESDKTestCase(OETestCase):
>      def _run(self, cmd):
> @@ -16,6 +18,62 @@ class OESDKTestCase(OETestCase):
>                  (self.tc.sdk_env, cmd), shell=3DTrue, executable=3D"/bin=
/bash",
>                  stderr=3Dsubprocess.STDOUT, universal_newlines=3DTrue)
>=20
> +    def ensure_host_package(self, *packages, recipe=3DNone):
> +        """
> +        Check that the host variation of one of the packages listed is a=
vailable
> +        in the SDK (nativesdk-foo for SDK, foo-native for eSDK). The pac=
kage is
> +        a list for the case where debian-renaming may have occured, and =
the
> +        manifest could contain 'foo' or 'libfoo'.
> +
> +        If testing an eSDK and the package is not found, then try to ins=
tall the
> +        specified recipe to install it from sstate.
> +        """
> +
> +        # In a SDK the manifest is correct. In an eSDK the manifest may =
be
> +        # correct (type=3Dfull) or not include packages that exist in ss=
tate but
> +        # not installed yet (minimal) so we should try to install the re=
cipe.
> +        for package in packages:
> +            if isinstance(self.tc, OESDKExtTestContext):
> +                package =3D package + "-native"
> +            else:
> +                package =3D "nativesdk-" + package
> +
> +            if self.tc.hasHostPackage(package):
> +                break
> +        else:
> +            if isinstance(self.tc, OESDKExtTestContext):
> +                recipe =3D (recipe or packages[0]) + "-native"
> +                print("Trying to install %s..." % recipe)
> +                self._run('devtool sdk-install %s' % recipe)


The comment above says "try to install", however there is no check for fail=
ure and skipping the test in such case.
Before using this code the testscases were skipped unconditionally and didn=
't try to install anything.
Here it looks like it should always fail if the package is not part of sdk =
(and python3-maturin is not part of minimal/sato sdk images on autobuilder)=
.

I'm struggling to understand how this passes autobuilder tests green and my=
 pribate builds are red.
Autobuilder logs show that the maturin tests were skipped and python3-matur=
in is never built.
Do you have a hint for me how this code can skip the recipe?

I was thinking about installing it on my host, but python3-maturin is only =
available from Debian 13 (which is not released yet).

Would it be fine if I submit a patch doing try/except around this line?
Or am I just missing something vital to understand the code and failure?

> +            else:
> +                raise unittest.SkipTest("Test %s needs one of %s" % (sel=
f.id(), ",
> ".join(packages)))
> +
> +    def ensure_target_package(self, *packages, multilib=3DFalse, recipe=
=3DNone):
> +        """
> +        Check that at least one of the packages listed is available in t=
he SDK,
> +        adding the multilib prefix if required. The target package is a =
list for
> +        the case where debian-renaming may have occured, and the manifes=
t could
> +        contain 'foo' or 'libfoo'.
> +
> +        If testing an eSDK and the package is not found, then try to ins=
tall the
> +        specified recipe to install it from sstate.
> +        """
> +
> +        # In a SDK the manifest is correct. In an eSDK the manifest may =
be
> +        # correct (type=3Dfull) or not include packages that exist in ss=
tate but
> +        # not installed yet (minimal) so we should try to install the re=
cipe.
> +        for package in packages:
> +            if self.tc.hasTargetPackage(package, multilib=3Dmultilib):
> +                break
> +        else:
> +            if isinstance(self.tc, OESDKExtTestContext):
> +                recipe =3D recipe or packages[0]
> +                print("Trying to install %s..." % recipe)
> +                self._run('devtool sdk-install %s' % recipe)
> +            else:
> +                raise unittest.SkipTest("Test %s needs one of %s" % (sel=
f.id(), ",
> ".join(packages)))
> +
> +
>      def fetch(self, workdir, dl_dir, url, archive=3DNone):
>          if not archive:
>              from urllib.parse import urlparse
> --
> 2.43.0


