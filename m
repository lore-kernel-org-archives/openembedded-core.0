Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B891FA374A
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 12:26:20 +0000 (UTC)
Received: from 7.mo582.mail-out.ovh.net (7.mo582.mail-out.ovh.net [46.105.59.196])
 by mx.groups.io with SMTP id smtpd.web10.72122.1726230370686306495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 05:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@syslinbit.com header.s=ovhmo4479509-selector1 header.b=oih3qcNv;
 spf=softfail (domain: syslinbit.com, ip: 46.105.59.196, mailfrom: louis.rannou@syslinbit.com)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.25.233])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4X4tnr6Y3sz1fPS
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 12:26:08 +0000 (UTC)
Received: from ghost-submission-55b549bf7b-8ht7m (unknown [10.110.118.186])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0CF6C1FEC6;
	Fri, 13 Sep 2024 12:26:07 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.105])
	by ghost-submission-55b549bf7b-8ht7m with ESMTPSA
	id +vqiJ18v5GagFgAAqOA+yA
	(envelope-from <louis.rannou@syslinbit.com>); Fri, 13 Sep 2024 12:26:07 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G006b596b6e9-0133-4f78-a4b8-e1259fae0600,
                    94865C1B730620A692ECC6AB10A1A585E2B04293) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
Date: Fri, 13 Sep 2024 14:25:52 +0200
Subject: [PATCH v2] image_qa: fix error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-qa-v2-1-f86ae618ed90@syslinbit.com>
X-B4-Tracking: v=1; b=H4sIAE8v5GYC/1WMQQ6CMBBFr0JmbU2nYiquvIdhAe0gk2jBDmkkp
 He3snP5fv57GwhFJoFrtUGkxMJTKGAOFbixCw9S7AuD0abWDZ7Uu1O2J7LkNGp/gXKcIw382SP
 3tvDIskxx3ZsJf+ufnlChshqNHUj7c93cZJUnh56Xo5te0OacvwNUFGCYAAAA
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726230367; l=2911;
 i=louis.rannou@syslinbit.com; s=20230614; h=from:subject:message-id;
 bh=xHF1LzLJcPhnWdBNDASg0JxnfEif6GnTStfQJdZmFjQ=;
 b=hSY0VCYOgaL43eWQO5mML4edsnWR19yrMXZ2GEm+NR8XP0KW8pILn4aNUBiUPvarvZ2iVp8IT
 aqdQSOj0+RHDuUnUXlUiGuHwYKY8UDLEqUQI0hCzx66uTNSu+MviIU8
X-Developer-Key: i=louis.rannou@syslinbit.com; a=ed25519;
 pk=QLSK64UNeqThVe2CiH917a68zTpexYuA7iXw6WQ0bbI=
X-Ovh-Tracer-Id: 3413728520527863105
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrudejjedghedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfevkeekgeejkeefkeeiheetveefleefveeuudeiudefgfektdfgjeeuueekieenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpgeehrdekuddriedvrdelpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=sHSv29LlaBAhDVVR6xP/F2UzxyONCFknUqBhGo0HXYw=;
 c=relaxed/relaxed; d=syslinbit.com; h=From; s=ovhmo4479509-selector1;
 t=1726230369; v=1;
 b=oih3qcNvwQeRRAJteHA9OAsoE4i/OdeiJTV6m7ejdSxNpYlTtMhfKJ5sX5P6Pkmp4iwrkSe5
 3r0qXOXsw7IzsaqB5YBBTxcnZ97wBuYRcMVyEl7Qft6yugVHBioKACAAHE5ZgVCrrxPjhSF5oFL
 P/j8zoEMgPHr83Q0DCxVgCa+ilBLRpMhGw4bw/HGVP/p7Oxp8uGqo1Kg9xQJ+QJZGxl6zC9pr2j
 P6sh7pm54X0pgbwT26eyJyo5A1D0XFyw/tHqDmDVLdpoNDj9QGLg3M/m09kP3XPfQBj3RM6WRIC
 rC8fv7kaRPPJFRbBMS4FSdQUy6XfctvSWqQMCf2FkUFDQ==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 12:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204481

From: Louis Rannou <louis.rannou@non.se.com>

Make ImageQAFailed inherit BBHandledException so exceptions raised in tests are
catched when the actual test function is executed by bb.utils.better_exec.

Change the do_image_qa tasks so errors are handled with oe.qa.handle_error. Add
some comment to explain this requires to list the test in ERROR_QA or WARN_QA.

[YOCTO #14807]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14807

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20240913-qa-v1-1-70127fe0d549@syslinbit.com
---
 meta/classes-recipe/image.bbclass | 11 ++++++-----
 meta/lib/oe/utils.py              |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 32bafcdbbc..834ae03f3c 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -329,23 +329,24 @@ addtask do_image_complete_setscene
 #
 # The functions should use ${IMAGE_ROOTFS} to find the unpacked rootfs
 # directory, which if QA passes will be the basis for the images.
+#
+# The functions should use oe.utils.ImageQAFailed(description, name) to raise
+# errors. The name must be listed in ERROR_QA or WARN_QA to prompt.
 fakeroot python do_image_qa () {
     from oe.utils import ImageQAFailed
 
     qa_cmds = (d.getVar('IMAGE_QA_COMMANDS') or '').split()
-    qamsg = ""
 
     for cmd in qa_cmds:
         try:
             bb.build.exec_func(cmd, d)
         except oe.utils.ImageQAFailed as e:
-            qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (e.name, e.description)
+            qamsg = 'Image QA function %s failed: %s\n' % (e.name, e.description)
+            oe.qa.handle_error(e.name, qamsg, d)
         except Exception as e:
             qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (cmd, e)
 
-    if qamsg:
-        imgname = d.getVar('IMAGE_NAME')
-        bb.fatal("QA errors found whilst validating image: %s\n%s" % (imgname, qamsg))
+    oe.qa.exit_if_errors(d)
 }
 addtask do_image_qa after do_rootfs before do_image
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 14a7d07ef0..83f1440887 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -482,7 +482,7 @@ def get_multilib_datastore(variant, d):
         localdata.setVar("MLPREFIX", "")
     return localdata
 
-class ImageQAFailed(Exception):
+class ImageQAFailed(bb.BBHandledException):
     def __init__(self, description, name=None, logfile=None):
         self.description = description
         self.name = name

---
base-commit: b6af956fe6e876957a49d4abf425e8c789bf0459
change-id: 20240913-qa-7bee7ec010d8

Best regards,
-- 
Louis Rannou <louis.rannou@syslinbit.com>


