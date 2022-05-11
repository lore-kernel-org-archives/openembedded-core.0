Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04ECAC433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:57:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6480.1652237869110482622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=XFzJFuoG;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237869; x=1683773869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SvihIhAnIzEpnhhmc0tN3pbQbHTL4rB163G5NCeQR4I=;
  b=XFzJFuoG+qKUJjKhVgyd9TFqTFU+9nGdE712H4W0jPKt8xO1m2CAwpsV
   /ro/rN+6nUnOIAeaswLQonrycBMIWHdtKGFVPAuaWEzHHVWE5Vmot7W2b
   3aNFhaQ8RPF3tRtlsiqLxBCLuSw1D7UDSBomNHvgIY6lmeJH5Fu5dq/F0
   yGGxUlLdZczOcQQOj4tkMNQuqK4s2ozufu8eUfwuQrXinxH++zbIEAwq5
   7aIVF9zrdIcewBi7y0G5RFKmrJPyWSl+FBT2+7yaiY7RxKOBDXtiGJ74o
   y8D77iKzO42S5QEyJn2392RIS2ilWH44IzsFGiVbR92cMYUBUARVv0vvP
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106023"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106023"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754730"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:47 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 06/17] oeqa/selftest: add test for git working
 correctly inside pseudo
Date: Wed, 11 May 2022 10:57:21 +0800
Message-Id: 
 <c1b43595a023e481daeb6005c431f51897aeb45d.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:57:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165474

From: Ross Burton <ross.burton@arm.com>

The fix for CVE-2022-24765 in git[1] breaks any use of git inside
pseudo. Add a simple test case to oe-selftest to verify that at least
basic uses of git work fine under pseudo.

[1] https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7d9

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 46822268040a23dbb81f71fe35aee8c2663a31f6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../git-submodule-test/git-submodule-test.bb      | 15 +++++++++++++++
 meta/lib/oeqa/selftest/cases/git.py               | 15 +++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/git.py

diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
index cc5d7eae5a..fa3041b7d8 100644
--- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -7,3 +7,18 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
 SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
+
+S = "${WORKDIR}/git"
+
+do_test_git_as_user() {
+    cd ${S}
+    git status
+}
+addtask test_git_as_user after do_unpack
+
+fakeroot do_test_git_as_root() {
+    cd ${S}
+    git status
+}
+do_test_git_as_root[depends] += "virtual/fakeroot-native:do_populate_sysroot"
+addtask test_git_as_root after do_unpack
diff --git a/meta/lib/oeqa/selftest/cases/git.py b/meta/lib/oeqa/selftest/cases/git.py
new file mode 100644
index 0000000000..f12874dc7d
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/git.py
@@ -0,0 +1,15 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+
+class GitCheck(OESelftestTestCase):
+    def test_git_intercept(self):
+        """
+        Git binaries with CVE-2022-24765 fixed will refuse to operate on a
+        repository which is owned by a different user. This breaks our
+        do_install task as that runs inside pseudo, so the git repository is
+        owned by the build user but git is running as (fake)root.
+
+        We have an intercept which disables pseudo, so verify that it works.
+        """
+        bitbake("git-submodule-test -c test_git_as_user")
+        bitbake("git-submodule-test -c test_git_as_root")
-- 
2.35.3


