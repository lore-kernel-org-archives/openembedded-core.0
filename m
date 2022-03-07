Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D38DC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 10:19:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.116])
 by mx.groups.io with SMTP id smtpd.web10.24729.1646648391251509589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 02:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=tziuKwzV;
 spf=pass (domain: arri.de, ip: 40.107.21.116, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eL4KZt0PV6ByucbhAxAC843EA+Aq35rKPs5xwDbv5e6rCbxytWfvYxnadR5o1MoEFyW3mpSCVwnEctTJzJqWWzndq0E9+cJJ64iqVcUEAbIWcH5BR51469VYg6fb7tvAlnCqtZSJ4bhE7WpaSC5sMlnlsuxtVWsWmYdDVP6kBVy0Q5YYFPZ7RPVkrH8ASXMxlo1xqN9OPnO3igBegZKGAa9xkTS/6eAiigaIIBBXI11oyfjBmWGAYq0BeMfVtPTbe7dFXBtb+3B1Z3+cU1MlJWRydoLZhJHzO+p9YbU0LPq3xY98F6ML9K4BbLYDwNKK3pAaUty98ZhYA0BiDL9dMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7I2+5veeZN35SieaNr/p8kGMqTFjyec2s8urKPkbbM=;
 b=Kkt3OVWJx9XZ/9I6P8NkcsTq3dxakGQkBXU2Xq6hyukn8uBiI77MpjVCMnHtDyIaS8UOLG0iZNHjh1FxjSSWc/bJcUDnPqYhKUfOXU+AEr+8+HMC+fQROo9QOHGDuvcUfNx2lm2gYG1vzckWzPWta0uihqQ/5LhzE4n4yV8LI6cM7YoqEriS3ODdZY1gaUWGtFbA80D2btTNiiIpHJ9+/ezmZaYcC4g5L7Yy1VJgFDZTT3HYnocw2ojR/ynS5NRMGkBXj8cviSG5CEP4KCtqedY37Jw9Wa6q2yVpCvlmwQW4DiYSGGIvDr97HrOZBDYTrT/K28WhQ8qxxtG8CtvQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7I2+5veeZN35SieaNr/p8kGMqTFjyec2s8urKPkbbM=;
 b=tziuKwzVStc3kdjQDQc0Wfpm4HoyaVTAIEpxOHhckn+yKUpwm+PdgztN15cGUANhYZnREjcv9oQgCZXDRI9+vOqkDuujQy1TqwF0LDFp8Nf5PjmHlsWvtbuV7lT+okM9y9pTKnT9LJJIWbEWSKGK1Ynyi8BrbvcDqLkUtv2kxag=
Received: from SV0P279CA0009.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:11::14)
 by AM6PR07MB5174.eurprd07.prod.outlook.com (2603:10a6:20b:69::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.6; Mon, 7 Mar
 2022 10:19:47 +0000
Received: from HE1EUR02FT038.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:11:cafe::96) by SV0P279CA0009.outlook.office365.com
 (2603:10a6:f10:11::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Mon, 7 Mar 2022 10:19:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT038.mail.protection.outlook.com (10.152.11.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Mon, 7 Mar 2022 10:19:46 +0000
Received: from localhost.de (192.168.201.134) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 7 Mar 2022
 11:19:45 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Pavel Zhukov <pavel@zhukoff.net>, Pavel Zhukov <pavel.zhukov@huawei.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [honister][PATCH] patch.py: Prevent git repo reinitialization
Date: Mon, 7 Mar 2022 11:19:29 +0100
Message-ID: <20220307101929.20144-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.201.134]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c631d73a-603e-43de-6077-08da00240160
X-MS-TrafficTypeDiagnostic: AM6PR07MB5174:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR07MB51748A76D82E2938D9A27495BF089@AM6PR07MB5174.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eVWExtgAog5z8Gm6ccNCO2LL+U7dFv+aHk3fml5CsgDmRaOMe5qIInHl39iSzU7oaJaHotkL6LvHxS67q9NKe2Ml6RO2/AJQczrB8ykYHPPZjfD+fZR4kbUFwqZ5sWI59RMPsuMDHhxkSWbjxwc3p/BohxM6Dx49/m8IccqdfcjT3C4L9cmhnhglZ9zpxBsIsrrK9hRcKFWf2neORDxYDlRRi15nCs52KuqolVgZ6FrHgK9S/mS2vi+wv9qUyoVQNwiLHMcH6l/fJGjCEtwnAgSFjSAVQkP/xNk0mv9/SQIveMW+Il7WZMsC4iw4e5cvIgPtXEB+ZjvjHl6chBxFv2VmXiRl+hH1QdbdUNF9PWuU/RajL0sopdSiQ3QTWIPm9h1eOV5/89HSxosXmOKZyqXMJAR4zq73TwkXdxZq7mYtk0piGwlRTlQs2Gt+zO/FhxF5h0EHJ4+hPv/AA9KTCBOIZwjzwYPfDH0CvV4qbeRsCXnEKcqMVq6VVK4oPtwS/vjzPmedoyNMEAQvI5h7QByXD2jCTUVUP5I5mF3a2eJHCEewC+THml3muslModOEb7R2P7nqMZHmORppPadYiaaObia0p3aO5HsVfoOrjTyxMUEIUd4JrGfKG8CymcT/4IzO4qxDogFQExFkDM6aGqCGRpd0gWsJ8JK8YfG1kG03CcCzFjzTPYMY52ookOOPO3VYAM5KrlwvQB74ugWLNeEvQppmznyC+KLaz7h6dQi4/skxvTh7Ukg6v1zRxL3FeNHxWAsO5Ws3CJrnqOEEj+LGxu31j1mAPKKIczUGmu2M3twJA6aEZHbdMe8jtq8w
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(82310400004)(508600001)(86362001)(8936002)(54906003)(36860700001)(81166007)(356005)(6916009)(186003)(26005)(2906002)(83380400001)(426003)(16526019)(336012)(6666004)(5660300002)(47076005)(70206006)(70586007)(4326008)(8676002)(2616005)(1076003)(316002)(36756003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 10:19:46.6845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c631d73a-603e-43de-6077-08da00240160
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT038.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB5174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 10:19:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162805

From: Pavel Zhukov <pavel@zhukoff.net>

There were few bugs in the _isInitialized() function which might trigger
git repo to be reinitialized and patches failing to apply.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-test/gitrepotest/gitrepotest.bb    | 16 ++++++++++++++++
 .../gitrepotest/0001-testpatch.patch           |  9 +++++++++
 meta/lib/oe/patch.py                           | 11 ++++++++---
 meta/lib/oeqa/selftest/cases/bbtests.py        | 18 ++++++++++++++++--
 4 files changed, 49 insertions(+), 5 deletions(-)
 create mode 100644 meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
 create mode 100644 meta-selftest/recipes-test/gitrepotest/gitrepotest/0001=
-testpatch.patch

diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb b/meta-s=
elftest/recipes-test/gitrepotest/gitrepotest.bb
new file mode 100644
index 000000000000..f1b6c55833bf
--- /dev/null
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Test recipe for git repo initialization"
+HOMEPAGE =3D "https://git.yoctoproject.org/git/matchbox-panel-2"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19=
f"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+PATCHTOOL=3D"git"
+
+SRC_URI =3D "git://git.yoctoproject.org/git/matchbox-panel-2;branch=3Dmast=
er;protocol=3Dhttps \
+           file://0001-testpatch.patch \
+          "
+
+SRCREV =3D "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
+
+S =3D "${WORKDIR}/git"
diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpa=
tch.patch b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpat=
ch.patch
new file mode 100644
index 000000000000..bccda17ee9c6
--- /dev/null
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.pat=
ch
@@ -0,0 +1,9 @@
+diff --git a/Makefile.am b/Makefile.am
+index 432a9b4..bbf7c74 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,3 +1,4 @@
++## This is useless comment to test if patch works
+ ACLOCAL_AMFLAGS =3D -I m4
+=20
+ SUBDIRS =3D matchbox-panel applets data po
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 950fe723dcfd..9034fcae0348 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -304,14 +304,19 @@ class GitApplyTree(PatchTree):
=20
     def _isInitialized(self):
         cmd =3D "git rev-parse --show-toplevel"
-        (status, output) =3D subprocess.getstatusoutput(cmd.split())
+        try:
+            output =3D runcmd(cmd.split(), self.dir).strip()
+        except CmdError as err:
+            ## runcmd returned non-zero which most likely means 128
+            ## Not a git directory
+            return False
         ## Make sure repo is in builddir to not break top-level git repos
-        return status =3D=3D 0 and os.path.samedir(output, self.dir)
+        return os.path.samefile(output, self.dir)
=20
     def _initRepo(self):
         runcmd("git init".split(), self.dir)
         runcmd("git add .".split(), self.dir)
-        runcmd("git commit -a --allow-empty -m Patching_started".split(), =
self.dir)
+        runcmd("git commit -a --allow-empty -m bitbake_patching_started".s=
plit(), self.dir)
=20
     @staticmethod
     def extractPatchHeader(patchfile):
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selfte=
st/cases/bbtests.py
index 31962b92d79e..a08001a173dc 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -310,8 +310,22 @@ INHERIT:remove =3D \"report-error\"
         src =3D get_bb_var("SRC_URI",test_recipe)
         gitscm =3D re.search("git://", src)
         self.assertFalse(gitscm, "test_git_patchtool pre-condition failed:=
 {} test recipe contains git repo!".format(test_recipe))
-        result =3D bitbake('man-db -c patch', ignore_status=3DFalse)
+        result =3D bitbake('{} -c patch'.format(test_recipe), ignore_statu=
s=3DFalse)
         fatal =3D re.search("fatal: not a git repository (or any of the pa=
rent directories)", result.output)
         self.assertFalse(fatal, "Failed to patch using PATCHTOOL=3D\"git\"=
")
         self.delete_recipeinc(test_recipe)
-        bitbake('-cclean man-db')
+        bitbake('-cclean {}'.format(test_recipe))
+
+    def test_git_patchtool2(self):
+        """ Test if PATCHTOOL=3Dgit works with git repo and doesn't reinit=
ialize it
+        """
+        test_recipe =3D "gitrepotest"
+        src =3D get_bb_var("SRC_URI",test_recipe)
+        gitscm =3D re.search("git://", src)
+        self.assertTrue(gitscm, "test_git_patchtool pre-condition failed: =
{} test recipe doesn't contains git repo!".format(test_recipe))
+        result =3D bitbake('{} -c patch'.format(test_recipe), ignore_statu=
s=3DFalse)
+        srcdir =3D get_bb_var('S', test_recipe)
+        result =3D runCmd("git log", cwd =3D srcdir)
+        self.assertFalse("bitbake_patching_started" in result.output, msg =
=3D "Repository has been reinitialized. {}".format(srcdir))
+        self.delete_recipeinc(test_recipe)
+        bitbake('-cclean {}'.format(test_recipe))
--=20
2.34.1


