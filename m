Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C742C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 15:04:23 +0000 (UTC)
Received: from 6.mo560.mail-out.ovh.net (6.mo560.mail-out.ovh.net [87.98.165.38])
 by mx.groups.io with SMTP id smtpd.web11.15615.1741273462032456277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 07:04:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@syslinbit.com header.s=ovhmo4479509-selector1 header.b=PPBmK7TE;
 spf=softfail (domain: syslinbit.com, ip: 87.98.165.38, mailfrom: louis.rannou@syslinbit.com)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.139.16])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4Z7t4374M1z1kgf
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Mar 2025 15:04:19 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-pd8mf (unknown [10.110.96.204])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 58AF11FDFA;
	Thu,  6 Mar 2025 15:04:18 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.103])
	by ghost-submission-5b5ff79f4f-pd8mf with ESMTPSA
	id Kte/AXK5yWctOAAAGl+Jkg
	(envelope-from <louis.rannou@syslinbit.com>); Thu, 06 Mar 2025 15:04:18 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-103G00548bfc24c-91b7-48b4-b5f9-ff18d6a6aca5,
                    7CE1C105418CFD9A00BD5A96F06F38342565C543) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
Date: Thu, 06 Mar 2025 16:03:40 +0100
Subject: [PATCH] classes/kernel: add QA to check required or forbidden
 kernel configs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-qa_kernel-v1-1-e83431c29799@syslinbit.com>
X-B4-Tracking: v=1; b=H4sIAEy5yWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwMz3cLE+OzUorzUHF0DM8NEY/NUY0OzZBMloPqCotS0zAqwWdGxtbU
 AltWqSlsAAAA=
X-Change-ID: 20250306-qa_kernel-061a37e316c4
To: openembedded-core@lists.openembedded.org
Cc: pascal.eberhard@se.com, bruce.ashfield@gmail.com, 
 Louis Rannou <louis.rannou@non.se.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741273458; l=2525;
 i=louis.rannou@syslinbit.com; s=20230614; h=from:subject:message-id;
 bh=CJOXWKiruI/Atns+yePGk1KVLJN2zb/2tfOVvZhRZA0=;
 b=tBNRe8JdofTWGtPnMBLypmtnqyTZWmm3Bn4T3y3wWv7vud+LIFJj3wnmPBr1zS30vEKDESkbS
 G3Na3rChE/fBfzNLsdYglkrg45fWqpLpuusgQETsMEw07r3ptHecfa7
X-Developer-Key: i=louis.rannou@syslinbit.com; a=ed25519;
 pk=QLSK64UNeqThVe2CiH917a68zTpexYuA7iXw6WQ0bbI=
X-Ovh-Tracer-Id: 13363024521208323409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdektdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpeehteekvdfgkefhkefhheehueekvdegffevtddtfffhhfejgeehgfekgedvkeekvdenucfkphepuddvjedrtddrtddruddpgeehrdekuddriedvrdelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheeitdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=LkMgERiKZdiY8/riWtTKjrjqgeRITHtPvh06JXD6vbo=;
 c=relaxed/relaxed; d=syslinbit.com; h=From; s=ovhmo4479509-selector1;
 t=1741273460; v=1;
 b=PPBmK7TEPH07ImSkxtVrihgysAnd/i0POOtP85luAoH59xvpXHeKv9h6ruIphtHBaSEZEcLv
 LM2j4ueq0kTwJegm+C8RcgocchgxxCvOMjZYpifeiHfEQrvoGXCISbsuriOaBAGlVpxc9MpbzsB
 vZ9aEtjsv1lhRdK0+JUdnop0gG2fEozQMahNGIEXQ0G4H+Kj/o1rL3hz/lBOtiZ46kG0lPBr8Uv
 kPs6djizY7U1BnoBsEm2poRjKs2UPjnqRlKL9fHKVfVFp7gYdY0dUWMelU0uG5chCnSQxcufU3i
 Em8LVDxv3LGTl0cpbZVsUw5kcTzcoXrLrEEhAk5tgGL3w==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 15:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212394

From: Louis Rannou <louis.rannou@non.se.com>

Add a QARECIPETEST kernel-config to the kernel to check the kernel config has
set (or unset) config listed in variables QA_KERNEL_CONFIGS_REQUIRED (or
QA_KERNEL_CONFIGS_FORBIDDEN).

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 meta/classes-recipe/kernel.bbclass | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 64a685a964dab942db05b8d9e08cc22a3bbb152e..4a82b84d479667bf4a6e64ad3e99d934c6868b98 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -867,3 +867,41 @@ EXPORT_FUNCTIONS do_deploy
 
 # Add using Device Tree support
 inherit kernel-devicetree
+
+
+# Add QA test to check some required/forbidden kernel configs are set or not.
+QA_KERNEL_CONFIGS_REQUIRED ??= ""
+QA_KERNEL_CONFIGS_FORBIDDEN ??= ""
+
+WARN_QA:append = " kernel-config"
+
+QARECIPETEST[kernel-config] = "package_qa_check_kernel_config"
+def package_qa_check_kernel_config(pn, d):
+    from pathlib import Path
+    import re
+
+    config_path = Path(d.getVar("B"), ".config")
+    if not config_path.exists():
+        oe.qa.handle_error("kernel-config",
+                           "Kernel configs have not been checked "\
+                           "as the kernel .config is not found: "\
+                           "%s." % config_path)
+        return
+
+    config_list = {}
+    with config_path.open('r') as f_config:
+        for line in f_config.read().splitlines():
+            configset = re.match(r'# (\w+) is not set|(\w+)=([ymn])', line)
+            if configset is not None:
+                if configset.group(1) is not None:
+                    config_list[configset.group(1)] = "n"
+                else:
+                    config_list[configset.group(2)] = configset.group(3)
+
+    for conf in d.getVar("QA_KERNEL_CONFIGS_REQUIRED").split():
+        if conf not in config_list or config_list[conf] == "n":
+            oe.qa.handle_error("kernel-config", "Kernel config is required: %s" % conf, d)
+
+    for conf in d.getVar("QA_KERNEL_CONFIGS_FORBIDDEN").split():
+        if conf in config_list and config_list[conf] in "ym":
+            oe.qa.handle_error("kernel-config", "Kernel config is forbidden: %s" % conf, d)

---
base-commit: b72823fc09674f78ad452250f453f6e47d9444de
change-id: 20250306-qa_kernel-061a37e316c4

Best regards,
-- 
Louis Rannou <louis.rannou@syslinbit.com>


