Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78562C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 10:19:07 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.85])
 by mx.groups.io with SMTP id smtpd.web11.10318.1638958745029393425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 02:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=OIYpFEva;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.85,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxdXKbuj0kzQsngTzq4tMMYja9UG+7IW2yHOQtrOawGkmayLCf/Sw2tBvgjtHBp6JBKKlRE4+13Hr0BbEULx0PRxSxOr8mTuB1fu7y3eiOsAdL6Exm5tmC3cFfPwnTuA+Exi5UZx8BTsiiXxbuFU/XjJ5hTwxuarbSSZeSLMWMm31ZS8HZUcHxRmCL25CLOqtb3q/mPMYvJ8DLKC8tVBnax3DFHaExikeP09XbjP3aHk52fZMMr2yWqidGnEcAJc/BimS+u+3xzzvyj8L/I7qbDgD0FS1jnyzOThS46SkB481huHYdSRYmuJMIAfXf4YOGMaw7QhP7ST08rC+swnow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/Ro6/LU+zRKn4RO4ESjxjtTjLiaDj4ZbsZduOMI1XM=;
 b=CfXyZB0i5GMg1/fApxMJkUV/v+a582thanmInItQOQHdHcMykAh9oY7rY05Nn7vOHst3fZwWlmkUI3eLKQdnTEyGDoNXUzlyQs6M2Ofu+uoifrAfmv4I8wTB7OYgkPMzB6xEp4psuWX843jpkCMrD7dNwTjqBAkAhs+zVystUWP/57aBLQUhfIBCCRkXufKSqmxgGlJH9BzyEBYHSjrOrYvGzIV6D/adgMGX8H+rzrOec/Vl7EOF308Qqc0Qo/uOuEl2KnLWVhcy6KQtGzPUhxY8RVYlNqQt2Jx81AJm4LzfXROU+WVULZEQFX5UvjhFIeznmb3MHaLI1stclgjagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/Ro6/LU+zRKn4RO4ESjxjtTjLiaDj4ZbsZduOMI1XM=;
 b=OIYpFEvaCtW2CAuqK8TA5T7dW+sfmg84vFItIRaVlkecLcI0QBOls+n9kZSse9Tm2soYn34ff7zmF9J/ze5gVUmmMi7UbNoEmSnMWZ4AHGxkjDtRtF1RbHurSZKTkgcTRU4dpdm0MpdJwEYiJDGs0UfOoVV6nCuGH/ProoB+T4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6910.eurprd08.prod.outlook.com (2603:10a6:102:132::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 8 Dec
 2021 10:19:02 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.024; Wed, 8 Dec 2021
 10:19:02 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 4/5] selftest/recipetool: Add tests for branch parameter
 and srcbranch option
Date: Wed,  8 Dec 2021 11:18:38 +0100
Message-ID: 
 <20211208101839.16224-4-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211208101839.16224-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211208101839.16224-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0002.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.94) by
 AS9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:20b:462::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 10:19:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cf41633-b352-47c6-dc7b-08d9ba3427d0
X-MS-TrafficTypeDiagnostic: PAXPR08MB6910:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6910885074FD432E56432AEFD76F9@PAXPR08MB6910.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vr9B5tjqj9VHoo0APK5Y5+L6PxujJlBLMgtlprLAVfJfbhb3e/iOZuZ+9BHrGkQhmAkMUSIGiflv6M0sCto+UssdbdGjbGDHNOpKQpNVlIjs30h4UOXXJi2GOLew5FqefFYC+meW6r24JEbvjRc8na33g//XyyR1TP+AG0rAzufQtEbIhUYj27PCkIWlAnhcjOXCFGvOxE9XPZiZCyACgjcwnq4l0ehZtGV1vOGldNgKGGVk1TEemLTjQxUPshqXRaQxlFoW5ICbFthcfYPh/cME+3wK4FC4L/sPN/cVRuSoiXPSYo2iRR/7d51s+xkcwDDyt24PaXf/ZuZJJ4YXUuecBRIasU0ALlRk9sYBB8spc/kcO8dFmY/it4r2sChddFQs1PM2AnSOC/2BTtxHHCtZ+okC8+f8BP86lDErlN74zUQH2vhBY15TvLBwTgtBC14mgvr3LpUE8/xpoM2j6mrX5ovYs743IV/u/emkHDZ+JCXujosL3SoNifm7FxSwbpPpcxzZRxTNoOIn228cTDRyETFtkvo9ZJ8mSrcU3KGY1vwb/MCPjCNYoz/UWo6tUt0YhKGddagYW5YXCU93HDvy9nzO4FJNTvnT3WAZbJiuuRDa2ZWqSk9L5azdDJ+OFnETkWTEcIY/tuh/rouf6J/nRfhwqd+/yZAt1idq6jcjZ2SVDyp07JVn6KsVeK6XxmBrLmeuzmcE+iyIg1PjdtB5kj1T6lx3cEvNdBDRbSXHwYWZR9tn9IshXMo8CZ48+X9g9lPZJyd45iwBrkT5G0fjNTgSU3HrYspgFHJ5seU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(66946007)(186003)(316002)(6666004)(8936002)(38100700002)(508600001)(2906002)(8676002)(6916009)(4326008)(107886003)(26005)(36756003)(38350700002)(2616005)(66556008)(956004)(7696005)(66476007)(86362001)(1076003)(52116002)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?soHEnwJZl1tim7hFYGpYSCeEVznYYKerl2YaOvfaZGbicrH1og0hwNd8MH9A?=
 =?us-ascii?Q?JvgUeSyIDDo86fxk5FbN+fUNkl1rMwvjHpLmw/jodzFG73AnoMn3JG+j1fCS?=
 =?us-ascii?Q?lR8Xi5fVPhhUySo6JNBp+GMlEeZWISk1J4RhaVrcBOBBPe/fjeamgWaKDQQI?=
 =?us-ascii?Q?xPpIJultUGE+feq/6NEINyncfkz6YiU+LeYjNpaY4FjV7vGahjqdJk9F42zV?=
 =?us-ascii?Q?yws3A99LE7IFqTNtu32xDDxA5eksb8prZR0LkuX1vDN517HkEs6wm8sPKdSP?=
 =?us-ascii?Q?l2VTnf5mv0p5Wkrrxi8JfHOTAFvDQoj10v/zR8r4sSX7h7kDfb8LaJ6EVe+f?=
 =?us-ascii?Q?jtHudYlcTKuo3POQ0lswyywq4nPG0Jx0C1j9OiD/K+dtr5myf1o810NunLjx?=
 =?us-ascii?Q?9YbuKEgK7xGMUvkXIY3zP4I9xjhqEvI+jQqjtM3blqh19MQTvY7D8wtgBJMn?=
 =?us-ascii?Q?KR20f4z9R75bLW4DOeTYTvxGMJGRO2NFd3E59I6o5gLSEKw/KQ5ixxyo9WZY?=
 =?us-ascii?Q?Riuz4RO7tpApQo4kTYgM3iJS2ZZcRMh9kcRZ/v1+PlsH025l6nnfgFJPs1P2?=
 =?us-ascii?Q?c1kn3E3w2DqK5kCPBz0D0g/K7n0AyhxOgo0ekDaHzWrhqrXr4aSb/T+yi3d8?=
 =?us-ascii?Q?I3k4CwTZjrQvtUw5YHD4fx/uLHp62tzYI5lShZNeMNpd8Tz7YUenKO+Egm46?=
 =?us-ascii?Q?yAWkRTn5rgCtASTYR9l4EZctRozvbvbJFKb2pIZxUzURcxwFH6tV63hyD1vi?=
 =?us-ascii?Q?Z2GRQkx/G6IKo/Yw9ft8FySMXw4LQm6js/jSu1HFAPBWBBTzoQ/1lUo8x+SP?=
 =?us-ascii?Q?6/edipy+Aq6Q1bxtrIrqTnAUdpUVyh0xsT3GCsz3U9FODRzwaVDrvJnL70Hc?=
 =?us-ascii?Q?dIZnkAAIocoljIsIm06hn+0oXoZjnkH6gBeGMIk+SBKyC1feJz3TRoepzmoM?=
 =?us-ascii?Q?ZrCoJO9bo14Ab/N8hWtVM6GXELIcdurbpPWCW1VfscJOgNKFiHCM33+AHmdo?=
 =?us-ascii?Q?vGCjgG0Hft8dwSSmmN+zb9b1h5wfnGQnon4GHTpC8A+JR6B1MYzA5pLv5rt/?=
 =?us-ascii?Q?VIXShk0gkkqYlkO50zaIiuqXlZCH7X4S0uI5aDunWC49HxnTjjKm6X5hXoj8?=
 =?us-ascii?Q?654bCN1UjW5iLw2Yx4fN28mUIizdSvfbNQxfkSocqTgX66Kbs8USgydg8jC3?=
 =?us-ascii?Q?3jUEgckPqATZ41gWTjKQ+sGFEI5RLhCfUeVBaCHN3VEFabOGjGkpar8LMng8?=
 =?us-ascii?Q?QsHIoAmgncqWyPd/bS4H8zkvOK93dg/f1tNl+jMYSCCmIKNO+FQeddbOQDzW?=
 =?us-ascii?Q?JlawZwb+dT/qltOSRVLjSF0vP28ORgZv5kW1bSwYCJ2hFDLBcYEzxXBACNoT?=
 =?us-ascii?Q?WL18QbwV5YYv4L3I5Ps5WGlp04qfzmfJelJq046ctPVLRDpEHYm36rLtGM3Z?=
 =?us-ascii?Q?rVDCrBqmoWcZVW8wTQI55dW8GpvxahZ8+v8vswbVpRlj3hA3shlRdFIYvNez?=
 =?us-ascii?Q?KF7NJNOtgKClchQZ7pVOsuxI10NWB4MNz86SAwt91UZ+fKn4Bj1oph9/VfLO?=
 =?us-ascii?Q?Omie2tOIlh4E8pVPkrhcml+nsofjNqgQSPx9mEzoWI2U6ujvWoo5P/BLy6tz?=
 =?us-ascii?Q?3v0YkupwYoN3SyjyVYhp3EQ=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2cf41633-b352-47c6-dc7b-08d9ba3427d0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 10:19:02.0064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BsRoz6h2reOljzGQqq73pzC6CusAeo5n/Yu4SFtZVk/QyAq7VIRs3zKoAfSaZETcMdAl/OlpvA+n9jhkGYJKtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6910
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 10:19:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159354

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

(no changes since v1)

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


