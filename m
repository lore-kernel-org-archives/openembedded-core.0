Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C750C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:56:01 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.53])
 by mx.groups.io with SMTP id smtpd.web11.44682.1701896151314454707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=LiMRiDf3;
 spf=pass (domain: axis.com, ip: 40.107.7.53, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqtIzP43lxmwDsr3CLLbr7eQDIxrEZxH5mCKwJm8Nxin55YQxWVMkGeJ8BhFHDv6Wd5PK4tJUNnIY2BpO1JKgfN8aMolixGboNmmhoNu+yanJ4q4I6h9jHjYoF+k1htoZby+eH7Tciq9ufBOhq4BcwcE8ivMIWmXNQO8wcFNVLFmdML3ZeFb/QPsXTPZDJ2R03Eu3vnQ+Edu22pSoXujnEayh0hl6mRXLtFoiPQh2nc933ATYKW2OMCDDlr5EIpGdWpKTtxfQYjCaehGG/KVFJQLOleFQrUdjp9QvI0JMurPuCd6Waq5vfhytYTYUPglwg73hsTu6MB8m0Kc2R4VHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9m60t0xDPQ+7cpPF3wXV5FJaCl9mjmGI89+EDgHg5g=;
 b=L9ngCOfXVCQvP963SEfPKUcqhp82Rgq/2GLPdQF4kKxzc5Qeix6DiQ8cukAuUHcXD6Qb8rdes6UvL6+SRTSN2C2zv/JoDK1aW7iIYLNGxs6GSzZ24mm7O2FExO2/OMl+BqaL8T0ICOig2IELdw++PM1bpIbIOWRGhzl50q88daRXjj6lgGpbjliaMI5lcsYmG+liBa8phD+/Pjti7fFE+HQXLvGfGvP/GmGlZWKbeABtHI+Quqplt45kV3zjUkE1diZMoSheLZMuPTImrVMmvAGTjYTcgJMR57FdsMX9ER9tTc12kBcgjXAVe51gfjVBRIzzQ+0dfj7bww6yggZDCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9m60t0xDPQ+7cpPF3wXV5FJaCl9mjmGI89+EDgHg5g=;
 b=LiMRiDf3BVLwTlJYiZxyPAyAdFt6iVRBsxErC90554qLkAqfBpkegcDP5FEL7MEmw8Xadl+rf+MNL1dDb3bLGkjrMsCGb0onw71ixIWNPV6y49x9ceRyt3agxys3t6CD5Z5AbNwz5rYPjII+KbujXUS8gMiQy0mKNx1aUY5TiAg=
Received: from AM0PR02CA0115.eurprd02.prod.outlook.com (2603:10a6:20b:28c::12)
 by AS8PR02MB7317.eurprd02.prod.outlook.com (2603:10a6:20b:3f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 20:55:48 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::9c) by AM0PR02CA0115.outlook.office365.com
 (2603:10a6:20b:28c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:55:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 20:55:47 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:45 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:45 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 21:55:45 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id F1A9BF686
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 21:55:44 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6Ktidm4037617
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 21:55:44 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6Kti3c4037616
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 21:55:44 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 8/9] devtool: upgrade: Update all existing checksums for the SRC_URI
Date: Wed, 6 Dec 2023 21:55:30 +0100
Message-ID: <20231206205531.4037549-9-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206205531.4037549-1-pkj@axis.com>
References: <20231206205531.4037549-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000041:EE_|AS8PR02MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: f170262f-e83e-48aa-b910-08dbf69db92a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OwKWKWLKZoEWrkRcvwIQxZWKfaf/IUAhdRRAgFx4ecpUY+Vx9AuT+yxNX85qsZVj7XZZuudHq59pNojSOTB5Ozsb4EvkIRvvuH8InZ87DMEmCnHSqGrVqifPMwPvqVuzpjJ9WCd286lmHrY9kOhiEMmTFiyu7cn2tTmn9CcSkvODyHceiyxO2i0jPzTc+uLwmR1/YJDTzv7gyfDdWO503d9Oyd51E/scI68c/JILb3fI49iIK0SgWRdnQW/IfF/iCBZ234/zwN+hzLrZB/3Vj3nztbFCYeaHFjleniKx8ajyyecd7QdB+pJk8fUqTOiYoV1y9om2ddelSxdgoxN+F0v/wF76Y3X9ATV/bRWfq5SNmOlbfGlRg0rX+cyVEP5Olksphg22efAFNSKEXqv9z9BLeJf2k1YsTNeGPa6iUTLc8ZJEqUKI3cJX1CW5meNLA2CmMDtMMCmFKKgv+g87cJ5itsMctLKY4WLwE55wiI1rWQwBdzZAe882eC2l/HVivxCNFjqrWx2DJgKjEU3NYePuJY82Q1lKN0zs1jDZ4ytufQRyw0QOhae4yq5ZgPgLN48FBfdOHpnLm61vzEP4nPd8weZtkxZi46ZAmaj8iHN9yRobrnDNzSOicaAPONVmnkk7EDZ1c7fEN7IcLAFWc6XgAxSpxub7wo4NQ20xlG5XeD0SEkFD42Dg+rNqblO9BvOBodEj5Bde4VlqDLFtb4PUVrJ0VHSHwketv1lljqGjslisJStca+X+gQ+6nYv0ojv9kIytysZXiBulrcfboUiOIwYuEHwaTb30RGkOu2nc23VZM5JXjfwZTWivu7pfM3L1liJWjB7njixH9tcWfw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(8676002)(8936002)(5660300002)(36756003)(6666004)(2616005)(42186006)(6916009)(316002)(70586007)(478600001)(70206006)(41300700001)(2906002)(15650500001)(30864003)(40480700001)(82740400003)(81166007)(47076005)(40460700003)(36860700001)(26005)(19273905006)(1076003)(83380400001)(336012)(356005)(426003)(562404015)(36900700001)(473944003)(563064011);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 20:55:47.9471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f170262f-e83e-48aa-b910-08dbf69db92a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 20:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191932

In addition to updating the sha256sum and removing the md5sum, update
all other existing checksums. If the only existing checksum is md5sum,
then replace it with the default expected checksums (currently only
sha256sum).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

[PATCHv2] Updated the commit message to make it clear(er) that md5sum
is still being removed when updating recipes.

 .../devtool/devtool-upgrade-test3_1.5.3.bb    | 16 ++++++
 .../devtool-upgrade-test3_1.5.3.bb.upgraded   | 15 ++++++
 .../devtool/devtool-upgrade-test4_1.5.3.bb    | 22 ++++++++
 .../devtool-upgrade-test4_1.5.3.bb.upgraded   | 19 +++++++
 meta/lib/oeqa/selftest/cases/devtool.py       | 48 +++++++++++++++++
 scripts/lib/devtool/upgrade.py                | 51 ++++++++++---------
 6 files changed, 148 insertions(+), 23 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
3_1.5.3.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
3_1.5.3.bb.upgraded
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
4_1.5.3.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
4_1.5.3.bb.upgraded

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3=
.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
new file mode 100644
index 0000000000..69c0d351ec
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Pipe viewer test recipe for devtool upgrade test"
+LICENSE =3D "Artistic-2.0"
+LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D9c50db2589ee3ef10a9b7b2e50c=
e1d02"
+
+SRC_URI =3D "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
+UPSTREAM_CHECK_URI =3D "http://www.ivarch.com/programs/pv.shtml"
+RECIPE_NO_UPDATE_REASON =3D "This recipe is used to test devtool upgrade f=
eature"
+
+SRC_URI[md5sum] =3D "9365d86bd884222b4bf1039b5a9ed1bd"
+
+S =3D "${WORKDIR}/pv-${PV}"
+
+EXCLUDE_FROM_WORLD =3D "1"
+
+inherit autotools
+
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3=
.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5=
.3.bb.upgraded
new file mode 100644
index 0000000000..3ce7e85e10
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.upg=
raded
@@ -0,0 +1,15 @@
+SUMMARY =3D "Pipe viewer test recipe for devtool upgrade test"
+LICENSE =3D "Artistic-2.0"
+LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D9c50db2589ee3ef10a9b7b2e50c=
e1d02"
+
+SRC_URI[sha256sum] =3D "9dd45391806b0ed215abee4c5ac1597d018c386fe9c1f5afd2=
f6bc3b07fd82c3"
+SRC_URI =3D "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
+UPSTREAM_CHECK_URI =3D "http://www.ivarch.com/programs/pv.shtml"
+RECIPE_NO_UPDATE_REASON =3D "This recipe is used to test devtool upgrade f=
eature"
+
+S =3D "${WORKDIR}/pv-${PV}"
+
+EXCLUDE_FROM_WORLD =3D "1"
+
+inherit autotools
+
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3=
.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
new file mode 100644
index 0000000000..9abf80e6ed
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Pipe viewer test recipe for devtool upgrade test"
+LICENSE =3D "Artistic-2.0"
+LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D9c50db2589ee3ef10a9b7b2e50c=
e1d02"
+
+SRC_URI =3D "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
+UPSTREAM_CHECK_URI =3D "http://www.ivarch.com/programs/pv.shtml"
+RECIPE_NO_UPDATE_REASON =3D "This recipe is used to test devtool upgrade f=
eature"
+
+SRC_URI[md5sum] =3D "9365d86bd884222b4bf1039b5a9ed1bd"
+SRC_URI[sha1sum] =3D "63a0801350e812541c7f8e9ad74e0d6b629d0b39"
+SRC_URI[sha256sum] =3D "681bcca9784bf3cb2207e68236d1f68e2aa7b80f999b5750dc=
77dcd756e81fbc"
+SRC_URI[sha384sum] =3D "5fff6390465ff23dbf573fcf39dfad3aed2f92074a35e6c02a=
be58b7678858d90fa6572ff4cb56df8b3e217c739cdbe3"
+SRC_URI[sha512sum] =3D "32efe7071a363f547afc74e96774f711795edda1d2702823a3=
47d0f9953e859b7d8c45b3e63e18ffb9e0d5ed5910be652d7d727c8676e81b6cb3aed0b13ae=
c00"
+
+PR =3D "r5"
+
+S =3D "${WORKDIR}/pv-${PV}"
+
+EXCLUDE_FROM_WORLD =3D "1"
+
+inherit autotools
+
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3=
.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5=
.3.bb.upgraded
new file mode 100644
index 0000000000..cd2a0842f4
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.upg=
raded
@@ -0,0 +1,19 @@
+SUMMARY =3D "Pipe viewer test recipe for devtool upgrade test"
+LICENSE =3D "Artistic-2.0"
+LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D9c50db2589ee3ef10a9b7b2e50c=
e1d02"
+
+SRC_URI =3D "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
+UPSTREAM_CHECK_URI =3D "http://www.ivarch.com/programs/pv.shtml"
+RECIPE_NO_UPDATE_REASON =3D "This recipe is used to test devtool upgrade f=
eature"
+
+SRC_URI[sha1sum] =3D "395ce62f4f3e035b86c77038f04b96c5aa233595"
+SRC_URI[sha256sum] =3D "9dd45391806b0ed215abee4c5ac1597d018c386fe9c1f5afd2=
f6bc3b07fd82c3"
+SRC_URI[sha384sum] =3D "218c8d2d097aeba5310be759bc20573f18ffa0b11701eac6dd=
2e7e14ddf13c6e0e094ca7ca026eaa05ef92a056402e36"
+SRC_URI[sha512sum] =3D "1cf9d7376fceefcd594d0a8b591afc8e11ce89f7210d10ad74=
438974ecebe9cc5d9ec4db9cc79e0566bfd2b0278c0cc263c07547803e7536432cd1ffd32d8=
a45"
+
+S =3D "${WORKDIR}/pv-${PV}"
+
+EXCLUDE_FROM_WORLD =3D "1"
+
+inherit autotools
+
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index e01ab01869..4e65484d81 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1883,6 +1883,54 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertNotIn(recipe, result.output)
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', re=
cipe), 'Recipe directory should not exist after resetting')
=20
+    def test_devtool_upgrade_drop_md5sum(self):
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test =
cannot be run with a workspace directory under the build directory')
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */worksp=
ace')
+        # For the moment, we are using a real recipe.
+        recipe =3D 'devtool-upgrade-test3'
+        version =3D '1.6.0'
+        oldrecipefile =3D get_bb_var('FILE', recipe)
+        tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
+        self.track_for_cleanup(tempdir)
+        # Check upgrade. Code does not check if new PV is older or newer t=
hat current PV, so, it may be that
+        # we are downgrading instead of upgrading.
+        result =3D runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir=
, version))
+        # Check new recipe file is present
+        newrecipefile =3D os.path.join(self.workspacedir, 'recipes', recip=
e, '%s_%s.bb' % (recipe, version))
+        self.assertExists(newrecipefile, 'Recipe file should exist after u=
pgrade')
+        # Check recipe got changed as expected
+        with open(oldrecipefile + '.upgraded', 'r') as f:
+            desiredlines =3D f.readlines()
+        with open(newrecipefile, 'r') as f:
+            newlines =3D f.readlines()
+        self.assertEqual(desiredlines, newlines)
+
+    def test_devtool_upgrade_all_checksums(self):
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test =
cannot be run with a workspace directory under the build directory')
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */worksp=
ace')
+        # For the moment, we are using a real recipe.
+        recipe =3D 'devtool-upgrade-test4'
+        version =3D '1.6.0'
+        oldrecipefile =3D get_bb_var('FILE', recipe)
+        tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
+        self.track_for_cleanup(tempdir)
+        # Check upgrade. Code does not check if new PV is older or newer t=
hat current PV, so, it may be that
+        # we are downgrading instead of upgrading.
+        result =3D runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir=
, version))
+        # Check new recipe file is present
+        newrecipefile =3D os.path.join(self.workspacedir, 'recipes', recip=
e, '%s_%s.bb' % (recipe, version))
+        self.assertExists(newrecipefile, 'Recipe file should exist after u=
pgrade')
+        # Check recipe got changed as expected
+        with open(oldrecipefile + '.upgraded', 'r') as f:
+            desiredlines =3D f.readlines()
+        with open(newrecipefile, 'r') as f:
+            newlines =3D f.readlines()
+        self.assertEqual(desiredlines, newlines)
+
     def test_devtool_layer_plugins(self):
         """Test that devtool can use plugins from other layers.
=20
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 10827a762b..a98370bc10 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -192,8 +192,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcre=
v, srcbranch, branch, kee
         __run('git submodule foreach \'git tag -f devtool-base-new\'')
         (stdout, _) =3D __run('git submodule --quiet foreach \'echo $sm_pa=
th\'')
         paths +=3D [os.path.join(srctree, p) for p in stdout.splitlines()]
-        md5 =3D None
-        sha256 =3D None
+        checksums =3D {}
         _, _, _, _, _, params =3D bb.fetch2.decodeurl(uri)
         srcsubdir_rel =3D params.get('destsuffix', 'git')
         if not srcbranch:
@@ -226,9 +225,6 @@ def _extract_new_source(newpv, srctree, no_patch, srcre=
v, srcbranch, branch, kee
         if ftmpdir and keep_temp:
             logger.info('Fetch temp directory is %s' % ftmpdir)
=20
-        md5 =3D checksums['md5sum']
-        sha256 =3D checksums['sha256sum']
-
         tmpsrctree =3D _get_srctree(tmpdir)
         srctree =3D os.path.abspath(srctree)
         srcsubdir_rel =3D os.path.relpath(tmpsrctree, tmpdir)
@@ -297,7 +293,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcre=
v, srcbranch, branch, kee
             if tmpdir !=3D tmpsrctree:
                 shutil.rmtree(tmpdir)
=20
-    return (revs, md5, sha256, srcbranch, srcsubdir_rel)
+    return (revs, checksums, srcbranch, srcsubdir_rel)
=20
 def _add_license_diff_to_recipe(path, diff):
     notice_text =3D """# FIXME: the LIC_FILES_CHKSUM values have been upda=
ted by 'devtool upgrade'.
@@ -318,7 +314,7 @@ def _add_license_diff_to_recipe(path, diff):
         f.write("\n#\n\n".encode())
         f.write(orig_content)
=20
-def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_ol=
d, srcsubdir_new, workspace, tinfoil, rd, license_diff, new_licenses, srctr=
ee, keep_failure):
+def _create_new_recipe(newpv, checksums, srcrev, srcbranch, srcsubdir_old,=
 srcsubdir_new, workspace, tinfoil, rd, license_diff, new_licenses, srctree=
, keep_failure):
     """Creates the new recipe under workspace"""
=20
     bpn =3D rd.getVar('BPN')
@@ -390,30 +386,39 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, sr=
cbranch, srcsubdir_old, src
                 addnames.append(params['name'])
     # Find what's been set in the original recipe
     oldnames =3D []
+    oldsums =3D []
     noname =3D False
     for varflag in rd.getVarFlags('SRC_URI'):
-        if varflag.endswith(('.md5sum', '.sha256sum')):
-            name =3D varflag.rsplit('.', 1)[0]
-            if name not in oldnames:
-                oldnames.append(name)
-        elif varflag in ['md5sum', 'sha256sum']:
-            noname =3D True
+        for checksum in checksums:
+            if varflag.endswith('.' + checksum):
+                name =3D varflag.rsplit('.', 1)[0]
+                if name not in oldnames:
+                    oldnames.append(name)
+                oldsums.append(checksum)
+            elif varflag =3D=3D checksum:
+                noname =3D True
+                oldsums.append(checksum)
     # Even if SRC_URI has named entries it doesn't have to actually use th=
e name
     if noname and addnames and addnames[0] not in oldnames:
         addnames =3D []
     # Drop any old names (the name actually might include ${PV})
     for name in oldnames:
         if name not in newnames:
-            newvalues['SRC_URI[%s.md5sum]' % name] =3D None
-            newvalues['SRC_URI[%s.sha256sum]' % name] =3D None
+            for checksum in oldsums:
+                newvalues['SRC_URI[%s.%s]' % (name, checksum)] =3D None
=20
-    if sha256:
-        if addnames:
-            nameprefix =3D '%s.' % addnames[0]
-        else:
-            nameprefix =3D ''
+    nameprefix =3D '%s.' % addnames[0] if addnames else ''
+
+    # md5sum is deprecated, remove any traces of it. If it was the only ol=
d
+    # checksum, then replace it with the default checksums.
+    if 'md5sum' in oldsums:
         newvalues['SRC_URI[%smd5sum]' % nameprefix] =3D None
-        newvalues['SRC_URI[%ssha256sum]' % nameprefix] =3D sha256
+        oldsums.remove('md5sum')
+        if not oldsums:
+            oldsums =3D ["%ssum" % s for s in bb.fetch2.SHOWN_CHECKSUM_LIS=
T]
+
+    for checksum in oldsums:
+        newvalues['SRC_URI[%s%s]' % (nameprefix, checksum)] =3D checksums[=
checksum]
=20
     if srcsubdir_new !=3D srcsubdir_old:
         s_subdir_old =3D os.path.relpath(os.path.abspath(rd.getVar('S')), =
rd.getVar('WORKDIR'))
@@ -571,12 +576,12 @@ def upgrade(args, config, basepath, workspace):
             rev1, srcsubdir1 =3D standard._extract_source(srctree, False, =
'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, t=
infoil, no_overrides=3Dargs.no_overrides)
             old_licenses =3D _extract_licenses(srctree_s, (rd.getVar('LIC_=
FILES_CHKSUM') or ""))
             logger.info('Extracting upgraded version source...')
-            rev2, md5, sha256, srcbranch, srcsubdir2 =3D _extract_new_sour=
ce(args.version, srctree, args.no_patch,
+            rev2, checksums, srcbranch, srcsubdir2 =3D _extract_new_source=
(args.version, srctree, args.no_patch,
                                                     args.srcrev, args.srcb=
ranch, args.branch, args.keep_temp,
                                                     tinfoil, rd)
             new_licenses =3D _extract_licenses(srctree_s, (rd.getVar('LIC_=
FILES_CHKSUM') or ""))
             license_diff =3D _generate_license_diff(old_licenses, new_lice=
nses)
-            rf, copied =3D _create_new_recipe(args.version, md5, sha256, a=
rgs.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfo=
il, rd, license_diff, new_licenses, srctree, args.keep_failure)
+            rf, copied =3D _create_new_recipe(args.version, checksums, arg=
s.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil=
, rd, license_diff, new_licenses, srctree, args.keep_failure)
         except (bb.process.CmdError, DevtoolError) as e:
             recipedir =3D os.path.join(config.workspace_path, 'recipes', r=
d.getVar('BPN'))
             _upgrade_error(e, recipedir, srctree, args.keep_failure)

