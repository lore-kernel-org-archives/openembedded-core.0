Return-Path: <pistora.tobias@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF40C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 09:21:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.96576.1755076871855532672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 02:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=excTmSe7;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: pistora.tobias@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b8de193b60so3598139f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 02:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755076870; x=1755681670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5AoSa8zVEqYKCSSNjM1+tP3z+EX3W4FjCCnr1jiRKI=;
        b=excTmSe7YKnkmSMpTEZH3UB8+9br+22V8dA9c7B8/HZh/wqYePDXfsk4gFf7f1OUQx
         v4kt8fYEFHHidiz/k1IJ86fQyCHEplSp8lnOw1y9heMpU9IZpqeS4e8K3UCXxnAt9H1b
         FiC8woLwi7r7STV1nrhMNBIMHKgfNGI7g9Rdhhpuq8TmhqXJJ52x+Ug6ysJPxrchAr1a
         on/hbLMu6Ml389znc/wsMJ8NXlSBX0hlpgPAzysfAi/9JgW8CxHonrL08Lrw7B5+lq66
         OMTmUrNo0NuZApXL0RfdrlvhDWDeGcCUwOq7LhlXdbTaaueO5DhaBmc9Ip2IEaRIV7ZS
         02oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755076870; x=1755681670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5AoSa8zVEqYKCSSNjM1+tP3z+EX3W4FjCCnr1jiRKI=;
        b=liXfD7C0Y/K1tErLTrsalsl+G9AMAFm1Ts1wIYTA+cq16HTVKX925tJp/EaDy9ktIp
         7bD2OYjv5njhPGBde1QkCyETLbUhHnSXQBrvksQOfI9Mb3lbvSl3YRhu7HjBjURRRs6e
         I5cBSAPc6Vr9aejIpBV1aab+M3/aTYzKore7E7LQ8ElIKnxDL/Z02oiWGQpeum0r7GzD
         5xBvFCklUpM05Lz2ahuW+ist70Gn409cCPY5R1PnvN3Bo+PuOb/wi1/sL9xl91v6pQ1/
         RSqPRFgcW72r5zihVDCftCSZIMpyFwpYXMuU7QxenSFpxQ7vYiR/DL+kJuvLGkbcJugl
         U8KQ==
X-Gm-Message-State: AOJu0Yw8DQ+ucfw8hpF38ixhsY7xmJt561Dft1aakclsS/4yiD1kk/Zf
	kKwgw49AkhLOJ4GKed1n2rtP6+c4o0evd8/zmMSz3Ugeb5yNlLBmAg3DKXJU6gW3
X-Gm-Gg: ASbGncuStx6YnhPHgFgXrYRXAmDJjNMDv4ZPP/A3XSwLEA7RpEqYikseElo+QCk0KRd
	S2FyWulzajgJpwqy8Lf/h3uZpz3gld6CMAXamlk5XRiGzKy1xc802lMRcCWSALVXtpYpivsLzTL
	kwGkuX2spTqoAleOfj8s1NuUoqAvFb4bLbHYhj/UODYjbRQ/vEEQUe1xapAGGpDu24pRVZCEVwy
	Tl15Q1ATZjDXkYGNYMgYKCl2aG/LsPWaytfH2Dvvnf492bSJW+n4WqvL7cfHCjervUMANFMV/te
	VuVLRdGhvA6PZtyEE9JvP71ey/Ao2I7HO0tt5MtNhGSEEFcpIzG7SHaNBLphE0b1ts12EEydPkR
	gWWzX+vHOlB6Bo0VXYJAcrU8YY/QAUA797NFox0lWz7ejZtM178IR6gZxVNqw8zCATAan1NAIXQ
	==
X-Google-Smtp-Source: AGHT+IG7NaO/x4HG8UdYY8AWwUtiYtlewXufpQur6/iTch5DBKFzBJHy/xyZ/eDeL7eJEJYVbm5wAw==
X-Received: by 2002:a05:6000:3106:b0:3b7:96e8:7596 with SMTP id ffacd0b85a97d-3b917ed5b3amr1489959f8f.57.1755076870069;
        Wed, 13 Aug 2025 02:21:10 -0700 (PDT)
Received: from debian-workstation-pto.wien.schrack-seconet.com ([81.223.165.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453328sm49440914f8f.46.2025.08.13.02.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 02:21:09 -0700 (PDT)
From: Tobias Pistora <pistora.tobias@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tobias Pistora <pistora.tobias@gmail.com>
Subject: [PATCH v2 2/2] selftest/devtool: add devtool upgrade selftest for recipes with git submodules
Date: Wed, 13 Aug 2025 11:20:42 +0200
Message-Id: <20250813092042.247966-3-pistora.tobias@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250813092042.247966-1-pistora.tobias@gmail.com>
References: <20250813092042.247966-1-pistora.tobias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 09:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221797

Tests [YOCTO #15943]

Move code from test_devtool_upgrade_git() into separate, local function.
Add a test_devtool_upgrade_gitsm() selftest for devtool.
Add recipes for testing gitsm components.

Signed-off-by: Tobias Pistora <pistora.tobias@gmail.com>
---
changes in v2:
- this patch was added in v2

 .../devtool/devtool-upgrade-test5_git.bb      | 32 +++++++++++++++++++
 .../devtool-upgrade-test5_git.bb.upgraded     | 31 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/devtool.py       | 10 ++++--
 3 files changed, 70 insertions(+), 3 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb
new file mode 100644
index 0000000000..7e8b001a28
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Test recipe for fetching git submodules"
+HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/git-submodule-test/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+# Note: this is intentionally not the latest version in the original .bb
+SRCREV = "132fea6e4dee56b61bcf5721c94e8b2445c6a017"
+PV = "0.1+git"
+PR = "r2"
+
+SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
+UPSTREAM_CHECK_COMMITS = "1"
+RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
+
+EXCLUDE_FROM_WORLD = "1"
+
+do_test_git_as_user() {
+    cd ${S}
+    git status
+    git submodule status
+}
+addtask test_git_as_user after do_unpack
+
+fakeroot do_test_git_as_root() {
+    cd ${S}
+    git status
+    git submodule status
+}
+do_test_git_as_root[depends] += "virtual/fakeroot-native:do_populate_sysroot"
+addtask test_git_as_root after do_unpack
\ No newline at end of file
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded
new file mode 100644
index 0000000000..938c46b016
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded
@@ -0,0 +1,31 @@
+SUMMARY = "Test recipe for fetching git submodules"
+HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/git-submodule-test/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+# Note: this is intentionally not the latest version in the original .bb
+SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
+PV = "0.1+git"
+
+SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
+UPSTREAM_CHECK_COMMITS = "1"
+RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
+
+EXCLUDE_FROM_WORLD = "1"
+
+do_test_git_as_user() {
+    cd ${S}
+    git status
+    git submodule status
+}
+addtask test_git_as_user after do_unpack
+
+fakeroot do_test_git_as_root() {
+    cd ${S}
+    git status
+    git submodule status
+}
+do_test_git_as_root[depends] += "virtual/fakeroot-native:do_populate_sysroot"
+addtask test_git_as_root after do_unpack
\ No newline at end of file
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 580c567be3..19a205912b 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1958,13 +1958,11 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertNotIn(recipe, result.output)
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after resetting')
 
-    def test_devtool_upgrade_git(self):
+    def _test_devtool_upgrade_git_by_recipe(self, recipe, commit):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        recipe = 'devtool-upgrade-test2'
-        commit = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
         oldrecipefile = get_bb_var('FILE', recipe)
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -1994,6 +1992,12 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertNotIn(recipe, result.output)
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after resetting')
 
+    def test_devtool_upgrade_git(self):
+        self._test_devtool_upgrade_git_by_recipe('devtool-upgrade-test2', '6cc6077a36fe2648a5f993fe7c16c9632f946517')
+
+    def test_devtool_upgrade_gitsm(self):
+        self._test_devtool_upgrade_git_by_recipe('devtool-upgrade-test5', 'a2885dd7d25380d23627e7544b7bbb55014b16ee')
+
     def test_devtool_upgrade_drop_md5sum(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
-- 
2.39.5


