Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB15C44515
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 16:01:44 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.422.1784304100414666538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 09:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=gnXL391y;
 spf=pass (domain: est.tech, ip: 52.101.66.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WK3U6xyAySQEgMMAB+cGneOQqNbpTwIlZr5vnVh+GEkmW7rXlu+KLfsCGQzcx0fUrGZG/X/zu34AmHmlBr1cPppDUQprNPzSGKmQPVa8pCdhshONomUsvERKBptQqNH4OG9iUBxfcAC4m1eqd8xBeRG/H6atTcsyQ+du8mXHViTJDX3I8Vsp97wIY1PqHiM1dsJk7rt/nEa2mYRyL7CYSICUFAdzEWQqrQQPCjIy6hY/ZD3aSSmX3gN39ltn8gBxC+Fi1YVkbnjSasgEhc/GDyebx7yjkSf39Z8yk1h8zJnIaGKf8ckInVwhVFDrLU7iDdsZdTO8oiK9xTPtajhHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lC1XigxzTrFvOlfWnPMdlioeTDsmdwtfG8EFLfTSs1E=;
 b=PqQuvL3LJsx7sesAD/B6617lGLU6FCl3B+28KS4HQ2FhgoYOGSXcjBnV3PHroauMm1HinDElFjeC4Dmhko+xGQfpx8uaijz3IKHRfpAMj+CSPqRme9RIIgSX7DRvCYtKSPAKnBpcwWMrcZ4fAqBaVSHOcZwkl/tF/xYwqR43tp9bzJ92VfVnMg1e0a5knLBqMPPkX7AKFiTBig3g0SajpSIzqmEvOD/Cl7/OkLSL5e1StAIHgsaVJ8D6TbzsDo4n5J9cBq4zETKkxePC+3hELZR3tXo8mKVCHL1UWVXZFX925RhtKCTc188PTNprkhRXgEF+ndX987wq5soa2MAlWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lC1XigxzTrFvOlfWnPMdlioeTDsmdwtfG8EFLfTSs1E=;
 b=gnXL391yDlrYMr/vrfFr4fQDVv8uhIY+2uvIdEyRXnsJXW1f39z231M8f7z2LlUw1WhqHoW3i8rU/5p6NLlFpQFsVLJ7Nsng49V0/UJ5ArDk9i9/9hQ1leKYPgP62/ghBP3JaLNbobsO7ow6Ph+AtosCuHe8ww8T9tpW5YtQNa/3LfYYGr3KcX34k6+YBDl/evpGGg24Z9Rj4VO6hcCNW5pX8wfiMLXiAhg/NBKgNwQyJTdW1IpJeAAsI2aE0Zfj8f9fp5qoxukP7pmvKzo25CzMiK6GD5A5E4lLIQKibeqtceJ8YndizDSo3RVocqWhdkXr4hV4cEWCc4jRplsCqw==
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DBBP189MB1212.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.6; Fri, 17 Jul
 2026 16:01:36 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.003; Fri, 17 Jul 2026
 16:01:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [scarthgap][PATCH] glibc: stable 2.39 branch updates
Thread-Topic: [scarthgap][PATCH] glibc: stable 2.39 branch updates
Thread-Index: AQHdDtF8A43Bdt/8KkOh9rh6x5AAArZx7Siz
Date: Fri, 17 Jul 2026 16:01:36 +0000
Message-ID: 
 <DU7PPF66507B2D7CF934D9C435C88A84E13F3C62@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260708120108.73199-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260708120108.73199-1-jaipaul.cheernam@est.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PPF66507B2D7:EE_|DBBP189MB1212:EE_
x-ms-office365-filtering-correlation-id: 4072d73e-d5a2-47c7-ec95-08dee41cae2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|18002099003|22082099003|38070700021|3023799007|8096899003|11063799006|10067099003|56012099006;
x-microsoft-antispam-message-info: 
 2/xHqibZhQBZ0mCUIMgCdz4GtYQ4/bvP+SmdhYHU3Lx//2a0QQZ2KKVieI5rrt/7Eu4ojZEYE6zrsvmCTJEko3bY69i5iWh6Y2yHJO+sDAEET1qEXjCX3iEsWVa4Rmk52PFcynNu/i5JnIwuW7wjtKwXx8XMDK9cbowbGUp3kuPy0L+HmxUnpnJ9lxEUppBGVAgQ1rfzFNCy0wkQFMIs2cFQRLSJnzRcJnYeN3Y2IayS6bFy7LVNIxW0ldzE16XHgQArF+YrW56xba8qbf81n9vtqpuPJJo4OMJtH/T46qU4dnuHHTTZedGudMy4QncIZygblN9po/O10tcddvKl9+FZU2LnklcbcHSermxlGnV1lmEbwQrJZkcIhO5LXdwgeWqtRX9j6udTfxSXDpXZgxoOWeW9udAljadN5WEgtJyEZCKzKmbFDad3ZC4jJBkBV3WoOejWkCUTM/9GQjtZFqFvZAm6fTnHRPMt0aTVmvfUHmOD626NctSwZVFOZ8AR8iSQxVK6wFOZ3CEGgcP6jGwxvSzsLK0d0QzLAiwuuDIj0IXt3UQuDJR7OEDKKzyNmVjshA+a2DVC84l2z1/yFfRuPAoJkQBL2izyAOoQMSiVc5blOTNi01UggH9Y2008b0fLA2ZypoK7gyY11RtIoTIIHr+oc+s0T7rT0ywnmAOQVy/H+/WN3BN4aH9V+jsP7rPVSXlElgxlipbz9UaXEA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(18002099003)(22082099003)(38070700021)(3023799007)(8096899003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?9kbuXmu+Z+qvNkE0HadQ2/rVJK/aZTWH07RxcHnIwdl8/s5Vtok0HJqgzO?=
 =?iso-8859-1?Q?ARciAut9FENcCQMGt/ZNiC5DhGd9n2RSyzYBeJMPogWhQozz7bpjzk/Hvl?=
 =?iso-8859-1?Q?bH+fjPWBZAhJ4BMwCgz+3XrbH/JVsdJEPxcPnwTKuyJF+mx+FfdTiN9Af6?=
 =?iso-8859-1?Q?sBLcy4+tro2IKB7sw3eXEDnP3II2ChfZHr3iGgjLZfAQi1i4amW+uGmxzt?=
 =?iso-8859-1?Q?TTI7OUFJZiVqpbQbcm1AzBAAljNzH6BImWuDB2RceMQUs7onlJlKb3/2yI?=
 =?iso-8859-1?Q?ywIEF9wW9pgknrL5yl4je/qgsshiUHONZ9vU5yECYyk0GZ9kcxUl23Pxjk?=
 =?iso-8859-1?Q?txKP35XZNv4/+Z+6+topwMqHBOtDAOUwrZbAoO3vhxYX8y9k7feewn4F7l?=
 =?iso-8859-1?Q?/KQeOfCYeySqzmjGoqoon+IRJ5l5ck+DpHVpTj9yxmfBOQf52FvxB2OljV?=
 =?iso-8859-1?Q?39aiBglGFrms+TjJh/CbDXFkHyGzgenx4URMV+j3vzI0bbwVkfLvwvlCDF?=
 =?iso-8859-1?Q?ceifMzNcfu8Kjfa516/KfmtaOwRjEQpfT/jf187aqQt56FqjmoPIKm/X53?=
 =?iso-8859-1?Q?a35vZbV716UQlYVzFs+EkbknGbQl7+4LXsG4QXQEiEY1sYRwbSuaU39k3y?=
 =?iso-8859-1?Q?ybN75+0/GoQ3TUSPhOq02Vdk+BaR4pWJ6HoMUwqc8OYL8f64xcrTWNmnrC?=
 =?iso-8859-1?Q?7d+oDFNylUz48CsrkjZ40LrrW6/TScTK376jqoIdVVwrjtnVlIB4bbTAyE?=
 =?iso-8859-1?Q?RPXPNdSzySmQsB51/l/0XEp3KURSPdHHID6M/A5GtkTUTNnVlIGdqZ4cTc?=
 =?iso-8859-1?Q?d20lit30O09ijc7urOc0ZA/nxIbQXHSw1epici/WE67vaJRMc2pQ1U2UF3?=
 =?iso-8859-1?Q?n5YNypUR8fOL7lAxV9nQbM9O8UhOQjLyJEdLcfysWRrA+nVqnoZhClWo4c?=
 =?iso-8859-1?Q?04kEDuz5h2ufSysH2XLdE9vSV8hHf//8MfzaOGw/rSEXX3hSbedHF5HZiQ?=
 =?iso-8859-1?Q?KytFHJxGZgWogRnja6RR58+SHPelhcm1UUT2nyhl14p5/s4pR33OzIFKso?=
 =?iso-8859-1?Q?sNNj9RhG3iVlanYLP/h7EYChPJDK4aJwZ5uNNNRKAybtD2IPCt9nV86mb8?=
 =?iso-8859-1?Q?r1GWXlsxeH4XwwMA86CLdk5039qsGR4we/Ckdkg9IWjKtaX8h6jcisZWZF?=
 =?iso-8859-1?Q?3qe9H/jq54HbvxOLb+wdvCjDQV6s29iI+8s0b58ps0iG5CX/AfgffK9JHF?=
 =?iso-8859-1?Q?Zvhpe+VEggXu7l0qkuWX3M2Wl+r+xvIrgkeVISDRLaZSIpJBCbkB5PIs1s?=
 =?iso-8859-1?Q?yougZIvCP+k2Cae1HhwMUdXs8kk4tmAtZ2ofCmnFLUHRDHdWiZx2EAcMxK?=
 =?iso-8859-1?Q?FAMacyfXBcgoR6+KY9y9Se49YO8VwqDbAjVVmytCXT/KdAkpMINkPqN8+K?=
 =?iso-8859-1?Q?8HgWS3hLS08mPT3YVLrSb4QX0qisKyEyey8IqiTFiLV+vD2Jl6hiC2s4Ex?=
 =?iso-8859-1?Q?mT0P9tYFQ+FpBK4V5JXL3zOUuVGvfU8H7XNn38DNaZMpsxwWdc4Su+PdPK?=
 =?iso-8859-1?Q?C+nQsh/R4uor21Tgbowil40/YAb7114hWPcq2QSmxrUyEQLXDQetPF6/u0?=
 =?iso-8859-1?Q?+IECZQ/9cGJ+IeI55PwVYdrBGZjzDxGkcSHzynK5/ezvdD5HgXN7+gkShK?=
 =?iso-8859-1?Q?ZvBG6+KrWv2OY5rwMYCEouLboNZEWK5J+p3Wh+mYGxZ+s4OgwQWuVCkqjA?=
 =?iso-8859-1?Q?gJ8hOfquAajTk6L+1Pc8LZOOiJNU2cBakmutmcASBgVEps6TygFsD0uWQS?=
 =?iso-8859-1?Q?PCYheAFT2EYRB+MRacGePSVyj8RPzyDBJwbLeH04Bc9O9Nf/lQxyZ7hosj?=
 =?iso-8859-1?Q?rg?=
x-ms-exchange-antispam-messagedata-1: 0o4kQX7RNq7/zw==
Content-Type: multipart/alternative;
	boundary="_000_DU7PPF66507B2D7CF934D9C435C88A84E13F3C62DU7PPF66507B2D7_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4072d73e-d5a2-47c7-ec95-08dee41cae2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 16:01:36.5396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QzNZQjD3QsDH8rnsfZNhAPr5bqZtjnmVQ5R+NbPHrfBkBonvSgRimvvoVoehj/DuLf5x+SSefqID5s6z4bkHFm3auuTSvTGRX7smaHPRB6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 16:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241215

--_000_DU7PPF66507B2D7CF934D9C435C88A84E13F3C62DU7PPF66507B2D7_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi Yoann,

May I know did you get a chance to review this patch and another patch for =
glibc from me ?

Regards,
Jaipaul

________________________________
From: Jaipaul Cheernam
Sent: Wednesday, July 8, 2026 2:01 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH] glibc: stable 2.39 branch updates

git log --oneline ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc..be1e627cd72db31=
161a3b4ce1c8114674f0895eb
be1e627cd7 Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefi=
ned (bug 33921)
98bc06a361 include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h
3e13579841 Use pending character state in IBM1390, IBM1399 character sets (=
CVE-2026-4046)
0dc95ae109 elf: parse /proc/self/maps as the last resort to find the gap fo=
r tst-link-map-contiguous-ldso
9344c796f7 resolv: Check hostname for validity (CVE-2026-4438)
5663ab0b83 resolv: Count records correctly (CVE-2026-4437)
c53cd6e738 posix: Run tst-wordexp-reuse-mem test
2760e4c5ed iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module
ba29a36aa3 posix: Fix invalid flags test for p{write,read}v2
60b039bf6a socket: Add new test for shutdown

Testing Results:
             Before    After    Diff
PASS         4892      4896     +4
XPASS        4         4         0
FAIL         371       372      +1
XFAIL        16        16        0
UNSUPPORTED  224       224       0

Changes in testcases:

testcase-name                                before  after
posix/tst-wordexp-reuse-mem(new)               -     PASS (native)

[Note: posix/tst-wordexp-reuse-mem is a new test added by this uplift
(c53cd6e738). It fails under QEMU user-mode because the test-wrapper
cannot support LD_PRELOAD and MALLOC_TRACE needed for mtrace. Running
natively with LD_PRELOAD=3Dlibc_malloc_debug.so confirms the test passes
with no memory leaks.

nptl/tst-getpid3 is a flaky test under QEMU user-mode (passes 7/10
re-runs). No nptl code was changed in this uplift.]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.39.bb     | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc
index 03a8e5d01e..5d57dafed0 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D "release/2.39/master"
 PV =3D "2.39+git"
-SRCREV_glibc ?=3D "ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc"
+SRCREV_glibc ?=3D "be1e627cd72db31161a3b4ce1c8114674f0895eb"
 SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"

 GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glib=
c/glibc_2.39.bb
index 7958d64eed..f6be1b5fc9 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -18,7 +18,8 @@ easier access for another. 'ASLR bypass itself is not a v=
ulnerability.'"

 CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2024-2961 CVE-2024-33599 CVE-2024-336=
00 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395 \
-    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-15281 CVE-2026-0861=
 CVE-2026-0915"
+    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-15281 CVE-2026-0861=
 CVE-2026-0915 \
+    CVE-2026-4046 CVE-2026-4437 CVE-2026-4438"
 CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix availabl=
e in used git hash"

 DEPENDS +=3D "gperf-native bison-native"
--
2.34.1


--_000_DU7PPF66507B2D7CF934D9C435C88A84E13F3C62DU7PPF66507B2D7_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
</div>
<br>
<div>Hi Yoann,&nbsp;</div>
<div><br>
</div>
<div>May I know did you get a chance to review this patch and another patch=
 for glibc from me ?&nbsp;</div>
<div><br>
</div>
<div id=3D"editor-signature">
<div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
Regards,</div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
Jaipaul</div>
</div>
</div>
<div></div>
<br>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jaipaul Cheernam<br>
<b>Sent:</b> Wednesday, July 8, 2026 2:01 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
<b>Subject:</b> [scarthgap][PATCH] glibc: stable 2.39 branch updates</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">git log --oneline ce65d944e38a20cb70af2a48a4b8aa5d=
8fabe1cc..be1e627cd72db31161a3b4ce1c8114674f0895eb<br>
be1e627cd7 Linux: Only define OPEN_TREE_* macros in &lt;sys/mount.h&gt; if =
undefined (bug 33921)<br>
98bc06a361 include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h<br=
>
3e13579841 Use pending character state in IBM1390, IBM1399 character sets (=
CVE-2026-4046)<br>
0dc95ae109 elf: parse /proc/self/maps as the last resort to find the gap fo=
r tst-link-map-contiguous-ldso<br>
9344c796f7 resolv: Check hostname for validity (CVE-2026-4438)<br>
5663ab0b83 resolv: Count records correctly (CVE-2026-4437)<br>
c53cd6e738 posix: Run tst-wordexp-reuse-mem test<br>
2760e4c5ed iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module<=
br>
ba29a36aa3 posix: Fix invalid flags test for p{write,read}v2<br>
60b039bf6a socket: Add new test for shutdown<br>
<br>
Testing Results:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Be=
fore&nbsp;&nbsp;&nbsp; After&nbsp;&nbsp;&nbsp; Diff<br>
PASS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4892&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 4896&nbsp;&nbsp;&nbsp;&nbsp; +4<br>
XPASS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<=
br>
FAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 371&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 372&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +1<br>
XFAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 16&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
UNSUPPORTED&nbsp; 224&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 224&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 0<br>
<br>
Changes in testcases:<br>
<br>
testcase-name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; before&nbsp; after<br>
posix/tst-wordexp-reuse-mem(new)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp; PASS (n=
ative)<br>
<br>
[Note: posix/tst-wordexp-reuse-mem is a new test added by this uplift<br>
(c53cd6e738). It fails under QEMU user-mode because the test-wrapper<br>
cannot support LD_PRELOAD and MALLOC_TRACE needed for mtrace. Running<br>
natively with LD_PRELOAD=3Dlibc_malloc_debug.so confirms the test passes<br=
>
with no memory leaks.<br>
<br>
nptl/tst-getpid3 is a flaky test under QEMU user-mode (passes 7/10<br>
re-runs). No nptl code was changed in this uplift.]<br>
<br>
Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
---<br>
&nbsp;meta/recipes-core/glibc/glibc-version.inc | 2 +-<br>
&nbsp;meta/recipes-core/glibc/glibc_2.39.bb&nbsp;&nbsp;&nbsp;&nbsp; | 3 ++-=
<br>
&nbsp;2 files changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc<br>
index 03a8e5d01e..5d57dafed0 100644<br>
--- a/meta/recipes-core/glibc/glibc-version.inc<br>
+++ b/meta/recipes-core/glibc/glibc-version.inc<br>
@@ -1,6 +1,6 @@<br>
&nbsp;SRCBRANCH ?=3D &quot;release/2.39/master&quot;<br>
&nbsp;PV =3D &quot;2.39+git&quot;<br>
-SRCREV_glibc ?=3D &quot;ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc&quot;<br>
+SRCREV_glibc ?=3D &quot;be1e627cd72db31161a3b4ce1c8114674f0895eb&quot;<br>
&nbsp;SRCREV_localedef ?=3D &quot;cba02c503d7c853a38ccfb83c57e343ca5ecd7e5&=
quot;<br>
&nbsp;<br>
&nbsp;GLIBC_GIT_URI ?=3D &quot;git://sourceware.org/git/glibc.git;protocol=
=3Dhttps&quot;<br>
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glib=
c/glibc_2.39.bb<br>
index 7958d64eed..f6be1b5fc9 100644<br>
--- a/meta/recipes-core/glibc/glibc_2.39.bb<br>
+++ b/meta/recipes-core/glibc/glibc_2.39.bb<br>
@@ -18,7 +18,8 @@ easier access for another. 'ASLR bypass itself is not a v=
ulnerability.'&quot;<br>
&nbsp;<br>
&nbsp;CVE_STATUS_GROUPS +=3D &quot;CVE_STATUS_STABLE_BACKPORTS&quot;<br>
&nbsp;CVE_STATUS_STABLE_BACKPORTS =3D &quot;CVE-2024-2961 CVE-2024-33599 CV=
E-2024-33600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395 \<br>
-&nbsp;&nbsp;&nbsp; CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-1528=
1 CVE-2026-0861 CVE-2026-0915&quot;<br>
+&nbsp;&nbsp;&nbsp; CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-1528=
1 CVE-2026-0861 CVE-2026-0915 \<br>
+&nbsp;&nbsp;&nbsp; CVE-2026-4046 CVE-2026-4437 CVE-2026-4438&quot;<br>
&nbsp;CVE_STATUS_STABLE_BACKPORTS[status] =3D &quot;cpe-stable-backport: fi=
x available in used git hash&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS +=3D &quot;gperf-native bison-native&quot;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DU7PPF66507B2D7CF934D9C435C88A84E13F3C62DU7PPF66507B2D7_--

