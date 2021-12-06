Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F925C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 08:04:44 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.70])
 by mx.groups.io with SMTP id smtpd.web12.48792.1638777876910521006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 00:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=Q0cNI5LA;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.70,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFn7w5oCFgKg+/thXI6EHlkE447FKWkmSoC9yxchvCzlEYGkxH4FJhHzDH8nxUS06bayMU5jDFPKcePzWuRkKkWd43bwSirz4ue2oXvLhzquriAAkdQZX+pNPNBmPg79/aZpYAYRvlHtErHNu2uZp1Lubc9ikxsY3ENjkfBFmaJjysNVQKlxfK4TaM7oOrRKcF/L73QM6NdK0zparu2ysySY9L3XB1nn3QJWVfTZsqEBhM1x8YpNDGFdhM+IguvG8oNNtLFImJ4ghkLiOSN9dhPDlf0odDeQLwA4mfNIkCPbSFV8hw1IidipiR5XT3iiSRNk+T46ghFK4FfEH3Kxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KS25xGIO3LXpgVsJqxXQNPDQTSjMXKdY8NWUu4V0SU=;
 b=kbwZs99IKcFKTYzkIl6cq4VpalABoMpjsedaxmAsHmEUlCTwmI4Zh5hePGjLpevvh5/DNLqhNYXF83ZhotZVBYyFmQhyCUseT9kMJ3r64wyBAJF9kOtcGaJ8F2slpXD3j0RmSpzmVyf5KHl6NmuDffdk7o1LdqTfYyQ8v0yu0OH09PaXvxj++50tfS7jgnwTJ1i49Xl6esDeVnpRm92fM14qHHD1HUXROZBVbNCsBv3srY6ouQnSsFlA32I/xY2C+YgtnwvV+zzqqAb21mh/PD/Fs14MQfZ/SGmS3qgE6WCijHcGDTb8Sj3yeChInXJ6a/rKJqqU8wgyO3vF/GJvCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KS25xGIO3LXpgVsJqxXQNPDQTSjMXKdY8NWUu4V0SU=;
 b=Q0cNI5LA0Zsv45SNXM6cCpER4PFE9C8l3sVpuS+gB0F/nqyVwfij9uhCYFaDHiHaDCM/u/hohE21/sq9B9GCjQMLMeSOFfhov2r15mN2sdGvo+0gnej27B2DQcs1D/K3MfP7Bc/cZ5fS7X6VIB4HySaur16tLJOMdr87CDVnOis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4729.eurprd08.prod.outlook.com (2603:10a6:101:17::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 08:04:35 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.024; Mon, 6 Dec 2021
 08:04:35 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 3/4] selftest/recipetool: Add tests for branch parameter and
 srcbranch option
Date: Mon,  6 Dec 2021 09:04:04 +0100
Message-ID: <20211206080406.3249-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS8PR07CA0040.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::11) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.244) by
 AS8PR07CA0040.eurprd07.prod.outlook.com (2603:10a6:20b:459::11) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 08:04:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 593ed628-f869-4d73-5f7c-08d9b88f0ace
X-MS-TrafficTypeDiagnostic: PR2PR08MB4729:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4729B8A63BFD549FD141C573D76D9@PR2PR08MB4729.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ol+JB3DFma417fsz5ITsJC3BiAIr0KKJZ+unkABZp1BngqGULo6c6O1stM0gtXfgpepAsmBueanTu1aX5JpYVawCnYZsP22phOas3X/6shzuJz93EtxW7s11dRL9TxpQ44RJgdRdiiLN45mPcz9Ut3zZbVKD/HfPEBDxWOLNoIGn0ICX6wqKmoEQl+38WVtg7mL5lRZo/UQoZlvJ+yFVjXQ4tVgjAeMt8/cBo4szcc4U1I4iJ5XEiJ6CXaj5VPjG+8rbtb0uvgouBM4FxoyOiZXYsKXpFO3YE0UjoB+6Yi6s5mx58njwiEstO4LPPklJ4U9KT3rSBaUvyf6evjzBCFsiCX/kyCHMmMOXkmH2ZhNUNBuQgxIF8Nk3sjDGjKEP4YMlH18zjyzCpmZzySIk8Nzo4ALimRzX3klIY0Vt+BZMDnEmSzfqjXFDgumIFZMx+S/gfNz4XpFFzzN3eDPZXz/ea3awZ5C6tn2oxl3W+hOu6rmHh11S40isX+zccq92bIM/O6FfDBNxP9dzHKl5ifWqxORufhA87CcXJGEbCmOt9T64nOUVEbrCbatfnQSRzykPM50xA4O1Ogz8UueqYnsQYLkZ5kSE9vPK1QI5NpWGKh2iDYfZKZapNYuTMXWuSR7fVpuW2I4UNEBXaGZUJGZO+BhRvMqYg4lpotUwL91IUvuyaIUtqvVy268y3/Zc2S9xoGp1fxtepKC1ET95G2gHjqZWyMpotpuHh6zaUg+tonBegTtPGdRNPKLIAkACuVnIPY+aUZzG+xpndACOFhz7SzcIKSKjihWDCjm10d4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(5660300002)(83380400001)(508600001)(316002)(6916009)(956004)(4326008)(66556008)(2906002)(36756003)(186003)(38350700002)(7696005)(8936002)(86362001)(107886003)(26005)(8676002)(52116002)(2616005)(66946007)(66476007)(1076003)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?grnUHrZdj/iZ/v/uJI08ooW1Wlgx1dUL6UzuZQRKwSO/vBtiWE1zkjqUFFgq?=
 =?us-ascii?Q?ATE5jJXXszI3KIIAmfzo6euU6nIzP/7MqMTnnjJvFNJpR9P0xi5Um0KYMwTC?=
 =?us-ascii?Q?03atG/P5Sme3G2fr+4Seq6Op5Zjky0VSTMidfobKwLjbKDWVUHMY+0bcVrkZ?=
 =?us-ascii?Q?6/60nF0kbQM9zcfpi5t+ecKK5/soxLg5q7PaDa9MODrN5VNpvdKyJCU6V9VA?=
 =?us-ascii?Q?0+7mAlDxW0CkV4qzR60bQpASBFCyPmhuyXigBhdUaSABq2uzZBM71RX/r+1O?=
 =?us-ascii?Q?5DCbUNpyJ2qU5mCrZyzrfIdap8/JghKQXapbQgXkwsnrOUMI0C2u7GrFdb5p?=
 =?us-ascii?Q?ibIFjclABV3u9Rgh7xHwhP6oRlqtnd4ZD8aix/f+j4eNagivnRabjCSqLCeI?=
 =?us-ascii?Q?o/3eYe+wKZNXQir2PabUNpWdwlrfycYPnk9VeNspJ7FEsfgAUWCuBJyLpMjV?=
 =?us-ascii?Q?jDCjBBUYex56iMG6Fr4J6kcspeHOFukWt+SFVbzWlNmidURxS2eywDSpKfO1?=
 =?us-ascii?Q?VF5F6Cdqhxf+E7IVcIOOPJXjJ6rjreXuV/oup+siCWuCJ7rx+uEzyt9EOqOY?=
 =?us-ascii?Q?v9C+UPj1Ow6BDI2O+whoR2vbWlWNKZOp2tiHTEqMrYCKWK95oVr2WFUlXp0s?=
 =?us-ascii?Q?FXpXyxkjnHKyfsB4ARvpkpvz2j+VLmHu0MTALir09OyRqJ+dQuEF03+oGoQM?=
 =?us-ascii?Q?w98sRZBqg0X9DlWubCqjN9Tjp14NEhH1Ivvx9mgAwOb6tAnKTGGBJ1ZKyvR5?=
 =?us-ascii?Q?AEUiCnjr4H8EzrMo0Dh345RRnYP1AmMtvK59YDPOzGz2J4a20FOrVW4wNmV8?=
 =?us-ascii?Q?E2RfpnWHX1E0Y1LVr0fLk+AClL4r5z1KkQx8tCgZ6S8jbjOjlWHWknGcdQ36?=
 =?us-ascii?Q?A57L/vLE29hYxOEbXhQGJ9TkLyQ4MdhOBS0nEN4iYJQCgBvvDR4LHtxyNC1U?=
 =?us-ascii?Q?e1VCvXw4NShYv/1GT+mBJHXOLDVuNk94Nqcqn6euHgRPhoKv1kQi8Iu7kRRd?=
 =?us-ascii?Q?Uhm9yCKx0L4VvdDH0PMpP9JFP5kQKf1OCwgqyhi1ZxdpIsKCFQPkaXiyvd5W?=
 =?us-ascii?Q?XHMdXD/oMkv4GGFErsAvaxWrbyX2+H5PsIlRcC0a4UcALJ0ITQ/9O19MVxvS?=
 =?us-ascii?Q?yuDPi07r5CIfDamWeH/D/SQjkTlsH4koMvYBTc7QM5uhRV2ffcfpTCOgbvos?=
 =?us-ascii?Q?FsvhUBWGG693iEXzpLJ9VXI+dlRCLBsNJUI2XXCpmZBYs5tO93TqYmyO9/Lk?=
 =?us-ascii?Q?IAYpfh8hU8EpdqTDVxMfQxUMOQ0qz4/YaRIeAu0We6xx3BA+sVhjtOoV/4tN?=
 =?us-ascii?Q?G9HtdjBKkIQvxC879/EFrRnf7oSq7n+JFlekiWtI46zJYfgpLdqriBc/AYrs?=
 =?us-ascii?Q?o02bGNV8BuLN4fIlCkXx9Ydw4SHXtSmq+4s2bHUEjfxW6bBhWSXYWpqQyUvj?=
 =?us-ascii?Q?/UmhC3Ka803fwa5Vz2xNYiCqYGGV0xiUwHowkm84bZGxNGfs+Iy4grWRmx5V?=
 =?us-ascii?Q?+wDOk1u59Sx3VT2btXqG4TCtiBCvXQrhxfOFwPoUwt9Fs3n0wAIhlFN9rJNZ?=
 =?us-ascii?Q?3TeKHDhx4C+4t6mmP0OFfTDltyP/ixEfxxcw3XwY4ZI9fxD+mxvEyPmEtIog?=
 =?us-ascii?Q?+oMscKtULH3PST+6s+vW50g=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 593ed628-f869-4d73-5f7c-08d9b88f0ace
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 08:04:35.2688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NoHjXfEXIezRCclXiJgKTn2mr0gbsV93F3+BeLKOTSYsHicODsZkR++CRMogbJanU+X8a65UmdfgY+olTqFHXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4729
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 08:04:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159210

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The recipetool support two ways to pass a branch and fallback to master
if no branch is defined. Add tests for default branch, branch parameter
and srcbranch option.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---
This commit changes the test repository from matchbox-terminal to
matchbox-keyboard because matchbox-terminal has only one master branch.
Maybe the test should use a special test repository.

 meta/lib/oeqa/selftest/cases/recipetool.py | 38 +++++++++++++++-------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 1aedc02b99..b77a2712f5 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -350,7 +350,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['SRC_URI[sha256sum]'] =3D '2e6a401cac9024db2288297e3be1a=
8ab60e7401ba8e91225218aaf4a27e82a07'
         self._test_recipe_contents(recipefile, checkvars, [])
=20
-    def test_recipetool_create_git(self):
+    def test_recipetool_create_autotools(self):
         if 'x11' not in get_bb_var('DISTRO_FEATURES'):
             self.skipTest('Test requires x11 as distro feature')
         # Ensure we have the right data in shlibs/pkgdata
@@ -359,7 +359,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         tempsrc =3D os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
         recipefile =3D os.path.join(self.tempdir, 'libmatchbox.bb')
-        srcuri =3D 'git://git.yoctoproject.org/libmatchbox;branch=3Dmaster=
'
+        srcuri =3D 'git://git.yoctoproject.org/libmatchbox'
         result =3D runCmd(['recipetool', 'create', '-o', recipefile, srcur=
i + ";rev=3D9f7cf8895ae2d39c465c04cc78e918c157420269", '-x', tempsrc])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not cr=
eate recipe file; output:\n%s' % result.output)
         checkvars =3D {}
@@ -367,7 +367,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LIC_FILES_CHKSUM'] =3D 'file://COPYING;md5=3D7fbc338309=
ac38fefcd64b04bb903e34'
         checkvars['S'] =3D '${WORKDIR}/git'
         checkvars['PV'] =3D '1.11+git${SRCPV}'
-        checkvars['SRC_URI'] =3D srcuri
+        checkvars['SRC_URI'] =3D srcuri + ';branch=3Dmaster'
         checkvars['DEPENDS'] =3D set(['libcheck', 'libjpeg-turbo', 'libpng=
', 'libx11', 'libxext', 'pango'])
         inherits =3D ['autotools', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -506,19 +506,35 @@ class RecipetoolCreateTests(RecipetoolBase):
         inherits =3D ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
=20
-    def test_recipetool_create_git_http(self):
+    def _test_recipetool_create_git(self, srcuri, branch=3DNone):
         # Basic test to check http git URL mangling works
         temprecipe =3D os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        recipefile =3D os.path.join(temprecipe, 'matchbox-terminal_git.bb'=
)
-        srcuri =3D 'http://git.yoctoproject.org/git/matchbox-terminal'
-        result =3D runCmd('recipetool create -o %s %s' % (temprecipe, srcu=
ri))
+        name =3D srcuri.split(';')[0].split('/')[-1]
+        recipefile =3D os.path.join(temprecipe, name + '_git.bb')
+        options =3D ' -B %s' % branch if branch else ''
+        result =3D runCmd('recipetool create -o %s%s "%s"' % (temprecipe, =
options, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars =3D {}
-        checkvars['LICENSE'] =3D set(['GPLv2'])
-        checkvars['SRC_URI'] =3D 'git://git.yoctoproject.org/git/matchbox-=
terminal;protocol=3Dhttp;branch=3Dmaster'
-        inherits =3D ['pkgconfig', 'autotools']
-        self._test_recipe_contents(recipefile, checkvars, inherits)
+        checkvars['SRC_URI'] =3D srcuri
+        for scheme in ['http', 'https']:
+            if srcuri.startswith(scheme + ":"):
+                checkvars['SRC_URI'] =3D 'git%s;protocol=3D%s' % (srcuri[l=
en(scheme):], scheme)
+        if ';branch=3D' not in srcuri:
+            checkvars['SRC_URI'] +=3D ';branch=3D' + (branch or 'master')
+        self._test_recipe_contents(recipefile, checkvars, [])
+
+    def test_recipetool_create_git_http(self):
+        self._test_recipetool_create_git('http://git.yoctoproject.org/git/=
matchbox-keyboard')
+
+    def test_recipetool_create_git_srcuri_master(self):
+        self._test_recipetool_create_git('git://git.yoctoproject.org/match=
box-keyboard;branch=3Dmaster')
+
+    def test_recipetool_create_git_srcuri_branch(self):
+        self._test_recipetool_create_git('git://git.yoctoproject.org/match=
box-keyboard;branch=3Dmatchbox-keyboard-0-1')
+
+    def test_recipetool_create_git_srcbranch(self):
+        self._test_recipetool_create_git('git://git.yoctoproject.org/match=
box-keyboard', 'matchbox-keyboard-0-1')
=20
=20
 class RecipetoolTests(RecipetoolBase):
--=20
2.20.1


