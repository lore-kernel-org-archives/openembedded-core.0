Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5F7C4332F
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.701.1648751359429613184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDB4215BF
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FA503F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/23] oeqa/selftest/wic: use os.rename instead of
 bb.utils.rename
Date: Thu, 31 Mar 2022 19:28:56 +0100
Message-Id: <20220331182915.22128-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163845

bb.utils.rename() only exists to handle moves across filesystems. As
these moves are within the same directory we can just use os.rename().

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index 6f3dc277439..673942fc9cc 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1416,8 +1416,8 @@ class Wic2(WicTestCase):
             result =3D runCmd("%s/usr/sbin/sfdisk -F %s" % (sysroot, new=
_image_path))
             self.assertTrue("0 B, 0 bytes, 0 sectors" in result.output)
=20
-            bb.utils.rename(image_path, image_path + '.bak')
-            bb.utils.rename(new_image_path, image_path)
+            os.rename(image_path, image_path + '.bak')
+            os.rename(new_image_path, image_path)
=20
             # Check if it boots in qemu
             with runqemu('core-image-minimal', ssh=3DFalse, runqemuparam=
s=3D'nographic') as qemu:
@@ -1428,7 +1428,8 @@ class Wic2(WicTestCase):
             if os.path.exists(new_image_path):
                 os.unlink(new_image_path)
             if os.path.exists(image_path + '.bak'):
-                bb.utils.rename(image_path + '.bak', image_path)
+                os.rename(image_path + '.bak', image_path)
+
=20
     def test_wic_ls_ext(self):
         """Test listing content of the ext partition using 'wic ls'"""
--=20
2.25.1


