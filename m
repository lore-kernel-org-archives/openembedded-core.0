Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEE1C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 14:04:59 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8932.1788271485992377890
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 07:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=BSbcmwXA;
 spf=pass (domain: ericsson.com, ip: 52.101.72.6, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8bRJBBaUNvQVCplYEi3FPcyJLIn7+PIYLpADAY1Sid78Jmcpk4ETDMk9vQ03ZyKtQiOUdf25Epzz69wEx285Vhm5UewY0VgDzrxs+hXPlpgzinI1D3AgwtIdPyBYE3Yzr0oaiYhqv37MyLlSbZPLY9RMZJa9Dt11RwgprVu56uHDhlpQZKGXSrsauNzHJ4nDxMmztK+ojS49GVOG98bfeonu1dLTKsTKHCnSBFaV3zOi0wGt6Bn08f56nv78J+p9LkuhPyL+yZXreqzf+y7HDBjZmZ6DWmoFMLHhahbOnBVcpPh9tw79bC4RWjlfZCPijzEh8TnwZAqpUB9KoCqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5VrRBy9cNgz2x2GIMC72q/aEDa+IOT0befjhNNIlw8=;
 b=UHv5kEmi3gWJGtzbvtiWMlLTKRyPYfmInvAZVmBga4HK0shW1pUyvgjEc/aKDfHHWTLfbAWsI1kHRLTeMvqwREtHWAKgBLTkKphha7ZZ6Fu6iHXr5HepHBaGqrpdczrTWb8JQbsesl4Bt/xzhVS7zgqHsB4SOMgeYmIW4o+MJzgCIstKiaIVgD/M6qDoWlH/1HKYVNFRW05+2Hl8IRThor7PuQ+wFAX7Kz2JiC6y92+Dadh25tMCuoHINyA59RpltoNRVsuqE8MdYWqIrRgFZiCyKUSnHJ+fyMw41TM7obiai1ZzcOQrI4z31sb5fLKvMXTCXACJEkkhONVlaiXSsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5VrRBy9cNgz2x2GIMC72q/aEDa+IOT0befjhNNIlw8=;
 b=BSbcmwXA3Qnqw98A+7QBeDT+z6a6hYcrC0+8ZTK+7Gb+fw6sT4cSnAECvksSp3+7MIwauBPeXq9VbTwRpMF3FeJw92Enorr3nA+7tg2jFyr+MbSeEQ90S4mrpt0V7Mlc61gjQs0KvQaQWOFmmSzFZlnsrcDs15YqfyjMUp64JOpKm2ZUrOYOBA5xYxKmtfgaNmLJKUb50RR3U6TozNKa1Y5zsrY6vdocYHDSdbsqn7veFePAmibufQXt9BrmHw5YB0dACXixij4ZS+9LOx0lapURng+ONNnbJtd4oaWGLbxxRDGV0TGkSsxHkDqXL83T+pZgUQPWgBPe+D64QpTs0g==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by VI1PR0701MB6880.eurprd07.prod.outlook.com (2603:10a6:800:19d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 14:04:41 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%2]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 14:04:41 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Ross Burton <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [AUH] python3-build: upgrading to 1.6.0 SUCCEEDED
Thread-Topic: [OE-core] [AUH] python3-build: upgrading to 1.6.0 SUCCEEDED
Thread-Index: AQHdNrJHp8UN9ctqckqJJe/rsEVLpra5xL+d
Date: Tue, 1 Sep 2026 14:04:41 +0000
Message-ID: 
 <PA3PR07MB10721FB07C882EEE01C98BBDD8AA82@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: 
 <010101a046f2282b-698750fc-6b87-415d-a181-ff0414056aa3-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101a046f2282b-698750fc-6b87-415d-a181-ff0414056aa3-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|VI1PR0701MB6880:EE_
x-ms-office365-filtering-correlation-id: 1eb991f8-2dfb-493d-992f-08df0831f7a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|22122799003|23010399003|10070799003|10067099003|6133799003|3023799007|4133799003|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 K835O1k6a4wEvkQf4/aOMOuJ5wxqgsmZgWMfgBq0I0hybq/bQ+KDihkqF4jmvPfmjpL5VxdVR8P4ZCHZ/sGw4IyfrMdxP7Ee7eEiIPJ+Qt+mRmRA0wlP+6BSEZzGcVRFY0OEsjitZFMsBD8m2FgLOT4ioZng22vg66R760xEoL3Spt4togVUex6lzpimcfDyybJLOdSRMVLr3iungiouqD3J9wSaXLwFSppajwr2n4hN6h3ljn6vvh9YUko5OMdreQtnEGIvSePfpBE7tl9wXHsZwXNtkKa6CpBvf6Zi6M8SmgkXMS5fM3to54/Rj54e56ed4o4Dt9dILp5EmsSD7knJonCyyRdYWXUK57vRpzbXBhdRbzoDpnrnvDhM4UKcNpLLsomtDsURKkjHQ+1ptctSg+gLiXwZwZjVQH6WJ0chrDGvFcc+RKmLgwdMZy+9+Q+qRA5zx9xaJ32XNYsF9udY1+kd/Ahg8eO164fGm90IGpx7scNyLzIebqPgFiF96aK1++jbAaXP7UVA2fzP4JPaHR/FqiQyWbOAyxy3AGrV7RpwrCyfT/DMMSvQG0JOgJ2Bs0Obt8knIszX8fn21nqc0cW3kh2fCutFc0vlIBEKD6zPkPAOYWWJix+WRqlO7lDZcgzoIorsMuODjOYe3lnOBktQ8kl+b+Zk40w5wok=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22122799003)(23010399003)(10070799003)(10067099003)(6133799003)(3023799007)(4133799003)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?c0bFk9mwdDM3FJsdtlM8OWK4aiC8GSQQXxkviCyxU0+9wzH6GZ6r5OqoKp?=
 =?iso-8859-1?Q?vz93WgknKkhQsTAd1lfCCJ9RAoVPKJm+BlkZr58nONnvEN7UAkWQPtzm4c?=
 =?iso-8859-1?Q?zJ2ep0guvYav/qxDeDRe8v4z8FZ5yhygx/qKndeBN3h9XMwayjHUhHtdlF?=
 =?iso-8859-1?Q?wJ1fnkAJ0F/6SlKinFr7Qa1xpVT6W3E/Qu2kpy4z+17iuF5OVqNBbcAFXh?=
 =?iso-8859-1?Q?dSY8J/BlXUaTwMUtYk63hrAoJ7BVG0ZkA1GtXUvoXaauYEupZbpYYVYl9T?=
 =?iso-8859-1?Q?9zfu+nIclTqSMOIDUshRVii1dGclAYIdU0G/xjU1rDPIDE0JpG3IarIaMr?=
 =?iso-8859-1?Q?yusnnHwr+IFiHsOR9Hg8JTe0P8Lg3qBGTRE3CfzVtxw0G37afs7nxuZV9o?=
 =?iso-8859-1?Q?pOPdb3fbGmLszXG+TyuPPamd+77ohkedBaX1pq7czdWnr1S0I28VQ67YlU?=
 =?iso-8859-1?Q?DdbonKTuqn9WPD9gJcNmKy4yBF1UPNrqmhDfhS3PDGIMoeeXSYdqAyU/Vq?=
 =?iso-8859-1?Q?mxDZKFoZT1JcOINiye2idGnaXuF/RntEgKf1zEEd3OKFLSyZsTRAy3xSw4?=
 =?iso-8859-1?Q?VOZrMNOnKvlxb6S/xuyqdsrpt9Nf3b9aRTB/11DJSH7qoN5Oxc/FhvtIOu?=
 =?iso-8859-1?Q?lN707dKJl4HSluuP9Pbn8Zx0WEFdFHWP0ZMx4NirZ+AH2qChEm5HOwRtKM?=
 =?iso-8859-1?Q?ZY/p7EmobXFneWIZAfSckQtVT18hnMas4N9fnNZOX8iTecbfLYAy55/HpF?=
 =?iso-8859-1?Q?vD4sJ+r01clA0XUwMORreJV2BX8RSHwJO0/kzz7VxDEeAoKVxXt/Fyeaa6?=
 =?iso-8859-1?Q?EHobw/E6MUtv5hmnOxYtcVQrVncn6cpzYk6YmA5V0OUXH8U3wCVo9nmCqh?=
 =?iso-8859-1?Q?pVvDXFB0mzziCxf1iYL4oBp3XXAEYsnFmI0l6TsAigA/vKplUvE1oUAMfW?=
 =?iso-8859-1?Q?2OGc7rumFnV4bnIgMH+k9BrRckWYMgv6aBD1CrW+hP71EcbvXnK4/wqmcJ?=
 =?iso-8859-1?Q?y5mG+7yDenCBhW2gh/x2crySTh6hc0DyPg6kzydTXesYTx2f7HQ5b5H9HN?=
 =?iso-8859-1?Q?dwt/TNdiXF2vGWEj7C/juhETNw+6BkIIUZTRdibUl2u6ar0xpOnxPzZ3Qb?=
 =?iso-8859-1?Q?3U/dBE2isT+hAtuTD9reLygsHok0xhGxlDPpOIb289LttIUkoZ0ri/TIjY?=
 =?iso-8859-1?Q?jSTKbCySKRVCtEG0mLUjoDQP/srkXDZPOKDeblRa/6wJv8F6bw7wVbz78u?=
 =?iso-8859-1?Q?XT7Xv9StwUMWV3FTYmdUMlEXVzRY4yOc4X9gm4WwwLv3KYel+JZ3EZwq04?=
 =?iso-8859-1?Q?Zb4q/e/ROXr1Kk+W57gqtr4tz3xcmbjv9N6ByDDNMGZpna73V0seqhAs3w?=
 =?iso-8859-1?Q?3KPFjx4/U0FCtzxx+WOMZFXLBs44vwvwuZuif8LdBW6Sfi07SMQ/DrH2Bj?=
 =?iso-8859-1?Q?uf+DMxy4DagarP0a7DMXiqh3kBEbDvIL/vRj3xv1iUSw83YQXJECd2lZ79?=
 =?iso-8859-1?Q?pfJpty8jOcb7xVEYwVa0F3WYiKXWKGgj5P850Y7WsglZXGczzP6AxrOpTz?=
 =?iso-8859-1?Q?F4TZVCViNzsiZcKFVuvkrV+gq0VoOziGgh32gnrOP0I/Rawaw9yfo9wuOm?=
 =?iso-8859-1?Q?UAU7+gIRr1fz8Fa9sLr05DMrlUL8D75vdisDEpYeiy/Tid715LJpCyHrWC?=
 =?iso-8859-1?Q?JUi0Jrb6Bd4r5cvYXeuezaflEMYxEfbvvGwv1DhSfdoVsZNLUmybYZ7RM4?=
 =?iso-8859-1?Q?y7XvS+klL6Bs/nzb4RBX8iltijAvkjoc120loGnVFG2BWADYUq3TI3+S5q?=
 =?iso-8859-1?Q?hP8CGysprr/OOEwUYi5vHvOIPQhF6MPuHjonVJQfOh5DNCJ9LnNn1HZ5mf?=
 =?iso-8859-1?Q?FP?=
x-ms-exchange-antispam-messagedata-1: 6xLpgWq6Tfc+NQ==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb991f8-2dfb-493d-992f-08df0831f7a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 14:04:41.0532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: enAUB1Abq1XkNw+YbEBMAHYkMLYQKi+0QEBSlxEtuoCCcKh2brNtt3/kd5q6BkbId8ztw9OVn2hJ0CobEtpr9D3P1xPQRFajLADokm4JD00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6880
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 14:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244829

Hi,
I took a quick look at the generated changelog and I have identified the pr=
oblem.

Problem:
AUH Updates from 1.5.1 to 1.6.0 but there is no 1.5.1 information in the 1.=
6.0 changelog.rst, but it is in the old version.

1.6.0 CHANGELOG.rst
grep "(2026"  CHANGELOG.rst
 1.6.0 (2026-08-27)
 1.5.0 (2026-04-30)
 1.4.4 (2026-04-22)
 1.4.3 (2026-04-10)
 1.4.2 (2026-03-25)
 1.4.1 (2026-03-24)
 1.4.0 (2026-01-08)

1.5.1 CHANGELOG.rst
git show main:CHANGELOG.rst | grep "(2026"
 1.5.1 (2026-07-09)
 1.5.0 (2026-04-30)
 1.4.4 (2026-04-22)
 1.4.3 (2026-04-10)
 1.4.2 (2026-03-25)
 1.4.1 (2026-03-24)
 1.4.0 (2026-01-08)

Then the changelog diff generated is broken since it mixes content from 1.5=
.1 and 1.6.0.

I'll look into adding a guard for it. The quick workaround is to just manua=
lly the relevant section of new CHANGELOG.rst into the commit message

Best regards,
Daniel


________________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Auto Upgrade Helper via lists.openembedded.org =
<auh=3Dyoctoproject.org@lists.openembedded.org>
Sent: Friday, August 28, 2026 7:57 AM
To: Ross Burton
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core] [AUH] python3-build: upgrading to 1.6.0 SUCCEEDED

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-build* to *1.6=
.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.5.1-1.6.0.patch
    - check the changes to upstream patches and summarize them in the commi=
t message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this tim=
e,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update f=
ailures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bu=
g.cgi?product=3DAutomated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 7b21d98057ce518b5e3cf7f2f7cff239e7c95da7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 28 Aug 2026 05:36:35 +0000
Subject: [PATCH] python3-build: upgrade 1.5.1 -> 1.6.0

Source: CHANGELOG.rst

1.6.0 (2026-08-27)
- Pass ``--dependency-constraints-txt`` files through to the installer unmo=
dified instead of re-parsing them into a
  deduplicated set of lines, fixing a case where a hashed requirement (e.g.=
 from ``pip-compile --generate-hashes``) could
  have its ``--hash`` continuation line separated from its requirement line=
 and silently dropped, depending on the
  interpreter's hash seed - by :user:`manfred-kaiser` (:issue:`1140`)
**********
 Removals
**********

- Remove ``exc_info`` parameter and attribute from ``BuildBackendException`=
`. - by :user:`layday` (:issue:`1161`)

**************
 Deprecations
**************
- :issue:`1058`, :issue:`1060`, :issue:`1062`, :issue:`1093`, :issue:`1099`=
, :issue:`1107`, :issue:`1113`, :issue:`1117`, :issue:`1122`, :issue:`1124`=
, :issue:`1128`, :issue:`1132`
---
 .../python3-build/check-valid-dist.patch       | 18 ++++++++++++------
 ...3-build_1.5.1.bb =3D> python3-build_1.6.0.bb} |  2 +-
 2 files changed, 13 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-build_1.5.1.bb =3D> python3-b=
uild_1.6.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-build/check-valid-dist.pa=
tch b/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
index dd6f256e26..82c31a49a4 100644
--- a/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
+++ b/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
@@ -1,4 +1,7 @@
-Ignore invalid distributions when checking dependencies
+From a2a217409e01e3ebea88dce85d81dbe6b3c79187 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 12 Aug 2026 12:35:29 +0100
+Subject: [PATCH] Ignore invalid distributions when checking dependencies

 If there's an empty directory foo-1.2.dist-info/ on the search path then
 importlib will return that as a distribution called "foo".
@@ -12,12 +15,15 @@ the dist-info directory is empties but remains in the s=
ysroot.

 Upstream-Status: Submitted [https://github.com/pypa/build/pull/1145]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/build/_util.py | 5 +++++
+ 1 file changed, 5 insertions(+)

-diff --git i/src/build/_util.py w/src/build/_util.py
-index c365003..ba047c7 100644
---- i/src/build/_util.py
-+++ w/src/build/_util.py
-@@ -67,6 +67,11 @@ def _check_dependency(
+diff --git a/src/build/_util.py b/src/build/_util.py
+index cce8f94..54bc02c 100644
+--- a/src/build/_util.py
++++ b/src/build/_util.py
+@@ -63,6 +63,11 @@ def _check_dependency(
          yield (*ancestral_req_strings, normalised_req_string)
          return

diff --git a/meta/recipes-devtools/python/python3-build_1.5.1.bb b/meta/rec=
ipes-devtools/python/python3-build_1.6.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-build_1.5.1.bb
rename to meta/recipes-devtools/python/python3-build_1.6.0.bb
index d572ca846f..acec9cd9ef 100644
--- a/meta/recipes-devtools/python/python3-build_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-build_1.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D310439af287b0fb4=
780b2ad6907c256c"

 SRC_URI +=3D "file://check-valid-dist.patch"

-SRC_URI[sha256sum] =3D "94e17f1db803ab22f46049376c44c8437c52090f0dfdf1adc4=
3df56542d644fb"
+SRC_URI[sha256sum] =3D "bd2c8afc603e7a2e0ce70e2ea85f0a6d02043bafbd307f5bad=
a0f98669eca5af"

 inherit pypi python_flit_core

--
2.47.1


