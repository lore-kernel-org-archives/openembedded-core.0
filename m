Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B016ECDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 20:26:04 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.46])
 by mx.groups.io with SMTP id smtpd.web10.23205.1697142360756539926
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 13:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=AuKjo11a;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.101.46, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deCL5BLVeYMatYM9DNmXg2sXJycjKVJSDqKs1nlOB+EEB0ukYcP7TM9mNgilgqBnfnvYc02QBS2FiEG39OdseaEYT29ITMP2c9pzAePxwcW5N8EVvgB/hTXkWRI1aJsPCYy9NsZdTQVhS4Wf41IwbkoefDMK3bNPT8zfq1jKDSqVk5i/ZoeRGbrGpAE3aNRGoXWLibGAvcU8yUMXhWrCVplJaI5WmleE9lddxUIIVNj7QX7FE9UIj+tQRSnOJyQjhd223JUg3aJXJk4j12uTNeicPRfbB/osYuJqRYalI5ngbN6CY53a1qQXwAkvjJxyElPKolle5GRtAf/d/IJVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJRTOjmQAj5dDhXk/aq6Eq/1ldDSBGEVoGFMK7IHqh0=;
 b=dkRFNRQLBtsazYgUxOpAmQMje2s+WYCmeti9t0TdbI+CY8mgUTg8MS0PHTp+SfiVGOYnyu0EQ+7PGn9CgV71mVpSvhj08uqkFXHt415qUv/5vUAv20TxnCI3rt7X/VhVpSZKukgHxBSQLqnGSKmDRfqBVkLOlsgN/bkTDAxWBghG4xhQq0SyYNxbzCfzxscCioWQIQqLcdO269AklhJaSqS80tFf0F+7Nr42S/zWWzsG8FbHPmt6+7V1dadmd1+gFNgj9U4WcG1hhatQo62PkyTO+Ua0H+MzmW4yWFWh8lHcSs9rh0T/8wNBGFX06ZeiRSzuvxJnwMgxULftF4b5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJRTOjmQAj5dDhXk/aq6Eq/1ldDSBGEVoGFMK7IHqh0=;
 b=AuKjo11aA+waYdqx3g1tUZcl+6FtibQRV69vRq0pNAHlkYSNAwjxCZ5WJYr3BPRAZIssYAiQ4ifqC2rZBYEbWR3qmDZ2i1s5hyv1Z8c2GOZjzY8JmZxVsGcYSEbikccEd/VJn1B3KYbV305ftzVBan9/u/mm9a9GlDWZ1wkgbrEL4SKRxHA2FI8nzj3BUVKWyyFpo4F8ooVt3NJ2gE3+N8Ynnmerj/GByGYkmYLJbF1014YgFtvKGlssrgtT/cTeXC6G4iNfOvr5kas9eJAGscmmzkhGC+X56tmUo9LwtSNCBHk1xL5NTAkkGM8fsQGoFGbQGB41wjOxgk/dGt/hWA==
Received: from MW4PR04CA0150.namprd04.prod.outlook.com (2603:10b6:303:84::35)
 by BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 20:25:58 +0000
Received: from MW2NAM12FT067.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::22) by MW4PR04CA0150.outlook.office365.com
 (2603:10b6:303:84::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.29 via Frontend
 Transport; Thu, 12 Oct 2023 20:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 MW2NAM12FT067.mail.protection.outlook.com (10.13.181.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.12 via Frontend Transport; Thu, 12 Oct 2023 20:25:57 +0000
Received: from chris-virtual-machine.localdomain (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 14:26:52 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jon.richardson@generac.com>, <bruce.ashfield@gmail.com>, Chris Laplante
	<chris.laplante@agilent.com>
Subject: [PATCH 3/3] oeqa/selftest/devtool: add test for YOCTO# 14723
Date: Thu, 12 Oct 2023 16:25:35 -0400
Message-ID: <20231012202535.2902235-3-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012202535.2902235-1-chris.laplante@agilent.com>
References: <20231012202535.2902235-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2NAM12FT067:EE_|BL1PR12MB5851:EE_
X-MS-Office365-Filtering-Correlation-Id: eedeef1f-e551-47b2-4f15-08dbcb617130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L3PjwYgZEc+vAt3H1y5v87PEHLZS1FT0D/x5IjZqs5h9GmrgaVPQiF/hUgCmFjI7nwJ0BwHzfvvBTFcd6ukySA2hk69XouAs1YgpXQ89hb9V3XUVixGk3/z6eYHWhQmY3aVlptFh2opEhSNtg+laU0b81G4QtDVe+/SYNQjPNKxkzyrb0l8V7Y4jhpL7vDCK+TS5XbIhM6bXb4wYA9ZjKiGRVB+/qT5Y10+b8ZPwQq+fVOEF6sEQ2q7iUIwy6lSHQJNtjKsyHU9m3YtNKzwupqKl+PgTy8yddFgNL7c1mDU6aOjz4lVK6c+KUsexUrVbwSHhCAVRJ6uljDNjE44eLYsBPVDmx/03Ez6cne6E27K23TEk50aZTZHeTl5olMcYlktPLvVqW624e70gHnveQmIsxAXlkZy3yPAOCsYfCexSSKcmkfaFjXyCnnmZz2KTCtJCvgOGEDOHbfKQedE+nKvpuib1T0Of3COGqYgc5Dtf8UdY5POO6W+Ttp7aNTi4SPoQDRdArA/tDWJw4xDVYhHARleCRa9rOB9q/cvjCe5pqT5H+Ll1vM5Epl2XV6OzLA4/OOzJB2F73IlGvvBfOBFkyD2ebt2vWqmODz/1UGiSXwRAQDbgOqcScAejDMgy/FxAv4PujRpulVNFuGFQMwaFaNQW6eFBz5uAqHXOeb3hQ9Ek+grE2ve9sjjlUJVAu7AZwYNgOe5fXPFLglEQmW8jmuE+rGFQtQ2Sc0UFmv/IVUea2tmSdPC1ZTK79LPe
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(82310400011)(186009)(46966006)(40470700004)(36840700001)(40480700001)(1076003)(2906002)(26005)(54906003)(47076005)(336012)(426003)(83380400001)(82740400003)(7636003)(356005)(8936002)(4326008)(36860700001)(5660300002)(2616005)(478600001)(316002)(41300700001)(2876002)(8676002)(70206006)(107886003)(956004)(40460700003)(6666004)(6916009)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 20:25:57.3221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eedeef1f-e551-47b2-4f15-08dbcb617130
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT067.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5851
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 20:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189024

From: Chris Laplante <chris.laplante@agilent.com>

This relatively exhaustive test is designed to exercise the 'devtool
modify' workflow for kernel recipes, with a focus on SRC_URI override
branches.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 132 ++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index a5ef0329df..1072e23c21 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2197,3 +2197,135 @@ class DevtoolUpgradeTests(DevtoolBase):
=20
         #Step 4.5
         runCmd("grep %s %s" % (modconfopt, codeconfigfile))
+
+    def test_devtool_modify_kernel_overrides(self):
+        """
+        [YOCTO #14723]
+
+        Test that patches in SRC_URI overrides round-trip correctly throug=
h devtool modify, especially when
+        appends/prepends are present.
+        """
+        import typing
+
+        # Perform some initial setup
+        kernel_provider =3D self.td['PREFERRED_PROVIDER_virtual/kernel']
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c clean %s' % kernel_provid=
er)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */worksp=
ace')
+
+        # Collect some information for later
+        machine =3D get_bb_var("MACHINE")
+        recipefile =3D get_bb_var('FILE', kernel_provider)
+        recipedir =3D os.path.dirname(recipefile)
+        res =3D re.search('recipes-.*', recipedir)
+        self.assertTrue(res, 'Unable to find recipe subdirectory')
+        recipesubdir =3D res[0]
+
+        new_file_contents =3D "A new file"
+
+        bitbake('%s -c clean' % kernel_provider)
+
+        # We are going to call 'devtool modify' multiple times in this tes=
t, so we use a context manager for the temp
+        # dir rather than call 'track_for_cleanup', since we want the temp=
dirs destroyed between sub-tests. Also it's
+        # easier and clearer this way.
+        with tempfile.TemporaryDirectory(prefix=3D'devtoolqa') as tempdir:
+            runCmd('devtool modify %s -x %s' % (kernel_provider, tempdir))
+            self._check_src_repo(tempdir)
+
+            tags =3D runCmd('git tag --points-at HEAD', cwd=3Dtempdir).out=
put.strip().splitlines()
+            self.assertSetEqual(set(tags), {"devtool-base", "devtool-patch=
ed"})
+
+            # Construct a patch to add a file
+            runCmd(f'echo "{new_file_contents}" > devtool-new-file', cwd=
=3Dtempdir)
+            runCmd('git add devtool-new-file', cwd=3Dtempdir)
+            # Need to add the Upstream-Status otherwise the patch will be =
rejected next time we 'modify'.
+            runCmd('git commit -m "Add a new file\n\nUpstream-Status: Inap=
propriate [OE self-test specific]"', cwd=3Dtempdir)
+            self.add_command_to_tearDown('rm -rf %s' % os.path.join(self.t=
estlayer_path, recipesubdir))
+            runCmd('devtool finish %s meta-selftest' % kernel_provider)
+
+        # Check patch was created
+        patchfile =3D os.path.join(self.testlayer_path, recipesubdir, kern=
el_provider, "0001-Add-a-new-file.patch")
+        self.assertExists(patchfile, "Patch file doesn't exist")
+
+        # Check bbappend was created
+        appendfn =3D os.path.join(self.testlayer_path, recipesubdir, '%s_%=
%.bbappend' % kernel_provider)
+        self.assertExists(appendfn, "bbappend doesn't exist")
+
+        def _assert_new_file_presence(exists: bool):
+            file_path =3D os.path.join(tempdir, "devtool-new-file")
+            if exists:
+                with open(file_path, "r") as f:
+                    contents =3D f.read()
+                self.assertEqual(contents, f"{new_file_contents}\n")
+            else:
+                self.assertNotExists(file_path)
+
+        # Check that the patch round-trips
+        with tempfile.TemporaryDirectory(prefix=3D'devtoolqa') as tempdir:
+            result =3D runCmd(f'devtool modify {kernel_provider} -x {tempd=
ir}')
+            self._check_src_repo(tempdir)
+            _assert_new_file_presence(True)
+            runCmd(f'devtool reset {kernel_provider}')
+
+        def _modify_append_file(fn: typing.Callable[[str], str]):
+            with open(appendfn, "r+") as f:
+                contents =3D f.read()
+                contents =3D fn(contents)
+                f.seek(0)
+                f.write(contents)
+                f.truncate()
+
+        # Modify bbappend to conditionally apply the patch
+        _modify_append_file(lambda contents: contents.replace('SRC_URI +=
=3D "', f'SRC_URI:append:{machine} =3D " '))
+
+        # Check that the patch still applies and that all branches/tags ar=
e created as expected
+        with tempfile.TemporaryDirectory(prefix=3D'devtoolqa') as tempdir:
+            result =3D runCmd(f'devtool modify {kernel_provider} -x {tempd=
ir}')
+            self._check_src_repo(tempdir)
+            _assert_new_file_presence(True)
+            runCmd(f'devtool reset {kernel_provider}')
+
+        # Change the bbappend such that the patch is applied for a non-act=
ive OVERRIDE
+        _modify_append_file(lambda contents: contents.replace(f'SRC_URI:ap=
pend:{machine} =3D " ', f'SRC_URI:append:{machine}-fake =3D " '))
+
+        with tempfile.TemporaryDirectory(prefix=3D'devtoolqa') as tempdir:
+            result =3D runCmd(f'devtool modify {kernel_provider} -x {tempd=
ir}')
+            self._check_src_repo(tempdir)
+
+            # File shouldn't exist on this branch...
+            _assert_new_file_presence(False)
+            current_branch =3D runCmd('git symbolic-ref --short HEAD', cwd=
=3Dtempdir).output.strip()
+            self.assertEqual(current_branch, "devtool")
+
+            tags =3D runCmd('git tag --points-at HEAD', cwd=3Dtempdir).out=
put.strip().splitlines()
+            self.assertSetEqual(set(tags), {"devtool-base", "devtool-patch=
ed"})
+
+            # It should exist on the 'devtool-override-${MACHINE}-fake' br=
anch
+            runCmd(f'git checkout devtool-override-{machine}-fake', cwd=3D=
tempdir)
+            _assert_new_file_presence(True)
+            runCmd(f'devtool reset {kernel_provider}')
+
+        # Finally, change the bbappend such that the patch is applied to t=
wo different OVERRIDES.
+        # Would get two branches created, devtool-override-${MACHINE}-fake=
 and devtool-override-${MACHINE}-fake2, with
+        # the patch applied. This tests that patch series generation is wo=
rking for multiple overrides branches.
+        #
+        # The 'devtool' branch will not have the patch applied because the=
re are no active OVERRIDES.
+        _modify_append_file(lambda contents: contents.replace(f'SRC_URI:ap=
pend:{machine}-fake =3D " ', f'SRC_URI:append:{machine}-fake2 =3D " file://=
0001-Add-a-new-file.patch"\nSRC_URI:append:{machine}-fake =3D " '))
+        with tempfile.TemporaryDirectory(prefix=3D'devtoolqa') as tempdir:
+            result =3D runCmd(f'devtool modify {kernel_provider} -x {tempd=
ir}')
+            self._check_src_repo(tempdir)
+
+            # File shouldn't exist on this branch...
+            _assert_new_file_presence(False)
+            current_branch =3D runCmd('git symbolic-ref --short HEAD', cwd=
=3Dtempdir).output.strip()
+            self.assertEqual(current_branch, "devtool")
+
+            tags =3D runCmd('git tag --points-at HEAD', cwd=3Dtempdir).out=
put.strip().splitlines()
+            self.assertSetEqual(set(tags), {"devtool-base", "devtool-patch=
ed"})
+
+            # It should exist on the 'devtool-override-${MACHINE}-fake' br=
anch
+            for branch in [f"devtool-override-{machine}-fake", f"devtool-o=
verride-{machine}-fake2"]:
+                runCmd(f'git checkout {branch}', cwd=3Dtempdir)
+                _assert_new_file_presence(True)
+
+            runCmd(f'devtool reset {kernel_provider}')
--=20
2.34.1


