Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AFDF34C4B
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 12:27:20 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.270405.1776083238377578836
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 05:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=GaeNM4pC;
 spf=pass (domain: siemens.com, ip: 52.101.69.2, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jh0kM1j/7eg4DH68AYGbgVdJj0FHHPNPoWe7cMjBeMsQma8t5RoUkcZNvQZ758WNMR7Z6gAXTGMhRquUs+Lp6YZvAtPt9S0cl5Efg9ViqIOJM6LyOno+IzUWK9pbEpVW9/joejJ6QSSx03CPy5OFHEIOnPw+cKHZVgJYc00JcssiTelM6xK4+x+qLRpfXEsUs6dj2RTaodV/sCVTRrxbuYV4173rvZ4eTWfjijnXBUxVnbNEN6CdxU2XKOV9UgbRAxOUIQv9BtqcSZ77isxaSrhyWc6WoxUffGbiDIIFXo6PQZ0UeiBKNDXRBleoOL4X4YoZ3qoDVs9+MfNW8Lpznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rij8Yd6c6JNZLLhgHPnMWlWB0jcxcYiR9jiKPphN89w=;
 b=Zlv0DJlVd6uDOpsPb8kovjF1EIfhuOqXGOZ+iwVQEDI6rIY3PXkmvZv+egN3j2VaIb1GKJk/Y0UzBDB2TpP2r4Afii9oIASlYRJaK5gAbxGlYme/K0Z3W1n4n5INkE9uc+BNp21/pC3t1GdbNC//XY6AKcxe/RdZsGaDULw+yFcPDxeCwB1fVg+uNXorwHLfHv4Zugga1z0esMPvObC4bxNAJqeeuHvBCnBESvGbubFLRHHFb8cpT5lzFY2ov0z+lv1IblHmemeZZQXVBPHlNlALYwB7mqGehKlEhb0ARstJ6MsNIuzUgHWQcX+7f59FwZSV9c44lfPVOnENiwKPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rij8Yd6c6JNZLLhgHPnMWlWB0jcxcYiR9jiKPphN89w=;
 b=GaeNM4pCAqACna5LjTMwTxrJQuo2crbC6vOmj1dwOg5v+VWgWGgdBTpN1M5ehxWfGOtJBiUzMzUMd+qKF8B3B92FFRv5TmTZNIsLTLFtQJE75s1JRH2hYpjsxu0M7f3Riph1PiwITTCtcWfbZNdlX/QjGBd0J/0Hg7JDNvLYx6Z8D6c6KpT7aGZihAKg91vqmTymWnMFeEbjaf40Ud0+B+BJrIrBYOcfJj8LkXDrQ4RH3aRUEzOH18qF8yFrZ9xk0TM4KaKz7Ak8D9LHz6hhCBoS4UlcnDho4hSrw7OasvjZ6nQZ2TR4pFcD8fBuZjr31ywvksIT3FHFTQ6gwLkNog==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS5PR10MB8124.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:677::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Mon, 13 Apr
 2026 12:27:14 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9769.044; Mon, 13 Apr 2026
 12:27:14 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Pratik Farkase <pratik.farkase@est.tech>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: RE: [OE-core][PATCH v3] go: add ptest support
Thread-Topic: [OE-core][PATCH v3] go: add ptest support
Thread-Index: AQHctuAaA/Psr68Rb0KWKdd+0pDpwLW1bX0AgCegNICAAAU3IA==
Date: Mon, 13 Apr 2026 12:27:14 +0000
Message-ID: 
 <AS1PR10MB5697E557D5CACB6216753B35FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260305110200.17834-1-pratik.farkase@est.tech>
 <20260318140356.7609-1-pratik.farkase@est.tech>
 <DH6KACIJTUKF.2I7WOQSMNY39E@bootlin.com>
 <VI6PPF734FBAD1FE9D4D1744B8CD242E774FE242@VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: 
 <VI6PPF734FBAD1FE9D4D1744B8CD242E774FE242@VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=60947901-d2ac-4042-b35e-4a1a5a27bc3e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-13T12:23:26Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS5PR10MB8124:EE_
x-ms-office365-filtering-correlation-id: 17887696-e6bf-4ece-2651-08de9957fe8b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|55112099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 n840Fh37LdLdWc0tORnot21WBpFf4rs74S3UVCP32T1hU1tJryPf0CJgL9Y9uQ+Ap/kzpErv8zqnkD6Wjdz0ivndKR4WlEq2yzydMb+dlyawUS5CexgyWnKipCXhM3DtVzdikhf4PVa6Wwm85TgCYqf0wxEAQwleAiKAH4I12zz64DjKMLbCpuGehzmyrXOiaSXNnHX3bTkxMjm2PTK1pFVspG562+j1RDU31wUhxJNc/zeTVUnjg2B7280Tz25FXW4m2HcN9WlOBGn8U1AkVSxy0q/ZlroE11nfHsrgXhuY8oqcn9wVwgmccEdUQJ19ksZhIeuBTnTfO1RZXSyiEsyhaivExAjSQuukq5b9SKnTy+7pwlzMR+z4FVYPeXuXnD7MMswit3qxsWe+5OvCM7oRLadnzblz5kc5mgzRNQ3BL89io1QZMXYwip2dDlke30j4JepE7dhkhwThKebr4GJ1apsqmRVN6bXmct6gVQ5RPsPawPwENBztqdNPzjmbPjH1dxfWYBTEHnhmKs6qtRXgidD/db5gf1GUCcr2coJLWPqhcnUcZBw26xH2SOvxi7m88EhEFm6TUPwq6+C5v+KbbEGOR4sxYK1dIyzP3aRMwadalyHgii+QfHguDQ6keWuRdPip6pzkbonhByY8PLsUEt5l7f6tSuF8DJvJCVpTWaCAeqKX4ZebrcmjJHweVSKXqZk9uuirTP5ZDSrL/Bcd43OdP/odZ93cygzsVN4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(55112099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oNZRj81GLVCHq5FgfH7157OksBtKIUWJypwrOdhrOnDzI+fPwK1AFFnbRG2i?=
 =?us-ascii?Q?KpZWCG3ZCYKm3aJ/ersdO+j3FtFCEs0Hh8xHypBgF8xO3ni04zQdxY0fmnEM?=
 =?us-ascii?Q?sgIoIxGkN/+iLXPe7cfOW9S0TpJgIePe8bSjZ3yHUaAY7l1X5VYjawF1NJ9Z?=
 =?us-ascii?Q?BJNaT0GZ0eaQ2apITkfV6UQeZiSY+g1n+sgSNzxsau7a7GDa1gQZmf0CQGH2?=
 =?us-ascii?Q?8GdKKvzkg+DwasneYCYGkDJHlpdZBR8awGbLUZa95IlkvvZHenSz29hlDr/b?=
 =?us-ascii?Q?n8ok0OCSGhKMel2R/Uspw04E5jMPEsoTusShSLZS7AZyLc6tFn7lnujhp/Ql?=
 =?us-ascii?Q?BxQZAoa/Rw5Qjk5wGXrHRR8MrW+RgYKQX+KN9cY5SYrvrEXXd/caMRSGLjXZ?=
 =?us-ascii?Q?yAeM6eM5R+PkRqflmNSV2jG1bmFX0qoxC/LipEjTlNuGAIaMEktoYo48eoMk?=
 =?us-ascii?Q?LQ4v0A0QRnSJ4Rv9SI/Nq/AoKQKNMVbJBmyJM/oXPEiKxadLRzJTziEnBQYZ?=
 =?us-ascii?Q?dy73I+WCipx63GpqtGA8FBkUzyf7p5psTwP7nReuedAf3DZTr5BKgHoPvleo?=
 =?us-ascii?Q?piytaeGCRD+qXajc2E9aJbhkIN9G/4gAvQ0mqSCIgeslToCNZ5Vn/QZXKa1F?=
 =?us-ascii?Q?R8jGulchegefwo68IzCmKUbjegftZmVnYe/RDwdLWK8Kp80G7+RcA96odqTe?=
 =?us-ascii?Q?EOaDPYfR8mVaqEVVoJfbZ4LNn8XTJ6WC9CPQMEKJQvfzeIMm/3eUbKEGxI62?=
 =?us-ascii?Q?rIzkQUidWHZkA2wVzMWy+XEsE+9/rA8pjEeRl4ZePLIHQV158P0nD8AtfjlZ?=
 =?us-ascii?Q?jv3d4NSdUnWPnRZowQuEvtKmzSzI4zrgsHdJeqxfQf9pE//DuRDm47OAPfZk?=
 =?us-ascii?Q?9ylSa/mPsKPNE+04nY4yMk+ItIcS2tLGToBIBq/QgnSKl/Q+CkuDI+Ax3m5I?=
 =?us-ascii?Q?J9HT9mw9XevU7RnQlAzRIG4b5bGqmQ3FrxQmA1F283FWDnIR5sLMtzJGcf15?=
 =?us-ascii?Q?g+86UT833qipT1WyR4+EiNkrJv35X/hdWuaeZki7Syz2EPAFl3qHI0jacgP6?=
 =?us-ascii?Q?eeszIe1wrCAh+AxCkzkL1BlpJO4trdf/MKhAhAgPcLj9S3uQU18bxy1jxrm6?=
 =?us-ascii?Q?L94M589HERoNCUPYQpmPGcry7+U6fZOy1p19rri3tKZmTbrQS0NcvCdkh+Rp?=
 =?us-ascii?Q?9Y3y5P82Fuat6FhsL1oWn8eCGelJy0/YlSDKwd853nnLgJ8r7jjQMZDZ70ac?=
 =?us-ascii?Q?CGId9lMwNBoVwHScenyO7GFHmL6DPJVP6gcYKUJ5NXEcRo2y+4gCWLNi/UBS?=
 =?us-ascii?Q?SYZJ0PBAdH05HvluBdeJk8o7AnVfDypQ6GVOse9FE4c5UZ1WSeknTlf7Z65b?=
 =?us-ascii?Q?AGeoxNFHmkojx6i286B5U+KGddxDyP4KyzPxglTJC9djoj+VvhyD0Z4IfMKz?=
 =?us-ascii?Q?OuWq0GXpFhixhbBNDhrRFMojO7KBMCJ47fxAN2bxxtvKXLHMDWb1aXzP2Lxj?=
 =?us-ascii?Q?QoTk1Ko7ovMQfwf6gx9jgtIJJWyl3ymR8bUf+KBrRJUqdfxfepy2SCdMJIfA?=
 =?us-ascii?Q?pbBqOf4GOZFwVW7rLiWeCnAB7/VRkN2VLoxI0n3pLco9gIbjbBqCjUXvwasY?=
 =?us-ascii?Q?qyM8f7WMLGx7wzrUwbn56cVzWQkwKTa8EP1w7mregERnU3sTGiri8zG3OBU4?=
 =?us-ascii?Q?xmf2BAQuh//t3m7vpaBTjd0j9v/F4rX6m4pC1YTucSM98DNmXXphbo3cFOJv?=
 =?us-ascii?Q?IkuC+Oy26g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 17887696-e6bf-4ece-2651-08de9957fe8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 12:27:14.4568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XecQtGo3P1VWvjCUI9FKg5UDkmzGIe3vSwKoF3ofr7cjPpNz1mAnx9/Jq7oPsSvRnfNRD6oMYHSXGx43ukf2vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 12:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235110

Hello Pratik,

I think that better is to run the full testsuite and increase QB_MEM for vi=
rtclass-mcextend-go under
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/image=
s/core-image-ptest.bb#n36

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Pratik Farkase
> Sent: Monday, April 13, 2026 2:05 PM
> To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; openembedd=
ed-
> core@lists.openembedded.org
> Cc: pratik.farkase@ericsson.com
> Subject: Re: [OE-core][PATCH v3] go: add ptest support
>=20
> Hi Mathieu,
>=20
> Apologies for getting back bit late and thanks for testing v3 and identif=
ying the OOM
> issue.
>=20
> The root cause is that Go's test suite performs on-the-fly compilation du=
ring
> test execution. Even with the autobuilder's 1GB RAM (QB_MEM =3D '-m 1024'=
),
> attempting all 253 stdlib packages causes OOM kills as compilation proces=
ses
> consume ~1.5GB.
>=20
> For v4, I've switched to a curated subset of 17 core packages that comple=
te
> successfully within the 1GB constraint:
>=20
> Test results on qemux86-64 with 1GB RAM: 17/17 pass (100%) in ~6-7 minute=
s.
>=20
> Best Regards,
> Pratik
>=20
> ________________________________________
> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Sent: Thursday, March 19, 2026 7:57 AM
> To: Pratik Farkase; openembedded-core@lists.openembedded.org
> Cc: pratik.farkase@ericsson.com
> Subject: Re: [OE-core][PATCH v3] go: add ptest support
>=20
> On Wed Mar 18, 2026 at 3:03 PM CET, Pratik Farkase wrote:
> > Add ptest infrastructure to test the Go standard library.
> >
> > - Run 'go test -short std' via run-ptest script
> > - Install source tree and pkg/include headers
> > - Create VERSION file for architecture detection
> > - Exclude multi-arch binary testdata to avoid QA errors
> >
> > Test results: 237/253 pass (93.7%) on qemux86-64.
> >
> > Known issues:
> > - debug/elf, debug/pe, debug/plan9obj, internal/xcoff: missing binary t=
estdata
> > - time: requires embedded timezone data
> > - net/http: requires unstripped go binary
> > - testing, go/types: minor edge cases
> >
> > Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> > ---
> > Changes in v3:
> > - Move go from PTESTS_FAST to PTESTS_SLOW (~45min runtime)
> >   inside ptest-packagelists.inc
> >
> > Changes in v2:
> > - Exclude .elf* files to fix QA arch errors on all architectures
> > - Exclude *-x86-64* files to fix additional arch-specific test binaries
> > - Tested on x86-64, x86, aarch64, and arm builds
> > ---
>=20
> Hi Pratik,
>=20
> Thanks for the new version, but we still have some failures:
>=20
> WARNING: core-image-ptest-go-1.0-r0 do_testimage: There were failing ptes=
ts.
> Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openemb=
edded-
> core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openemb=
edded-
> core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openemb=
edded-
> core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openemb=
edded-
> core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunner_=
expectfail
>     self.do_ptestrunner()
>     ~~~~~~~~~~~~~~~~~~~^^
>   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openemb=
edded-
> core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptestrunner
>     self.fail(failmsg)
>     ~~~~~~~~~^^^^^^^^^
> AssertionError: ERROR: Processes were killed by the OOM Killer:
> [  132.843492] Out of memory: Killed process 769 (compile) total-vm:15536=
64kB,
> anon-rss:256564kB, file-rss:0kB, shmem-rss:128kB, UID:0 pgtables:644kB
> oom_score_adj:0
>=20
>=20
> Failed ptests:
> {'go': ['archive/tar',
>         'archive/zip',
>         'bufio',
>         'bytes',
>         'cmp',
>         'compress/bzip2',
>         'compress
>         ...
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3319
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3294
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1277
>=20
> Thanks,
> Mathieu
>=20
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


