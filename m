Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74089C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 10:30:49 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.110])
 by mx.groups.io with SMTP id smtpd.web11.24753.1646649046799444812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 02:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=VMaZUuNa;
 spf=pass (domain: arri.de, ip: 40.107.8.110, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzGzBrGOkhn3zDiCESZZLbvbcSnhpM00SV0B2jb/zHcu0lBer01scq2FL5MgUFePYAfHt7LHeHNBrCuTLPzdI1LNBQXp4zwtpQkh5nZpN7OiAuFe8/D5FO69SHK6IPd4ldj8VSJM3bGxQpe61jhK8KjK/rgAOYw2hG8igxc8UfKfvjGStKxsZ8r4uoel8JhIUZQkyg1sKn49plGtNeAX4qEXsFvbe7qyT/aszPxWdRASQG7a29nTtK7mdUmb7M0OYq5CQuzIQ/M2BzakVK/UAwAIrs5yxx+tPCcFwuNZWKMOjF6HLuFDBB8L8FAsNZOUP9vcpvXgLnz519Rel/uV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eY0hoCG3VxPL7aN0DFXhJhwa8/SbuW4E7W5ZwDgC4vM=;
 b=L1+AFx1S1Ib1DMJfO4UrjcB3IitmOWji8e3eDLDwPgTbPMglposixpwSw3WgTfC+h5G88rUB+HSJwkRLLazb+TdMg/ve2BViX7TQDzL7gr8Aku5ljoOPCMlhqatuVqWqYUqwDWF6lz6/rlFPTzDcsF0O2sCtJeAYkiqsbiKLW1NppNRj4znVoPwwqG0sbNKfPUuIzWr1R82uBpt1PWHGdoT4POk01bK8XIeBdVTZo6fV+p3sXV5rRRn8cBCcuSiMtljL+203FLs4QFxZ11SBb7O5WtLe4DJdRJydnQLk3P+LxyVn2V+4gwfKrldeaAtoVYrzQ/jrM8xgyU1x2B7LGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eY0hoCG3VxPL7aN0DFXhJhwa8/SbuW4E7W5ZwDgC4vM=;
 b=VMaZUuNaCehGR+h1aoQOOr073IFiIMWcrK/v4jnRmE4F4Zw4wwlrw1yWeBgjxr77c5CNW8WYqoPp7g+w1KCgPSTv9kRRtJgznpCWTGDPlsYN33FepUNvKlgKmG0AJsAmvj7Y1ii3ECzg4tJjQzmzKLC+Nsnm9w1lxOI1GiXccyA=
Received: from AS8PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:20b:312::18)
 by VI1PR07MB4093.eurprd07.prod.outlook.com (2603:10a6:803:2d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.10; Mon, 7 Mar
 2022 10:30:43 +0000
Received: from AM5EUR02FT059.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::21) by AS8PR04CA0043.outlook.office365.com
 (2603:10a6:20b:312::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Mon, 7 Mar 2022 10:30:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT059.mail.protection.outlook.com (10.152.9.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Mon, 7 Mar 2022 10:30:42 +0000
Received: from localhost.de (192.168.201.134) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 7 Mar 2022
 11:30:41 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Pavel Zhukov <pavel@zhukoff.net>, Pavel Zhukov <pavel.zhukov@huawei.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [hardknott][PATCH] patch.py: Prevent git repo reinitialization
Date: Mon, 7 Mar 2022 11:30:26 +0100
Message-ID: <20220307103026.20672-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.201.134]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 461ca83f-23e4-47e7-5eb8-08da00258836
X-MS-TrafficTypeDiagnostic: VI1PR07MB4093:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR07MB40933503A5DF9CF3BB37F3A0BF089@VI1PR07MB4093.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nAT9uCVWogHGqgQc2QntOFyTHYCbkpLpONMBcG1ybcyF1tQYBZsF0jjB5eQZG+s4/saHzzuOMSfmqZ4HtAEqy2KyhacXNUTA9dUonQ8gOki19Hm7/KNceHpvpkX85KJF+djS548wbtatvi+/44Qfoj34tcnLISqTOo7Z/v5Z0glDkCK29TtyMfrvT3ekJrgXAroXkLFUFlGXmh5pVeAtH1/UyMvOCzilyYbIBEJNQma7FA46K3t+uy61OE9oD1z6YdUfCqjljeYJ+P0dNp7Y4dJthSo7jR3VZdHHmU8NYgIopxHSq6g/Z2dLDOqhKOwyAIlR3xeIQcWToA9Wqu64nHy5sw+9udhYKYCMF0QIeeY+trgjuK3qdyg8qXzI0XSgxlC7VubpuA48APRFVeLHgxuTTzq1OCQXksSs/jNNudctCAy0mm9pMQZbjMzD6nMod3EwHIm+BgCiVsMbU+DkEzK9JlnilUQ4096E6vPePs2G4ID0LmrqyUhYFubg/nXF8hFsAXEj0DV+uwPvomRou0mZPzDZftoDLuO2z+ZkBg3QhehmWGRtoGB6Iww/b4w8gtjTYZtyNEI10PxPQB+yFHW1ohh1sKtyzcfWVIHXKWkZDlBng5xA+4suksKP0sLsCkNsAZu5QKy7VVoYxP5kNr3YQYeQYt4JmmrxLaZGb29T2CJizcTL6hKU0KbeHoTo9wpIbad6F/E1RzrR0BxCH3a+bpGqtW22ybfjVr8/pPBoAb4rKRZszpYjMlSC4hygsgA/lRxCFMaIUM/wot0G/A==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(16526019)(1076003)(81166007)(426003)(336012)(2616005)(26005)(356005)(47076005)(83380400001)(82310400004)(36860700001)(86362001)(186003)(6666004)(8676002)(4326008)(70206006)(70586007)(8936002)(5660300002)(36756003)(2906002)(508600001)(6916009)(316002)(54906003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 10:30:42.4971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 461ca83f-23e4-47e7-5eb8-08da00258836
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT059.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB4093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 10:30:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162806

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
index 0a618bb9a6c9..4187cb840a38 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -310,8 +310,22 @@ INHERIT_remove =3D \"report-error\"
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


