Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BE6E6FE56
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:19 +0000 (UTC)
Received: from 9.mo576.mail-out.ovh.net (9.mo576.mail-out.ovh.net [46.105.56.78])
 by mx.groups.io with SMTP id smtpd.web10.23280.1695394097376521075
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.56.78, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.138.16])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 84BBB24D50
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:15 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3B2F01FE65;
	Fri, 22 Sep 2023 14:48:15 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id CB0jDS+pDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:48:15 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G0011fdadd9d-41e1-44fc-9785-c25343a875d0,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH 16/17] qa: Add selftest for python3-spdx-tools
Date: Fri, 22 Sep 2023 14:46:28 +0000
Message-Id: <20230922144628.2495839-17-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12190962717507520777
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeeuleehleehhfeljeeifeetheekieeukeduheejieejgeehtedvjefhvdfgieetudenucffohhmrghinhepshgvlhhfthgvshhtrdgtrghsvgenucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188119

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/spdx.py

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
new file mode 100644
index 0000000000..05fc4e390b
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -0,0 +1,54 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import json
+import os
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, runCmd
+
+class SPDXCheck(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super(SPDXCheck, cls).setUpClass()
+        bitbake("python3-spdx-tools-native")
+        bitbake("-c addto_recipe_sysroot python3-spdx-tools-native")
+
+    def check_recipe_spdx(self, high_level_dir, spdx_file, target_name):
+        config =3D """
+INHERIT +=3D "create-spdx"
+"""
+        self.write_config(config)
+
+        deploy_dir =3D get_bb_var("DEPLOY_DIR")
+        machine_var =3D get_bb_var("MACHINE")
+        # qemux86-64 creates the directory qemux86_64
+        machine_dir =3D machine_var.replace("-", "_")
+
+        full_file_path =3D os.path.join(deploy_dir, "spdx", machine_dir,=
 high_level_dir, spdx_file)
+
+        try:
+            os.remove(full_file_path)
+        except FileNotFoundError:
+            pass
+
+        bitbake("%s -c create_spdx" % target_name)
+
+        def check_spdx_json(filename):
+            with open(filename) as f:
+                report =3D json.load(f)
+                self.assertNotEqual(report, None)
+                self.assertNotEqual(report["SPDXID"], None)
+
+            python =3D os.path.join(get_bb_var('STAGING_BINDIR', 'python=
3-spdx-tools-native'), 'nativepython3')
+            validator =3D os.path.join(get_bb_var('STAGING_BINDIR', 'pyt=
hon3-spdx-tools-native'), 'pyspdxtools')
+            result =3D runCmd("{} {} -i {}".format(python, validator, fi=
lename))
+
+        self.assertExists(full_file_path)
+        result =3D check_spdx_json(full_file_path)
+
+    def test_spdx_base_files(self):
+        self.check_recipe_spdx("packages", "base-files.spdx.json", "base=
-files")
--=20
2.34.1


