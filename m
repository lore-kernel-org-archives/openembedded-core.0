Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E97E95A62
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 17:47:50 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.52])
 by mx.groups.io with SMTP id smtpd.web11.22607.1696700865570055777
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 10:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=kLW0QAeD;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.52, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGZLSUJYRuLJa8QQmaY5JPpRciOX8RqOIuPtVZk+ChJbuVR9dxi6aQrzjyz6vXg0B0TubFp8dL6SiwmjYzTenQtLs/mIRhz+XlLVeyxu8EZBnOr3Pc62mpqmw9gkR+N1S61MVhwFr41nUIZskDVlWHQAko86Cqew05n1jZ4lM9zMX2Q+X+5849uc/0GTIxXIJAkNpHeRymhZ2Muz+BYbif2mH/ZULO9jL4mDGKhTyXh/I+NhgydoYe1mNo6KQr3QkuPS8+SdhzZYRa0xuegv/AMDbiP2nwnItE3qBxIB52acPHxlrwpi3l0nUcpA618rrB4RS8h7neC2qQ+EERoLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0k/wrCuFprc5mDOLBUqPWfWxwwznp8Qzd/U8TPsfEM=;
 b=l4L99MMoLiRogVDT19WM2KIpMEd5yDK2FoltrsG9pIfDT++Eb8UEsqOBuMag+s977GuqT1bB9yV/yf06kE0L7uRtlfXTzMOhpUcepcGWFm5AFjqkPX3mm+h3yK9JSMjaY4JnS+CwpMi9rda9T81sgl7QLG3MQFuypO8r0O/Zq6HnEM/+To/DV0pW/PayP78eb/bH0ucH+gybIVzMWILQnEeo9cQ4XbcE3+JukZxlmYBA1eTm2Yb8xM628dSMUiREyfmuVz/am1kgmFHHSDUXfyA/Ax5v+cmDJI7+GYDpoNAFSsuNI+/ojDjgedXOKtX6BlQzNHgVqFgYf6XxfqbhhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0k/wrCuFprc5mDOLBUqPWfWxwwznp8Qzd/U8TPsfEM=;
 b=kLW0QAeDliJ4jqUtdU+qGi1OSgWiOyYjMp9go1zTOkmoEuFbdC0b/lhu1KZi06z49tf8zNdIsQPyyLTlQDco9WApgn5HLg+zZamq02oNlKd4niRAVUIYcCRHOeQtUIqGeSgZaqUuD5+6iqJ51Q+gPUcSGQKSX+uCz4QfkNoD5loIpJjhi8fUmfaOp0ahBuySG7lz+GBtLsNdOclY6xXT+7r6zNVYsZ9D4FYe4ILhiJEjYVK2TkOgYYgYYlg6Lm66UhHsDeSFYZIuEu+A2Gtm4gVUaCB38h0jeK5r1PpSg2LRl7XVtXsTqAXloX4sGX3IIkZsCL7K8Um4MuDIyUVGbg==
Received: from MW4PR04CA0058.namprd04.prod.outlook.com (2603:10b6:303:6a::33)
 by BL3PR12MB6593.namprd12.prod.outlook.com (2603:10b6:208:38c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Sat, 7 Oct
 2023 17:47:41 +0000
Received: from MW2NAM12FT093.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::a4) by MW4PR04CA0058.outlook.office365.com
 (2603:10b6:303:6a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.31 via Frontend
 Transport; Sat, 7 Oct 2023 17:47:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 MW2NAM12FT093.mail.protection.outlook.com (10.13.181.54) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.9 via Frontend Transport; Sat, 7 Oct 2023 17:47:40 +0000
Received: from chris-virtual-machine.localdomain (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sat, 7 Oct 2023 11:48:28 -0600
From: Chris Laplante <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 2/2] oeqa/selftest/devtool: fail if non-selfest workspace layer present
Date: Sat, 7 Oct 2023 13:47:01 -0400
Message-ID: <20231007174701.1890063-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231007174701.1890063-1-chris.laplante@agilent.com>
References: <20231007174701.1890063-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2NAM12FT093:EE_|BL3PR12MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: 173983f9-0175-48a9-4cb3-08dbc75d80a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iq/PDwC/LDCUelBPnZdU3yR5gjs/UP0o5OeNmKMPrhZfPqlRKhWEgdDiOoZQLlqtzr4FcpPnqovqu8dWFKWjLzbk7PQJUIfdQlSBqCjrX8F/uewKx2Up5jTVEbct7u5TusZVSzCEctxq/nttpcK9dzhQ7ZTEpgYe/qnoizA7/X6HEBrnXmt+H0Qj0TvFpBUU+FEETo7w8pfjG7f9SZ8lpB+6RyXJd1wcmfGea1dJGs9QDvtj6rH6aSrBvv0TNU4F8kuGgXMvszMmVnlLMgUTeTYbaYx/YSgWszIk512CYvC118meyIWRlkh5MfUu8Po5C5zObPQeMDxr4PuBz0SmvhtwoP8NAu6yuw4ixyvUCajJUDyB9iDTVUF+06dKmqBz0ZkC9P/1UKHvOHOQxM+j5HRQT5z9ayd91CYn+TtbNp1yvAJhu3TE1rKHdd44jrBRtihfwtfLnl5vLwr4/yLfCbiYzIBruF06I3sjPzvWVPsb4846cEaknMfGQjs+Gi57EEWqA/MfHypt4mIwb9EGLBt/LiuSnf4klVvgY9G/6xfYrhpBsdABPqPHOw6y0x7nD/++Duf+G82z26mtZxLY3DeIBDflCxEAbuB+3OAPCRH+DuTM2GdSePtRgozpKTjsu8b/z/0UtiDYwpUhw+hf/5YQE7x4UwgNdbPYJnbr8TSG4KluFktVEiRrwmFV1G30HeATkn7gzorJxhWi/xsctB37Rri5HbPhUzUF69Ff/NXREfI9YAn8fQ6ChgCdhOuZ
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(186009)(82310400011)(1800799009)(451199024)(64100799003)(36840700001)(40470700004)(46966006)(2906002)(44832011)(8936002)(5660300002)(8676002)(4326008)(107886003)(316002)(41300700001)(6916009)(70206006)(2616005)(40480700001)(36860700001)(40460700003)(478600001)(1076003)(426003)(6666004)(956004)(26005)(36756003)(336012)(7636003)(356005)(86362001)(47076005)(83380400001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 17:47:40.6166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 173983f9-0175-48a9-4cb3-08dbc75d80a5
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT093.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6593
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 17:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188798

The tests will fail anyway (since you will have two 'workspacelayer'
layers), so might as well make it fail faster and be clear.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 36 ++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index b577f6d62a..2c38eeca17 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3,7 +3,7 @@
 #
 # SPDX-License-Identifier: MIT
 #
-
+import dataclasses
 import os
 import re
 import shutil
@@ -11,6 +11,7 @@ import tempfile
 import glob
 import fnmatch
 import unittest
+from typing import List
=20
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_l=
ayer
@@ -90,6 +91,12 @@ def tearDownModule():
         bb.utils.edit_bblayers_conf(bblayers_conf, None, None, bblayers_ed=
it_cb)
     shutil.rmtree(templayerdir)
=20
+@dataclasses.dataclass
+class BBLayerConfEntry:
+    layer: str
+    path: str
+    priority: int
+
 class DevtoolTestCase(OESelftestTestCase):
=20
     def setUp(self):
@@ -100,6 +107,29 @@ class DevtoolTestCase(OESelftestTestCase):
                         'This test cannot be run with a workspace director=
y '
                         'under the build directory')
=20
+        # Ensure there is no actual workspace dir enabled
+        self.assertFalse(self.is_external_workspace_layer_enabled(),
+                         "This test cannot be run with a workspace layer i=
n bblayers.conf")
+
+    def is_selftest_workspace_layer_enabled(self):
+        """Returns true if the selftest workspace layer is enabled in bbla=
yers.conf"""
+        return any([layer for layer in self._read_bblayers() if
+                    layer.layer =3D=3D "workspacelayer" and layer.path =3D=
=3D self.workspacedir])
+
+    def is_external_workspace_layer_enabled(self):
+        """Returns true if a workspace layer (that wasn't installed by sel=
ftest) is enabled in bblayers.conf"""
+        return any([layer for layer in self._read_bblayers() if
+                    layer.layer =3D=3D "workspacelayer" and layer.path !=
=3D self.workspacedir])
+
+    def _read_bblayers(self) -> List[BBLayerConfEntry]:
+        """Call bitbake-layers show-layers and return list of layers"""
+        ret =3D []
+        for line in runCmd('bitbake-layers show-layers').output.splitlines=
():
+            line =3D line.strip()
+            if match :=3D re.match(r'^(\S+) +([^\n]*?) +(\d+)$', line):
+                ret.append(BBLayerConfEntry(match[1], match[2], match[3]))
+        return ret
+
     def _check_src_repo(self, repo_dir):
         """Check srctree git repository"""
         self.assertTrue(os.path.isdir(os.path.join(repo_dir, '.git')),
@@ -327,8 +357,8 @@ class DevtoolTests(DevtoolBase):
=20
     def test_create_workspace(self):
         # Check preconditions
-        result =3D runCmd('bitbake-layers show-layers')
-        self.assertTrue('\nworkspace' not in result.output, 'This test can=
not be run with a workspace layer in bblayers.conf')
+        self.assertFalse(self.is_selftest_workspace_layer_enabled(),
+                         "This test cannot be run with the selftest worksp=
ace layer in bblayers.conf")
         # remove conf/devtool.conf to avoid it corrupting tests
         devtoolconf =3D os.path.join(self.builddir, 'conf', 'devtool.conf'=
)
         self.track_for_cleanup(devtoolconf)
--=20
2.34.1


